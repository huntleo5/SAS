ods rtf file="&outpath/QBstats.rtf" style=Journal startpage=no;

*Print the data set;
title "2023 NCAA Quarterback Passing Statistics";

proc print data=pg1.totalqb (obs=20);
run;

title;

*Calculate correlations among variables as they relate to Pass.Eff;
title "Passing Statistic Correlation Coefficients as They Relate to Passing Efficiency";

proc corr data=pg1.totalqb;
	var "PASS.EFF"n;
	with _numeric_;
run;

title;

*Visualize above correlations through scatterplots;
title "Scatterplot of Passing Efficiency Rating vs. Completion Percentage";

proc sgplot data=pg1.totalqb;
	SCATTER X = "PASS.EFF"n Y = "COM.PERCENT"n;
run;

title;

title "Scatterplot of Passing Efficiency Rating vs. Passing Touchdowns Thrown";

proc sgplot data=pg1.totalqb;
	SCATTER X = "PASS.EFF"n Y = "PASS.TD"n;
run;

title;

title "Scatterplot of Passing Efficiency Rating vs. Passing Yards Thrown";

proc sgplot data=pg1.totalqb;
	SCATTER X = "PASS.EFF"n Y = "PASS.YDS"n;
run;

title;

title "Scatterplot of Passing Efficiency Rating vs. Interceptions Thrown";

proc sgplot data=pg1.totalqb;
	SCATTER X = "PASS.EFF"n Y = "INT"n;
run;

title;

*Perform Multiple Regression to determine best fitted model;
title "Regression Analysis";

proc reg data=pg1.totalqb;
	model "PASS.EFF"n = "COM.PERCENT"n "INT"n "PASS.TD"n "PASS.YDS"n / selection=adjrsq sse aic;
run;

title;