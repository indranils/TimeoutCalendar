#ifdef PEG
struct T_SRC {
	char *fl; int ln;
} T_SRC[NTRANS];

void
tr_2_src(int m, char *file, int ln)
{	T_SRC[m].fl = file;
	T_SRC[m].ln = ln;
}

void
putpeg(int n, int m)
{	printf("%5d	trans %4d ", m, n);
	printf("%s:%d\n",
		T_SRC[n].fl, T_SRC[n].ln);
}
#endif

void
settable(void)
{	Trans *T;
	Trans *settr(int, int, int, int, int, char *, int, int, int);

	trans = (Trans ***) emalloc(5*sizeof(Trans **));

	/* proctype 3: ltl_0 */

	trans[3] = (Trans **) emalloc(14*sizeof(Trans *));

	trans[3][6]	= settr(430,0,5,1,0,".(goto)", 0, 2, 0);
	T = trans[3][5] = settr(429,0,0,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(429,0,1,0,0,"DO", 0, 2, 0);
	    T->nxt	= settr(429,0,3,0,0,"DO", 0, 2, 0);
	trans[3][1]	= settr(425,0,10,3,0,"((!(!(((((((pc[0]==state_active)&&(pc[1]==state_active))&&(pc[2]==state_active))&&(pc[3]==state_active))&&(pc[4]==state_active))&&(((((time_out[0]>0)&&(time_out[1]>0))&&(time_out[2]>0))&&(time_out[3]>0))&&(time_out[4]>0)))))&&!((((((time_out[0]==time_out[1])==time_out[2])==time_out[3])==time_out[4])&&((((slot[0]==slot[1])==slot[2])==slot[3])==slot[4])))))", 1, 2, 0);
	trans[3][2]	= settr(426,0,10,1,0,"goto accept_S4", 0, 2, 0);
	trans[3][3]	= settr(427,0,5,1,0,"(1)", 0, 2, 0);
	trans[3][4]	= settr(428,0,5,1,0,"goto T0_init", 0, 2, 0);
	trans[3][7]	= settr(431,0,10,1,0,"break", 0, 2, 0);
	trans[3][11]	= settr(435,0,10,1,0,".(goto)", 0, 2, 0);
	T = trans[3][10] = settr(434,0,0,0,0,"DO", 0, 2, 0);
	    T->nxt	= settr(434,0,8,0,0,"DO", 0, 2, 0);
	trans[3][8]	= settr(432,0,10,4,0,"(!((((((time_out[0]==time_out[1])==time_out[2])==time_out[3])==time_out[4])&&((((slot[0]==slot[1])==slot[2])==slot[3])==slot[4]))))", 1, 2, 0);
	trans[3][9]	= settr(433,0,10,1,0,"goto accept_S4", 0, 2, 0);
	trans[3][12]	= settr(436,0,13,1,0,"break", 0, 2, 0);
	trans[3][13]	= settr(437,0,0,5,5,"-end-", 0, 3500, 0);

	/* proctype 2: :init: */

	trans[2] = (Trans **) emalloc(24*sizeof(Trans *));

	T = trans[ 2][22] = settr(423,2,0,0,0,"ATOMIC", 1, 2, 0);
	T->nxt	= settr(423,2,18,0,0,"ATOMIC", 1, 2, 0);
	trans[2][19]	= settr(420,2,18,1,0,".(goto)", 1, 2, 0);
	T = trans[2][18] = settr(419,2,0,0,0,"DO", 1, 2, 0);
	T = T->nxt	= settr(419,2,1,0,0,"DO", 1, 2, 0);
	    T->nxt	= settr(419,2,3,0,0,"DO", 1, 2, 0);
	trans[2][1]	= settr(402,2,20,6,6,"((i==5))", 1, 2, 0);
	trans[2][2]	= settr(403,2,20,1,0,"goto :b19", 1, 2, 0);
	trans[2][3]	= settr(404,2,14,7,7,"((i<5))", 1, 2, 0); /* m: 4 -> 14,0 */
	reached2[4] = 1;
	trans[2][4]	= settr(0,0,0,0,0,"pc[i] = state_init",0,0,0);
	T = trans[ 2][14] = settr(415,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(415,0,5,0,0,"sub-sequence", 1, 2, 0);
	trans[2][5]	= settr(406,2,11,8,8,"random_timeout = 1", 1, 2, 0);
	trans[2][12]	= settr(413,2,11,1,0,".(goto)", 1, 2, 0);
	T = trans[2][11] = settr(412,2,0,0,0,"DO", 1, 2, 0);
	T = T->nxt	= settr(412,2,6,0,0,"DO", 1, 2, 0);
	T = T->nxt	= settr(412,2,8,0,0,"DO", 1, 2, 0);
	    T->nxt	= settr(412,2,10,0,0,"DO", 1, 2, 0);
	trans[2][6]	= settr(407,2,11,9,9,"(((random_timeout>=1)&&(random_timeout<((5+1)-1))))", 1, 2, 0); /* m: 7 -> 11,0 */
	reached2[7] = 1;
	trans[2][7]	= settr(0,0,0,0,0,"random_timeout = (random_timeout+1)",0,0,0);
	trans[2][8]	= settr(409,2,16,10,10,"((random_timeout==((5+1)-1)))", 1, 2, 0); /* m: 15 -> 16,0 */
	reached2[15] = 1;
	trans[2][9]	= settr(410,2,15,1,0,"goto :b20", 1, 2, 0); /* m: 15 -> 0,16 */
	reached2[15] = 1;
	trans[2][10]	= settr(411,2,16,11,11,"goto :b20", 1, 2, 0); /* m: 15 -> 0,16 */
	reached2[15] = 1;
	trans[2][13]	= settr(414,2,15,1,0,"break", 1, 2, 0);
	trans[2][15]	= settr(416,2,16,12,12,"time_out[i] = random_timeout", 1, 2, 0);
	trans[2][16]	= settr(417,2,17,13,13,"(run node(i))", 1, 2, 0);
	trans[2][17]	= settr(418,2,18,14,14,"i = (i+1)", 1, 2, 0);
	trans[2][20]	= settr(421,2,21,1,0,"break", 1, 2, 0);
	trans[2][21]	= settr(422,0,23,15,15,"(run time_advance())", 1, 2, 0);
	trans[2][23]	= settr(424,0,0,16,16,"-end-", 0, 3500, 0);

	/* proctype 1: node */

	trans[1] = (Trans **) emalloc(248*sizeof(Trans *));

	trans[1][245]	= settr(399,0,244,1,0,".(goto)", 0, 2, 0);
	T = trans[1][244] = settr(398,0,0,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(398,0,1,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(398,0,16,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(398,0,95,0,0,"DO", 0, 2, 0);
	    T->nxt	= settr(398,0,172,0,0,"DO", 0, 2, 0);
	trans[1][1]	= settr(155,0,15,17,0,"((pc[i]==state_init))", 1, 2, 0);
	T = trans[ 1][15] = settr(169,2,0,0,0,"ATOMIC", 1, 2, 0);
	T->nxt	= settr(169,2,13,0,0,"ATOMIC", 1, 2, 0);
	T = trans[1][13] = settr(167,2,0,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(167,2,2,0,0,"IF", 1, 2, 0);
	    T->nxt	= settr(167,2,9,0,0,"IF", 1, 2, 0);
	trans[1][2]	= settr(156,2,7,18,18,"(((cal.flag[i]==0)&&(time_out[i]==0)))", 1, 2, 0); /* m: 3 -> 7,0 */
	reached1[3] = 1;
	trans[1][3]	= settr(0,0,0,0,0,"pc[i] = state_listen",0,0,0);
	T = trans[ 1][7] = settr(161,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(161,0,5,0,0,"sub-sequence", 1, 2, 0);
	T = trans[ 1][5] = settr(159,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(159,0,4,0,0,"sub-sequence", 1, 2, 0);
	trans[1][4]	= settr(158,0,244,19,19,"tau_startup = (3*i)", 1, 2, 0); /* m: 6 -> 0,244 */
	reached1[6] = 1;
	trans[1][6]	= settr(0,0,0,0,0,"tau_listen = ((2*round_time)+tau_startup)",0,0,0);
	trans[1][8]	= settr(0,0,0,0,0,"time_out[i] = tau_listen",0,0,0);
	trans[1][14]	= settr(168,0,244,20,20,".(goto)", 1, 2, 0);
	trans[1][9]	= settr(163,2,11,21,0,"((cal.flag[i]&&(cal.delivery==0)))", 1, 2, 0);
	T = trans[ 1][11] = settr(165,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(165,0,10,0,0,"sub-sequence", 1, 2, 0);
	trans[1][10]	= settr(164,0,244,22,22,"cal.flag[i] = 0", 1, 2, 0); /* m: 12 -> 0,244 */
	reached1[12] = 1;
	trans[1][12]	= settr(0,0,0,0,0,"event_pending = 0",0,0,0);
	trans[1][16]	= settr(170,0,94,23,0,"((pc[i]==state_listen))", 1, 2, 0);
	T = trans[ 1][94] = settr(248,2,0,0,0,"ATOMIC", 1, 2, 0);
	T->nxt	= settr(248,2,92,0,0,"ATOMIC", 1, 2, 0);
	T = trans[1][92] = settr(246,2,0,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(246,2,17,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(246,2,75,0,0,"IF", 1, 2, 0);
	    T->nxt	= settr(246,2,84,0,0,"IF", 1, 2, 0);
	trans[1][17]	= settr(171,2,22,24,24,"((!((cal.flag[i]&&(cal.delivery==0)))&&(time_out[i]==0)))", 1, 2, 0); /* m: 18 -> 22,0 */
	reached1[18] = 1;
	trans[1][18]	= settr(0,0,0,0,0,"pc[i] = state_coldstart",0,0,0);
	T = trans[ 1][22] = settr(176,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(176,0,20,0,0,"sub-sequence", 1, 2, 0);
	T = trans[ 1][20] = settr(174,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(174,0,19,0,0,"sub-sequence", 1, 2, 0);
	trans[1][19]	= settr(173,2,74,25,25,"tau_startup = (3*i)", 1, 2, 0); /* m: 21 -> 0,74 */
	reached1[21] = 1;
	trans[1][21]	= settr(0,0,0,0,0,"tau_coldstart = (round_time+tau_startup)",0,0,0);
	trans[1][23]	= settr(0,0,0,0,0,"time_out[i] = tau_coldstart",0,0,0);
	T = trans[ 1][74] = settr(228,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(228,0,24,0,0,"sub-sequence", 1, 2, 0);
	trans[1][24]	= settr(178,2,73,26,26,"j = 0", 1, 2, 0);
	T = trans[ 1][73] = settr(227,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(227,0,41,0,0,"sub-sequence", 1, 2, 0);
	T = trans[ 1][41] = settr(195,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(195,0,25,0,0,"sub-sequence", 1, 2, 0);
	trans[1][25]	= settr(179,2,38,27,27,"i5 = 0", 1, 2, 0); /* m: 26 -> 0,38 */
	reached1[26] = 1;
	trans[1][26]	= settr(0,0,0,0,0,"i5 = 0",0,0,0);
	trans[1][39]	= settr(193,2,38,1,0,".(goto)", 1, 2, 0);
	T = trans[1][38] = settr(192,2,0,0,0,"DO", 1, 2, 0);
	T = T->nxt	= settr(192,2,27,0,0,"DO", 1, 2, 0);
	    T->nxt	= settr(192,2,30,0,0,"DO", 1, 2, 0);
	trans[1][27]	= settr(181,2,71,28,28,"((i5==5))", 1, 2, 0); /* m: 28 -> 71,0 */
	reached1[28] = 1;
	trans[1][28]	= settr(0,0,0,0,0,"empty_cal = 1",0,0,0);
	trans[1][29]	= settr(183,2,71,1,0,"goto :b10", 1, 2, 0);
	trans[1][30]	= settr(184,2,36,29,0,"((i5!=5))", 1, 2, 0);
	T = trans[1][36] = settr(190,2,0,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(190,2,31,0,0,"IF", 1, 2, 0);
	    T->nxt	= settr(190,2,34,0,0,"IF", 1, 2, 0);
	trans[1][31]	= settr(185,2,71,30,30,"((cal.flag[i5]==1))", 1, 2, 0); /* m: 32 -> 71,0 */
	reached1[32] = 1;
	trans[1][32]	= settr(0,0,0,0,0,"empty_cal = 0",0,0,0);
	trans[1][33]	= settr(187,2,71,1,0,"goto :b10", 1, 2, 0);
	trans[1][37]	= settr(191,2,38,1,0,".(goto)", 1, 2, 0);
	trans[1][34]	= settr(188,2,35,2,0,"else", 1, 2, 0);
	trans[1][35]	= settr(189,2,38,31,31,"i5 = (i5+1)", 1, 2, 0);
	trans[1][40]	= settr(194,2,71,1,0,"break", 1, 2, 0);
	T = trans[1][71] = settr(225,2,0,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(225,2,42,0,0,"IF", 1, 2, 0);
	    T->nxt	= settr(225,2,62,0,0,"IF", 1, 2, 0);
	trans[1][42]	= settr(196,2,59,32,32,"((empty_cal==1))", 1, 2, 0); /* m: 43 -> 59,0 */
	reached1[43] = 1;
	trans[1][43]	= settr(0,0,0,0,0,"cal.msg = 6",0,0,0);
	trans[1][44]	= settr(0,0,0,0,0,"cal.origin = i",0,0,0);
	trans[1][45]	= settr(0,0,0,0,0,"cal.send = 0",0,0,0);
	trans[1][46]	= settr(0,0,0,0,0,"cal.delivery = propagation_delay",0,0,0);
	trans[1][47]	= settr(0,0,0,0,0,"j = 0",0,0,0);
	trans[1][60]	= settr(214,2,59,1,0,".(goto)", 1, 2, 0);
	T = trans[1][59] = settr(213,2,0,0,0,"DO", 1, 2, 0);
	T = T->nxt	= settr(213,2,48,0,0,"DO", 1, 2, 0);
	    T->nxt	= settr(213,2,50,0,0,"DO", 1, 2, 0);
	trans[1][48]	= settr(202,0,244,33,33,"((j==5))", 1, 2, 0); /* m: 72 -> 244,0 */
	reached1[72] = 1;
	trans[1][49]	= settr(203,2,72,1,0,"goto :b11", 1, 2, 0); /* m: 72 -> 0,244 */
	reached1[72] = 1;
	trans[1][50]	= settr(204,2,57,2,0,"else", 1, 2, 0);
	T = trans[1][57] = settr(211,2,0,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(211,2,51,0,0,"IF", 1, 2, 0);
	    T->nxt	= settr(211,2,54,0,0,"IF", 1, 2, 0);
	trans[1][51]	= settr(205,2,59,34,34,"((j!=i))", 1, 2, 0); /* m: 52 -> 59,0 */
	reached1[52] = 1;
	trans[1][52]	= settr(0,0,0,0,0,"cal.flag[j] = 1",0,0,0);
	trans[1][53]	= settr(0,0,0,0,0,"j = (j+1)",0,0,0);
	trans[1][58]	= settr(212,2,59,1,0,".(goto)", 1, 2, 0);
	trans[1][54]	= settr(208,2,55,2,0,"else", 1, 2, 0);
	trans[1][55]	= settr(209,2,59,35,35,"cal.flag[j] = 0", 1, 2, 0); /* m: 56 -> 0,59 */
	reached1[56] = 1;
	trans[1][56]	= settr(0,0,0,0,0,"j = (j+1)",0,0,0);
	trans[1][61]	= settr(215,2,72,1,0,"break", 1, 2, 0);
	trans[1][72]	= settr(226,0,244,36,36,".(goto)", 1, 2, 0); /* m: 93 -> 0,244 */
	reached1[93] = 1;
	trans[1][62]	= settr(216,2,68,2,0,"else", 1, 2, 0);
	trans[1][69]	= settr(223,2,68,1,0,".(goto)", 1, 2, 0);
	T = trans[1][68] = settr(222,2,0,0,0,"DO", 1, 2, 0);
	T = T->nxt	= settr(222,2,63,0,0,"DO", 1, 2, 0);
	    T->nxt	= settr(222,2,65,0,0,"DO", 1, 2, 0);
	trans[1][63]	= settr(217,0,244,37,37,"((j==5))", 1, 2, 0); /* m: 72 -> 244,0 */
	reached1[72] = 1;
	trans[1][64]	= settr(218,2,72,1,0,"goto :b12", 1, 2, 0); /* m: 72 -> 0,244 */
	reached1[72] = 1;
	trans[1][65]	= settr(219,2,66,2,0,"else", 1, 2, 0);
	trans[1][66]	= settr(220,2,68,38,38,"cal.flag[j] = 0", 1, 2, 0); /* m: 67 -> 0,68 */
	reached1[67] = 1;
	trans[1][67]	= settr(0,0,0,0,0,"j = (j+1)",0,0,0);
	trans[1][70]	= settr(224,2,72,1,0,"break", 1, 2, 0);
	trans[1][93]	= settr(247,0,244,39,39,".(goto)", 1, 2, 0);
	trans[1][75]	= settr(229,2,80,40,40,"((((cal.flag[i]==1)&&(cal.msg==cs_frame))&&(cal.delivery==0)))", 1, 2, 0); /* m: 76 -> 80,0 */
	reached1[76] = 1;
	trans[1][76]	= settr(0,0,0,0,0,"pc[i] = state_coldstart",0,0,0);
	T = trans[ 1][80] = settr(234,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(234,0,78,0,0,"sub-sequence", 1, 2, 0);
	T = trans[ 1][78] = settr(232,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(232,0,77,0,0,"sub-sequence", 1, 2, 0);
	trans[1][77]	= settr(231,2,83,41,41,"tau_startup = (3*i)", 1, 2, 0); /* m: 79 -> 0,83 */
	reached1[79] = 1;
	trans[1][79]	= settr(0,0,0,0,0,"tau_coldstart = (round_time+tau_startup)",0,0,0);
	trans[1][81]	= settr(0,0,0,0,0,"time_out[i] = (tau_coldstart-propagation_delay)",0,0,0);
	T = trans[ 1][83] = settr(237,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(237,0,82,0,0,"sub-sequence", 1, 2, 0);
	trans[1][82]	= settr(236,0,244,42,42,"cal.flag[i] = 0", 1, 2, 0); /* m: 93 -> 0,244 */
	reached1[93] = 1;
	trans[1][84]	= settr(238,2,88,43,43,"(((cal.flag[i]&&(cal.msg==i_frame))&&(cal.delivery==0)))", 1, 2, 0); /* m: 85 -> 88,0 */
	reached1[85] = 1;
	trans[1][85]	= settr(0,0,0,0,0,"pc[i] = state_active",0,0,0);
	trans[1][86]	= settr(0,0,0,0,0,"time_out[i] = (3-propagation_delay)",0,0,0);
	T = trans[ 1][88] = settr(242,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(242,0,87,0,0,"sub-sequence", 1, 2, 0);
	trans[1][87]	= settr(241,2,91,44,44,"frame_origin = cal.origin", 1, 2, 0); /* m: 89 -> 0,91 */
	reached1[89] = 1;
	trans[1][89]	= settr(0,0,0,0,0,"slot[i] = frame_origin",0,0,0);
	T = trans[ 1][91] = settr(245,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(245,0,90,0,0,"sub-sequence", 1, 2, 0);
	trans[1][90]	= settr(244,0,244,45,45,"cal.flag[i] = 0", 1, 2, 0); /* m: 93 -> 0,244 */
	reached1[93] = 1;
	trans[1][95]	= settr(249,0,171,46,0,"((pc[i]==state_coldstart))", 1, 2, 0);
	T = trans[ 1][171] = settr(325,2,0,0,0,"ATOMIC", 1, 2, 0);
	T->nxt	= settr(325,2,169,0,0,"ATOMIC", 1, 2, 0);
	T = trans[1][169] = settr(323,2,0,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(323,2,96,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(323,2,153,0,0,"IF", 1, 2, 0);
	    T->nxt	= settr(323,2,161,0,0,"IF", 1, 2, 0);
	trans[1][96]	= settr(250,2,100,47,0,"((!((cal.flag[i]&&(cal.delivery==0)))&&(time_out[i]==0)))", 1, 2, 0);
	T = trans[ 1][100] = settr(254,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(254,0,98,0,0,"sub-sequence", 1, 2, 0);
	T = trans[ 1][98] = settr(252,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(252,0,97,0,0,"sub-sequence", 1, 2, 0);
	trans[1][97]	= settr(251,2,152,48,48,"tau_startup = (3*i)", 1, 2, 0); /* m: 99 -> 0,152 */
	reached1[99] = 1;
	trans[1][99]	= settr(0,0,0,0,0,"tau_coldstart = (round_time+tau_startup)",0,0,0);
	trans[1][101]	= settr(0,0,0,0,0,"time_out[i] = tau_coldstart",0,0,0);
	T = trans[ 1][152] = settr(306,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(306,0,102,0,0,"sub-sequence", 1, 2, 0);
	trans[1][102]	= settr(256,2,151,49,49,"j = 0", 1, 2, 0);
	T = trans[ 1][151] = settr(305,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(305,0,119,0,0,"sub-sequence", 1, 2, 0);
	T = trans[ 1][119] = settr(273,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(273,0,103,0,0,"sub-sequence", 1, 2, 0);
	trans[1][103]	= settr(257,2,116,50,50,"i5 = 0", 1, 2, 0); /* m: 104 -> 0,116 */
	reached1[104] = 1;
	trans[1][104]	= settr(0,0,0,0,0,"i5 = 0",0,0,0);
	trans[1][117]	= settr(271,2,116,1,0,".(goto)", 1, 2, 0);
	T = trans[1][116] = settr(270,2,0,0,0,"DO", 1, 2, 0);
	T = T->nxt	= settr(270,2,105,0,0,"DO", 1, 2, 0);
	    T->nxt	= settr(270,2,108,0,0,"DO", 1, 2, 0);
	trans[1][105]	= settr(259,2,149,51,51,"((i5==5))", 1, 2, 0); /* m: 106 -> 149,0 */
	reached1[106] = 1;
	trans[1][106]	= settr(0,0,0,0,0,"empty_cal = 1",0,0,0);
	trans[1][107]	= settr(261,2,149,1,0,"goto :b13", 1, 2, 0);
	trans[1][108]	= settr(262,2,114,52,0,"((i5!=5))", 1, 2, 0);
	T = trans[1][114] = settr(268,2,0,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(268,2,109,0,0,"IF", 1, 2, 0);
	    T->nxt	= settr(268,2,112,0,0,"IF", 1, 2, 0);
	trans[1][109]	= settr(263,2,149,53,53,"((cal.flag[i5]==1))", 1, 2, 0); /* m: 110 -> 149,0 */
	reached1[110] = 1;
	trans[1][110]	= settr(0,0,0,0,0,"empty_cal = 0",0,0,0);
	trans[1][111]	= settr(265,2,149,1,0,"goto :b13", 1, 2, 0);
	trans[1][115]	= settr(269,2,116,1,0,".(goto)", 1, 2, 0);
	trans[1][112]	= settr(266,2,113,2,0,"else", 1, 2, 0);
	trans[1][113]	= settr(267,2,116,54,54,"i5 = (i5+1)", 1, 2, 0);
	trans[1][118]	= settr(272,2,149,1,0,"break", 1, 2, 0);
	T = trans[1][149] = settr(303,2,0,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(303,2,120,0,0,"IF", 1, 2, 0);
	    T->nxt	= settr(303,2,140,0,0,"IF", 1, 2, 0);
	trans[1][120]	= settr(274,2,137,55,55,"((empty_cal==1))", 1, 2, 0); /* m: 121 -> 137,0 */
	reached1[121] = 1;
	trans[1][121]	= settr(0,0,0,0,0,"cal.msg = 6",0,0,0);
	trans[1][122]	= settr(0,0,0,0,0,"cal.origin = i",0,0,0);
	trans[1][123]	= settr(0,0,0,0,0,"cal.send = 0",0,0,0);
	trans[1][124]	= settr(0,0,0,0,0,"cal.delivery = propagation_delay",0,0,0);
	trans[1][125]	= settr(0,0,0,0,0,"j = 0",0,0,0);
	trans[1][138]	= settr(292,2,137,1,0,".(goto)", 1, 2, 0);
	T = trans[1][137] = settr(291,2,0,0,0,"DO", 1, 2, 0);
	T = T->nxt	= settr(291,2,126,0,0,"DO", 1, 2, 0);
	    T->nxt	= settr(291,2,128,0,0,"DO", 1, 2, 0);
	trans[1][126]	= settr(280,0,244,56,56,"((j==5))", 1, 2, 0); /* m: 150 -> 244,0 */
	reached1[150] = 1;
	trans[1][127]	= settr(281,2,150,1,0,"goto :b14", 1, 2, 0); /* m: 150 -> 0,244 */
	reached1[150] = 1;
	trans[1][128]	= settr(282,2,135,2,0,"else", 1, 2, 0);
	T = trans[1][135] = settr(289,2,0,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(289,2,129,0,0,"IF", 1, 2, 0);
	    T->nxt	= settr(289,2,132,0,0,"IF", 1, 2, 0);
	trans[1][129]	= settr(283,2,137,57,57,"((j!=i))", 1, 2, 0); /* m: 130 -> 137,0 */
	reached1[130] = 1;
	trans[1][130]	= settr(0,0,0,0,0,"cal.flag[j] = 1",0,0,0);
	trans[1][131]	= settr(0,0,0,0,0,"j = (j+1)",0,0,0);
	trans[1][136]	= settr(290,2,137,1,0,".(goto)", 1, 2, 0);
	trans[1][132]	= settr(286,2,133,2,0,"else", 1, 2, 0);
	trans[1][133]	= settr(287,2,137,58,58,"cal.flag[j] = 0", 1, 2, 0); /* m: 134 -> 0,137 */
	reached1[134] = 1;
	trans[1][134]	= settr(0,0,0,0,0,"j = (j+1)",0,0,0);
	trans[1][139]	= settr(293,2,150,1,0,"break", 1, 2, 0);
	trans[1][150]	= settr(304,0,244,59,59,".(goto)", 1, 2, 0); /* m: 170 -> 0,244 */
	reached1[170] = 1;
	trans[1][140]	= settr(294,2,146,2,0,"else", 1, 2, 0);
	trans[1][147]	= settr(301,2,146,1,0,".(goto)", 1, 2, 0);
	T = trans[1][146] = settr(300,2,0,0,0,"DO", 1, 2, 0);
	T = T->nxt	= settr(300,2,141,0,0,"DO", 1, 2, 0);
	    T->nxt	= settr(300,2,143,0,0,"DO", 1, 2, 0);
	trans[1][141]	= settr(295,0,244,60,60,"((j==5))", 1, 2, 0); /* m: 150 -> 244,0 */
	reached1[150] = 1;
	trans[1][142]	= settr(296,2,150,1,0,"goto :b15", 1, 2, 0); /* m: 150 -> 0,244 */
	reached1[150] = 1;
	trans[1][143]	= settr(297,2,144,2,0,"else", 1, 2, 0);
	trans[1][144]	= settr(298,2,146,61,61,"cal.flag[j] = 0", 1, 2, 0); /* m: 145 -> 0,146 */
	reached1[145] = 1;
	trans[1][145]	= settr(0,0,0,0,0,"j = (j+1)",0,0,0);
	trans[1][148]	= settr(302,2,150,1,0,"break", 1, 2, 0);
	trans[1][170]	= settr(324,0,244,62,62,".(goto)", 1, 2, 0);
	trans[1][153]	= settr(307,2,157,63,63,"(((cal.flag[i]&&(cal.msg==cs_frame))&&(cal.delivery==0)))", 1, 2, 0); /* m: 154 -> 157,0 */
	reached1[154] = 1;
	trans[1][154]	= settr(0,0,0,0,0,"pc[i] = state_active",0,0,0);
	trans[1][155]	= settr(0,0,0,0,0,"time_out[i] = (3-propagation_delay)",0,0,0);
	T = trans[ 1][157] = settr(311,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(311,0,156,0,0,"sub-sequence", 1, 2, 0);
	trans[1][156]	= settr(310,2,160,64,64,"frame_origin = cal.origin", 1, 2, 0); /* m: 158 -> 0,160 */
	reached1[158] = 1;
	trans[1][158]	= settr(0,0,0,0,0,"slot[i] = frame_origin",0,0,0);
	T = trans[ 1][160] = settr(314,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(314,0,159,0,0,"sub-sequence", 1, 2, 0);
	trans[1][159]	= settr(313,0,244,65,65,"cal.flag[i] = 0", 1, 2, 0); /* m: 170 -> 0,244 */
	reached1[170] = 1;
	trans[1][161]	= settr(315,2,165,66,66,"(((cal.flag[i]&&(cal.msg==i_frame))&&(cal.delivery==0)))", 1, 2, 0); /* m: 162 -> 165,0 */
	reached1[162] = 1;
	trans[1][162]	= settr(0,0,0,0,0,"pc[i] = state_active",0,0,0);
	trans[1][163]	= settr(0,0,0,0,0,"time_out[i] = (3-propagation_delay)",0,0,0);
	T = trans[ 1][165] = settr(319,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(319,0,164,0,0,"sub-sequence", 1, 2, 0);
	trans[1][164]	= settr(318,2,168,67,67,"frame_origin = cal.origin", 1, 2, 0); /* m: 166 -> 0,168 */
	reached1[166] = 1;
	trans[1][166]	= settr(0,0,0,0,0,"slot[i] = frame_origin",0,0,0);
	T = trans[ 1][168] = settr(322,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(322,0,167,0,0,"sub-sequence", 1, 2, 0);
	trans[1][167]	= settr(321,0,244,68,68,"cal.flag[i] = 0", 1, 2, 0); /* m: 170 -> 0,244 */
	reached1[170] = 1;
	trans[1][172]	= settr(326,0,243,69,0,"((pc[i]==state_active))", 1, 2, 0);
	T = trans[ 1][243] = settr(397,2,0,0,0,"ATOMIC", 1, 2, 0);
	T->nxt	= settr(397,2,241,0,0,"ATOMIC", 1, 2, 0);
	T = trans[1][241] = settr(395,2,0,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(395,2,173,0,0,"IF", 1, 2, 0);
	    T->nxt	= settr(395,2,238,0,0,"IF", 1, 2, 0);
	trans[1][173]	= settr(327,2,180,70,0,"((time_out[i]==0))", 1, 2, 0);
	T = trans[ 1][180] = settr(334,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(334,0,178,0,0,"sub-sequence", 1, 2, 0);
	T = trans[1][178] = settr(332,2,0,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(332,2,174,0,0,"IF", 1, 2, 0);
	    T->nxt	= settr(332,2,176,0,0,"IF", 1, 2, 0);
	trans[1][174]	= settr(328,2,236,71,71,"((slot[i]==(5-1)))", 1, 2, 0); /* m: 175 -> 236,0 */
	reached1[175] = 1;
	trans[1][175]	= settr(0,0,0,0,0,"increment = 0",0,0,0);
	trans[1][179]	= settr(333,2,181,1,0,".(goto)", 1, 2, 0); /* m: 181 -> 0,236 */
	reached1[181] = 1;
	trans[1][176]	= settr(330,2,177,2,0,"else", 1, 2, 0);
	trans[1][177]	= settr(331,2,236,72,72,"increment = (slot[i]+1)", 1, 2, 0); /* m: 181 -> 0,236 */
	reached1[181] = 1;
	trans[1][181]	= settr(335,2,236,73,73,"slot[i] = increment", 1, 2, 0); /* m: 182 -> 0,236 */
	reached1[182] = 1;
	trans[1][182]	= settr(0,0,0,0,0,"time_out[i] = 3",0,0,0);
	T = trans[1][236] = settr(390,2,0,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(390,2,183,0,0,"IF", 1, 2, 0);
	    T->nxt	= settr(390,2,235,0,0,"IF", 1, 2, 0);
	trans[1][183]	= settr(337,2,234,74,0,"((increment==i))", 1, 2, 0);
	T = trans[ 1][234] = settr(388,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(388,0,184,0,0,"sub-sequence", 1, 2, 0);
	trans[1][184]	= settr(338,2,233,75,75,"j = 0", 1, 2, 0);
	T = trans[ 1][233] = settr(387,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(387,0,201,0,0,"sub-sequence", 1, 2, 0);
	T = trans[ 1][201] = settr(355,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(355,0,185,0,0,"sub-sequence", 1, 2, 0);
	trans[1][185]	= settr(339,2,198,76,76,"i5 = 0", 1, 2, 0); /* m: 186 -> 0,198 */
	reached1[186] = 1;
	trans[1][186]	= settr(0,0,0,0,0,"i5 = 0",0,0,0);
	trans[1][199]	= settr(353,2,198,1,0,".(goto)", 1, 2, 0);
	T = trans[1][198] = settr(352,2,0,0,0,"DO", 1, 2, 0);
	T = T->nxt	= settr(352,2,187,0,0,"DO", 1, 2, 0);
	    T->nxt	= settr(352,2,190,0,0,"DO", 1, 2, 0);
	trans[1][187]	= settr(341,2,231,77,77,"((i5==5))", 1, 2, 0); /* m: 188 -> 231,0 */
	reached1[188] = 1;
	trans[1][188]	= settr(0,0,0,0,0,"empty_cal = 1",0,0,0);
	trans[1][189]	= settr(343,2,231,1,0,"goto :b16", 1, 2, 0);
	trans[1][190]	= settr(344,2,196,78,0,"((i5!=5))", 1, 2, 0);
	T = trans[1][196] = settr(350,2,0,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(350,2,191,0,0,"IF", 1, 2, 0);
	    T->nxt	= settr(350,2,194,0,0,"IF", 1, 2, 0);
	trans[1][191]	= settr(345,2,231,79,79,"((cal.flag[i5]==1))", 1, 2, 0); /* m: 192 -> 231,0 */
	reached1[192] = 1;
	trans[1][192]	= settr(0,0,0,0,0,"empty_cal = 0",0,0,0);
	trans[1][193]	= settr(347,2,231,1,0,"goto :b16", 1, 2, 0);
	trans[1][197]	= settr(351,2,198,1,0,".(goto)", 1, 2, 0);
	trans[1][194]	= settr(348,2,195,2,0,"else", 1, 2, 0);
	trans[1][195]	= settr(349,2,198,80,80,"i5 = (i5+1)", 1, 2, 0);
	trans[1][200]	= settr(354,2,231,1,0,"break", 1, 2, 0);
	T = trans[1][231] = settr(385,2,0,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(385,2,202,0,0,"IF", 1, 2, 0);
	    T->nxt	= settr(385,2,222,0,0,"IF", 1, 2, 0);
	trans[1][202]	= settr(356,2,219,81,81,"((empty_cal==1))", 1, 2, 0); /* m: 203 -> 219,0 */
	reached1[203] = 1;
	trans[1][203]	= settr(0,0,0,0,0,"cal.msg = 5",0,0,0);
	trans[1][204]	= settr(0,0,0,0,0,"cal.origin = i",0,0,0);
	trans[1][205]	= settr(0,0,0,0,0,"cal.send = 0",0,0,0);
	trans[1][206]	= settr(0,0,0,0,0,"cal.delivery = propagation_delay",0,0,0);
	trans[1][207]	= settr(0,0,0,0,0,"j = 0",0,0,0);
	trans[1][220]	= settr(374,2,219,1,0,".(goto)", 1, 2, 0);
	T = trans[1][219] = settr(373,2,0,0,0,"DO", 1, 2, 0);
	T = T->nxt	= settr(373,2,208,0,0,"DO", 1, 2, 0);
	    T->nxt	= settr(373,2,210,0,0,"DO", 1, 2, 0);
	trans[1][208]	= settr(362,0,244,82,82,"((j==5))", 1, 2, 0); /* m: 237 -> 244,0 */
	reached1[237] = 1;
	trans[1][209]	= settr(363,2,237,1,0,"goto :b17", 1, 2, 0); /* m: 237 -> 0,244 */
	reached1[237] = 1;
	trans[1][210]	= settr(364,2,217,2,0,"else", 1, 2, 0);
	T = trans[1][217] = settr(371,2,0,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(371,2,211,0,0,"IF", 1, 2, 0);
	    T->nxt	= settr(371,2,214,0,0,"IF", 1, 2, 0);
	trans[1][211]	= settr(365,2,219,83,83,"((j!=i))", 1, 2, 0); /* m: 212 -> 219,0 */
	reached1[212] = 1;
	trans[1][212]	= settr(0,0,0,0,0,"cal.flag[j] = 1",0,0,0);
	trans[1][213]	= settr(0,0,0,0,0,"j = (j+1)",0,0,0);
	trans[1][218]	= settr(372,2,219,1,0,".(goto)", 1, 2, 0);
	trans[1][214]	= settr(368,2,215,2,0,"else", 1, 2, 0);
	trans[1][215]	= settr(369,2,219,84,84,"cal.flag[j] = 0", 1, 2, 0); /* m: 216 -> 0,219 */
	reached1[216] = 1;
	trans[1][216]	= settr(0,0,0,0,0,"j = (j+1)",0,0,0);
	trans[1][221]	= settr(375,2,237,1,0,"break", 1, 2, 0);
	trans[1][232]	= settr(386,2,237,1,0,".(goto)", 1, 2, 0); /* m: 237 -> 0,244 */
	reached1[237] = 1;
	trans[1][222]	= settr(376,2,228,2,0,"else", 1, 2, 0);
	trans[1][229]	= settr(383,2,228,1,0,".(goto)", 1, 2, 0);
	T = trans[1][228] = settr(382,2,0,0,0,"DO", 1, 2, 0);
	T = T->nxt	= settr(382,2,223,0,0,"DO", 1, 2, 0);
	    T->nxt	= settr(382,2,225,0,0,"DO", 1, 2, 0);
	trans[1][223]	= settr(377,0,244,85,85,"((j==5))", 1, 2, 0); /* m: 237 -> 244,0 */
	reached1[237] = 1;
	trans[1][224]	= settr(378,2,237,1,0,"goto :b18", 1, 2, 0); /* m: 237 -> 0,244 */
	reached1[237] = 1;
	trans[1][225]	= settr(379,2,226,2,0,"else", 1, 2, 0);
	trans[1][226]	= settr(380,2,228,86,86,"cal.flag[j] = 0", 1, 2, 0); /* m: 227 -> 0,228 */
	reached1[227] = 1;
	trans[1][227]	= settr(0,0,0,0,0,"j = (j+1)",0,0,0);
	trans[1][230]	= settr(384,2,237,1,0,"break", 1, 2, 0);
	trans[1][237]	= settr(391,0,244,87,87,".(goto)", 1, 2, 0); /* m: 242 -> 0,244 */
	reached1[242] = 1;
	trans[1][235]	= settr(389,2,237,2,0,"else", 1, 2, 0);
	trans[1][242]	= settr(396,0,244,88,88,".(goto)", 1, 2, 0);
	trans[1][238]	= settr(392,2,240,89,0,"((cal.flag[i]&&((cal.msg==cs_frame)||(cal.msg==i_frame))))", 1, 2, 0);
	T = trans[ 1][240] = settr(394,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(394,0,239,0,0,"sub-sequence", 1, 2, 0);
	trans[1][239]	= settr(393,0,244,90,90,"cal.flag[i] = 0", 1, 2, 0); /* m: 242 -> 0,244 */
	reached1[242] = 1;
	trans[1][246]	= settr(400,0,247,1,0,"break", 0, 2, 0);
	trans[1][247]	= settr(401,0,0,91,91,"-end-", 0, 3500, 0);

	/* proctype 0: time_advance */

	trans[0] = (Trans **) emalloc(156*sizeof(Trans *));

	trans[0][153]	= settr(152,0,152,1,0,".(goto)", 0, 2, 0);
	T = trans[0][152] = settr(151,0,0,0,0,"DO", 0, 2, 0);
	    T->nxt	= settr(151,0,1,0,0,"DO", 0, 2, 0);
	trans[0][1]	= settr(0,0,72,92,0,"(timeout)", 1, 3000, 0);
	T = trans[ 0][72] = settr(71,0,0,0,0,"sub-sequence", 0, 2, 0);
	T->nxt	= settr(71,0,71,0,0,"sub-sequence", 0, 2, 0);
	T = trans[ 0][71] = settr(70,2,0,0,0,"ATOMIC", 1, 2, 0);
	T->nxt	= settr(70,2,18,0,0,"ATOMIC", 1, 2, 0);
	T = trans[ 0][18] = settr(17,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(17,0,2,0,0,"sub-sequence", 1, 2, 0);
	trans[0][2]	= settr(1,2,15,93,93,"i5 = 0", 1, 2, 0); /* m: 3 -> 0,15 */
	reached0[3] = 1;
	trans[0][3]	= settr(0,0,0,0,0,"i5 = 0",0,0,0);
	trans[0][16]	= settr(15,2,15,1,0,".(goto)", 1, 2, 0);
	T = trans[0][15] = settr(14,2,0,0,0,"DO", 1, 2, 0);
	T = T->nxt	= settr(14,2,4,0,0,"DO", 1, 2, 0);
	    T->nxt	= settr(14,2,7,0,0,"DO", 1, 2, 0);
	trans[0][4]	= settr(3,2,69,94,94,"((i5==5))", 1, 2, 0); /* m: 5 -> 69,0 */
	reached0[5] = 1;
	trans[0][5]	= settr(0,0,0,0,0,"empty_cal = 1",0,0,0);
	trans[0][6]	= settr(5,2,69,1,0,"goto :b1", 1, 2, 0);
	trans[0][7]	= settr(6,2,13,95,0,"((i5!=5))", 1, 2, 0);
	T = trans[0][13] = settr(12,2,0,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(12,2,8,0,0,"IF", 1, 2, 0);
	    T->nxt	= settr(12,2,11,0,0,"IF", 1, 2, 0);
	trans[0][8]	= settr(7,2,69,96,96,"((cal.flag[i5]==1))", 1, 2, 0); /* m: 9 -> 69,0 */
	reached0[9] = 1;
	trans[0][9]	= settr(0,0,0,0,0,"empty_cal = 0",0,0,0);
	trans[0][10]	= settr(9,2,69,1,0,"goto :b1", 1, 2, 0);
	trans[0][14]	= settr(13,2,15,1,0,".(goto)", 1, 2, 0);
	trans[0][11]	= settr(10,2,12,2,0,"else", 1, 2, 0);
	trans[0][12]	= settr(11,2,15,97,97,"i5 = (i5+1)", 1, 2, 0);
	trans[0][17]	= settr(16,2,69,1,0,"break", 1, 2, 0);
	T = trans[0][69] = settr(68,2,0,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(68,2,19,0,0,"IF", 1, 2, 0);
	    T->nxt	= settr(68,2,43,0,0,"IF", 1, 2, 0);
	trans[0][19]	= settr(18,2,36,98,0,"(empty_cal)", 1, 2, 0);
	T = trans[ 0][36] = settr(35,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(35,0,20,0,0,"sub-sequence", 1, 2, 0);
	trans[0][20]	= settr(19,2,33,99,99,"i1 = 0", 1, 2, 0); /* m: 21 -> 0,33 */
	reached0[21] = 1;
	trans[0][21]	= settr(0,0,0,0,0,"min_timeout = time_out[0]",0,0,0);
	trans[0][22]	= settr(0,0,0,0,0,"i1 = 1",0,0,0);
	trans[0][34]	= settr(33,2,33,1,0,".(goto)", 1, 2, 0);
	T = trans[0][33] = settr(32,2,0,0,0,"DO", 1, 2, 0);
	T = T->nxt	= settr(32,2,23,0,0,"DO", 1, 2, 0);
	    T->nxt	= settr(32,2,25,0,0,"DO", 1, 2, 0);
	trans[0][23]	= settr(22,2,41,100,100,"((i1==5))", 1, 2, 0);
	trans[0][24]	= settr(23,2,41,1,0,"goto :b2", 1, 2, 0);
	trans[0][25]	= settr(24,2,31,2,0,"else", 1, 2, 0);
	T = trans[0][31] = settr(30,2,0,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(30,2,26,0,0,"IF", 1, 2, 0);
	    T->nxt	= settr(30,2,29,0,0,"IF", 1, 2, 0);
	trans[0][26]	= settr(25,2,33,101,101,"((min_timeout>time_out[i1]))", 1, 2, 0); /* m: 27 -> 33,0 */
	reached0[27] = 1;
	trans[0][27]	= settr(0,0,0,0,0,"min_timeout = time_out[i1]",0,0,0);
	trans[0][28]	= settr(0,0,0,0,0,"i1 = (i1+1)",0,0,0);
	trans[0][32]	= settr(31,2,33,1,0,".(goto)", 1, 2, 0);
	trans[0][29]	= settr(28,2,30,2,0,"else", 1, 2, 0);
	trans[0][30]	= settr(29,2,33,102,102,"i1 = (i1+1)", 1, 2, 0);
	trans[0][35]	= settr(34,2,41,1,0,"break", 1, 2, 0);
	T = trans[0][41] = settr(40,2,0,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(40,2,37,0,0,"IF", 1, 2, 0);
	    T->nxt	= settr(40,2,39,0,0,"IF", 1, 2, 0);
	trans[0][37]	= settr(36,4,150,103,103,"((min_timeout>0))", 1, 2, 0); /* m: 38 -> 150,0 */
	reached0[38] = 1;
	trans[0][38]	= settr(0,0,0,0,0,"time_can_advance = 1",0,0,0);
	trans[0][42]	= settr(41,4,150,104,104,".(goto)", 1, 2, 0); /* m: 70 -> 0,150 */
	reached0[70] = 1;
	trans[0][39]	= settr(38,2,40,2,0,"else", 1, 2, 0);
	trans[0][40]	= settr(39,4,150,105,105,"time_can_advance = 0", 1, 2, 0); /* m: 42 -> 0,150 */
	reached0[42] = 1;
	trans[0][70]	= settr(69,0,150,106,106,".(goto)", 1, 2, 0);
	trans[0][43]	= settr(42,2,60,2,0,"else", 1, 2, 0);
	T = trans[ 0][60] = settr(59,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(59,0,44,0,0,"sub-sequence", 1, 2, 0);
	trans[0][44]	= settr(43,2,57,107,107,"i1 = 0", 1, 2, 0); /* m: 45 -> 0,57 */
	reached0[45] = 1;
	trans[0][45]	= settr(0,0,0,0,0,"min_timeout = time_out[0]",0,0,0);
	trans[0][46]	= settr(0,0,0,0,0,"i1 = 1",0,0,0);
	trans[0][58]	= settr(57,2,57,1,0,".(goto)", 1, 2, 0);
	T = trans[0][57] = settr(56,2,0,0,0,"DO", 1, 2, 0);
	T = T->nxt	= settr(56,2,47,0,0,"DO", 1, 2, 0);
	    T->nxt	= settr(56,2,49,0,0,"DO", 1, 2, 0);
	trans[0][47]	= settr(46,2,62,108,108,"((i1==5))", 1, 2, 0);
	trans[0][48]	= settr(47,2,62,1,0,"goto :b3", 1, 2, 0);
	trans[0][49]	= settr(48,2,55,2,0,"else", 1, 2, 0);
	T = trans[0][55] = settr(54,2,0,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(54,2,50,0,0,"IF", 1, 2, 0);
	    T->nxt	= settr(54,2,53,0,0,"IF", 1, 2, 0);
	trans[0][50]	= settr(49,2,57,109,109,"((min_timeout>time_out[i1]))", 1, 2, 0); /* m: 51 -> 57,0 */
	reached0[51] = 1;
	trans[0][51]	= settr(0,0,0,0,0,"min_timeout = time_out[i1]",0,0,0);
	trans[0][52]	= settr(0,0,0,0,0,"i1 = (i1+1)",0,0,0);
	trans[0][56]	= settr(55,2,57,1,0,".(goto)", 1, 2, 0);
	trans[0][53]	= settr(52,2,54,2,0,"else", 1, 2, 0);
	trans[0][54]	= settr(53,2,57,110,110,"i1 = (i1+1)", 1, 2, 0);
	trans[0][59]	= settr(58,2,62,1,0,"break", 1, 2, 0);
	T = trans[ 0][62] = settr(61,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(61,0,61,0,0,"sub-sequence", 1, 2, 0);
	trans[0][61]	= settr(60,2,67,111,111,"first_event = cal.delivery", 1, 2, 0);
	T = trans[0][67] = settr(66,2,0,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(66,2,63,0,0,"IF", 1, 2, 0);
	    T->nxt	= settr(66,2,65,0,0,"IF", 1, 2, 0);
	trans[0][63]	= settr(62,4,150,112,112,"((((min_timeout>0)&&(first_event>0))&&(first_event!=10000)))", 1, 2, 0); /* m: 64 -> 150,0 */
	reached0[64] = 1;
	trans[0][64]	= settr(0,0,0,0,0,"time_can_advance = 1",0,0,0);
	trans[0][68]	= settr(67,4,150,113,113,".(goto)", 1, 2, 0); /* m: 70 -> 0,150 */
	reached0[70] = 1;
	trans[0][65]	= settr(64,4,150,114,114,"(((min_timeout==0)||(first_event==0)))", 1, 2, 0); /* m: 66 -> 150,0 */
	reached0[66] = 1;
	trans[0][66]	= settr(0,0,0,0,0,"time_can_advance = 0",0,0,0);
	T = trans[0][150] = settr(149,0,0,0,0,"IF", 0, 2, 0);
	T = T->nxt	= settr(149,0,73,0,0,"IF", 0, 2, 0);
	    T->nxt	= settr(149,0,149,0,0,"IF", 0, 2, 0);
	trans[0][73]	= settr(72,0,148,115,0,"(time_can_advance)", 1, 2, 0);
	T = trans[ 0][148] = settr(147,2,0,0,0,"ATOMIC", 1, 2, 0);
	T->nxt	= settr(147,2,90,0,0,"ATOMIC", 1, 2, 0);
	T = trans[ 0][90] = settr(89,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(89,0,74,0,0,"sub-sequence", 1, 2, 0);
	trans[0][74]	= settr(73,2,87,116,116,"i5 = 0", 1, 2, 0); /* m: 75 -> 0,87 */
	reached0[75] = 1;
	trans[0][75]	= settr(0,0,0,0,0,"i5 = 0",0,0,0);
	trans[0][88]	= settr(87,2,87,1,0,".(goto)", 1, 2, 0);
	T = trans[0][87] = settr(86,2,0,0,0,"DO", 1, 2, 0);
	T = T->nxt	= settr(86,2,76,0,0,"DO", 1, 2, 0);
	    T->nxt	= settr(86,2,79,0,0,"DO", 1, 2, 0);
	trans[0][76]	= settr(75,2,107,117,117,"((i5==5))", 1, 2, 0); /* m: 77 -> 107,0 */
	reached0[77] = 1;
	trans[0][77]	= settr(0,0,0,0,0,"empty_cal = 1",0,0,0);
	trans[0][78]	= settr(77,2,107,1,0,"goto :b4", 1, 2, 0);
	trans[0][79]	= settr(78,2,85,118,0,"((i5!=5))", 1, 2, 0);
	T = trans[0][85] = settr(84,2,0,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(84,2,80,0,0,"IF", 1, 2, 0);
	    T->nxt	= settr(84,2,83,0,0,"IF", 1, 2, 0);
	trans[0][80]	= settr(79,2,107,119,119,"((cal.flag[i5]==1))", 1, 2, 0); /* m: 81 -> 107,0 */
	reached0[81] = 1;
	trans[0][81]	= settr(0,0,0,0,0,"empty_cal = 0",0,0,0);
	trans[0][82]	= settr(81,2,107,1,0,"goto :b4", 1, 2, 0);
	trans[0][86]	= settr(85,2,87,1,0,".(goto)", 1, 2, 0);
	trans[0][83]	= settr(82,2,84,2,0,"else", 1, 2, 0);
	trans[0][84]	= settr(83,2,87,120,120,"i5 = (i5+1)", 1, 2, 0);
	trans[0][89]	= settr(88,2,107,1,0,"break", 1, 2, 0);
	T = trans[ 0][107] = settr(106,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(106,0,91,0,0,"sub-sequence", 1, 2, 0);
	trans[0][91]	= settr(90,2,104,121,121,"i1 = 0", 1, 2, 0); /* m: 92 -> 0,104 */
	reached0[92] = 1;
	trans[0][92]	= settr(0,0,0,0,0,"min_timeout = time_out[0]",0,0,0);
	trans[0][93]	= settr(0,0,0,0,0,"i1 = 1",0,0,0);
	trans[0][105]	= settr(104,2,104,1,0,".(goto)", 1, 2, 0);
	T = trans[0][104] = settr(103,2,0,0,0,"DO", 1, 2, 0);
	T = T->nxt	= settr(103,2,94,0,0,"DO", 1, 2, 0);
	    T->nxt	= settr(103,2,96,0,0,"DO", 1, 2, 0);
	trans[0][94]	= settr(93,2,146,122,122,"((i1==5))", 1, 2, 0);
	trans[0][95]	= settr(94,2,146,1,0,"goto :b5", 1, 2, 0);
	trans[0][96]	= settr(95,2,102,2,0,"else", 1, 2, 0);
	T = trans[0][102] = settr(101,2,0,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(101,2,97,0,0,"IF", 1, 2, 0);
	    T->nxt	= settr(101,2,100,0,0,"IF", 1, 2, 0);
	trans[0][97]	= settr(96,2,104,123,123,"((min_timeout>time_out[i1]))", 1, 2, 0); /* m: 98 -> 104,0 */
	reached0[98] = 1;
	trans[0][98]	= settr(0,0,0,0,0,"min_timeout = time_out[i1]",0,0,0);
	trans[0][99]	= settr(0,0,0,0,0,"i1 = (i1+1)",0,0,0);
	trans[0][103]	= settr(102,2,104,1,0,".(goto)", 1, 2, 0);
	trans[0][100]	= settr(99,2,101,2,0,"else", 1, 2, 0);
	trans[0][101]	= settr(100,2,104,124,124,"i1 = (i1+1)", 1, 2, 0);
	trans[0][106]	= settr(105,2,146,1,0,"break", 1, 2, 0);
	T = trans[0][146] = settr(145,2,0,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(145,2,108,0,0,"IF", 1, 2, 0);
	    T->nxt	= settr(145,2,118,0,0,"IF", 1, 2, 0);
	trans[0][108]	= settr(107,2,115,125,125,"(empty_cal)", 1, 2, 0); /* m: 109 -> 115,0 */
	reached0[109] = 1;
	trans[0][109]	= settr(0,0,0,0,0,"count = 0",0,0,0);
	trans[0][116]	= settr(115,2,115,1,0,".(goto)", 1, 2, 0);
	T = trans[0][115] = settr(114,2,0,0,0,"DO", 1, 2, 0);
	T = T->nxt	= settr(114,2,110,0,0,"DO", 1, 2, 0);
	    T->nxt	= settr(114,2,113,0,0,"DO", 1, 2, 0);
	trans[0][110]	= settr(109,2,115,126,126,"((count<5))", 1, 2, 0); /* m: 111 -> 115,0 */
	reached0[111] = 1;
	trans[0][111]	= settr(0,0,0,0,0,"time_out[count] = (time_out[count]-min_timeout)",0,0,0);
	trans[0][112]	= settr(0,0,0,0,0,"count = (count+1)",0,0,0);
	trans[0][113]	= settr(112,2,117,127,127,"((count==5))", 1, 2, 0);
	trans[0][114]	= settr(113,2,117,1,0,"goto :b6", 1, 2, 0);
	trans[0][117]	= settr(116,2,147,1,0,"break", 1, 2, 0);
	trans[0][147]	= settr(146,0,152,128,128,".(goto)", 1, 2, 0);
	trans[0][118]	= settr(117,2,120,2,0,"else", 1, 2, 0);
	T = trans[ 0][120] = settr(119,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(119,0,119,0,0,"sub-sequence", 1, 2, 0);
	trans[0][119]	= settr(118,2,144,129,129,"first_event = cal.delivery", 1, 2, 0);
	T = trans[0][144] = settr(143,2,0,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(143,2,121,0,0,"IF", 1, 2, 0);
	    T->nxt	= settr(143,2,133,0,0,"IF", 1, 2, 0);
	trans[0][121]	= settr(120,2,128,130,130,"((first_event<=min_timeout))", 1, 2, 0); /* m: 122 -> 128,0 */
	reached0[122] = 1;
	trans[0][122]	= settr(0,0,0,0,0,"count = 0",0,0,0);
	trans[0][129]	= settr(128,2,128,1,0,".(goto)", 1, 2, 0);
	T = trans[0][128] = settr(127,2,0,0,0,"DO", 1, 2, 0);
	T = T->nxt	= settr(127,2,123,0,0,"DO", 1, 2, 0);
	    T->nxt	= settr(127,2,126,0,0,"DO", 1, 2, 0);
	trans[0][123]	= settr(122,2,128,131,131,"((count<5))", 1, 2, 0); /* m: 124 -> 128,0 */
	reached0[124] = 1;
	trans[0][124]	= settr(0,0,0,0,0,"time_out[count] = (time_out[count]-first_event)",0,0,0);
	trans[0][125]	= settr(0,0,0,0,0,"count = (count+1)",0,0,0);
	trans[0][126]	= settr(125,0,152,132,132,"((count==5))", 1, 2, 0); /* m: 131 -> 152,0 */
	reached0[131] = 1;
	trans[0][127]	= settr(126,2,131,1,0,"goto :b7", 1, 2, 0); /* m: 131 -> 0,152 */
	reached0[131] = 1;
	trans[0][130]	= settr(129,2,131,1,0,"break", 1, 2, 0);
	trans[0][131]	= settr(130,0,152,133,133,"cal.delivery = 0", 1, 2, 0); /* m: 132 -> 0,152 */
	reached0[132] = 1;
	trans[0][132]	= settr(0,0,0,0,0,"event_time = 0",0,0,0);
	trans[0][145]	= settr(144,0,152,134,134,".(goto)", 1, 2, 0); /* m: 147 -> 0,152 */
	reached0[147] = 1;
	trans[0][133]	= settr(132,2,134,2,0,"else", 1, 2, 0);
	trans[0][134]	= settr(133,2,140,135,135,"count = 0", 1, 2, 0);
	trans[0][141]	= settr(140,2,140,1,0,".(goto)", 1, 2, 0);
	T = trans[0][140] = settr(139,2,0,0,0,"DO", 1, 2, 0);
	T = T->nxt	= settr(139,2,135,0,0,"DO", 1, 2, 0);
	    T->nxt	= settr(139,2,138,0,0,"DO", 1, 2, 0);
	trans[0][135]	= settr(134,2,140,136,136,"((count<5))", 1, 2, 0); /* m: 136 -> 140,0 */
	reached0[136] = 1;
	trans[0][136]	= settr(0,0,0,0,0,"time_out[count] = (time_out[count]-min_timeout)",0,0,0);
	trans[0][137]	= settr(0,0,0,0,0,"count = (count+1)",0,0,0);
	trans[0][138]	= settr(137,0,152,137,137,"((count==5))", 1, 2, 0); /* m: 143 -> 152,0 */
	reached0[143] = 1;
	trans[0][139]	= settr(138,2,143,1,0,"goto :b8", 1, 2, 0); /* m: 143 -> 0,152 */
	reached0[143] = 1;
	trans[0][142]	= settr(141,2,143,1,0,"break", 1, 2, 0);
	trans[0][143]	= settr(142,0,152,138,138,"cal.delivery = (cal.delivery-min_timeout)", 1, 2, 0); /* m: 145 -> 0,152 */
	reached0[145] = 1;
	trans[0][151]	= settr(150,0,152,1,0,".(goto)", 0, 2, 0);
	trans[0][149]	= settr(148,0,152,2,0,"else", 0, 2, 0);
	trans[0][154]	= settr(153,0,155,1,0,"break", 0, 2, 0);
	trans[0][155]	= settr(154,0,0,139,139,"-end-", 0, 3500, 0);
	/* np_ demon: */
	trans[_NP_] = (Trans **) emalloc(2*sizeof(Trans *));
	T = trans[_NP_][0] = settr(9997,0,1,_T5,0,"(np_)", 1,2,0);
	    T->nxt	  = settr(9998,0,0,_T2,0,"(1)",   0,2,0);
	T = trans[_NP_][1] = settr(9999,0,1,_T5,0,"(np_)", 1,2,0);
}

Trans *
settr(	int t_id, int a, int b, int c, int d,
	char *t, int g, int tpe0, int tpe1)
{	Trans *tmp = (Trans *) emalloc(sizeof(Trans));

	tmp->atom  = a&(6|32);	/* only (2|8|32) have meaning */
	if (!g) tmp->atom |= 8;	/* no global references */
	tmp->st    = b;
	tmp->tpe[0] = tpe0;
	tmp->tpe[1] = tpe1;
	tmp->tp    = t;
	tmp->t_id  = t_id;
	tmp->forw  = c;
	tmp->back  = d;
	return tmp;
}

Trans *
cpytr(Trans *a)
{	Trans *tmp = (Trans *) emalloc(sizeof(Trans));

	int i;
	tmp->atom  = a->atom;
	tmp->st    = a->st;
#ifdef HAS_UNLESS
	tmp->e_trans = a->e_trans;
	for (i = 0; i < HAS_UNLESS; i++)
		tmp->escp[i] = a->escp[i];
#endif
	tmp->tpe[0] = a->tpe[0];
	tmp->tpe[1] = a->tpe[1];
	for (i = 0; i < 6; i++)
	{	tmp->qu[i] = a->qu[i];
		tmp->ty[i] = a->ty[i];
	}
	tmp->tp    = (char *) emalloc(strlen(a->tp)+1);
	strcpy(tmp->tp, a->tp);
	tmp->t_id  = a->t_id;
	tmp->forw  = a->forw;
	tmp->back  = a->back;
	return tmp;
}

#ifndef NOREDUCE
int
srinc_set(int n)
{	if (n <= 2) return LOCAL;
	if (n <= 2+  DELTA) return Q_FULL_F; /* 's' or nfull  */
	if (n <= 2+2*DELTA) return Q_EMPT_F; /* 'r' or nempty */
	if (n <= 2+3*DELTA) return Q_EMPT_T; /* empty */
	if (n <= 2+4*DELTA) return Q_FULL_T; /* full  */
	if (n ==   5*DELTA) return GLOBAL;
	if (n ==   6*DELTA) return TIMEOUT_F;
	if (n ==   7*DELTA) return ALPHA_F;
	Uerror("cannot happen srinc_class");
	return BAD;
}
int
srunc(int n, int m)
{	switch(m) {
	case Q_FULL_F: return n-2;
	case Q_EMPT_F: return n-2-DELTA;
	case Q_EMPT_T: return n-2-2*DELTA;
	case Q_FULL_T: return n-2-3*DELTA;
	case ALPHA_F:
	case TIMEOUT_F: return 257; /* non-zero, and > MAXQ */
	}
	Uerror("cannot happen srunc");
	return 0;
}
#endif
int cnt;
#ifdef HAS_UNLESS
int
isthere(Trans *a, int b)
{	Trans *t;
	for (t = a; t; t = t->nxt)
		if (t->t_id == b)
			return 1;
	return 0;
}
#endif
#ifndef NOREDUCE
int
mark_safety(Trans *t) /* for conditional safety */
{	int g = 0, i, j, k;

	if (!t) return 0;
	if (t->qu[0])
		return (t->qu[1])?2:1;	/* marked */

	for (i = 0; i < 2; i++)
	{	j = srinc_set(t->tpe[i]);
		if (j >= GLOBAL && j != ALPHA_F)
			return -1;
		if (j != LOCAL)
		{	k = srunc(t->tpe[i], j);
			if (g == 0
			||  t->qu[0] != k
			||  t->ty[0] != j)
			{	t->qu[g] = k;
				t->ty[g] = j;
				g++;
	}	}	}
	return g;
}
#endif
void
retrans(int n, int m, int is, short srcln[], uchar reach[], uchar lpstate[])
	/* process n, with m states, is=initial state */
{	Trans *T0, *T1, *T2, *T3;
	Trans *T4, *T5; /* t_reverse or has_unless */
	int i;
#if defined(HAS_UNLESS) || !defined(NOREDUCE)
	int k;
#endif
#ifndef NOREDUCE
	int g, h, j, aa;
#endif
#ifdef HAS_UNLESS
	int p;
#endif
	if (state_tables >= 4)
	{	printf("STEP 1 %s\n", 
			procname[n]);
		for (i = 1; i < m; i++)
		for (T0 = trans[n][i]; T0; T0 = T0->nxt)
			crack(n, i, T0, srcln);
		return;
	}
	do {
		for (i = 1, cnt = 0; i < m; i++)
		{	T2 = trans[n][i];
			T1 = T2?T2->nxt:(Trans *)0;
/* prescan: */		for (T0 = T1; T0; T0 = T0->nxt)
/* choice in choice */	{	if (T0->st && trans[n][T0->st]
				&&  trans[n][T0->st]->nxt)
					break;
			}
#if 0
		if (T0)
		printf("\tstate %d / %d: choice in choice\n",
		i, T0->st);
#endif
			if (T0)
			for (T0 = T1; T0; T0 = T0->nxt)
			{	T3 = trans[n][T0->st];
				if (!T3->nxt)
				{	T2->nxt = cpytr(T0);
					T2 = T2->nxt;
					imed(T2, T0->st, n, i);
					continue;
				}
				do {	T3 = T3->nxt;
					T2->nxt = cpytr(T3);
					T2 = T2->nxt;
					imed(T2, T0->st, n, i);
				} while (T3->nxt);
				cnt++;
			}
		}
	} while (cnt);
	if (state_tables >= 3)
	{	printf("STEP 2 %s\n", 
			procname[n]);
		for (i = 1; i < m; i++)
		for (T0 = trans[n][i]; T0; T0 = T0->nxt)
			crack(n, i, T0, srcln);
		return;
	}
	for (i = 1; i < m; i++)
	{	if (trans[n][i] && trans[n][i]->nxt) /* optimize */
		{	T1 = trans[n][i]->nxt;
#if 0
			printf("\t\tpull %d (%d) to %d\n",
			T1->st, T1->forw, i);
#endif
			srcln[i] = srcln[T1->st];	/* Oyvind Teig, 5.2.0 */

			if (!trans[n][T1->st]) continue;
			T0 = cpytr(trans[n][T1->st]);
			trans[n][i] = T0;
			reach[T1->st] = 1;
			imed(T0, T1->st, n, i);
			for (T1 = T1->nxt; T1; T1 = T1->nxt)
			{
#if 0
			printf("\t\tpull %d (%d) to %d\n",
				T1->st, T1->forw, i);
#endif
		/*		srcln[i] = srcln[T1->st];  gh: not useful */
				if (!trans[n][T1->st]) continue;
				T0->nxt = cpytr(trans[n][T1->st]);
				T0 = T0->nxt;
				reach[T1->st] = 1;
				imed(T0, T1->st, n, i);
	}	}	}
	if (state_tables >= 2)
	{	printf("STEP 3 %s\n", 
			procname[n]);
		for (i = 1; i < m; i++)
		for (T0 = trans[n][i]; T0; T0 = T0->nxt)
			crack(n, i, T0, srcln);
		return;
	}
#ifdef HAS_UNLESS
	for (i = 1; i < m; i++)
	{	if (!trans[n][i]) continue;
		/* check for each state i if an
		 * escape to some state p is defined
		 * if so, copy and mark p's transitions
		 * and prepend them to the transition-
		 * list of state i
		 */
	 if (!like_java) /* the default */
	 {	for (T0 = trans[n][i]; T0; T0 = T0->nxt)
		for (k = HAS_UNLESS-1; k >= 0; k--)
		{	if (p = T0->escp[k])
			for (T1 = trans[n][p]; T1; T1 = T1->nxt)
			{	if (isthere(trans[n][i], T1->t_id))
					continue;
				T2 = cpytr(T1);
				T2->e_trans = p;
				T2->nxt = trans[n][i];
				trans[n][i] = T2;
		}	}
	 } else /* outermost unless checked first */
	 {	T4 = T3 = (Trans *) 0;
		for (T0 = trans[n][i]; T0; T0 = T0->nxt)
		for (k = HAS_UNLESS-1; k >= 0; k--)
		{	if (p = T0->escp[k])
			for (T1 = trans[n][p]; T1; T1 = T1->nxt)
			{	if (isthere(trans[n][i], T1->t_id))
					continue;
				T2 = cpytr(T1);
				T2->nxt = (Trans *) 0;
				T2->e_trans = p;
				if (T3)	T3->nxt = T2;
				else	T4 = T2;
				T3 = T2;
		}	}
		if (T4)
		{	T3->nxt = trans[n][i];
			trans[n][i] = T4;
		}
	 }
	}
#endif
#ifndef NOREDUCE
	for (i = 1; i < m; i++)
	{	if (a_cycles)
		{ /* moves through these states are visible */
	#if PROG_LAB>0 && defined(HAS_NP)
			if (progstate[n][i])
				goto degrade;
			for (T1 = trans[n][i]; T1; T1 = T1->nxt)
				if (progstate[n][T1->st])
					goto degrade;
	#endif
			if (accpstate[n][i] || visstate[n][i])
				goto degrade;
			for (T1 = trans[n][i]; T1; T1 = T1->nxt)
				if (accpstate[n][T1->st])
					goto degrade;
		}
		T1 = trans[n][i];
		if (!T1) continue;
		g = mark_safety(T1);	/* V3.3.1 */
		if (g < 0) goto degrade; /* global */
		/* check if mixing of guards preserves reduction */
		if (T1->nxt)
		{	k = 0;
			for (T0 = T1; T0; T0 = T0->nxt)
			{	if (!(T0->atom&8))
					goto degrade;
				for (aa = 0; aa < 2; aa++)
				{	j = srinc_set(T0->tpe[aa]);
					if (j >= GLOBAL && j != ALPHA_F)
						goto degrade;
					if (T0->tpe[aa]
					&&  T0->tpe[aa]
					!=  T1->tpe[0])
						k = 1;
			}	}
			/* g = 0;	V3.3.1 */
			if (k)	/* non-uniform selection */
			for (T0 = T1; T0; T0 = T0->nxt)
			for (aa = 0; aa < 2; aa++)
			{	j = srinc_set(T0->tpe[aa]);
				if (j != LOCAL)
				{	k = srunc(T0->tpe[aa], j);
					for (h = 0; h < 6; h++)
						if (T1->qu[h] == k
						&&  T1->ty[h] == j)
							break;
					if (h >= 6)
					{	T1->qu[g%6] = k;
						T1->ty[g%6] = j;
						g++;
			}	}	}
			if (g > 6)
			{	T1->qu[0] = 0;	/* turn it off */
				printf("pan: warning, line %d, ",
					srcln[i]);
			 	printf("too many stmnt types (%d)",
					g);
			  	printf(" in selection\n");
			  goto degrade;
			}
		}
		/* mark all options global if >=1 is global */
		for (T1 = trans[n][i]; T1; T1 = T1->nxt)
			if (!(T1->atom&8)) break;
		if (T1)
degrade:	for (T1 = trans[n][i]; T1; T1 = T1->nxt)
			T1->atom &= ~8;	/* mark as unsafe */
		/* can only mix 'r's or 's's if on same chan */
		/* and not mixed with other local operations */
		T1 = trans[n][i];
		if (!T1 || T1->qu[0]) continue;
		j = T1->tpe[0];
		if (T1->nxt && T1->atom&8)
		{ if (j == 5*DELTA)
		  {	printf("warning: line %d ", srcln[i]);
			printf("mixed condition ");
			printf("(defeats reduction)\n");
			goto degrade;
		  }
		  for (T0 = T1; T0; T0 = T0->nxt)
		  for (aa = 0; aa < 2; aa++)
		  if  (T0->tpe[aa] && T0->tpe[aa] != j)
		  {	printf("warning: line %d ", srcln[i]);
			printf("[%d-%d] mixed %stion ",
				T0->tpe[aa], j, 
				(j==5*DELTA)?"condi":"selec");
			printf("(defeats reduction)\n");
			printf("	'%s' <-> '%s'\n",
				T1->tp, T0->tp);
			goto degrade;
		} }
	}
#endif
	for (i = 1; i < m; i++)
	{	T2 = trans[n][i];
		if (!T2
		||  T2->nxt
		||  strncmp(T2->tp, ".(goto)", 7)
		||  !stopstate[n][i])
			continue;
		stopstate[n][T2->st] = 1;
	}
	if (state_tables && !verbose)
	{	if (dodot)
		{	char buf[256], *q = buf, *p = procname[n];
			while (*p != '\0')
			{	if (*p != ':')
				{	*q++ = *p;
				}
				p++;
			}
			*q = '\0';
			printf("digraph ");
			switch (Btypes[n]) {
			case I_PROC:  printf("init {\n"); break;
			case N_CLAIM: printf("claim_%s {\n", buf); break;
			case E_TRACE: printf("notrace {\n"); break;
			case N_TRACE: printf("trace {\n"); break;
			default:      printf("p_%s {\n", buf); break;
			}
			printf("size=\"8,10\";\n");
			printf("  GT [shape=box,style=dotted,label=\"%s\"];\n", buf);
			printf("  GT -> S%d;\n", is);
		} else
		{	switch (Btypes[n]) {
			case I_PROC:  printf("init\n"); break;
			case N_CLAIM: printf("claim %s\n", procname[n]); break;
			case E_TRACE: printf("notrace assertion\n"); break;
			case N_TRACE: printf("trace assertion\n"); break;
			default:      printf("proctype %s\n", procname[n]); break;
		}	}
		for (i = 1; i < m; i++)
		{	reach[i] = 1;
		}
		tagtable(n, m, is, srcln, reach);
		if (dodot) printf("}\n");
	} else
	for (i = 1; i < m; i++)
	{	int nrelse;
		if (Btypes[n] != N_CLAIM)
		{	for (T0 = trans[n][i]; T0; T0 = T0->nxt)
			{	if (T0->st == i
				&& strcmp(T0->tp, "(1)") == 0)
				{	printf("error: proctype '%s' ",
						procname[n]);
		  			printf("line %d, state %d: has un",
						srcln[i], i);
					printf("conditional self-loop\n");
					pan_exit(1);
		}	}	}
		nrelse = 0;
		for (T0 = trans[n][i]; T0; T0 = T0->nxt)
		{	if (strcmp(T0->tp, "else") == 0)
				nrelse++;
		}
		if (nrelse > 1)
		{	printf("error: proctype '%s' state",
				procname[n]);
		  	printf(" %d, inherits %d", i, nrelse);
		  	printf(" 'else' stmnts\n");
			pan_exit(1);
	}	}
#if !defined(LOOPSTATE) && !defined(BFS_PAR)
	if (state_tables)
#endif
	do_dfs(n, m, is, srcln, reach, lpstate);

	if (!t_reverse)
	{	return;
	}
	/* process n, with m states, is=initial state -- reverse list */
	if (!state_tables && Btypes[n] != N_CLAIM)
	{	for (i = 1; i < m; i++)
		{	Trans *Tx = (Trans *) 0; /* list of escapes */
			Trans *Ty = (Trans *) 0; /* its tail element */
			T1 = (Trans *) 0; /* reversed list */
			T2 = (Trans *) 0; /* its tail */
			T3 = (Trans *) 0; /* remembers possible 'else' */

			/* find unless-escapes, they should go first */
			T4 = T5 = T0 = trans[n][i];
	#ifdef HAS_UNLESS
			while (T4 && T4->e_trans) /* escapes are first in orig list */
			{	T5 = T4;	  /* remember predecessor */
				T4 = T4->nxt;
			}
	#endif
			/* T4 points to first non-escape, T5 to its parent, T0 to original list */
			if (T4 != T0)		 /* there was at least one escape */
			{	T3 = T5->nxt;		 /* start of non-escapes */
				T5->nxt = (Trans *) 0;	 /* separate */
				Tx = T0;		 /* start of the escapes */
				Ty = T5;		 /* its tail */
				T0 = T3;		 /* the rest, to be reversed */
			}
			/* T0 points to first non-escape, Tx to the list of escapes, Ty to its tail */

			/* first tail-add non-escape transitions, reversed */
			T3 = (Trans *) 0;
			for (T5 = T0; T5; T5 = T4)
			{	T4 = T5->nxt;
	#ifdef HAS_UNLESS
				if (T5->e_trans)
				{	printf("error: cannot happen!\n");
					continue;
				}
	#endif
				if (strcmp(T5->tp, "else") == 0)
				{	T3 = T5;
					T5->nxt = (Trans *) 0;
				} else
				{	T5->nxt = T1;
					if (!T1) { T2 = T5; }
					T1 = T5;
			}	}
			/* T3 points to a possible else, which is removed from the list */
			/* T1 points to the reversed list so far (without escapes) */
			/* T2 points to the tail element -- where the else should go */
			if (T2 && T3)
			{	T2->nxt = T3;	/* add else */
			} else
			{	if (T3) /* there was an else, but there's no tail */
				{	if (!T1)	/* and no reversed list */
					{	T1 = T3; /* odd, but possible */
					} else		/* even stranger */
					{	T1->nxt = T3;
			}	}	}

			/* add in the escapes, to that they appear at the front */
			if (Tx && Ty) { Ty->nxt = T1; T1 = Tx; }

			trans[n][i] = T1;
			/* reversed, with escapes first and else last */
	}	}
	if (state_tables && verbose)
	{	printf("FINAL proctype %s\n", 
			procname[n]);
		for (i = 1; i < m; i++)
		for (T0 = trans[n][i]; T0; T0 = T0->nxt)
			crack(n, i, T0, srcln);
	}
}
void
imed(Trans *T, int v, int n, int j)	/* set intermediate state */
{	progstate[n][T->st] |= progstate[n][v];
	accpstate[n][T->st] |= accpstate[n][v];
	stopstate[n][T->st] |= stopstate[n][v];
	mapstate[n][j] = T->st;
}
void
tagtable(int n, int m, int is, short srcln[], uchar reach[])
{	Trans *z;

	if (is >= m || !trans[n][is]
	||  is <= 0 || reach[is] == 0)
		return;
	reach[is] = 0;
	if (state_tables)
	for (z = trans[n][is]; z; z = z->nxt)
	{	if (dodot)
			dot_crack(n, is, z);
		else
			crack(n, is, z, srcln);
	}

	for (z = trans[n][is]; z; z = z->nxt)
	{
#ifdef HAS_UNLESS
		int i, j;
#endif
		tagtable(n, m, z->st, srcln, reach);
#ifdef HAS_UNLESS
		for (i = 0; i < HAS_UNLESS; i++)
		{	j = trans[n][is]->escp[i];
			if (!j) break;
			tagtable(n, m, j, srcln, reach);
		}
#endif
	}
}

extern Trans *t_id_lkup[];

void
dfs_table(int n, int m, int is, short srcln[], uchar reach[], uchar lpstate[])
{	Trans *z;

	if (is >= m || is <= 0 || !trans[n][is])
		return;
	if ((reach[is] & (4|8|16)) != 0)
	{	if ((reach[is] & (8|16)) == 16)	/* on stack, not yet recorded */
		{	lpstate[is] = 1;
			reach[is] |= 8; /* recorded */
			if (state_tables && verbose)
			{	printf("state %d line %d is a loopstate\n", is, srcln[is]);
		}	}
		return;
	}
	reach[is] |= (4|16);	/* visited | onstack */
	for (z = trans[n][is]; z; z = z->nxt)
	{	t_id_lkup[z->t_id] = z;
#ifdef HAS_UNLESS
		int i, j;
#endif
		dfs_table(n, m, z->st, srcln, reach, lpstate);
#ifdef HAS_UNLESS
		for (i = 0; i < HAS_UNLESS; i++)
		{	j = trans[n][is]->escp[i];
			if (!j) break;
			dfs_table(n, m, j, srcln, reach, lpstate);
		}
#endif
	}
	reach[is] &= ~16; /* no longer on stack */
}
void
do_dfs(int n, int m, int is, short srcln[], uchar reach[], uchar lpstate[])
{	int i;
	dfs_table(n, m, is, srcln, reach, lpstate);
	for (i = 0; i < m; i++)
		reach[i] &= ~(4|8|16);
}
void
crack(int n, int j, Trans *z, short srcln[])
{	int i;

	if (!z) return;
	printf("	state %3d -(tr %3d)-> state %3d  ",
		j, z->forw, z->st);
	printf("[id %3d tp %3d", z->t_id, z->tpe[0]);
	if (z->tpe[1]) printf(",%d", z->tpe[1]);
#ifdef HAS_UNLESS
	if (z->e_trans)
		printf(" org %3d", z->e_trans);
	else if (state_tables >= 2)
	for (i = 0; i < HAS_UNLESS; i++)
	{	if (!z->escp[i]) break;
		printf(" esc %d", z->escp[i]);
	}
#endif
	printf("]");
	printf(" [%s%s%s%s%s] %s:%d => ",
		z->atom&6?"A":z->atom&32?"D":"-",
		accpstate[n][j]?"a" :"-",
		stopstate[n][j]?"e" : "-",
		progstate[n][j]?"p" : "-",
		z->atom & 8 ?"L":"G",
		PanSource, srcln[j]);
	for (i = 0; z->tp[i]; i++)
		if (z->tp[i] == '\n')
			printf("\\n");
		else
			putchar(z->tp[i]);
	if (verbose && z->qu[0])
	{	printf("\t[");
		for (i = 0; i < 6; i++)
			if (z->qu[i])
				printf("(%d,%d)",
				z->qu[i], z->ty[i]);
		printf("]");
	}
	printf("\n");
	fflush(stdout);
}
/* spin -a m.pml; cc -o pan pan.c; ./pan -D | dot -Tps > foo.ps; ps2pdf foo.ps */
void
dot_crack(int n, int j, Trans *z)
{	int i;

	if (!z) return;
	printf("	S%d -> S%d  [color=black", j, z->st);

	if (z->atom&6) printf(",style=dashed");
	else if (z->atom&32) printf(",style=dotted");
	else if (z->atom&8) printf(",style=solid");
	else printf(",style=bold");

	printf(",label=\"");
	for (i = 0; z->tp[i]; i++)
	{	if (z->tp[i] == '\\'
		&&  z->tp[i+1] == 'n')
		{	i++; printf(" ");
		} else
		{	putchar(z->tp[i]);
	}	}
	printf("\"];\n");
	if (accpstate[n][j]) printf("  S%d [color=red,style=bold];\n", j);
	else if (progstate[n][j]) printf("  S%d [color=green,style=bold];\n", j);
	if (stopstate[n][j]) printf("  S%d [color=blue,style=bold,shape=box];\n", j);
}

#ifdef VAR_RANGES
#define BYTESIZE	32	/* 2^8 : 2^3 = 256:8 = 32 */

typedef struct Vr_Ptr {
	char	*nm;
	uchar	vals[BYTESIZE];
	struct Vr_Ptr *nxt;
} Vr_Ptr;
Vr_Ptr *ranges = (Vr_Ptr *) 0;

void
logval(char *s, int v)
{	Vr_Ptr *tmp;

	if (v<0 || v > 255) return;
	for (tmp = ranges; tmp; tmp = tmp->nxt)
		if (!strcmp(tmp->nm, s))
			goto found;
	tmp = (Vr_Ptr *) emalloc(sizeof(Vr_Ptr));
	tmp->nxt = ranges;
	ranges = tmp;
	tmp->nm = s;
found:
	tmp->vals[(v)/8] |= 1<<((v)%8);
}

void
dumpval(uchar X[], int range)
{	int w, x, i, j = -1;

	for (w = i = 0; w < range; w++)
	for (x = 0; x < 8; x++, i++)
	{
from:		if ((X[w] & (1<<x)))
		{	printf("%d", i);
			j = i;
			goto upto;
	}	}
	return;
	for (w = 0; w < range; w++)
	for (x = 0; x < 8; x++, i++)
	{
upto:		if (!(X[w] & (1<<x)))
		{	if (i-1 == j)
				printf(", ");
			else
				printf("-%d, ", i-1);
			goto from;
	}	}
	if (j >= 0 && j != 255)
		printf("-255");
}

void
dumpranges(void)
{	Vr_Ptr *tmp;
	printf("\nValues assigned within ");
	printf("interval [0..255]:\n");
	for (tmp = ranges; tmp; tmp = tmp->nxt)
	{	printf("\t%s\t: ", tmp->nm);
		dumpval(tmp->vals, BYTESIZE);
		printf("\n");
	}
}
#endif
