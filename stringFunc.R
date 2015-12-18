# stringFunc.R
# a collection of string functions in R
# not complete.
# last update: 2015-12-18

"A string contains single quote (')"
'A string contains double quote (")'
"A string contains double quote (\")"
"A string contains both single quote (') and double quote (\")"
'Another string contains both single quote (\') and double quote (")'

# nchar, length
x <- c("Hellow", "World", "!")
nchar(x)
length(x)
length("")
nchar("")

DNA <- "AtGCtttACC"
tolower(DNA)
toupper(DNA)
?chartr
# character translation
chartr("Tt", "UU", DNA)
x <- "MiXeD cAsE 123"
chartr("iXs", "why", x)
chartr("a-cX", "D-Fw", x)

#paste
paste("CK", 1:6, sep = "")
## [1] "CK1" "CK2" "CK3" "CK4" "CK5" "CK6"
x <- list(a = "aaa", b = "bbb", c = "ccc")
y <- list(d = 1, e = 2)
paste(x, y, sep = "-")  #较短的向量被循环使用
## [1] "aaa-1" "bbb-2" "ccc-1"
z <- list(x, y)
paste("T", z, sep = ":")
# if a list has character parts and non-character parts, and is transferred using as.character, the result is strange

# use collapse to link all elements into a string
paste(x, y, sep = "-", collapse = "; ")
paste(x, collapse = "; ")

# splitting a string
# strsplit(x, split, fixed = FALSE, perl = FALSE, useBytes = FALSE)
# x: character vector, each element of which is to be split. Other inputs, including a factor, will give an error.
# character vector (or object which can be coerced to such) containing regular expression(s) (unless fixed = TRUE) 
# to use for splitting. If empty matches occur, in particular if split has length 0, x is split into single characters. If split has length greater than 1, it is re-cycled along x.
# fixed: logical. If TRUE match split exactly, otherwise use regular expressions. Has priority over perl.
# perl: logical. Should Perl-compatible regexps be used?
# return
# A list of the same length as x, the i-th element of which contains the vector of splits of x[i].
# If any element of x or split is declared to be in UTF-8 (see Encoding), all non-ASCII character strings in the result will be in UTF-8 and have their encoding declared as UTF-8. For perl = TRUE, useBytes = FALSE all non-ASCII strings in a multibyte locale are translated to UTF-8.

noquote(strsplit("A text I want\" to display with spaces", NULL)[[1]])
# A   t e x t   I   w a n t "   t o   d i s p l a y   w i t h   s p a c e s
x <- c(as = "asfef", qu = "qwerty", "yuiop[", "b", "stuff.blah.yech")
strsplit(x, "e")
# a list of five elements

text <- "Hello Adam!\nHello Ava!"
strsplit(text, " ")
strsplit(text, "\\s") # blanks

# equal to split each character as one string
strsplit(text, "")
# [1] "H"  "e"  "l"  "l"  "o"  " "  "A"  "d"  "a"  "m"  "!"  "\n" "H"  "e"  "l"  "l"  "o" 
# [18] " "  "A"  "v"  "a"  "!" 
# NOTE: \n is treated as one character in R

# search in a string: grep, grepl
files <- list.files("c:/windows")
grep("\\.exe$", files)
# 5 20 22 25 26 38 48 49 50 66 80 81 87 90
grepl("\\.exe$", files)
#  [1] FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
# [15] FALSE FALSE FALSE FALSE FALSE  TRUE FALSE  TRUE FALSE FALSE  TRUE  TRUE FALSE FALSE
# [29] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE
# [43] FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE
# [57] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE
# [71] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE FALSE FALSE FALSE
# [85] FALSE FALSE  TRUE FALSE FALSE  TRUE

# when they are used for indexing, they are the same

# regexpr,gregexpr,regexec
# return the position of matching
text <- c("Hellow, Adam!", "Hi, Adam!", "How are you, Adam.")
regexpr("Adam", text)
# [1]  9  5 14
# attr(,"match.length")
# [1] 4 4 4
# attr(,"useBytes")
# [1] TRUE

gregexpr("Adam", text)
# [[1]]
# [1] 9
# attr(,"match.length")
# [1] 4
# attr(,"useBytes")
# [1] TRUE
# 
# [[2]]
# [1] 5
# attr(,"match.length")
# [1] 4
# attr(,"useBytes")
# [1] TRUE
# 
# [[3]]
# [1] 14
# attr(,"match.length")
# [1] 4
# attr(,"useBytes")
# [1] TRUE

regexec("Adam", text)
# return a list for each elements
# [[1]]
# [1] 9
# attr(,"match.length")
# [1] 4
# 
# [[2]]
# [1] 5
# attr(,"match.length")
# [1] 4
# 
# [[3]]
# [1] 14
# attr(,"match.length")
# [1] 4

# TODO
# extracting substring!
# replacing strings!
# others!

# substitute
# gsub,sub
# NOTE: it does not change the pointer - the original string. return the new value
# if you want to change the orignal string, assign the new value to it
sub(pattern = "Adam", replacement = "world", text)
# "Hellow, world!"      "Hi, world!"          "How are you, world."
# sub only changes the place of first matching
# gsub changes every time of matching
sub(pattern = "Ada", replacement = "AAA", x = "AdaAda")
# "AAAAda"
gsub(pattern = "Ada", replacement = "AAA", x = "AdaAda")
# "AAAAAA"

## substring extraction
# substr
# substring
substr("abcdef", 2, 4)
substring("abcdef", 1:6, 1:6)
unlist(strsplit("abcdef",split = ""))
# the same effect. More efficient
# can be combined with reg expr


###
# compare
text > text
# FALSE FALSE FALSE

# sort
sort(text, decreasing = T)
# [1] "How are you, Adam." "Hi, Adam!"          "Hellow, Adam!"   

# match
exT<-c("Intron", "Exon", "promoter","enhancer")
match("Exon", exT)
# 2
"promoter" %in% exT
# TRUE
pmatch("E", exT)
# 2
match("E", exT)
# NA
pmatch("x", exT)
# NA
charmatch("E", exT)
# 2
pmatch(c("Exo","enh"), exT)
# 2 4

## formatting
format(1:10)
# " 1" " 2" " 3" " 4" " 5" " 6" " 7" " 8" " 9" "10"
format(1:10, trim = T)
# "1"  "2"  "3"  "4"  "5"  "6"  "7"  "8"  "9"  "10"
# formatting digits. Use of nsmall
format(13.7)
format(13.7, nsmall = 3)
# "13.700"
format(c(6.0, 13.1), digits = 2)
# " 6" "13"
format(c(6.0, 13.1), digits = 2, nsmall = 1)
# " 6.0" "13.1"
# digits control the integer part. nsmall controls the min number of digits to the right
# of the decimal point

## reg expr
pattern <- "^[a-zA-Z0-9\\._%+-]+@[a-zA-Z0-9\\.-]+\\.[A-Za-z]{2,4}$"
str<-c("abc","someone@qiuworld.com","efg","anotherone@gmail.com","thirdone@yahoo.cn")
grep(pattern = pattern, x = str)
grepl(pattern = pattern, x = str)
regexpr(pattern = pattern, text = str)
gregexpr(pattern = pattern, text = str)
pattern_sim <- "^[\\w\\._%+-]+@[\\w\\.-]+\\.[A-Za-z]{2,4}$"
pattern_3 <- "^[[:album]\\._%+-]+@[[album:]\\.-]+\\.[[alpha:]]{2,4}$"
