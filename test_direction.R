test_direction <- function(x, y, z) {
  if (x < y && y < z) 1
  else if (x > y && y > z) -1
  else 0
}