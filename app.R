library(shiny)
library(ggplot2)
library(DT)
library(plotly)
library(shinydashboard)

# Define UI
ui <- dashboardPage(
  dashboardHeader(title = "EcoPixie"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Introduction", tabName = "intro", icon = icon("info-circle")),
      menuItem("Types of Forecasting", tabName = "types", icon = icon("list-alt"), 
               menuSubItem("Qualitative Analysis", tabName = "qualitative"),
               menuSubItem("Trend Analysis", tabName = "trend"),
               menuSubItem("Exponential Smoothing", tabName = "exponential"),
               menuSubItem("Econometric Models", tabName = "econometric")),
      menuItem("Special Understanding", tabName = "economic_forecasting", icon = icon("layer-group")),
      menuItem("Judging Forecast Reliability", tabName = "reliability", icon = icon("check-circle")),
      menuItem("Choosing the Best Technique", tabName = "choosing", icon = icon("cogs")),
      menuItem("Regression", tabName = "regression", icon = icon("chart-line"),
               menuSubItem("Simple Regression Analysis", tabName = "gdp_analysis"),
               menuSubItem("Multiple Regression Analysis", tabName = "multiple_regression")),
      menuItem("Exercises", tabName = "exercises", icon = icon("tasks"),
               menuSubItem("Constant Growth Model", tabName = "constant_growth"),
               menuSubItem("Growth Rate Estimation", tabName = "growth_rate"),
               menuSubItem("Sales Trend Analysis", tabName = "sales_trend"),
               menuSubItem("Cost Forecasting", tabName = "cost_forecasting"),
               menuSubItem("Unit Sales Forecast Modeling", tabName = "unit_sales_forecast"),
               menuSubItem("Sales Forecast Modeling", tabName = "sales_forecast_modeling"),
               menuSubItem("Cost Forecast Modeling", tabName = "cost_forecast_modeling"),
               menuSubItem("Sales Forecast Modeling (Toys Unlimited)", tabName = "sales_forecast_toys"),
               menuSubItem("Simultaneous Equations", tabName = "simultaneous_equations")
      ),
      menuItem("Help", tabName = "help", icon = icon("question-circle"))
    )
  ),
  dashboardBody(
    tags$head(
      tags$style(HTML("
        .skin-blue .main-header .navbar {
          background-color: 	#660000; /* Change this color to your desired header color */
        }
         .skin-blue .main-header .logo {
          background-color:  #660000; /* Change this color to your desired header color */
         }
        .content-wrapper, .right-side {
        background-color: #fff2f2 !important; /* Change this color to your desired body color */
        }
      h1, h2, h3 {
          font-size: 2em; /* Change this size to your desired header sizes */
      }
     h4 {
          font-size: 1.7em; /* Change this size to your desired header sizes */
        }
        p {
          font-size: 1.2em; /* Change this size to your desired header sizes */
        }
        .box {
          font-size: 18px; /* Change this size to your desired box content font size */
        }
      "))
    ),
    
    tabItems(
      tabItem(tabName = "intro",
              fluidPage(
                h2("INTRODUCTION TO FORECASTING"),
                p("Forecasting is an essential tool in economics and business, used to predict future trends based on past data. In this app, you'll learn about various forecasting techniques and their applications."),
                h3("WHAT IS ECONOMIC FORECASTING?"),
                p("Economic forecasting involves predicting future economic conditions based on the analysis of historical data and economic indicators. This can include forecasting GDP growth, inflation rates, unemployment, and other macroeconomic variables."),
                h3("WHY FORECASTING IS USEFUL?"),
                p("Forecasting is useful because it helps businesses, governments, and individuals make informed decisions about the future. By anticipating future economic conditions, they can plan and allocate resources more effectively."),
                h3("COMMON TYPES OF FORECASTING PROBLEMS"),
                h4("Macroeconomic Forecast Problems"),
                tags$ul(
                  tags$li("Scope: Predicts aggregate measures of economic activity at international, national, regional, or state levels."),
                  tags$li("Focus: Includes GDP, unemployment, interest rates, consumer spending, business investment, homebuilding, exports, imports, and government spending."),
                  tags$li("Influence: Predictions by 'blue chip' business economists capture the attention of media, businesses, government, and the general public daily."),
                  tags$li("Day-to-Day Decisions: Businesses and individuals use forecasts for operating and long-term planning."),
                  tags$ul(
                    tags$li("Example: Projected interest rate rises may lead homeowners to refinance mortgages and businesses to issue new bonds.")
                  ),
                  tags$li("Accuracy and Consequences:"),
                  tags$ul(
                    tags$li("Accurate Predictions: Enable significant cost savings or revenue gains."),
                    tags$li("Inaccurate Predictions: Result in higher costs and lost marketing opportunities.")
                  ),
                  tags$li("Factors Influencing Forecast Accuracy:"),
                  tags$ul(
                    tags$li("Controllable and Uncontrollable Factors: Major influence in macroeconomic forecasting.")
                  ),
                  tags$li("Example: Interest Rate Forecasting"),
                  tags$ul(
                    tags$li("Demand for Credit:"),
                    tags$ul(
                      tags$li("Rises with business expansions or consumer credit increases."),
                      tags$li("Results in higher short-term interest rates.")
                    ),
                    tags$li("Supply of Credit:"),
                    tags$ul(
                      tags$li("Increases with Federal Reserve actions to boost the money supply or consumer savings."),
                      tags$li("Results in lower short-term interest rates.")
                    )
                  ),
                  tags$li("Challenges in Interest Rate Forecasting:"),
                  tags$ul(
                    tags$li("Interrelated Factors: Business decisions, such as building inventories, depend on overall economic activity and interest-rate expectations."),
                    tags$li("Unstable Environment: Economic conditions are interconnected in unpredictable ways.")
                  ),
                  tags$li("Policy Decision Uncertainty:"),
                  tags$ul(
                    tags$li("Federal Reserve Policy: Decisions are confidential and disclosed months later."),
                    tags$li("'Fed watching' is a common practice among business economists to anticipate policy impacts.")
                  ),
                  img(src = "im4.jpg", alt = "Business Cycle Image", style = "width:100%; height:auto;"),
                ),
                
                h4("Microeconomic Forecast Problems"),
                tags$ul(
                  tags$li("Scope: Microeconomic forecasting involves the prediction of disaggregate economic data at the industry, firm, plant, or product level."),
                  tags$li("Public Attention: Unlike macroeconomic forecasts, microeconomic forecasts often go unnoticed by the general public."),
                  tags$li("Examples:"),
                  tags$ul(
                    tags$li("Scrap prices for aluminum"),
                    tags$li("Demand for new cars"),
                    tags$li("Production costs for Crest toothpaste")
                  ),
                  tags$li("Relationship Example: Used car prices and new car demand are closely related due to their strong substitute good relationship."),
                  tags$li("Forecasting Accuracy:"),
                  tags$ul(
                    tags$li("Trained and experienced analysts often find it easier to accurately forecast microeconomic trends compared to macroeconomic trends."),
                    tags$li("Microeconomic forecasts abstract from the multitude of interrelationships that determine the macroeconomy.")
                  ),
                  tags$li("Specialized Knowledge:"),
                  tags$ul(
                    tags$li("New car prices"),
                    tags$li("Car import tariffs"),
                    tags$li("Car loan rates"),
                    tags$li("Used car prices")
                  ),
                  tags$li("Challenges:"),
                  tags$ul(
                    tags$li("Despite being more straightforward, precise microeconomic forecasting is still challenging."),
                    tags$li("Example: In August 1999, forecasts for new car and light truck sales for the 2000 model year were too conservative, predicting 15.7 million units, while the actual sales were 17.2 million units."),
                    tags$li("Post-9/11 Forecasting: Forecasts for 2001 and 2002 sales were disrupted by the September 11, 2001, terrorist attacks, showing the unpredictability in forecasting even for experts.")
                  )
                ),
                
                h4("Problem of Changing Expectations"),
                tags$ul(
                  tags$li("Scope: Changing expectations affect both macroeconomic and microeconomic forecasting."),
                  tags$li("Self-Fulfilling Prophecy:"),
                  tags$ul(
                    tags$li("Optimistic expectations lead to inventory buildup, contributing to economic growth."),
                    tags$li("Pessimistic expectations lead to cutbacks in orders and inventory, contributing to economic downturn.")
                  ),
                  tags$li("Macroeconomic Environment: The sum of investment and spending decisions by businesses, government, and the public."),
                  tags$li("Potential Bias:"),
                  tags$ul(
                    tags$li("Expectations can create an optimistic bias in government-reported statistics."),
                    tags$li("Government economists may be criticized for overly optimistic forecasts.")
                  ),
                  tags$li("Impact on Decision-Making:"),
                  tags$ul(
                    tags$li("Government or politically motivated economists may seek to manage economic expectations to influence business leader decisions."),
                    tags$li("Business leaders' decisions based on optimistic forecasts can help create economic growth.")
                  ),
                  tags$li("Importance for Managers:"),
                  tags$ul(
                    tags$li("Managers must appreciate the link between economic expectations and realizations."),
                    tags$li("Be wary of potential forecast bias in economic statistics.")
                  )
                ),
                
                h4("Data Quality Problems"),
                tags$ul(
                  tags$li("Data Quality: Accurate forecasts require current, complete, and error-free data."),
                  tags$li("Importance of Input Data:"),
                  tags$ul(
                    tags$li("Inputting incoming orders is often better than shipments due to potential production delays."),
                    tags$li("Order fulfillment timing can be affected by transit delays beyond the control of the shipping firm.")
                  ),
                  tags$li("Quantity of Data:"),
                  tags$ul(
                    tags$li("More data generally leads to better forecasts."),
                    tags$li("Advanced forecasting software can function with as few as five data points, but such forecasts are often simplistic."),
                    tags$li("Collecting large samples of data can be expensive and tedious, but it improves forecast accuracy.")
                  ),
                  tags$li("Seasonal Data:"),
                  tags$ul(
                    tags$li("Extended time series data are important for accurate seasonal forecasts."),
                    tags$li("Most forecasting software requires a minimum of 2 years of monthly data (24 observations) for seasonally adjusted forecasts."),
                    tags$li("Typically, 5 years of monthly data (60 observations) are necessary for high accuracy.")
                  ),
                  tags$li("Periodic Data: Forecast software can work with data of any periodicity (hourly, daily, weekly, monthly, or annual)."),
                  tags$li("Ultimate Consideration: The quantity and quality of data must be sufficient to generate useful forecasts."),
                  tags$li("Government Data Issues:"),
                  tags$ul(
                    tags$li("Government-supplied data are often tardy and inaccurate."),
                    tags$li("GDP estimates are revised multiple times, causing uncertainty and forecast errors."),
                    tags$li("Extreme variation in official estimates of key economic statistics is a primary cause of forecast error among business economists.")
                  ),
                  tags$li("Imperfect Nature of Forecasts:"),
                  tags$ul(
                    tags$li("Forecasts are never perfect and rely heavily on historical data and relationships."),
                    tags$li("Future events are seldom accounted for in popular forecasting techniques."),
                    tags$li("Managers must combine traditional forecast methods with personal insight and knowledge of future events to create the most useful forecasts.")
                  )
                )
                
              )),
      tabItem(tabName = "qualitative",
              fluidPage(
                h2("Qualitative Analysis"),
                p("Qualitative analysis is an intuitive, judgmental approach to forecasting that relies heavily on expert judgment and opinion to predict future events. Several methods fall under qualitative analysis:"),
                p(
                  tags$b("Personal Insight:"),
                  " In this method, an informed individual uses personal or organizational experience as a basis for developing future expectations. Although subjective, reasoned judgment from informed individuals often provides valuable insights."
                ),
                p(
                  tags$b("Panel Consensus:"),
                  " This method involves the informed opinion of several individuals. Direct interaction among experts ensures that the resulting forecasts embody all available objective and subjective information. However, it can be influenced by the forceful personality of one or a few key individuals."
                ),
                p(
                  tags$b("Delphi Method:"),
                  " Designed to counter the disadvantages of the panel consensus method, the Delphi method involves a series of questions sent individually to experts. Responses are analyzed by an independent party to elicit a consensus opinion without direct interaction among the experts."
                ),
                p(
                  tags$b("Survey Techniques:"),
                  " Surveys use interviews or mailed questionnaires to gather information from firms, government agencies, and individuals about their future plans. Properly designed surveys can capture non-quantifiable psychological elements inherent in economic behavior and help identify changing consumer tastes, which quantitative models might miss. Surveys can be particularly useful for short-term projections."
                )
              )),
      tabItem(tabName = "trend",
              tabsetPanel(
                tabPanel("Overview",
                         fluidPage(
                           h2("Trend Analysis"),
                           p("Trend analysis involves examining historical data to identify patterns or trends that can be projected into the future. Key components of trend analysis include:"),
                           p(
                             tags$b("Secular Trend:"),
                             " Long-run pattern of increase or decrease in data."
                           ),
                           p(
                             tags$b("Cyclical Fluctuation:"),
                             " Rhythmic variation in data due to economic expansions or contractions."
                           ),
                           p(
                             tags$b("Seasonal Variation:"),
                             " Annual patterns in data caused by factors like weather or social customs."
                           ),
                           p(
                             tags$b("Irregular Influences:"),
                             " Unpredictable shocks to the economic system like wars or natural catastrophes."
                           ),
                           fileInput("fileOverview", "Upload CSV File for Overview",
                                     accept = c("text/csv", "text/comma-separated-values,text/plain", ".csv")),
                           checkboxInput("headerOverview", "Header", TRUE),
                           radioButtons("sepOverview", "Separator",
                                        choices = c(Comma = ",", Semicolon = ";", Tab = "\t"),
                                        selected = ","),
                           numericInput("freqInput", "Enter the frequency of the data (e.g., 12 for monthly):", value = 12),
                           selectInput("builtinOverview", "Or Select a Built-in Dataset",
                                       choices = c("None", "AirPassengers (Monthly)", "nottem (Monthly)",
                                                   "EuStockMarkets (Daily)", "WWWusage (Daily)", "BJsales (Daily)",
                                                   "UKgas (Quarterly)", "lynx (Yearly)", "UKLungDeaths (Yearly)",
                                                   "DNase (Yearly)", "sunspot.year (Yearly)", "precip (Yearly)")),
                           uiOutput("columnsOverview"),
                           actionButton("plotOverview", "Plot Overview Data"),
                           plotlyOutput("overviewTrendPlot")
                           
                         )
                ),
                tabPanel("Linear Trend Analysis",
                         fluidPage(
                           h3("Linear Trend Analysis"),
                           p("Linear trend analysis assumes a constant period-by-period unit change in an important economic variable over time. The linear relation between firm sales and time can be written as:"),
                           p(tags$code("St = a + b * t")),
                           p("The coefficients of this equation can be estimated using the least squares regression method."),
                           fileInput("file2", "Upload CSV File for Linear Trend Analysis",
                                     accept = c("text/csv", "text/comma-separated-values,text/plain", ".csv")),
                           checkboxInput("header2", "Header", TRUE),
                           radioButtons("sep2", "Separator",
                                        choices = c(Comma = ",", Semicolon = ";", Tab = "\t"),
                                        selected = ","),
                           numericInput("freqInput", "Enter the frequency of the data (e.g., 12 for monthly):", value = 12),
                           selectInput("builtin", "Or Select a Built-in Dataset",
                                       choices = c("None", "AirPassengers (Monthly)", "nottem (Monthly)",
                                                   "EuStockMarkets (Daily)", "WWWusage (Daily)", "BJsales (Daily)",
                                                   "UKgas (Quarterly)", "lynx (Yearly)", "UKLungDeaths (Yearly)",
                                                   "DNase (Yearly)", "sunspot.year (Yearly)", "precip (Yearly)")),
                           uiOutput("columns2"),
                           actionButton("plotLinearTrend", "Plot Linear Trend Data"),
                           plotlyOutput("linearTrendPlot"),
                           verbatimTextOutput("linearRegressionSummary")
                         )
                ),
                tabPanel("Growth Trend Analysis",
                         fluidPage(
                           h3("Growth Trend Analysis"),
                           p("Growth trend analysis assumes a constant period-by-period percentage change in an important economic variable over time."),
                           
                           h4("Constant Growth Model with Annual Compounding"),
                           p("The constant growth model with annual compounding assumes that an economic variable, such as sales, grows at a constant rate g annually. The model can be expressed as:"),
                           p(tags$code("St = S0 * (1 + g)^t")),
                           p("Where:"),
                           p(tags$ul(
                             tags$li("St is the value of the variable at time t"),
                             tags$li("S0 is the initial value of the variable"),
                             tags$li("g is the annual growth rate"),
                             tags$li("t is the time period")
                           )),
                           p("To estimate the constant annual rate of growth, the logarithmic transformation of the historical data is used:"),
                           p(tags$code("log(St) = log(S0) + log(1 + g) * t")),
                           
                           h4("Constant Growth Model with Continuous Compounding"),
                           p("The constant growth model with continuous compounding assumes that the economic variable grows continuously at a constant rate g. The model is expressed by the exponential equation:"),
                           p(tags$code("Yt = Y0 * e^(gt)")),
                           p("Where:"),
                           p(tags$ul(
                             tags$li("Yt is the value of the variable at time t"),
                             tags$li("Y0 is the initial value of the variable"),
                             tags$li("g is the continuous growth rate"),
                             tags$li("t is the time period")
                           )),
                           p("Taking the natural logarithm (to the base e) of the continuous compounding equation gives:"),
                           p(tags$code("ln(Yt) = ln(Y0) + g * t")),

                           fileInput("file3", "Upload CSV File for Growth Trend Analysis",
                                     accept = c("text/csv", "text/comma-separated-values,text/plain", ".csv")),
                           checkboxInput("header3", "Header", TRUE),
                           radioButtons("sep3", "Separator",
                                        choices = c(Comma = ",", Semicolon = ";", Tab = "\t"),
                                        selected = ","),
                           uiOutput("columns3"),
                           selectInput("modelType", "Select Growth Model Type", choices = c("Annual Compounding", "Continuous Compounding")),
                           numericInput("freqInput", "Enter the frequency of the data (e.g., 12 for monthly):", value = 12),
                           actionButton("plotGrowthTrend", "Plot Growth Trend Data"),
                           plotlyOutput("growthTrendPlot"),
                           verbatimTextOutput("growthRegressionSummary")
                         )
                ),
                tabPanel("Linear and Growth Trend Comparison",
                         fluidPage(
                           h3("Projection Differences:"),
                           h4("Linear Trend Model:"),
                           p(tags$ul(
                             tags$li("Sales projection for 2005: $24.5 billion"),
                             tags$li("Sales projection for 2010: $31.6 billion")
                           )),
                           
                           h4("Growth Trend Model:"),
                           p(tags$ul(
                             tags$li("Sales projection for 2005: $158.1 billion"),
                             tags$li("Sales projection for 2010: $850.0 billion")
                           )),
                           
                           h3("Accuracy:"),
                           h4("Linear Trend Model:"),
                           p(tags$ul(
                             tags$li("Less accurate for long-term forecasts"),
                             tags$li("Assumes constant unit change over time")
                           )),
                           h4("Growth Trend Model:"),
                           p(tags$ul(
                             tags$li("More accurate for non-linear growth trends"),
                             tags$li("Assumes constant percentage change over time")
                           )),
                           
                           h3("Conclusion"),
                           p("The choice between linear and growth trend models depends on:"),
                           p(tags$ul(
                             tags$li("The specific economic variable being analyzed"),
                             tags$li("The nature of its historical changes")
                           )),
                           p("Understanding the structural form of the trend is crucial for making accurate long-term forecasts.")
                         )
                )
              )
      ),
      tabItem(tabName = "economic_forecasting",
              tabsetPanel(
                tabPanel("Business Cycle",
                         fluidPage(
                           h2("Business Cycle"),
                           p("The business cycle refers to the natural rise and fall of economic growth that occurs over time. It includes periods of economic expansion (growth) and contraction (decline)."),
                           h3("Phases of the Business Cycle:"),
                           p(tags$ul(
                             tags$li(tags$b("Expansion:"), " A period where the economy grows, marked by increased production, employment, and consumer spending."),
                             tags$li(tags$b("Peak:"), " The highest point of economic activity before a decline begins."),
                             tags$li(tags$b("Contraction:"), " A period of economic decline characterized by reduced production, employment, and spending."),
                             tags$li(tags$b("Trough:"), " The lowest point of economic activity before recovery begins.")
                           )),
                           h3("Importance:"),
                           p("Understanding the business cycle helps managers and policymakers make informed decisions about investments, hiring, and policy changes."),
                           img(src = "im1.webp", alt = "Business Cycle Image", style = "width:100%; height:auto;"),
                         )
                ),
                tabPanel("Economic Indicators",
                         fluidPage(
                         h2("Economic Indicators"),
                         p("Economic indicators are statistics that provide information about the overall health of the economy. They help forecast future economic activity."),
                         h3("Types of Economic Indicators:"),
                         p(tags$ul(
                           tags$li(tags$b("Leading Indicators:"), " Predict future economic activity (e.g., stock market returns, building permits)."),
                           tags$li(tags$b("Coincident Indicators:"), " Show the current state of the economy (e.g., employment rates, GDP)."),
                           tags$li(tags$b("Lagging Indicators:"), " Confirm trends that are already happening (e.g., unemployment rate, consumer price index).")
                         )),
                         h3("Usage:"),
                         p("Economists and businesses use these indicators to make predictions about economic trends and to make decisions about investments and policies."),
                        img(src = "im2.webp", alt = "Business Cycle Image", style = "width:100%; height:auto;")
                         )
                ),
                tabPanel("Economic Recessions",
                         fluidPage(
                           h2("Economic Recessions"),
                           p("An economic recession is a significant decline in economic activity that lasts for an extended period, usually visible in GDP, real income, employment, industrial production, and wholesale-retail sales."),
                           h3("Causes of Recessions:"),
                           p(tags$ul(
                             tags$li("High-interest rates"),
                             tags$li("Reduced consumer confidence"),
                             tags$li("Reduced spending"),
                             tags$li("Global events like oil price shocks or pandemics")
                           )),
                           h3("Characteristics of Recessions:"),
                           p(tags$ul(
                             tags$li(tags$b("Decreased Economic Activity:"), " Lower production and sales."),
                             tags$li(tags$b("Increased Unemployment:"), " Higher job losses as companies cut costs."),
                             tags$li(tags$b("Reduced Consumer Spending:"), " People tend to save more and spend less due to uncertainty.")
                           )),
                           h3("Impact of Recessions:"),
                           p("Recessions can lead to business closures, loss of income, and increased government debt as they implement measures to stimulate the economy."),
                           img(src = "im3.webp", alt = "Business Cycle Image", style = "width:100%; height:auto;"),
                         )
                ),
                tabPanel("Common Sources of Forecast Information",
                         fluidPage(
                           h2("Common Sources of Forecast Information"),
                           p("Reliable sources provide data and forecasts about economic trends, helping businesses, investors, and policymakers make informed decisions."),
                           h3("Sources of Forecast Information:"),
                           p(tags$ul(
                             tags$li(tags$b("Government Agencies:"), " Provide official data on economic performance (e.g., Bureau of Economic Analysis for GDP data)."),
                             tags$li(tags$b("Private Research Groups:"), " Offer insights and detailed analyses (e.g., The Conference Board)."),
                             tags$li(tags$b("Academic Institutions:"), " Conduct research and publish findings on various economic trends (e.g., National Bureau of Economic Research)."),
                             tags$li(tags$b("Financial Publications:"), " Offer regular updates and expert analyses (e.g., The Wall Street Journal, Barron's).")
                           )),
                           h3("Usage:"),
                           p("These sources help businesses, investors, and policymakers make informed decisions by providing reliable data and forecasts about economic trends.")
                         )
                )
              )
      ),
      
      tabItem(tabName = "exponential",
              fluidPage(
                h2("Exponential Smoothing"),
                p("Exponential smoothing uses weighted averages of past observations to forecast future values. There are different types of exponential smoothing:"),
                p(
                  tags$b("Simple Exponential Smoothing:"),
                  " Suitable for data without trends or seasonal patterns. It assigns exponentially decreasing weights to past observations."
                ),
                p(
                  tags$b("Holt's Two-Parameter Exponential Smoothing:"),
                  " This method accounts for data with trends by including a trend component in addition to the level component."
                ),
                p(
                  tags$b("Winters' Three-Parameter Exponential Smoothing:"),
                  " This method is used for data with both trend and seasonal variations. It includes smoothing parameters for level, trend, and seasonality."
                )
              )),
      tabItem(tabName = "econometric",
              fluidPage(
                h2("Econometric Models"),
                p("Econometric models use economic theory and statistical techniques to forecast economic relationships. They can be divided into:"),
                p(
                  tags$b("Single-Equation Models:"),
                  tags$ul(
                    tags$li("Suitable for many managerial forecasting problems."),
                    tags$li("Development steps:"),
                    tags$ul(
                      tags$li("Express relevant economic relations in an equation."),
                      tags$li("Example: Forecast regional demand for portable personal computers using:"),
                      tags$li(tags$code("C = a0 + a1P + a2I + a3Pop + a4i + a5A")),
                      tags$li("Where C is computer demand, P is price, I is disposable income, Pop is population, i is interest rates, and A is advertising expenditures."),
                      tags$li("Estimate parameters using techniques like least squares regression analysis."),
                      tags$li("Forecast by evaluating the equation with specific values for the independent variables.")
                    )
                  )
                ),
                p(
                  tags$b("Multiple-Equation Systems:"),
                  tags$ul(
                    tags$li("Used for complex relations among economic variables."),
                    tags$li("Variables:"),
                    tags$ul(
                      tags$li("Endogenous Variables: Determined within the model."),
                      tags$li("Exogenous Variables: Determined outside the system.")
                    ),
                    tags$li("Composed of:"),
                    tags$ul(
                      tags$li("Identities: Relations that are true by definition."),
                      tags$li("Behavioral Equations: Hypotheses about how variables interact.")
                    ),
                    tags$li("Example: Three-equation forecast model for a personal computer retailer:"),
                    tags$ul(
                      tags$li(tags$code("St = b0 + b1TRt + u1")),
                      tags$li("Where St is software sales."),
                      tags$li(tags$code("Pt = c0 + c1Ct-1 + u2")),
                      tags$li("Where Pt is peripheral sales."),
                      tags$li(tags$code("TRt = St + Pt + Ct")),
                      tags$li("Where TRt is total revenue and Ct is personal computer sales."),
                      tags$li("These models can be more accurate as they account for the simultaneous relations among multiple variables.")
                    )
                  )
                )
              )),
      tabItem(tabName = "reliability",
              tabsetPanel(
                tabPanel("Tests of Predictive Capability",
                         fluidPage(
                           h2("Tests of Predictive Capability"),
                           p("To test predictive capability:"),
                           tags$ul(
                             tags$li("Use a forecast model generated over one sample or period to forecast data for another sample or period."),
                             tags$li("Test group and forecast group method:"),
                             tags$ul(
                               tags$li("Divide available data into two subsamples: test group and forecast group."),
                               tags$li("Estimate a forecasting model using data from the test group."),
                               tags$li("Use the model to forecast the data in the forecast group."),
                               tags$li("Compare forecast and actual values to test the stability of the model.")
                             )
                           )
                         )
                ),
                tabPanel("Correlation Analysis",
                         fluidPage(
                           h2("Correlation Analysis"),
                           p("Analyze the correlation between forecast and actual values."),
                           tags$ul(
                             tags$li("Correlation coefficient formula:"),
                             tags$code("r = (cov(f, x)) / (sigma_f * sigma_x)"),
                             tags$ul(
                               tags$li("r: Correlation coefficient"),
                               tags$li("cov(f, x): Covariance between forecast and actual series"),
                               tags$li("sigma_f: Standard deviation of the forecast series"),
                               tags$li("sigma_x: Standard deviation of the actual series")
                             ),
                             tags$li("Desired correlation values:"),
                             tags$ul(
                               tags$li("Correlations > 0.99 (99%) are highly desirable."),
                               tags$li("Correlations of 90% or 95% may be satisfactory for difficult forecasting problems."),
                               tags$li("Higher precision needed for critical decisions (99.5% or 99.75%).")
                             )
                           )
                         )
                ),
                tabPanel("Sample Mean Forecast Error Analysis",
                         fluidPage(
                           h2("Sample Mean Forecast Error Analysis"),
                           p("Provides an estimate of the average forecast error."),
                           tags$ul(
                             tags$li("Calculation formula:"),
                             tags$code("U = sqrt((1/n) * sum((fi - xi)^2))"),
                             tags$ul(
                               tags$li("n: Number of sample observations"),
                               tags$li("fi: Forecast value"),
                               tags$li("xi: Corresponding actual value")
                             ),
                             tags$li("Smaller sample mean forecast error indicates greater accuracy.")
                           )
                         )
                )
              )),
      tabItem(tabName = "choosing",
              tabsetPanel(
                tabPanel("Data Requirements",
                         fluidPage(
                           h2("Data Requirements"),
                           p("The choice of an appropriate forecast technique often hinges on the amount of relevant historical data that is readily available and any obvious patterns in that data."),
                           tags$ul(
                             tags$li("For many important forecast problems, 10 years of monthly data (120 observations) are available and appropriate for forecasting future activity."),
                             tags$li("If only more restricted samples of data are available for analysis, then simpler forecast methods must be used."),
                             tags$li("If trend, cyclical, seasonal, or irregular patterns can be recognized, then forecast techniques that are capable of handling those patterns can be readily selected."),
                             tags$li("For example, if the data are relatively stable, a simple exponential smoothing approach may be adequate."),
                             tags$li("Other exponential smoothing models are appropriate for trending and seasonal data; the same model will not be applicable in all cases."),
                             tags$li("As the forecast horizon increases, the cyclical pattern of economic data may also become significant."),
                             tags$li("In these cases, the need to relate the forecast variable to economic, market, and competitive factors increases, because simple trend projections may no longer be appropriate.")
                           )
                         )),
                tabPanel("Time Horizon Considerations",
                         fluidPage(
                           h2("Time Horizon Considerations"),
                           p("Experience shows that sophisticated time-series models can provide accurate short-term forecasts."),
                           tags$ul(
                             tags$li("In the short term, the momentum of existing consumer behavior often resists dramatic change."),
                             tags$li("Over a 5-year period, however, customers can find new suppliers, and needs may change."),
                             tags$li("For long-range forecasts, econometric models are often appropriate."),
                             tags$li("In the long term, it is essential to relate the item being forecast to its 'drivers,' as explanatory factors are sometimes called.")
                           ),
                           p("The accuracy of econometric models depends on the precision with which explanatory factors can be predicted."),
                           tags$ul(
                             tags$li("Although these models can also be used in the short term, they are costlier and more complex than simple exponential smoothing methods."),
                             tags$li("When economic conditions are stable, econometric models are seldom more accurate than more simple trend projections and exponential smoothing methods.")
                           )
                         )),
                tabPanel("Computer and Related Costs",
                         fluidPage(
                           h2("Computer and Related Costs"),
                           p("Computer costs are rapidly becoming an insignificant part of the forecast technique selection process."),
                           tags$ul(
                             tags$li("The proliferation of inexpensive and user-friendly forecast software has also lessened the need for sophisticated support staff."),
                             tags$li("Still, other costs associated with forecast development and implementation cannot be ignored."),
                             tags$li("Some major cost considerations often include data processing and storage costs, database maintenance and retrieval charges, and special hardware needs."),
                             tags$li("Start-up costs to develop forecasts for new products and services, analysis, and modeling work tend to escalate over time, especially when the experience level of the forecasting staff is low."),
                             tags$li("The maintenance of a complex forecasting system, on the other hand, can be relatively inexpensive if programming documentation and standards are kept current.")
                           )
                         )),
                tabPanel("Role of Judgment",
                         fluidPage(
                           h2("Role of Judgment"),
                           p("The most sophisticated forecast methodology provides sufficiently accurate results at minimum cost."),
                           tags$ul(
                             tags$li("No one flies a jet to the grocery store. Similarly, no manager would find costly and difficult methods appropriate for solving trivial forecasting problems."),
                             tags$li("To determine a suitable level of forecast accuracy, one must compare the costs and benefits of increased accuracy."),
                             tags$li("When forecast accuracy is low, the probability of significant forecasting error is high, as is the chance of making suboptimal managerial decisions."),
                             tags$li("Conversely, when forecast accuracy is high, the probability of substantial forecasting error is reduced and the chance of making erroneous managerial decisions is low."),
                             tags$li("It is reasonable to require a relatively high level of forecast accuracy when the costs of forecast error are high."),
                             tags$li("When only minor costs result from forecast error, inexpensive and less precise methods can be justified."),
                             tags$li("It is worth emphasizing that the objective of economic forecasting is to improve on the subjective judgments made by managers."),
                             tags$li("All managers forecast; the goal is to make better forecasts."),
                             tags$li("Nowhere in the forecasting process is the subjective judgment of managers relied on so heavily as it is in the selection of an appropriate forecast method."),
                             tags$li("When it comes to the selection of the best forecast technique, there is no substitute for seasoned business judgment.")
                           )
                         ))
              )),
      tabItem(tabName = "gdp_analysis",
              fluidPage(
                h2("GDP Analysis"),
                DTOutput("gdpTable"),
                selectInput("regressionModel", "Select Regression Model:",
                            choices = c("Original Variables", "Log Transformation")),
                conditionalPanel(
                  condition = "input.regressionModel == 'Log Transformation'",
                  checkboxInput("logTransform", "Log-transform Data", value = TRUE)
                ),
                numericInput("h", "Forecast Horizon (periods):", 5),
                actionButton("runModel", "Run Model"),
                h3("Regression Model"),
                verbatimTextOutput("gdpRegression"),
                h3("Forecast vs Actual Values"),
                DTOutput("gdpForecastTable"),
                actionButton("calculateForecast", "Calculate Forecast"),
                plotlyOutput("gdpForecastPlot"),
                verbatimTextOutput("forecastErrors")
              )),
      tabItem(tabName = "multiple_regression",
              tabsetPanel(
                tabPanel("Example Analysis",
                         fluidPage(
                           h2("Multiple Regression Analysis"),
                           p("Branded Products, Inc., based in Oakland, California, is a leading producer and marketer of household laundry detergent and bleach products."),
                           p("The company rolled out its new Super Detergent in 30 regional markets."),
                           p("Below is the weekly demand data and regression model estimation results for Super Detergent in these 30 regional markets:"),
                           DTOutput("brandedProductsTable"),
                           h3("New Market Forecasts"),
                           DTOutput("newMarketsTable"),
                           actionButton("runMultipleRegression", "Run Multiple Regression"),
                           h3("Multiple Regression Summary"),
                           verbatimTextOutput("multipleRegressionSummary"),
                           plotlyOutput("demandPlot"),
                           h3("Forecasted Demand for New Markets"),
                           DTOutput("forecastTable")
                         )
                ),
                tabPanel("User Data Analysis",
                         fluidPage(
                           h2("User Data Analysis"),
                           p("Upload your own dataset or select a built-in dataset to perform multiple regression analysis and forecasting."),
                           fileInput("fileUserMulti", "Upload CSV File for User Data Analysis",
                                     accept = c("text/csv", "text/comma-separated-values,text/plain", ".csv")),
                           checkboxInput("headerUserMulti", "Header", TRUE),
                           radioButtons("sepUserMulti", "Separator",
                                        choices = c(Comma = ",", Semicolon = ";", Tab = "\t"),
                                        selected = ","),
                           selectInput("builtinUserMulti", "Or Select a Built-in Dataset",
                                       choices = c("None", "AirPassengers (Monthly)", "nottem (Monthly)",
                                                   "EuStockMarkets (Daily)", "WWWusage (Daily)", "BJsales (Daily)",
                                                   "UKgas (Quarterly)", "lynx (Yearly)", "UKLungDeaths (Yearly)",
                                                   "DNase (Yearly)", "sunspot.year (Yearly)", "precip (Yearly)")),
                           uiOutput("columnsUserMulti"),
                           uiOutput("independentVarsUser"),
                           numericInput("hUserMulti", "Forecast Horizon (periods):", 5),
                           actionButton("runUserMultipleRegression", "Run Model"),
                           h3("Multiple Regression Model"),
                           verbatimTextOutput("userMultipleRegression"),
                           h3("Forecast Values"),
                           DTOutput("userForecastTableMulti"),
                           plotlyOutput("userForecastPlotMulti"),
                           verbatimTextOutput("userForecastErrorsMulti")
                         )
                )
              )),
      tabItem(tabName = "constant_growth",
              fluidPage(
                h2("Exercise P6.1: Constant Growth Model"),
                p("A. Using a spreadsheet or handheld calculator, calculate the 10-year growth rate forecast using the constant growth model with annual compounding, and the constant growth model with continuous compounding for each occupation."),
                p("B. Compare your answers and discuss any differences."),
                tableOutput("constantGrowthTable"),
                actionButton("calculateConstantGrowth", "Calculate Constant Growth"),
                verbatimTextOutput("constantGrowthExplanation")
              )),
      tabItem(tabName = "growth_rate",
              fluidPage(
                h2("Exercise P6.2: Growth Rate Estimation"),
                p("A. Complete the following table showing annual CD shipments data for 1994-99 period."),
                p("B. Calculate the geometric average annual rate of growth for the 1994-99 period."),
                p("C. Calculate the arithmetic average annual rate of growth for the 1994-99 period."),
                p("D. Discuss any differences in your answers to parts B and C."),
                tableOutput("growthRateTable"),
                actionButton("calculateGrowthRate", "Calculate Growth Rate"),
                verbatimTextOutput("growthRateResults"),
                verbatimTextOutput("growthRateExplanation")
              )),
      tabItem(tabName = "sales_trend",
              fluidPage(
                h2("Exercise P6.3: Sales Trend Analysis"),
                p("A. Calculate the company's growth rate in sales using the constant growth model with annual compounding."),
                p("B. Derive a 5-year and a 10-year sales forecast."),
                tableOutput("salesTrendTable"),
                actionButton("calculateSalesTrend", "Calculate Sales Trend"),
                verbatimTextOutput("salesTrendExplanation")
              )),
      tabItem(tabName = "cost_forecasting",
              fluidPage(
                h2("Exercise P6.4: Cost Forecasting"),
                p("A. Calculate the company's unit labor cost growth rate using the constant rate of change model with continuous compounding."),
                p("B. Forecast when unit labor costs will equal the current cost of importing."),
                tableOutput("costForecastingTable"),
                actionButton("calculateCostForecasting", "Calculate Cost Forecasting"),
                verbatimTextOutput("costForecastingResults"),
                verbatimTextOutput("costForecastingExplanation")
              )),
      tabItem(tabName = "unit_sales_forecast",
              fluidPage(
                h2("Exercise P6.5: Unit Sales Forecast Modeling"),
                p("A. Write the equation for next week's sales of A, using the variables A = sales of product A, B = sales of product B, and t = time. Assume that there will be no shortages of either product."),
                p("B. Last week, 100 units of A and 90 units of B were sold. Two weeks ago, 75 units of B were sold. What would you predict the sales of A to be this week?"),
                tableOutput("unitSalesForecastTable"),
                actionButton("calculateUnitSalesForecast", "Calculate Unit Sales Forecast"),
                verbatimTextOutput("unitSalesForecastExplanation")
              )),
      tabItem(tabName = "sales_forecast_modeling",
              fluidPage(
                h2("Exercise P6.6: Sales Forecast Modeling"),
                p("A. Write an equation for predicting sales if Geller assumes that the percentage change in sales is twice as large as the percentage change in income and advertising but that it is only one-half as large as, and of the opposite sign of, the percentage change in competitor advertising."),
                p("B. During the current period, sales total $500,000, median income per capita in the local market is $71,400, advertising is $20,000, and competitor advertising is $66,000. Previous period levels were $70,000 (income), $25,000 (advertising), and $60,000 (competitor advertising). Forecast next-period sales."),
                tableOutput("salesForecastModelingTable"),
                actionButton("calculateSalesForecastModeling", "Calculate Sales Forecast Modeling"),
                verbatimTextOutput("salesForecastModelingExplanation")
              )),
      tabItem(tabName = "cost_forecast_modeling",
              fluidPage(
                h2("Exercise P6.7: Cost Forecast Modeling"),
                p("A. Write an equation to predict next month's downtime using the variables D = downtime, M = preventive maintenance, t = time, a0 = constant term, a1 = regression slope coefficient, and u = random disturbance."),
                p("B. If 40 hours were spent last month on preventive maintenance and this month's downtime was 500 hours, what should downtime be next month if preventive maintenance this month is 50 hours?"),
                tableOutput("costForecastModelingTable"),
                actionButton("calculateCostForecastModeling", "Calculate Cost Forecast Modeling"),
                verbatimTextOutput("costForecastModelingExplanation")
              )),
      tabItem(tabName = "sales_forecast_toys",
              fluidPage(
                h2("Exercise P6.8: Sales Forecast Modeling (Toys Unlimited)"),
                p("A. Write an equation for estimating the Christmas season sales, using the variables S = sales, P = price, T = traffic, and t = time."),
                p("B. Forecast this season's sales if Toys Unlimited sold 10,000 games last season at $15 each, this season's price is anticipated to be $16.50, and customer traffic is expected to rise by 15% over previous levels."),
                tableOutput("salesForecastToysTable"),
                actionButton("calculateSalesForecastToys", "Calculate Sales Forecast (Toys Unlimited)"),
                verbatimTextOutput("salesForecastToysExplanation")
              )),
      tabItem(tabName = "simultaneous_equations",
              fluidPage(
                h2("Exercise P6.9: Simultaneous Equations"),
                p("A. Write an expression describing total revenue from tickets plus popcorn plus other concessions."),
                p("B. Forecast total revenues for both regular and special Tuesday night pricing."),
                p("C. Forecast the total profit contribution earned for the regular and special Tuesday night pricing strategies if the profit contribution is 25% on movie ticket revenues and 80% on popcorn and other concession revenues."),
                tableOutput("simultaneousEquationsTable"),
                actionButton("calculateSimultaneousEquations", "Calculate Simultaneous Equations"),
                verbatimTextOutput("simultaneousEquationsResults"),
                verbatimTextOutput("simultaneousEquationsExplanation")
              )),
      tabItem(tabName = "help",
              fluidPage(
                h2("Help and Instructions"),
                h3("Introduction"),
                p("Welcome to the Economic Forecasting Shiny App! This application allows users to explore various economic forecasting models, perform regression analysis, and engage in hands-on exercises."),
                
                h3("Navigating the App"),
                p("The app is structured into several sections, accessible via the sidebar menu on the left. Here's a brief overview of each section:"),
                
                tags$ul(
                  tags$li(tags$b("Introduction:"), " Provides an overview of economic forecasting."),
                  tags$li(tags$b("Types of Forecasting:"), " Describes different forecasting techniques such as Qualitative Analysis, Trend Analysis, Exponential Smoothing, and Econometric Models."),
                  tags$li(tags$b("Judging Forecast Reliability:"), " Offers insights into evaluating the reliability of different forecasting models."),
                  tags$li(tags$b("Choosing the Best Technique:"), " Helps users decide on the most appropriate forecasting method for their data."),
                  tags$li(tags$b("Regression:"), " Includes tabs for GDP Analysis and Multiple Regression Analysis."),
                  tags$li(tags$b("Exercises:"), " Features a variety of practical exercises to enhance understanding of forecasting concepts."),
                  tags$li(tags$b("Help:"), " Provides assistance and instructions for using the app.")
                ),
                
                h3("Using the GDP Analysis Tab"),
                p("In the GDP Analysis tab, you can explore GDP data over time and apply different regression models to forecast future values."),
                tags$ul(
                  tags$li(tags$b("GDP Table:"), " Displays the historical GDP data."),
                  tags$li(tags$b("Select Regression Model:"), " Choose between Original Variables or Log Transformation for your regression model."),
                  tags$li(tags$b("Forecast Horizon:"), " Set the number of periods ahead to forecast."),
                  tags$li(tags$b("Run Model:"), " Click this button to run the regression model and view the summary."),
                  tags$li(tags$b("Forecast vs Actual Values:"), " Compare the forecasted values with the actual values entered.")
                ),
                
                h3("Using the Multiple Regression Analysis Tab"),
                p("This tab allows for multiple regression analysis using built-in or user-provided datasets."),
                tags$ul(
                  tags$li(tags$b("Built-in Dataset:"), " Choose a dataset from the dropdown list for analysis."),
                  tags$li(tags$b("Upload CSV File:"), " Upload your own dataset in CSV format for customized analysis."),
                  tags$li(tags$b("Run Multiple Regression:"), " Execute the regression model and view the summary."),
                  tags$li(tags$b("Forecast Values:"), " Generate and visualize forecast values based on the regression model.")
                ),
                
                h3("Built-in Datasets"),
                p("Descriptions of the built-in datasets available for analysis:"),
                tags$ul(
                  tags$li(tags$b("AirPassengers (Monthly):"), " Monthly totals of international airline passengers from 1949 to 1960."),
                  tags$li(tags$b("nottem (Monthly):"), " Average monthly temperatures at Nottingham from 1920 to 1939."),
                  tags$li(tags$b("EuStockMarkets (Daily):"), " Daily closing prices of major European stock indices from 1991 to 1998."),
                  tags$li(tags$b("WWWusage (Daily):"), " Number of users connected to the Internet through a server every minute."),
                  tags$li(tags$b("BJsales (Daily):"), " Sales data for a company producing BJ products."),
                  tags$li(tags$b("UKgas (Quarterly):"), " Quarterly UK gas consumption from 1960 to 1986."),
                  tags$li(tags$b("lynx (Yearly):"), " Annual numbers of lynx trappings in Canada from 1821 to 1934."),
                  tags$li(tags$b("UKLungDeaths (Yearly):"), " Deaths from lung diseases in the UK, disaggregated by sex."),
                  tags$li(tags$b("DNase (Yearly):"), " Elisa assay of DNase concentrations."),
                  tags$li(tags$b("sunspot.year (Yearly):"), " Yearly numbers of sunspots from 1700 to 1988."),
                  tags$li(tags$b("precip (Yearly):"), " Annual precipitation in inches in Minneapolis from 1860 to 1985.")
                ),
                
                h3("Exercises"),
                p("The Exercises section provides a variety of practical forecasting exercises to apply your knowledge."),
                tags$ul(
                  tags$li(tags$b("Constant Growth Model:"), " Calculate and compare growth rates using different compounding methods."),
                  tags$li(tags$b("Growth Rate Estimation:"), " Estimate growth rates based on historical data."),
                  tags$li(tags$b("Sales Trend Analysis:"), " Analyze and forecast sales trends."),
                  tags$li(tags$b("Cost Forecasting:"), " Predict future costs using growth rate models."),
                  tags$li(tags$b("Unit Sales Forecast Modeling:"), " Develop equations to forecast unit sales."),
                  tags$li(tags$b("Sales Forecast Modeling:"), " Create sales forecasting models based on various factors."),
                  tags$li(tags$b("Cost Forecast Modeling:"), " Model future costs using regression analysis."),
                  tags$li(tags$b("Simultaneous Equations:"), " Work with simultaneous equations to analyze multiple variables."),
                  tags$li(tags$b("User Data Exercises:"), " Upload your own data to perform specific exercises.")
                ),
                
                h3("Contact and Support"),
                p("If you encounter any issues or have any questions, please feel free to reach out at okeshakarunarathne@gmail.com"),
                
                p("We hope you find this app useful for your economic forecasting needs. Happy forecasting!")
              )
      )
    )
  )
)

# Define server logic
server <- function(input, output, session) {
  
  # GDP Analysis
  gdp_data <- data.frame(
    Year = c(1966:1995),
    GDP = c(789.3, 834.1, 911.5, 985.3, 1039.7, 1128.6, 1240.4, 1385.5, 1501.0, 1635.2, 1823.9, 2031.4, 2295.9, 2566.4, 2795.6, 3131.3, 3259.2, 3534.9, 3932.7, 4213.0, 4452.9, 4742.5, 5108.3, 5489.1, 5803.2, 5986.2, 6318.9, 6642.3, 7054.3, 7400.5)
  )
  
  output$gdpTable <- renderDT({
    datatable(gdp_data, options = list(pageLength = 10))
  })
  
  observeEvent(input$runModel, {
    if (input$regressionModel == "Original Variables") {
      gdp_data$Time <- 1:nrow(gdp_data)
      gdp_model <- lm(GDP ~ Time, data = gdp_data)
    } else if (input$regressionModel == "Log Transformation" && input$logTransform) {
      gdp_data$lnGDP <- log(gdp_data$GDP)
      gdp_data$Time <- 1:nrow(gdp_data)
      gdp_model <- lm(lnGDP ~ Time, data = gdp_data)
    }
    
    output$gdpRegression <- renderPrint({
      summary(gdp_model)
    })
    
    forecast_time <- (nrow(gdp_data) + 1):(nrow(gdp_data) + input$h)
    
    if (input$regressionModel == "Original Variables") {
      forecast_data <- data.frame(
        Time = forecast_time,
        Forecast_Value = predict(gdp_model, newdata = data.frame(Time = forecast_time))
      )
    } else if (input$regressionModel == "Log Transformation" && input$logTransform) {
      forecast_data <- data.frame(
        Time = forecast_time,
        Forecast_Value = exp(predict(gdp_model, newdata = data.frame(Time = forecast_time)))
      )
    }
    
    forecast_data$Actual_Value <- NA
    
    output$gdpForecastTable <- renderDT({
      datatable(forecast_data, editable = TRUE, options = list(pageLength = 5))
    })
    
    proxy <- dataTableProxy("gdpForecastTable")
    
    observeEvent(input$gdpForecastTable_cell_edit, {
      info <- input$gdpForecastTable_cell_edit
      str(info)
      i <- info$row
      j <- info$col
      v <- info$value
      
      forecast_data[i, j] <<- DT::coerceValue(v, forecast_data[i, j])
      replaceData(proxy, forecast_data, resetPaging = FALSE)
    })
    
    observeEvent(input$calculateForecast, {
      req(!is.na(forecast_data$Actual_Value))
      
      forecast_data$Actual_Value <- as.numeric(forecast_data$Actual_Value) # Ensure numeric conversion
      forecast_data$Forecast_Error <- forecast_data$Actual_Value - forecast_data$Forecast_Value
      forecast_data$Squared_Error <- forecast_data$Forecast_Error^2
      
      output$gdpForecastPlot <- renderPlotly({
        ggplotly(ggplot(forecast_data, aes(x = Time)) +
                   geom_line(aes(y = Actual_Value, color = "Actual")) +
                   geom_line(aes(y = Forecast_Value, color = "Forecast")) +
                   ggtitle("Forecast vs Actual Values") +
                   theme_minimal())
      })
      
      output$forecastErrors <- renderPrint({
        if (all(!is.na(forecast_data$Actual_Value))) {
          cat("Correlation Coefficient between Actual and Forecast Values:", cor(forecast_data$Actual_Value, forecast_data$Forecast_Value, use = "complete.obs"), "\n")
          cat("Sample Mean Forecast Error (Root Mean Squared Error):", sqrt(mean(forecast_data$Squared_Error, na.rm = TRUE)), "\n")
        } else {
          cat("Please fill in all Actual Values to see the forecast errors.")
        }
      })
    })
  })
  
  # Reactive expression for data in the Overview tab
  overviewData <- reactive({
    if (!is.null(input$fileOverview)) {
      read.csv(input$fileOverview$datapath, header = input$headerOverview, sep = input$sepOverview)
    } else if (input$builtinOverview != "None") {
      switch(input$builtinOverview,
             "AirPassengers (Monthly)" = data.frame(Time = time(AirPassengers), Value = as.numeric(AirPassengers)),
             "nottem (Monthly)" = data.frame(Time = time(nottem), Value = as.numeric(nottem)),
             "EuStockMarkets (Daily)" = data.frame(Time = time(EuStockMarkets), Value = as.numeric(EuStockMarkets[, 1])),
             "WWWusage (Daily)" = data.frame(Time = time(WWWusage), Value = as.numeric(WWWusage)),
             "BJsales (Daily)" = data.frame(Time = time(BJsales), Value = as.numeric(BJsales)),
             "UKgas (Quarterly)" = data.frame(Time = time(UKgas), Value = as.numeric(UKgas)),
             "lynx (Yearly)" = data.frame(Time = time(lynx), Value = as.numeric(lynx)),
             "UKLungDeaths (Yearly)" = data.frame(Time = time(UKLungDeaths), Value = as.numeric(UKLungDeaths)),
             "DNase (Yearly)" = data.frame(Time = time(DNase), Value = as.numeric(DNase)),
             "sunspot.year (Yearly)" = data.frame(Time = time(sunspot.year), Value = as.numeric(sunspot.year)),
             "precip (Yearly)" = data.frame(Time = time(precip), Value = as.numeric(precip))
      )
    } 
  })
  
  output$columnsOverview <- renderUI({
    req(overviewData())
    selectInput("timeColumnOverview", "Select Time Column", choices = colnames(overviewData()))
  })
  
  observeEvent(input$plotOverview, {
    output$overviewTrendPlot <- renderPlotly({
      req(overviewData())
      dataset <- overviewData()
      ggplotly(ggplot(dataset, aes_string(x = input$timeColumnOverview, y = "Value")) +
                 geom_line() + 
                 ggtitle("Overview Trend Plot") + 
                 theme_minimal())
    })
  })
  
  # Upload data for Linear Trend Analysis
  data2 <- reactive({
    req(input$file2)
    read.csv(input$file2$datapath, header = input$header2, sep = input$sep2)
  })
  
  output$columns2 <- renderUI({
    req(data2())
    selectInput("timeColumn2", "Select Time Column", choices = colnames(data2()))
  })
  
  # Plot data for Linear Trend Analysis
  observeEvent(input$plotLinearTrend, {
    output$linearTrendPlot <- renderPlotly({
      req(data2())
      dataset <- data2()
      time_series <- ts(dataset[[input$timeColumn2]], frequency = 12)
      time_index <- seq_along(time_series)
      fit <- lm(time_series ~ time_index)
      fitted_values <- predict(fit, newdata = data.frame(time_index = time_index))
      future_time_index <- seq_along(time_series) + length(time_series)
      forecast_values <- predict(fit, newdata = data.frame(time_index = future_time_index))
      combined_data <- data.frame(Time = c(time_index, future_time_index), 
                                  Value = c(time_series, rep(NA, length(future_time_index))), 
                                  Fitted = c(fitted_values, forecast_values))
      ggplotly(ggplot(combined_data, aes(x = Time)) +
                 geom_line(aes(y = Value, color = "Actual")) +
                 geom_line(aes(y = Fitted, color = "Forecast")) +
                 ggtitle("Linear Trend Analysis Plot") + 
                 theme_minimal())
    })
    
    output$linearRegressionSummary <- renderPrint({
      req(data2())
      dataset <- data2()
      # Use the frequency input provided by the user
      time_series <- ts(dataset[[input$timeColumn2]], frequency = input$freqInput)
      time_index <- seq_along(time_series)
      fit <- lm(time_series ~ time_index)
      summary(fit)
    })
  })
  
  # Handle built-in datasets for Linear Trend Analysis
  observeEvent(input$builtin, {
    if (input$builtin != "None") {
      dataset <- switch(input$builtin,
                        "AirPassengers (Monthly)" = AirPassengers,
                        "nottem (Monthly)" = nottem,
                        "EuStockMarkets (Daily)" = EuStockMarkets[, 1],
                        "WWWusage (Daily)" = WWWusage,
                        "BJsales (Daily)" = BJsales,
                        "UKgas (Quarterly)" = UKgas,
                        "lynx (Yearly)" = lynx,
                        "UKLungDeaths (Yearly)" = UKLungDeaths,
                        "DNase (Yearly)" = DNase,
                        "sunspot.year (Yearly)" = sunspot.year,
                        "precip (Yearly)" = precip)
      
      output$linearTrendPlot <- renderPlotly({
        time_series <- ts(dataset, frequency = 12)
        time_index <- seq_along(time_series)
        fit <- lm(time_series ~ time_index)
        fitted_values <- predict(fit, newdata = data.frame(time_index = time_index))
        future_time_index <- seq_along(time_series) + length(time_series)
        forecast_values <- predict(fit, newdata = data.frame(time_index = future_time_index))
        combined_data <- data.frame(Time = c(time_index, future_time_index), 
                                    Value = c(time_series, rep(NA, length(future_time_index))), 
                                    Fitted = c(fitted_values, forecast_values))
        ggplotly(ggplot(combined_data, aes(x = Time)) +
                   geom_line(aes(y = Value, color = "Actual")) +
                   geom_line(aes(y = Fitted, color = "Forecast")) +
                   ggtitle("Linear Trend Analysis Plot") + 
                   theme_minimal())
      })
      
      output$linearRegressionSummary <- renderPrint({
        req(data2())
        dataset <- data2()
        # Use the frequency input provided by the user
        time_series <- ts(dataset[[input$timeColumn2]], frequency = input$freqInput)
        time_index <- seq_along(time_series)
        fit <- lm(time_series ~ time_index)
        summary(fit)
      })
    }
  })
  
  # Upload data for Growth Trend Analysis
  # Reactive expression to read the uploaded file
  data3 <- reactive({
    req(input$file3)
    read.csv(input$file3$datapath, header = input$header3, sep = input$sep3)
  })
  
  # Dynamically generate the selectInput for the time column
  output$columns3 <- renderUI({
    req(data3())
    selectInput("timeColumn3", "Select Time Column", choices = colnames(data3()))
  })
  
  # Add a dropdown for model selection
  output$modelSelection <- renderUI({
    selectInput("modelType", "Select Growth Model Type", choices = c("Annual Compounding", "Continuous Compounding"))
  })
  
  # Observe event to plot data for Growth Trend Analysis
  observeEvent(input$plotGrowthTrend, {
    output$growthTrendPlot <- renderPlotly({
      req(data3(), input$modelType)
      dataset <- data3()
      time_series <- ts(dataset[[input$timeColumn3]], frequency = input$freqInput)
      time_index <- seq_along(time_series)
      
      if (input$modelType == "Annual Compounding") {
        log_ts <- log10(time_series)
        fit <- lm(log_ts ~ time_index)
        fitted_values <- exp(predict(fit, newdata = data.frame(time_index = time_index)))
        future_time_index <- seq_along(log_ts) + length(log_ts)
        forecast_values <- exp(predict(fit, newdata = data.frame(time_index = future_time_index)))
      } else {
        log_ts <- log(time_series)
        fit <- lm(log_ts ~ time_index)
        fitted_values <- exp(predict(fit, newdata = data.frame(time_index = time_index)))
        future_time_index <- seq_along(log_ts) + length(log_ts)
        forecast_values <- exp(predict(fit, newdata = data.frame(time_index = future_time_index)))
      }
      
      combined_data <- data.frame(
        Time = c(time_index, future_time_index), 
        Value = c(time_series, rep(NA, length(future_time_index))), 
        Fitted = c(fitted_values, forecast_values)
      )
      
      ggplotly(ggplot(combined_data, aes(x = Time)) +
                 geom_line(aes(y = Value, color = "Actual")) +
                 geom_line(aes(y = Fitted, color = "Forecast")) +
                 ggtitle("Growth Trend Analysis Plot") + 
                 theme_minimal())
    })
    
    # Render regression summary
    output$growthRegressionSummary <- renderPrint({
      req(data3(), input$modelType)
      dataset <- data3()
      time_series <- ts(dataset[[input$timeColumn3]], frequency = input$freqInput)
      time_index <- seq_along(time_series)
      
      if (input$modelType == "Annual Compounding") {
        log_ts <- log10(time_series)
      } else {
        log_ts <- log(time_series)
      }
      
      fit <- lm(log_ts ~ time_index)
      summary(fit)
    })
  })
  
  # Handle built-in datasets for Growth Trend Analysis
  observeEvent(input$builtinGrowth, {
    if (input$builtinGrowth != "None") {
      dataset <- switch(input$builtinGrowth,
                        "AirPassengers (Monthly)" = AirPassengers,
                        "nottem (Monthly)" = nottem,
                        "EuStockMarkets (Daily)" = EuStockMarkets[, 1],
                        "WWWusage (Daily)" = WWWusage,
                        "BJsales (Daily)" = BJsales,
                        "UKgas (Quarterly)" = UKgas,
                        "lynx (Yearly)" = lynx,
                        "UKLungDeaths (Yearly)" = UKLungDeaths,
                        "DNase (Yearly)" = DNase,
                        "sunspot.year (Yearly)" = sunspot.year,
                        "precip (Yearly)" = precip)
      
      output$growthTrendPlot <- renderPlotly({
        req(input$modelType)
        
        if (input$modelType == "Annual Compounding") {
          log_ts <- log10(dataset)
        } else {
          log_ts <- log(dataset)
        }
        
        time_index <- seq_along(log_ts)
        fit <- lm(log_ts ~ time_index)
        fitted_values <- exp(predict(fit, newdata = data.frame(time_index = time_index)))
        future_time_index <- seq_along(log_ts) + length(log_ts)
        forecast_values <- exp(predict(fit, newdata = data.frame(time_index = future_time_index)))
        
        combined_data <- data.frame(
          Time = c(time_index, future_time_index), 
          Value = c(dataset, rep(NA, length(future_time_index))), 
          Fitted = c(fitted_values, forecast_values)
        )
        
        ggplotly(ggplot(combined_data, aes(x = Time)) +
                   geom_line(aes(y = Value, color = "Actual")) +
                   geom_line(aes(y = Fitted, color = "Forecast")) +
                   ggtitle("Growth Trend Analysis Plot") + 
                   theme_minimal())
      })
      
      output$growthRegressionSummary <- renderPrint({
        req(input$modelType)
        
        if (input$modelType == "Annual Compounding") {
          log_ts <- log10(dataset)
        } else {
          log_ts <- log(dataset)
        }
        
        time_index <- seq_along(log_ts)
        fit <- lm(log_ts ~ time_index)
        summary(fit)
      })
    }
  })
  
  # Multiple Regression Analysis
  branded_data <- data.frame(
    Regional_Demand = c(1290, 1177, 1155, 1299, 1166, 1186, 1293, 1322, 1338, 1160, 1293, 1413, 1299, 1238, 1467, 1089, 1203, 1474, 1235, 1367, 1310, 1331, 1293, 1437, 1165, 1328, 1515, 1223, 1293, 1215),
    Price_per_Case = c(137, 147, 149, 117, 135, 143, 113, 111, 109, 129, 124, 117, 106, 135, 117, 147, 124, 103, 140, 115, 119, 138, 122, 105, 145, 138, 116, 148, 134, 127),
    Competitor_Price = c(94, 81, 89, 92, 86, 79, 91, 82, 81, 82, 91, 76, 90, 88, 99, 76, 83, 98, 78, 83, 76, 100, 90, 86, 96, 97, 97, 84, 88, 87),
    Advertising = c(814, 896, 852, 854, 810, 768, 978, 821, 843, 849, 797, 988, 914, 913, 867, 785, 817, 846, 768, 856, 771, 947, 831, 905, 996, 929, 1000, 951, 848, 891),
    Household_Income = c(53123, 51749, 49881, 43589, 42799, 55565, 37959, 47196, 50163, 39080, 43263, 51291, 38343, 39473, 51501, 37809, 41471, 46663, 55839, 47438, 54348, 45066, 44166, 55380, 38656, 46084, 52249, 50855, 54546, 38085)
  )
  
  output$brandedProductsTable <- renderDT({
    datatable(branded_data, options = list(pageLength = 10))
  })
  
  observeEvent(input$runMultipleRegression, {
    branded_model <- lm(Regional_Demand ~ Price_per_Case + Competitor_Price + Advertising + Household_Income, data = branded_data)
    
    output$multipleRegressionSummary <- renderPrint({
      summary(branded_model)
    })
    
    new_markets <- data.frame(
      Price_per_Case = c(115, 122, 116, 140, 133),
      Competitor_Price = c(90, 101, 87, 82, 79),
      Advertising = c(790, 812, 905, 778, 996),
      Household_Income = c(41234, 39845, 47543, 53560, 39870)
    )
    
    new_markets$Forecast_Demand <- predict(branded_model, newdata = new_markets)
    
    output$newMarketsTable <- renderDT({
      datatable(new_markets, options = list(pageLength = 5))
    })
    
    output$demandPlot <- renderPlotly({
      ggplotly(ggplot(new_markets, aes(x = 1:nrow(new_markets), y = Forecast_Demand)) +
                 geom_point() +
                 geom_smooth(method = "lm") +
                 ggtitle("Forecasted Demand for New Markets") +
                 theme_minimal())
    })
  })
  
  # User Data Analysis for Multiple Regression
  userMultiData <- reactive({
    req(input$fileUserMulti)
    read.csv(input$fileUserMulti$datapath, header = input$headerUserMulti, sep = input$sepUserMulti)
  })
  
  output$columnsUserMulti <- renderUI({
    req(userMultiData())
    df <- userMultiData()
    colnames(df) <- make.names(colnames(df))
    selectInput("selectedColumnUserMulti", "Select Dependent Variable:", choices = colnames(df))
  })
  
  output$independentVarsUser <- renderUI({
    req(userMultiData())
    df <- userMultiData()
    colnames(df) <- make.names(colnames(df))
    checkboxGroupInput("selectedIndepVarsUser", "Select Independent Variables:", choices = colnames(df), selected = colnames(df)[2:ncol(df)])
  })
  
  observeEvent(input$runUserMultipleRegression, {
    req(userMultiData())
    df <- userMultiData()
    colnames(df) <- make.names(colnames(df))
    selectedCol <- input$selectedColumnUserMulti
    independentVars <- input$selectedIndepVarsUser
    
    formula <- as.formula(paste(selectedCol, "~", paste(independentVars, collapse = " + ")))
    user_multi_model <- lm(formula, data = df)
    
    output$userMultipleRegression <- renderPrint({
      summary(user_multi_model)
    })
    
    # Forecast values
    max_time <- nrow(df)
    forecast_horizon <- seq_len(input$hUserMulti)
    forecast_time <- max_time + forecast_horizon
    
    new_data <- data.frame(Time = forecast_time)
    new_data[, independentVars] <- NA # Placeholder for user input
    
    output$userForecastTableMulti <- renderDT({
      datatable(new_data, editable = TRUE, options = list(pageLength = 5))
    })
    
    proxy <- dataTableProxy("userForecastTableMulti")
    
    observeEvent(input$userForecastTableMulti_cell_edit, {
      info <- input$userForecastTableMulti_cell_edit
      str(info)
      i <- info$row
      j <- info$col
      v <- info$value
      
      new_data[i, j] <<- DT::coerceValue(v, new_data[i, j])
      replaceData(proxy, new_data, resetPaging = FALSE)
    })
    
    observeEvent(input$calculateUserForecastMulti, {
      req(!is.na(new_data[, -1]))
      
      new_data$Forecast_Value <- predict(user_multi_model, newdata = new_data)
      
      output$userForecastPlotMulti <- renderPlotly({
        ggplotly(ggplot(new_data, aes(x = Time)) +
                   geom_line(aes(y = Forecast_Value, color = "Forecast")) +
                   ggtitle("Forecast Values") +
                   theme_minimal())
      })
    })
  })
  
  # Exercises
  output$constantGrowthTable <- renderTable({
    employment_data <- data.frame(
      Occupation = c("Bill collectors", "Computer engineers", "Physicians' assistants", "Respiratory therapists", "Systems analysts"),
      Employment_1998 = c(311, 299, 66, 86, 617),
      Employment_2008 = c(420, 622, 98, 123, 1194)
    )
    employment_data
  })
  
  observeEvent(input$calculateConstantGrowth, {
    employment_data <- data.frame(
      Occupation = c("Bill collectors", "Computer engineers", "Physicians' assistants", "Respiratory therapists", "Systems analysts"),
      Employment_1998 = c(311, 299, 66, 86, 617),
      Employment_2008 = c(420, 622, 98, 123, 1194)
    )
    
    employment_data$Annual_Growth_Annual_Compounding <- round(((employment_data$Employment_2008 / employment_data$Employment_1998)^(1/10) - 1) * 100, 2)
    employment_data$Annual_Growth_Continuous_Compounding <- round((log(employment_data$Employment_2008 / employment_data$Employment_1998) / 10) * 100, 2)
    
    output$constantGrowthTable <- renderTable({
      employment_data
    })
    
    output$constantGrowthExplanation <- renderText({
      paste("Explanation:\n",
            "The annual growth rate with annual compounding is calculated using the formula: ((Employment_2008 / Employment_1998)^(1/10) - 1) * 100\n",
            "The annual growth rate with continuous compounding is calculated using the formula: (log(Employment_2008 / Employment_1998) / 10) * 100\n")
    })
  })
  
  output$growthRateTable <- renderTable({
    cd_data <- data.frame(
      Year = c(1994, 1995, 1996, 1997, 1998, 1999),
      CD_Shipments = c(662.1, 722.9, 778.9, 753.1, 847.0, 938.9)
    )
    cd_data
  })
  
  observeEvent(input$calculateGrowthRate, {
    cd_data <- data.frame(
      Year = c(1994, 1995, 1996, 1997, 1998, 1999),
      CD_Shipments = c(662.1, 722.9, 778.9, 753.1, 847.0, 938.9)
    )
    
    cd_data$Growth_Rate <- c(NA, diff(cd_data$CD_Shipments) / head(cd_data$CD_Shipments, -1) * 100)
    geometric_growth_rate <- round(((cd_data$CD_Shipments[6] / cd_data$CD_Shipments[1])^(1/5) - 1) * 100, 2)
    arithmetic_growth_rate <- round(mean(cd_data$Growth_Rate, na.rm = TRUE), 2)
    
    output$growthRateTable <- renderTable({
      cd_data
    })
    
    output$growthRateResults <- renderText({
      paste("Geometric Average Annual Growth Rate:", geometric_growth_rate, "%", "\n",
            "Arithmetic Average Annual Growth Rate:", arithmetic_growth_rate, "%")
    })
    
    output$growthRateExplanation <- renderText({
      paste("Explanation:\n",
            "The geometric average annual growth rate is calculated using the formula: ((CD_Shipments_1999 / CD_Shipments_1994)^(1/5) - 1) * 100\n",
            "The arithmetic average annual growth rate is calculated as the mean of the yearly growth rates.\n")
    })
  })
  
  output$salesTrendTable <- renderTable({
    sales_data <- data.frame(
      Year = c(2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019),
      Sales = c(25, 28, 32, 36, 40, 45, 50, 55, 60, 65)
    )
    sales_data
  })
  
  observeEvent(input$calculateSalesTrend, {
    sales_data <- data.frame(
      Year = c(2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019),
      Sales = c(25, 28, 32, 36, 40, 45, 50, 55, 60, 65)
    )
    
    growth_rate <- round(((sales_data$Sales[10] / sales_data$Sales[1])^(1/9) - 1) * 100, 2)
    sales_forecast_5yr <- round(sales_data$Sales[10] * (1 + growth_rate/100)^5, 2)
    sales_forecast_10yr <- round(sales_data$Sales[10] * (1 + growth_rate/100)^10, 2)
    
    output$salesTrendTable <- renderTable({
      sales_data
    })
    
    output$salesTrendExplanation <- renderText({
      paste("Explanation:\n",
            "The annual growth rate in sales is calculated using the formula: ((Sales_2019 / Sales_2010)^(1/9) - 1) * 100\n",
            "The 5-year sales forecast is calculated using the formula: Sales_2019 * (1 + Growth_Rate)^5\n",
            "The 10-year sales forecast is calculated using the formula: Sales_2019 * (1 + Growth_Rate)^10\n")
    })
  })
  
  output$costForecastingTable <- renderTable({
    cost_data <- data.frame(
      Year = c(2018, 2019, 2020),
      Unit_Labor_Cost = c(80, 90, 100)
    )
    cost_data
  })
  
  observeEvent(input$calculateCostForecasting, {
    cost_data <- data.frame(
      Year = c(2018, 2019, 2020),
      Unit_Labor_Cost = c(80, 90, 100)
    )
    
    growth_rate_continuous <- log(cost_data$Unit_Labor_Cost[3] / cost_data$Unit_Labor_Cost[1]) / 3
    year_to_reach_import_cost <- 2020 + log(115.9 / cost_data$Unit_Labor_Cost[3]) / growth_rate_continuous
    
    output$costForecastingTable <- renderTable({
      cost_data
    })
    
    output$costForecastingResults <- renderText({
      paste("Continuous Growth Rate:", round(growth_rate_continuous * 100, 2), "%", "\n",
            "Year when unit labor costs will equal current import cost:", round(year_to_reach_import_cost, 2))
    })
    
    output$costForecastingExplanation <- renderText({
      paste("Explanation:\n",
            "The continuous growth rate is calculated using the formula: log(Unit_Labor_Cost_2020 / Unit_Labor_Cost_2018) / 3\n",
            "The year to reach import cost is calculated using the formula: 2020 + log(115.9 / Unit_Labor_Cost_2020) / Continuous_Growth_Rate\n")
    })
  })
  
  output$unitSalesForecastTable <- renderTable({
    sales_data <- data.frame(
      Week = 1:3,
      Sales_A = c(100, NA, NA),
      Sales_B = c(90, 75, NA)
    )
    sales_data
  })
  
  observeEvent(input$calculateUnitSalesForecast, {
    sales_data <- data.frame(
      Week = 1:3,
      Sales_A = c(100, NA, NA),
      Sales_B = c(90, 75, NA)
    )
    
    sales_data$Sales_A[2] <- sales_data$Sales_A[1] * (1 - (sales_data$Sales_B[1] - sales_data$Sales_B[2]) / sales_data$Sales_B[1])
    sales_data$Sales_A[3] <- sales_data$Sales_A[2] * (1 - (sales_data$Sales_B[2] - sales_data$Sales_B[3]) / sales_data$Sales_B[2])
    
    output$unitSalesForecastTable <- renderTable({
      sales_data
    })
    
    output$unitSalesForecastExplanation <- renderText({
      paste("Explanation:\n",
            "The equation for next week's sales of A is: Sales_A[t+1] = Sales_A[t] * (1 - (Sales_B[t] - Sales_B[t+1]) / Sales_B[t])\n",
            "This is based on the assumption that the change in product A demand is inversely proportional to the change in sales of product B in the previous week.\n")
    })
  })
  
  output$salesForecastModelingTable <- renderTable({
    sales_data <- data.frame(
      Variable = c("Sales", "Income", "Advertising", "Competitor Advertising"),
      Current_Period = c(500000, 71400, 20000, 66000),
      Previous_Period = c(NA, 70000, 25000, 60000)
    )
    sales_data
  })
  
  observeEvent(input$calculateSalesForecastModeling, {
    sales_data <- data.frame(
      Variable = c("Sales", "Income", "Advertising", "Competitor Advertising"),
      Current_Period = c(500000, 71400, 20000, 66000),
      Previous_Period = c(NA, 70000, 25000, 60000)
    )
    
    percentage_change_income <- (sales_data$Current_Period[2] - sales_data$Previous_Period[2]) / sales_data$Previous_Period[2]
    percentage_change_advertising <- (sales_data$Current_Period[3] - sales_data$Previous_Period[3]) / sales_data$Previous_Period[3]
    percentage_change_comp_advertising <- (sales_data$Current_Period[4] - sales_data$Previous_Period[4]) / sales_data$Previous_Period[4]
    
    sales_data$Next_Period_Sales <- sales_data$Current_Period[1] * (1 + 2 * (percentage_change_income + percentage_change_advertising) - 0.5 * percentage_change_comp_advertising)
    
    output$salesForecastModelingTable <- renderTable({
      sales_data
    })
    
    output$salesForecastModelingExplanation <- renderText({
      paste("Explanation:\n",
            "The equation for predicting sales is: Sales_Next_Period = Sales_Current_Period * (1 + 2 * (Percentage_Change_Income + Percentage_Change_Advertising) - 0.5 * Percentage_Change_Competitor_Advertising)\n",
            "This assumes that the percentage change in sales is twice as large as the percentage change in income and advertising but only one-half as large as, and of the opposite sign of, the percentage change in competitor advertising.\n")
    })
  })
  
  output$costForecastModelingTable <- renderTable({
    cost_data <- data.frame(
      Month = c("Last Month", "This Month", "Next Month"),
      Preventive_Maintenance = c(40, 50, NA),
      Downtime = c(500, NA, NA)
    )
    cost_data
  })
  
  observeEvent(input$calculateCostForecastModeling, {
    cost_data <- data.frame(
      Month = c("Last Month", "This Month", "Next Month"),
      Preventive_Maintenance = c(40, 50, NA),
      Downtime = c(500, NA, NA)
    )
    
    percentage_increase_preventive_maintenance <- (cost_data$Preventive_Maintenance[2] - cost_data$Preventive_Maintenance[1]) / cost_data$Preventive_Maintenance[1]
    cost_data$Downtime[2] <- cost_data$Downtime[1] * (1 - percentage_increase_preventive_maintenance)
    
    output$costForecastModelingTable <- renderTable({
      cost_data
    })
    
    output$costForecastModelingExplanation <- renderText({
      paste("Explanation:\n",
            "The equation for predicting next month's downtime is: Downtime_Next_Month = Downtime_Current_Month * (1 - Percentage_Increase_Preventive_Maintenance)\n",
            "This assumes that downtime in the forecast month decreases by the same percentage as preventive maintenance increased during the month preceding the current one.\n")
    })
  })
  
  output$salesForecastToysTable <- renderTable({
    sales_data <- data.frame(
      Variable = c("Sales", "Price", "Traffic"),
      Last_Season = c(10000, 15, NA),
      This_Season = c(NA, 16.50, 1.15)
    )
    sales_data
  })
  
  observeEvent(input$calculateSalesForecastToys, {
    sales_data <- data.frame(
      Variable = c("Sales", "Price", "Traffic"),
      Last_Season = c(10000, 15, NA),
      This_Season = c(NA, 16.50, 1.15)
    )
    
    percentage_change_price <- (sales_data$This_Season[2] - sales_data$Last_Season[2]) / sales_data$Last_Season[2]
    percentage_change_traffic <- sales_data$This_Season[3] - 1
    
    sales_data$This_Season[1] <- sales_data$Last_Season[1] * (1 - 2 * percentage_change_price + 3 * percentage_change_traffic)
    
    output$salesForecastToysTable <- renderTable({
      sales_data
    })
    
    output$salesForecastToysExplanation <- renderText({
      paste("Explanation:\n",
            "The equation for estimating Christmas season sales is: Sales_This_Season = Sales_Last_Season * (1 - 2 * Percentage_Change_Price + 3 * Percentage_Change_Traffic)\n",
            "This assumes that game sales fall at double the rate of price increases and grow at triple the rate of customer traffic increases.\n")
    })
  })
  
  output$simultaneousEquationsTable <- renderTable({
    revenue_data <- data.frame(
      Pricing_Strategy = c("Regular", "Tuesday Night"),
      Attendance = c(500, 1500),
      Ticket_Revenue = c(500 * 9, 1500 * 4.5),
      Popcorn_Concession = c(500 * 0.5 * 4, 1500 * 0.5 * 4),
      Soda_Concession = c(500 * 0.4 * 3 + 500 * 0.4 * 0.6 * 3, 1500 * 0.8 * 3 + 1500 * 0.4 * 0.6 * 3)
    )
    revenue_data$Total_Revenue <- rowSums(revenue_data[, 3:5])
    revenue_data
  })
  
  observeEvent(input$calculateSimultaneousEquations, {
    revenue_data <- data.frame(
      Pricing_Strategy = c("Regular", "Tuesday Night"),
      Attendance = c(500, 1500),
      Ticket_Revenue = c(500 * 9, 1500 * 4.5),
      Popcorn_Concession = c(500 * 0.5 * 4, 1500 * 0.5 * 4),
      Soda_Concession = c(500 * 0.4 * 3 + 500 * 0.4 * 0.6 * 3, 1500 * 0.8 * 3 + 1500 * 0.4 * 0.6 * 3)
    )
    revenue_data$Total_Revenue <- rowSums(revenue_data[, 3:5])
    
    profit_data <- revenue_data
    profit_data$Profit_Contribution <- revenue_data$Ticket_Revenue * 0.25 + (revenue_data$Popcorn_Concession + revenue_data$Soda_Concession) * 0.8
    
    output$simultaneousEquationsTable <- renderTable({
      revenue_data
    })
    
    output$simultaneousEquationsResults <- renderTable({
      profit_data
    })
    
    output$simultaneousEquationsExplanation <- renderText({
      paste("Explanation:\n",
            "The total revenue from tickets, popcorn, and other concessions is calculated as: Total_Revenue = Ticket_Revenue + Popcorn_Concession + Soda_Concession\n",
            "The total profit contribution is calculated as: Profit_Contribution = Ticket_Revenue * 0.25 + (Popcorn_Concession + Soda_Concession) * 0.8\n",
            "This assumes a 25% profit contribution on movie ticket revenues and an 80% profit contribution on popcorn and other concession revenues.\n")
    })
  })
}

# Run the application 
shinyApp(ui = ui, server = server)
