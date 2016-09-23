/* 
For Verifying the following Timed Property
After the train sends approach signal, gate is down in <= 20 time unit
[ ] p
#define p time <=20
*/

#define trange 30
#define inf 10000

#define TRUE 1
#define FALSE 0

mtype = { approach , exit , lower , raise , t0 , t1 , t2 , t3 , g0 , g1 , g2 , g3 , c0 , c1 , c2 , c3 } ;

chan msg1 = [1] of { mtype } ;
chan msg2 = [1] of { mtype } ;

int random_timeout; 
int time_out[3];

mtype t_signal , t_state; 
mtype c_signal , ct_state;
mtype g_signal , g_state;

bool flag1, flag2;
int time;

inline random_time (  start  ,  end  )
{
 	random_timeout = start ;
	do
	:: ( random_timeout >= start && random_timeout < end ) ->
		random_timeout ++ ;
	:: ( random_timeout == end ) ->
		break ;
	:: break ;
	od ;
}

active proctype train()
{
	byte time1;
	t_state = t0; 
                   random_time ( 0, trange);
	time_out[0] = random_timeout;
	do
	:: t_state == t0 && time_out[0] == 0 ->
	atomic  
	{
		t_state = t1;
		random_time( 21, 50 ) ;
		time_out[0] = random_timeout ;
		time1 = time_out[0]; 
		t_signal = approach ;
		msg1 ! t_signal ;
		flag1 = true;
 	}
	:: t_state == t1 && time_out[0] == 0 ->
	atomic  
	{
		t_state = t2 ;
		random_time( 0 ,  50 - time1 ) ;
		time_out[0] = random_timeout ;
		time1 = time1 + time_out[0];
   	}
/*	:: t_state == t2  && time_out[0] == 0 ->
	atomic  
	{
		t_state = t3 ;
		random_time( 0,  50 - time1 ) ;
		time_out[0] = random_timeout ;
	} */
	:: t_state == t2 && time_out[0] == 0 ->
	atomic  
	{
		t_state = t0 ;
		time_out[0] = trange; 
		t_signal = exit ;
		msg1 ! t_signal ;
	}	
	od ;
}

active proctype controller()
{
	mtype msg ;
	ct_state = c0 ;
	time_out[1] = inf;
	do
	:: ct_state == c0 ->
	atomic
	{
		msg1? msg ;
		if
		:: msg == approach ->
			ct_state = c1 ;
		   	time_out[1] = 10 ;
		:: else ->
		fi ;
	}
	:: ct_state == c1 && time_out[1] == 0 ->
	atomic  
	{
		ct_state = c2 ;
		msg2 ! lower ;
		time_out[1] = inf ;
 	}
	:: ct_state == c2  ->
	atomic  
	{
		msg1 ? msg ;
		if
		:: msg == exit ->
			ct_state = c3;
			random_time( 0, 10 ) ;
			time_out[1] = random_timeout ;
		:: else ->
		fi ;
	}
	:: ct_state == c3 && time_out[1] == 0 ->
	atomic  
	{
		ct_state = c0 ;
		msg2 ! raise ;
		time_out[1] = inf ;
	}
	od 
}

active proctype gate ()
{
	mtype msg ;
	g_state = g0 ;
	time_out[2] = inf;
	do
	:: g_state == g0 ->
	atomic   
	{
		msg2  ? msg ; 
		if
		:: msg == lower  ->
			g_state = g1 ;
			 random_time ( 0, 10 );
			time_out[2] = random_timeout;
		:: else ->
		fi ;
	}
	:: g_state == g1 && time_out[2] == 0 ->
	atomic  
	{
		g_state = g2 ;
		time_out[2] = inf ;
		flag2 = true;
		flag1 = false;
	 }
	:: g_state == g2 ->
	atomic  
	{
		msg2 ? msg ; 
		if
		:: msg == raise  ->
			g_state = g3;
			random_time( 10, 20 ) ;
			time_out[2] = random_timeout ;
		:: else ->
		fi ;
	}
	:: g_state == g3 && time_out[2] == 0 ->
	atomic  
	{
		g_state = g0 ;
		time_out[2] = inf;
	}
	od ;
}


active proctype time_progress ()
{
	byte count ;
                   byte min_timeout;
	do
	:: timeout ->
	atomic
	{
		min_timeout = time_out[0];
		count = 1;
		do 
		:: count < 3 ->	      
	 	     	if 
	  	    	:: min_timeout > time_out [count] -> 
				min_timeout = time_out[count] ;
	 	    	 :: else ->
	 	     	fi ;
			count ++;
		:: count == 3  ->
			break ;
 	 	od;
                                     count = 0;
 		do
		:: count < 3 ->
			time_out[count] = time_out[count] - min_timeout;
			count ++;
		:: count == 3 ->
			break;
		od;
		if
		:: flag1 == true ->
			time = time + min_timeout;
		:: flag2 == true ->
			flag2 = false;
			time = 0;
		:: else ->
		fi;
	}	
	od
}

init
{
   	flag1 = false;
	flag2 = false;
	time = 0;
}
