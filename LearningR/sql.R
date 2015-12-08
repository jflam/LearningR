# R Script for experimenting with SQL Server 2016 support

# Install the R ODBC driver
install.packages("RODBC")

# Use the R ODBC driver
library(RODBC)

# Create a connection string to talk to AdventureWorks2016CTP3 database
cn <- odbcDriverConnect(connection = "Driver={SQL Server Native Client 11.0};server=localhost;database=AdventureWorksDW2016CTP3;trusted_connection=yes;")

# Retrieve all rows from Person table
people <- sqlQuery(cn, "select * from Person.Person")

# Show the data
head(people)

# Another way to fetch some data from a pre-created VIEW
dataFetchEUR <- sqlFetch(cn, 'vResellerSalesAmountEUR', colnames = FALSE, rows_at_time = 1000)
head(dataFetchEUR)
View(dataFetchEUR)


pairs(dataFetchEUR)

# Create a new database