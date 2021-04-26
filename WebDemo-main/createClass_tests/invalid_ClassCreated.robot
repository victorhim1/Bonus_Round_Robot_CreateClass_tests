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
	
*** Test Cases ***  		classTitle				Desc				DiffVal			LangVal
Invalid diffVal				${VALID ClassTitle}		${VALID DESC}		 0					2
Invalid langVal				${VALID ClassTitle}		${VALID DESC}		 1					0
Invalid diffVal And langVal	${VALID ClassTitle}		${VALID DESC}		 0					0
Empty classTitle			${EMPTY}				${VALID DESC}		 3					1
Empty DESC					${VALID ClassTitle}		${EMPTY}			 2					3
Empty classTitle And DESC	${EMPTY}				${EMPTY}			 2					2
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
    Location Should Be    ${CREATE_CLASS_ERR URL}
    Title Should Be    Error Page