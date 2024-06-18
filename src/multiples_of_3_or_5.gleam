import gleam/io

pub fn main() {
  io.debug(sum_of_multiples())
}

fn sum_of_multiples() {
  sum_of_multiples_loop(0, 0)
}

fn sum_of_multiples_loop(x: Int, sum: Int) -> Int {
  let sum = case x % 3 == 0 || x % 5 == 0 {
    True -> sum + x
    False -> sum
  }
  case x {
    999 -> sum
    _ -> sum_of_multiples_loop(x + 1, sum)
  }
}
