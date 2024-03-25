/* Level 1 */
*Question 1;
proc print data=pg1.np_summary;
	var Type ParkName;
	where Type contains "PRE";
run;

*Question 2;
proc print data=pg1.eu_occ;
	where Hotel > 40000000;
run;

*There are 101 rows in the table where Hotel, ShortStay, and Camp are missing;
*July and August are the months included when hotel values are greater than 40M;

/* Level 2 */
*Question 3;

%let ParkCode=ZION;
%let SpeciesCat=Bird;

proc freq data=pg1.np_species;
	where Species_ID contains "&ParkCode"  and Category = "&SpeciesCat";
	table Abundance Conservation_Status;
run;

proc print data=pg1.np_species;
	var Species_ID Category Scientific_Name Common_Names;
	where Species_ID contains "&ParkCode" and Category = "&SpeciesCat";
run;

/* Challenge */
proc print data=pg1.np_traffic;
	where Count ^= 0 and upcase(Location) contains "MAIN ENTRANCE";
run;