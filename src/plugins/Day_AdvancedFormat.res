@module
external plugin: Day.plugin = "dayjs/plugin/advancedFormat"

module Use = (
  Day: {
    let extend: Day.plugin => unit
  },
) => {
  Day.extend(plugin)
}
