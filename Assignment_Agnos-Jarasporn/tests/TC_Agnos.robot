*** Settings ***
Library     SeleniumLibrary
Resource    ../resources/keywords.robot

*** Test Cases ***

Login Successfully
    Open Browser To Login Page
    Login To System
    Close Browser

Login With Invalid Password
    Open Browser To Login Page
    Login With Invalid Password
    Verify Login Error Message
    Close Browser

Search Patient By Name
    Open Browser To Login Page
    Login To System
    Click Inprogress Tab
    Search Patient    Test
    Verify Table Displayed
    Close Browser

Search Patient With No Result
    Open Browser To Login Page
    Login To System
    Click Inprogress Tab
    Search Patient    777
    Verify No Data Message
    Close Browser

Logout Successfully
    Open Browser To Login Page
    Login To System
    Logout From System 