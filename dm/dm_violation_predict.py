import pandas as pd
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

# 3. Trực quan hóa dữ liệu
sns.histplot(df['TotalViolations'], bins=20, kde=True)
plt.title('Phân phối số vi phạm giao thông')
plt.xlabel('TotalViolations')
plt.ylabel('Tần suất')
plt.tight_layout()
plt.savefig("violation_distribution.png")
plt.clf()

sns.boxplot(x="DayNameOfWeek", y="TotalViolations", data=df)
plt.title("Số vi phạm theo thứ trong tuần")
plt.xticks(rotation=45)
plt.tight_layout()
plt.savefig("violation_by_day.png")
plt.clf()

sns.scatterplot(x="AverageTemperature", y="TotalViolations", data=df)
plt.title("Nhiệt độ và số vi phạm")
plt.tight_layout()
plt.savefig("violation_vs_temp.png")
plt.clf()

# 4. Tiền xử lý và trích đặc trưng
df_model = df[['IsWeekend', 'WeatherComfortLevel', 'AverageTemperature', 'AverageWindSpeed', 'TotalViolations']].copy()
encoder = LabelEncoder()
df_model['WeatherComfortLevel'] = encoder.fit_transform(df_model['WeatherComfortLevel'])

# 5. Tạo tập train/test
X = df_model[['IsWeekend', 'WeatherComfortLevel', 'AverageTemperature', 'AverageWindSpeed']]
y = df_model['TotalViolations']
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# 6. Huấn luyện mô hình
model = LinearRegression()
model.fit(X_train, y_train)
y_pred = model.predict(X_test)
mse = mean_squared_error(y_test, y_pred)
print(f"MSE: {mse:.2f}")

# 7. Dự đoán cho cuối tuần, thời tiết dễ chịu (~20°C, nhẹ gió)
sample = pd.DataFrame([[1, encoder.transform(['Comfortable'])[0], 293, 3]],
                      columns=X.columns)
prediction = model.predict(sample)
print(f"Dự đoán số vi phạm (cuối tuần, thời tiết dễ chịu): {prediction[0]:.2f}")
