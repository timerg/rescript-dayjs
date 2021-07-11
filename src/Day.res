type dayjs

// Parse
@unboxed
type rec parsable = Parsable('a): parsable

@module external parse: parsable => dayjs = "dayjs"

@module external parseString: string => dayjs = "dayjs"

@module external parseJsDate: Js.Date.t => dayjs = "dayjs"

@module external parseTimestamp: float => dayjs = "dayjs"

@module external now: unit => dayjs = "dayjs"

@module("dayjs") external unix: float => dayjs = "unix"

@send external clone: (dayjs, unit) => dayjs = "clone"

@send external isValid: (dayjs, unit) => bool = "isValid"

// Get + Set
@send external millisecond: (dayjs, unit) => float = "millisecond"
@send external second: (dayjs, unit) => float = "second"
@send external minute: (dayjs, unit) => float = "minute"
@send external hour: (dayjs, unit) => float = "hour"
@send external date: (dayjs, unit) => float = "date"
@send external day: (dayjs, unit) => float = "day"
@send external month: (dayjs, unit) => float = "month"
@send external year: (dayjs, unit) => float = "year"

@send external setMillisecond: (dayjs, float) => dayjs = "millisecond"
@send external setSecond: (dayjs, float) => dayjs = "second"
@send external setMinute: (dayjs, float) => dayjs = "minute"
@send external setHour: (dayjs, float) => dayjs = "hour"
@send external setDate: (dayjs, float) => dayjs = "date"
@send external setDay: (dayjs, float) => dayjs = "day"
@send external setMonth: (dayjs, float) => dayjs = "month"
@send external setYear: (dayjs, float) => dayjs = "year"

type basicUnits = [
  | #month
  | #year
  | #hour
  | #minute
  | #second
  | #millisecond
]

@send
external get: (dayjs, [basicUnits | #date | #day]) => float = "get"

@send
external set: (
  dayjs,
  [
    | basicUnits
    | #date
    | #day
  ],
  float,
) => dayjs = "set"

// Manipulate
@send
external add: (
  dayjs,
  float,
  [
    | basicUnits
    | #day
    | #week
  ],
) => dayjs = "add"

@send
external subtract: (dayjs, float, [basicUnits | #week | #day]) => dayjs = "subtract"

@send
external startOf: (
  dayjs,
  [
    | basicUnits
    | #week
    | #date
    | #day
  ],
) => dayjs = "startOf"

@send
external endOf: (
  dayjs,
  [
    | basicUnits
    | #week
    | #date
    | #day
  ],
) => dayjs = "endOf"

// Display
@send external formatDefault: (dayjs, unit) => string = "format"
@send external format: (dayjs, string) => string = "format"

// default is milliseconds
@send
external diffDefault: (dayjs, dayjs) => float = "diff"
@send
external diff: (dayjs, dayjs, [basicUnits | #day | #week]) => float = "diff"
@send
external diffWithPrecision: (
  dayjs,
  dayjs,
  [basicUnits | #day | #week],
  bool /* should pass true to use float */,
) => float = "diff"

// return type use float to prevent compiler warning: 'Integer literal exceeds the range of representable integers of type int'
@send
external valueOf: (dayjs, unit) => float = "valueOf"

@send
external daysInMonth: (dayjs, unit) => int = "daysInMonth"

@send external toDate: (dayjs, unit) => Js.Date.t = "toDate"

@send external toJSON: (dayjs, unit) => string = "toJSON"

@send external toISOString: (dayjs, unit) => string = "toISOString"

@send external toString: (dayjs, unit) => string = "toString"

// Query
@send
external isBefore: (dayjs, dayjs) => bool = "isBefore"

@send
external isBeforeBy: (dayjs, dayjs, [basicUnits | #date | #day]) => bool = "isBefore"

@send
external isBeforeParsableBy: (dayjs, parsable, [basicUnits | #date | #day]) => bool = "isBefore"

@send
external isAfter: (dayjs, dayjs) => bool = "isAfter"

@send
external isAfterBy: (dayjs, dayjs, [basicUnits | #date | #day]) => bool = "isAfter"

@send
external isAfterParsableBy: (dayjs, parsable, [basicUnits | #date | #day]) => bool = "isAfter"

@send
external isSame: (dayjs, dayjs) => bool = "isSame"

@send
external isSameBy: (dayjs, dayjs, [basicUnits | #date | #day]) => bool = "isSame"

@send
external isSameParsableBy: (dayjs, parsable, [basicUnits | #date | #day]) => bool = "isSame"

@module("dayjs")
external isDayjs: parsable => bool = "isDayjs"

// you should bind your own plugin
// https://day.js.org/docs/en/i18n/i18n
type plugin

// extend
@module("dayjs")
external extend: plugin => unit = "extend"
