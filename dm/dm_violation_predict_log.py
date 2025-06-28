import pandas as pd
import numpy as np
import seaborn as sns
import matplotlib.pyplot as plt
from sklearn.preprocessing import LabelEncoder
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LinearRegression
from sklearn.metrics import mean_squared_error

# 1. Đọc dữ liệu
dim_date = pd.read_csv("DimDate.csv")
dim_weather = pd.read_csv("DimWeather.csv")
fact_violation = pd.read_csv("FactTrafficViolation.csv")

# 2. Gộp dữ liệu
df = fact_violation.merge(dim_date, on="DateKey", how="left")
df = df.merge(dim_weather, on="WeatherKey", how="left")

# 3. Tiền xử lý và đặc trưng
df_model = df[['IsWeekend', 'WeatherComfortLevel', 'AverageTemperature', 'AverageWindSpeed', 'TotalViolations']].copy()
encoder = LabelEncoder()
df_model['WeatherComfortLevel'] = encoder.fit_transform(df_model['WeatherComfortLevel'])

# Biến đổi log
df_model['LogViolations'] = np.log1p(df_model['TotalViolations'])

# In thử một vài dòng
print(df_model[['TotalViolations', 'LogViolations']].head(10))

# 4. Huấn luyện mô hình
X = df_model[['IsWeekend', 'WeatherComfortLevel', 'AverageTemperature', 'AverageWindSpeed']]
y = df_model['LogViolations']

X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

model = LinearRegression()
model.fit(X_train, y_train)
y_pred_log = model.predict(X_test)

mse_log = mean_squared_error(y_test, y_pred_log)
print(f"MSE (log scale): {mse_log:.4f}")

# 5. Dự đoán cho điều kiện cụ thể
sample = pd.DataFrame([[1, encoder.transform(['Comfortable'])[0], 293, 3]],
                      columns=X.columns)

predicted_log = model.predict(sample)
predicted_real = np.expm1(predicted_log)

print(f"Dự đoán số vi phạm (cuối tuần, thời tiết dễ chịu): {predicted_real[0]:.2f}")
