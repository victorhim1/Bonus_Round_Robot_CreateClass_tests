*** Settings ***
Documentation     A test suite containing tests related to invalid class creation.
...
...               These tests are data-driven by their nature. They use a single
...               keyword, specified with Test Template setting, that is called
...               with different arguments to cover different scenarios.
...
...               This suite also demonstrates using setups and teardowns in
...               different levels.
Suite Setup       resource.Open Browser To Create Class Page
Suite Teardown    Close Browser
Test Setup        Go To Create Class Page 
Test Template     Create Class With Invalid ClassInfo Should Fail
Resource          resource.robot
	
*** Test Cases ***  			classTitle				Desc				DiffVal			LangVal
classTitle Only					${VALID ClassTitle}		${EMPTY}		     0					0
DESC only						${EMPTY}				${VALID DESC}	     0					0
DiffVal only					${EMPTY}				${EMPTY}			 1					0
LangVal only					${EMPTY}				${EMPTY}		     0					3
EMPTY DiffVal And LangVal		${VALID ClassTitle}		${VALID DESC}		 0					0
EMPTY Desc And LangVal	    	${VALID ClassTitle}		${EMPTY}			 2					0
EMPTY Desc And DiffVal 	   	    ${VALID ClassTitle}		${EMPTY}			 0					1
EMPTY classTitle And LangVal	${EMPTY}				${VALID DESC}		 3					0
EMPTY classTitle And DiffVal	${EMPTY}				${VALID DESC}		 0					3
EMPTY classTitle And Desc		${EMPTY}				${EMPTY}		     2					2
Empty LangVal 					${VALID ClassTitle}		${VALID DESC}		 2					0
Empty DiffVal 					${VALID ClassTitle}		${VALID DESC}		 0					1
Empty Desc 						${VALID ClassTitle}		${EMPTY}			 1					2
Empty classTitle 				${EMPTY}				${VALID DESC}		 2					3
Empty classTitle And DESC And Invalid diffVal And langVal	${EMPTY}	${EMPTY}	0	 0


*** Keywords ***
Create Class With Invalid ClassInfo Should Fail
    [Arguments]    ${classTitle}    ${DESC}		${diffVal}		${langVal}
    Input Class Title    ${classTitle}
    Input Class DESC     ${DESC}
	Choose Class Diffculty		${diffVal}
	Choose language		${langVal}
    Submit ClassInfo
    Class Creation Should Have Failed

Class Creation Should Have Failed
    CreateClassErr Page Should Be Open 