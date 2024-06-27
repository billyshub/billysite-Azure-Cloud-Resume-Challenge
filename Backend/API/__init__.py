# Import necessary modules for working with JSON and Azure Functions
import json
import azure.functions as func

# Function to process the input data and return the updated count
def process_input(input_data: str) -> str:
    try:
        # Deserialize the JSON input into a Python dictionary
        msg = json.loads(input_data)

        # Extract the 'Row Key' value of the last visitor in the message
        last_count = list(msg)[-1]['RowKey']

        # Convert the 'Row Key' to an integer, add 1, and convert it back to a string
        new_count = str(int(last_count) + 1)

        # Return the new count as a JSON string
        return new_count
    except (ValueError, IndexError, KeyError) as e:
        # Handle potential errors during processing
        return str(e)

# Main function for the Azure Function
def main(req: func.HttpRequest, inputTable, outputTable: func.Out[str]) -> func.HttpResponse:
    # Get input data from the 'tableInput' parameter
    input_data = inputTable

    # Process the input data using the 'process_input' function
    new_count = process_input(input_data)

    # Check if there was an error during processing
    if "Error" in new_count:
        # Return an error response with a 400 status code
        return func.HttpResponse(f"Error processing input: {new_count}", status_code=400)

    # Set the output data for the function as a JSON string
    outputTable.set(json.dumps({"RowKey": new_count}))

    # Return a response message with the updated visitor count, and convert it to plain text
    return func.HttpResponse(f"Congratulations! 🎉 You are person number {new_count} to visit this site. Unfortunately, there is no prize. 😁", mimetype="text/plain")