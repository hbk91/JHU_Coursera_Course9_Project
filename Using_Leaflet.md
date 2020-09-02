---
title: "Using Leaflet"
author: "Aman Jindal"
date: "2 September 2020"
output:
  html_document:
    keep_md: yes
---



### 1. Introduction: 
In this document we will make an interactive map in R using the leaflet package. We will plot the location of the following places on an interactive map.

<ol type = 'a'>
    <li> <b> United Nations Headquarters: </b> Latitude  = 40.7489, Longitude = -73.9680 </li>
    <li> <b> Times Square: </b> Latitude  = 40.7580, Longitude = -73.9855 </li>
    <li> <b> Empire State Building: </b> Latitude  = 40.7484, Longitude = -73.9857 </li> 
    <li> <b> Rockfeller Center: </b> Latitude  = 40.7587, Longitude = -73.978 7</li>
</ol>
    
### 2. Making a Leaflet Interactive Plot with Popups:



```r
library(leaflet)

df <- data.frame(lat = c(40.7489, 40.7580, 40.7484, 40.7587),
                 lng = c(-73.9680, -73.9855, -73.9857, -73.9787),
                 popup = c('United Nations Headquarters',
                           'Times Square',
                           'Empire State Building',
                           'Rockfeller Center'))

df %>%
    leaflet() %>%
    addTiles() %>%
    addMarkers(popup = df$popup)
```

<!--html_preserve--><div id="htmlwidget-b1f0dee688c33fe4e1d9" style="width:672px;height:480px;" class="leaflet html-widget"></div>
<script type="application/json" data-for="htmlwidget-b1f0dee688c33fe4e1d9">{"x":{"options":{"crs":{"crsClass":"L.CRS.EPSG3857","code":null,"proj4def":null,"projectedBounds":null,"options":{}}},"calls":[{"method":"addTiles","args":["//{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",null,null,{"minZoom":0,"maxZoom":18,"tileSize":256,"subdomains":"abc","errorTileUrl":"","tms":false,"noWrap":false,"zoomOffset":0,"zoomReverse":false,"opacity":1,"zIndex":1,"detectRetina":false,"attribution":"&copy; <a href=\"http://openstreetmap.org\">OpenStreetMap<\/a> contributors, <a href=\"http://creativecommons.org/licenses/by-sa/2.0/\">CC-BY-SA<\/a>"}]},{"method":"addMarkers","args":[[40.7489,40.758,40.7484,40.7587],[-73.968,-73.9855,-73.9857,-73.9787],null,null,null,{"interactive":true,"draggable":false,"keyboard":true,"title":"","alt":"","zIndexOffset":0,"opacity":1,"riseOnHover":false,"riseOffset":250},["United Nations Headquarters","Times Square","Empire State Building","Rockfeller Center"],null,null,null,null,{"interactive":false,"permanent":false,"direction":"auto","opacity":1,"offset":[0,0],"textsize":"10px","textOnly":false,"className":"","sticky":true},null]}],"limits":{"lat":[40.7484,40.7587],"lng":[-73.9857,-73.968]}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

    
    
