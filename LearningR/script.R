# R Script

# arithmetic operators
3 + 3
3 * 3
3 / 3
3 %% 2  # modulus
3 - 3

# types
3 # numeric
3.4 # numeric
3L # integer
"abc" # character
'abc' # character
TRUE # logical
FALSE # logical
NA # logical
NULL # null

# class() function will reveal type
class(3)
class(3.4)
class(3L)
class("abc")
class('abc')
class(TRUE)
class(FALSE)
class(NA)
class(NULL)

# is.*() functions will test for type
is.numeric(3)
is.numeric(3.4)
is.numeric(3L)
is.integer(3L)
is.character("abc")
is.character('abc')

# type coercion
as.numeric(TRUE)
as.numeric(FALSE)
as.numeric("45")
as.numeric("4K")
is.na(as.numeric("4k"))
as.integer(45)
is.integer(as.integer(45))
as.character(45.3)
as.character(45L)

# TODO: distinction between NA and NULL

# variable assignment
num1 <- 42
num1 # inspection note the strange [1]. we will talk about this later.
num2 <- 3L
chr1 <- "abc"
chr2 <- 'abc'

# variables live in a workspace
ls() # display all variables in the workspace
ls(pattern = "num") # display using a regular expression
help("ls") # open and display help on the ls command
rm(num1) # remove a variable from a workspace
ls()

# vectors are created using the create function c()
c(1, 2, 3)
c("a", "b", "c")

v1 <- c(1, 2, 3)
v2 <- c("a", "b", "c")
v3 <- c(1, "b", FALSE) 

class(v1)
class(v2)
class(v3) # note that automatic type coercion happened here
# TODO: write down coercion precedence rules for vectors

# vector elements can have names
# imagine table of rain per days in a week
# Mon Tue Wed Thu Fri Sat Sun
# 0.4 1.5 0.0 1.8 2.3 2.9 3.5

rain <- c(0.4, 1.5, 0.0, 1.8, 2.3, 2.9, 3.5) 
names(rain) <- c("Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun")
rain

# note that you can also manually assign as well
# note that names can be quoted or unquoted as well. use quotes if you want special characters
rain1 <- c(Mon = 0.4, Tue = 1.5, 'Wed' = 0.0, "Thu" = 1.8, Fri = 2.3, Sat = 2.9, Sun = 3.5) 
rain1

days_of_week <- c("Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun")
rain2 <- c(0.4, 1.5, 0.0, 1.8, 2.3, 2.9, 3.5)
names(rain2) <- days_of_week
rain2
