import pandas as pd
import matplotlib.pyplot as plt

# Load the sales summary CSV
df = pd.read_csv("data/sales_summary.csv")

# Sort by total revenue
df_sorted = df.sort_values(by="total_revenue", ascending=False)

# Plot top 10 products
top10 = df_sorted.head(10)
plt.figure(figsize=(10, 5))
plt.bar(top10["product_name"], top10["total_revenue"], color="seagreen")
plt.title("Top 10 Products by Revenue", fontsize=14)
plt.xlabel("Product", fontsize=12)
plt.ylabel("Total Revenue ($)", fontsize=12)
plt.xticks(rotation=45, ha='right')
plt.tight_layout()
plt.show()

