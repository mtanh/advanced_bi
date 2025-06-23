import pandas as pd
import os
import argparse

def extract_humidity_data(csv_file_path, start_date, end_date):
    """
    Extracts humidity data from a CSV file within a specified date range.

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

    df['datetime'] = pd.to_datetime(df['datetime'], format='%Y-%m-%d %H:%M:%S', errors='coerce')

    df.dropna(subset=['datetime'], inplace=True)

    start_date_dt = pd.to_datetime(start_date, format='%Y-%m-%d')
    end_date_dt = pd.to_datetime(end_date, format='%Y-%m-%d')

    filtered_df = df[(df['datetime'].dt.date >= start_date_dt.date()) &
                     (df['datetime'].dt.date <= end_date_dt.date())]

    output_directory = end_date
    os.makedirs(output_directory, exist_ok=True)

    output_file_name = "Humidity.csv"
    output_file_path = os.path.join(output_directory, output_file_name)

    filtered_df.to_csv(output_file_path, index=False)

    print(f"Data successfully extracted to: {output_file_path}")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description="Extracts humidity data from a CSV file within a specified date range."
    )

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

    args = parser.parse_args()

    extract_humidity_data(args.file, args.start, args.end)

# Examples of how to run from the command line:
# python huminity_by_time_range.py -f ..\ds\Humidity.csv --start 2014-01-01 --end 2016-12-31
# python huminity_by_time_range.py -f ..\ds\Humidity.csv --start 2017-01-01 --end 2017-01-01
# python huminity_by_time_range.py -f ..\ds\Humidity.csv --start 2017-01-02 --end 2017-01-02
