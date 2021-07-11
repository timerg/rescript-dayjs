@module
external plugin: Day.plugin = "dayjs/plugin/utc"

let require = %raw(`function() {
  return require("dayjs/plugin/utc")
}`)
