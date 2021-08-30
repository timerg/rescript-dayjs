@module
external plugin: Day.plugin = "dayjs/plugin/isoWeek"

module Impl = {
  @send external isoWeek: (Day.dayjs, unit) => float = "isoWeek"
  @send external setIsoWeek: (Day.dayjs, float) => Day.dayjs = "isoWeek"
  @send external isoWeekday: (Day.dayjs, unit) => float = "isoWeekday"
  @send external setIsoWeekday: (Day.dayjs, float) => Day.dayjs = "isoWeekday"
  @send external isoWeekYear: (Day.dayjs, unit) => float = "isoWeekYear"
  @send external setIsoWeekYear: (Day.dayjs, float) => Day.dayjs = "isoWeekYear"

  let _isoWeek = #isoWeek
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
