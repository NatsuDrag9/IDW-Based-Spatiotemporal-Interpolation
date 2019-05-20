# IDW-Based-Spatiotemporal-Interpolation
This project is by Akhil Kumar and Rohit Imandi from Bennett University. Urban pollution data has been interpolated in both space and time. The corresponding theory has been mentioned in the link below. Random and manually generated pollution data points were chosen to test the code.  https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4997435/ 


Remark - This code has not been tested on any original urban pollution data set due to its unavailability. Please email me or comment below in case an urban pollution data set with proper space-time co-ordinates and pollution values is found.

Description of varibales.
val_stat - measured values at various stations (currently a random set).
val_stat_plot, t_stat_plot - variable used for plotting.
x_stat, y_stat, t_stat - space-time co-ordinates of various stations.
x_int, y_int, t_int - query points at which interpolation occurs.
e - exponent.
val_int - stores interpolated values.
N - no. of nearest neighbours.
