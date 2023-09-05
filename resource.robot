*** Setting ***
Documentation   The system specific keywords created here form our own
...             domain specific language. They utilize keywords provided
...             by the imported SeleniumLibrary.
Library    SeleniumLibrary


*** Variables ***
${user_name}    rahulshettyacademy
${invalid_password}     123456789
${valid_password}       learning
${url}      https://rahulshettyacademy.com/loginpagePractise/

*** Keywords ***
open the browser with the Mortgage payment url
	Create Webdriver    Chrome  C:\Users\LENOVO\PycharmProjects\kkonicki-qa-47b3381b41dc\venv\Lib\site-packages\selenium\webdriver\chrome
	Go To    ${url}

Close Browser session
	Close Browser
