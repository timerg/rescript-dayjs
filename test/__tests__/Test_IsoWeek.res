open Jest
open ExpectJs

Day.extend(Day_IsoWeek.plugin)

describe("Day_IsoWeek", () => {
  test("isoWeek", () => {
    Day.parseString("1989-06-04")->Day_IsoWeek.isoWeek() |> expect |> toEqual(22.)
  })
  test("setIsoWeek", () => {
    Day.parseString("1989-06-04")->Day_IsoWeek.setIsoWeek(23.)
    |> expect
    |> toEqual(Day.parseString("1989-06-11"))
  })
  test("setIsoWeek", () => {
    Day.parseString("1989-06-04")->Day_IsoWeek.setIsoWeek(23.)
    |> expect
    |> toEqual(Day.parseString("1989-06-11"))
  })
  test("isoWeekday", () => {
    Day.parseString("1989-06-04")->Day_IsoWeek.isoWeekday() |> expect |> toEqual(7.)
  })
  test("isoWeekday", () => {
    Day.parseString("1989-06-04")->Day_IsoWeek.setIsoWeekday(6.)
    |> expect
    |> toEqual(Day.parseString("1989-06-03"))
  })
  test("isoWeekYear", () => {
    Day.parseString("1989-06-04")->Day_IsoWeek.isoWeekYear() |> expect |> toEqual(1989.)
  })
  test("_isoweek", () => {
    Day.isAfterBy(
      Day.parseString("1989-06-04"),
      Day.parseString("1989-06-03"),
      Day_IsoWeek._isoWeek,
    )
    |> expect
    |> toBeFalsy
  })
})
