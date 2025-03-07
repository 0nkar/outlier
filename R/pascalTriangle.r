generate_pascals_triangle <- function(n) {
  triangle <- vector("list", n)
  for (i in 1:n) {
    triangle[[i]] <- numeric(i)
    triangle[[i]][1] <- 1
    triangle[[i]][i] <- 1
    if (i > 2) {
      for (j in 2:(i - 1)) {
        triangle[[i]][j] <- triangle[[i - 1]][j - 1] + triangle[[i - 1]][j]
      }
    }
  }
  for (row in triangle) {
    cat(paste(row, collapse = " "), "\n")
  }
}

generate_pascals_triangle(5)