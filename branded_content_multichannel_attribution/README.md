# Multichannel Attribution Analysis Using Markov Models

## Project Overview
This project implements a Markov-based attribution model to evaluate the impact of different marketing channels on conversions. The analysis helps identify the contribution of each channel in a multichannel environment, enabling data-driven decisions to optimize marketing strategies.

## Repository Structure

```
branded_content_multichannel_attribution/
├── data/
│   ├── simulated_multichannel_data.csv   # Simulated dataset for analysis
│   └── processed_data.csv                # Processed dataset after exploratory analysis
├── notebooks/
│   ├── 1_exploratory_data_analysis.ipynb # Notebook for exploratory data analysis
│   └── 2_markov_attribution_model.ipynb  # Notebook for Markov attribution model
├── src/
│   ├── attribution_model.py              # Python code to implement Markov model
│   └── data_preprocessing.py             # Python code for data preprocessing
├── dashboards/
│   └── dashboard_screenshots.png         # Screenshots of the Tableau/Looker Studio dashboard
└── README.md                             # Project documentation
```

## Key Features

1. **Simulated Multichannel Dataset**:
   - Data includes web traffic (GA4), email opens, ad clicks, and survey responses.
2. **Exploratory Data Analysis**:
   - Univariate and bivariate analysis.
   - Visualization of conversion rates and survey scores across channels.
3. **Markov Attribution Model**:
   - Implements Markov Chains to calculate the contribution of each channel to conversions.
   - Provides channel attribution metrics and insights.
4. **Interactive Dashboard**:
   - Visualizes conversion metrics by channel and user impact analysis.
   - Compare impacted vs. non-impacted users.

## How to Use

### 1. Clone the Repository
```bash
git clone https://github.com/yourusername/branded_content_multichannel_attribution.git
cd branded_content_multichannel_attribution
```

### 2. Install Dependencies
Set up a virtual environment and install the required dependencies:
```bash
python -m venv env
source env/bin/activate  # On Windows: env\Scripts\activate
pip install -r requirements.txt
```

### 3. Run Exploratory Data Analysis
Execute the `1_exploratory_data_analysis.ipynb` notebook to:
- Preprocess the dataset.
- Visualize conversion rates and survey scores by channel.

### 4. Run Markov Attribution Model
Open and execute the `2_markov_attribution_model.ipynb` notebook to:
- Build the transition matrix using user journeys.
- Calculate channel contributions using Markov Chains.
- Perform lift analysis for impacted vs. non-impacted users.

### 5. Visualize Results
Use the Tableau/Looker Studio dashboard to visualize:
- Conversion metrics by channel.
- Channel contribution based on Markov attribution.

## Dataset Description
The simulated dataset contains the following columns:

| Column          | Description                                 |
|------------------|---------------------------------------------|
| `user_id`       | Unique identifier for users                 |
| `timestamp`     | Date and time of the event                 |
| `channel`       | Channel where the event occurred (e.g., social media, email) |
| `event_type`    | Type of event (e.g., click, conversion)     |
| `conversion`    | Conversion indicator (1: Yes, 0: No)       |
| `survey_score`  | Survey response score (1-10)               |


## Expected Outputs

### 1. **Conversion Metrics by Channel**
Visualizations showing conversion rates and survey scores across different channels.

### 2. **Channel Contributions**
Bar plots highlighting each channel's contribution to conversions based on the Markov model.

### 3. **Lift Analysis**
Comparison of conversion rates between users impacted by branded content and non-impacted users.

### 4. **Interactive Dashboard**
- Conversion performance by channel.
- Comparison of impacted vs. non-impacted user groups.

## Results and Insights

1. **Channel Attribution Results**
   - The Markov model provides a breakdown of how much each channel contributes to the overall conversion rate.

2. **Lift Analysis**
   - The analysis shows the difference in conversion rates between impacted and non-impacted users, quantifying the effectiveness of branded content.

3. **Interactive Dashboards**
   - Visualize the findings through interactive dashboards in Tableau or Looker Studio.

## Technologies Used

- **Languages and Libraries**:
  - Python: pandas, numpy, seaborn, matplotlib
  - PySpark: For large-scale data processing
  - Google Analytics 4 (GA4): Web traffic data
- **Visualization Tools**:
  - Tableau / Looker Studio: For dashboard creation
- **Modeling**:
  - Markov Chains: To calculate channel attribution

## Contributions
Feel free to contribute to this project by opening an issue or submitting a pull request. Suggestions and improvements are always welcome!

## License
This project is licensed under the MIT License. See the LICENSE file for more details.

---

Thank you for exploring this project! If you have any questions or suggestions, please reach out.