open Jest
open ExpectJs

Day.extend(Day_ArraySupport.plugin)

describe("Day_ArraySupport", () => {
  test("array input", () => {
    Day_ArraySupport.parseArray([2010., 0., 14., 15., 25., 50., 125.])->Day.toDate()
    |> expect
    |> toEqual(Js.Date.fromString("2010-01-14T15:25:50.125"))
  })
})
