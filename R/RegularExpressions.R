library(stringr)
read.csv("data/messages.txt", header = FALSE)
fruits <- readLines("data/fruits.txt")
fruits
matches <- grep("^\\w+:\\s\\d+$", fruits)
matches
fruits[matches]
matches <- str_match(fruits, "^(\\w+):\\s(\\d+)$")
matches
fruits_df <- data.frame(na.omit(matches[, -1]), stringsAsFactors = FALSE)
colnames(fruits_df) <- c("fruit", "quantity")
fruits_df$quantity <- as.integer(fruits_df$quantity)
fruits_df
telephone <- readLines("data/telephone.txt")
telephone[grep("^\\d{3}-\\d{5}$", telephone)]
telephone[grep("^\\d{4}-\\d{4}$", telephone)]
grepl("^\\d{3}-\\d{5}$", telephone)
grepl("^\\d{4}-\\d{4}$", telephone)
!grepl("^\\d{3}-\\d{5}$", telephone) & !grepl("^\\d{4}-\\d{4}$", telephone)
telephone[!grepl("^\\d{3}-\\d{5}$", telephone) & !grepl("^\\d{4}-\\d{4}$", telephone)]
messages <- readLines("data/messages.txt")
pattern <- "^(\\d+-\\d+-\\d+),(\\d+:\\d+:\\d+),(\\w+),(\\w+),\\s*(.+)$"
matches <- str_match(messages, pattern)
matches
messages_df <- data.frame(matches[, -1])
messages_df
colnames(messages_df) <- c("Date", "Time", "Sender", "Receiver", "Message")