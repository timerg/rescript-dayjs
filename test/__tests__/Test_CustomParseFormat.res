open Jest
open ExpectJs

Day.extend(Day_CustomParseFormat.plugin)
let _ = Day_Locale.es

describe("Day_CustomParseFormat", () => {
  test("parseCustom", () => {
    Day_CustomParseFormat.parseCustom(
      ~input="05/02/69 1:02:03 PM -05:00",
      ~format="MM/DD/YY H:mm:ss A Z",
    )->Day.toDate()
    |> expect
    |> toEqual(Js.Date.fromString("1969-05-02T18:02:03Z"))
  })
  test("parseCustomWithOption of locale", () => {
    Day_CustomParseFormat.parseCustomWithLocale(
      ~input="2018 enero 15",
      ~format="YYYY MMMM DD",
      ~locale="es",
    )->Day.toDate()
    |> expect
    |> toEqual(Js.Date.fromString("2018-01-15T00:00:00.000"))
  })
  test("parseCustomWithStrict not strict", () => {
    Day_CustomParseFormat.parseCustomWithStrict(
      ~input="1970-00-00",
      ~format="YYYY-MM-DD",
      ~strict=false,
    )->Day.isValid()
    |> expect
    |> toBeTruthy
  })
  test("parseCustomWithStrict", () => {
    Day_CustomParseFormat.parseCustomWithStrict(
      ~input="1970-00-00",
      ~format="YYYY-MM-DD",
      ~strict=true,
    )->Day.isValid()
    |> expect
    |> toBeFalsy
  })
  test("parseCustomWithLocaleStrict not strict", () => {
    Day_CustomParseFormat.parseCustomWithLocaleStrict(
      ~input="2018 enero 00",
      ~format="YYYY MMMM DD",
      ~locale="es",
      ~strict=false,
    )->Day.isValid()
    |> expect
    |> toBeTruthy
  })
  test("parseCustomWithLocaleStrict", () => {
    Day_CustomParseFormat.parseCustomWithLocaleStrict(
      ~input="2018 enero 00",
      ~format="YYYY MMMM DD",
      ~locale="es",
      ~strict=true,
    )->Day.isValid()
    |> expect
    |> toBeFalsy
  })
})
