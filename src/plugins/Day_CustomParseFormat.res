@module
external plugin: Day.plugin = "dayjs/plugin/customParseFormat"

module Impl = {
  @module
  external parseCustom: (~input: string, ~format: string) => Day.dayjs = "dayjs"

  @module
  external parseCustomWithLocale: (~input: string, ~format: string, ~locale: string) => Day.dayjs =
    "dayjs"

  @module
  external parseCustomWithStrict: (~input: string, ~format: string, ~strict: bool) => Day.dayjs =
    "dayjs"
  @module
  external parseCustomWithLocaleStrict: (
    ~input: string,
    ~format: string,
    ~locale: string,
    ~strict: bool,
  ) => Day.dayjs = "dayjs"
}

include Impl
