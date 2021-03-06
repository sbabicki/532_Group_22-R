# author: Steffen Pentelow and Sasha Babicki
# date: 2021-01-22
#"""
#Module to generate tab 1: Geographic Crime Comparisons
#"""

library(dash)
library(dashHtmlComponents)
library(dashCoreComponents)
library(dashBootstrapComponents)

#' Generate tab 1 layout
#'
#' @return dbcContainer Container with the html content of the page
generate_tab_1_layout <- function(){
    
    dropdown_height <- 60   
    start_year <- 1998
    end_year <- 2019
    year_range <- seq(start_year, end_year, 3)
    
    dbcContainer(list(
        dbcRow(list(
            
            # Column 1
            dbcCol(list(
                dbcRow(list(
                    htmlDiv(list(
                        "Select Metric",
                        dccDropdown(id = "metric_select", value = "Rate per 100,000 population", optionHeight=dropdown_height)
                        ),
                        style = list("width" = "100%"))
                )),
                dbcRow(list(
                    htmlDiv(list(
                        "Select Violation",
                        dccDropdown(id = "violation_select", value = "Total, all violations", optionHeight = dropdown_height)
                        ),
                        style = list("width" = "100%"))
                )),
                dbcRow(list(
                    htmlDiv(list(
                        "Select Violation Subcategory",
                        dccDropdown(id="subviolation_select", value = "", optionHeight = dropdown_height)
                        ), 
                        style = list("width" = "100%"))
                )),
                dbcRow(list(
                    htmlDiv(list(
                        "Select Year of Interest",
                        dccSlider(
                            id="year_select",
                            min = start_year, 
                            max = end_year,
                            step = 1,
                            value = 2019, 
                            dots = TRUE,
                            tooltip = list("placement" = "top"),
                            included=FALSE,
                            marks = as.list(setNames(year_range, as.character(year_range)))
                            )
                    ), 
                    style = list("width" = "100%"))
                ))
            ), 
            width=3, 
            style=list('padding-left'= '2%', "width" = "100%")
            ), 
            
            # Column 2
            dbcCol(list(
                dbcRow(list(
                    htmlDiv("Violations by Province"),
                    dccGraph(id="choropleth", style = list('width'= '100%', 'height'= '100%'))
                    ))
                ),
                width=5, 
                style=list('padding-left' = '2%')
            ),
            
            # Column 3
            dbcCol(list(
                dbcRow(list(
                    htmlDiv("Violations by CMA"),
                    dccGraph(id='cma_barplot', style = list('width'= '100%', 'height'= '600px'))
                ))
            ),
            width=4, 
            style=list('padding-left' = '2%', 'padding-right' = '2%')
            )
            ))
        ),
    fluid = TRUE)
}
