class Trix.LocationRange
  @create: (start, end) ->
    if start instanceof this
      start
    else
      new this start, end

  constructor: (@start, @end) ->
    @end ?= @start
    {@index, @offset} = @start

  isCollapsed: ->
    @start.index is @end.index and @start.offset is @end.offset

  isInSingleIndex: ->
    @start.index is @end.index

  eachIndex: (callback) ->
    callback(index) for index in [@start.index..@end.index]

  collapse: ->
    @end = @start
    this

  toArray: ->
    [@start, @end]

  toJSON: ->
    if @isCollapsed()
      @start
    else
      @toArray()