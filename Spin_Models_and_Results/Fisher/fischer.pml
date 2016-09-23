#define num_process 165
#define delta1 1
#define delta2 2
#define max_bound num_process 

byte random_timeout ;
byte lock ;
byte in_critical;

mtype = { critical , trying , waiting , sleeping } ;

typedef Node
{
	mtype pc ;
	byte time_out ;
}

Node node[num_process] ;


inline bounded_random_time ( start,  end )
{
 	random_timeout = start + 1;
	do
	:: random_timeout > start  && random_timeout < end ->
		random_timeout++;
	:: random_timeout == end  ->
		break ;
	:: break;
	od ;
}

inline unbounded_random_time(start)
{
	random_timeout = start + 1;
	do
	:: random_timeout ++;
	:: break;
	od;
}

proctype process( byte nodeId )
{
	bounded_random_time ( 0, max_bound ) ;
	node[nodeId].time_out = random_timeout ;
	do
	::  node[nodeId].pc == sleeping && node[nodeId].time_out == 0  ->
	atomic
	{
		if
		:: lock == num_process  ->
			node[nodeId].pc = waiting ;
			bounded_random_time ( 0 ,  delta1 ) ;
			node[nodeId].time_out = random_timeout ;
		:: else ->
			bounded_random_time ( 0, max_bound ); 
			node[nodeId].time_out = random_timeout ;
		fi ;
	}
	::  node[nodeId].pc == waiting && node[nodeId].time_out == 0 ->
	atomic
	{
		lock = nodeId ;
	  	node[nodeId].pc = trying ;
	    	bounded_random_time ( delta2 - 1, delta2 - 1 + max_bound ) ;
	    	node[nodeId].time_out = random_timeout ;	
	}
	::  node[nodeId].pc == trying && node[nodeId].time_out ==  0 ->
	atomic
	{
		if                     
	 	:: lock == nodeId  ->
			node[nodeId].pc=critical;		
			in_critical ++;
		:: lock != nodeId ->
			node[nodeId].pc = sleeping ;
		:: else ->
		fi;
		bounded_random_time ( 0, max_bound ) ; 
		node[nodeId].time_out = random_timeout ;
	}
	:: node[nodeId].pc == critical && node[nodeId].time_out == 0  ->
	atomic
	{
		node[nodeId].pc = sleeping ;
		lock = num_process ;
		in_critical --;
		bounded_random_time ( 0, max_bound ) ;
		node[nodeId].time_out = random_timeout ;
	}
	od ;
}

proctype time_progress ()
{
	byte count ;
                   byte min_timeout;
	do
	:: timeout ->
	atomic
	{
		min_timeout = node[0].time_out;
		count = 1;
		do 
		:: count < num_process ->	      
	 	     	if 
	  	    	:: min_timeout > node[count].time_out -> 
				min_timeout = node[count].time_out ;
	 	    	 :: else ->
	 	     	fi ;
			count ++;
		:: count == num_process  ->
			break ;
 	 	od;
                                     count = 0;
 		do
		:: count < num_process ->
			node[count].time_out = node[count].time_out - min_timeout;
			count ++;
		:: count == num_process ->
			break;
		od;
	}	
	od
}

/*
never
{
	skip ->
	do
	:: in_critical > 1 -> assert(0);
	:: else ->
	od
}


never{
       do
       :: in_critical > 1 -> break; 
       :: else -> 
       od
}
*/

init
{
	byte i;
	atomic
	{
		in_critical = 0;
		lock = num_process;
		run time_progress() ;
		do	
		:: i < num_process ->
			node[i].pc = sleeping ;
			run process(i) ;
			i++ ;
		:: i == num_process ->
			break;
		od ;
	}
}
