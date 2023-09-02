*** Settings ***
Documentation       A resource file containing the ParkCalc app specific keywords and variables for keyword-driven tests that create our own domain specific language. Also SeleniumLibrary itself is imported here so that tests only need to import this resource file.

Library             ${LIBRARY}


*** Variables ***
${LIBRARY} =        Browser
${BROWSER}          firefox
${DELAY}            0
${PARKCALC URL}     http://robotframework.transformidea.com/app/parkcalc/    # http://adam.goucher.ca/parkcalc/
${COST_ITEM}        xpath=//html/body/form/table/tbody/tr[4]/td[2]/span[1]/font/b
${PAGE_TITLE}       Parking Calculator


*** Keywords ***
Open ParkCalc
    New Browser    ${BROWSER}    headless=True
    New Context    viewport={"width": 800, "height": 600}
    New Page    ${PARKCALC URL}
    Get Title    contains    ${PAGE_TITLE}

Input Parking Lot
    [Arguments]    ${lot}
    Select Options By    select[name=Lot]    label    ${lot}

Input Entry Date
    [Arguments]    ${date}    ${time}    ${ampm}
    Fill Text    input#EntryDate    ${date}
    Fill Text    input#EntryTime    ${time}
    IF    $ampm == "AM"
        ${selector} =    Get Element
        ...    body > form > table > tbody > tr:nth-child(2) > td:nth-child(2) > font > input[type="radio"]:nth-child(2)
    ELSE IF    $ampm == "PM"
        ${selector} =    Get Element
        ...    body > form > table > tbody > tr:nth-child(2) > td:nth-child(2) > font > input[type="radio"]:nth-child(3)
    END
    Click    ${selector}

Input Leaving Date
    [Arguments]    ${date}    ${time}    ${ampm}
    Fill Text    input#ExitDate    ${date}
    Fill Text    input#ExitTime    ${time}
    IF    $ampm == "AM"
        ${selector} =    Get Element
        ...    body > form > table > tbody > tr:nth-child(3) > td:nth-child(2) > font > input[type="radio"]:nth-child(2)
    ELSE IF    $ampm == "PM"
        ${selector} =    Get Element
        ...    body > form > table > tbody > tr:nth-child(3) > td:nth-child(2) > font > input[type="radio"]:nth-child(3)
    END
    Click    ${selector}

Calculated Cost Should Be
    [Arguments]    ${cost}
    Click    body > form > input[type="submit"]:nth-child(3)
    ${actual} =    Get Text    ${COST_ITEM}
    Log    Actual costs: ${actual}
    Should Be Equal As Strings    ${cost}    ${actual}
