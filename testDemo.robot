*** Setting ***
Documentation    To validate the Login form
Library    SeleniumLibrary
Test Teardown   Close Browser
#Resource
#selenium

*** Variables ***
${Error_Massege_Login}      css=.alert-danger

*** Test Cases ***
Validate Succesful Login
	open the browser with the Mortgage payment url
	Fill the login Form
	wait until it cchechs and display error message
	verify error message is correct

*** Keywords ***
open the browser with the Mortgage payment url
	Create Webdriver    Chrome  C:\Users\LENOVO\PycharmProjects\kkonicki-qa-47b3381b41dc\venv\Lib\site-packages\selenium\webdriver\chrome
	Go To    https://rahulshettyacademy.com/loginpagePractise/

Fill the login Form
	Input Text    id:username     Serdar KIlIÇ
	Input Password    xpath=//input[@type="password"]      123456789
	Click Element    terms
	Click Button       signInBtn

wait until it cchechs and display error message
    Wait Until Element Is Visible   ${Error_Massege_Login}

verify error message is correct
	${result}=  Get Text    ${Error_Massege_Login}
	Should Be Equal As Strings    ${result}   Incorrect username/password.







