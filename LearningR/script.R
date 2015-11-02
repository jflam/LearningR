# R Script

# arithmetic operators
3 + 3
3 - 3
3 * 3
3 / 3
3 %% 2  # modulus
3 ^ 2 # power

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
class(rain)
is.vector(rain)
length(rain) # length returns the number of elements in the vector

# note that you can also manually assign as well
# note that names can be quoted or unquoted as well. use quotes if you want special characters
rain1 <- c(Mon = 0.4, Tue = 1.5, 'Wed' = 0.0, "Thu" = 1.8, Fri = 2.3, Sat = 2.9, Sun = 3.5) 
rain1

days_of_week <- c("Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun")
rain2 <- c(0.4, 1.5, 0.0, 1.8, 2.3, 2.9, 3.5)
names(rain2) <- days_of_week
rain2

# surprising fact: simple values are actually vectors!
a <- 42
is.vector(a)
length(a)

# simple arithmetic is performed element-wise over vectors. the single vector element case is not surprising
width <- 3
height <- 4
perimeter <- 2 * width + 2 * height
perimeter

# special case of a single-value vector operator over multi-value vectors (note: commutative)
2 + c(3, 3, 3)
c(3, 3, 3) + 2
2 * c(3, 3, 3)
c(3, 3, 3) + c(3, 3, 3)
c(3, 3, 3) * c(3, 3, 3)

# if both of the vectors that the operator is applied to have length > 1, their lengths be a multiple of the shorter one.
# the shorter one will be applied over the longer one repeatedly
c(3, 3, 4, 4) + c(4, 4)

# the > 1 element vector case
box <- c(3, 4) # width, height

twice_box <- box * 2
twice_box # is 6, 8 now

# works with other operators
half_box <- box / 2
half_box

squared_box <- box ^ 2
squared_box

# can sum over all elements in a vector. note that both forms of below work!
perimeter <- sum(box) * 2
perimeter

perimeter2 <- sum(box * 2)
perimeter2

# comparison operators work element wise as well
# note that these returns a vector of LOGICALs
4 > 3
c(4, 3) < c(3, 5) 
c(4, 3) == c(4, 4)

# subsetting using an index. note that R is 1-index based
nums <- c(1, 2, 3, 4)
nums[1]
nums[4]
nums[5] # since this is out of range, it returns NA
nums[0] # ??? TODO: understand why this prints out numeric(0)

# more interesting case is when the vector is named
nums2 <- c(1, 2, 3, 4)
names(nums2) <- c("one", "two", "three", "four")
nums2
nums2[1]
nums2[3]

# can generate a vector with values using the : operator
nums2[2:4] # this is equivalent to nums2[c(2,3,4)]

# can subset using a name as well
nums2["three"]

# can subset using another vector that contains indexes
nums2[c(1, 3)]

# can subset using another vector that contains names
nums2[c("two", "four")]

# can subset using negative indexes
nums2[-1] # all except 1
nums2[-2] # all except 2

# can subset using a vector of negative indexes (or you can negate a vector)
nums2[c(-1, -2)]
nums2[ - c(1, 2)]

# can subset using a vector of LOGICAL values as well
nums2[c(TRUE, FALSE, TRUE, FALSE)]

# note that the logical vector is applied repeatedly (recycled),
# but no requirement for length of logical vector to be evenly divisible into length of vector
nums2[c(TRUE, FALSE)]
nums2[c(FALSE, TRUE, TRUE)]

# sum over a vector of logicals will count the number of TRUE values ... nice trick
sum(nums2 > 2)

# matrix creation
matrix(1:6, nrow = 2)
matrix(c(6,5,4,3,2,1), nrow = 2)
matrix(1:6, ncol = 3)               # note that values are column-major
matrix(1:6, nrow = 2, byrow = TRUE) # can force to row-major

# matrix creation with recycling
matrix(1:3, nrow = 2, ncol = 3)
matrix(1:3, nrow = 2, ncol = 3, byrow = TRUE)
matrix(1:4, nrow = 2, ncol = 3)               # warning about data not being a multiple of columns 
matrix(1:4, nrow = 2, ncol = 3, byrow = TRUE) # warning about data not being a multiple of columns

# matrix creation by binding vectors to columns
cbind(1:3, 1:3)
cbind(c(3,2,1), c(3,2,1))

# matrix creation by binding vectors to rows
rbind(1:3, 1:3)
rbind(c(3,2,1), c(3,2,1))

# matrix creation by binding matrix to rows
m <- matrix(1:6, byrow = TRUE, nrow = 2)
rbind(m, 7:9)         # add another row using vector
rbind(m, c(9, 8, 7))
rbind(1:3, 1:3, 1:3)  # can take an arbitrary number of row vectors

# matrix creation by binding matrix to columns
cbind(m, 10:11)
cbind(m, c(11,10))

# naming rows in a matrix using rownames()
m <- matrix(1:6, byrow = TRUE, nrow = 2)
rownames(m) <- c("row1", "row2")

# naming columns in a matrix using colnames()
colnames(m) <- c("col1", "col2", "col3")

# construct a list that contains row name vector followed by column name vector
# pass that list during matrix creation time using dimnames parameter
m <- matrix(1:6, byrow = TRUE, nrow = 2, dimnames = list(c("row1", "row2"), c("col1", "col2", "col3")))

# can create a character matrix using the LETTERS built-in vector of 26 upper case letters
m <- matrix(LETTERS[1:6], nrow = 4, ncol = 3) # note recycling here

# note that cbind can bind two matrices together as well ... not just vectors
# note that matrices can contain different types - it is not necessarily homogeneous
m1 <- matrix(1:8, ncol = 2)
m2 <- matrix(LETTERS[1:6], nrow = 4, ncol = 3)
m3 <- cbind(m1, m2)

# you can compute the sum of each row in a matrix using the rowSums() function
m <- matrix(1:6, ncol = 2)
m
rowSums(m)

# you can compute the sum of each column in a matrix using the colSums() function
m <- matrix(1:6, ncol = 2)
m
colSums(m)

# matrix subsetting
m <- matrix(1:12, nrow = 3)

# retrieve single element using [row, col] indices
m[1, 3] == 7
m[3, 2] == 6

# retrieve a single row
m[3, ]

# retrieve a single column
m[, 1]

