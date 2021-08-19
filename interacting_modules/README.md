# Interacting modules

Regular app:  
Example app with several modules (3) that interact with each other. This is
achieved by the first module (`pick_data`) returning a dataset which is then
fed into the other modules (`show_data_table`,`hist_col1`) as an input argument.

Dashboard app:  
Does the same thing as the regular app except that the output in shown in different
tabls of a `shinydashboard`.
