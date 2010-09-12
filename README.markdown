Updating the datafile
=====================

Currently, the page uses the earthquakes.kml file for data as the timemap
library doesn't support remote kml.

To update the earthquakes.kml file:

* Go to the [GeoNet quake search](http://magma.geonet.org.nz/resources/quakesearch/)
* Set the date range, and draw a box around the Canterbury region on
  the map to exclude other quakes.  Setting the end date to tomorrow will
  ensure you get all the known aftershocks.
* Select KML as the output format, and save the resulting file over the
  existing earthquakes.kml

Updating the 'Quakes by date' graph
===================================

This graph uses the Google charts API.  You can use the `stats.rb` Ruby script
to create a new chart URL when the earthquakes.yml file is update, the new URL
must currently be inserted manually into `index.html`.

TODO
====

* Customise map markers based on depth
* Filter by depth
* Zoom timescale
* Animate display
