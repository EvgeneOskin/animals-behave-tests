Feature: Pet API.

    Background: Set server name, headers and reset test user's database
        Given I am using server "$SERVER"
        And I set base URL to "api/v1/"
        And I set "Accept" header to "application/json"
        And I set "Content-Type" header to "application/json"

    Scenario: Authentication required to list breeds.
        When I make a GET request to "breed/"
        Then the response status should be 401
        And the JSON should be
        """
        {"error": "401 Unauthorized"}
        """

    Scenario: Authentication required to list pets.
        When I make a GET request to "pet/"
        Then the response status should be 401
        And the JSON should be
        """
        {"error": "401 Unauthorized"}
        """

    Scenario: Authentication required to list births.
        When I make a GET request to "birth/"
        Then the response status should be 401
        And the JSON should be
        """
        {"error": "401 Unauthorized"}
        """

    Scenario: List breeds.
        Given I set BasicAuth username to "$USERNAME" and password to "$PASSWORD"
        When I make a GET request to "breed/"
        Then the response status should be 200
        And the JSON should be
        """
        {}
        """

    Scenario: List pets.
        Given I set BasicAuth username to "$USERNAME" and password to "$PASSWORD"
        When I make a GET request to "pet/"
        Then the response status should be 200
        And the JSON should be
        """
        {}
        """

    Scenario: List births.
        Given I set BasicAuth username to "$USERNAME" and password to "$PASSWORD"
        When I make a GET request to "birth/"
        Then the response status should be 200
        And the JSON should be
        """
        {}
        """
