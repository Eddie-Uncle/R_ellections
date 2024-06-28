import numpy as np
import matplotlib.pyplot as plt
from rpy2 import robjects
from rpy2.robjects import pandas2ri
from rpy2.robjects.packages import importr
import pandas as pd

# Activate the automatic conversion of pandas objects to R objects
pandas2ri.activate()

# R packages
base = importr('base')
stats = importr('stats')

# Generate sample data
np.random.seed(0)
x = np.random.normal(size=100)
y = 2 * x + np.random.normal(size=100)

# Create a pandas DataFrame
data = pd.DataFrame({'x': x, 'y': y})

# Convert pandas DataFrame to R DataFrame
r_data = pandas2ri.py2rpy(data)

# Perform linear regression in R
formula = robjects.Formula('y ~ x')
model = stats.lm(formula, data=r_data)

# Print the summary of the linear model
print(base.summary(model))

# Extract fitted values and residuals
fitted_values = np.array(stats.fitted(model))
residuals = np.array(stats.residuals(model))

# Plot the results
plt.figure(figsize=(10, 5))

# Scatter plot of the data
plt.subplot(1, 2, 1)
plt.scatter(x, y, label='Data')
plt.plot(x, fitted_values, color='red', label='Fitted line')
plt.xlabel('x')
plt.ylabel('y')
plt.title('Linear Regression')
plt.legend()

# Residuals plot
plt.subplot(1, 2, 2)
plt.scatter(fitted_values, residuals)
plt.axhline(y=0, color='red', linestyle='--')
plt.xlabel('Fitted values')
plt.ylabel('Residuals')
plt.title('Residuals Plot')

plt.tight_layout()
plt.show()

