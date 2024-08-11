# EcoPixie - Economic Forecasting Shiny App

## Overview

EcoPixie is a Shiny application designed to provide an interactive platform for understanding and applying various economic forecasting models. This app is tailored for educational purposes, offering users the ability to explore forecasting techniques, perform regression analysis, and engage in hands-on exercises.

## Features

- **Introduction**: Overview of economic forecasting and its significance.
- **Types of Forecasting**: Detailed explanation of different forecasting techniques, including Qualitative Analysis, Trend Analysis, Exponential Smoothing, and Econometric Models.
- **Regression Analysis**: Tools for conducting both Simple and Multiple Regression Analysis, with options to use built-in or user-provided datasets.
- **Hands-on Exercises**: Practical exercises for forecasting models, including growth rate estimation, sales trend analysis, and cost forecasting.
- **Help Section**: Comprehensive guide to using the app, with explanations for each section and exercise.

## Installation

To run this app locally, follow these steps:

1. **Clone the repository:**

   ```bash
   git clone https://github.com/Okesha2000/EcoPixie.git
   ```

2.**Install the required R packages:**

  ```r
  install.packages(c("shiny", "ggplot2", "DT", "plotly", "shinydashboard"))
  ```

3.**Run the app:**

  ```r
  library(shiny)
  runApp("path/to/EcoPixie")
  ```

## Built-in Datasets

The app includes several built-in datasets for analysis:

- **AirPassengers**: Monthly totals of international airline passengers from 1949 to 1960.
- **nottem**: Average monthly temperatures at Nottingham from 1920 to 1939.
- **EuStockMarkets**: Daily closing prices of major European stock indices from 1991 to 1998.
- **And more...**

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request or open an Issue to suggest improvements or report bugs.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contact

For any inquiries or support, please contact:

- Email: [okeshakarunarathne@gmail.com](mailto:okeshakarunarathne@gmail.com)

