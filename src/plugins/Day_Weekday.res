@module
external plugin: Day.plugin = "dayjs/plugin/weekday"

module Impl = {
  @send external weekday: (Day.dayjs, unit) => float = "weekday"
  @send external setWeekday: (Day.dayjs, float) => Day.dayjs = "weekday"
}

module Use = (
  Day: {
    let extend: Day.plugin => unit
  },
) => {
  Day.extend(plugin)
  include Impl
}

include Impl
