#Find Me Gnar
A site that makes it easy for user to find closest colorado ski resorts, compare
recent snowfall, base and other stats, and see relevant realtime information about each resort.

##Data Sources
###Real Time Crowd Sourced data
-Resort Relevant tweets (Twitter Api)
-Resort Relevant photos (Instagram Api)
###Continuously updating data
-Road conditions for directions to resort (CDOT)
-Road cams for roads listed in directions to resort (CDOT)
###Daily Data
-Resorts Snowfall and Base stats (From each resorts site)
-Resorts temperature stats (Wunderground Api)

##TODO
-obtain data feeds from CDOT
-functions to find roadcams and roads along way to resort with
  -path from google maps api includes geo coordinates
  -google directions include road names
  -find roadcams close to directions path and display those images
  -find roads along google maps path and display conditions of each road on the directions panel
  -also color code sections of google path as road conditions
