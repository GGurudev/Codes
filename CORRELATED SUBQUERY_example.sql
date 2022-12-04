/*  CORELATED SUBQUERIES - EXIST / NOT EXIST  */

 - IT IS A SUBQUERY THAT USES VALUES FROM OUTER QUERY 
 - FOLLOWS TOP TO DOWN APPROACH
 - if an outer query column is being accessed inside the inner query, then that query is said to be corelated.

Employee Table: PI_CORR_EMPLOYEES

EMP_ID 		EMP_NAME			EMP_ADDRESS

	E1					AJAY						 MYSORE                                 
	E2					AKSHAY				 KOLLEGAL
	E3					BHOOMIKA			 MYSORE
	E4					CHANDANI			 MADDUR
	E5					DEETHI 				 MANDYA
	E6					KIRAN 					 MYSORE
	E7					RAHUL 					 BENGALORE
	E8					SWATHI				 TUMKUR
	E9					SUMITH				 BENGALORE
   E10	   				TEJAS					 TUMKUR

Department Table: PI_CORR_DEPARTMENTS

DEPT_ID		DEPT_NAME			EMP_ID

	D1				 HR								    E1				= E1    --> TRUE   =E2
	D2				 SALES						    E2				= E1	--> FALSE	=E2
	D3				 IT								    E3				= E1	--> FALSE
	D4				ADMIN						    E4				= E1	--> FALSE
	D5				TESTING					    E5				= E1	--> FALSE
	D6			    OPERATIONS			    E6				= E1	--> FALSE
	D7				ACCOUNTS				    E7				= E1	--> FALSE
	D8				MARKETING	         NULL
	
DEPT_ID		DEPT_NAME			EMP_ID

	D1				 HR								    E1				= E2    --> FALSE   
	D2				 SALES						    E2				= E2	--> TRUE	
	D3				 IT								    E3				= E2	--> FALSE
	D4				ADMIN						    E4				= E2	--> FALSE
	D5				TESTING					    E5				= E2	--> FALSE
	D6			    OPERATIONS			    E6				= E2	--> FALSE
	D7				ACCOUNTS				    E7				= E2	--> FALSE
	D8				MARKETING	         NULL	
	
	
/*
1) Get the primary key/candidate key from the outer query       -  emp id = E1
2) Execute the inner query using the primary key value - compare with each record of inner query values 
3) Use values from inner query to qualify or disqualify  -  True / False
the loop continues 
*/	
	

	SELECT * FROM PI_CORR_EMPLOYEES E 
					 WHERE EXISTS (SELECT * 
											             FROM PI_CORR_DEPARTMENTS D
													  WHERE D.EMP_ID = E.EMP_ID);