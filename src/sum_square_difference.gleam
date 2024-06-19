import gleam/io

pub fn main() {
  io.debug(sum_square_difference(100))
}

fn sum_square_difference(x: Int) -> Int {
  sum_square_difference_loop(x, 0, 0)
}

fn sum_square_difference_loop(
  x: Int,
  sum_of_squares: Int,
  square_of_sums: Int,
) -> Int {
  case x == 0 {
    True -> square_of_sums * square_of_sums - sum_of_squares
    False ->
      sum_square_difference_loop(
        x - 1,
        sum_of_squares + x * x,
        square_of_sums + x,
      )
  }
}
