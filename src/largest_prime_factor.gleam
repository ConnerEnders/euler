import gleam/int
import gleam/io
import gleam/result

pub fn main() {
  io.debug(largest_prime_factor(600_851_475_143))
}

fn largest_prime_factor(x: Int) {
  largest_prime_factor_loop(x, 2)
}

fn largest_prime_factor_loop(x: Int, i: Int) {
  case x {
    x if x == 1 -> Ok(i)
    _ ->
      case x % i == 0 {
        True -> largest_prime_factor_loop(x / i, i)
        False -> {
          use square_root <- result.try(int.square_root(x))
          case int.to_float(i) >. square_root {
            True -> largest_prime_factor_loop(x, x)
            False -> largest_prime_factor_loop(x, i + 1)
          }
        }
      }
  }
}
