Large-Scale eCommerce Behavior Analytics



Overview

This project analyzes large-scale user behavior data from a multi-category eCommerce platform to uncover actionable insights related to customer conversion, product segmentation, and sales forecasting. The dataset contains over 67.5 million user events, including product views, cart additions, and purchases.



The project was executed in two phases:

Phase I : Local exploratory analysis using Pandas on a sampled dataset

Phase II : Distributed data processing and machine learning using \*\*PySpark\*\*



---



Dataset

\- Source: Multi-category eCommerce event logs (October 2019)

\- Size: \*\*67,501,979 events\*\*

\- Features:

&nbsp; - event\_time, event\_type

&nbsp; - product\_id, category\_id, category\_code

&nbsp; - brand, price

&nbsp; - user\_id, user\_session



---



Data Engineering \& Cleaning

\- Chunk-based ingestion (500k rows at a time) to avoid memory overflow

\- Removed invalid records (null IDs, negative prices)

\- Timestamp normalization and schema enforcement

\- Category optimization using Pandas categorical dtype

\- Scaled to PySpark for distributed processing without data loss



\*\*Result:\*\* Cleaned and validated dataset retaining ~100% usable records at scale.



---



Exploratory Data Analysis (EDA)

Key behavioral insights:

\- Strong funnel drop-off: views ≫ cart ≫ purchases

\- Right-skewed price distribution with dominance of low-cost items

\- Peak user activity during mid-day and evening hours

\- Distinct category-level conversion efficiencies

\- Highly active user sessions driving disproportionate engagement



EDA was validated at scale using PySpark aggregations.



---



Machine Learning Objectives



User Conversion Prediction (Classification)

\*\*Goal:\*\* Predict whether a user session will result in a purchase.



Features Engineered (Session-Level):

\- Total events \& views

\- Unique products \& categories

\- Average price

\- Unique brands



Models Used:

\- Logistic Regression

\- Random Forest

\- Gradient Boosted Trees



Best Performance (PySpark):

| Model | Accuracy | F1-Score |

|------|----------|----------|

| Random Forest | \*\*0.9858\*\* | \*\*0.9770\*\* |

| Logistic Regression | 0.9780 | 0.9792 |

| Gradient Boosted Trees | 0.9770 | 0.9787 |



ROC-AUC ≈ \*\*0.98\*\* across models.



2️⃣ Product Category Clustering (Unsupervised Learning)

\*\*Goal:\*\* Group product categories based on user interaction patterns.



Features:

\- Views, purchases, total events

\- Average price

\- Unique users



Model:

\- K-Means (k = 5)



\*\*Evaluation:\*\*

\- \*\*Silhouette Score: 0.8454\*\*, indicating strong cluster separation



\*\*Impact:\*\* Enables category segmentation for marketing, recommendations, and inventory planning.



---



&nbsp;3️⃣ Sales Forecasting (Regression)

\*\*Goal:\*\* Predict daily purchase volume using historical trends.



Models Used:

\- Linear Regression

\- Random Forest Regression



\*\*Performance:\*\*

| Model | RMSE | MAE |

|------|------|-----|

| Random Forest | \*\*663.74\*\* | \*\*296.58\*\* |

| Linear Regression | 695.41 | 311.49 |



Random Forest captured nonlinear demand fluctuations more effectively.



---



Tech Stack

\- \*\*Languages:\*\* Python

\- \*\*Big Data:\*\* PySpark, Spark SQL

\- \*\*ML:\*\* Spark MLlib, Scikit-learn

\- \*\*Data Processing:\*\* Pandas, NumPy

\- \*\*Visualization:\*\* Matplotlib, Seaborn

\- \*\*Environment:\*\* Jupyter Notebook



---



How to Run

1\. Clone the repository

2\. Install dependencies

3\. Run notebooks in order:

&nbsp;  - `eda.ipynb`

&nbsp;  - `phase2\_modeling.ipynb`

4\. Ensure Spark is properly configured for large-scale execution



---



Key Learnings

\- Session-level behavioral features are strong predictors of purchase intent

\- Distributed ML pipelines are essential for real-world scale datasets

\- Ensemble models outperform linear baselines in both classification and forecasting

\- Category-level aggregation reveals meaningful latent structure in user behavior



---



Future Improvements

\- Add SHAP/LIME for model interpretability

\- Incorporate sequence models (LSTM/GRU) for session behavior

\- Use textual embeddings from product descriptions for richer clustering

\- Deploy models as batch or streaming pipelines



---



Authors

\- Harsha Venkateshwara  

\- Saba Minaz Taj  

\- Sphoorthy Selvaraj



