import json
import unittest
from API import process_input  

class TestAPI(unittest.TestCase):

    def test_process_input_increment(self):
        # Input data with a single item in the list, expecting an output of 2
        input_data = '[{"RowKey": "1"}]'
        expected_output = '2'

        # Call the function with the test input
        result = process_input(input_data)

        # Check if the result matches the expected output
        self.assertEqual(result, expected_output)

    def test_process_input_invalid_input(self):
        # Input data with an invalid character in 'RowKey'
        input_data = '[{"RowKey": "billy"}]'

        # Call the function with the test input
        result = process_input(input_data)

        # Check if the result is an error message containing 'invalid' input
        self.assertTrue(isinstance(result, str) and "invalid" in result.lower())

    def test_process_input_missing_rowkey(self):
        # Input data without 'RowKey'
        input_data = '[{}]'

        # Call the function with the test input
        result = process_input(input_data)

        # Check if the result is an error message containing 'RowKey' is missing 
        self.assertTrue(isinstance(result, str) and "rowkey" in result.lower())

if __name__ == '__main__':
    unittest.main()
