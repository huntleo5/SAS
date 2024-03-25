/* Level 1 */
*Question 1;
proc sort data=pg1.np_summary out="np_sort";
	by Reg descending DayVisits;
	where Type = "NP";
run;

/* Level 2 */
*Question 2;

proc sort data=pg1.np_largeparks 
	out="park_clean"
	noduprecs
	dupout="park_dups";
	by _all_;
run;

/* Challenge */
*Question 3;

proc sort data=pg1.eu_occ
	out="countrylist"(KEEP=Geo Country)
	nodupkey;
	by Geo Country;
run;