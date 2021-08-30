open Jest
open ExpectJs
open Day

extend(Day_Weekday.plugin)

describe("Day_Weekday", () => {
  test("weekday", () => {
    Day.parseString("1989-06-04")->Day_Weekday.weekday() |> expect |> toEqual(0.)
  })
  test("setWeekday", () => {
    Day.parseString("1989-06-04")->Day_Weekday.setWeekday(6.)
    |> expect
    |> toEqual(Day.parseString("1989-06-10"))
  })
})
