*** Setting ***
Documentation    To validate the Login form
Library    SeleniumLibrary
Test Teardown   Close Browser
Library    String
#Resource
#selenium

*** Variables ***
${Error_Massege_Login}      css=.alert-danger

*** Test Cases ***
Validate Child window Functionality
	Select the link of Child window
	Verify the user is Switched to Child window
	Grab the Email id in the Child Window
	Switch to Parent window and enter the Email

*** Keywords ***
Select the link of Child window
	Click Link    .blinkingText
	Sleep    5

Verify the user is Switched to Child window
	Switch Window    NEW
	Should Be Equal As Strings    css:h1    Documents request

Grab the Email id in the Child Window
	${text}=    get text    css:.red
	Split String    ${text}     at

Switch to Parent window and enter the Email








