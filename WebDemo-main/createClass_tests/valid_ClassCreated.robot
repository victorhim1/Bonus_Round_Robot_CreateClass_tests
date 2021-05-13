*** Settings ***
Documentation     A test suite with a single test for valid class creation.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Suite Setup       resource.Open Browser To Create Class Page
Suite Teardown    Close Browser
Test Setup        Go To Create Class Page 
Test Template     Create Class With valid ClassInfo Should Pass
Resource          resource.robot

*** Test Cases ***			classTitle				Desc				DiffVal			LangVal
correct_Case				${VALID ClassTitle}		${VALID DESC}		1				2

*** Keywords ***
Create Class With valid ClassInfo Should Pass	
	[Arguments]    ${classTitle}    ${DESC}		${diffVal}		${langVal}	
	Input Class Title	${classTitle}
	Input Class DESC	 ${DESC}
	Choose Class Diffculty		${diffVal}	
	Choose language		${langVal}	
	Submit ClassInfo
	Class Creation Should Have Passed
	
Class Creation Should Have Passed	
	ClassCreated Page Should Be Open 