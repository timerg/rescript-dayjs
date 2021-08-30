// Work inprogress

type locale

@val @module
external en: locale = "dayjs/locale/en"

@val @module
external de: locale = "dayjs/locale/de"

@val @module
external es: locale = "dayjs/locale/es"

module Impl = {
  @send external use: (Day.dayjs, string) => Day.dayjs = "locale"
  @module("dayjs") external setGlobalLocale: string => unit = "locale"
  @send external setLocale: (Day.dayjs, string) => Day.dayjs = "locale"

  @module("dayjs") external getLocale: unit => string = "locale"
}

module Use = (
  _: {
    // this help you not forget to load locale locally
    // https://day.js.org/docs/en/i18n/changing-locale#docsNav
    let locales: array<locale>
  },
) => {
  include Impl
}

include Impl
