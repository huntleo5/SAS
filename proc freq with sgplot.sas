/* 5.2 Practice */
/* Level 1 */
*Question 1;

title "Categories of Reported Species";
title2 "in the Everglades";

ods graphics;
ods noproctitle;

proc freq data=pg1.np_species order=freq;
	tables Category / nocum plots=freqplot;
	where Species_ID contains "EVER" and Category ne
			"Vascular Plant";
run;

/* Level 2 */
*Question 2;

title "Park Types by Region";

proc freq data=pg1.np_codelookup order=freq;
	table Type*Region / nocol;
	where Type not like "%Other%";
run;
title;

*The top three park types by frequency count are National
	Historic Site, National Monument, and National Park.;

title "Selected Park Types by Region";
ods graphics on;

proc freq data=pg1.np_codelookup order=freq;
	table Type*Region / nocol crosslist plots=freqplot
			(Groupby=row orient=horizontal scale=percent);
	where Type in ("National Historic Site", "National Monument,
				National Park");
	where Type not like "%Other%";
run;

/* Challenge */
*Question 3;

proc sgplot data=pg1.np_codelookup;
    where Type in ("National Historic Site", 
				   "National Monument",
                   "National Park");
    hbar region / group=type seglabel
                  fillattrs=(transparency=0.5) dataskin=crisp;
    keylegend / opaque across=1 position=bottomright
                location=inside;
    xaxis grid;
run;
title;
