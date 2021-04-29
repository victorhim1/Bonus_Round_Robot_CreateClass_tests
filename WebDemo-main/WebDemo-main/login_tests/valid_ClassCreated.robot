*** Settings ***
Documentation     A test suite with a single test for valid class creation.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          resource.robot

*** Test Cases ***
Valid ClassCreated
	Open Browser To Create Class Page
	Input Class Title		${VALID ClassTitle}	
	Input Class DESC		${VALID DESC}
	Choose Class Diffculty	 1
	Choose language	 2
	Submit ClassInfo
	ClassCreated Page Should Be Open 
	[Teardown]    Close Browser