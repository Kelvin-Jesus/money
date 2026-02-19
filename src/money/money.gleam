import gleam/float
import gleam/int

pub opaque type Money {
  Money(amount_in_cents: Int, currency: String)
}

pub type CurrencyError {
  InvalidCurrencyError
}

pub fn new(amount: Int, currency: String) -> Money {
  Money(amount, currency)
}

pub fn add(from: Money, other: Money) -> Result(Money, CurrencyError) {
  case other.currency != from.currency {
    True -> Error(InvalidCurrencyError)
    False ->
      Ok(Money(
        amount_in_cents: amount(from) + amount(other),
        currency: from.currency,
      ))
  }
}

fn amount(money: Money) -> Int {
  money.amount_in_cents
}

pub fn to_string(m: Money) -> String {
  float.to_string(float.to_precision(
    { int.to_float(m.amount_in_cents) /. 100.0 },
    2,
  ))
  <> " "
  <> m.currency
}
