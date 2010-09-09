Updating the datafile
=====================

Currently, the page uses the earthquakes.kml file for data as the timemap
library doesn't support remote kml.

To update the file:

* Go to the [GeoNet quake search](http://magma.geonet.org.nz/resources/quakesearch/)
* Set the date range, and draw a box around the Canterbury region on
  the map to exclude other quakes.  Setting the end date to tomorrow will
  ensure you get all the known aftershocks.
* Select KML as the output format, and save the resulting file over the
  existing earthquakes.kml

TODO
====

* Customise map markers based on depth
* Filter by depth
* Zoom timescale
* Animate display
