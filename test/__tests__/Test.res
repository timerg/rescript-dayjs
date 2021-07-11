open Jest
open ExpectJs
open Day

describe("Rescript Dayjs", () => {
  describe("Parse", () => {
    test("parseString", () => {
      let date = parseString("2018-04-04T16:00:00.000Z")->toDate()
      date |> expect |> toEqual(Js.Date.fromString("2018-04-04T16:00:00.000Z"))
    })
    test("parseDate", () => {
      let date = Js.Date.make()

      date->parseJsDate->toDate() |> expect |> toEqual(date)
    })
    test("parseTimestamp", () => {
      let date = Js.Date.make()
      let timestamp = Js.Date.getTime(date)

      timestamp->parseTimestamp->toDate() |> expect |> toEqual(date)
    })
    test("now", () => {
      let dateNow = Js.Date.make()
      let dayNow = now()
      dayNow->toDate() |> expect |> toEqual(dateNow)
    })
    test("parsable", () => {
      // Day.js treats dayjs(undefined) as dayjs()
      Parsable(Js.undefined)->parse |> expect |> toEqual(now())
    })
    test("unix", () => {
      let timestamp = 1318781876.
      unix(timestamp)->toDate() |> expect |> toEqual(Js.Date.fromFloat(timestamp *. 1000.))
    })
    test("clone", () => {
      let day = now()
      day->clone() |> expect |> toEqual(day)
    })
    test("isValid return true", () => {
      now()->isValid() |> expect |> toBeTruthy
    })
    test("isValid return true", () => {
      Parsable(Js.null)->parse->isValid() |> expect |> toBeFalsy
    })
  })
  describe("Get + Set", () => {
    test("setMillisecond", () => {
      now()->setMillisecond(30.)->toDate()->Js.Date.getMilliseconds |> expect |> toEqual(30.)
    })
    test("setSecond", () => {
      now()->setSecond(30.)->toDate()->Js.Date.getSeconds |> expect |> toEqual(30.)
    })
    test("setMinute", () => {
      now()->setMinute(30.)->toDate()->Js.Date.getMinutes |> expect |> toEqual(30.)
    })
    test("setHour", () => {
      now()->setHour(12.)->toDate()->Js.Date.getHours |> expect |> toEqual(12.)
    })
    test("setDate", () => {
      now()->setDate(1.)->toDate()->Js.Date.getDate |> expect |> toEqual(1.)
    })
    test("setMonth", () => {
      now()->setMonth(1.)->toDate()->Js.Date.getMonth |> expect |> toEqual(1.)
    })
    test("setDay", () => {
      now()->setDay(1.)->toDate()->Js.Date.getDay |> expect |> toEqual(1.)
    })
    test("setYear", () => {
      now()->setYear(2021.)->toDate()->Js.Date.getFullYear |> expect |> toEqual(2021.)
    })

    test("millisecond", () => {
      parseString("2021-10-11T12:01:02.100")->millisecond() |> expect |> toEqual(100.)
    })
    test("Second", () => {
      parseString("2021-10-11T12:01:02.100")->second() |> expect |> toEqual(2.)
    })
    test("minute", () => {
      parseString("2021-10-11T12:01:02.100")->minute() |> expect |> toEqual(1.)
    })
    test("hour", () => {
      parseString("2021-10-11T12:01:02.100")->hour() |> expect |> toEqual(12.)
    })
    test("date", () => {
      parseString("2021-10-11T12:01:02.100")->date() |> expect |> toEqual(11.)
    })
    test("month", () => {
      parseString("2021-10-11T12:01:02.100")->month() |> expect |> toEqual(9.)
    })
    test("day", () => {
      parseString("2021-10-11T12:01:02.100")->day() |> expect |> toEqual(1.)
    })
    test("year", () => {
      parseString("2021-10-11T12:01:02.100")->year() |> expect |> toEqual(2021.)
    })
    test("when value is not integer", () => {
      now()->setHour(10.9->Obj.magic)->hour() |> expect |> toEqual(10.)
    })
  })

  describe("Manipulate", () => {
    test("add", () => {
      let d = parseString("2021-10-11")
      d->add(1., #day) |> expect |> toEqual(parseString("2021-10-12"))
    })
    test("subtract", () => {
      let d = parseString("2021-10-11")
      d->subtract(1., #day) |> expect |> toEqual(parseString("2021-10-10"))
    })
    test("add and subtract", () => {
      let d = now()
      d->add(1., #day)->subtract(1., #day) |> expect |> toEqual(d)
    })
    test("startOf", () => {
      let d = parseString("2021-10-11T12:01:02.100")
      d->startOf(#hour)->minute() |> expect |> toEqual(0.)
    })
    test("endOf", () => {
      let d = parseString("2021-10-11T12:01:02.100")
      d->endOf(#hour)->minute() |> expect |> toEqual(59.)
    })
  })

  describe("Display", () => {
    test("formatDefault", () => {
      let d = parseString("2021-10-11T12:01:02.100")
      d->formatDefault() |> expect |> toEqual("2021-10-11T12:01:02+08:00")
    })
    test("format", () => {
      let d = parseString("2021-10-11T12:01:02.100")
      d->format("YYYY/MM/DD HH:mm:ss") |> expect |> toEqual("2021/10/11 12:01:02")
    })
    test("diffDefault", () => {
      let d = now()
      d->add(10., #millisecond)->diffDefault(d) |> expect |> toEqual(10.)
    })
    test("diff", () => {
      let d = now()
      d->add(10., #minute)->diff(d, #minute) |> expect |> toEqual(10.)
    })
    test("diffWithPrecision", () => {
      let d = now()
      d->add(10.8, #minute)->diffWithPrecision(d, #minute, true) |> expect |> toEqual(10.8)
    })

    test("valueOf", () => {
      parseString("2021-10-11T12:01:02.100Z")->valueOf() |> expect |> toEqual(1633953662100.)
    })

    test("Days in Month: daysInMonth", () => {
      parseString("2019-01-25")->daysInMonth() |> expect |> toEqual(31)
    })
    test("toDate", () => {
      parseString("2021-10-11T12:01:02.100")->toDate()
      |> expect
      |> toEqual(Js.Date.fromString("2021-10-11T12:01:02.100"))
    })
    test("toJSON", () => {
      let d = parseString("2021-10-11T12:01:02.100Z")
      d->toJSON() |> expect |> toEqual(d->toDate()->Js.Date.toISOString)
    })
    test("toISOString", () => {
      let d = parseString("2021-10-11T12:00:00.000Z")
      d->toISOString() |> expect |> toEqual(d->toDate()->Js.Date.toISOString)
    })
    test("toString", () => {
      let d = parseString("2021-10-11T12:00:00.000Z")
      d
      ->toString()
      ->parseString
      // toString will neglect millisecond, so i need to set it to pass the test
      ->setMillisecond(0.)
      |> expect
      |> toEqual(d)
    })
  })
  describe("Query", () => {
    test("isBefore", () => {
      let d = parseString("2021-10-11T12:00:00.000")
      d->isBefore(d->add(1., #millisecond)) |> expect |> toBeTruthy
    })
    test("isBeforeBy return false", () => {
      let d = now()
      d->isBeforeBy(d->add(1., #millisecond), #minute) |> expect |> toBeFalsy
    })
    test("isBeforeBy return true", () => {
      let d = now()
      d->isBeforeBy(d->add(1., #minute), #minute) |> expect |> toBeTruthy
    })
    test("isAfter", () => {
      let d = now()
      d->isAfter(d->subtract(1., #millisecond)) |> expect |> toBeTruthy
    })
    test("isAfterBy return false", () => {
      let d = now()
      d->isAfterBy(d->subtract(1., #millisecond), #minute) |> expect |> toBeFalsy
    })
    test("isAfterBy return true", () => {
      let d = now()
      d->isAfterBy(d->subtract(1., #minute), #minute) |> expect |> toBeTruthy
    })
    test("isSame return true", () => {
      let d = now()
      d->isSame(d->clone()) |> expect |> toBeTruthy
    })
    test("isSame return false", () => {
      let d = now()
      d->isSame(d->add(1., #millisecond)) |> expect |> toBeFalsy
    })
    test("isSameBy return true", () => {
      let d = now()
      d->isSameBy(d->add(1., #millisecond), #minute) |> expect |> toBeTruthy
    })
    test("isDayjs", () => {
      let d = now()
      Parsable(d)->isDayjs |> expect |> toBeTruthy
    })
    test("isDayjs", () => {
      let d = Js.Date.make()
      Parsable(d)->isDayjs |> expect |> toBeFalsy
    })
  })
})
