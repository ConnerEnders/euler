import gleam/io

pub fn main() {
  io.debug(smallest_multiple(20))
}

fn smallest_multiple(max: Int) -> Int {
  multiple_loop(max, max, max)
}

fn multiple_loop(max: Int, factor: Int, multiple: Int) -> Int {
  case factor <= max / 2 {
    True -> multiple
    False ->
      case multiple % factor == 0 {
        True -> multiple_loop(max, factor - 1, multiple)
        False -> multiple_loop(max, max, multiple + max)
      }
  }
}
