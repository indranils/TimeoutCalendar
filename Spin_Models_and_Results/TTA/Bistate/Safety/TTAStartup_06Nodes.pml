#define num_node 6

#define p1	pc[0] == state_active
#define p2	pc[1] == state_active
#define p3	pc[2] == state_active
#define p4	pc[3] == state_active
#define p5	pc[4] == state_active
#define p6	pc[5] == state_active
#define q1	time_out[0] > 0
#define q2	time_out[1] > 0
#define q3	time_out[2] > 0
#define q4	time_out[3] > 0
#define q5	time_out[4] > 0
#define q6	time_out[5] > 0

#define pp (p1 && p2 && p3 && p4 && p5 && p6)
#define qq (q1 && q2 && q3 && q4 && q5 && q6)

#define r (time_out[0] == time_out[1] == time_out[2] == time_out[3] == time_out[4] == time_out[5])  
#define s (slot[0] == slot[1] == slot[2] == slot[3] == slot[4] == slot[5]) 

#define slot_time 3
#define inf 10000

#define max_init_time num_node + 1
#define TRUE 1
#define FALSE 0

byte propagation_delay  = 1 ;
byte round_time = slot_time * num_node ;
byte tau_startup , tau_listen , tau_coldstart ;

bool empty_cal , event_pending, i_frame , cs_frame, time_can_advance ;
byte frame_origin, increment , slot[num_node];
byte event_time ,  first_event ,  min_timeout , random_timeout ,time_out[num_node] ;

mtype  =  { cs_frame , i_frame , state_init , state_listen , state_coldstart , state_active } ;
mtype pc[num_node] ;

typedef calender 	{
		bool flag[num_node] ;
		mtype msg ;
		byte origin ;
		byte send , delivery ;
		} 

calender cal ;	

inline make_cal_empty ()
{
	byte i2;
	i2 = 0;
	do
	:: ( i2 == num_node  ) ->
		break ;
	:: else ->
		cal.flag[i2] = 0 ;
		i2 ++ ;
	od ;
	cal.msg = i_frame ;
	cal.origin = 0 ;
	cal.send = 0 ;
	cal.delivery = 0 ;

}

inline is_empty_cal ( )
{
	byte i5 ;
	i5 = 0;
	do
	:: i5 == num_node ->
		empty_cal = TRUE ;
		break ;
	:: i5 != num_node ->
		if
		:: ( cal.flag[i5] == TRUE ) ->
			empty_cal = FALSE ;
			break 
		:: else ->
			i5 ++ ;
		fi ;
	od ;
}

inline is_event_pending (  i )
{
	event_pending = cal.flag[i] ;
}

inline is_i_frame_pending ( i )
{
	if
	:: ( cal.flag[i]  &&  cal.msg == i_frame ) ->
		i_frame_pending = TRUE ;
	:: else ->
		i_frame_pending = FALSE ;
	fi 
}


inline is_cs_frame_pending ( i )
{
	if
	:: ( cal.flag[i]  &&  cal.msg == cs_frame ) ->
		cs_frame_pending = TRUE ;
	:: else ->
		cs_frame_pending = FALSE ;
	fi 
}

inline is_i_frame ( )
{
	is_empty_cal ( ) ;
	if
	:: ( isempty_cal == FALSE  &&  cal.msg == i_frame ) ->
		   i_frame = TRUE ;
	:: else ->
 		  i_frame = FALSE 
	fi
}

inline is_cs_frame ( )
{
	is_empty_cal ( ) ;
	if
	:: ( empty_cal == FALSE  &&  cal.msg == cs_frame ) ->
		   cs_frame = TRUE ;
	:: else ->
 		  cs_frame = FALSE 
	fi
}

inline find_frame_origin ( )
{
	frame_origin = cal.origin ;
}

inline consume_event ( i )
{
	cal.flag[i] = FALSE ;
}

inline find_tau_startup ( i )
{
	tau_startup = slot_time * i  ;
}

inline find_tau_listen ( i )
{
	find_tau_startup ( i ) ;
	tau_listen =  2 * round_time + tau_startup ;
}

inline find_tau_coldstart ( i )
{
	find_tau_startup ( i ) ;
	tau_coldstart = round_time + tau_startup ;
}

inline bcast ( m , i  )
{
	byte j ;

	atomic	{
		is_empty_cal ( ) ;
		if
		:: ( empty_cal == TRUE ) ->
			cal.msg = m ;
			cal.origin = i ;
			cal.send = 0 ;
			cal.delivery = propagation_delay ;
                                                        j = 0;
			do
			:: ( j == num_node ) ->
				break ;
			:: else ->
				if
				:: ( j != i ) ->
					cal.flag[j] = TRUE ;
					j ++ ;
				:: else ->
					cal.flag[j] = FALSE ;
					j ++ ;
				fi ;
			od ;
		:: else ->
			do
			:: ( j == num_node ) ->
				break ;
			:: else ->
				cal.flag[j] = FALSE ;
				j ++ ;
			od ; 
		fi ;
		}
}

inline find_event_time ( i )
{
	event_time = cal.delivery ;
}

inline find_first_event ()
{
	first_event = cal.delivery ;
}

inline make_increment  ( i )
{
	if
	:: i == num_node - 1 ->
		increment = 0 ;
	:: else ->
		increment = i + 1 ;
	fi
}

inline generate_random_timeout ( start,  end )
{
 	random_timeout = start ;
	do
	:: ( random_timeout >= start  && random_timeout < end ) ->
		random_timeout++;
	:: ( random_timeout  == end ) ->
		break ;
	:: break;
	od ;
}

inline find_min_timeout ( )
{
	byte i1 ;
	min_timeout = time_out[0] ;
	i1 = 1;
	do
	:: ( i1 == num_node ) ->
		break ;
	:: else ->
		if
		:: ( min_timeout > time_out[i1] ) ->
			min_timeout = time_out[i1];
			i1 ++ ;
		:: else ->
			i1 ++ ;
		fi ;
 	od ;
}

inline can_time_advance ()
{
	atomic	{
		is_empty_cal () ;
		if
		:: empty_cal ->
			find_min_timeout ();
			if
			:: ( min_timeout > 0 ) ->
				time_can_advance = TRUE ;
			:: else ->
				time_can_advance = FALSE ;
			fi ;
		:: else ->
			find_min_timeout ( ) ;
			find_first_event( ) ;
			if
			:: min_timeout > 0 && first_event > 0 && first_event != inf  ->
				time_can_advance = TRUE ;
			:: min_timeout == 0 || first_event == 0 ->
				time_can_advance = FALSE ;
			fi ;
		fi ;
		}
}

proctype time_advance ( )
{
	byte count ;
	do
	:: timeout -> 
		can_time_advance ( ) ;
		if
		::  time_can_advance ->
			atomic	{
				is_empty_cal ( ) ;
				find_min_timeout ( ) ;
				if
				:: empty_cal ->
					count = 0;
					do
					:: count < num_node ->
						time_out[count] = time_out[count] - min_timeout;
						count ++;
					:: count == num_node ->
						break;
					od;
				:: else ->
					find_first_event ( ) ;
					if
					:: ( first_event <= min_timeout ) ->
						count = 0;
						do
						:: count < num_node ->
							time_out[count] = time_out[count] - first_event;
							count ++;
						:: count == num_node ->
							break;
						od;
						cal.delivery = 0;
						event_time = 0;  
					:: else ->
						count = 0;
						do
						:: count < num_node ->
							time_out[count] = time_out[count] - min_timeout;
							count ++;
						:: count == num_node ->
							break;
						od;
						cal.delivery = cal.delivery - min_timeout;
					fi ;
				fi ;
				}
		:: else ->	
		fi ;
	od ;
}

proctype node( int i )
{
	do 
	:: pc[i] == state_init ->
	atomic {
		if
		:: cal.flag[i] == 0 && time_out[i] == 0 ->
	
			pc[i] = state_listen ;
			find_tau_listen( i ) ;
			time_out[i] = tau_listen ;
	
		:: cal.flag[i] && cal.delivery == 0 ->
	
		   	consume_event ( i ) ;
			event_pending = 0;	
		fi ;
	}
	:: pc[i] == state_listen ->
	atomic {
		if
		:: !(cal.flag[i] && cal.delivery == 0) && time_out[i] == 0 ->
			
			pc[i] = state_coldstart ;
			find_tau_coldstart ( i ) ;
			time_out[i] = tau_coldstart ;
			bcast ( cs_frame , i ) ;
		
		:: (cal.flag[i] == 1  && cal.msg == cs_frame ) &&  cal.delivery == 0 ->
		
			pc[i] = state_coldstart ;
			find_tau_coldstart ( i ) ;
			time_out[i] = tau_coldstart - propagation_delay ;
			consume_event ( i ) ;
		
		:: ( cal.flag[i]  &&  cal.msg == i_frame ) && cal.delivery == 0 ->	
			pc[i] = state_active ;
			time_out[i] = slot_time - propagation_delay ;
			find_frame_origin() ;
			slot [i] = frame_origin ;
			consume_event ( i ) ;
		fi;
	}
	:: pc[i] ==  state_coldstart  ->
	atomic {
		if
		:: !( cal.flag[i] && cal.delivery == 0 ) && time_out[i] == 0 ->
		
			find_tau_coldstart ( i ) ;
			time_out[i] = tau_coldstart ;
			bcast ( cs_frame , i ) ;
		
		:: (cal.flag[i]  &&  cal.msg == cs_frame) && cal.delivery == 0 ->
		
			pc[i] = state_active ;
			time_out[i] = slot_time - propagation_delay ;
			find_frame_origin ( ) ;
			slot[i] = frame_origin ;
			consume_event ( i ) ;

		:: ( cal.flag[i]  &&  cal.msg == i_frame ) && cal.delivery == 0 ->
			pc[i] = state_active ;
			time_out[i] = slot_time - propagation_delay ;
			find_frame_origin() ;
			slot [i] = frame_origin ;
			consume_event ( i ) ;
		fi ;
	}
/*	:: (pc[i] == state_listen || pc[i] == state_coldstart) && ( cal.flag[i]  &&  cal.msg == i_frame ) && cal.delivery == 0 ->
	atomic {
		pc[i] = state_active ;
		time_out[i] = slot_time - propagation_delay ;
		find_frame_origin() ;
		slot [i] = frame_origin ;
		consume_event ( i ) ;
	}*/
	:: pc[i] == state_active ->
	atomic {
		if
		:: time_out[i] == 0 ->
	
			make_increment ( slot[i] );  
			slot[i] = increment ;  
			time_out[i] = slot_time;
			if					
			:: increment == i ->
				bcast ( i_frame , i ) ;
			:: else ->
			fi ;
	
		:: cal.flag[i]  &&  (cal.msg == cs_frame || cal.msg == i_frame)  ->
	
			consume_event ( i ) ;
		fi ;
	}
	od ;
}

init
{ 
	byte i  = 0;
	atomic
	{
		do
		:: ( i == num_node ) ->
			break ;
		:: i < num_node ->
			pc[i] = state_init ;
			generate_random_timeout ( 1 , max_init_time - 1 ) ;
			time_out[i] = random_timeout ;
			run node(i);
			i++;
		od ;
		run time_advance();
	}
}

ltl ltl_safety { []((pp && qq) -> <> (r && s)) }