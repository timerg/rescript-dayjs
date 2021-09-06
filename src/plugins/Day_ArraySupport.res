@module
external plugin: Day.plugin = "dayjs/plugin/arraySupport"

module Impl = {
  @module
  external parseArray: array<float> => Day.dayjs = "dayjs"
}

include Impl
