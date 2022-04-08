*** Settings ***
Documentation     A test suite with tests for long-term (Garage) parking.
Suite Setup       Open ParkCalc
Suite Teardown    Close Browser
Test Setup        Input Parking Lot    Long-Term Garage Parking
Force Tags        KDT
Resource          resource.robot

*** Test Cases ***
First Hour
    Input Entry Date    05/04/2010    12:00    AM
    Input Leaving Date    05/04/2010    12:59    AM
    Calculated Cost Should Be    $ 2.00

Three Hours
    Input Entry Date    05/04/2010    12:00    AM
    Input Leaving Date    05/04/2010    03:00    AM
    Calculated Cost Should Be    $ 6.00

Seven Hours
    Input Entry Date    05/04/2010    12:00    AM
    Input Leaving Date    05/04/2010    07:00    AM
    Calculated Cost Should Be    $ 14.00

Full Day
    Input Entry Date    05/04/2010    12:00    AM
    Input Leaving Date    05/05/2010    12:00    AM
    Calculated Cost Should Be    $ 12.00

Six Days
    Input Entry Date    05/04/2010    12:00    AM
    Input Leaving Date    05/11/2010    12:00    AM
    Calculated Cost Should Be    $ 72.00
