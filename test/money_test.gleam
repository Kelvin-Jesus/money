import gleeunit
import gleeunit/should
import money/money

pub fn main() -> Nil {
  gleeunit.main()
}

pub fn add_money_and_check_format_test() {
  let price = money.new(1999, "BRL")
  let discount = money.new(500, "BRL")

  let assert Ok(final_price) = money.add(price, discount)

  money.to_string(final_price)
  |> should.equal("24.99 BRL")
}

pub fn add_money_test() {
  let price = money.new(1999, "BRL")
  let discount = money.new(500, "BRL")

  money.add(price, discount)
  |> should.equal(Ok(money.new(2499, "BRL")))
}
