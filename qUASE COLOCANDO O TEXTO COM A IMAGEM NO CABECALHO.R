library(shinydashboard)
library(shiny)
library(htmltools)
#library(fresh)

#### Zona de funções ####
mytheme<-create_theme(
  adminlte_color(
    light_blue = "#104E8B"
  )
  
)

loadingLogo <- function(href, src, loadingsrc, height = NULL, width = NULL, alt = NULL) {
  tagList(
    tags$head(
      tags$script(
        "setInterval(function(){
        if ($('html').attr('class')=='shiny-busy') {
        $('div.busy').show();
        $('div.notbusy').hide();
        } else {
        $('div.busy').hide();
        $('div.notbusy').show();
        }
},100)")
    ),
    tags$a(href=href,
           div(class = "busy",  
               img(src=loadingsrc,height = height, width = width, alt = alt)),
           div(class = 'notbusy',
               img(src = src, height = "53px", width = "60px", alt = alt))
    )
    )
  }

mytitle<-paste0("LTC - COPPE - UFRJ")
#### Aqui começa a brincadeira ####
ui <- dashboardPage(
  title = "LTC - COPPE - UFRJ" ,
  
  #skin = "blue",
  header =   dashboardHeader(
    #titleWidth = "500px",
    tags$li(a(
      div(style="margin-left:-1300px;margin-bottom:0px;margin-top:0px;padding: 0px 0px 0px 0px ; width: 40px;",
          img(src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4ZqntKBf1ZQ3YU3NDvgSz__ppaZf8iyAcXdCWYPsK6aJtpyqqw-psdFDgkp1kBjfPFT8&usqp=CAU",
              height = "50px",width="50px",class = 'header_img')),
      div(style="display: inline;margin-top:0px; padding: 0px 0px 0px 0px ;font-size: 14px ;color:#001641;font-family:Chronicle Display Light; width: 40px;",HTML(mytitle))
    ),
    class="dropdown"
    )
    
  ),
  
  
  sidebar =  dashboardSidebar(
    #####largura side bar #####
    #width = "150px",
    # minified =T,
    collapsed = FALSE, #mostra o sidebar
    disable = FALSE,
    sidebarMenu(
      menuItem(
        text = "geral",
        icon = icon("globe"),
        tabName = "aba1"
      ),
      menuItem(
        text = "mais",
        icon = icon("plus"),
        menuSubItem(
          text = "calendário",
          icon = icon("calendar"),
          tabName = "aba2"
        ),
        menuSubItem(
          text = "perfil",
          icon = icon("users"),
          tabName = "aba3"
        )
      )
    )
  ),
  body =  dashboardBody(
    use_theme(mytheme),
    
    fluidRow(p(" Última atualização: ",Sys.time())), #Encerrei a primeira linha
    fluidRow( #não pode ultrapassar 12 dentro de uma linha
      column(
        width= 4,
        p("grade 4 ")
      ),
      column(
        width= 4,
        p("grade 4 ")
      ),
      column(
        width= 4,
        p("grade 4 ")
      )
    ),#Encerrei a segunda linha 
    fluidRow( #não pode ultrapassar 12 dentro de uma linha
      column(
        width= 2,
        p("grade 2 ")
      ),
      column(
        width= 3,
        p("grade 3 ")
      ),
      column(
        #offset=3,
        width= 4,
        p("grade 4 ")
      )
    )
    
  )
)