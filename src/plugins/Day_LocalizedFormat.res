@module
external plugin: Day.plugin = "dayjs/plugin/localizedFormat"

let require = %raw(`function() {
  return require("dayjs/plugin/localizedFormat")
}`)
