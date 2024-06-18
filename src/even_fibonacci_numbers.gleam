import gleam/io

pub fn main() {
  io.debug(fibonacci_sum(4_000_000))
}

fn fibonacci_sum(max: Int) -> Int {
  fibonacci_sum_loop(max, 1, 2, 0)
}

fn fibonacci_sum_loop(max: Int, last: Int, next: Int, sum: Int) -> Int {
  let sum = case next % 2 == 0 {
    True -> sum + next
    False -> sum
  }
  case next {
    next if next >= max -> sum
    _ -> fibonacci_sum_loop(max, next, last + next, sum)
  }
}
