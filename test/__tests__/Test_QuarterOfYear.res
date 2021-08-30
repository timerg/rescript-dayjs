open Jest
open ExpectJs
open Day

extend(Day_QuarterOfYear.plugin)

describe("Day_Locale", () => {
  test("quarter", () => {
    Day.parseString("1989-06-04")->Day_QuarterOfYear.quarter() |> expect |> toEqual(2.)
  })
  test("setQuarter", () => {
    Day.parseString("1989-06-04")->Day_QuarterOfYear.setQuarter(3.)
    |> expect
    |> toEqual(Day.parseString("1989-09-04"))
  })
  test("_isoweek", () => {
    Day.isAfterBy(
      Day.parseString("1989-06-04"),
      Day.parseString("1989-06-03"),
      Day_QuarterOfYear._quarter,
    )
    |> expect
    |> toBeFalsy
  })
})
