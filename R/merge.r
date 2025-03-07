login_data <- data.frame(
  ID = c(1, 2),
  Name = c("Alice", "Bob"),
  Verified = c(TRUE, FALSE)
)

password_data <- matrix(c(1, "09122018", 2, "18122022"), ncol = 2, byrow = TRUE)
colnames(password_data) <- c("ID", "Password")
password_data <- as.data.frame(password_data)

merged_data <- merge(login_data, password_data, by = "ID")

print(merged_data)
