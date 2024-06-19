import gleam/int
import gleam/io
import gleam/string

pub fn main() {
  io.debug(largest_palindrome_product(100, 999))
}

fn largest_palindrome_product(min: Int, max: Int) -> Int {
  product_loop(min, max, max, max, 0)
}

fn product_loop(min: Int, max: Int, i: Int, j: Int, largest: Int) -> Int {
  case i < min {
    True -> largest
    False ->
      case j < min {
        True -> product_loop(min, max, i - 1, max, largest)
        False -> {
          let product = i * j
          let product_string = int.to_string(product)
          let half =
            product_string
            |> string.length
            |> fn(length) { length / 2 }
          let left = string.slice(product_string, 0, half)
          let right =
            string.slice(product_string, -half, half) |> string.reverse
          case left == right && product > largest {
            True -> product_loop(j, max, i, j - 1, product)
            False -> product_loop(min, max, i, j - 1, largest)
          }
        }
      }
  }
}
