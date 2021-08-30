open Jest
open ExpectJs

Day.extend(Day_UTC.plugin)

describe("Day_UTC", () => {
  test("asUtc", () => {
    Day.parseString("2019-03-06T17:11:55+08:00")->Day_UTC.asUtc()->Day.toString()
    |> expect
    |> toEqual(Day.parseString("2019-03-06T09:11:55Z")->Day.toString())
  })
  test("utc", () => {
    let now = Day.now()
    let utcNow = Day_UTC.utc()
    now->Day_UTC.asUtc() |> expect |> toEqual(utcNow)
  })
  Skip.test("utcOffset", () => fail("not implemented"))
  Skip.test("local", () => fail("not implemented"))
})
