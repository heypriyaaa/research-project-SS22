# load library
library(readxl)
#library(xlsx) # uncomment to save data in .xlsx format

# load to an object
imported_data = read_excel('41467_2022_28523_MOESM6_ESM.xlsx') # Data that we get from the journal

# choosing the columns that corresponds the tumor data. (cleanup data)
Cell_ID_Myeloid <- factor(imported_data$Cell_ID_Myeloid...1) # 116 myeloid cells ID
Cell_ID_Tumor <- factor(imported_data$Cell_ID_Tumor) # 68 tumor cell ID
Distance <- imported_data$Distance...3 # measured distance between myeloid cell and tumor cell
Cell_type <- factor(imported_data$Cell_type...4) # H+ and H-
# They combine/ measured 68 tumor ID cells to 116 myeloid ID cells for T1 to M1, T1 to M2, T1 to M3..
# T2 to M1, T2 to M2, T2 to M3 until M116

# create data frame to tumor data object
tumor_data = data.frame(Cell_ID_Myeloid, Cell_ID_Tumor, Distance, Cell_type)
# the 4 variables data were combined as one and put it into tumor data

# show the summary of the tumor data
summary(tumor_data)

# Write to RDS file
#saveRDS(tumor_data, file="tumor_data.rds")
# Write to xlsx file
#write.xlsx(tumor_data, file = "tumor_data.xlsx")
# Write to CSV
write.csv(tumor_data, "tumor_data.csv", row.names = FALSE) 
# if row names didnt set to false, the data will be saved as five rows 

# choosing the columns that ccorresponds the T cell data
Cell_ID_Myeloid <- factor(imported_data$Cell_ID_Myeloid...6) 
Cell_ID_T_Cell <- factor(imported_data$Cell_ID_T_Cell)
Distance <- imported_data$Distance...8
Cell_type <- factor(imported_data$Cell_type...9)

# create data frame to t cell data object
t_cell_data = data.frame(Cell_ID_Myeloid, Cell_ID_T_Cell, Distance, Cell_type)
# the 4 variables were 
# clean up removing lines with NA
t_cell_data = t_cell_data[complete.cases(t_cell_data), ]

# show the summary of the t cell data
summary(t_cell_data)

# Write to RDS file
#saveRDS(t_cell_data, file="t_cell_data.rds")
# Write to xlsx file
#write.xlsx(t_cell_data, file = "t_cell_data.xlsx")
# Write to CSV
write.csv(t_cell_data, "t_cell_data.csv", row.names = FALSE)