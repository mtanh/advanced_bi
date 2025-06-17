from datetime import datetime, timedelta
import csv
import os
import argparse

def process_violations_by_date_scoped(input_csv_file, start_month_str, end_month_str):
    """
    Đọc file CSV, trích xuất các dòng theo ngày "VIOLATION DATE" trong một phạm vi tháng cụ thể,
    và lưu vào các thư mục riêng biệt có tên YYYY-MM-DD.

    Args:
        input_csv_file (str): Đường dẫn đến file CSV đầu vào.
        start_month_str (str): Tháng bắt đầu (ví dụ: '2014-07').
        end_month_str (str): Tháng kết thúc (ví dụ: '2017-11').
    """
    try:
        # Chuyển đổi chuỗi tháng bắt đầu và kết thúc thành đối tượng datetime
        # Để so sánh hiệu quả, chúng ta lấy ngày đầu tháng của tháng bắt đầu
        # và ngày cuối tháng của tháng kết thúc.
        start_date = datetime.strptime(start_month_str, "%Y-%m").replace(day=1, hour=0, minute=0, second=0, microsecond=0)
        
        # Để lấy ngày cuối tháng của tháng kết thúc, ta cộng thêm 1 tháng rồi trừ đi 1 ngày
        # Ví dụ: 2017-11 -> 2017-12-01 -> 2017-11-30
        # datetime.max.day sẽ trả về 31 cho các tháng có 31 ngày, giúp xác định ngày cuối tháng
        if end_month_str == "9999-12": # Xử lý trường hợp đặc biệt cho đến cuối thời gian
            end_date = datetime.max
        else:
            # Lấy ngày cuối của tháng kết thúc
            # Để đơn giản, ta sẽ lấy ngày 1 của tháng tiếp theo và trừ đi 1 ngày
            year_end, month_end = map(int, end_month_str.split('-'))
            if month_end == 12:
                end_date_obj_temp = datetime(year_end + 1, 1, 1)
            else:
                end_date_obj_temp = datetime(year_end, month_end + 1, 1)
            end_date = end_date_obj_temp - timedelta(microseconds=1) # Trừ đi 1 micro giây để đảm bảo bao gồm toàn bộ ngày cuối cùng

        print(f"Chỉ trích xuất dữ liệu từ: {start_date.strftime('%Y-%m-%d')} đến: {end_date.strftime('%Y-%m-%d')}")

        with open(input_csv_file, mode='r', newline='', encoding='utf-8') as infile:
            reader = csv.DictReader(infile)
            fieldnames = reader.fieldnames # Lấy tên các cột ngay từ đầu

            # Dictionary để lưu trữ dữ liệu theo ngày (chỉ các ngày trong phạm vi)
            data_by_date = {}

            for row in reader:
                violation_date_str = row.get("VIOLATION DATE")
                if violation_date_str:
                    try:
                        # Chuyển đổi định dạng ngày từ MM/DD/YYYY sang đối tượng datetime
                        current_violation_date_obj = datetime.strptime(violation_date_str, "%m/%d/%Y")

                        # Kiểm tra xem ngày vi phạm có nằm trong phạm vi mong muốn hay không
                        if start_date <= current_violation_date_obj <= end_date:
                            formatted_date = current_violation_date_obj.strftime("%Y-%m-%d")
                            
                            if formatted_date not in data_by_date:
                                data_by_date[formatted_date] = []
                            data_by_date[formatted_date].append(row)
                    except ValueError:
                        print(f"Cảnh báo: Không thể phân tích ngày '{violation_date_str}'. Bỏ qua dòng này.")
                else:
                    print(f"Cảnh báo: Dòng này thiếu thông tin 'VIOLATION DATE'. Bỏ qua.")

        # Ghi dữ liệu vào các thư mục riêng biệt
        if not data_by_date:
            print("Không tìm thấy dữ liệu nào trong phạm vi thời gian đã cho.")
            return # Thoát hàm nếu không có dữ liệu để ghi

        for date, rows in data_by_date.items():
            # Tên thư mục đầu ra sẽ là ngày YYYY-MM-DD
            # Đặt thư mục gốc 'output_violations' trong một thư mục con của nó để tránh trùng lặp
            base_output_dir = "scoped_violations"
            output_dir = os.path.join(base_output_dir, date)
            
            # Kiểm tra và tạo thư mục nếu nó chưa tồn tại
            if not os.path.exists(output_dir):
                os.makedirs(output_dir)
                
            # Tên file luôn là SpeedViolation.csv bên trong thư mục ngày
            output_filename = "SpeedViolation.csv"
            output_filepath = os.path.join(output_dir, output_filename)

            with open(output_filepath, mode='w', newline='', encoding='utf-8') as outfile:
                writer = csv.DictWriter(outfile, fieldnames=fieldnames)
                writer.writeheader()
                writer.writerows(rows)
            print(f"Đã tạo file: {output_filepath}")

    except FileNotFoundError:
        print(f"Lỗi: File '{input_csv_file}' không tìm thấy.")
    except ValueError as ve:
        print(f"Lỗi định dạng tháng: {ve}. Đảm bảo định dạng là 'YYYY-MM' (ví dụ: '2014-07').")
    except Exception as e:
        print(f"Đã xảy ra lỗi: {e}")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Xử lý file CSV để trích xuất dữ liệu vi phạm theo ngày trong một phạm vi tháng cụ thể và lưu vào các thư mục YYYY-MM-DD.")
    parser.add_argument("input_file", help="Đường dẫn đến file CSV đầu vào.")
    parser.add_argument("start_month", help="Tháng bắt đầu (định dạng YYYY-MM, ví dụ: 2014-07).")
    parser.add_argument("end_month", help="Tháng kết thúc (định dạng YYYY-MM, ví dụ: 2017-11).")
    
    args = parser.parse_args()
    
    process_violations_by_date_scoped(args.input_file, args.start_month, args.end_month)
