@module
external plugin: Day.plugin = "dayjs/plugin/QuarterOfYear"

module Impl = {
  @send external quarter: (Day.dayjs, unit) => float = "quarter"
  @send external setQuarter: (Day.dayjs, float) => Day.dayjs = "quarter"

  let _quarter = #quarter
}

include Impl
