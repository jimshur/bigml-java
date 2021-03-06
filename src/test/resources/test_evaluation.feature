Feature: Evaluation

    Scenario Outline: Successfully creating an evaluation for a model:
        Given I create a data source uploading a "<data>" file
        And I wait until the source is ready less than <time_1> secs
        And I create a dataset
        And I wait until the dataset is ready less than <time_2> secs
        And I create a model
        And I wait until the model is ready less than <time_3> secs
        When I create an evaluation for the model with the dataset
        And I wait until the evaluation is ready less than <time_4> secs
        Then the measured "<measure>" is equals to <value>
        Then delete test data

        Examples:
        | data	| time_1  | time_2 | time_3 | time_4 | measure       | value  |
        | data/iris.csv | 50      | 50     | 50     | 50     | average_phi   | 1      |
    
    
    Scenario Outline: Successfully creating an evaluation for an ensemble:
        Given I create a data source uploading a "<data>" file
        And I wait until the source is ready less than <time_1> secs
        And I create a dataset
        And I wait until the dataset is ready less than <time_2> secs
        And I create an ensemble of <number_of_models> models
        And I wait until the ensemble is ready less than <time_3> secs
        When I create an evaluation for the ensemble with the dataset
        And I wait until the evaluation is ready less than <time_4> secs
        Then the measured "<measure>" is equals to <value>
        Then delete test data

        Examples:
        | data             | time_1  | time_2 | number_of_models | time_3 | time_4 | measure       | value  |
        | data/iris.csv | 50      | 50     | 5                | 80     | 80     | average_phi   | 0.97064   |
        
        
    Scenario Outline: Successfully creating an evaluation for a linear regression:
        Given I create a data source uploading a "<data>" file
        And I wait until the source is ready less than <time_1> secs
        And I create a dataset
        And I wait until the dataset is ready less than <time_2> secs
        And I create a linearregression from a dataset
        And I wait until the linearregression is ready less than <time_3> secs
        When I create an evaluation for the linearregression with the dataset
        And I wait until the evaluation is ready less than <time_4> secs
        Then the measured "<measure>" is equals to <value>
        Then delete test data

        Examples:
        | data             | time_1  | time_2 | tlp | time_3 | time_4 | measure       | value  |
        | data/iris.csv | 50      | 50     | 5                | 800     | 80     | r_squared   | 0.95382   |
        
    
    Scenario Outline: Successfully an evaluation for a fusion:
        Given I create a data source uploading a "<data>" file
        And I wait until the source is ready less than <time_1> secs
        And I create a dataset
        And I wait until the dataset is ready less than <time_2> secs
        And I create a model
        And I wait until the model is ready less than <time_3> secs
        And I create a model
        And I wait until the model is ready less than <time_3> secs
        And I create a model
        And I wait until the model is ready less than <time_3> secs
        And I create a fusion from models
        And I wait until the fusion is ready less than <time_3> secs
        When I create an evaluation for the fusion with the dataset
        And I wait until the evaluation is ready less than <time_4> secs
        Then the measured "<measure>" is equals to <value>
        Then I delete the fusion
        Then delete test data

        Examples:
        | data                | time_1  | time_2 | time_3 | time_4	| measure       | value  |
        | data/iris.csv | 50      | 50     | 50     | 50 | average_phi   | 1      |
