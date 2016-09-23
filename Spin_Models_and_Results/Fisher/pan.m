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

		 /* PROC :init: */
	case 3: // STATE 1 - fischer:151 - [in_critical = 0] (0:3:2 - 1)
		IfNotBlocked
		reached[2][1] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)in_critical);
		in_critical = 0;
#ifdef VAR_RANGES
		logval("in_critical", ((int)in_critical));
#endif
		;
		/* merge: lock = 165(3, 2, 3) */
		reached[2][2] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.lock);
		now.lock = 165;
#ifdef VAR_RANGES
		logval("lock", ((int)now.lock));
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 4: // STATE 3 - fischer:153 - [(run time_progress())] (0:0:0 - 1)
		IfNotBlocked
		reached[2][3] = 1;
		if (!(addproc(II, 1, 1, 0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 5: // STATE 4 - fischer:155 - [((i<165))] (6:0:1 - 1)
		IfNotBlocked
		reached[2][4] = 1;
		if (!((((int)((P2 *)this)->i)<165)))
			continue;
		/* merge: node[i].pc = sleeping(0, 5, 6) */
		reached[2][5] = 1;
		(trpt+1)->bup.oval = now.node[ Index(((int)((P2 *)this)->i), 165) ].pc;
		now.node[ Index(((P2 *)this)->i, 165) ].pc = 1;
#ifdef VAR_RANGES
		logval("node[:init::i].pc", now.node[ Index(((int)((P2 *)this)->i), 165) ].pc);
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 6: // STATE 6 - fischer:157 - [(run process(i))] (0:0:0 - 1)
		IfNotBlocked
		reached[2][6] = 1;
		if (!(addproc(II, 1, 0, ((int)((P2 *)this)->i))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 7: // STATE 7 - fischer:158 - [i = (i+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[2][7] = 1;
		(trpt+1)->bup.oval = ((int)((P2 *)this)->i);
		((P2 *)this)->i = (((int)((P2 *)this)->i)+1);
#ifdef VAR_RANGES
		logval(":init::i", ((int)((P2 *)this)->i));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 8: // STATE 8 - fischer:159 - [((i==165))] (12:0:1 - 1)
		IfNotBlocked
		reached[2][8] = 1;
		if (!((((int)((P2 *)this)->i)==165)))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: i */  (trpt+1)->bup.oval = ((P2 *)this)->i;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P2 *)this)->i = 0;
		/* merge: goto :b10(0, 9, 12) */
		reached[2][9] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 9: // STATE 14 - fischer:163 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[2][14] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC time_progress */
	case 10: // STATE 1 - fischer:99 - [(timeout)] (0:0:0 - 1)
		IfNotBlocked
		reached[1][1] = 1;
		if (!(((trpt->tau)&1)))
			continue;
		_m = 1; goto P999; /* 0 */
	case 11: // STATE 2 - fischer:102 - [min_timeout = node[0].time_out] (0:13:2 - 1)
		IfNotBlocked
		reached[1][2] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)((P1 *)this)->min_timeout);
		((P1 *)this)->min_timeout = ((int)now.node[0].time_out);
#ifdef VAR_RANGES
		logval("time_progress:min_timeout", ((int)((P1 *)this)->min_timeout));
#endif
		;
		/* merge: count = 1(13, 3, 13) */
		reached[1][3] = 1;
		(trpt+1)->bup.ovals[1] = ((int)((P1 *)this)->count);
		((P1 *)this)->count = 1;
#ifdef VAR_RANGES
		logval("time_progress:count", ((int)((P1 *)this)->count));
#endif
		;
		/* merge: .(goto)(0, 14, 13) */
		reached[1][14] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 12: // STATE 4 - fischer:105 - [((count<165))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][4] = 1;
		if (!((((int)((P1 *)this)->count)<165)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 13: // STATE 5 - fischer:107 - [((min_timeout>node[count].time_out))] (13:0:3 - 1)
		IfNotBlocked
		reached[1][5] = 1;
		if (!((((int)((P1 *)this)->min_timeout)>((int)now.node[ Index(((int)((P1 *)this)->count), 165) ].time_out))))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: min_timeout */  (trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = ((P1 *)this)->min_timeout;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P1 *)this)->min_timeout = 0;
		/* merge: min_timeout = node[count].time_out(13, 6, 13) */
		reached[1][6] = 1;
		(trpt+1)->bup.ovals[1] = ((int)((P1 *)this)->min_timeout);
		((P1 *)this)->min_timeout = ((int)now.node[ Index(((int)((P1 *)this)->count), 165) ].time_out);
#ifdef VAR_RANGES
		logval("time_progress:min_timeout", ((int)((P1 *)this)->min_timeout));
#endif
		;
		/* merge: .(goto)(13, 9, 13) */
		reached[1][9] = 1;
		;
		/* merge: count = (count+1)(13, 10, 13) */
		reached[1][10] = 1;
		(trpt+1)->bup.ovals[2] = ((int)((P1 *)this)->count);
		((P1 *)this)->count = (((int)((P1 *)this)->count)+1);
#ifdef VAR_RANGES
		logval("time_progress:count", ((int)((P1 *)this)->count));
#endif
		;
		/* merge: .(goto)(0, 14, 13) */
		reached[1][14] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 14: // STATE 10 - fischer:111 - [count = (count+1)] (0:13:1 - 3)
		IfNotBlocked
		reached[1][10] = 1;
		(trpt+1)->bup.oval = ((int)((P1 *)this)->count);
		((P1 *)this)->count = (((int)((P1 *)this)->count)+1);
#ifdef VAR_RANGES
		logval("time_progress:count", ((int)((P1 *)this)->count));
#endif
		;
		/* merge: .(goto)(0, 14, 13) */
		reached[1][14] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 15: // STATE 11 - fischer:112 - [((count==165))] (22:0:2 - 1)
		IfNotBlocked
		reached[1][11] = 1;
		if (!((((int)((P1 *)this)->count)==165)))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: count */  (trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P1 *)this)->count;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P1 *)this)->count = 0;
		/* merge: goto :b8(22, 12, 22) */
		reached[1][12] = 1;
		;
		/* merge: count = 0(22, 16, 22) */
		reached[1][16] = 1;
		(trpt+1)->bup.ovals[1] = ((int)((P1 *)this)->count);
		((P1 *)this)->count = 0;
#ifdef VAR_RANGES
		logval("time_progress:count", ((int)((P1 *)this)->count));
#endif
		;
		/* merge: .(goto)(0, 23, 22) */
		reached[1][23] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 16: // STATE 16 - fischer:115 - [count = 0] (0:22:1 - 3)
		IfNotBlocked
		reached[1][16] = 1;
		(trpt+1)->bup.oval = ((int)((P1 *)this)->count);
		((P1 *)this)->count = 0;
#ifdef VAR_RANGES
		logval("time_progress:count", ((int)((P1 *)this)->count));
#endif
		;
		/* merge: .(goto)(0, 23, 22) */
		reached[1][23] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 17: // STATE 17 - fischer:117 - [((count<165))] (22:0:2 - 1)
		IfNotBlocked
		reached[1][17] = 1;
		if (!((((int)((P1 *)this)->count)<165)))
			continue;
		/* merge: node[count].time_out = (node[count].time_out-min_timeout)(22, 18, 22) */
		reached[1][18] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)now.node[ Index(((int)((P1 *)this)->count), 165) ].time_out);
		now.node[ Index(((P1 *)this)->count, 165) ].time_out = (((int)now.node[ Index(((int)((P1 *)this)->count), 165) ].time_out)-((int)((P1 *)this)->min_timeout));
#ifdef VAR_RANGES
		logval("node[time_progress:count].time_out", ((int)now.node[ Index(((int)((P1 *)this)->count), 165) ].time_out));
#endif
		;
		/* merge: count = (count+1)(22, 19, 22) */
		reached[1][19] = 1;
		(trpt+1)->bup.ovals[1] = ((int)((P1 *)this)->count);
		((P1 *)this)->count = (((int)((P1 *)this)->count)+1);
#ifdef VAR_RANGES
		logval("time_progress:count", ((int)((P1 *)this)->count));
#endif
		;
		/* merge: .(goto)(0, 23, 22) */
		reached[1][23] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 18: // STATE 20 - fischer:120 - [((count==165))] (24:0:1 - 1)
		IfNotBlocked
		reached[1][20] = 1;
		if (!((((int)((P1 *)this)->count)==165)))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: count */  (trpt+1)->bup.oval = ((P1 *)this)->count;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P1 *)this)->count = 0;
		/* merge: goto :b9(0, 21, 24) */
		reached[1][21] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 19: // STATE 29 - fischer:125 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[1][29] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC process */
	case 20: // STATE 1 - fischer:23 - [random_timeout = (0+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][1] = 1;
		(trpt+1)->bup.oval = ((int)now.random_timeout);
		now.random_timeout = (0+1);
#ifdef VAR_RANGES
		logval("random_timeout", ((int)now.random_timeout));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 21: // STATE 2 - fischer:25 - [(((random_timeout>0)&&(random_timeout<165)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][2] = 1;
		if (!(((((int)now.random_timeout)>0)&&(((int)now.random_timeout)<165))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 22: // STATE 3 - fischer:26 - [random_timeout = (random_timeout+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][3] = 1;
		(trpt+1)->bup.oval = ((int)now.random_timeout);
		now.random_timeout = (((int)now.random_timeout)+1);
#ifdef VAR_RANGES
		logval("random_timeout", ((int)now.random_timeout));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 23: // STATE 4 - fischer:27 - [((random_timeout==165))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][4] = 1;
		if (!((((int)now.random_timeout)==165)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 24: // STATE 11 - fischer:45 - [node[nodeId].time_out = random_timeout] (0:0:1 - 4)
		IfNotBlocked
		reached[0][11] = 1;
		(trpt+1)->bup.oval = ((int)now.node[ Index(((int)((P0 *)this)->nodeId), 165) ].time_out);
		now.node[ Index(((P0 *)this)->nodeId, 165) ].time_out = ((int)now.random_timeout);
#ifdef VAR_RANGES
		logval("node[process:nodeId].time_out", ((int)now.node[ Index(((int)((P0 *)this)->nodeId), 165) ].time_out));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 25: // STATE 12 - fischer:47 - [(((node[nodeId].pc==sleeping)&&(node[nodeId].time_out==0)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][12] = 1;
		if (!(((now.node[ Index(((int)((P0 *)this)->nodeId), 165) ].pc==1)&&(((int)now.node[ Index(((int)((P0 *)this)->nodeId), 165) ].time_out)==0))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 26: // STATE 13 - fischer:51 - [((lock==165))] (24:0:1 - 1)
		IfNotBlocked
		reached[0][13] = 1;
		if (!((((int)now.lock)==165)))
			continue;
		/* merge: node[nodeId].pc = waiting(0, 14, 24) */
		reached[0][14] = 1;
		(trpt+1)->bup.oval = now.node[ Index(((int)((P0 *)this)->nodeId), 165) ].pc;
		now.node[ Index(((P0 *)this)->nodeId, 165) ].pc = 2;
#ifdef VAR_RANGES
		logval("node[process:nodeId].pc", now.node[ Index(((int)((P0 *)this)->nodeId), 165) ].pc);
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 27: // STATE 15 - fischer:23 - [random_timeout = (0+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][15] = 1;
		(trpt+1)->bup.oval = ((int)now.random_timeout);
		now.random_timeout = (0+1);
#ifdef VAR_RANGES
		logval("random_timeout", ((int)now.random_timeout));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 28: // STATE 16 - fischer:25 - [(((random_timeout>0)&&(random_timeout<1)))] (21:0:1 - 1)
		IfNotBlocked
		reached[0][16] = 1;
		if (!(((((int)now.random_timeout)>0)&&(((int)now.random_timeout)<1))))
			continue;
		/* merge: random_timeout = (random_timeout+1)(0, 17, 21) */
		reached[0][17] = 1;
		(trpt+1)->bup.oval = ((int)now.random_timeout);
		now.random_timeout = (((int)now.random_timeout)+1);
#ifdef VAR_RANGES
		logval("random_timeout", ((int)now.random_timeout));
#endif
		;
		/* merge: .(goto)(0, 22, 21) */
		reached[0][22] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 29: // STATE 18 - fischer:27 - [((random_timeout==1))] (93:0:1 - 1)
		IfNotBlocked
		reached[0][18] = 1;
		if (!((((int)now.random_timeout)==1)))
			continue;
		/* merge: goto :b2(93, 19, 93) */
		reached[0][19] = 1;
		;
		/* merge: node[nodeId].time_out = random_timeout(93, 25, 93) */
		reached[0][25] = 1;
		(trpt+1)->bup.oval = ((int)now.node[ Index(((int)((P0 *)this)->nodeId), 165) ].time_out);
		now.node[ Index(((P0 *)this)->nodeId, 165) ].time_out = ((int)now.random_timeout);
#ifdef VAR_RANGES
		logval("node[process:nodeId].time_out", ((int)now.node[ Index(((int)((P0 *)this)->nodeId), 165) ].time_out));
#endif
		;
		/* merge: .(goto)(93, 39, 93) */
		reached[0][39] = 1;
		;
		/* merge: .(goto)(0, 94, 93) */
		reached[0][94] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 30: // STATE 20 - fischer:29 - [goto :b2] (0:93:1 - 1)
		IfNotBlocked
		reached[0][20] = 1;
		;
		/* merge: node[nodeId].time_out = random_timeout(93, 25, 93) */
		reached[0][25] = 1;
		(trpt+1)->bup.oval = ((int)now.node[ Index(((int)((P0 *)this)->nodeId), 165) ].time_out);
		now.node[ Index(((P0 *)this)->nodeId, 165) ].time_out = ((int)now.random_timeout);
#ifdef VAR_RANGES
		logval("node[process:nodeId].time_out", ((int)now.node[ Index(((int)((P0 *)this)->nodeId), 165) ].time_out));
#endif
		;
		/* merge: .(goto)(93, 39, 93) */
		reached[0][39] = 1;
		;
		/* merge: .(goto)(0, 94, 93) */
		reached[0][94] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 31: // STATE 25 - fischer:54 - [node[nodeId].time_out = random_timeout] (0:93:1 - 4)
		IfNotBlocked
		reached[0][25] = 1;
		(trpt+1)->bup.oval = ((int)now.node[ Index(((int)((P0 *)this)->nodeId), 165) ].time_out);
		now.node[ Index(((P0 *)this)->nodeId, 165) ].time_out = ((int)now.random_timeout);
#ifdef VAR_RANGES
		logval("node[process:nodeId].time_out", ((int)now.node[ Index(((int)((P0 *)this)->nodeId), 165) ].time_out));
#endif
		;
		/* merge: .(goto)(93, 39, 93) */
		reached[0][39] = 1;
		;
		/* merge: .(goto)(0, 94, 93) */
		reached[0][94] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 32: // STATE 39 - fischer:59 - [.(goto)] (0:93:0 - 2)
		IfNotBlocked
		reached[0][39] = 1;
		;
		/* merge: .(goto)(0, 94, 93) */
		reached[0][94] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 33: // STATE 27 - fischer:23 - [random_timeout = (0+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][27] = 1;
		(trpt+1)->bup.oval = ((int)now.random_timeout);
		now.random_timeout = (0+1);
#ifdef VAR_RANGES
		logval("random_timeout", ((int)now.random_timeout));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 34: // STATE 28 - fischer:25 - [(((random_timeout>0)&&(random_timeout<165)))] (33:0:1 - 1)
		IfNotBlocked
		reached[0][28] = 1;
		if (!(((((int)now.random_timeout)>0)&&(((int)now.random_timeout)<165))))
			continue;
		/* merge: random_timeout = (random_timeout+1)(0, 29, 33) */
		reached[0][29] = 1;
		(trpt+1)->bup.oval = ((int)now.random_timeout);
		now.random_timeout = (((int)now.random_timeout)+1);
#ifdef VAR_RANGES
		logval("random_timeout", ((int)now.random_timeout));
#endif
		;
		/* merge: .(goto)(0, 34, 33) */
		reached[0][34] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 35: // STATE 30 - fischer:27 - [((random_timeout==165))] (93:0:1 - 1)
		IfNotBlocked
		reached[0][30] = 1;
		if (!((((int)now.random_timeout)==165)))
			continue;
		/* merge: goto :b3(93, 31, 93) */
		reached[0][31] = 1;
		;
		/* merge: node[nodeId].time_out = random_timeout(93, 37, 93) */
		reached[0][37] = 1;
		(trpt+1)->bup.oval = ((int)now.node[ Index(((int)((P0 *)this)->nodeId), 165) ].time_out);
		now.node[ Index(((P0 *)this)->nodeId, 165) ].time_out = ((int)now.random_timeout);
#ifdef VAR_RANGES
		logval("node[process:nodeId].time_out", ((int)now.node[ Index(((int)((P0 *)this)->nodeId), 165) ].time_out));
#endif
		;
		/* merge: .(goto)(93, 39, 93) */
		reached[0][39] = 1;
		;
		/* merge: .(goto)(0, 94, 93) */
		reached[0][94] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 36: // STATE 32 - fischer:29 - [goto :b3] (0:93:1 - 1)
		IfNotBlocked
		reached[0][32] = 1;
		;
		/* merge: node[nodeId].time_out = random_timeout(93, 37, 93) */
		reached[0][37] = 1;
		(trpt+1)->bup.oval = ((int)now.node[ Index(((int)((P0 *)this)->nodeId), 165) ].time_out);
		now.node[ Index(((P0 *)this)->nodeId, 165) ].time_out = ((int)now.random_timeout);
#ifdef VAR_RANGES
		logval("node[process:nodeId].time_out", ((int)now.node[ Index(((int)((P0 *)this)->nodeId), 165) ].time_out));
#endif
		;
		/* merge: .(goto)(93, 39, 93) */
		reached[0][39] = 1;
		;
		/* merge: .(goto)(0, 94, 93) */
		reached[0][94] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 37: // STATE 37 - fischer:57 - [node[nodeId].time_out = random_timeout] (0:93:1 - 4)
		IfNotBlocked
		reached[0][37] = 1;
		(trpt+1)->bup.oval = ((int)now.node[ Index(((int)((P0 *)this)->nodeId), 165) ].time_out);
		now.node[ Index(((P0 *)this)->nodeId, 165) ].time_out = ((int)now.random_timeout);
#ifdef VAR_RANGES
		logval("node[process:nodeId].time_out", ((int)now.node[ Index(((int)((P0 *)this)->nodeId), 165) ].time_out));
#endif
		;
		/* merge: .(goto)(93, 39, 93) */
		reached[0][39] = 1;
		;
		/* merge: .(goto)(0, 94, 93) */
		reached[0][94] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 38: // STATE 41 - fischer:60 - [(((node[nodeId].pc==waiting)&&(node[nodeId].time_out==0)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][41] = 1;
		if (!(((now.node[ Index(((int)((P0 *)this)->nodeId), 165) ].pc==2)&&(((int)now.node[ Index(((int)((P0 *)this)->nodeId), 165) ].time_out)==0))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 39: // STATE 42 - fischer:63 - [lock = nodeId] (0:53:2 - 1)
		IfNotBlocked
		reached[0][42] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)now.lock);
		now.lock = ((int)((P0 *)this)->nodeId);
#ifdef VAR_RANGES
		logval("lock", ((int)now.lock));
#endif
		;
		/* merge: node[nodeId].pc = trying(53, 43, 53) */
		reached[0][43] = 1;
		(trpt+1)->bup.ovals[1] = now.node[ Index(((int)((P0 *)this)->nodeId), 165) ].pc;
		now.node[ Index(((P0 *)this)->nodeId, 165) ].pc = 3;
#ifdef VAR_RANGES
		logval("node[process:nodeId].pc", now.node[ Index(((int)((P0 *)this)->nodeId), 165) ].pc);
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 40: // STATE 44 - fischer:23 - [random_timeout = ((2-1)+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][44] = 1;
		(trpt+1)->bup.oval = ((int)now.random_timeout);
		now.random_timeout = ((2-1)+1);
#ifdef VAR_RANGES
		logval("random_timeout", ((int)now.random_timeout));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 41: // STATE 45 - fischer:25 - [(((random_timeout>(2-1))&&(random_timeout<((2-1)+165))))] (50:0:1 - 1)
		IfNotBlocked
		reached[0][45] = 1;
		if (!(((((int)now.random_timeout)>(2-1))&&(((int)now.random_timeout)<((2-1)+165)))))
			continue;
		/* merge: random_timeout = (random_timeout+1)(0, 46, 50) */
		reached[0][46] = 1;
		(trpt+1)->bup.oval = ((int)now.random_timeout);
		now.random_timeout = (((int)now.random_timeout)+1);
#ifdef VAR_RANGES
		logval("random_timeout", ((int)now.random_timeout));
#endif
		;
		/* merge: .(goto)(0, 51, 50) */
		reached[0][51] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 42: // STATE 47 - fischer:27 - [((random_timeout==((2-1)+165)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][47] = 1;
		if (!((((int)now.random_timeout)==((2-1)+165))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 43: // STATE 54 - fischer:66 - [node[nodeId].time_out = random_timeout] (0:0:1 - 1)
		IfNotBlocked
		reached[0][54] = 1;
		(trpt+1)->bup.oval = ((int)now.node[ Index(((int)((P0 *)this)->nodeId), 165) ].time_out);
		now.node[ Index(((P0 *)this)->nodeId, 165) ].time_out = ((int)now.random_timeout);
#ifdef VAR_RANGES
		logval("node[process:nodeId].time_out", ((int)now.node[ Index(((int)((P0 *)this)->nodeId), 165) ].time_out));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 44: // STATE 56 - fischer:68 - [(((node[nodeId].pc==trying)&&(node[nodeId].time_out==0)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][56] = 1;
		if (!(((now.node[ Index(((int)((P0 *)this)->nodeId), 165) ].pc==3)&&(((int)now.node[ Index(((int)((P0 *)this)->nodeId), 165) ].time_out)==0))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 45: // STATE 57 - fischer:72 - [((lock==nodeId))] (74:0:2 - 1)
		IfNotBlocked
		reached[0][57] = 1;
		if (!((((int)now.lock)==((int)((P0 *)this)->nodeId))))
			continue;
		/* merge: node[nodeId].pc = critical(74, 58, 74) */
		reached[0][58] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = now.node[ Index(((int)((P0 *)this)->nodeId), 165) ].pc;
		now.node[ Index(((P0 *)this)->nodeId, 165) ].pc = 4;
#ifdef VAR_RANGES
		logval("node[process:nodeId].pc", now.node[ Index(((int)((P0 *)this)->nodeId), 165) ].pc);
#endif
		;
		/* merge: in_critical = (in_critical+1)(74, 59, 74) */
		reached[0][59] = 1;
		(trpt+1)->bup.ovals[1] = ((int)in_critical);
		in_critical = (((int)in_critical)+1);
#ifdef VAR_RANGES
		logval("in_critical", ((int)in_critical));
#endif
		;
		/* merge: .(goto)(0, 64, 74) */
		reached[0][64] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 46: // STATE 60 - fischer:75 - [((lock!=nodeId))] (74:0:1 - 1)
		IfNotBlocked
		reached[0][60] = 1;
		if (!((((int)now.lock)!=((int)((P0 *)this)->nodeId))))
			continue;
		/* merge: node[nodeId].pc = sleeping(0, 61, 74) */
		reached[0][61] = 1;
		(trpt+1)->bup.oval = now.node[ Index(((int)((P0 *)this)->nodeId), 165) ].pc;
		now.node[ Index(((P0 *)this)->nodeId, 165) ].pc = 1;
#ifdef VAR_RANGES
		logval("node[process:nodeId].pc", now.node[ Index(((int)((P0 *)this)->nodeId), 165) ].pc);
#endif
		;
		/* merge: .(goto)(0, 64, 74) */
		reached[0][64] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 47: // STATE 65 - fischer:23 - [random_timeout = (0+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][65] = 1;
		(trpt+1)->bup.oval = ((int)now.random_timeout);
		now.random_timeout = (0+1);
#ifdef VAR_RANGES
		logval("random_timeout", ((int)now.random_timeout));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 48: // STATE 66 - fischer:25 - [(((random_timeout>0)&&(random_timeout<165)))] (71:0:1 - 1)
		IfNotBlocked
		reached[0][66] = 1;
		if (!(((((int)now.random_timeout)>0)&&(((int)now.random_timeout)<165))))
			continue;
		/* merge: random_timeout = (random_timeout+1)(0, 67, 71) */
		reached[0][67] = 1;
		(trpt+1)->bup.oval = ((int)now.random_timeout);
		now.random_timeout = (((int)now.random_timeout)+1);
#ifdef VAR_RANGES
		logval("random_timeout", ((int)now.random_timeout));
#endif
		;
		/* merge: .(goto)(0, 72, 71) */
		reached[0][72] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 49: // STATE 68 - fischer:27 - [((random_timeout==165))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][68] = 1;
		if (!((((int)now.random_timeout)==165)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 50: // STATE 75 - fischer:80 - [node[nodeId].time_out = random_timeout] (0:0:1 - 1)
		IfNotBlocked
		reached[0][75] = 1;
		(trpt+1)->bup.oval = ((int)now.node[ Index(((int)((P0 *)this)->nodeId), 165) ].time_out);
		now.node[ Index(((P0 *)this)->nodeId, 165) ].time_out = ((int)now.random_timeout);
#ifdef VAR_RANGES
		logval("node[process:nodeId].time_out", ((int)now.node[ Index(((int)((P0 *)this)->nodeId), 165) ].time_out));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 51: // STATE 77 - fischer:82 - [(((node[nodeId].pc==critical)&&(node[nodeId].time_out==0)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][77] = 1;
		if (!(((now.node[ Index(((int)((P0 *)this)->nodeId), 165) ].pc==4)&&(((int)now.node[ Index(((int)((P0 *)this)->nodeId), 165) ].time_out)==0))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 52: // STATE 78 - fischer:85 - [node[nodeId].pc = sleeping] (0:90:3 - 1)
		IfNotBlocked
		reached[0][78] = 1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = now.node[ Index(((int)((P0 *)this)->nodeId), 165) ].pc;
		now.node[ Index(((P0 *)this)->nodeId, 165) ].pc = 1;
#ifdef VAR_RANGES
		logval("node[process:nodeId].pc", now.node[ Index(((int)((P0 *)this)->nodeId), 165) ].pc);
#endif
		;
		/* merge: lock = 165(90, 79, 90) */
		reached[0][79] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.lock);
		now.lock = 165;
#ifdef VAR_RANGES
		logval("lock", ((int)now.lock));
#endif
		;
		/* merge: in_critical = (in_critical-1)(90, 80, 90) */
		reached[0][80] = 1;
		(trpt+1)->bup.ovals[2] = ((int)in_critical);
		in_critical = (((int)in_critical)-1);
#ifdef VAR_RANGES
		logval("in_critical", ((int)in_critical));
#endif
		;
		_m = 3; goto P999; /* 2 */
	case 53: // STATE 81 - fischer:23 - [random_timeout = (0+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][81] = 1;
		(trpt+1)->bup.oval = ((int)now.random_timeout);
		now.random_timeout = (0+1);
#ifdef VAR_RANGES
		logval("random_timeout", ((int)now.random_timeout));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 54: // STATE 82 - fischer:25 - [(((random_timeout>0)&&(random_timeout<165)))] (87:0:1 - 1)
		IfNotBlocked
		reached[0][82] = 1;
		if (!(((((int)now.random_timeout)>0)&&(((int)now.random_timeout)<165))))
			continue;
		/* merge: random_timeout = (random_timeout+1)(0, 83, 87) */
		reached[0][83] = 1;
		(trpt+1)->bup.oval = ((int)now.random_timeout);
		now.random_timeout = (((int)now.random_timeout)+1);
#ifdef VAR_RANGES
		logval("random_timeout", ((int)now.random_timeout));
#endif
		;
		/* merge: .(goto)(0, 88, 87) */
		reached[0][88] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 55: // STATE 84 - fischer:27 - [((random_timeout==165))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][84] = 1;
		if (!((((int)now.random_timeout)==165)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 56: // STATE 91 - fischer:89 - [node[nodeId].time_out = random_timeout] (0:0:1 - 1)
		IfNotBlocked
		reached[0][91] = 1;
		(trpt+1)->bup.oval = ((int)now.node[ Index(((int)((P0 *)this)->nodeId), 165) ].time_out);
		now.node[ Index(((P0 *)this)->nodeId, 165) ].time_out = ((int)now.random_timeout);
#ifdef VAR_RANGES
		logval("node[process:nodeId].time_out", ((int)now.node[ Index(((int)((P0 *)this)->nodeId), 165) ].time_out));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 57: // STATE 96 - fischer:92 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[0][96] = 1;
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

