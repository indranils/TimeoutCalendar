#define rand	pan_rand
#define pthread_equal(a,b)	((a)==(b))
#if defined(HAS_CODE) && defined(VERBOSE)
	#ifdef BFS_PAR
		bfs_printf("Pr: %d Tr: %d\n", II, t->forw);
	#else
		cpu_printf("Pr: %d Tr: %d\n", II, t->forw);
	#endif
#endif
	switch (t->forw) {
	default: Uerror("bad forward move");
	case 0:	/* if without executable clauses */
		continue;
	case 1: /* generic 'goto' or 'skip' */
		IfNotBlocked
		_m = 3; goto P999;
	case 2: /* generic 'else' */
		IfNotBlocked
		if (trpt->o_pm&1) continue;
		_m = 3; goto P999;

		 /* CLAIM ltl_liveness */
	case 3: // STATE 1 - _spin_nvr.tmp:3 - [(!((((((pc[0]==state_active)&&(pc[1]==state_active))&&(pc[2]==state_active))&&(pc[3]==state_active))&&(pc[4]==state_active))))] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported1 = 0;
			if (verbose && !reported1)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported1 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported1 = 0;
			if (verbose && !reported1)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported1 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[3][1] = 1;
		if (!( !((((((now.pc[0]==1)&&(now.pc[1]==1))&&(now.pc[2]==1))&&(now.pc[3]==1))&&(now.pc[4]==1)))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 4: // STATE 13 - _spin_nvr.tmp:10 - [-end-] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported13 = 0;
			if (verbose && !reported13)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported13 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported13 = 0;
			if (verbose && !reported13)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported13 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[3][13] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC :init: */
	case 5: // STATE 1 - TTAStartup_5Nodes.pml:423 - [((i==5))] (0:0:1 - 1)
		IfNotBlocked
		reached[2][1] = 1;
		if (!((((int)((P2 *)this)->i)==5)))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: i */  (trpt+1)->bup.oval = ((P2 *)this)->i;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P2 *)this)->i = 0;
		_m = 3; goto P999; /* 0 */
	case 6: // STATE 3 - TTAStartup_5Nodes.pml:425 - [((i<5))] (14:0:1 - 1)
		IfNotBlocked
		reached[2][3] = 1;
		if (!((((int)((P2 *)this)->i)<5)))
			continue;
		/* merge: pc[i] = state_init(0, 4, 14) */
		reached[2][4] = 1;
		(trpt+1)->bup.oval = now.pc[ Index(((int)((P2 *)this)->i), 5) ];
		now.pc[ Index(((P2 *)this)->i, 5) ] = 4;
#ifdef VAR_RANGES
		logval("pc[:init::i]", now.pc[ Index(((int)((P2 *)this)->i), 5) ]);
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 7: // STATE 5 - TTAStartup_5Nodes.pml:211 - [random_timeout = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[2][5] = 1;
		(trpt+1)->bup.oval = ((int)now.random_timeout);
		now.random_timeout = 1;
#ifdef VAR_RANGES
		logval("random_timeout", ((int)now.random_timeout));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 8: // STATE 6 - TTAStartup_5Nodes.pml:213 - [(((random_timeout>=1)&&(random_timeout<((5+1)-1))))] (11:0:1 - 1)
		IfNotBlocked
		reached[2][6] = 1;
		if (!(((((int)now.random_timeout)>=1)&&(((int)now.random_timeout)<((5+1)-1)))))
			continue;
		/* merge: random_timeout = (random_timeout+1)(0, 7, 11) */
		reached[2][7] = 1;
		(trpt+1)->bup.oval = ((int)now.random_timeout);
		now.random_timeout = (((int)now.random_timeout)+1);
#ifdef VAR_RANGES
		logval("random_timeout", ((int)now.random_timeout));
#endif
		;
		/* merge: .(goto)(0, 12, 11) */
		reached[2][12] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 9: // STATE 8 - TTAStartup_5Nodes.pml:215 - [((random_timeout==((5+1)-1)))] (16:0:1 - 1)
		IfNotBlocked
		reached[2][8] = 1;
		if (!((((int)now.random_timeout)==((5+1)-1))))
			continue;
		/* merge: goto :b20(16, 9, 16) */
		reached[2][9] = 1;
		;
		/* merge: time_out[i] = random_timeout(16, 15, 16) */
		reached[2][15] = 1;
		(trpt+1)->bup.oval = ((int)now.time_out[ Index(((int)((P2 *)this)->i), 5) ]);
		now.time_out[ Index(((P2 *)this)->i, 5) ] = ((int)now.random_timeout);
#ifdef VAR_RANGES
		logval("time_out[:init::i]", ((int)now.time_out[ Index(((int)((P2 *)this)->i), 5) ]));
#endif
		;
		_m = 3; goto P999; /* 2 */
	case 10: // STATE 10 - TTAStartup_5Nodes.pml:217 - [goto :b20] (0:16:1 - 1)
		IfNotBlocked
		reached[2][10] = 1;
		;
		/* merge: time_out[i] = random_timeout(16, 15, 16) */
		reached[2][15] = 1;
		(trpt+1)->bup.oval = ((int)now.time_out[ Index(((int)((P2 *)this)->i), 5) ]);
		now.time_out[ Index(((P2 *)this)->i, 5) ] = ((int)now.random_timeout);
#ifdef VAR_RANGES
		logval("time_out[:init::i]", ((int)now.time_out[ Index(((int)((P2 *)this)->i), 5) ]));
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 11: // STATE 15 - TTAStartup_5Nodes.pml:428 - [time_out[i] = random_timeout] (0:16:1 - 4)
		IfNotBlocked
		reached[2][15] = 1;
		(trpt+1)->bup.oval = ((int)now.time_out[ Index(((int)((P2 *)this)->i), 5) ]);
		now.time_out[ Index(((P2 *)this)->i, 5) ] = ((int)now.random_timeout);
#ifdef VAR_RANGES
		logval("time_out[:init::i]", ((int)now.time_out[ Index(((int)((P2 *)this)->i), 5) ]));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 12: // STATE 16 - TTAStartup_5Nodes.pml:429 - [(run node(i))] (0:0:0 - 1)
		IfNotBlocked
		reached[2][16] = 1;
		if (!(addproc(II, 1, 1, ((int)((P2 *)this)->i))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 13: // STATE 17 - TTAStartup_5Nodes.pml:430 - [i = (i+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[2][17] = 1;
		(trpt+1)->bup.oval = ((int)((P2 *)this)->i);
		((P2 *)this)->i = (((int)((P2 *)this)->i)+1);
#ifdef VAR_RANGES
		logval(":init::i", ((int)((P2 *)this)->i));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 14: // STATE 21 - TTAStartup_5Nodes.pml:432 - [(run time_advance())] (0:0:0 - 1)
		IfNotBlocked
		reached[2][21] = 1;
		if (!(addproc(II, 1, 0, 0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 15: // STATE 23 - TTAStartup_5Nodes.pml:434 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[2][23] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC node */
	case 16: // STATE 1 - TTAStartup_5Nodes.pml:322 - [((pc[i]==state_init))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][1] = 1;
		if (!((now.pc[ Index(((P1 *)this)->i, 5) ]==4)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 17: // STATE 2 - TTAStartup_5Nodes.pml:325 - [(((cal.flag[i]==0)&&(time_out[i]==0)))] (7:0:1 - 1)
		IfNotBlocked
		reached[1][2] = 1;
		if (!(((((int)now.cal.flag[ Index(((P1 *)this)->i, 5) ])==0)&&(((int)now.time_out[ Index(((P1 *)this)->i, 5) ])==0))))
			continue;
		/* merge: pc[i] = state_listen(0, 3, 7) */
		reached[1][3] = 1;
		(trpt+1)->bup.oval = now.pc[ Index(((P1 *)this)->i, 5) ];
		now.pc[ Index(((P1 *)this)->i, 5) ] = 3;
#ifdef VAR_RANGES
		logval("pc[node:i]", now.pc[ Index(((P1 *)this)->i, 5) ]);
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 18: // STATE 4 - TTAStartup_5Nodes.pml:136 - [tau_startup = (3*i)] (0:244:3 - 1)
		IfNotBlocked
		reached[1][4] = 1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = ((int)now.tau_startup);
		now.tau_startup = (3*((P1 *)this)->i);
#ifdef VAR_RANGES
		logval("tau_startup", ((int)now.tau_startup));
#endif
		;
		/* merge: tau_listen = ((2*round_time)+tau_startup)(244, 6, 244) */
		reached[1][6] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.tau_listen);
		now.tau_listen = ((2*((int)now.round_time))+((int)now.tau_startup));
#ifdef VAR_RANGES
		logval("tau_listen", ((int)now.tau_listen));
#endif
		;
		/* merge: time_out[i] = tau_listen(244, 8, 244) */
		reached[1][8] = 1;
		(trpt+1)->bup.ovals[2] = ((int)now.time_out[ Index(((P1 *)this)->i, 5) ]);
		now.time_out[ Index(((P1 *)this)->i, 5) ] = ((int)now.tau_listen);
#ifdef VAR_RANGES
		logval("time_out[node:i]", ((int)now.time_out[ Index(((P1 *)this)->i, 5) ]));
#endif
		;
		/* merge: .(goto)(244, 14, 244) */
		reached[1][14] = 1;
		;
		/* merge: .(goto)(0, 245, 244) */
		reached[1][245] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 19: // STATE 14 - TTAStartup_5Nodes.pml:336 - [.(goto)] (0:244:0 - 2)
		IfNotBlocked
		reached[1][14] = 1;
		;
		/* merge: .(goto)(0, 245, 244) */
		reached[1][245] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 20: // STATE 9 - TTAStartup_5Nodes.pml:331 - [((cal.flag[i]&&(cal.delivery==0)))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][9] = 1;
		if (!((((int)now.cal.flag[ Index(((P1 *)this)->i, 5) ])&&(((int)now.cal.delivery)==0))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 21: // STATE 10 - TTAStartup_5Nodes.pml:131 - [cal.flag[i] = 0] (0:244:2 - 1)
		IfNotBlocked
		reached[1][10] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)now.cal.flag[ Index(((P1 *)this)->i, 5) ]);
		now.cal.flag[ Index(((P1 *)this)->i, 5) ] = 0;
#ifdef VAR_RANGES
		logval("cal.flag[node:i]", ((int)now.cal.flag[ Index(((P1 *)this)->i, 5) ]));
#endif
		;
		/* merge: event_pending = 0(244, 12, 244) */
		reached[1][12] = 1;
		(trpt+1)->bup.ovals[1] = ((int)event_pending);
		event_pending = 0;
#ifdef VAR_RANGES
		logval("event_pending", ((int)event_pending));
#endif
		;
		/* merge: .(goto)(244, 14, 244) */
		reached[1][14] = 1;
		;
		/* merge: .(goto)(0, 245, 244) */
		reached[1][245] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 22: // STATE 16 - TTAStartup_5Nodes.pml:337 - [((pc[i]==state_listen))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][16] = 1;
		if (!((now.pc[ Index(((P1 *)this)->i, 5) ]==3)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 23: // STATE 17 - TTAStartup_5Nodes.pml:340 - [((!((cal.flag[i]&&(cal.delivery==0)))&&(time_out[i]==0)))] (22:0:1 - 1)
		IfNotBlocked
		reached[1][17] = 1;
		if (!(( !((((int)now.cal.flag[ Index(((P1 *)this)->i, 5) ])&&(((int)now.cal.delivery)==0)))&&(((int)now.time_out[ Index(((P1 *)this)->i, 5) ])==0))))
			continue;
		/* merge: pc[i] = state_coldstart(0, 18, 22) */
		reached[1][18] = 1;
		(trpt+1)->bup.oval = now.pc[ Index(((P1 *)this)->i, 5) ];
		now.pc[ Index(((P1 *)this)->i, 5) ] = 2;
#ifdef VAR_RANGES
		logval("pc[node:i]", now.pc[ Index(((P1 *)this)->i, 5) ]);
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 24: // STATE 19 - TTAStartup_5Nodes.pml:136 - [tau_startup = (3*i)] (0:74:3 - 1)
		IfNotBlocked
		reached[1][19] = 1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = ((int)now.tau_startup);
		now.tau_startup = (3*((P1 *)this)->i);
#ifdef VAR_RANGES
		logval("tau_startup", ((int)now.tau_startup));
#endif
		;
		/* merge: tau_coldstart = (round_time+tau_startup)(74, 21, 74) */
		reached[1][21] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.tau_coldstart);
		now.tau_coldstart = (((int)now.round_time)+((int)now.tau_startup));
#ifdef VAR_RANGES
		logval("tau_coldstart", ((int)now.tau_coldstart));
#endif
		;
		/* merge: time_out[i] = tau_coldstart(74, 23, 74) */
		reached[1][23] = 1;
		(trpt+1)->bup.ovals[2] = ((int)now.time_out[ Index(((P1 *)this)->i, 5) ]);
		now.time_out[ Index(((P1 *)this)->i, 5) ] = ((int)now.tau_coldstart);
#ifdef VAR_RANGES
		logval("time_out[node:i]", ((int)now.time_out[ Index(((P1 *)this)->i, 5) ]));
#endif
		;
		_m = 3; goto P999; /* 2 */
	case 25: // STATE 24 - TTAStartup_5Nodes.pml:155 - [j = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[1][24] = 1;
		(trpt+1)->bup.oval = ((int)((P1 *)this)->_4_4_8_j);
		((P1 *)this)->_4_4_8_j = 0;
#ifdef VAR_RANGES
		logval("node:j", ((int)((P1 *)this)->_4_4_8_j));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 26: // STATE 25 - TTAStartup_5Nodes.pml:60 - [i5 = 0] (0:38:2 - 1)
		IfNotBlocked
		reached[1][25] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)((P1 *)this)->_4_4_8_7_1_i5);
		((P1 *)this)->_4_4_8_7_1_i5 = 0;
#ifdef VAR_RANGES
		logval("node:i5", ((int)((P1 *)this)->_4_4_8_7_1_i5));
#endif
		;
		/* merge: i5 = 0(38, 26, 38) */
		reached[1][26] = 1;
		(trpt+1)->bup.ovals[1] = ((int)((P1 *)this)->_4_4_8_7_1_i5);
		((P1 *)this)->_4_4_8_7_1_i5 = 0;
#ifdef VAR_RANGES
		logval("node:i5", ((int)((P1 *)this)->_4_4_8_7_1_i5));
#endif
		;
		/* merge: .(goto)(0, 39, 38) */
		reached[1][39] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 27: // STATE 27 - TTAStartup_5Nodes.pml:62 - [((i5==5))] (71:0:2 - 1)
		IfNotBlocked
		reached[1][27] = 1;
		if (!((((int)((P1 *)this)->_4_4_8_7_1_i5)==5)))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: _4_4_8_7_1_i5 */  (trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P1 *)this)->_4_4_8_7_1_i5;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P1 *)this)->_4_4_8_7_1_i5 = 0;
		/* merge: empty_cal = 1(0, 28, 71) */
		reached[1][28] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.empty_cal);
		now.empty_cal = 1;
#ifdef VAR_RANGES
		logval("empty_cal", ((int)now.empty_cal));
#endif
		;
		/* merge: goto :b10(0, 29, 71) */
		reached[1][29] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 28: // STATE 30 - TTAStartup_5Nodes.pml:65 - [((i5!=5))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][30] = 1;
		if (!((((int)((P1 *)this)->_4_4_8_7_1_i5)!=5)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 29: // STATE 31 - TTAStartup_5Nodes.pml:67 - [((cal.flag[i5]==1))] (71:0:2 - 1)
		IfNotBlocked
		reached[1][31] = 1;
		if (!((((int)now.cal.flag[ Index(((int)((P1 *)this)->_4_4_8_7_1_i5), 5) ])==1)))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: _4_4_8_7_1_i5 */  (trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P1 *)this)->_4_4_8_7_1_i5;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P1 *)this)->_4_4_8_7_1_i5 = 0;
		/* merge: empty_cal = 0(0, 32, 71) */
		reached[1][32] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.empty_cal);
		now.empty_cal = 0;
#ifdef VAR_RANGES
		logval("empty_cal", ((int)now.empty_cal));
#endif
		;
		/* merge: goto :b10(0, 33, 71) */
		reached[1][33] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 30: // STATE 35 - TTAStartup_5Nodes.pml:71 - [i5 = (i5+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[1][35] = 1;
		(trpt+1)->bup.oval = ((int)((P1 *)this)->_4_4_8_7_1_i5);
		((P1 *)this)->_4_4_8_7_1_i5 = (((int)((P1 *)this)->_4_4_8_7_1_i5)+1);
#ifdef VAR_RANGES
		logval("node:i5", ((int)((P1 *)this)->_4_4_8_7_1_i5));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 31: // STATE 42 - TTAStartup_5Nodes.pml:158 - [((empty_cal==1))] (59:0:5 - 1)
		IfNotBlocked
		reached[1][42] = 1;
		if (!((((int)now.empty_cal)==1)))
			continue;
		/* merge: cal.msg = 6(59, 43, 59) */
		reached[1][43] = 1;
		(trpt+1)->bup.ovals = grab_ints(5);
		(trpt+1)->bup.ovals[0] = now.cal.msg;
		now.cal.msg = 6;
#ifdef VAR_RANGES
		logval("cal.msg", now.cal.msg);
#endif
		;
		/* merge: cal.origin = i(59, 44, 59) */
		reached[1][44] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.cal.origin);
		now.cal.origin = ((P1 *)this)->i;
#ifdef VAR_RANGES
		logval("cal.origin", ((int)now.cal.origin));
#endif
		;
		/* merge: cal.send = 0(59, 45, 59) */
		reached[1][45] = 1;
		(trpt+1)->bup.ovals[2] = ((int)now.cal.send);
		now.cal.send = 0;
#ifdef VAR_RANGES
		logval("cal.send", ((int)now.cal.send));
#endif
		;
		/* merge: cal.delivery = propagation_delay(59, 46, 59) */
		reached[1][46] = 1;
		(trpt+1)->bup.ovals[3] = ((int)now.cal.delivery);
		now.cal.delivery = ((int)now.propagation_delay);
#ifdef VAR_RANGES
		logval("cal.delivery", ((int)now.cal.delivery));
#endif
		;
		/* merge: j = 0(59, 47, 59) */
		reached[1][47] = 1;
		(trpt+1)->bup.ovals[4] = ((int)((P1 *)this)->_4_4_8_j);
		((P1 *)this)->_4_4_8_j = 0;
#ifdef VAR_RANGES
		logval("node:j", ((int)((P1 *)this)->_4_4_8_j));
#endif
		;
		/* merge: .(goto)(0, 60, 59) */
		reached[1][60] = 1;
		;
		_m = 3; goto P999; /* 6 */
	case 32: // STATE 48 - TTAStartup_5Nodes.pml:165 - [((j==5))] (244:0:1 - 1)
		IfNotBlocked
		reached[1][48] = 1;
		if (!((((int)((P1 *)this)->_4_4_8_j)==5)))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: _4_4_8_j */  (trpt+1)->bup.oval = ((P1 *)this)->_4_4_8_j;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P1 *)this)->_4_4_8_j = 0;
		/* merge: goto :b11(244, 49, 244) */
		reached[1][49] = 1;
		;
		/* merge: .(goto)(244, 72, 244) */
		reached[1][72] = 1;
		;
		/* merge: .(goto)(244, 93, 244) */
		reached[1][93] = 1;
		;
		/* merge: .(goto)(0, 245, 244) */
		reached[1][245] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 33: // STATE 51 - TTAStartup_5Nodes.pml:169 - [((j!=i))] (59:0:2 - 1)
		IfNotBlocked
		reached[1][51] = 1;
		if (!((((int)((P1 *)this)->_4_4_8_j)!=((P1 *)this)->i)))
			continue;
		/* merge: cal.flag[j] = 1(59, 52, 59) */
		reached[1][52] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)now.cal.flag[ Index(((int)((P1 *)this)->_4_4_8_j), 5) ]);
		now.cal.flag[ Index(((P1 *)this)->_4_4_8_j, 5) ] = 1;
#ifdef VAR_RANGES
		logval("cal.flag[node:j]", ((int)now.cal.flag[ Index(((int)((P1 *)this)->_4_4_8_j), 5) ]));
#endif
		;
		/* merge: j = (j+1)(59, 53, 59) */
		reached[1][53] = 1;
		(trpt+1)->bup.ovals[1] = ((int)((P1 *)this)->_4_4_8_j);
		((P1 *)this)->_4_4_8_j = (((int)((P1 *)this)->_4_4_8_j)+1);
#ifdef VAR_RANGES
		logval("node:j", ((int)((P1 *)this)->_4_4_8_j));
#endif
		;
		/* merge: .(goto)(0, 58, 59) */
		reached[1][58] = 1;
		;
		/* merge: .(goto)(0, 60, 59) */
		reached[1][60] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 34: // STATE 55 - TTAStartup_5Nodes.pml:173 - [cal.flag[j] = 0] (0:59:2 - 1)
		IfNotBlocked
		reached[1][55] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)now.cal.flag[ Index(((int)((P1 *)this)->_4_4_8_j), 5) ]);
		now.cal.flag[ Index(((P1 *)this)->_4_4_8_j, 5) ] = 0;
#ifdef VAR_RANGES
		logval("cal.flag[node:j]", ((int)now.cal.flag[ Index(((int)((P1 *)this)->_4_4_8_j), 5) ]));
#endif
		;
		/* merge: j = (j+1)(59, 56, 59) */
		reached[1][56] = 1;
		(trpt+1)->bup.ovals[1] = ((int)((P1 *)this)->_4_4_8_j);
		((P1 *)this)->_4_4_8_j = (((int)((P1 *)this)->_4_4_8_j)+1);
#ifdef VAR_RANGES
		logval("node:j", ((int)((P1 *)this)->_4_4_8_j));
#endif
		;
		/* merge: .(goto)(0, 58, 59) */
		reached[1][58] = 1;
		;
		/* merge: .(goto)(0, 60, 59) */
		reached[1][60] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 35: // STATE 72 - TTAStartup_5Nodes.pml:186 - [.(goto)] (0:244:0 - 6)
		IfNotBlocked
		reached[1][72] = 1;
		;
		/* merge: .(goto)(244, 93, 244) */
		reached[1][93] = 1;
		;
		/* merge: .(goto)(0, 245, 244) */
		reached[1][245] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 36: // STATE 63 - TTAStartup_5Nodes.pml:179 - [((j==5))] (244:0:1 - 1)
		IfNotBlocked
		reached[1][63] = 1;
		if (!((((int)((P1 *)this)->_4_4_8_j)==5)))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: _4_4_8_j */  (trpt+1)->bup.oval = ((P1 *)this)->_4_4_8_j;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P1 *)this)->_4_4_8_j = 0;
		/* merge: goto :b12(244, 64, 244) */
		reached[1][64] = 1;
		;
		/* merge: .(goto)(244, 72, 244) */
		reached[1][72] = 1;
		;
		/* merge: .(goto)(244, 93, 244) */
		reached[1][93] = 1;
		;
		/* merge: .(goto)(0, 245, 244) */
		reached[1][245] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 37: // STATE 66 - TTAStartup_5Nodes.pml:182 - [cal.flag[j] = 0] (0:68:2 - 1)
		IfNotBlocked
		reached[1][66] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)now.cal.flag[ Index(((int)((P1 *)this)->_4_4_8_j), 5) ]);
		now.cal.flag[ Index(((P1 *)this)->_4_4_8_j, 5) ] = 0;
#ifdef VAR_RANGES
		logval("cal.flag[node:j]", ((int)now.cal.flag[ Index(((int)((P1 *)this)->_4_4_8_j), 5) ]));
#endif
		;
		/* merge: j = (j+1)(68, 67, 68) */
		reached[1][67] = 1;
		(trpt+1)->bup.ovals[1] = ((int)((P1 *)this)->_4_4_8_j);
		((P1 *)this)->_4_4_8_j = (((int)((P1 *)this)->_4_4_8_j)+1);
#ifdef VAR_RANGES
		logval("node:j", ((int)((P1 *)this)->_4_4_8_j));
#endif
		;
		/* merge: .(goto)(0, 69, 68) */
		reached[1][69] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 38: // STATE 93 - TTAStartup_5Nodes.pml:361 - [.(goto)] (0:244:0 - 3)
		IfNotBlocked
		reached[1][93] = 1;
		;
		/* merge: .(goto)(0, 245, 244) */
		reached[1][245] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 39: // STATE 75 - TTAStartup_5Nodes.pml:347 - [((((cal.flag[i]==1)&&(cal.msg==cs_frame))&&(cal.delivery==0)))] (80:0:1 - 1)
		IfNotBlocked
		reached[1][75] = 1;
		if (!((((((int)now.cal.flag[ Index(((P1 *)this)->i, 5) ])==1)&&(now.cal.msg==6))&&(((int)now.cal.delivery)==0))))
			continue;
		/* merge: pc[i] = state_coldstart(0, 76, 80) */
		reached[1][76] = 1;
		(trpt+1)->bup.oval = now.pc[ Index(((P1 *)this)->i, 5) ];
		now.pc[ Index(((P1 *)this)->i, 5) ] = 2;
#ifdef VAR_RANGES
		logval("pc[node:i]", now.pc[ Index(((P1 *)this)->i, 5) ]);
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 40: // STATE 77 - TTAStartup_5Nodes.pml:136 - [tau_startup = (3*i)] (0:83:3 - 1)
		IfNotBlocked
		reached[1][77] = 1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = ((int)now.tau_startup);
		now.tau_startup = (3*((P1 *)this)->i);
#ifdef VAR_RANGES
		logval("tau_startup", ((int)now.tau_startup));
#endif
		;
		/* merge: tau_coldstart = (round_time+tau_startup)(83, 79, 83) */
		reached[1][79] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.tau_coldstart);
		now.tau_coldstart = (((int)now.round_time)+((int)now.tau_startup));
#ifdef VAR_RANGES
		logval("tau_coldstart", ((int)now.tau_coldstart));
#endif
		;
		/* merge: time_out[i] = (tau_coldstart-propagation_delay)(83, 81, 83) */
		reached[1][81] = 1;
		(trpt+1)->bup.ovals[2] = ((int)now.time_out[ Index(((P1 *)this)->i, 5) ]);
		now.time_out[ Index(((P1 *)this)->i, 5) ] = (((int)now.tau_coldstart)-((int)now.propagation_delay));
#ifdef VAR_RANGES
		logval("time_out[node:i]", ((int)now.time_out[ Index(((P1 *)this)->i, 5) ]));
#endif
		;
		_m = 3; goto P999; /* 2 */
	case 41: // STATE 82 - TTAStartup_5Nodes.pml:131 - [cal.flag[i] = 0] (0:244:1 - 1)
		IfNotBlocked
		reached[1][82] = 1;
		(trpt+1)->bup.oval = ((int)now.cal.flag[ Index(((P1 *)this)->i, 5) ]);
		now.cal.flag[ Index(((P1 *)this)->i, 5) ] = 0;
#ifdef VAR_RANGES
		logval("cal.flag[node:i]", ((int)now.cal.flag[ Index(((P1 *)this)->i, 5) ]));
#endif
		;
		/* merge: .(goto)(244, 93, 244) */
		reached[1][93] = 1;
		;
		/* merge: .(goto)(0, 245, 244) */
		reached[1][245] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 42: // STATE 84 - TTAStartup_5Nodes.pml:354 - [(((cal.flag[i]&&(cal.msg==i_frame))&&(cal.delivery==0)))] (88:0:2 - 1)
		IfNotBlocked
		reached[1][84] = 1;
		if (!(((((int)now.cal.flag[ Index(((P1 *)this)->i, 5) ])&&(now.cal.msg==5))&&(((int)now.cal.delivery)==0))))
			continue;
		/* merge: pc[i] = state_active(88, 85, 88) */
		reached[1][85] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = now.pc[ Index(((P1 *)this)->i, 5) ];
		now.pc[ Index(((P1 *)this)->i, 5) ] = 1;
#ifdef VAR_RANGES
		logval("pc[node:i]", now.pc[ Index(((P1 *)this)->i, 5) ]);
#endif
		;
		/* merge: time_out[i] = (3-propagation_delay)(88, 86, 88) */
		reached[1][86] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.time_out[ Index(((P1 *)this)->i, 5) ]);
		now.time_out[ Index(((P1 *)this)->i, 5) ] = (3-((int)now.propagation_delay));
#ifdef VAR_RANGES
		logval("time_out[node:i]", ((int)now.time_out[ Index(((P1 *)this)->i, 5) ]));
#endif
		;
		_m = 3; goto P999; /* 2 */
	case 43: // STATE 87 - TTAStartup_5Nodes.pml:126 - [frame_origin = cal.origin] (0:91:2 - 1)
		IfNotBlocked
		reached[1][87] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)now.frame_origin);
		now.frame_origin = ((int)now.cal.origin);
#ifdef VAR_RANGES
		logval("frame_origin", ((int)now.frame_origin));
#endif
		;
		/* merge: slot[i] = frame_origin(91, 89, 91) */
		reached[1][89] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.slot[ Index(((P1 *)this)->i, 5) ]);
		now.slot[ Index(((P1 *)this)->i, 5) ] = ((int)now.frame_origin);
#ifdef VAR_RANGES
		logval("slot[node:i]", ((int)now.slot[ Index(((P1 *)this)->i, 5) ]));
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 44: // STATE 90 - TTAStartup_5Nodes.pml:131 - [cal.flag[i] = 0] (0:244:1 - 1)
		IfNotBlocked
		reached[1][90] = 1;
		(trpt+1)->bup.oval = ((int)now.cal.flag[ Index(((P1 *)this)->i, 5) ]);
		now.cal.flag[ Index(((P1 *)this)->i, 5) ] = 0;
#ifdef VAR_RANGES
		logval("cal.flag[node:i]", ((int)now.cal.flag[ Index(((P1 *)this)->i, 5) ]));
#endif
		;
		/* merge: .(goto)(244, 93, 244) */
		reached[1][93] = 1;
		;
		/* merge: .(goto)(0, 245, 244) */
		reached[1][245] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 45: // STATE 95 - TTAStartup_5Nodes.pml:362 - [((pc[i]==state_coldstart))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][95] = 1;
		if (!((now.pc[ Index(((P1 *)this)->i, 5) ]==2)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 46: // STATE 96 - TTAStartup_5Nodes.pml:365 - [((!((cal.flag[i]&&(cal.delivery==0)))&&(time_out[i]==0)))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][96] = 1;
		if (!(( !((((int)now.cal.flag[ Index(((P1 *)this)->i, 5) ])&&(((int)now.cal.delivery)==0)))&&(((int)now.time_out[ Index(((P1 *)this)->i, 5) ])==0))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 47: // STATE 97 - TTAStartup_5Nodes.pml:136 - [tau_startup = (3*i)] (0:152:3 - 1)
		IfNotBlocked
		reached[1][97] = 1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = ((int)now.tau_startup);
		now.tau_startup = (3*((P1 *)this)->i);
#ifdef VAR_RANGES
		logval("tau_startup", ((int)now.tau_startup));
#endif
		;
		/* merge: tau_coldstart = (round_time+tau_startup)(152, 99, 152) */
		reached[1][99] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.tau_coldstart);
		now.tau_coldstart = (((int)now.round_time)+((int)now.tau_startup));
#ifdef VAR_RANGES
		logval("tau_coldstart", ((int)now.tau_coldstart));
#endif
		;
		/* merge: time_out[i] = tau_coldstart(152, 101, 152) */
		reached[1][101] = 1;
		(trpt+1)->bup.ovals[2] = ((int)now.time_out[ Index(((P1 *)this)->i, 5) ]);
		now.time_out[ Index(((P1 *)this)->i, 5) ] = ((int)now.tau_coldstart);
#ifdef VAR_RANGES
		logval("time_out[node:i]", ((int)now.time_out[ Index(((P1 *)this)->i, 5) ]));
#endif
		;
		_m = 3; goto P999; /* 2 */
	case 48: // STATE 102 - TTAStartup_5Nodes.pml:155 - [j = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[1][102] = 1;
		(trpt+1)->bup.oval = ((int)((P1 *)this)->_4_5_14_j);
		((P1 *)this)->_4_5_14_j = 0;
#ifdef VAR_RANGES
		logval("node:j", ((int)((P1 *)this)->_4_5_14_j));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 49: // STATE 103 - TTAStartup_5Nodes.pml:60 - [i5 = 0] (0:116:2 - 1)
		IfNotBlocked
		reached[1][103] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)((P1 *)this)->_4_5_14_10_2_i5);
		((P1 *)this)->_4_5_14_10_2_i5 = 0;
#ifdef VAR_RANGES
		logval("node:i5", ((int)((P1 *)this)->_4_5_14_10_2_i5));
#endif
		;
		/* merge: i5 = 0(116, 104, 116) */
		reached[1][104] = 1;
		(trpt+1)->bup.ovals[1] = ((int)((P1 *)this)->_4_5_14_10_2_i5);
		((P1 *)this)->_4_5_14_10_2_i5 = 0;
#ifdef VAR_RANGES
		logval("node:i5", ((int)((P1 *)this)->_4_5_14_10_2_i5));
#endif
		;
		/* merge: .(goto)(0, 117, 116) */
		reached[1][117] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 50: // STATE 105 - TTAStartup_5Nodes.pml:62 - [((i5==5))] (149:0:2 - 1)
		IfNotBlocked
		reached[1][105] = 1;
		if (!((((int)((P1 *)this)->_4_5_14_10_2_i5)==5)))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: _4_5_14_10_2_i5 */  (trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P1 *)this)->_4_5_14_10_2_i5;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P1 *)this)->_4_5_14_10_2_i5 = 0;
		/* merge: empty_cal = 1(0, 106, 149) */
		reached[1][106] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.empty_cal);
		now.empty_cal = 1;
#ifdef VAR_RANGES
		logval("empty_cal", ((int)now.empty_cal));
#endif
		;
		/* merge: goto :b13(0, 107, 149) */
		reached[1][107] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 51: // STATE 108 - TTAStartup_5Nodes.pml:65 - [((i5!=5))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][108] = 1;
		if (!((((int)((P1 *)this)->_4_5_14_10_2_i5)!=5)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 52: // STATE 109 - TTAStartup_5Nodes.pml:67 - [((cal.flag[i5]==1))] (149:0:2 - 1)
		IfNotBlocked
		reached[1][109] = 1;
		if (!((((int)now.cal.flag[ Index(((int)((P1 *)this)->_4_5_14_10_2_i5), 5) ])==1)))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: _4_5_14_10_2_i5 */  (trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P1 *)this)->_4_5_14_10_2_i5;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P1 *)this)->_4_5_14_10_2_i5 = 0;
		/* merge: empty_cal = 0(0, 110, 149) */
		reached[1][110] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.empty_cal);
		now.empty_cal = 0;
#ifdef VAR_RANGES
		logval("empty_cal", ((int)now.empty_cal));
#endif
		;
		/* merge: goto :b13(0, 111, 149) */
		reached[1][111] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 53: // STATE 113 - TTAStartup_5Nodes.pml:71 - [i5 = (i5+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[1][113] = 1;
		(trpt+1)->bup.oval = ((int)((P1 *)this)->_4_5_14_10_2_i5);
		((P1 *)this)->_4_5_14_10_2_i5 = (((int)((P1 *)this)->_4_5_14_10_2_i5)+1);
#ifdef VAR_RANGES
		logval("node:i5", ((int)((P1 *)this)->_4_5_14_10_2_i5));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 54: // STATE 120 - TTAStartup_5Nodes.pml:158 - [((empty_cal==1))] (137:0:5 - 1)
		IfNotBlocked
		reached[1][120] = 1;
		if (!((((int)now.empty_cal)==1)))
			continue;
		/* merge: cal.msg = 6(137, 121, 137) */
		reached[1][121] = 1;
		(trpt+1)->bup.ovals = grab_ints(5);
		(trpt+1)->bup.ovals[0] = now.cal.msg;
		now.cal.msg = 6;
#ifdef VAR_RANGES
		logval("cal.msg", now.cal.msg);
#endif
		;
		/* merge: cal.origin = i(137, 122, 137) */
		reached[1][122] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.cal.origin);
		now.cal.origin = ((P1 *)this)->i;
#ifdef VAR_RANGES
		logval("cal.origin", ((int)now.cal.origin));
#endif
		;
		/* merge: cal.send = 0(137, 123, 137) */
		reached[1][123] = 1;
		(trpt+1)->bup.ovals[2] = ((int)now.cal.send);
		now.cal.send = 0;
#ifdef VAR_RANGES
		logval("cal.send", ((int)now.cal.send));
#endif
		;
		/* merge: cal.delivery = propagation_delay(137, 124, 137) */
		reached[1][124] = 1;
		(trpt+1)->bup.ovals[3] = ((int)now.cal.delivery);
		now.cal.delivery = ((int)now.propagation_delay);
#ifdef VAR_RANGES
		logval("cal.delivery", ((int)now.cal.delivery));
#endif
		;
		/* merge: j = 0(137, 125, 137) */
		reached[1][125] = 1;
		(trpt+1)->bup.ovals[4] = ((int)((P1 *)this)->_4_5_14_j);
		((P1 *)this)->_4_5_14_j = 0;
#ifdef VAR_RANGES
		logval("node:j", ((int)((P1 *)this)->_4_5_14_j));
#endif
		;
		/* merge: .(goto)(0, 138, 137) */
		reached[1][138] = 1;
		;
		_m = 3; goto P999; /* 6 */
	case 55: // STATE 126 - TTAStartup_5Nodes.pml:165 - [((j==5))] (244:0:1 - 1)
		IfNotBlocked
		reached[1][126] = 1;
		if (!((((int)((P1 *)this)->_4_5_14_j)==5)))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: _4_5_14_j */  (trpt+1)->bup.oval = ((P1 *)this)->_4_5_14_j;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P1 *)this)->_4_5_14_j = 0;
		/* merge: goto :b14(244, 127, 244) */
		reached[1][127] = 1;
		;
		/* merge: .(goto)(244, 150, 244) */
		reached[1][150] = 1;
		;
		/* merge: .(goto)(244, 170, 244) */
		reached[1][170] = 1;
		;
		/* merge: .(goto)(0, 245, 244) */
		reached[1][245] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 56: // STATE 129 - TTAStartup_5Nodes.pml:169 - [((j!=i))] (137:0:2 - 1)
		IfNotBlocked
		reached[1][129] = 1;
		if (!((((int)((P1 *)this)->_4_5_14_j)!=((P1 *)this)->i)))
			continue;
		/* merge: cal.flag[j] = 1(137, 130, 137) */
		reached[1][130] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)now.cal.flag[ Index(((int)((P1 *)this)->_4_5_14_j), 5) ]);
		now.cal.flag[ Index(((P1 *)this)->_4_5_14_j, 5) ] = 1;
#ifdef VAR_RANGES
		logval("cal.flag[node:j]", ((int)now.cal.flag[ Index(((int)((P1 *)this)->_4_5_14_j), 5) ]));
#endif
		;
		/* merge: j = (j+1)(137, 131, 137) */
		reached[1][131] = 1;
		(trpt+1)->bup.ovals[1] = ((int)((P1 *)this)->_4_5_14_j);
		((P1 *)this)->_4_5_14_j = (((int)((P1 *)this)->_4_5_14_j)+1);
#ifdef VAR_RANGES
		logval("node:j", ((int)((P1 *)this)->_4_5_14_j));
#endif
		;
		/* merge: .(goto)(0, 136, 137) */
		reached[1][136] = 1;
		;
		/* merge: .(goto)(0, 138, 137) */
		reached[1][138] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 57: // STATE 133 - TTAStartup_5Nodes.pml:173 - [cal.flag[j] = 0] (0:137:2 - 1)
		IfNotBlocked
		reached[1][133] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)now.cal.flag[ Index(((int)((P1 *)this)->_4_5_14_j), 5) ]);
		now.cal.flag[ Index(((P1 *)this)->_4_5_14_j, 5) ] = 0;
#ifdef VAR_RANGES
		logval("cal.flag[node:j]", ((int)now.cal.flag[ Index(((int)((P1 *)this)->_4_5_14_j), 5) ]));
#endif
		;
		/* merge: j = (j+1)(137, 134, 137) */
		reached[1][134] = 1;
		(trpt+1)->bup.ovals[1] = ((int)((P1 *)this)->_4_5_14_j);
		((P1 *)this)->_4_5_14_j = (((int)((P1 *)this)->_4_5_14_j)+1);
#ifdef VAR_RANGES
		logval("node:j", ((int)((P1 *)this)->_4_5_14_j));
#endif
		;
		/* merge: .(goto)(0, 136, 137) */
		reached[1][136] = 1;
		;
		/* merge: .(goto)(0, 138, 137) */
		reached[1][138] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 58: // STATE 150 - TTAStartup_5Nodes.pml:186 - [.(goto)] (0:244:0 - 6)
		IfNotBlocked
		reached[1][150] = 1;
		;
		/* merge: .(goto)(244, 170, 244) */
		reached[1][170] = 1;
		;
		/* merge: .(goto)(0, 245, 244) */
		reached[1][245] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 59: // STATE 141 - TTAStartup_5Nodes.pml:179 - [((j==5))] (244:0:1 - 1)
		IfNotBlocked
		reached[1][141] = 1;
		if (!((((int)((P1 *)this)->_4_5_14_j)==5)))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: _4_5_14_j */  (trpt+1)->bup.oval = ((P1 *)this)->_4_5_14_j;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P1 *)this)->_4_5_14_j = 0;
		/* merge: goto :b15(244, 142, 244) */
		reached[1][142] = 1;
		;
		/* merge: .(goto)(244, 150, 244) */
		reached[1][150] = 1;
		;
		/* merge: .(goto)(244, 170, 244) */
		reached[1][170] = 1;
		;
		/* merge: .(goto)(0, 245, 244) */
		reached[1][245] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 60: // STATE 144 - TTAStartup_5Nodes.pml:182 - [cal.flag[j] = 0] (0:146:2 - 1)
		IfNotBlocked
		reached[1][144] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)now.cal.flag[ Index(((int)((P1 *)this)->_4_5_14_j), 5) ]);
		now.cal.flag[ Index(((P1 *)this)->_4_5_14_j, 5) ] = 0;
#ifdef VAR_RANGES
		logval("cal.flag[node:j]", ((int)now.cal.flag[ Index(((int)((P1 *)this)->_4_5_14_j), 5) ]));
#endif
		;
		/* merge: j = (j+1)(146, 145, 146) */
		reached[1][145] = 1;
		(trpt+1)->bup.ovals[1] = ((int)((P1 *)this)->_4_5_14_j);
		((P1 *)this)->_4_5_14_j = (((int)((P1 *)this)->_4_5_14_j)+1);
#ifdef VAR_RANGES
		logval("node:j", ((int)((P1 *)this)->_4_5_14_j));
#endif
		;
		/* merge: .(goto)(0, 147, 146) */
		reached[1][147] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 61: // STATE 170 - TTAStartup_5Nodes.pml:386 - [.(goto)] (0:244:0 - 3)
		IfNotBlocked
		reached[1][170] = 1;
		;
		/* merge: .(goto)(0, 245, 244) */
		reached[1][245] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 62: // STATE 153 - TTAStartup_5Nodes.pml:371 - [(((cal.flag[i]&&(cal.msg==cs_frame))&&(cal.delivery==0)))] (157:0:2 - 1)
		IfNotBlocked
		reached[1][153] = 1;
		if (!(((((int)now.cal.flag[ Index(((P1 *)this)->i, 5) ])&&(now.cal.msg==6))&&(((int)now.cal.delivery)==0))))
			continue;
		/* merge: pc[i] = state_active(157, 154, 157) */
		reached[1][154] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = now.pc[ Index(((P1 *)this)->i, 5) ];
		now.pc[ Index(((P1 *)this)->i, 5) ] = 1;
#ifdef VAR_RANGES
		logval("pc[node:i]", now.pc[ Index(((P1 *)this)->i, 5) ]);
#endif
		;
		/* merge: time_out[i] = (3-propagation_delay)(157, 155, 157) */
		reached[1][155] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.time_out[ Index(((P1 *)this)->i, 5) ]);
		now.time_out[ Index(((P1 *)this)->i, 5) ] = (3-((int)now.propagation_delay));
#ifdef VAR_RANGES
		logval("time_out[node:i]", ((int)now.time_out[ Index(((P1 *)this)->i, 5) ]));
#endif
		;
		_m = 3; goto P999; /* 2 */
	case 63: // STATE 156 - TTAStartup_5Nodes.pml:126 - [frame_origin = cal.origin] (0:160:2 - 1)
		IfNotBlocked
		reached[1][156] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)now.frame_origin);
		now.frame_origin = ((int)now.cal.origin);
#ifdef VAR_RANGES
		logval("frame_origin", ((int)now.frame_origin));
#endif
		;
		/* merge: slot[i] = frame_origin(160, 158, 160) */
		reached[1][158] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.slot[ Index(((P1 *)this)->i, 5) ]);
		now.slot[ Index(((P1 *)this)->i, 5) ] = ((int)now.frame_origin);
#ifdef VAR_RANGES
		logval("slot[node:i]", ((int)now.slot[ Index(((P1 *)this)->i, 5) ]));
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 64: // STATE 159 - TTAStartup_5Nodes.pml:131 - [cal.flag[i] = 0] (0:244:1 - 1)
		IfNotBlocked
		reached[1][159] = 1;
		(trpt+1)->bup.oval = ((int)now.cal.flag[ Index(((P1 *)this)->i, 5) ]);
		now.cal.flag[ Index(((P1 *)this)->i, 5) ] = 0;
#ifdef VAR_RANGES
		logval("cal.flag[node:i]", ((int)now.cal.flag[ Index(((P1 *)this)->i, 5) ]));
#endif
		;
		/* merge: .(goto)(244, 170, 244) */
		reached[1][170] = 1;
		;
		/* merge: .(goto)(0, 245, 244) */
		reached[1][245] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 65: // STATE 161 - TTAStartup_5Nodes.pml:379 - [(((cal.flag[i]&&(cal.msg==i_frame))&&(cal.delivery==0)))] (165:0:2 - 1)
		IfNotBlocked
		reached[1][161] = 1;
		if (!(((((int)now.cal.flag[ Index(((P1 *)this)->i, 5) ])&&(now.cal.msg==5))&&(((int)now.cal.delivery)==0))))
			continue;
		/* merge: pc[i] = state_active(165, 162, 165) */
		reached[1][162] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = now.pc[ Index(((P1 *)this)->i, 5) ];
		now.pc[ Index(((P1 *)this)->i, 5) ] = 1;
#ifdef VAR_RANGES
		logval("pc[node:i]", now.pc[ Index(((P1 *)this)->i, 5) ]);
#endif
		;
		/* merge: time_out[i] = (3-propagation_delay)(165, 163, 165) */
		reached[1][163] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.time_out[ Index(((P1 *)this)->i, 5) ]);
		now.time_out[ Index(((P1 *)this)->i, 5) ] = (3-((int)now.propagation_delay));
#ifdef VAR_RANGES
		logval("time_out[node:i]", ((int)now.time_out[ Index(((P1 *)this)->i, 5) ]));
#endif
		;
		_m = 3; goto P999; /* 2 */
	case 66: // STATE 164 - TTAStartup_5Nodes.pml:126 - [frame_origin = cal.origin] (0:168:2 - 1)
		IfNotBlocked
		reached[1][164] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)now.frame_origin);
		now.frame_origin = ((int)now.cal.origin);
#ifdef VAR_RANGES
		logval("frame_origin", ((int)now.frame_origin));
#endif
		;
		/* merge: slot[i] = frame_origin(168, 166, 168) */
		reached[1][166] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.slot[ Index(((P1 *)this)->i, 5) ]);
		now.slot[ Index(((P1 *)this)->i, 5) ] = ((int)now.frame_origin);
#ifdef VAR_RANGES
		logval("slot[node:i]", ((int)now.slot[ Index(((P1 *)this)->i, 5) ]));
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 67: // STATE 167 - TTAStartup_5Nodes.pml:131 - [cal.flag[i] = 0] (0:244:1 - 1)
		IfNotBlocked
		reached[1][167] = 1;
		(trpt+1)->bup.oval = ((int)now.cal.flag[ Index(((P1 *)this)->i, 5) ]);
		now.cal.flag[ Index(((P1 *)this)->i, 5) ] = 0;
#ifdef VAR_RANGES
		logval("cal.flag[node:i]", ((int)now.cal.flag[ Index(((P1 *)this)->i, 5) ]));
#endif
		;
		/* merge: .(goto)(244, 170, 244) */
		reached[1][170] = 1;
		;
		/* merge: .(goto)(0, 245, 244) */
		reached[1][245] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 68: // STATE 172 - TTAStartup_5Nodes.pml:395 - [((pc[i]==state_active))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][172] = 1;
		if (!((now.pc[ Index(((P1 *)this)->i, 5) ]==1)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 69: // STATE 173 - TTAStartup_5Nodes.pml:398 - [((time_out[i]==0))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][173] = 1;
		if (!((((int)now.time_out[ Index(((P1 *)this)->i, 5) ])==0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 70: // STATE 174 - TTAStartup_5Nodes.pml:202 - [((slot[i]==(5-1)))] (236:0:3 - 1)
		IfNotBlocked
		reached[1][174] = 1;
		if (!((((int)now.slot[ Index(((P1 *)this)->i, 5) ])==(5-1))))
			continue;
		/* merge: increment = 0(236, 175, 236) */
		reached[1][175] = 1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = ((int)now.increment);
		now.increment = 0;
#ifdef VAR_RANGES
		logval("increment", ((int)now.increment));
#endif
		;
		/* merge: .(goto)(236, 179, 236) */
		reached[1][179] = 1;
		;
		/* merge: slot[i] = increment(236, 181, 236) */
		reached[1][181] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.slot[ Index(((P1 *)this)->i, 5) ]);
		now.slot[ Index(((P1 *)this)->i, 5) ] = ((int)now.increment);
#ifdef VAR_RANGES
		logval("slot[node:i]", ((int)now.slot[ Index(((P1 *)this)->i, 5) ]));
#endif
		;
		/* merge: time_out[i] = 3(236, 182, 236) */
		reached[1][182] = 1;
		(trpt+1)->bup.ovals[2] = ((int)now.time_out[ Index(((P1 *)this)->i, 5) ]);
		now.time_out[ Index(((P1 *)this)->i, 5) ] = 3;
#ifdef VAR_RANGES
		logval("time_out[node:i]", ((int)now.time_out[ Index(((P1 *)this)->i, 5) ]));
#endif
		;
		_m = 3; goto P999; /* 4 */
	case 71: // STATE 177 - TTAStartup_5Nodes.pml:205 - [increment = (slot[i]+1)] (0:236:3 - 1)
		IfNotBlocked
		reached[1][177] = 1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = ((int)now.increment);
		now.increment = (((int)now.slot[ Index(((P1 *)this)->i, 5) ])+1);
#ifdef VAR_RANGES
		logval("increment", ((int)now.increment));
#endif
		;
		/* merge: .(goto)(236, 179, 236) */
		reached[1][179] = 1;
		;
		/* merge: slot[i] = increment(236, 181, 236) */
		reached[1][181] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.slot[ Index(((P1 *)this)->i, 5) ]);
		now.slot[ Index(((P1 *)this)->i, 5) ] = ((int)now.increment);
#ifdef VAR_RANGES
		logval("slot[node:i]", ((int)now.slot[ Index(((P1 *)this)->i, 5) ]));
#endif
		;
		/* merge: time_out[i] = 3(236, 182, 236) */
		reached[1][182] = 1;
		(trpt+1)->bup.ovals[2] = ((int)now.time_out[ Index(((P1 *)this)->i, 5) ]);
		now.time_out[ Index(((P1 *)this)->i, 5) ] = 3;
#ifdef VAR_RANGES
		logval("time_out[node:i]", ((int)now.time_out[ Index(((P1 *)this)->i, 5) ]));
#endif
		;
		_m = 3; goto P999; /* 3 */
	case 72: // STATE 181 - TTAStartup_5Nodes.pml:401 - [slot[i] = increment] (0:236:2 - 3)
		IfNotBlocked
		reached[1][181] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)now.slot[ Index(((P1 *)this)->i, 5) ]);
		now.slot[ Index(((P1 *)this)->i, 5) ] = ((int)now.increment);
#ifdef VAR_RANGES
		logval("slot[node:i]", ((int)now.slot[ Index(((P1 *)this)->i, 5) ]));
#endif
		;
		/* merge: time_out[i] = 3(236, 182, 236) */
		reached[1][182] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.time_out[ Index(((P1 *)this)->i, 5) ]);
		now.time_out[ Index(((P1 *)this)->i, 5) ] = 3;
#ifdef VAR_RANGES
		logval("time_out[node:i]", ((int)now.time_out[ Index(((P1 *)this)->i, 5) ]));
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 73: // STATE 183 - TTAStartup_5Nodes.pml:404 - [((increment==i))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][183] = 1;
		if (!((((int)now.increment)==((P1 *)this)->i)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 74: // STATE 184 - TTAStartup_5Nodes.pml:155 - [j = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[1][184] = 1;
		(trpt+1)->bup.oval = ((int)((P1 *)this)->_4_6_20_j);
		((P1 *)this)->_4_6_20_j = 0;
#ifdef VAR_RANGES
		logval("node:j", ((int)((P1 *)this)->_4_6_20_j));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 75: // STATE 185 - TTAStartup_5Nodes.pml:60 - [i5 = 0] (0:198:2 - 1)
		IfNotBlocked
		reached[1][185] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)((P1 *)this)->_4_6_20_11_3_i5);
		((P1 *)this)->_4_6_20_11_3_i5 = 0;
#ifdef VAR_RANGES
		logval("node:i5", ((int)((P1 *)this)->_4_6_20_11_3_i5));
#endif
		;
		/* merge: i5 = 0(198, 186, 198) */
		reached[1][186] = 1;
		(trpt+1)->bup.ovals[1] = ((int)((P1 *)this)->_4_6_20_11_3_i5);
		((P1 *)this)->_4_6_20_11_3_i5 = 0;
#ifdef VAR_RANGES
		logval("node:i5", ((int)((P1 *)this)->_4_6_20_11_3_i5));
#endif
		;
		/* merge: .(goto)(0, 199, 198) */
		reached[1][199] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 76: // STATE 187 - TTAStartup_5Nodes.pml:62 - [((i5==5))] (231:0:2 - 1)
		IfNotBlocked
		reached[1][187] = 1;
		if (!((((int)((P1 *)this)->_4_6_20_11_3_i5)==5)))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: _4_6_20_11_3_i5 */  (trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P1 *)this)->_4_6_20_11_3_i5;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P1 *)this)->_4_6_20_11_3_i5 = 0;
		/* merge: empty_cal = 1(0, 188, 231) */
		reached[1][188] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.empty_cal);
		now.empty_cal = 1;
#ifdef VAR_RANGES
		logval("empty_cal", ((int)now.empty_cal));
#endif
		;
		/* merge: goto :b16(0, 189, 231) */
		reached[1][189] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 77: // STATE 190 - TTAStartup_5Nodes.pml:65 - [((i5!=5))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][190] = 1;
		if (!((((int)((P1 *)this)->_4_6_20_11_3_i5)!=5)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 78: // STATE 191 - TTAStartup_5Nodes.pml:67 - [((cal.flag[i5]==1))] (231:0:2 - 1)
		IfNotBlocked
		reached[1][191] = 1;
		if (!((((int)now.cal.flag[ Index(((int)((P1 *)this)->_4_6_20_11_3_i5), 5) ])==1)))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: _4_6_20_11_3_i5 */  (trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P1 *)this)->_4_6_20_11_3_i5;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P1 *)this)->_4_6_20_11_3_i5 = 0;
		/* merge: empty_cal = 0(0, 192, 231) */
		reached[1][192] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.empty_cal);
		now.empty_cal = 0;
#ifdef VAR_RANGES
		logval("empty_cal", ((int)now.empty_cal));
#endif
		;
		/* merge: goto :b16(0, 193, 231) */
		reached[1][193] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 79: // STATE 195 - TTAStartup_5Nodes.pml:71 - [i5 = (i5+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[1][195] = 1;
		(trpt+1)->bup.oval = ((int)((P1 *)this)->_4_6_20_11_3_i5);
		((P1 *)this)->_4_6_20_11_3_i5 = (((int)((P1 *)this)->_4_6_20_11_3_i5)+1);
#ifdef VAR_RANGES
		logval("node:i5", ((int)((P1 *)this)->_4_6_20_11_3_i5));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 80: // STATE 202 - TTAStartup_5Nodes.pml:158 - [((empty_cal==1))] (219:0:5 - 1)
		IfNotBlocked
		reached[1][202] = 1;
		if (!((((int)now.empty_cal)==1)))
			continue;
		/* merge: cal.msg = 5(219, 203, 219) */
		reached[1][203] = 1;
		(trpt+1)->bup.ovals = grab_ints(5);
		(trpt+1)->bup.ovals[0] = now.cal.msg;
		now.cal.msg = 5;
#ifdef VAR_RANGES
		logval("cal.msg", now.cal.msg);
#endif
		;
		/* merge: cal.origin = i(219, 204, 219) */
		reached[1][204] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.cal.origin);
		now.cal.origin = ((P1 *)this)->i;
#ifdef VAR_RANGES
		logval("cal.origin", ((int)now.cal.origin));
#endif
		;
		/* merge: cal.send = 0(219, 205, 219) */
		reached[1][205] = 1;
		(trpt+1)->bup.ovals[2] = ((int)now.cal.send);
		now.cal.send = 0;
#ifdef VAR_RANGES
		logval("cal.send", ((int)now.cal.send));
#endif
		;
		/* merge: cal.delivery = propagation_delay(219, 206, 219) */
		reached[1][206] = 1;
		(trpt+1)->bup.ovals[3] = ((int)now.cal.delivery);
		now.cal.delivery = ((int)now.propagation_delay);
#ifdef VAR_RANGES
		logval("cal.delivery", ((int)now.cal.delivery));
#endif
		;
		/* merge: j = 0(219, 207, 219) */
		reached[1][207] = 1;
		(trpt+1)->bup.ovals[4] = ((int)((P1 *)this)->_4_6_20_j);
		((P1 *)this)->_4_6_20_j = 0;
#ifdef VAR_RANGES
		logval("node:j", ((int)((P1 *)this)->_4_6_20_j));
#endif
		;
		/* merge: .(goto)(0, 220, 219) */
		reached[1][220] = 1;
		;
		_m = 3; goto P999; /* 6 */
	case 81: // STATE 208 - TTAStartup_5Nodes.pml:165 - [((j==5))] (244:0:1 - 1)
		IfNotBlocked
		reached[1][208] = 1;
		if (!((((int)((P1 *)this)->_4_6_20_j)==5)))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: _4_6_20_j */  (trpt+1)->bup.oval = ((P1 *)this)->_4_6_20_j;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P1 *)this)->_4_6_20_j = 0;
		/* merge: goto :b17(244, 209, 244) */
		reached[1][209] = 1;
		;
		/* merge: .(goto)(244, 237, 244) */
		reached[1][237] = 1;
		;
		/* merge: .(goto)(244, 242, 244) */
		reached[1][242] = 1;
		;
		/* merge: .(goto)(0, 245, 244) */
		reached[1][245] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 82: // STATE 211 - TTAStartup_5Nodes.pml:169 - [((j!=i))] (219:0:2 - 1)
		IfNotBlocked
		reached[1][211] = 1;
		if (!((((int)((P1 *)this)->_4_6_20_j)!=((P1 *)this)->i)))
			continue;
		/* merge: cal.flag[j] = 1(219, 212, 219) */
		reached[1][212] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)now.cal.flag[ Index(((int)((P1 *)this)->_4_6_20_j), 5) ]);
		now.cal.flag[ Index(((P1 *)this)->_4_6_20_j, 5) ] = 1;
#ifdef VAR_RANGES
		logval("cal.flag[node:j]", ((int)now.cal.flag[ Index(((int)((P1 *)this)->_4_6_20_j), 5) ]));
#endif
		;
		/* merge: j = (j+1)(219, 213, 219) */
		reached[1][213] = 1;
		(trpt+1)->bup.ovals[1] = ((int)((P1 *)this)->_4_6_20_j);
		((P1 *)this)->_4_6_20_j = (((int)((P1 *)this)->_4_6_20_j)+1);
#ifdef VAR_RANGES
		logval("node:j", ((int)((P1 *)this)->_4_6_20_j));
#endif
		;
		/* merge: .(goto)(0, 218, 219) */
		reached[1][218] = 1;
		;
		/* merge: .(goto)(0, 220, 219) */
		reached[1][220] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 83: // STATE 215 - TTAStartup_5Nodes.pml:173 - [cal.flag[j] = 0] (0:219:2 - 1)
		IfNotBlocked
		reached[1][215] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)now.cal.flag[ Index(((int)((P1 *)this)->_4_6_20_j), 5) ]);
		now.cal.flag[ Index(((P1 *)this)->_4_6_20_j, 5) ] = 0;
#ifdef VAR_RANGES
		logval("cal.flag[node:j]", ((int)now.cal.flag[ Index(((int)((P1 *)this)->_4_6_20_j), 5) ]));
#endif
		;
		/* merge: j = (j+1)(219, 216, 219) */
		reached[1][216] = 1;
		(trpt+1)->bup.ovals[1] = ((int)((P1 *)this)->_4_6_20_j);
		((P1 *)this)->_4_6_20_j = (((int)((P1 *)this)->_4_6_20_j)+1);
#ifdef VAR_RANGES
		logval("node:j", ((int)((P1 *)this)->_4_6_20_j));
#endif
		;
		/* merge: .(goto)(0, 218, 219) */
		reached[1][218] = 1;
		;
		/* merge: .(goto)(0, 220, 219) */
		reached[1][220] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 84: // STATE 223 - TTAStartup_5Nodes.pml:179 - [((j==5))] (244:0:1 - 1)
		IfNotBlocked
		reached[1][223] = 1;
		if (!((((int)((P1 *)this)->_4_6_20_j)==5)))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: _4_6_20_j */  (trpt+1)->bup.oval = ((P1 *)this)->_4_6_20_j;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P1 *)this)->_4_6_20_j = 0;
		/* merge: goto :b18(244, 224, 244) */
		reached[1][224] = 1;
		;
		/* merge: .(goto)(244, 237, 244) */
		reached[1][237] = 1;
		;
		/* merge: .(goto)(244, 242, 244) */
		reached[1][242] = 1;
		;
		/* merge: .(goto)(0, 245, 244) */
		reached[1][245] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 85: // STATE 226 - TTAStartup_5Nodes.pml:182 - [cal.flag[j] = 0] (0:228:2 - 1)
		IfNotBlocked
		reached[1][226] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)now.cal.flag[ Index(((int)((P1 *)this)->_4_6_20_j), 5) ]);
		now.cal.flag[ Index(((P1 *)this)->_4_6_20_j, 5) ] = 0;
#ifdef VAR_RANGES
		logval("cal.flag[node:j]", ((int)now.cal.flag[ Index(((int)((P1 *)this)->_4_6_20_j), 5) ]));
#endif
		;
		/* merge: j = (j+1)(228, 227, 228) */
		reached[1][227] = 1;
		(trpt+1)->bup.ovals[1] = ((int)((P1 *)this)->_4_6_20_j);
		((P1 *)this)->_4_6_20_j = (((int)((P1 *)this)->_4_6_20_j)+1);
#ifdef VAR_RANGES
		logval("node:j", ((int)((P1 *)this)->_4_6_20_j));
#endif
		;
		/* merge: .(goto)(0, 229, 228) */
		reached[1][229] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 86: // STATE 237 - TTAStartup_5Nodes.pml:409 - [.(goto)] (0:244:0 - 8)
		IfNotBlocked
		reached[1][237] = 1;
		;
		/* merge: .(goto)(244, 242, 244) */
		reached[1][242] = 1;
		;
		/* merge: .(goto)(0, 245, 244) */
		reached[1][245] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 87: // STATE 242 - TTAStartup_5Nodes.pml:413 - [.(goto)] (0:244:0 - 2)
		IfNotBlocked
		reached[1][242] = 1;
		;
		/* merge: .(goto)(0, 245, 244) */
		reached[1][245] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 88: // STATE 238 - TTAStartup_5Nodes.pml:409 - [((cal.flag[i]&&((cal.msg==cs_frame)||(cal.msg==i_frame))))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][238] = 1;
		if (!((((int)now.cal.flag[ Index(((P1 *)this)->i, 5) ])&&((now.cal.msg==6)||(now.cal.msg==5)))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 89: // STATE 239 - TTAStartup_5Nodes.pml:131 - [cal.flag[i] = 0] (0:244:1 - 1)
		IfNotBlocked
		reached[1][239] = 1;
		(trpt+1)->bup.oval = ((int)now.cal.flag[ Index(((P1 *)this)->i, 5) ]);
		now.cal.flag[ Index(((P1 *)this)->i, 5) ] = 0;
#ifdef VAR_RANGES
		logval("cal.flag[node:i]", ((int)now.cal.flag[ Index(((P1 *)this)->i, 5) ]));
#endif
		;
		/* merge: .(goto)(244, 242, 244) */
		reached[1][242] = 1;
		;
		/* merge: .(goto)(0, 245, 244) */
		reached[1][245] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 90: // STATE 247 - TTAStartup_5Nodes.pml:415 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[1][247] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC time_advance */
	case 91: // STATE 1 - TTAStartup_5Nodes.pml:270 - [(timeout)] (0:0:0 - 1)
		IfNotBlocked
		reached[0][1] = 1;
		if (!(((trpt->tau)&1)))
			continue;
		_m = 1; goto P999; /* 0 */
	case 92: // STATE 2 - TTAStartup_5Nodes.pml:60 - [i5 = 0] (0:15:2 - 1)
		IfNotBlocked
		reached[0][2] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)((P0 *)this)->_3_1_1_1_i5);
		((P0 *)this)->_3_1_1_1_i5 = 0;
#ifdef VAR_RANGES
		logval("time_advance:i5", ((int)((P0 *)this)->_3_1_1_1_i5));
#endif
		;
		/* merge: i5 = 0(15, 3, 15) */
		reached[0][3] = 1;
		(trpt+1)->bup.ovals[1] = ((int)((P0 *)this)->_3_1_1_1_i5);
		((P0 *)this)->_3_1_1_1_i5 = 0;
#ifdef VAR_RANGES
		logval("time_advance:i5", ((int)((P0 *)this)->_3_1_1_1_i5));
#endif
		;
		/* merge: .(goto)(0, 16, 15) */
		reached[0][16] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 93: // STATE 4 - TTAStartup_5Nodes.pml:62 - [((i5==5))] (69:0:2 - 1)
		IfNotBlocked
		reached[0][4] = 1;
		if (!((((int)((P0 *)this)->_3_1_1_1_i5)==5)))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: _3_1_1_1_i5 */  (trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P0 *)this)->_3_1_1_1_i5;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)this)->_3_1_1_1_i5 = 0;
		/* merge: empty_cal = 1(0, 5, 69) */
		reached[0][5] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.empty_cal);
		now.empty_cal = 1;
#ifdef VAR_RANGES
		logval("empty_cal", ((int)now.empty_cal));
#endif
		;
		/* merge: goto :b1(0, 6, 69) */
		reached[0][6] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 94: // STATE 7 - TTAStartup_5Nodes.pml:65 - [((i5!=5))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][7] = 1;
		if (!((((int)((P0 *)this)->_3_1_1_1_i5)!=5)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 95: // STATE 8 - TTAStartup_5Nodes.pml:67 - [((cal.flag[i5]==1))] (69:0:2 - 1)
		IfNotBlocked
		reached[0][8] = 1;
		if (!((((int)now.cal.flag[ Index(((int)((P0 *)this)->_3_1_1_1_i5), 5) ])==1)))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: _3_1_1_1_i5 */  (trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P0 *)this)->_3_1_1_1_i5;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)this)->_3_1_1_1_i5 = 0;
		/* merge: empty_cal = 0(0, 9, 69) */
		reached[0][9] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.empty_cal);
		now.empty_cal = 0;
#ifdef VAR_RANGES
		logval("empty_cal", ((int)now.empty_cal));
#endif
		;
		/* merge: goto :b1(0, 10, 69) */
		reached[0][10] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 96: // STATE 12 - TTAStartup_5Nodes.pml:71 - [i5 = (i5+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][12] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)this)->_3_1_1_1_i5);
		((P0 *)this)->_3_1_1_1_i5 = (((int)((P0 *)this)->_3_1_1_1_i5)+1);
#ifdef VAR_RANGES
		logval("time_advance:i5", ((int)((P0 *)this)->_3_1_1_1_i5));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 97: // STATE 19 - TTAStartup_5Nodes.pml:245 - [(empty_cal)] (0:0:0 - 1)
		IfNotBlocked
		reached[0][19] = 1;
		if (!(((int)now.empty_cal)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 98: // STATE 20 - TTAStartup_5Nodes.pml:224 - [i1 = 0] (0:33:3 - 1)
		IfNotBlocked
		reached[0][20] = 1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = ((int)((P0 *)this)->_3_1_1_2_i1);
		((P0 *)this)->_3_1_1_2_i1 = 0;
#ifdef VAR_RANGES
		logval("time_advance:i1", ((int)((P0 *)this)->_3_1_1_2_i1));
#endif
		;
		/* merge: min_timeout = time_out[0](33, 21, 33) */
		reached[0][21] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.min_timeout);
		now.min_timeout = ((int)now.time_out[0]);
#ifdef VAR_RANGES
		logval("min_timeout", ((int)now.min_timeout));
#endif
		;
		/* merge: i1 = 1(33, 22, 33) */
		reached[0][22] = 1;
		(trpt+1)->bup.ovals[2] = ((int)((P0 *)this)->_3_1_1_2_i1);
		((P0 *)this)->_3_1_1_2_i1 = 1;
#ifdef VAR_RANGES
		logval("time_advance:i1", ((int)((P0 *)this)->_3_1_1_2_i1));
#endif
		;
		/* merge: .(goto)(0, 34, 33) */
		reached[0][34] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 99: // STATE 23 - TTAStartup_5Nodes.pml:227 - [((i1==5))] (0:0:1 - 1)
		IfNotBlocked
		reached[0][23] = 1;
		if (!((((int)((P0 *)this)->_3_1_1_2_i1)==5)))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: _3_1_1_2_i1 */  (trpt+1)->bup.oval = ((P0 *)this)->_3_1_1_2_i1;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)this)->_3_1_1_2_i1 = 0;
		_m = 3; goto P999; /* 0 */
	case 100: // STATE 26 - TTAStartup_5Nodes.pml:231 - [((min_timeout>time_out[i1]))] (33:0:2 - 1)
		IfNotBlocked
		reached[0][26] = 1;
		if (!((((int)now.min_timeout)>((int)now.time_out[ Index(((int)((P0 *)this)->_3_1_1_2_i1), 5) ]))))
			continue;
		/* merge: min_timeout = time_out[i1](33, 27, 33) */
		reached[0][27] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)now.min_timeout);
		now.min_timeout = ((int)now.time_out[ Index(((int)((P0 *)this)->_3_1_1_2_i1), 5) ]);
#ifdef VAR_RANGES
		logval("min_timeout", ((int)now.min_timeout));
#endif
		;
		/* merge: i1 = (i1+1)(33, 28, 33) */
		reached[0][28] = 1;
		(trpt+1)->bup.ovals[1] = ((int)((P0 *)this)->_3_1_1_2_i1);
		((P0 *)this)->_3_1_1_2_i1 = (((int)((P0 *)this)->_3_1_1_2_i1)+1);
#ifdef VAR_RANGES
		logval("time_advance:i1", ((int)((P0 *)this)->_3_1_1_2_i1));
#endif
		;
		/* merge: .(goto)(0, 32, 33) */
		reached[0][32] = 1;
		;
		/* merge: .(goto)(0, 34, 33) */
		reached[0][34] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 101: // STATE 30 - TTAStartup_5Nodes.pml:235 - [i1 = (i1+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][30] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)this)->_3_1_1_2_i1);
		((P0 *)this)->_3_1_1_2_i1 = (((int)((P0 *)this)->_3_1_1_2_i1)+1);
#ifdef VAR_RANGES
		logval("time_advance:i1", ((int)((P0 *)this)->_3_1_1_2_i1));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 102: // STATE 37 - TTAStartup_5Nodes.pml:248 - [((min_timeout>0))] (150:0:1 - 1)
		IfNotBlocked
		reached[0][37] = 1;
		if (!((((int)now.min_timeout)>0)))
			continue;
		/* merge: time_can_advance = 1(150, 38, 150) */
		reached[0][38] = 1;
		(trpt+1)->bup.oval = ((int)now.time_can_advance);
		now.time_can_advance = 1;
#ifdef VAR_RANGES
		logval("time_can_advance", ((int)now.time_can_advance));
#endif
		;
		/* merge: .(goto)(150, 42, 150) */
		reached[0][42] = 1;
		;
		/* merge: .(goto)(150, 70, 150) */
		reached[0][70] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 103: // STATE 42 - TTAStartup_5Nodes.pml:253 - [.(goto)] (0:150:0 - 2)
		IfNotBlocked
		reached[0][42] = 1;
		;
		/* merge: .(goto)(150, 70, 150) */
		reached[0][70] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 104: // STATE 40 - TTAStartup_5Nodes.pml:251 - [time_can_advance = 0] (0:150:1 - 1)
		IfNotBlocked
		reached[0][40] = 1;
		(trpt+1)->bup.oval = ((int)now.time_can_advance);
		now.time_can_advance = 0;
#ifdef VAR_RANGES
		logval("time_can_advance", ((int)now.time_can_advance));
#endif
		;
		/* merge: .(goto)(150, 42, 150) */
		reached[0][42] = 1;
		;
		/* merge: .(goto)(150, 70, 150) */
		reached[0][70] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 105: // STATE 70 - TTAStartup_5Nodes.pml:263 - [.(goto)] (0:150:0 - 2)
		IfNotBlocked
		reached[0][70] = 1;
		;
		_m = 3; goto P999; /* 0 */
	case 106: // STATE 44 - TTAStartup_5Nodes.pml:224 - [i1 = 0] (0:57:3 - 1)
		IfNotBlocked
		reached[0][44] = 1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = ((int)((P0 *)this)->_3_1_1_3_i1);
		((P0 *)this)->_3_1_1_3_i1 = 0;
#ifdef VAR_RANGES
		logval("time_advance:i1", ((int)((P0 *)this)->_3_1_1_3_i1));
#endif
		;
		/* merge: min_timeout = time_out[0](57, 45, 57) */
		reached[0][45] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.min_timeout);
		now.min_timeout = ((int)now.time_out[0]);
#ifdef VAR_RANGES
		logval("min_timeout", ((int)now.min_timeout));
#endif
		;
		/* merge: i1 = 1(57, 46, 57) */
		reached[0][46] = 1;
		(trpt+1)->bup.ovals[2] = ((int)((P0 *)this)->_3_1_1_3_i1);
		((P0 *)this)->_3_1_1_3_i1 = 1;
#ifdef VAR_RANGES
		logval("time_advance:i1", ((int)((P0 *)this)->_3_1_1_3_i1));
#endif
		;
		/* merge: .(goto)(0, 58, 57) */
		reached[0][58] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 107: // STATE 47 - TTAStartup_5Nodes.pml:227 - [((i1==5))] (0:0:1 - 1)
		IfNotBlocked
		reached[0][47] = 1;
		if (!((((int)((P0 *)this)->_3_1_1_3_i1)==5)))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: _3_1_1_3_i1 */  (trpt+1)->bup.oval = ((P0 *)this)->_3_1_1_3_i1;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)this)->_3_1_1_3_i1 = 0;
		_m = 3; goto P999; /* 0 */
	case 108: // STATE 50 - TTAStartup_5Nodes.pml:231 - [((min_timeout>time_out[i1]))] (57:0:2 - 1)
		IfNotBlocked
		reached[0][50] = 1;
		if (!((((int)now.min_timeout)>((int)now.time_out[ Index(((int)((P0 *)this)->_3_1_1_3_i1), 5) ]))))
			continue;
		/* merge: min_timeout = time_out[i1](57, 51, 57) */
		reached[0][51] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)now.min_timeout);
		now.min_timeout = ((int)now.time_out[ Index(((int)((P0 *)this)->_3_1_1_3_i1), 5) ]);
#ifdef VAR_RANGES
		logval("min_timeout", ((int)now.min_timeout));
#endif
		;
		/* merge: i1 = (i1+1)(57, 52, 57) */
		reached[0][52] = 1;
		(trpt+1)->bup.ovals[1] = ((int)((P0 *)this)->_3_1_1_3_i1);
		((P0 *)this)->_3_1_1_3_i1 = (((int)((P0 *)this)->_3_1_1_3_i1)+1);
#ifdef VAR_RANGES
		logval("time_advance:i1", ((int)((P0 *)this)->_3_1_1_3_i1));
#endif
		;
		/* merge: .(goto)(0, 56, 57) */
		reached[0][56] = 1;
		;
		/* merge: .(goto)(0, 58, 57) */
		reached[0][58] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 109: // STATE 54 - TTAStartup_5Nodes.pml:235 - [i1 = (i1+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][54] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)this)->_3_1_1_3_i1);
		((P0 *)this)->_3_1_1_3_i1 = (((int)((P0 *)this)->_3_1_1_3_i1)+1);
#ifdef VAR_RANGES
		logval("time_advance:i1", ((int)((P0 *)this)->_3_1_1_3_i1));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 110: // STATE 61 - TTAStartup_5Nodes.pml:196 - [first_event = cal.delivery] (0:0:1 - 1)
		IfNotBlocked
		reached[0][61] = 1;
		(trpt+1)->bup.oval = ((int)now.first_event);
		now.first_event = ((int)now.cal.delivery);
#ifdef VAR_RANGES
		logval("first_event", ((int)now.first_event));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 111: // STATE 63 - TTAStartup_5Nodes.pml:257 - [((((min_timeout>0)&&(first_event>0))&&(first_event!=10000)))] (150:0:1 - 1)
		IfNotBlocked
		reached[0][63] = 1;
		if (!((((((int)now.min_timeout)>0)&&(((int)now.first_event)>0))&&(((int)now.first_event)!=10000))))
			continue;
		/* merge: time_can_advance = 1(150, 64, 150) */
		reached[0][64] = 1;
		(trpt+1)->bup.oval = ((int)now.time_can_advance);
		now.time_can_advance = 1;
#ifdef VAR_RANGES
		logval("time_can_advance", ((int)now.time_can_advance));
#endif
		;
		/* merge: .(goto)(150, 68, 150) */
		reached[0][68] = 1;
		;
		/* merge: .(goto)(150, 70, 150) */
		reached[0][70] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 112: // STATE 68 - TTAStartup_5Nodes.pml:262 - [.(goto)] (0:150:0 - 2)
		IfNotBlocked
		reached[0][68] = 1;
		;
		/* merge: .(goto)(150, 70, 150) */
		reached[0][70] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 113: // STATE 65 - TTAStartup_5Nodes.pml:259 - [(((min_timeout==0)||(first_event==0)))] (150:0:1 - 1)
		IfNotBlocked
		reached[0][65] = 1;
		if (!(((((int)now.min_timeout)==0)||(((int)now.first_event)==0))))
			continue;
		/* merge: time_can_advance = 0(150, 66, 150) */
		reached[0][66] = 1;
		(trpt+1)->bup.oval = ((int)now.time_can_advance);
		now.time_can_advance = 0;
#ifdef VAR_RANGES
		logval("time_can_advance", ((int)now.time_can_advance));
#endif
		;
		/* merge: .(goto)(150, 68, 150) */
		reached[0][68] = 1;
		;
		/* merge: .(goto)(150, 70, 150) */
		reached[0][70] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 114: // STATE 73 - TTAStartup_5Nodes.pml:273 - [(time_can_advance)] (0:0:0 - 1)
		IfNotBlocked
		reached[0][73] = 1;
		if (!(((int)now.time_can_advance)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 115: // STATE 74 - TTAStartup_5Nodes.pml:60 - [i5 = 0] (0:87:2 - 1)
		IfNotBlocked
		reached[0][74] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)((P0 *)this)->_3_2_2_i5);
		((P0 *)this)->_3_2_2_i5 = 0;
#ifdef VAR_RANGES
		logval("time_advance:i5", ((int)((P0 *)this)->_3_2_2_i5));
#endif
		;
		/* merge: i5 = 0(87, 75, 87) */
		reached[0][75] = 1;
		(trpt+1)->bup.ovals[1] = ((int)((P0 *)this)->_3_2_2_i5);
		((P0 *)this)->_3_2_2_i5 = 0;
#ifdef VAR_RANGES
		logval("time_advance:i5", ((int)((P0 *)this)->_3_2_2_i5));
#endif
		;
		/* merge: .(goto)(0, 88, 87) */
		reached[0][88] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 116: // STATE 76 - TTAStartup_5Nodes.pml:62 - [((i5==5))] (107:0:2 - 1)
		IfNotBlocked
		reached[0][76] = 1;
		if (!((((int)((P0 *)this)->_3_2_2_i5)==5)))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: _3_2_2_i5 */  (trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P0 *)this)->_3_2_2_i5;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)this)->_3_2_2_i5 = 0;
		/* merge: empty_cal = 1(0, 77, 107) */
		reached[0][77] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.empty_cal);
		now.empty_cal = 1;
#ifdef VAR_RANGES
		logval("empty_cal", ((int)now.empty_cal));
#endif
		;
		/* merge: goto :b4(0, 78, 107) */
		reached[0][78] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 117: // STATE 79 - TTAStartup_5Nodes.pml:65 - [((i5!=5))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][79] = 1;
		if (!((((int)((P0 *)this)->_3_2_2_i5)!=5)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 118: // STATE 80 - TTAStartup_5Nodes.pml:67 - [((cal.flag[i5]==1))] (107:0:2 - 1)
		IfNotBlocked
		reached[0][80] = 1;
		if (!((((int)now.cal.flag[ Index(((int)((P0 *)this)->_3_2_2_i5), 5) ])==1)))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: _3_2_2_i5 */  (trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P0 *)this)->_3_2_2_i5;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)this)->_3_2_2_i5 = 0;
		/* merge: empty_cal = 0(0, 81, 107) */
		reached[0][81] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.empty_cal);
		now.empty_cal = 0;
#ifdef VAR_RANGES
		logval("empty_cal", ((int)now.empty_cal));
#endif
		;
		/* merge: goto :b4(0, 82, 107) */
		reached[0][82] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 119: // STATE 84 - TTAStartup_5Nodes.pml:71 - [i5 = (i5+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][84] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)this)->_3_2_2_i5);
		((P0 *)this)->_3_2_2_i5 = (((int)((P0 *)this)->_3_2_2_i5)+1);
#ifdef VAR_RANGES
		logval("time_advance:i5", ((int)((P0 *)this)->_3_2_2_i5));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 120: // STATE 91 - TTAStartup_5Nodes.pml:224 - [i1 = 0] (0:104:3 - 1)
		IfNotBlocked
		reached[0][91] = 1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = ((int)((P0 *)this)->_3_2_3_i1);
		((P0 *)this)->_3_2_3_i1 = 0;
#ifdef VAR_RANGES
		logval("time_advance:i1", ((int)((P0 *)this)->_3_2_3_i1));
#endif
		;
		/* merge: min_timeout = time_out[0](104, 92, 104) */
		reached[0][92] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.min_timeout);
		now.min_timeout = ((int)now.time_out[0]);
#ifdef VAR_RANGES
		logval("min_timeout", ((int)now.min_timeout));
#endif
		;
		/* merge: i1 = 1(104, 93, 104) */
		reached[0][93] = 1;
		(trpt+1)->bup.ovals[2] = ((int)((P0 *)this)->_3_2_3_i1);
		((P0 *)this)->_3_2_3_i1 = 1;
#ifdef VAR_RANGES
		logval("time_advance:i1", ((int)((P0 *)this)->_3_2_3_i1));
#endif
		;
		/* merge: .(goto)(0, 105, 104) */
		reached[0][105] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 121: // STATE 94 - TTAStartup_5Nodes.pml:227 - [((i1==5))] (0:0:1 - 1)
		IfNotBlocked
		reached[0][94] = 1;
		if (!((((int)((P0 *)this)->_3_2_3_i1)==5)))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: _3_2_3_i1 */  (trpt+1)->bup.oval = ((P0 *)this)->_3_2_3_i1;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)this)->_3_2_3_i1 = 0;
		_m = 3; goto P999; /* 0 */
	case 122: // STATE 97 - TTAStartup_5Nodes.pml:231 - [((min_timeout>time_out[i1]))] (104:0:2 - 1)
		IfNotBlocked
		reached[0][97] = 1;
		if (!((((int)now.min_timeout)>((int)now.time_out[ Index(((int)((P0 *)this)->_3_2_3_i1), 5) ]))))
			continue;
		/* merge: min_timeout = time_out[i1](104, 98, 104) */
		reached[0][98] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)now.min_timeout);
		now.min_timeout = ((int)now.time_out[ Index(((int)((P0 *)this)->_3_2_3_i1), 5) ]);
#ifdef VAR_RANGES
		logval("min_timeout", ((int)now.min_timeout));
#endif
		;
		/* merge: i1 = (i1+1)(104, 99, 104) */
		reached[0][99] = 1;
		(trpt+1)->bup.ovals[1] = ((int)((P0 *)this)->_3_2_3_i1);
		((P0 *)this)->_3_2_3_i1 = (((int)((P0 *)this)->_3_2_3_i1)+1);
#ifdef VAR_RANGES
		logval("time_advance:i1", ((int)((P0 *)this)->_3_2_3_i1));
#endif
		;
		/* merge: .(goto)(0, 103, 104) */
		reached[0][103] = 1;
		;
		/* merge: .(goto)(0, 105, 104) */
		reached[0][105] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 123: // STATE 101 - TTAStartup_5Nodes.pml:235 - [i1 = (i1+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][101] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)this)->_3_2_3_i1);
		((P0 *)this)->_3_2_3_i1 = (((int)((P0 *)this)->_3_2_3_i1)+1);
#ifdef VAR_RANGES
		logval("time_advance:i1", ((int)((P0 *)this)->_3_2_3_i1));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 124: // STATE 108 - TTAStartup_5Nodes.pml:278 - [(empty_cal)] (115:0:1 - 1)
		IfNotBlocked
		reached[0][108] = 1;
		if (!(((int)now.empty_cal)))
			continue;
		/* merge: count = 0(0, 109, 115) */
		reached[0][109] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)this)->count);
		((P0 *)this)->count = 0;
#ifdef VAR_RANGES
		logval("time_advance:count", ((int)((P0 *)this)->count));
#endif
		;
		/* merge: .(goto)(0, 116, 115) */
		reached[0][116] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 125: // STATE 110 - TTAStartup_5Nodes.pml:281 - [((count<5))] (115:0:2 - 1)
		IfNotBlocked
		reached[0][110] = 1;
		if (!((((int)((P0 *)this)->count)<5)))
			continue;
		/* merge: time_out[count] = (time_out[count]-min_timeout)(115, 111, 115) */
		reached[0][111] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)now.time_out[ Index(((int)((P0 *)this)->count), 5) ]);
		now.time_out[ Index(((P0 *)this)->count, 5) ] = (((int)now.time_out[ Index(((int)((P0 *)this)->count), 5) ])-((int)now.min_timeout));
#ifdef VAR_RANGES
		logval("time_out[time_advance:count]", ((int)now.time_out[ Index(((int)((P0 *)this)->count), 5) ]));
#endif
		;
		/* merge: count = (count+1)(115, 112, 115) */
		reached[0][112] = 1;
		(trpt+1)->bup.ovals[1] = ((int)((P0 *)this)->count);
		((P0 *)this)->count = (((int)((P0 *)this)->count)+1);
#ifdef VAR_RANGES
		logval("time_advance:count", ((int)((P0 *)this)->count));
#endif
		;
		/* merge: .(goto)(0, 116, 115) */
		reached[0][116] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 126: // STATE 113 - TTAStartup_5Nodes.pml:284 - [((count==5))] (0:0:1 - 1)
		IfNotBlocked
		reached[0][113] = 1;
		if (!((((int)((P0 *)this)->count)==5)))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: count */  (trpt+1)->bup.oval = ((P0 *)this)->count;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)this)->count = 0;
		_m = 3; goto P999; /* 0 */
	case 127: // STATE 147 - TTAStartup_5Nodes.pml:313 - [.(goto)] (0:152:0 - 2)
		IfNotBlocked
		reached[0][147] = 1;
		;
		/* merge: .(goto)(0, 151, 152) */
		reached[0][151] = 1;
		;
		/* merge: .(goto)(0, 153, 152) */
		reached[0][153] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 128: // STATE 119 - TTAStartup_5Nodes.pml:196 - [first_event = cal.delivery] (0:0:1 - 1)
		IfNotBlocked
		reached[0][119] = 1;
		(trpt+1)->bup.oval = ((int)now.first_event);
		now.first_event = ((int)now.cal.delivery);
#ifdef VAR_RANGES
		logval("first_event", ((int)now.first_event));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 129: // STATE 121 - TTAStartup_5Nodes.pml:290 - [((first_event<=min_timeout))] (128:0:1 - 1)
		IfNotBlocked
		reached[0][121] = 1;
		if (!((((int)now.first_event)<=((int)now.min_timeout))))
			continue;
		/* merge: count = 0(0, 122, 128) */
		reached[0][122] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)this)->count);
		((P0 *)this)->count = 0;
#ifdef VAR_RANGES
		logval("time_advance:count", ((int)((P0 *)this)->count));
#endif
		;
		/* merge: .(goto)(0, 129, 128) */
		reached[0][129] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 130: // STATE 123 - TTAStartup_5Nodes.pml:293 - [((count<5))] (128:0:2 - 1)
		IfNotBlocked
		reached[0][123] = 1;
		if (!((((int)((P0 *)this)->count)<5)))
			continue;
		/* merge: time_out[count] = (time_out[count]-first_event)(128, 124, 128) */
		reached[0][124] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)now.time_out[ Index(((int)((P0 *)this)->count), 5) ]);
		now.time_out[ Index(((P0 *)this)->count, 5) ] = (((int)now.time_out[ Index(((int)((P0 *)this)->count), 5) ])-((int)now.first_event));
#ifdef VAR_RANGES
		logval("time_out[time_advance:count]", ((int)now.time_out[ Index(((int)((P0 *)this)->count), 5) ]));
#endif
		;
		/* merge: count = (count+1)(128, 125, 128) */
		reached[0][125] = 1;
		(trpt+1)->bup.ovals[1] = ((int)((P0 *)this)->count);
		((P0 *)this)->count = (((int)((P0 *)this)->count)+1);
#ifdef VAR_RANGES
		logval("time_advance:count", ((int)((P0 *)this)->count));
#endif
		;
		/* merge: .(goto)(0, 129, 128) */
		reached[0][129] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 131: // STATE 126 - TTAStartup_5Nodes.pml:296 - [((count==5))] (152:0:3 - 1)
		IfNotBlocked
		reached[0][126] = 1;
		if (!((((int)((P0 *)this)->count)==5)))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: count */  (trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = ((P0 *)this)->count;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)this)->count = 0;
		/* merge: goto :b7(152, 127, 152) */
		reached[0][127] = 1;
		;
		/* merge: cal.delivery = 0(152, 131, 152) */
		reached[0][131] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.cal.delivery);
		now.cal.delivery = 0;
#ifdef VAR_RANGES
		logval("cal.delivery", ((int)now.cal.delivery));
#endif
		;
		/* merge: event_time = 0(152, 132, 152) */
		reached[0][132] = 1;
		(trpt+1)->bup.ovals[2] = ((int)event_time);
		event_time = 0;
#ifdef VAR_RANGES
		logval("event_time", ((int)event_time));
#endif
		;
		/* merge: .(goto)(152, 145, 152) */
		reached[0][145] = 1;
		;
		/* merge: .(goto)(152, 147, 152) */
		reached[0][147] = 1;
		;
		/* merge: .(goto)(0, 151, 152) */
		reached[0][151] = 1;
		;
		/* merge: .(goto)(0, 153, 152) */
		reached[0][153] = 1;
		;
		_m = 3; goto P999; /* 7 */
	case 132: // STATE 131 - TTAStartup_5Nodes.pml:299 - [cal.delivery = 0] (0:152:2 - 3)
		IfNotBlocked
		reached[0][131] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)now.cal.delivery);
		now.cal.delivery = 0;
#ifdef VAR_RANGES
		logval("cal.delivery", ((int)now.cal.delivery));
#endif
		;
		/* merge: event_time = 0(152, 132, 152) */
		reached[0][132] = 1;
		(trpt+1)->bup.ovals[1] = ((int)event_time);
		event_time = 0;
#ifdef VAR_RANGES
		logval("event_time", ((int)event_time));
#endif
		;
		/* merge: .(goto)(152, 145, 152) */
		reached[0][145] = 1;
		;
		/* merge: .(goto)(152, 147, 152) */
		reached[0][147] = 1;
		;
		/* merge: .(goto)(0, 151, 152) */
		reached[0][151] = 1;
		;
		/* merge: .(goto)(0, 153, 152) */
		reached[0][153] = 1;
		;
		_m = 3; goto P999; /* 5 */
	case 133: // STATE 145 - TTAStartup_5Nodes.pml:312 - [.(goto)] (0:152:0 - 2)
		IfNotBlocked
		reached[0][145] = 1;
		;
		/* merge: .(goto)(152, 147, 152) */
		reached[0][147] = 1;
		;
		/* merge: .(goto)(0, 151, 152) */
		reached[0][151] = 1;
		;
		/* merge: .(goto)(0, 153, 152) */
		reached[0][153] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 134: // STATE 134 - TTAStartup_5Nodes.pml:302 - [count = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[0][134] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)this)->count);
		((P0 *)this)->count = 0;
#ifdef VAR_RANGES
		logval("time_advance:count", ((int)((P0 *)this)->count));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 135: // STATE 135 - TTAStartup_5Nodes.pml:304 - [((count<5))] (140:0:2 - 1)
		IfNotBlocked
		reached[0][135] = 1;
		if (!((((int)((P0 *)this)->count)<5)))
			continue;
		/* merge: time_out[count] = (time_out[count]-min_timeout)(140, 136, 140) */
		reached[0][136] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)now.time_out[ Index(((int)((P0 *)this)->count), 5) ]);
		now.time_out[ Index(((P0 *)this)->count, 5) ] = (((int)now.time_out[ Index(((int)((P0 *)this)->count), 5) ])-((int)now.min_timeout));
#ifdef VAR_RANGES
		logval("time_out[time_advance:count]", ((int)now.time_out[ Index(((int)((P0 *)this)->count), 5) ]));
#endif
		;
		/* merge: count = (count+1)(140, 137, 140) */
		reached[0][137] = 1;
		(trpt+1)->bup.ovals[1] = ((int)((P0 *)this)->count);
		((P0 *)this)->count = (((int)((P0 *)this)->count)+1);
#ifdef VAR_RANGES
		logval("time_advance:count", ((int)((P0 *)this)->count));
#endif
		;
		/* merge: .(goto)(0, 141, 140) */
		reached[0][141] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 136: // STATE 138 - TTAStartup_5Nodes.pml:307 - [((count==5))] (152:0:2 - 1)
		IfNotBlocked
		reached[0][138] = 1;
		if (!((((int)((P0 *)this)->count)==5)))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: count */  (trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P0 *)this)->count;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)this)->count = 0;
		/* merge: goto :b8(152, 139, 152) */
		reached[0][139] = 1;
		;
		/* merge: cal.delivery = (cal.delivery-min_timeout)(152, 143, 152) */
		reached[0][143] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.cal.delivery);
		now.cal.delivery = (((int)now.cal.delivery)-((int)now.min_timeout));
#ifdef VAR_RANGES
		logval("cal.delivery", ((int)now.cal.delivery));
#endif
		;
		/* merge: .(goto)(152, 145, 152) */
		reached[0][145] = 1;
		;
		/* merge: .(goto)(152, 147, 152) */
		reached[0][147] = 1;
		;
		/* merge: .(goto)(0, 151, 152) */
		reached[0][151] = 1;
		;
		/* merge: .(goto)(0, 153, 152) */
		reached[0][153] = 1;
		;
		_m = 3; goto P999; /* 6 */
	case 137: // STATE 143 - TTAStartup_5Nodes.pml:310 - [cal.delivery = (cal.delivery-min_timeout)] (0:152:1 - 3)
		IfNotBlocked
		reached[0][143] = 1;
		(trpt+1)->bup.oval = ((int)now.cal.delivery);
		now.cal.delivery = (((int)now.cal.delivery)-((int)now.min_timeout));
#ifdef VAR_RANGES
		logval("cal.delivery", ((int)now.cal.delivery));
#endif
		;
		/* merge: .(goto)(152, 145, 152) */
		reached[0][145] = 1;
		;
		/* merge: .(goto)(152, 147, 152) */
		reached[0][147] = 1;
		;
		/* merge: .(goto)(0, 151, 152) */
		reached[0][151] = 1;
		;
		/* merge: .(goto)(0, 153, 152) */
		reached[0][153] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 138: // STATE 155 - TTAStartup_5Nodes.pml:317 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[0][155] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */
	case  _T5:	/* np_ */
		if (!((!(trpt->o_pm&4) && !(trpt->tau&128))))
			continue;
		/* else fall through */
	case  _T2:	/* true */
		_m = 3; goto P999;
#undef rand
	}

