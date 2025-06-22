import pandas as pd
import os
import argparse

def extract_speed_violations(csv_file_path, start_date, end_date):
    """
    Extracts speed violation data from a CSV file within a specified date range.

    Args:
        csv_file_path (str): Path to the input CSV file.
        start_date (str): Start date in 'YYYY-MM-DD' format.
        end_date (str): End date in 'YYYY-MM-DD' format.
    """
    try:
        df = pd.read_csv(csv_file_path)
    except FileNotFoundError:
        print(f"Error: CSV file not found at path {csv_file_path}")
        return

    # Convert 'VIOLATION DATE' column from 'MM/DD/YYYY' (CSV source) to datetime objects
    df['VIOLATION DATE'] = pd.to_datetime(df['VIOLATION DATE'], format='%m/%d/%Y')

    # Convert start_date and end_date strings from 'YYYY-MM-DD' (command line) to datetime objects
    start_date_dt = pd.to_datetime(start_date, format='%Y-%m-%d')
    end_date_dt = pd.to_datetime(end_date, format='%Y-%m-%d')

    # Filter data based on the date range
    filtered_df = df[(df['VIOLATION DATE'] >= start_date_dt) & (df['VIOLATION DATE'] <= end_date_dt)]

    # Create the output directory using the end_date (YYYY-MM-DD)
    output_directory = end_date
    os.makedirs(output_directory, exist_ok=True)

    # Define the output file name and full path
    output_file_name = "SpeedViolation.csv"
    output_file_path = os.path.join(output_directory, output_file_name)

    # Save the filtered data to a new CSV file
    filtered_df.to_csv(output_file_path, index=False)

    print(f"Data successfully extracted to: {output_file_path}")

if __name__ == "__main__":
    # Set up the argument parser
    parser = argparse.ArgumentParser(
        description="Extracts speed violation data from a CSV file within a specified date range."
    )

    # Add command-line arguments
    parser.add_argument(
        '-f', '--file',
        type=str,
        required=True,
        help='Path to the input CSV file'
    )
    parser.add_argument(
        '--start',
        type=str,
        required=True,
        help='Start date in YYYY-MM-DD format'
    )
    parser.add_argument(
        '--end',
        type=str,
        required=True,
        help='End date in YYYY-MM-DD format'
    )

    # Parse the arguments from the command line
    args = parser.parse_args()

    # Call the data extraction function with the parsed arguments
    extract_speed_violations(args.file, args.start, args.end)
