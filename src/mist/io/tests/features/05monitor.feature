@monitor
Feature: Monitor

    Background:
        #Given PhantomJS as the default browser
        #Given a browser
        Given "MonitorTester" as the persona
        When i visit mist.io
            Then I should see "mist.io"


    @web
    Scenario: Create Machine For Monitoring
        When I click the "Add backend" button
        And I wait for 1 seconds
        And I click the "Select provider" button
        And I wait for 1 seconds
        And i click the "EC2 AP NORTHEAST" button
        And I wait for 1 seconds
        And I use my "EC2" credentials
        And I wait for 1 seconds
        And I click the "Add" button
        And I wait for 1 seconds
            Then I should see the "EC2 AP NORTHEAST" Backend added within 30 seconds

        When I visit mist.io
        And I click the "Machines" button
        And I click the "Create" button
        And I type "monitor_tester" as machine name
        And I wait for 1 seconds
        And I click the "Select Provider" button
        And I wait for 1 seconds
        And I click the link with text that contains "EC2"
        And I wait for 1 seconds
        And I click the "Select Image" button
        And I wait for 1 seconds
        And I click the link with text that contains "Amazon Linux"
        And I wait for 1 seconds
        And I click the "Select Size" button
        And I wait for 1 seconds
        And I click the link with text that contains "Micro Instance"
        And I wait for 1 seconds
        And I click the "Select Location" button
        And I wait for 1 seconds
        And I click the link with text that contains "ap-northeast"
        And I wait for 1 seconds
        And I click the "Select Key" button
        And I wait for 1 seconds
        And I click the "Create Key" button
        And I type "monitor_tester" as key name
        And I click the "Generate" button
        And I click the "Done" button
        And I wait for 2 seconds
        And I click the "Launch!" button
        And I wait for 2 seconds
            Then "monitor_tester" state should be "pending" within 60 seconds
        When I wait for 1 seconds
            Then "monitor_tester" state should be "running" within 400 seconds
        When I wait for 1 seconds
            Then "monitor_tester" should be probed within 400 seconds
        When I wait for 1 seconds