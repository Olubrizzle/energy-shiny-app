
server <- function(input, output, session) {
  
  output$map <- renderGvis({
    gvisGeoChart(tecdf, "Country", input$selected,
                 options=list(region="world", displayMode="regions", 
                              width="auto", height="auto", colorAxis = "{colors: ['violet', 'indigo', 'blue', 'green', 'yellow', 'orange', 'red']}"))
    # using width="auto" and height="auto" to automatically adjust the map size
  })
  #Data output on Data tab
  output$table <- DT::renderDataTable({
    datatable(tecdf, rownames=FALSE) %>% 
      formatStyle(input$selected,  
                  background="skyblue", fontWeight='bold')
  })

  output$plot1<-renderPlot({
    ggplot(df_t, aes(x=Year, group = 1)) +
      geom_line(aes(y=get(paste(input$country1,collapse=' '))),colour='blue', size=3) +
      geom_line(aes(y=get(paste(input$country2,collapse=' '))),colour='red', size=3) +
      xlab('Year') + ylab("Energy Consumption(Quadrillion Btu)") +
      ggtitle("Interactive map of energy cosumption of the selected countries") +
      theme(axis.text.x = element_text(angle = 45, hjust = 1),
            panel.background = element_rect(fill = 'grey75'),
            plot.title = element_text(size=10, face="bold", 
                                      margin = margin(10, 0, 10, 0)))
  })
  output$plot2<-renderPlot({
    ggplot(df_t, aes(x=Year, group = 1)) +
      geom_line(aes(y=get(paste(input$country,collapse=' '))),colour='gold', size=4) +
      xlab('Year') + ylab("Energy Consumption(Quadrillion Btu)") +
      ggtitle("Energy cosumption of the selected country") +
      theme(axis.text.x = element_text(angle = 45, hjust = 1),
            panel.background = element_rect(fill = 'grey75'),
            plot.title = element_text(size=10, face="bold", 
                                      margin = margin(10, 0, 10, 0)))
    
  })
}



