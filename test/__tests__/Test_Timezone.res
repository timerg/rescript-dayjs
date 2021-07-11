open Jest
open ExpectJs
open Day
open Day_Timezone

extend(Day_Timezone.plugin)
extend(Day_UTC.plugin)

describe("Day_Timezone", () => {
  test("tz", () => {
    parseString("2021-10-11T12:01:02.100Z")->tz("Asia/Taipei")->formatDefault()
    |> expect
    |> toEqual("2021-10-11T20:01:02+08:00")
  })
})
