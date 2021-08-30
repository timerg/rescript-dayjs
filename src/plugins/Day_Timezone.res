@module
external plugin: Day.plugin = "dayjs/plugin/timezone"

module Impl = {
  @module("dayjs")
  external tzFromString: (string, string) => Day.dayjs = "tz"

  @send
  external tz: (Day.dayjs, string) => Day.dayjs = "tz"
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
