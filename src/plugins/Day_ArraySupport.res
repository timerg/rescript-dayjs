@module
external plugin: Day.plugin = "dayjs/plugin/arraySupport"

module Impl = {
  @module
  external parseArray: array<float> => Day.dayjs = "dayjs"
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
