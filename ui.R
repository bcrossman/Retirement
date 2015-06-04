library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Retirement"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    
    sidebarPanel(
      sliderInput("age",
                  "How old are you:",
                  min = 18,
                  max = 80,
                  value = 35),
      sliderInput("retirement_age",
                  "At what age would you like to retire:",
                  min = 40,
                  max = 90,
                  value = 70),
      sliderInput("dead_age",
                  "How old do you expect to live to:",
                  min = 70,
                  max = 120,
                  value = 95),
      numericInput("expense",
                   "Current Monthly Expenses (excluding saving):", 
                   value=5000, 
                   min = 0, 
                   max = NA,
                   step = 100),
      sliderInput("tax",
                  "Tax Rate in Retirement:",
                  min = 10,
                  max = 50,
                  value = 20),
      numericInput("inflation",
                  "Inflation Expectation %:",
                  min = 0,
                  max = 15,
                  value = 3.5,
                  step = .5),
      numericInput("investment_return_pre",
                  "Investment Return % Pre-Retirement:",
                  min = 0,
                  max = 15,
                  value = 7,
                  step = .5),
      numericInput("investment_return_post",
                  "Investment Return % Post-Retirement:",
                  min = 0,
                  max = 15,
                  value = 4,
                  step = .5),
      sliderInput("ss",
                  "Social Security in Retirement:",
                  min = 0,
                  max = 60000,
                  value = 24000),
      sliderInput("savings",
                  "What do you currently have saved (Pre-tax):",
                  min = 0,
                  max = 2000000,
                  value = 50000),
      numericInput("savings_increase",
                  "What percent can you increase your annual savings by (each year):",
                  min = 0,
                  max = 5,
                  value = 2.0,
                  step = .5)
    ),

    # Show a plot of the generated distribution
    mainPanel(p(strong("In the Side Panel you can enter your unique and 
                 individual financial circumstances and in the area below you'll
                  see not only what you need to eventually retire, but how you can reach
                  that goal!")),
      fluidRow(
                 column(width=5,
                      p(strong("Years till Retirement:")), textOutput("years_to_retirement")),
                 column(width=5,
                      p(strong("Years in Retirement:")), textOutput("years_in_retirement"))),                 
      fluidRow(
                 column(width=5,
                      p(strong("Current Annual Expenses")), textOutput("annual_expenses_curr")),
                 column(width=5,
                      p(strong("Annual Expense Expectation at Retirement")), textOutput("annual_expenses_future"))),
      fluidRow(
                 column(width=5,
                      p(strong("You'll need this amount to Retire:")), textOutput("retirement_need")),
                 column(width=5,
                      p(strong("Given your current savings, you'd need this much more in savings today:")), textOutput("retirement_need_today"))),
      fluidRow(              
                      p(strong("Alternatively you have to save this each year (and increase by the percent you chose):")), textOutput("retirement_need_savings"))
                 
    )
  )
))
