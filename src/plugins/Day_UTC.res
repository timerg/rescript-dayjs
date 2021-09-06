@module
external plugin: Day.plugin = "dayjs/plugin/utc"

module Impl = {
  @module("dayjs") external utc: unit => Day.dayjs = "utc"
  @send external asUtc: (Day.dayjs, unit) => Day.dayjs = "utc"
  @send external utcOffset: (Day.dayjs, unit) => Day.dayjs = "utcOffset"
  @send external local: (Day.dayjs, unit) => Day.dayjs = "local"
  @send external isUTC: Day.dayjs => bool = "isUTC"
  // should extend CustomParseFormat plugin
  @module("dayjs") external parseUtc: (~input: string, ~format: string) => Day.dayjs = "utc"
}

include Impl
