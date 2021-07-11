open Jest
open ExpectJs
open Day

module Locale = Day_Locale.Make({
  let locales = [Day_Locale.de, Day_Locale.en]
})

extend(Day_LocalizedFormat.plugin)

describe("Day_Locale", () => {
  beforeEach(() => {
    Locale.setGlobalLocale("en")
  })
  test("set globally", () => {
    Locale.setGlobalLocale("de")
    Locale.getLocale() |> expect |> toEqual("de")
  })
  test("use locale locallly", () => {
    Day.parseString("2021-10-11T12:01:02.100")->Locale.setLocale("de")->format("LL")
    |> expect
    |> toEqual("11. Oktober 2021")
  })
})
