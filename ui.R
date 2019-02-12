

library(shinydashboard)

ui <- fluidPage(shinyUI(
  dashboardPage( 
  dashboardHeader(title='World Energy Consumption'),
  dashboardSidebar(
    sidebarUserPanel(name = 'By Oluwole Alowolodu',
                     subtitle = '',
                     image = 'zero-point-energy.jpg'),
    sidebarMenu(
      menuItem("Home", tabName = "home", icon = icon("home")),
      menuItem("Data", tabName = "data", icon = icon("database")),
      menuItem("Map", tabName = "map", icon = icon("map")), 
      menuItem("Graphs", tabName = "graphs", icon = icon("bar-chart")),
    selectizeInput("selected",
                    "Select Year",
                    choice = year))
  ), 
  dashboardBody(
    tabItems(
      tabItem(tabName = "home",
              fluidRow(box(title = "International Energy Statistics",width = 12)),
              fluidRow(box(title = "About",
                           footer = "Depending on the industry and individual being asked, the word 'Energy' 
                           has different definitions, but for the purpose of this project, it shall be defined 
                           as the entity of nature that is transformed from one form to another between parts 
                           of a system in the production of physical change within the system. The first and 
                           still major source of energy is the sun. Over the years, different sources of energy 
                           have emerged; Fossil fuels is a huge source of coal, oil and natural gas. Other 
                           sources of energy are Nuclear plant, Hydro-electric, Wind and Geothermal. Energy
                          consumption has evolved as new sources are discovered, wood and hydroelectric 
                           were in high use up until last century, this changed drastically in mid 20th century 
                           when nuclear, coal, natural gas and petroleum became the most consumed energy sources.
                           This project takes a closer look into energy consumption around the world", width=12)),
              fluidRow(box(title = "Source",
                           footer = "Data analysed is sourced form the United States Government 
                           Department of Energy data catalog. It contains energy consumption of 225 countries from 
                           1990 to 2008 in Quadrillion BTU (British Thermal Unit) or 1.055 × 10^18 joules. It puts into account all sources of energy. 
                            A visual of the dataset is avalilable at the click of 'Data' button on the 
                           left side bar", width=12)),
              fluidRow(box(title = "Observational Inference",
                           footer = "It is not suprising that energy consumption is always on the increase for individual 
                           countries and the world at large, the first argument that comes to mind is population size.
                           Considering the period this project covers only, the world population stood at 5.3 Billion in 
                           1990 while in 2008, world population rose to 6.7 Billion. Another factor is technological advancement 
                           and improvement in the standard of living around the world",width=12))),
      tabItem(tabName = "data",
              fluidRow(box(DT::dataTableOutput("table"), width = 12))),
       tabItem(tabName = "map",
              fluidRow(box(title = "World Energy Map",
                           footer = glue("This interactive map displays energy consumption of countries for the year selected"),
                           width = 12)),
              # gvisGeoChart
              fluidRow(box(htmlOutput("map"), width = 12)
              )),
      tabItem(tabName = "graphs",
              box(width = "100%" , height = "100%", solidHeader = FALSE, status = "primary"),
              fluidRow(column(width=5,selectizeInput('country1',label="Select country 1",choices=country_names)),
                       column(width=5,selectizeInput('country2',label="Select country 2",choices=country_names))),
              fluidRow(column(10, plotOutput("plot1")),
              fluidRow(column(width=5,selectizeInput('country',label="Select country",choices=country_names)),
              fluidRow(column(10, plotOutput("plot2")))
)))
))
)
))