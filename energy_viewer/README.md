# energy_viewer

A *slightly* more complex example that controls both a set of simple calculations and a PageView component. This app basically uses the data from
24 hours of smart meter readings(at 1/2 hourly intervals) and displays a scrollable view of the 1/2 hour consumption figures.

The currently selected reading is highlighted in **green**.

Below the scrollable view is a display of the current cost , this is calculated as:

**current consumption at that point** * the **kilowatt hour** cost  then add the **standing charge**


