	switch (t->back) {
	default: Uerror("bad return move");
	case  0: goto R999; /* nothing to undo */

		 /* PROC :init: */

	case 3: // STATE 2
		;
		now.lock = trpt->bup.ovals[1];
		in_critical = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 4: // STATE 3
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 5: // STATE 5
		;
		now.node[ Index(((P2 *)this)->i, 165) ].pc = trpt->bup.oval;
		;
		goto R999;

	case 6: // STATE 6
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 7: // STATE 7
		;
		((P2 *)this)->i = trpt->bup.oval;
		;
		goto R999;

	case 8: // STATE 8
		;
	/* 0 */	((P2 *)this)->i = trpt->bup.oval;
		;
		;
		goto R999;

	case 9: // STATE 14
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC time_progress */
;
		;
		
	case 11: // STATE 3
		;
		((P1 *)this)->count = trpt->bup.ovals[1];
		((P1 *)this)->min_timeout = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;
;
		;
		
	case 13: // STATE 10
		;
		((P1 *)this)->count = trpt->bup.ovals[2];
		((P1 *)this)->min_timeout = trpt->bup.ovals[1];
	/* 0 */	((P1 *)this)->min_timeout = trpt->bup.ovals[0];
		;
		;
		ungrab_ints(trpt->bup.ovals, 3);
		goto R999;

	case 14: // STATE 10
		;
		((P1 *)this)->count = trpt->bup.oval;
		;
		goto R999;

	case 15: // STATE 16
		;
		((P1 *)this)->count = trpt->bup.ovals[1];
	/* 0 */	((P1 *)this)->count = trpt->bup.ovals[0];
		;
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 16: // STATE 16
		;
		((P1 *)this)->count = trpt->bup.oval;
		;
		goto R999;

	case 17: // STATE 19
		;
		((P1 *)this)->count = trpt->bup.ovals[1];
		now.node[ Index(((P1 *)this)->count, 165) ].time_out = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 18: // STATE 20
		;
	/* 0 */	((P1 *)this)->count = trpt->bup.oval;
		;
		;
		goto R999;

	case 19: // STATE 29
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC process */

	case 20: // STATE 1
		;
		now.random_timeout = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 22: // STATE 3
		;
		now.random_timeout = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 24: // STATE 11
		;
		now.node[ Index(((P0 *)this)->nodeId, 165) ].time_out = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 26: // STATE 14
		;
		now.node[ Index(((P0 *)this)->nodeId, 165) ].pc = trpt->bup.oval;
		;
		goto R999;

	case 27: // STATE 15
		;
		now.random_timeout = trpt->bup.oval;
		;
		goto R999;

	case 28: // STATE 17
		;
		now.random_timeout = trpt->bup.oval;
		;
		goto R999;

	case 29: // STATE 25
		;
		now.node[ Index(((P0 *)this)->nodeId, 165) ].time_out = trpt->bup.oval;
		;
		goto R999;

	case 30: // STATE 25
		;
		now.node[ Index(((P0 *)this)->nodeId, 165) ].time_out = trpt->bup.oval;
		;
		goto R999;

	case 31: // STATE 25
		;
		now.node[ Index(((P0 *)this)->nodeId, 165) ].time_out = trpt->bup.oval;
		;
		goto R999;
;
		
	case 32: // STATE 39
		goto R999;

	case 33: // STATE 27
		;
		now.random_timeout = trpt->bup.oval;
		;
		goto R999;

	case 34: // STATE 29
		;
		now.random_timeout = trpt->bup.oval;
		;
		goto R999;

	case 35: // STATE 37
		;
		now.node[ Index(((P0 *)this)->nodeId, 165) ].time_out = trpt->bup.oval;
		;
		goto R999;

	case 36: // STATE 37
		;
		now.node[ Index(((P0 *)this)->nodeId, 165) ].time_out = trpt->bup.oval;
		;
		goto R999;

	case 37: // STATE 37
		;
		now.node[ Index(((P0 *)this)->nodeId, 165) ].time_out = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 39: // STATE 43
		;
		now.node[ Index(((P0 *)this)->nodeId, 165) ].pc = trpt->bup.ovals[1];
		now.lock = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 40: // STATE 44
		;
		now.random_timeout = trpt->bup.oval;
		;
		goto R999;

	case 41: // STATE 46
		;
		now.random_timeout = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 43: // STATE 54
		;
		now.node[ Index(((P0 *)this)->nodeId, 165) ].time_out = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 45: // STATE 59
		;
		in_critical = trpt->bup.ovals[1];
		now.node[ Index(((P0 *)this)->nodeId, 165) ].pc = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 46: // STATE 61
		;
		now.node[ Index(((P0 *)this)->nodeId, 165) ].pc = trpt->bup.oval;
		;
		goto R999;

	case 47: // STATE 65
		;
		now.random_timeout = trpt->bup.oval;
		;
		goto R999;

	case 48: // STATE 67
		;
		now.random_timeout = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 50: // STATE 75
		;
		now.node[ Index(((P0 *)this)->nodeId, 165) ].time_out = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 52: // STATE 80
		;
		in_critical = trpt->bup.ovals[2];
		now.lock = trpt->bup.ovals[1];
		now.node[ Index(((P0 *)this)->nodeId, 165) ].pc = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 3);
		goto R999;

	case 53: // STATE 81
		;
		now.random_timeout = trpt->bup.oval;
		;
		goto R999;

	case 54: // STATE 83
		;
		now.random_timeout = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 56: // STATE 91
		;
		now.node[ Index(((P0 *)this)->nodeId, 165) ].time_out = trpt->bup.oval;
		;
		goto R999;

	case 57: // STATE 96
		;
		p_restor(II);
		;
		;
		goto R999;
	}

