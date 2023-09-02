*** Settings ***
Documentation       A test suite with functional tests for ParkCalc in a keyword-driven format.

Resource            common.resource

Suite Setup         Open ParkCalc
Suite Teardown      Close Browser
Test Setup          Input Parking Lot    Short-Term Parking

Force Tags          kdt


*** Test Cases ***
First Hour
    [Tags]    i
    Input Entry Date    05/04/2010    12:00    AM
    Input Leaving Date    05/04/2010    12:59    AM
    Calculated Cost Should Be    $ 2.00

One And An Additional Half Hour
    Input Entry Date    05/04/2010    12:00    AM
    Input Leaving Date    05/04/2010    01:29    AM
    Calculated Cost Should Be    $ 3.00

Three Hours
    Input Entry Date    05/04/2010    12:00    AM
    Input Leaving Date    05/04/2010    03:00    AM
    Calculated Cost Should Be    $ 6.00

Twelve And A Half Hour
    Input Entry Date    05/04/2010    12:00    AM
    Input Leaving Date    05/04/2010    12:29    PM
    Calculated Cost Should Be    $ 25.00
