*** Setting ***
Documentation    To validate the Login form
Library    SeleniumLibrary
Library     Collections
Test Setup    open the browser with the Mortgage payment url
#Test Teardown   Close Browser session
Resource    resource.robot
#Resource
#selenium

*** Variables ***
${Error_Massege_Login}      css=.alert-danger
${Shop_page_load}           css=.nav-link

*** Test Cases ***
#Validate Unsuccesful Login
#	Fill the login Form      ${user_name}    ${invalid_password}
#   wait until Element is located in the page   ${Error_Massege_Login}
#	verify error message is correct

#Validate Cards display in the Shopping Page
#	Fill the login Form     ${user_name}    ${valid_password}
#    wait until Element is located in the page   ${Shop_page_load}
#    Verify Card titles in the Shop page
#    Select the Card     Blackberry

Fill the Login Details and Login Form
	Input Text    id:username   rahulshettyacademy
	Input Password    password     learning
	Click Element   css:input[value="user"]
	Wait Until Element Is Visible    id:okayBtn
	Click Button    id:okayBtn
	Wait Until Element Is Not Visible    id:okayBtn
	Select From List By Label    css:select.form-control     Teacher
	Select Checkbox    id:terms
	Checkbox Should Be Selected    terms

*** Keywords ***
Fill the login Form
	[Arguments]    ${user_name}     ${password}
	Input Text    id:username     ${user_name}
	Input Password    xpath=//input[@type="password"]      ${password}
	Click Element    terms
	Click Button       signInBtn

wait until Element is located in the page
	[Arguments]    ${element}
    Wait Until Element Is Visible   ${element}

verify error message is correct
	${result}=  Get Text    ${Error_Massege_Login}
	Should Be Equal As Strings    ${result}   Incorrect username/password.
	#Element Text Should Be    ${Error_Massege_Login}    Incorrect username/password.

Verify Card titles in the Shop page
    @{expectedList} =   Create List     iphone X    Samsung Note 8      Nokia Edge      Blackberry
    ${elements} =   Get Webelements     xpath=//app-card-list//h4//a[@href="#"]
    @{actualList}=      Create List

    FOR    ${element}   IN    @{elements}
    	Log     ${element.text}
    	Append to List  ${actualList}   ${element.text}
    END

    Lists Should Be Equal    ${actualList}      ${expectedList}     ignore_order=True

Select the Card
    [Arguments]    ${cardName}
    ${elements} =   Get Webelements    css=.card-title
    ${index} =  Set Variable    1
    FOR    ${element}    IN     @{elements}
    	Exit For Loop If     '${cardName}' == '${element.text}'
        ${index}=   Evaluate    ${index} + 1
    END

    Click Button    (//*[@class="btn btn-info"])[${index}]

