# rescript-dayjs
This is [Rescript](https://rescript-lang.org/docs/manual/latest/api) binding for [Dayjs](https://day.js.org/en/). While the bindings for Plugins are still work in progress, it should be enough in most circumstances.

## Install
```
yarn add @ggteven/rescript-dayjs
or
npm install @ggteven/rescript-dayjs
```
Add rescript-dayjs to `bs-dependencies`
```
"bs-dependencies": [
    ...
    "@ggteven/rescript-dayjs"
  ],
```

## Example
You can find usage exmples in the `test` folder


## Plugins
While bindings for many plugins are still work inprogress, you can bind your own plugin and give it a `plugin` type. Then give it to the extend function. All should happen in a same file
```
@module
external plugin: Day.plugin = "dayjs/plugin/isToday"
@send
external isToday: (Day.dayjs, unit) => bool = "isToday"
Day.extend(plugin)

Day.now()->isToday // true
```

Check [Dayjs documentation](https://day.js.org/docs/en/installation/installation) for available props.
