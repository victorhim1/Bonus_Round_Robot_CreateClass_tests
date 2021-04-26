*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
${SERVER}         localhost:7272
${BROWSER}        Safari
${DELAY}          0
${VALID USER}     demo
${VALID PASSWORD}    mode
${LOGIN URL}      http://${SERVER}/
${WELCOME URL}    http://${SERVER}/welcome.html
${ERROR URL}      http://${SERVER}/error.html
${CREATE_CLASS URL}         http://${SERVER}/createClass.html
${CLASSCREATED URL}         http://${SERVER}/classCreated.html
${CREATE_CLASS_ERR URL}         http://${SERVER}/classCreationError.html
${VALID ClassTitle}		Yoga
${VALID DESC}		Here is Yoga description

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Login Page Should Be Open

Login Page Should Be Open
    Title Should Be    Login Page

Go To Login Page
    Go To    ${LOGIN URL}
    Login Page Should Be Open

Input Username
    [Arguments]    ${username}
    Input Text    username_field    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    password_field    ${password}

Submit Credentials
    Click Button    login_button

Welcome Page Should Be Open
    Location Should Be    ${WELCOME URL}
    Title Should Be    Welcome Page

Open Browser To Create Class Page
	Open Browser	${CREATE_CLASS URL}    ${BROWSER}
	Maximize Browser Window
	Set Selenium Speed    ${DELAY}
	Create Class Page Should Be Open

Create Class Page Should Be Open
	Title Should Be		Create class

Go To Create Class Page
	 Go To    ${CREATE_CLASS URL}
	 Create Class Page Should Be Open

Input Class Title
    [Arguments]    ${classTitle}
	Input Text	   title_field		${classTitle}

Input Class DESC
	[Arguments]    ${DESC}
	Input Text	   description_field		${DESC}

Choose Class Diffculty
	[Arguments]		${value}
	Select From List By Value  xpath://*[@id="difficulty_field"]  ${value}
	
Choose language	
	[Arguments]		${value}
	Select From List By Value  xpath://*[@id="language_field"]  ${value}
	
Submit ClassInfo
	Click Button    submit_button
	
ClassCreated Page Should Be Open 
	Location Should Be    ${CLASSCREATED URL}
    Title Should Be    Result Page

CreateClassErr Page Should Be Open 
	Location Should Be    ${CREATE_CLASS_ERR URL}
    Title Should Be    Error Page

Go To ClassCreated Page
	Go To    ${CLASSCREATED URL}
    CLASSCREATED Page Should Be Open



	

