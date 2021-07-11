@module
external plugin: Day.plugin = "dayjs/plugin/timezone"

let require = %raw(`function() {
  return require("dayjs/plugin/timezone")
}`)

@module("dayjs")
external tzFromString: (string, string) => Day.dayjs = "tz"

@send
external tz: (Day.dayjs, string) => Day.dayjs = "tz"
