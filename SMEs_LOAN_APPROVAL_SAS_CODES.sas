
/**************************************************************************************

Name of DS: Ms. Lam Ying Xian 
Description: The project is about the prediction of loan approval in private bank.
             The first task is to explore the dataset;
             The second task is to cleanse the dataset; and
             The third task is to build the predictive model.
Date first written: Mon, 19-Jul-2021
Date last updated: Mon, 7-Sep-2021
Library name: MYLIB038

***************************************************************************************/

/**********************************************
7.3 To create a copy of the training dataset
*********************************************/

TITLE 'Create A Copy of the Training Dataset';

PROC SQL;

CREATE TABLE MYLIB038.TRAINING_DS_TP063038_COPY AS SELECT * FROM 
MYLIB038.TRAINING_DS;

QUIT;

/****************************************************
7.4 To display the structure of the training dataset
*****************************************************/

TITLE 'To Display the Structure of the Training Dataset';

PROC SQL;

DESCRIBE TABLE MYLIB038.TRAINING_DS_TP063038_COPY;

QUIT;

/**********************************************
7.5 Label Each Variable in the Training Dataset
***********************************************/

TITLE 'Label Each Variable in the Training Dataset';

DATA MYLIB038.TRAINING_DS_TP063038_COPY1;
	SET MYLIB038.TRAINING_DS_TP063038_COPY;
	LABEL SME_LOAN_ID_NO='Loan Application Number'
		  GENDER='Gender' 
		  MARITAL_STATUS='Marital Status' 
		  FAMILY_MEMBERS='Family Members' 
		  QUALIFICATION='Qualification' 
		  EMPLOYMENT='Employment' 
		  CANDIDATE_INCOME='Candidate Income' 
		  GUARANTEE_INCOME='Guarantee Income' 
		  LOAN_AMOUNT='Loan Amount' 
		  LOAN_DURATION='Loan Duration' 
		  LOAN_HISTORY='Loan History' 
		  LOAN_LOCATION='Loan Location' 
		  LOAN_APPROVAL_STATUS='Loan Approval Status';
RUN;

/*Show the Output of the Updated Labels*/
TITLE 'Output of the Updated Labels';

PROC SQL;
	SELECT * FROM MYLIB038.TRAINING_DS_TP063038_COPY1;
QUIT;



/*Univariate Analysis*/


/*********************************
7.6.2 Univariate Analysis on Gender
**********************************/

TITLE 'Univariate Analysis on Gender';
TITLE2 'Section 7.6.2';

PROC FREQ DATA=MYLIB038.TRAINING_DS_TP063038_COPY1;
	TABLE GENDER;
RUN;

ODS GRAPHICS / RESET WIDTH=4.0 IN HEIGHT=3.0 IN IMAGEMAP;

PROC SGPLOT DATA=MYLIB038.TRAINING_DS_TP063038_COPY1;
	VBAR GENDER;
RUN;


/******************************************
7.6.3 Univariate Analysis on Marital Status
*******************************************/

TITLE 'Univariate Analysis on Marital Status';
TITLE2 'Figure 7.6.3';

PROC FREQ DATA=MYLIB038.TRAINING_DS_TP063038_COPY1;
	TABLE MARITAL_STATUS;
RUN;

ODS GRAPHICS / RESET WIDTH=4.0 IN HEIGHT=3.0 IN IMAGEMAP;

PROC SGPLOT DATA=MYLIB038.TRAINING_DS_TP063038_COPY1;
	VBAR MARITAL_STATUS;
RUN;


/******************************************
7.6.4 Univariate Analysis on Family Members
*******************************************/

TITLE 'Univariate Analysis on Family Members';
TITLE2 'Figure 7.6.4';

PROC FREQ DATA=MYLIB038.TRAINING_DS_TP063038_COPY1;
	TABLE FAMILY_MEMBERS;
RUN;

ODS GRAPHICS / RESET WIDTH=4.0 IN HEIGHT=3.0 IN IMAGEMAP;

PROC SGPLOT DATA=MYLIB038.TRAINING_DS_TP063038_COPY1;
	VBAR FAMILY_MEMBERS;
RUN;


/*****************************************
7.6.5 Univariate Analysis on Qualification
******************************************/

TITLE 'Univariate Analysis on Qualification';
TITLE2 'Figure 7.6.5';

PROC FREQ DATA=MYLIB038.TRAINING_DS_TP063038_COPY1;
	TABLE QUALIFICATION;
RUN;

ODS GRAPHICS / RESET WIDTH=4.0 IN HEIGHT=3.0 IN IMAGEMAP;

PROC SGPLOT DATA=MYLIB038.TRAINING_DS_TP063038_COPY1;
	VBAR QUALIFICATION;
RUN;


/***************************************
7.6.6 Univariate Analysis on Employment
****************************************/

TITLE 'Univariate Analysis on Employment';
TITLE2 'Figure 7.6.6';

PROC FREQ DATA=MYLIB038.TRAINING_DS_TP063038_COPY1;
	TABLE EMPLOYMENT;
RUN;

ODS GRAPHICS / RESET WIDTH=4.0 IN HEIGHT=3.0 IN IMAGEMAP;

PROC SGPLOT DATA=MYLIB038.TRAINING_DS_TP063038_COPY1;
	VBAR EMPLOYMENT;
RUN;


/***************************************
7.6.7 Univariate Analysis on Loan History
****************************************/

TITLE 'Univariate Analysis on Loan History';
TITLE2 'Figure 7.6.7';

PROC FREQ DATA=MYLIB038.TRAINING_DS_TP063038_COPY1;
	TABLE LOAN_HISTORY;
RUN;

ODS GRAPHICS / RESET WIDTH=4.0 IN HEIGHT=3.0 IN IMAGEMAP;

PROC SGPLOT DATA=MYLIB038.TRAINING_DS_TP063038_COPY1;
	VBAR LOAN_HISTORY;
RUN;


/*****************************************
7.6.8 Univariate Analysis on Loan Location
******************************************/

TITLE 'Univariate Analysis on Loan Location';
TITLE2 'Figure 7.6.8';

PROC FREQ DATA=MYLIB038.TRAINING_DS_TP063038_COPY1;
	TABLE LOAN_LOCATION;
RUN;

ODS GRAPHICS / RESET WIDTH=4.0 IN HEIGHT=3.0 IN IMAGEMAP;

PROC SGPLOT DATA=MYLIB038.TRAINING_DS_TP063038_COPY1;
	VBAR LOAN_LOCATION;
RUN;


/************************************************
7.6.9 Univariate Analysis on Loan Approval Status
*************************************************/

TITLE 'Univariate Analysis on Loan Approval Status';
TITLE2 'Figure 7.6.9';

PROC FREQ DATA=MYLIB038.TRAINING_DS_TP063038_COPY1;
	TABLE LOAN_APPROVAL_STATUS;
RUN;

ODS GRAPHICS / RESET WIDTH=4.0 IN HEIGHT=3.0 IN IMAGEMAP;

PROC SGPLOT DATA=MYLIB038.TRAINING_DS_TP063038_COPY1;
	VBAR LOAN_APPROVAL_STATUS;
RUN;


/********************************************
7.6.10 Univariate Analysis on Loan Duration
*********************************************/

PROC MEANS DATA=MYLIB038.TRAINING_DS_TP063038_COPY1 N NMISS MIN MAX MEAN MEDIAN 
		STD;
	VAR LOAN_DURATION;
	TITLE "FIG 7.6.10 Univariate Analysis on Loan Duration";
RUN;

ODS GRAPHICS / RESET WIDTH=4.0 IN HEIGHT=3.0 IN IMAGEMAP;

PROC SGPLOT DATA=MYLIB038.TRAINING_DS_TP063038_COPY1;
	HISTOGRAM LOAN_DURATION;
	TITLE "FIG 7.6.10 Univariate Analysis on Loan Duration";
RUN;


/********************************************
7.6.11 Univariate Analysis on Candidate Income
*********************************************/

PROC MEANS DATA=MYLIB038.TRAINING_DS_TP063038_COPY1 N NMISS MIN MAX MEAN MEDIAN 
		STD;
	VAR CANDIDATE_INCOME;
	TITLE "FIG 7.6.11 Univariate Analysis on Candidate Income";
RUN;

ODS GRAPHICS / RESET WIDTH=4.0 IN HEIGHT=3.0 IN IMAGEMAP;

PROC SGPLOT DATA=MYLIB038.TRAINING_DS_TP063038_COPY1;
	HISTOGRAM CANDIDATE_INCOME;
	TITLE "FIG 7.6.11 Univariate Analysis on Candidate Income";
RUN;


/********************************************
7.6.12 Univariate Analysis on Guarantee Income
*********************************************/

PROC MEANS DATA=MYLIB038.TRAINING_DS_TP063038_COPY1 N NMISS MIN MAX MEAN MEDIAN 
		STD;
	VAR GUARANTEE_INCOME;
	TITLE "FIG 7.6.12 Univariate Analysis on Guarantee Income";
RUN;

ODS GRAPHICS / RESET WIDTH=4.0 IN HEIGHT=3.0 IN IMAGEMAP;

PROC SGPLOT DATA=MYLIB038.TRAINING_DS_TP063038_COPY1;
	HISTOGRAM GUARANTEE_INCOME;
	TITLE "FIG 7.6.12 Univariate Analysis on Guarantee Income";
RUN;


/*****************************************
7.6.13 Univariate Analysis on Loan Amount
******************************************/

PROC MEANS DATA=MYLIB038.TRAINING_DS_TP063038_COPY1 N NMISS MIN MAX MEAN MEDIAN 
		STD;
	VAR LOAN_AMOUNT;
	TITLE "FIG 7.6.13 Univariate Analysis on Loan Amount";
RUN;

ODS GRAPHICS / RESET WIDTH=4.0 IN HEIGHT=3.0 IN IMAGEMAP;

PROC SGPLOT DATA=MYLIB038.TRAINING_DS_TP063038_COPY1;
	HISTOGRAM LOAN_AMOUNT;
	TITLE "FIG 7.6.13 Univariate Analysis on Loan Amount";
RUN;


/*Bivariate Analysis - relationship between two variables*/
/*MACRO: return 1 but call it multiple times; p = parameter*/

/**************************************************************
7.7 Define MACRO for Bivariate Analysis on Categorical Variables 
***************************************************************/
%MACRO MYMACRO_BIVA_TP038(pds_name, pcategory_variable_1, pcategory_variable_2, 
		ptitle_1, ptitle_2);
	PROC FREQ DATA=&pds_name;
		TABLE &pcategory_variable_1 * &pcategory_variable_2 / 
			PLOTS=FREQPLOT(TWOWAY=STACKED SCALE=GROUPPCT);
		TITLE &ptitle_1;
		TITLE &ptitle_2;
	RUN;

%MEND MYMACRO_BIVA_TP038;


/********************************************************************************
7.7.2 Call SAS MACRO to do Bivariate Analysis for Gender vs. Loan Approval Status
*********************************************************************************/

%MYMACRO_BIVA_TP038(MYLIB038.TRAINING_DS_TP063038_COPY1, GENDER, LOAN_APPROVAL_STATUS, 
	'FIG. 7.7.2,' 'Gender vs Loan Approval Status');


/********************************************************************************
7.7.3 Call SAS MACRO to do Bivariate Analysis for Qualification vs. Loan History
*********************************************************************************/

%MYMACRO_BIVA_TP038(MYLIB038.TRAINING_DS_TP063038_COPY1, QUALIFICATION, LOAN_HISTORY, 
	'FIG. 7.7.3,' 'Qualification vs Loan History');



/*Call SAS MACRO to do Bivariate Analysis for the CV  vs MARITAL_STATUS*/
%MYMACRO_BIVA_TP038(MYLIB038.TRAINING_DS_TP063038_COPY1, GENDER, LOAN_LOCATION, 
	'FIG. 7.7.2,' 'GENDER vs MARITAL_STATUS');


/**************************************************************
7.7 Define MACRO for Bivariate Analysis on Continuous Variables 
***************************************************************/
%MACRO MYMACRO_BIVA2_TP038(pds_name2, pcontinuous_variable_1, pcontinuous_variable_2, 
		ptitle_1, ptitle_2);

PROC CORR DATA = &pds_name2 PLOTS = SCATTER;
VAR &pcontinuous_variable_1 &pcontinuous_variable_2;
ODS GRAPHICS / RESET WIDTH=4.0 IN HEIGHT=3.0 IN IMAGEMAP;
TITLE &ptitle_1;
QUIT;

%MEND MYMACRO_BIVA2_TP038;


/********************************************************************************
7.7.4 Call SAS MACRO to do Bivariate Analysis for Loan Duration vs. Loan Amount
*********************************************************************************/

%MYMACRO_BIVA2_TP038(MYLIB038.TRAINING_DS_TP063038_COPY1, LOAN_DURATION, LOAN_AMOUNT, 
	'FIG. 7.7.4: ' 'Loan Duration vs Loan Amount');


/**************************************************************************************
7.7.5 Call SAS MACRO to do Bivariate Analysis for Candidate Income vs. Guarantee Income
***************************************************************************************/

%MYMACRO_BIVA2_TP038(MYLIB038.TRAINING_DS_TP063038_COPY1, CANDIDATE_INCOME, GUARANTEE_INCOME, 
	'FIG. 7.7.5: ' 'Candidate Income vs. Guarantee Income');


/******************************************************************************
7.7 Define MACRO for Bivariate Analysis on Categorical and Continuous Variables 
*******************************************************************************/
%MACRO MYMACRO_BIVA3_TP038(pds_name3, pcategorical_variable_1, pcontinuous_variable_2, 
		ptitle_1);

PROC MEANS DATA = &pds_name3;
CLASS &pcategorical_variable_1;
VAR &pcontinuous_variable_2;
TITLE &ptitle_1;
RUN;

PROC SGPLOT DATA = &pds_name3;
VBOX &pcontinuous_variable_2 / CATEGORY=&pcategorical_variable_1;
TITLE &ptitle_1;

%MEND MYMACRO_BIVA3_TP038;


/*************************************************************************************
7.7.6 Call SAS MACRO to do Bivariate Analysis for Loan Approval Status vs. Loan Amount
**************************************************************************************/

%MYMACRO_BIVA3_TP038(MYLIB038.TRAINING_DS_TP063038_COPY1, LOAN_APPROVAL_STATUS, LOAN_AMOUNT, 
	'FIG. 7.7.6: ' 'Loan Approval Status vs. Loan Amount');

/*************************************************************************************
7.7.7 Call SAS MACRO to do Bivariate Analysis for Employment vs. Candidate Income
**************************************************************************************/

%MYMACRO_BIVA3_TP038(MYLIB038.TRAINING_DS_TP063038_COPY1, EMPLOYMENT, CANDIDATE_INCOME, 
	'FIG. 7.7.7: ' 'Employment vs. Candidate Income');


/*Imputing Missing Values FOR Categorical Variables*/
/*GENDER*/

/***********************************************
Step 1: Make a copy of the dataset copy - Gender
 ***********************************************/

PROC SQL;

CREATE TABLE MYLIB038.TRAINING_DS_TP063038_IMP_GENDER AS 
SELECT * FROM MYLIB038.TRAINING_DS_TP063038_COPY1;

QUIT;


/*******************************************************************
Step 2: Before imputation: list the observation with missing values
********************************************************************/

TITLE '7.8.2.2: Before Imputation: Observations with Missing Values in Gender';

PROC SQL;

SELECT * FROM MYLIB038.TRAINING_DS_TP063038_IMP_GENDER g 
WHERE ((g.GENDER EQ '') OR
	   (g.GENDER IS NULL) );
	  
QUIT;


/*******************************************************************
Step 3: Before imputation: count the observation with missing values
********************************************************************/

TITLE '7.8.2.3: Before Imputation: Number of Observations with Missing Values in Gender';

PROC SQL;
	
SELECT COUNT(*) LABEL='NUMBER OF OBSERVATIONS'
FROM MYLIB038.TRAINING_DS_TP063038_IMP_GENDER g 
WHERE ((g.GENDER EQ '') OR
	   (g.GENDER IS NULL) );
	   
QUIT;


/***********************************************************************
Step 4: Before imputation: count the observation with non-missing values
 ***********************************************************************/

TITLE '7.8.2.4: Before Imputation: Number of Observations with Non-Missing Values in Gender';

PROC SQL;
	
CREATE TABLE MYLIB038.TRAINING_DS_TP063038_IMP_GENDER2 AS 
SELECT g.GENDER AS GENDER_NAME, COUNT(*) AS TOTAL_COUNTS 
FROM MYLIB038.TRAINING_DS_TP063038_IMP_GENDER g 
WHERE ((g.GENDER NE '') OR
	   (g.GENDER IS NOT NULL) ) 
GROUP BY g.GENDER;

QUIT;

TITLE "7.8.2.4: Display of Observations with Non-Missing Values in Gender";

PROC SQL;

SELECT * FROM MYLIB038.TRAINING_DS_TP063038_IMP_GENDER2;

QUIT;


/*when use LABEL, use ""; when use AS, use _*/


/******************************************************
Step 5: Before imputation: find out the mode of gender
 ******************************************************/

TITLE "7.8.2.5: Mode of Gender";

PROC SQL;
	
SELECT go.GENDER_NAME AS GENDER_NAME 
FROM MYLIB038.TRAINING_DS_TP063038_IMP_GENDER2 go 
WHERE total_counts EQ (SELECT MAX(gi.total_counts) 
FROM MYLIB038.TRAINING_DS_TP063038_IMP_GENDER2 gi);
	/*compare female & male*/
	
QUIT;

/*Male has the highest mode*/


/****************************************************************
Step 6: Imputation of Missing Values - Gender
 *****************************************************************/

TITLE '7.8.2.6: Impute Missing Values in Gender';

PROC SQL;

UPDATE MYLIB038.TRAINING_DS_TP063038_IMP_GENDER 
SET GENDER=(SELECT go.GENDER_NAME FROM MYLIB038.TRAINING_DS_TP063038_IMP_GENDER2 go 
WHERE go.total_counts EQ (SELECT MAX(gi.total_counts) 
FROM MYLIB038.TRAINING_DS_TP063038_IMP_GENDER2 gi) ) 
WHERE ((GENDER IS NULL) OR
	   (GENDER EQ "") );
		   
QUIT;


/******************************************************************
Step 7: After imputation: check the observation with missing values
 ******************************************************************/

TITLE '7.8.2.7: After Imputation: List the Observations with Missing Values in Gender';

PROC SQL;
	
SELECT * FROM MYLIB038.TRAINING_DS_TP063038_IMP_GENDER g 
WHERE ((g.GENDER EQ '') OR
	   (g.GENDER IS NULL) );
	   
QUIT;

TITLE '7.8.2.7: After Imputation: Check Number of Observation with Missing Values in Gender';

PROC SQL;

SELECT COUNT(*) LABEL='NUMBER OF OBSERVATIONS' 
FROM MYLIB038.TRAINING_DS_TP063038_IMP_GENDER g 
WHERE ((g.GENDER EQ '') OR
	   (g.GENDER IS NULL) );
	   
QUIT;





/*Marital Status*/

/*******************************************************
Step 1: Make a copy of the dataset copy - Marital Status
 *******************************************************/

PROC SQL;

CREATE TABLE MYLIB038.TRAINING_DS_TP063038_IMP_MARITAL AS 
SELECT * FROM MYLIB038.TRAINING_DS_TP063038_IMP_GENDER;

QUIT;


/*******************************************************************
Step 2: Before imputation: list the observations with missing values
********************************************************************/

TITLE '7.8.3.2: Before Imputation: Observations with Missing Values in Marital Status';

PROC SQL;

SELECT * FROM MYLIB038.TRAINING_DS_TP063038_IMP_MARITAL m
WHERE ((m.MARITAL_STATUS EQ '') OR
	   (m.MARITAL_STATUS IS NULL) );
	  
QUIT;


/*******************************************************************
Step 3: Before imputation: count the observation with missing values
********************************************************************/

TITLE '7.8.3.3: Before Imputation: Number of Observations with Missing Values in Marital Status';

PROC SQL;
	
SELECT COUNT(*) LABEL='NUMBER OF OBSERVATIONS'
FROM MYLIB038.TRAINING_DS_TP063038_IMP_MARITAL m 
WHERE ((m.MARITAL_STATUS EQ '') OR
	   (m.MARITAL_STATUS IS NULL) );
	   
QUIT;


/***********************************************************************
Step 4: Before imputation: count the observation with non-missing values
 ***********************************************************************/

TITLE '7.8.3.4: Before Imputation: Number of Observations with Non-Missing Values in Marital Status';

PROC SQL;
	
CREATE TABLE MYLIB038.TRAINING_DS_TP063038_IMP_M2 AS 
SELECT m.MARITAL_STATUS AS MARITAL_STATUS_NAME, COUNT(*) AS TOTAL_COUNTS 
FROM MYLIB038.TRAINING_DS_TP063038_IMP_MARITAL m 
WHERE ((m.MARITAL_STATUS NE '') OR
	   (m.MARITAL_STATUS IS NOT NULL) ) 
GROUP BY m.MARITAL_STATUS;

QUIT;

TITLE "7.8.3.4: Display of Observations with Non-Missing Values in Marital Status";

PROC SQL;

SELECT * FROM MYLIB038.TRAINING_DS_TP063038_IMP_M2;

QUIT;


/*when use LABEL, use ""; when use AS, use _*/


/******************************************************
Step 5: Before imputation: find out the mode of gender
 ******************************************************/

TITLE "7.8.3.5: Mode of Marital Status";

PROC SQL;
	
SELECT mo.MARITAL_STATUS_NAME AS MARITAL_STATUS_NAME 
FROM MYLIB038.TRAINING_DS_TP063038_IMP_M2 mo 
WHERE total_counts EQ (SELECT MAX(mi.total_counts) 
FROM MYLIB038.TRAINING_DS_TP063038_IMP_M2 mi);
	/*compare married & non-married*/
	
QUIT;

/*Married has the highest mode*/


/****************************************************************
Step 6: Imputation of Missing Values - Marital Status
 *****************************************************************/

TITLE '7.8.3.6: Impute Missing Values in Marital Status';

PROC SQL;

UPDATE MYLIB038.TRAINING_DS_TP063038_IMP_MARITAL 
SET MARITAL_STATUS=(SELECT mo.MARITAL_STATUS_NAME FROM MYLIB038.TRAINING_DS_TP063038_IMP_M2 mo 
WHERE mo.total_counts EQ (SELECT MAX(mi.total_counts) 
FROM MYLIB038.TRAINING_DS_TP063038_IMP_M2 mi) ) 
WHERE ((MARITAL_STATUS IS NULL) OR
	   (MARITAL_STATUS EQ "") );
		   
QUIT;


/******************************************************************
Step 7: After imputation: check the observation with missing values
 ******************************************************************/

TITLE '7.8.3.7: After Imputation: List the Observations with Missing Values in Marital Status';

PROC SQL;
	
SELECT * FROM MYLIB038.TRAINING_DS_TP063038_IMP_MARITAL m 
WHERE ((m.MARITAL_STATUS EQ '') OR
	   (m.MARITAL_STATUS IS NULL) );
	   
QUIT;

TITLE '7.8.3.7: After Imputation: Check Number of Observation with Missing Values in Marital Status';

PROC SQL;

SELECT COUNT(*) LABEL='NUMBER OF OBSERVATIONS' 
FROM MYLIB038.TRAINING_DS_TP063038_IMP_MARITAL m 
WHERE ((m.MARITAL_STATUS EQ '') OR
	   (m.MARITAL_STATUS IS NULL) );
	   
QUIT;




/*Family Members*/

/*******************************************************
Step 1: Make a copy of the dataset copy - Family Members
 *******************************************************/

PROC SQL;

CREATE TABLE MYLIB038.TRAINING_DS_TP063038_IMP_FAMILY AS 
SELECT * FROM MYLIB038.TRAINING_DS_TP063038_IMP_MARITAL;

QUIT;


/*******************************************************************
Step 2: Before imputation: list the observations with missing values
********************************************************************/

TITLE '7.8.4.2: Before Imputation: Observations with Missing Values in Family Members';

PROC SQL;

SELECT * FROM MYLIB038.TRAINING_DS_TP063038_IMP_FAMILY f
WHERE ((f.FAMILY_MEMBERS EQ '') OR
	   (f.FAMILY_MEMBERS IS NULL) );
	  
QUIT;


/*******************************************************************
Step 3: Before imputation: count the observation with missing values
********************************************************************/

TITLE '7.8.4.3: Before Imputation: Number of Observations with Missing Values in Family Members';

PROC SQL;
	
SELECT COUNT(*) LABEL='NUMBER OF OBSERVATIONS'
FROM MYLIB038.TRAINING_DS_TP063038_IMP_FAMILY f 
WHERE ((f.FAMILY_MEMBERS EQ '') OR
	   (f.FAMILY_MEMBERS IS NULL) );
	   
QUIT;


/***********************************************************************
Step 4: Before imputation: count the observation with non-missing values
 ***********************************************************************/

TITLE '7.8.4.4: Before Imputation: Number of Observations with Non-Missing Values in Family Members';

PROC SQL;
	
CREATE TABLE MYLIB038.TRAINING_DS_TP063038_IMP_F2 AS 
SELECT f.FAMILY_MEMBERS AS FAMILY_MEMBERS_NAME, COUNT(*) AS TOTAL_COUNTS 
FROM MYLIB038.TRAINING_DS_TP063038_IMP_FAMILY f 
WHERE ((f.FAMILY_MEMBERS NE '') OR
	   (f.FAMILY_MEMBERS IS NOT NULL) ) 
GROUP BY f.FAMILY_MEMBERS;

QUIT;

TITLE "7.8.4.4: Display of Observations with Non-Missing Values in Family Members";

PROC SQL;

SELECT * FROM MYLIB038.TRAINING_DS_TP063038_IMP_F2;

QUIT;


/*when use LABEL, use ""; when use AS, use _*/


/*************************************************************
Step 5: Before imputation: find out the mode of family members
 *************************************************************/

TITLE "7.8.4.5: Mode of Family Members";

PROC SQL;
	
SELECT fo.FAMILY_MEMBERS_NAME AS FAMILY_MEMBERS_NAME 
FROM MYLIB038.TRAINING_DS_TP063038_IMP_F2 fo 
WHERE total_counts EQ (SELECT MAX(fi.total_counts) 
FROM MYLIB038.TRAINING_DS_TP063038_IMP_F2 fi);
	/*compare 0,1,2 and 3+*/
	
QUIT;


/*****************************************************
Step 6: Imputation of Missing Values - Family Members
 *****************************************************/

TITLE '7.8.4.6: Impute Missing Values in Family Members';

PROC SQL;

UPDATE MYLIB038.TRAINING_DS_TP063038_IMP_FAMILY 
SET FAMILY_MEMBERS=(SELECT fo.FAMILY_MEMBERS_NAME FROM MYLIB038.TRAINING_DS_TP063038_IMP_F2 fo 
WHERE fo.total_counts EQ (SELECT MAX(fi.total_counts) 
FROM MYLIB038.TRAINING_DS_TP063038_IMP_F2 fi) ) 
WHERE ((FAMILY_MEMBERS IS NULL) OR
	   (FAMILY_MEMBERS EQ "") );
		   
QUIT;


/******************************************************************
Step 7: After imputation: check the observation with missing values
 ******************************************************************/

TITLE '7.8.4.7: After Imputation: List the Observations with Missing Values in Family Members';

PROC SQL;
	
SELECT * FROM MYLIB038.TRAINING_DS_TP063038_IMP_FAMILY f 
WHERE ((f.FAMILY_MEMBERS EQ '') OR
	   (f.FAMILY_MEMBERS IS NULL) );
	   
QUIT;

TITLE '7.8.4.7: After Imputation: Check Number of Observation with Missing Values in Family Members';

PROC SQL;

SELECT COUNT(*) LABEL='NUMBER OF OBSERVATIONS' 
FROM MYLIB038.TRAINING_DS_TP063038_IMP_FAMILY f 
WHERE ((f.FAMILY_MEMBERS EQ '') OR
	   (f.FAMILY_MEMBERS IS NULL) );
	   
QUIT;




/*Employment*/

/*******************************************************
Step 1: Make a copy of the dataset copy - Employment
 *******************************************************/

PROC SQL;

CREATE TABLE MYLIB038.TRAINING_DS_TP063038_IMP_EMPLOY AS 
SELECT * FROM MYLIB038.TRAINING_DS_TP063038_IMP_FAMILY;

QUIT;


/*******************************************************************
Step 2: Before imputation: list the observations with missing values
********************************************************************/

TITLE '7.8.5.2: Before Imputation: Observations with Missing Values in Employment';

PROC SQL;

SELECT * FROM MYLIB038.TRAINING_DS_TP063038_IMP_EMPLOY e
WHERE ((e.EMPLOYMENT EQ '') OR
	   (e.EMPLOYMENT IS NULL) );
	  
QUIT;


/*******************************************************************
Step 3: Before imputation: count the observation with missing values
********************************************************************/

TITLE '7.8.5.3: Before Imputation: Number of Observations with Missing Values in Employment';

PROC SQL;
	
SELECT COUNT(*) LABEL='NUMBER OF OBSERVATIONS'
FROM MYLIB038.TRAINING_DS_TP063038_IMP_EMPLOY e 
WHERE ((e.EMPLOYMENT EQ '') OR
	   (e.EMPLOYMENT IS NULL) );
	   
QUIT;


/***********************************************************************
Step 4: Before imputation: count the observation with non-missing values
 ***********************************************************************/

TITLE '7.8.5.4: Before Imputation: Number of Observations with Non-Missing Values in Employment';

PROC SQL;
	
CREATE TABLE MYLIB038.TRAINING_DS_TP063038_IMP_E2 AS 
SELECT e.EMPLOYMENT AS EMPLOYMENT_NAME, COUNT(*) AS TOTAL_COUNTS 
FROM MYLIB038.TRAINING_DS_TP063038_IMP_EMPLOY e 
WHERE ((e.EMPLOYMENT NE '') OR
	   (e.EMPLOYMENT IS NOT NULL) ) 
GROUP BY e.EMPLOYMENT;

QUIT;

TITLE "7.8.5.4: Display of Observations with Non-Missing Values in Employment";

PROC SQL;

SELECT * FROM MYLIB038.TRAINING_DS_TP063038_IMP_E2;

QUIT;


/*when use LABEL, use ""; when use AS, use _*/


/*************************************************************
Step 5: Before imputation: find out the mode of employment
 *************************************************************/

TITLE "7.8.5.5: Mode of Employment";

PROC SQL;
	
SELECT eo.EMPLOYMENT_NAME AS EMPLOYMENT_NAME 
FROM MYLIB038.TRAINING_DS_TP063038_IMP_E2 eo 
WHERE total_counts EQ (SELECT MAX(ei.total_counts) 
FROM MYLIB038.TRAINING_DS_TP063038_IMP_E2 ei);
	/*compare no and yes*/
	
QUIT;


/*****************************************************
Step 6: Imputation of Missing Values - Employment
 *****************************************************/

TITLE '7.8.5.6: Impute Missing Values in Employment';

PROC SQL;

UPDATE MYLIB038.TRAINING_DS_TP063038_IMP_EMPLOY
SET EMPLOYMENT=(SELECT eo.EMPLOYMENT_NAME FROM MYLIB038.TRAINING_DS_TP063038_IMP_E2 eo 
WHERE eo.total_counts EQ (SELECT MAX(ei.total_counts) 
FROM MYLIB038.TRAINING_DS_TP063038_IMP_E2 ei) ) 
WHERE ((EMPLOYMENT IS NULL) OR
	   (EMPLOYMENT EQ "") );
		   
QUIT;


/******************************************************************
Step 7: After imputation: check the observation with missing values
 ******************************************************************/

TITLE '7.8.5.7: After Imputation: List the Observations with Missing Values in Employment';

PROC SQL;
	
SELECT * FROM MYLIB038.TRAINING_DS_TP063038_IMP_EMPLOY e 
WHERE ((e.EMPLOYMENT EQ '') OR
	   (e.EMPLOYMENT IS NULL) );
	   
QUIT;

TITLE '7.8.5.7: After Imputation: Check Number of Observation with Missing Values in Employment';

PROC SQL;

SELECT COUNT(*) LABEL='NUMBER OF OBSERVATIONS' 
FROM MYLIB038.TRAINING_DS_TP063038_IMP_EMPLOY e 
WHERE ((e.EMPLOYMENT EQ '') OR
	   (e.EMPLOYMENT IS NULL) );
	   
QUIT;




/*Loan History*/

/*******************************************************
Step 1: Make a copy of the dataset copy - Loan History
 *******************************************************/

PROC SQL;

CREATE TABLE MYLIB038.TRAINING_DS_TP063038_IMP_HISTORY AS 
SELECT * FROM MYLIB038.TRAINING_DS_TP063038_IMP_EMPLOY;

QUIT;


/*******************************************************************
Step 2: Before imputation: list the observations with missing values
********************************************************************/

TITLE '7.8.6.2: Before Imputation: Observations with Missing Values in Loan History';

PROC SQL;

SELECT * FROM MYLIB038.TRAINING_DS_TP063038_IMP_HISTORY h
WHERE ( ( h.LOAN_HISTORY EQ .) OR
		( h.LOAN_HISTORY IS NULL ) );
	 
	  
QUIT;


/*******************************************************************
Step 3: Before imputation: count the observation with missing values
********************************************************************/

TITLE '7.8.6.3: Before Imputation: Number of Observations with Missing Values in Loan History';

PROC SQL;
	
SELECT COUNT(*) LABEL='NUMBER OF OBSERVATIONS'
FROM MYLIB038.TRAINING_DS_TP063038_IMP_HISTORY h 
WHERE ((h.LOAN_HISTORY EQ .) OR
	   (h.LOAN_HISTORY IS NULL) );
	   
QUIT;


/***********************************************************************
Step 4: Before imputation: count the observation with non-missing values
 ***********************************************************************/

TITLE '7.8.6.4: Before Imputation: Number of Observations with Non-Missing Values in Loan History';

PROC SQL;
	
CREATE TABLE MYLIB038.TRAINING_DS_TP063038_IMP_H2 AS 
SELECT h.LOAN_HISTORY AS LOAN_HISTORY_NAME, COUNT(*) AS TOTAL_COUNTS 
FROM MYLIB038.TRAINING_DS_TP063038_IMP_HISTORY h 
WHERE ((h.LOAN_HISTORY NE .) OR
	   (h.LOAN_HISTORY IS NOT NULL) ) 
GROUP BY h.LOAN_HISTORY;

QUIT;

TITLE "7.8.6.4: Display of Observations with Non-Missing Values in Loan History";

PROC SQL;

SELECT * FROM MYLIB038.TRAINING_DS_TP063038_IMP_H2;

QUIT;


/*when use LABEL, use ""; when use AS, use _*/


/*************************************************************
Step 5: Before imputation: find out the mode of loan history
 *************************************************************/

TITLE "7.8.6.5: Mode of Loan History";

PROC SQL;
	
SELECT ho.LOAN_HISTORY_NAME AS LOAN_HISTORY_NAME 
FROM MYLIB038.TRAINING_DS_TP063038_IMP_H2 ho 
WHERE total_counts EQ (SELECT MAX(hi.total_counts) 
FROM MYLIB038.TRAINING_DS_TP063038_IMP_H2 hi);
	/*compare 0 and 1*/
	
QUIT;


/*****************************************************
Step 6: Imputation of Missing Values - Loan History
 *****************************************************/

TITLE '7.8.6.6: Impute Missing Values in Loan History';

PROC SQL;

UPDATE MYLIB038.TRAINING_DS_TP063038_IMP_HISTORY
SET LOAN_HISTORY=(SELECT ho.LOAN_HISTORY_NAME FROM MYLIB038.TRAINING_DS_TP063038_IMP_H2 ho 
WHERE ho.total_counts EQ (SELECT MAX(hi.total_counts) 
FROM MYLIB038.TRAINING_DS_TP063038_IMP_H2 hi) ) 
WHERE ((LOAN_HISTORY IS NULL) OR
	   (LOAN_HISTORY EQ .) );
		   
QUIT;


/******************************************************************
Step 7: After imputation: check the observation with missing values
 ******************************************************************/

TITLE '7.8.6.7: After Imputation: List the Observations with Missing Values in Loan History';

PROC SQL;
	
SELECT * FROM MYLIB038.TRAINING_DS_TP063038_IMP_HISTORY h 
WHERE ((h.LOAN_HISTORY EQ .) OR
	   (h.LOAN_HISTORY IS NULL) );
	   
QUIT;

TITLE '7.8.6.7: After Imputation: Check Number of Observation with Missing Values in Loan History';

PROC SQL;

SELECT COUNT(*) LABEL='NUMBER OF OBSERVATIONS' 
FROM MYLIB038.TRAINING_DS_TP063038_IMP_HISTORY h 
WHERE ((h.LOAN_HISTORY EQ .) OR
	   (h.LOAN_HISTORY IS NULL) );
	   
QUIT;





/*Imputing Missing Values FOR Continuous Variables*/

/*LOAN_AMOUNT - make sure to check the univariate analysis to check*/

/*****************************************************
Step 1: Make a copy of the dataset copy - Loan Amount
 *****************************************************/

PROC SQL;

CREATE TABLE MYLIB038.TRAINING_DS_TP063038_IMP_AMOUNT  AS
SELECT * FROM MYLIB038.TRAINING_DS_TP063038_IMP_HISTORY;

QUIT;


/******************************************************************
Step 2: Before Imputation: List the observations of missing values 
*******************************************************************/

TITLE '7.8.7.2: Before Imputation: List the Observations of Missing Values in Loan Amount';

PROC SQL;

SELECT * 
FROM MYLIB038.TRAINING_DS_TP063038_IMP_AMOUNT l /*use the latest dataset*/
WHERE ( l.LOAN_AMOUNT EQ . );

QUIT;


/************************************************************************
Step 3: Before imputation: count the no. of missing values in Loan Amount
 ************************************************************************/

TITLE '7.8.7.3: Before Imputation: Number of Missing Values in Loan Amount';

PROC SQL;

SELECT COUNT(*) LABEL = 'No. of Missing Values' 
FROM MYLIB038.TRAINING_DS_TP063038_IMP_AMOUNT l /*use the latest dataset*/
WHERE ( l.LOAN_AMOUNT EQ . );

QUIT;


/***************************************************
Step 4: Imputation of missing values in loan amount
 ***************************************************/

TITLE '7.8.7.4: Imputation of Missing Values in Loan Amount';

PROC STDIZE DATA=MYLIB038.TRAINING_DS_TP063038_IMP_AMOUNT REPONLY
METHOD=MEAN OUT=MYLIB038.TRAINING_DS_TP063038_IMP_AMOUNT;
VAR LOAN_AMOUNT;

QUIT;


/*******************************************************************
Step 5: After imputation: check the observations with missing values
 *******************************************************************/

TITLE '7.8.7.5: List of Missing Values in Loan Amount';

PROC SQL;

SELECT * 
FROM MYLIB038.TRAINING_DS_TP063038_IMP_AMOUNT l /*use the latest dataset*/
WHERE ( l.LOAN_AMOUNT EQ . );

QUIT;

TITLE '7.8.7.5: Number of Missing Values in Loan Amount';

PROC SQL;

SELECT COUNT(*) LABEL = 'No. of Missing Values' 
FROM MYLIB038.TRAINING_DS_TP063038_IMP_AMOUNT l /*use the latest dataset*/
WHERE ( l.LOAN_AMOUNT EQ . );

QUIT;



/*Imputing Missing Values FOR Continuous Variables*/

/*LOAN_DURATION - make sure to check the univariate analysis to check*/

/*******************************************************
Step 1: Make a copy of the dataset copy - Loan Duration
 *******************************************************/

PROC SQL;

CREATE TABLE MYLIB038.TRAINING_DS_TP063038_IMP_LD  AS
SELECT * FROM MYLIB038.TRAINING_DS_TP063038_IMP_AMOUNT;

QUIT;


/******************************************************************
Step 2: Before Imputation: List the observations of missing values 
*******************************************************************/

TITLE '7.8.8.2: Before Imputation: List the Observations with Missing Values in Loan Duration';

PROC SQL;

SELECT * 
FROM MYLIB038.TRAINING_DS_TP063038_IMP_LD d /*use the latest dataset*/
WHERE ( d.LOAN_DURATION EQ . );

QUIT;


/***************************************************************************
Step 3: Before imputation: count the no. of missing values in Loan Duration
 ***************************************************************************/

TITLE '7.8.8.3: Before Imputation: Number of Missing Values in Loan Duration';

PROC SQL;

SELECT COUNT(*) LABEL = 'No. of Missing Values' 
FROM MYLIB038.TRAINING_DS_TP063038_IMP_LD d /*use the latest dataset*/
WHERE ( d.LOAN_DURATION EQ . );

QUIT;


/***************************************************
Step 4: Imputation of missing values in loan duration
 ***************************************************/

TITLE '7.8.8.4: Imputation of Missing Values in Loan Duration';

PROC STDIZE DATA=MYLIB038.TRAINING_DS_TP063038_IMP_LD REPONLY
METHOD=MEAN OUT=MYLIB038.TRAINING_DS_TP063038_IMP_LD;
VAR LOAN_DURATION;

QUIT;


/*******************************************************************
Step 5: After imputation: check the observations with missing values
 *******************************************************************/

TITLE '7.8.8.5: List of Missing Values in Loan Duration';

PROC SQL;

SELECT * 
FROM MYLIB038.TRAINING_DS_TP063038_IMP_LD d /*use the latest dataset*/
WHERE ( d.LOAN_DURATION EQ . );

QUIT;

TITLE '7.8.8.5: Number of Missing Values in Loan Duration';

PROC SQL;

SELECT COUNT(*) LABEL = 'No. of Missing Values' 
FROM MYLIB038.TRAINING_DS_TP063038_IMP_LD d /*use the latest dataset*/
WHERE ( d.LOAN_DURATION EQ . );

QUIT;



/**Remove the + for variable FAMILY_MEMBERS**/

/***************************************
Step 1: Separate the number and '+' sign  
 ***************************************/

TITLE '7.8.9.1 Separate the Number and '+' Sign';

PROC SQL;

SELECT f.FAMILY_MEMBERS, 
	   SUBSTR(f.FAMILY_MEMBERS, 1, 1), /*first number = position; 
	                                     second no. = how many letter/no 
	                                     you want to separate*/
	   SUBSTR(f.FAMILY_MEMBERS, 2, 1)
FROM MYLIB038.TRAINING_DS_TP063038_IMP_LD f;

QUIT;


/****************************************************************
Step 2: Count the no. of observations with '+'
 *****************************************************************/

TITLE '7.8.9.2 Number of Observations with '+' Sign';

PROC SQL;

SELECT COUNT(*) LABEL = 'NUMBER OF OBSERVATIONS WITH +'
FROM MYLIB038.TRAINING_DS_TP063038_IMP_LD f
WHERE ( SUBSTR(f.FAMILY_MEMBERS,2,1) EQ '+' );

QUIT;


/***********************************
Step 3: Remove the '+' permanently
 ***********************************/

TITLE '7.8.9.3 Removal of + Sign Permanently';

PROC SQL;

UPDATE MYLIB038.TRAINING_DS_TP063038_IMP_LD
SET FAMILY_MEMBERS = SUBSTR(family_members,1,1);
WHERE ( SUBSTR(f.FAMILY_MEMBERS,2,1) EQ '+' );

QUIT;


/****************************************************************
Step 4: After removal of '+', check the observations again
 *****************************************************************/

TITLE '7.8.9.4 After Removal of + Sign, Check the Observations';

PROC SQL;

SELECT f.FAMILY_MEMBERS LABEL = 'Family Category',
       COUNT(*) LABEL = 'No. of Applicants'
FROM MYLIB038.TRAINING_DS_TP063038_IMP_LD f
GROUP BY f.FAMILY_MEMBERS;

QUIT;




/*TESTING DATASET*/

/*Create a copy of the TESTING_DS dataset*/

TITLE 'Create A Copy of the Testing Dataset';

PROC SQL;

CREATE TABLE MYLIB038.TESTING_DS_TP063038_COPY2 AS 
SELECT * FROM MYLIB038.TESTING_DS;

QUIT;


/*Univariate Analysis for Testing Dataset - use MACRO*/


/**************************************************************************************

Name of DS: Ms. Lam Ying Xian (TP063038)
Name of SAS program: mydapassignment_TP063038.sas
Description: The assignment is about the prediction of loan approval in private bank.
             The first task is to explore the dataset;
             The second task is to cleanse the dataset; and
             The third task is to build the predictive model.
Date first written: Mon, 23-Aug-2021
Date last updated: Mon, 23-Aug-2021
Folder name: DAP_FT_JAN_2021_TP063038
Library name: MYLIB038

***************************************************************************************/

/**********************************************
7.9 To create a copy of the testing dataset
*********************************************/

TITLE 'Create A Copy of the Testing Dataset';

PROC SQL;

CREATE TABLE MYLIB038.TESTING_DS_TP063038_COPY AS SELECT * FROM 
MYLIB038.TESTING_DS;

QUIT;


/****************************************************
7.10 To display the structure of the testing dataset
*****************************************************/

TITLE 'To Display the Structure of the Testing Dataset';

PROC SQL;

DESCRIBE TABLE MYLIB038.TESTING_DS_TP063038_COPY;

QUIT;


/**********************************************
7.11 Label Each Variable in the Testing Dataset
***********************************************/

TITLE 'Label Each Variable in the Testing Dataset';

DATA MYLIB038.TESTING_DS_TP063038_COPY1;
	SET MYLIB038.TESTING_DS_TP063038_COPY;
	LABEL SME_LOAN_ID_NO='Loan Application Number'
		  GENDER='Gender' 
		  MARITAL_STATUS='Marital Status' 
		  FAMILY_MEMBERS='Family Members' 
		  QUALIFICATION='Qualification' 
		  EMPLOYMENT='Employment' 
		  CANDIDATE_INCOME='Candidate Income' 
		  GUARANTEE_INCOME='Guarantee Income' 
		  LOAN_AMOUNT='Loan Amount' 
		  LOAN_DURATION='Loan Duration' 
		  LOAN_HISTORY='Loan History' 
		  LOAN_LOCATION='Loan Location' 
		  LOAN_APPROVAL_STATUS='Loan Approval Status';
RUN;

/*Show the Output of the Updated Labels*/
TITLE 'Output of the Updated Labels';

PROC SQL;
	SELECT * FROM MYLIB038.TESTING_DS_TP063038_COPY1;
QUIT;



/*Univariate Analysis in TESTING_DS*/

/***************************************************************************************
7.12.2 SAS Codes for Defining SAS Macro for Univariate Analysis on Categorical Variable
****************************************************************************************/

%MACRO MYMACRO_UNIVA_TP038_TEST(pds_name, pcategorical_variable, ptitle);

TITLE &ptitle;

PROC FREQ DATA = &pds_name;
TABLE &pcategorical_variable;

RUN;

ODS GRAPHICS / REST WIDTH=4.0 IN HEIGHT=3.0 IN IMAGEMAP;
PROC SGPLOT DATA = &pds_name;
VBAR &pcategorical_variable;

RUN;

%MEND MYMACRO_UNIVA_TP038_TEST;


/*****************************************************************************
7.12.3 SAS Codes for Calling Defined Univariate Analysis SAS Macro for Gender
******************************************************************************/

%MYMACRO_UNIVA_TP038_TEST(MYLIB038.TESTING_DS_TP063038_COPY1,GENDER,'7.12.3: Univariate Analysis on Gender')


/***************************************************************************************
7.12.4 SAS Codes for Calling Defined Univariate Analysis SAS Macro for Marital Status
****************************************************************************************/

%MYMACRO_UNIVA_TP038_TEST(MYLIB038.TESTING_DS_TP063038_COPY1, MARITAL_STATUS, '7.12.4: Univariate Analysis on Marital Status')


/************************************************************************************
7.12.5 SAS Codes for Calling Defined Univariate Analysis SAS Macro for Family Members
*************************************************************************************/

%MYMACRO_UNIVA_TP038_TEST(MYLIB038.TESTING_DS_TP063038_COPY1,FAMILY_MEMBERS,'7.12.5: Univariate Analysis on Family Members')


/***********************************************************************************
7.12.6 SAS Codes for Calling Defined Univariate Analysis SAS Macro for Qualification
************************************************************************************/

%MYMACRO_UNIVA_TP038_TEST(MYLIB038.TESTING_DS_TP063038_COPY1,QUALIFICATION,'7.12.6: Univariate Analysis on Qualification')


/***********************************************************************************
7.12.7 SAS Codes for Calling Defined Univariate Analysis SAS Macro for Employment
************************************************************************************/

%MYMACRO_UNIVA_TP038_TEST(MYLIB038.TESTING_DS_TP063038_COPY1,EMPLOYMENT,'7.12.7: Univariate Analysis on Employment')


/***********************************************************************************
7.12.8 SAS Codes for Calling Defined Univariate Analysis SAS Macro for Loan History
************************************************************************************/

%MYMACRO_UNIVA_TP038_TEST(MYLIB038.TESTING_DS_TP063038_COPY1,LOAN_HISTORY,'7.12.8: Univariate Analysis on Loan History')


/***********************************************************************************
7.12.9 SAS Codes for Calling Defined Univariate Analysis SAS Macro for Loan Location
************************************************************************************/

%MYMACRO_UNIVA_TP038_TEST(MYLIB038.TESTING_DS_TP063038_COPY1,LOAN_LOCATION,'7.12.9: Univariate Analysis on Loan Location')


/***************************************************************************************
7.12.10 SAS Codes for Defining SAS Macro for Univariate Analysis on Continuous Variable
****************************************************************************************/

%MACRO MYMACRO_UNIVA_TP038_TEST(pds_name, pcontinuous_variable, ptitle);


PROC MEANS DATA=&pds_name N NMISS MIN MAX MEAN MEDIAN 
		STD;
	VAR &pcontinuous_variable;
	TITLE &ptitle;
RUN;

ODS GRAPHICS / RESET WIDTH=4.0 IN HEIGHT=3.0 IN IMAGEMAP;

PROC SGPLOT DATA=&pds_name;
	HISTOGRAM &pcontinuous_variable;
	TITLE &ptitle;
RUN;

%MEND MYMACRO_UNIVA_TP038_TEST;


/***********************************************************************************
7.12.11 SAS Codes for Calling Defined Univariate Analysis SAS Macro for Loan Duration
************************************************************************************/

%MYMACRO_UNIVA_TP038_TEST(MYLIB038.TESTING_DS_TP063038_COPY1,LOAN_DURATION,'7.12.11: Univariate Analysis on Loan Duration')


/***************************************************************************************
7.12.12 SAS Codes for Calling Defined Univariate Analysis SAS Macro for Candidate Income
****************************************************************************************/

%MYMACRO_UNIVA_TP038_TEST(MYLIB038.TESTING_DS_TP063038_COPY1,CANDIDATE_INCOME,'7.12.12: Univariate Analysis on Candidate Income')


/***************************************************************************************
7.12.13 SAS Codes for Calling Defined Univariate Analysis SAS Macro for Guarantee Income
****************************************************************************************/

%MYMACRO_UNIVA_TP038_TEST(MYLIB038.TESTING_DS_TP063038_COPY1,GUARANTEE_INCOME,'7.12.13: Univariate Analysis on Guarantee Income')


/***********************************************************************************
7.12.14 SAS Codes for Calling Defined Univariate Analysis SAS Macro for Loan Amount
************************************************************************************/

%MYMACRO_UNIVA_TP038_TEST(MYLIB038.TESTING_DS_TP063038_COPY1,LOAN_AMOUNT,'7.12.14: Univariate Analysis on Loan Amount')


/*Bivariate Analysis in TESTING_DS*/


/***************************************************
Bivariate analysis for the combination of variables 
****************************************************/

/*
The macro MYMACRO_BIVA3_TP038_TEST has parameter()
pds_name = name of the dataset
pcategorical_variable_1 = 1st variable name for the bivariate analysis
pcontinuous_variable_2 = 2nd variable name for the bivariate analysis
ptitle = title to be displayed in the result
*/

/**************************************************************
7.13.2 Define MACRO for Bivariate Analysis on Categorical Variables 
***************************************************************/

/*
The macro MYMACRO_BIVA3_TP038_TEST has parameter()
pds_name = name of the dataset
pcategorical_variable_1 = 1st variable name for the bivariate analysis
pcontinuous_variable_2 = 2nd variable name for the bivariate analysis
ptitle = title to be displayed in the result
*/

%MACRO MYMACRO_BIVA_TP038_TEST(pds_name, pcategory_variable_1, 
                               pcategory_variable_2, ptitle_1);
		
PROC FREQ DATA=&pds_name;

TABLE &pcategory_variable_1 * &pcategory_variable_2 / 
PLOTS=FREQPLOT(TWOWAY=STACKED SCALE=GROUPPCT);
TITLE &ptitle_1;

RUN;

%MEND MYMACRO_BIVA_TP038_TEST;


/***********************************************************************************
7.13.3 Call SAS MACRO to do Bivariate Analysis for Marital Status vs. Family Members
************************************************************************************/

%MYMACRO_BIVA_TP038_TEST(MYLIB038.TESTING_DS_TP063038_COPY1, MARITAL_STATUS, FAMILY_MEMBERS, 
                        '7.13.3: Bivariate Analysis on Marital Status vs. Family Members');


/********************************************************************************
7.13.4 Call SAS MACRO to do Bivariate Analysis for Gender vs. Loan History
*********************************************************************************/

%MYMACRO_BIVA_TP038_TEST(MYLIB038.TESTING_DS_TP063038_COPY1, GENDER, LOAN_HISTORY, 
	                    '7.13.4: Bivariate Analysis on Gender vs. Loan History');




/*****************************************************************
7.13.5 Define MACRO for Bivariate Analysis on Continuous Variables 
******************************************************************/

%MACRO MYMACRO_BIVA2_TP038_TEST(pds_name2, pcontinuous_variable_1, pcontinuous_variable_2, 
		ptitle_1);

PROC CORR DATA = &pds_name2 PLOTS = SCATTER;
VAR &pcontinuous_variable_1 &pcontinuous_variable_2;
ODS GRAPHICS / RESET WIDTH=4.0 IN HEIGHT=3.0 IN IMAGEMAP;
TITLE &ptitle_1;

QUIT;

%MEND MYMACRO_BIVA2_TP038_TEST;


/**********************************************************************************
7.13.6 Call SAS MACRO to do Bivariate Analysis for Candidate Income vs. Loan Amount
***********************************************************************************/

%MYMACRO_BIVA2_TP038_TEST(MYLIB038.TESTING_DS_TP063038_COPY1, CANDIDATE_INCOME, LOAN_AMOUNT, 
	                     '7.13.6: Bivariate Analysis on Candidate Income vs. Loan Amount');


/**************************************************************************************
7.13.7 Call SAS MACRO to do Bivariate Analysis for Loan Duration vs. Guarantee Income
***************************************************************************************/

%MYMACRO_BIVA2_TP038_TEST(MYLIB038.TESTING_DS_TP063038_COPY1, LOAN_DURATION, GUARANTEE_INCOME, 
						 '7.13.7: Bivariate Analysis on Loan Duration vs. Guarantee Income');


/**********************************************************************************
7.13.8 Define MACRO for Bivariate Analysis on Categorical and Continuous Variables 
***********************************************************************************/

%MACRO MYMACRO_BIVA3_TP038_TEST(pds_name3, pcategorical_variable_1, pcontinuous_variable_2, 
		ptitle_1);

PROC MEANS DATA = &pds_name3;

CLASS &pcategorical_variable_1;
VAR &pcontinuous_variable_2;
TITLE &ptitle_1;

RUN;

PROC SGPLOT DATA = &pds_name3;

VBOX &pcontinuous_variable_2 / CATEGORY=&pcategorical_variable_1;
TITLE &ptitle_1;

%MEND MYMACRO_BIVA3_TP038_TEST;


/********************************************************************************
7.13.9 Call SAS MACRO to do Bivariate Analysis for Gender vs. Candidate Income
*********************************************************************************/

%MYMACRO_BIVA3_TP038_TEST(MYLIB038.TESTING_DS_TP063038_COPY1, GENDER, CANDIDATE_INCOME, 
						 '7.13.9: Bivariate Analysis on Gender vs. Candidate Income');


/*********************************************************************************
7.13.10 Call SAS MACRO to do Bivariate Analysis for Loan History vs. Loan Amount
**********************************************************************************/

%MYMACRO_BIVA3_TP038_TEST(MYLIB038.TESTING_DS_TP063038_COPY1, LOAN_HISTORY, LOAN_AMOUNT, 
					     '7.13.10: Bivariate Analysis on Loan History vs. Loan Amount');


/*Imputation of Categorical Variables in TESTING_DS*/



/*Employment*/

/*******************************************************
Step 1: Make a copy of the dataset copy - Employment
 *******************************************************/

PROC SQL;

CREATE TABLE MYLIB038.TESTING_DS_TP063038_IMP_EMPLOY AS 
SELECT * FROM MYLIB038.TESTING_DS_TP063038_COPY1;

QUIT;


/*******************************************************************
Step 2: Before imputation: list the observations with missing values
********************************************************************/

TITLE '7.14.2.2: Before Imputation: Observations with Missing Values in Employment';

PROC SQL;

SELECT * FROM MYLIB038.TESTING_DS_TP063038_IMP_EMPLOY e
WHERE ((e.EMPLOYMENT EQ '') OR
	   (e.EMPLOYMENT IS NULL) );
	  
QUIT;


/*******************************************************************
Step 3: Before imputation: count the observation with missing values
********************************************************************/

TITLE '7.14.2.3: Before Imputation: Number of Observations with Missing Values in Employment';

PROC SQL;
	
SELECT COUNT(*) LABEL='NUMBER OF OBSERVATIONS'
FROM MYLIB038.TESTING_DS_TP063038_IMP_EMPLOY e 
WHERE ((e.EMPLOYMENT EQ '') OR
	   (e.EMPLOYMENT IS NULL) );
	   
QUIT;


/***********************************************************************
Step 4: Before imputation: count the observation with non-missing values
 ***********************************************************************/

TITLE '7.14.2.4: Before Imputation: Number of Observations with Non-Missing Values in Employment';

PROC SQL;
	
CREATE TABLE MYLIB038.TESTING_DS_TP063038_IMP_E2 AS 
SELECT e.EMPLOYMENT AS EMPLOYMENT_NAME, COUNT(*) AS TOTAL_COUNTS 
FROM MYLIB038.TESTING_DS_TP063038_IMP_EMPLOY e 
WHERE ((e.EMPLOYMENT NE '') OR
	   (e.EMPLOYMENT IS NOT NULL) ) 
GROUP BY e.EMPLOYMENT;

QUIT;

TITLE "7.14.2.4: Display of Observations with Non-Missing Values in Employment";

PROC SQL;

SELECT * FROM MYLIB038.TESTING_DS_TP063038_IMP_E2;

QUIT;


/*when use LABEL, use ""; when use AS, use _*/


/*************************************************************
Step 5: Before imputation: find out the mode of employment
 *************************************************************/

TITLE "7.14.2.5: Mode of Employment";

PROC SQL;
	
SELECT eo.EMPLOYMENT_NAME AS EMPLOYMENT_NAME 
FROM MYLIB038.TESTING_DS_TP063038_IMP_E2 eo 
WHERE total_counts EQ (SELECT MAX(ei.total_counts) 
FROM MYLIB038.TESTING_DS_TP063038_IMP_E2 ei);
	/*compare no and yes*/
	
QUIT;


/*****************************************************
Step 6: Imputation of Missing Values - Employment
 *****************************************************/

TITLE '7.14.2.6: Impute Missing Values in Employment';

PROC SQL;

UPDATE MYLIB038.TESTING_DS_TP063038_IMP_EMPLOY
SET EMPLOYMENT=(SELECT eo.EMPLOYMENT_NAME FROM MYLIB038.TESTING_DS_TP063038_IMP_E2 eo 
WHERE eo.total_counts EQ (SELECT MAX(ei.total_counts) 
FROM MYLIB038.TESTING_DS_TP063038_IMP_E2 ei) ) 
WHERE ((EMPLOYMENT IS NULL) OR
	   (EMPLOYMENT EQ "") );
		   
QUIT;


/******************************************************************
Step 7: After imputation: check the observation with missing values
 ******************************************************************/

TITLE '7.14.2.7: After Imputation: List the Observations with Missing Values in Employment';

PROC SQL;
	
SELECT * FROM MYLIB038.TESTING_DS_TP063038_IMP_EMPLOY e 
WHERE ((e.EMPLOYMENT EQ '') OR
	   (e.EMPLOYMENT IS NULL) );
	   
QUIT;

TITLE '7.14.2.7: After Imputation: Check Number of Observation with Missing Values in Employment';

PROC SQL;

SELECT COUNT(*) LABEL='NUMBER OF OBSERVATIONS' 
FROM MYLIB038.TESTING_DS_TP063038_IMP_EMPLOY e 
WHERE ((e.EMPLOYMENT EQ '') OR
	   (e.EMPLOYMENT IS NULL) );
	   
QUIT;



/*Loan History*/

/*******************************************************
Step 1: Make a copy of the dataset copy - Loan History
 *******************************************************/

PROC SQL;

CREATE TABLE MYLIB038.TESTING_DS_TP063038_IMP_HISTORY AS 
SELECT * FROM MYLIB038.TESTING_DS_TP063038_IMP_EMPLOY;

QUIT;


/*******************************************************************
Step 2: Before imputation: list the observations with missing values
********************************************************************/

TITLE '7.14.3.2: Before Imputation: Observations with Missing Values in Loan History';

PROC SQL;

SELECT * FROM MYLIB038.TESTING_DS_TP063038_IMP_HISTORY h
WHERE ( ( h.LOAN_HISTORY EQ .) OR
		( h.LOAN_HISTORY IS NULL ) );
	 
	  
QUIT;


/*******************************************************************
Step 3: Before imputation: count the observation with missing values
********************************************************************/

TITLE '7.14.3.3: Before Imputation: Number of Observations with Missing Values in Loan History';

PROC SQL;
	
SELECT COUNT(*) LABEL='NUMBER OF OBSERVATIONS'
FROM MYLIB038.TESTING_DS_TP063038_IMP_HISTORY h 
WHERE ((h.LOAN_HISTORY EQ .) OR
	   (h.LOAN_HISTORY IS NULL) );
	   
QUIT;


/***********************************************************************
Step 4: Before imputation: count the observation with non-missing values
 ***********************************************************************/

TITLE '7.14.3.4: Before Imputation: Number of Observations with Non-Missing Values in Loan History';

PROC SQL;
	
CREATE TABLE MYLIB038.TESTING_DS_TP063038_IMP_H2 AS 
SELECT h.LOAN_HISTORY AS LOAN_HISTORY_NAME, COUNT(*) AS TOTAL_COUNTS 
FROM MYLIB038.TESTING_DS_TP063038_IMP_HISTORY h 
WHERE ((h.LOAN_HISTORY NE .) OR
	   (h.LOAN_HISTORY IS NOT NULL) ) 
GROUP BY h.LOAN_HISTORY;

QUIT;

TITLE "7.14.3.4: Display of Observations with Non-Missing Values in Loan History";

PROC SQL;

SELECT * FROM MYLIB038.TESTING_DS_TP063038_IMP_H2;

QUIT;


/*when use LABEL, use ""; when use AS, use _*/


/*************************************************************
Step 5: Before imputation: find out the mode of loan history
 *************************************************************/

TITLE "7.14.3.5: Mode of Loan History";

PROC SQL;
	
SELECT ho.LOAN_HISTORY_NAME AS LOAN_HISTORY_NAME 
FROM MYLIB038.TESTING_DS_TP063038_IMP_H2 ho 
WHERE total_counts EQ (SELECT MAX(hi.total_counts) 
FROM MYLIB038.TESTING_DS_TP063038_IMP_H2 hi);
	/*compare 0 and 1*/
	
QUIT;


/*****************************************************
Step 6: Imputation of Missing Values - Loan History
 *****************************************************/

TITLE '7.14.3.6: Impute Missing Values in Loan History';

PROC SQL;

UPDATE MYLIB038.TESTING_DS_TP063038_IMP_HISTORY
SET LOAN_HISTORY=(SELECT ho.LOAN_HISTORY_NAME FROM MYLIB038.TESTING_DS_TP063038_IMP_H2 ho 
WHERE ho.total_counts EQ (SELECT MAX(hi.total_counts) 
FROM MYLIB038.TESTING_DS_TP063038_IMP_H2 hi) ) 
WHERE ((LOAN_HISTORY IS NULL) OR
	   (LOAN_HISTORY EQ .) );
		   
QUIT;


/******************************************************************
Step 7: After imputation: check the observation with missing values
 ******************************************************************/

TITLE '7.14.3.7: After Imputation: List the Observations with Missing Values in Loan History';

PROC SQL;
	
SELECT * FROM MYLIB038.TESTING_DS_TP063038_IMP_HISTORY h 
WHERE ((h.LOAN_HISTORY EQ .) OR
	   (h.LOAN_HISTORY IS NULL) );
	   
QUIT;

TITLE '7.14.3.7: After Imputation: Check Number of Observation with Missing Values in Loan History';

PROC SQL;

SELECT COUNT(*) LABEL='NUMBER OF OBSERVATIONS' 
FROM MYLIB038.TESTING_DS_TP063038_IMP_HISTORY h 
WHERE ((h.LOAN_HISTORY EQ .) OR
	   (h.LOAN_HISTORY IS NULL) );
	   
QUIT;


/*GENDER*/

/***********************************************
Step 1: Make a copy of the dataset copy - Gender
 ***********************************************/

PROC SQL;

CREATE TABLE MYLIB038.TESTING_DS_TP063038_IMP_GENDER AS 
SELECT * FROM MYLIB038.TESTING_DS_TP063038_IMP_HISTORY;

QUIT;


/*******************************************************************
Step 2: Before imputation: list the observation with missing values
********************************************************************/

TITLE 'Before Imputation: Observations with Missing Values in Gender';

PROC SQL;

SELECT * FROM MYLIB038.TESTING_DS_TP063038_IMP_GENDER g 
WHERE ((g.GENDER EQ '') OR
	   (g.GENDER IS NULL) );
	  
QUIT;


/*******************************************************************
Step 3: Before imputation: count the observation with missing values
********************************************************************/

TITLE 'Before Imputation: Number of Observations with Missing Values in Gender';

PROC SQL;
	
SELECT COUNT(*) LABEL='NUMBER OF OBSERVATIONS'
FROM MYLIB038.TESTING_DS_TP063038_IMP_GENDER g 
WHERE ((g.GENDER EQ '') OR
	   (g.GENDER IS NULL) );
	   
QUIT;


/***********************************************************************
Step 4: Before imputation: count the observation with non-missing values
 ***********************************************************************/

TITLE 'Before Imputation: Number of Observations with Non-Missing Values in Gender';

PROC SQL;
	
CREATE TABLE MYLIB038.TESTING_DS_TP063038_IMP_GENDER2 AS 
SELECT g.GENDER AS GENDER_NAME, COUNT(*) AS TOTAL_COUNTS 
FROM MYLIB038.TESTING_DS_TP063038_IMP_GENDER g 
WHERE ((g.GENDER NE '') OR
	   (g.GENDER IS NOT NULL) ) 
GROUP BY g.GENDER;

QUIT;

TITLE "Display of Observations with Non-Missing Values in Gender";

PROC SQL;

SELECT * FROM MYLIB038.TESTING_DS_TP063038_IMP_GENDER2;

QUIT;


/*when use LABEL, use ""; when use AS, use _*/


/******************************************************
Step 5: Before imputation: find out the mode of gender
 ******************************************************/

TITLE "Mode of Gender";

PROC SQL;
	
SELECT go.GENDER_NAME AS GENDER_NAME 
FROM MYLIB038.TESTING_DS_TP063038_IMP_GENDER2 go 
WHERE total_counts EQ (SELECT MAX(gi.total_counts) 
FROM MYLIB038.TESTING_DS_TP063038_IMP_GENDER2 gi);
	/*compare female & male*/
	
QUIT;

/*Male has the highest mode*/


/****************************************************************
Step 6: Imputation of Missing Values - Gender
 *****************************************************************/

TITLE 'Impute Missing Values in Gender';

PROC SQL;

UPDATE MYLIB038.TESTING_DS_TP063038_IMP_GENDER 
SET GENDER=(SELECT go.GENDER_NAME FROM MYLIB038.TESTING_DS_TP063038_IMP_GENDER2 go 
WHERE go.total_counts EQ (SELECT MAX(gi.total_counts) 
FROM MYLIB038.TESTING_DS_TP063038_IMP_GENDER2 gi) ) 
WHERE ((GENDER IS NULL) OR
	   (GENDER EQ "") );
		   
QUIT;


/******************************************************************
Step 7: After imputation: check the observation with missing values
 ******************************************************************/

TITLE 'After Imputation: List the Observations with Missing Values in Gender';

PROC SQL;
	
SELECT * FROM MYLIB038.TESTING_DS_TP063038_IMP_GENDER g 
WHERE ((g.GENDER EQ '') OR
	   (g.GENDER IS NULL) );
	   
QUIT;

TITLE 'After Imputation: Check Number of Observation with Missing Values in Gender';

PROC SQL;

SELECT COUNT(*) LABEL='NUMBER OF OBSERVATIONS' 
FROM MYLIB038.TESTING_DS_TP063038_IMP_GENDER g 
WHERE ((g.GENDER EQ '') OR
	   (g.GENDER IS NULL) );
	   
QUIT;


/*Family Members*/

/*******************************************************
Step 1: Make a copy of the dataset copy - Family Members
 *******************************************************/

PROC SQL;

CREATE TABLE MYLIB038.TESTING_DS_TP063038_IMP_FAMILY AS 
SELECT * FROM MYLIB038.TESTING_DS_TP063038_IMP_GENDER;

QUIT;


/*******************************************************************
Step 2: Before imputation: list the observations with missing values
********************************************************************/

TITLE 'Before Imputation: Observations with Missing Values in Family Members';

PROC SQL;

SELECT * FROM MYLIB038.TESTING_DS_TP063038_IMP_FAMILY f
WHERE ((f.FAMILY_MEMBERS EQ '') OR
	   (f.FAMILY_MEMBERS IS NULL) );
	  
QUIT;


/*******************************************************************
Step 3: Before imputation: count the observation with missing values
********************************************************************/

TITLE 'Before Imputation: Number of Observations with Missing Values in Family Members';

PROC SQL;
	
SELECT COUNT(*) LABEL='NUMBER OF OBSERVATIONS'
FROM MYLIB038.TESTING_DS_TP063038_IMP_FAMILY f 
WHERE ((f.FAMILY_MEMBERS EQ '') OR
	   (f.FAMILY_MEMBERS IS NULL) );
	   
QUIT;


/***********************************************************************
Step 4: Before imputation: count the observation with non-missing values
 ***********************************************************************/

TITLE 'Before Imputation: Number of Observations with Non-Missing Values in Family Members';

PROC SQL;
	
CREATE TABLE MYLIB038.TESTING_DS_TP063038_IMP_F2 AS 
SELECT f.FAMILY_MEMBERS AS FAMILY_MEMBERS_NAME, COUNT(*) AS TOTAL_COUNTS 
FROM MYLIB038.TESTING_DS_TP063038_IMP_FAMILY f 
WHERE ((f.FAMILY_MEMBERS NE '') OR
	   (f.FAMILY_MEMBERS IS NOT NULL) ) 
GROUP BY f.FAMILY_MEMBERS;

QUIT;

TITLE "Display of Observations with Non-Missing Values in Family Members";

PROC SQL;

SELECT * FROM MYLIB038.TESTING_DS_TP063038_IMP_F2;

QUIT;


/*when use LABEL, use ""; when use AS, use _*/


/*************************************************************
Step 5: Before imputation: find out the mode of family members
 *************************************************************/

TITLE "Mode of Family Members";

PROC SQL;
	
SELECT fo.FAMILY_MEMBERS_NAME AS FAMILY_MEMBERS_NAME 
FROM MYLIB038.TESTING_DS_TP063038_IMP_F2 fo 
WHERE total_counts EQ (SELECT MAX(fi.total_counts) 
FROM MYLIB038.TESTING_DS_TP063038_IMP_F2 fi);
	/*compare 0,1,2 and 3+*/
	
QUIT;


/*****************************************************
Step 6: Imputation of Missing Values - Family Members
 *****************************************************/

TITLE 'Impute Missing Values in Family Members';

PROC SQL;

UPDATE MYLIB038.TESTING_DS_TP063038_IMP_FAMILY 
SET FAMILY_MEMBERS=(SELECT fo.FAMILY_MEMBERS_NAME FROM MYLIB038.TESTING_DS_TP063038_IMP_F2 fo 
WHERE fo.total_counts EQ (SELECT MAX(fi.total_counts) 
FROM MYLIB038.TESTING_DS_TP063038_IMP_F2 fi) ) 
WHERE ((FAMILY_MEMBERS IS NULL) OR
	   (FAMILY_MEMBERS EQ "") );
		   
QUIT;


/******************************************************************
Step 7: After imputation: check the observation with missing values
 ******************************************************************/

TITLE 'After Imputation: List the Observations with Missing Values in Family Members';

PROC SQL;
	
SELECT * FROM MYLIB038.TESTING_DS_TP063038_IMP_FAMILY f 
WHERE ((f.FAMILY_MEMBERS EQ '') OR
	   (f.FAMILY_MEMBERS IS NULL) );
	   
QUIT;

TITLE 'After Imputation: Check Number of Observation with Missing Values in Family Members';

PROC SQL;

SELECT COUNT(*) LABEL='NUMBER OF OBSERVATIONS' 
FROM MYLIB038.TESTING_DS_TP063038_IMP_FAMILY f 
WHERE ((f.FAMILY_MEMBERS EQ '') OR
	   (f.FAMILY_MEMBERS IS NULL) );
	   
QUIT;


/*Imputing Missing Values FOR Continuous Variables - TESTING_DS*/

/*LOAN_AMOUNT - make sure to check the univariate analysis to check*/

/*****************************************************
Step 1: Make a copy of the dataset copy - Loan Amount
 *****************************************************/

PROC SQL;

CREATE TABLE MYLIB038.TESTING_DS_TP063038_IMP_AMOUNT  AS
SELECT * FROM MYLIB038.TESTING_DS_TP063038_IMP_FAMILY;

QUIT;


/******************************************************************
Step 2: Before Imputation: List the observations of missing values 
*******************************************************************/

TITLE '7.14.4.2: Before Imputation: List the Observations of Missing Values in Loan Amount';

PROC SQL;

SELECT * 
FROM MYLIB038.TESTING_DS_TP063038_IMP_AMOUNT l /*use the latest dataset*/
WHERE ( l.LOAN_AMOUNT EQ . );

QUIT;


/************************************************************************
Step 3: Before imputation: count the no. of missing values in Loan Amount
 ************************************************************************/

TITLE '7.14.4.3: Before Imputation: Number of Missing Values in Loan Amount';

PROC SQL;

SELECT COUNT(*) LABEL = 'No. of Missing Values' 
FROM MYLIB038.TESTING_DS_TP063038_IMP_AMOUNT l /*use the latest dataset*/
WHERE ( l.LOAN_AMOUNT EQ . );

QUIT;


/***************************************************
Step 4: Imputation of missing values in loan amount
 ***************************************************/

TITLE '7.14.4.4: Imputation of Missing Values in Loan Amount';

PROC STDIZE DATA=MYLIB038.TESTING_DS_TP063038_IMP_AMOUNT REPONLY
METHOD=MEAN OUT=MYLIB038.TESTING_DS_TP063038_IMP_AMOUNT;
VAR LOAN_AMOUNT;

QUIT;


/*******************************************************************
Step 5: After imputation: check the observations with missing values
 *******************************************************************/

TITLE '7.14.4.5: List of Missing Values in Loan Amount';

PROC SQL;

SELECT * 
FROM MYLIB038.TESTING_DS_TP063038_IMP_AMOUNT l /*use the latest dataset*/
WHERE ( l.LOAN_AMOUNT EQ . );

QUIT;

TITLE '7.14.4.5: Number of Missing Values in Loan Amount';

PROC SQL;

SELECT COUNT(*) LABEL = 'No. of Missing Values' 
FROM MYLIB038.TESTING_DS_TP063038_IMP_AMOUNT l /*use the latest dataset*/
WHERE ( l.LOAN_AMOUNT EQ . );

QUIT;



/*Imputing Missing Values FOR Continuous Variables - TESTING_DS*/

/*LOAN_DURATION - make sure to check the univariate analysis to check*/

/*******************************************************
Step 1: Make a copy of the dataset copy - Loan Duration
 *******************************************************/

PROC SQL;

CREATE TABLE MYLIB038.TESTING_DS_TP063038_IMP_LD  AS
SELECT * FROM MYLIB038.TESTING_DS_TP063038_IMP_AMOUNT;

QUIT;


/******************************************************************
Step 2: Before Imputation: List the observations of missing values 
*******************************************************************/

TITLE '7.14.5.2: Before Imputation: List the Observations with Missing Values in Loan Duration';

PROC SQL;

SELECT * 
FROM MYLIB038.TESTING_DS_TP063038_IMP_LD d /*use the latest dataset*/
WHERE ( d.LOAN_DURATION EQ . );

QUIT;


/***************************************************************************
Step 3: Before imputation: count the no. of missing values in Loan Duration
 ***************************************************************************/

TITLE '7.14.5.3: Before Imputation: Number of Missing Values in Loan Duration';

PROC SQL;

SELECT COUNT(*) LABEL = 'No. of Missing Values' 
FROM MYLIB038.TESTING_DS_TP063038_IMP_LD d /*use the latest dataset*/
WHERE ( d.LOAN_DURATION EQ . );

QUIT;


/***************************************************
Step 4: Imputation of missing values in loan duration
 ***************************************************/

TITLE '7.14.5.4: Imputation of Missing Values in Loan Duration';

PROC STDIZE DATA=MYLIB038.TESTING_DS_TP063038_IMP_LD REPONLY
METHOD=MEAN OUT=MYLIB038.TESTING_DS_TP063038_IMP_LD;
VAR LOAN_DURATION;

QUIT;


/*******************************************************************
Step 5: After imputation: check the observations with missing values
 *******************************************************************/

TITLE '7.14.5.5: List of Missing Values in Loan Duration';

PROC SQL;

SELECT * 
FROM MYLIB038.TESTING_DS_TP063038_IMP_LD d /*use the latest dataset*/
WHERE ( d.LOAN_DURATION EQ . );

QUIT;

TITLE '7.14.5.5: Number of Missing Values in Loan Duration';

PROC SQL;

SELECT COUNT(*) LABEL = 'No. of Missing Values' 
FROM MYLIB038.TESTING_DS_TP063038_IMP_LD d /*use the latest dataset*/
WHERE ( d.LOAN_DURATION EQ . );

QUIT;



/**Remove the + for variable FAMILY_MEMBERS**/

/***************************************
Step 1: Separate the number and '+' sign  
 ***************************************/

TITLE '7.14.6.1 Separate the Number and '+' Sign';

PROC SQL;

SELECT f.FAMILY_MEMBERS, 
	   SUBSTR(f.FAMILY_MEMBERS, 1, 1), /*first number = position; 
	                                     second no. = how many letter/no 
	                                     you want to separate*/
	   SUBSTR(f.FAMILY_MEMBERS, 2, 1)
FROM MYLIB038.TESTING_DS_TP063038_IMP_LD f;

QUIT;


/****************************************************************
Step 2: Count the no. of observations with '+'
 *****************************************************************/

TITLE '7.14.6.2 Number of Observations with '+' Sign';

PROC SQL;

SELECT COUNT(*) LABEL = 'NUMBER OF OBSERVATIONS WITH +'
FROM MYLIB038.TESTING_DS_TP063038_IMP_LD f
WHERE ( SUBSTR(f.FAMILY_MEMBERS,2,1) EQ '+' );

QUIT;


/***********************************
Step 3: Remove the '+' permanently
 ***********************************/

TITLE '7.14.6.3 Removal of + Sign Permanently';

PROC SQL;

UPDATE MYLIB038.TESTING_DS_TP063038_IMP_LD
SET FAMILY_MEMBERS = SUBSTR(family_members,1,1);
WHERE ( SUBSTR(f.FAMILY_MEMBERS,2,1) EQ '+' );

QUIT;


/****************************************************************
Step 4: After removal of '+', check the observations again
 *****************************************************************/

TITLE '7.14.6.4 After Removal of + Sign, Check the Observations';

PROC SQL;

SELECT f.FAMILY_MEMBERS LABEL = 'Family Category',
       COUNT(*) LABEL = 'No. of Applicants'
FROM MYLIB038.TESTING_DS_TP063038_IMP_LD f
GROUP BY f.FAMILY_MEMBERS;

QUIT;


/*Building Logistic Regression Model*/


/****************************************
7.15.2.2: Build Logistic Regression Model
*****************************************/

PROC LOGISTIC DATA = MYLIB038.TRAINING_DS_TP063038_IMP_LD 
			  OUTMODEL = MYLIB038.TRAINING_DS_TP063038_LR_MODEL
			  PLOTS=(ODDSRATIO(CLDISPLAY=SERIFARROW) ROC);

CLASS
GENDER
MARITAL_STATUS
FAMILY_MEMBERS
QUALIFICATION
EMPLOYMENT
LOAN_LOCATION
; 
/*above are the categorical variables*/

MODEL LOAN_APPROVAL_STATUS = /*this is a dependent variable*/

/*input all the independent variables*/

GENDER
MARITAL_STATUS
FAMILY_MEMBERS
QUALIFICATION
EMPLOYMENT
LOAN_HISTORY
LOAN_LOCATION
LOAN_DURATION
CANDIDATE_INCOME
GUARANTEE_INCOME
LOAN_AMOUNT /*add all except loan_id & loan_approval_status...*/
/CTABLE;

OUTPUT OUT = MYLIB038.TRAINING_DS_TP063038_LR_OUTPUT /*prediction results will be stored here*/
P = PRED_PROB; /*Predicted Probability - explain*/

/*Akaike Information criterion (AIC) must be < Schwarz Criterion (SC)*/

RUN;


/*************************************************
7.15.2.13: Prediction from Logistic Regression Model
 *************************************************/

PROC SQL;

SELECT * FROM MYLIB038.TRAINING_DS_TP063038_LR_OUTPUT;

QUIT;


/***************************************************
7.15.2.16: Contents of the Logistic Regression Model
 ***************************************************/

PROC SQL;

SELECT * FROM MYLIB038.TRAINING_DS_TP063038_LR_MODEL;

QUIT;


/*************************************************************************
 7.15.3.2: Fit the Testing Data into the Trained Logistic Regression Model
**************************************************************************/

PROC LOGISTIC INMODEL= MYLIB038.TRAINING_DS_TP063038_LR_MODEL; /*pass the model you created*/
SCORE DATA = MYLIB038.TESTING_DS_TP063038_IMP_LD /*pass the test dataset*/
OUT=MYLIB038.TESTING_DS_PREDICTION; /*specify the location of output*/

QUIT;


/**********************************************************
7.15.3.4: Display the Prediction Result - Testing Dataset
***********************************************************/

PROC SQL;

TITLE '7.15.3.4: Prediction Results - Testing Dataset';

SELECT SME_LOAN_ID_NO LABEL = 'Loan ID',
	   I_LOAN_APPROVAL_STATUS LABEL = 'Loan Approval Status',
	   P_N LABEL = 'Probability of Rejected',
	   P_Y LABEL = 'Probability of Approved'
	   
FROM MYLIB038.TESTING_DS_PREDICTION;

QUIT;	   


/******************************************************************
7.15.3.7: Display the Summary Table of Prediction - Testing Dataset
*******************************************************************/

PROC SQL;

TITLE '7.15.3.7: Summary of Prediction - Testing Dataset';

SELECT I_LOAN_APPROVAL_STATUS LABEL = 'Loan Approval Status',
	   COUNT(*) LABEL = 'Number of Observation'
	   
FROM MYLIB038.TESTING_DS_PREDICTION
GROUP BY I_LOAN_APPROVAL_STATUS;

QUIT;



/*Output Delivery System*/

/**********************************************************************************
7.16.2: Step 1 - Output Delivery System - Find the Physical Location of the Library
***********************************************************************************/

PROC DATASETS LIBRARY = MYLIB038 MEMTYPE=DATA;

RUN;


/*****************************************************************
7.16.5: Step 2 - Output Delivery System - To Generate the Report
******************************************************************/

ODS HTML CLOSE;
ODS PDF CLOSE;

ODS PDF FILE = "/home/u57978414/MYDAPTP063038/LOAN_APPLICATION_PREDICTED_REPORT.pdf";
OPTIONS NOBYLINE NODATE;
TITLE 'Bank Loan Predicted Approval Status';

PROC REPORT DATA=MYLIB038.TESTING_DS_PREDICTION NOWINDOWS;
BY SME_LOAN_ID_NO;
DEFINE SME_LOAN_ID_NO / GROUP 'Loan ID';
DEFINE I_LOAN_APPROVAL_STATUS / GROUP 'Loan Approval Status';

FOOTNOTE '---END OF REPORT---';

RUN;



/*---END OF CODES REPORT---*/



