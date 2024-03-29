Util = R8.Util =

  # Object Helpers
  # --------------

  # Prototypal delegation. Create an object which delegates
  # to another object.
  beget: do ->
    if typeof Object.create is 'function'
      Object.create
    else
      ctor = ->
      (obj) ->
        ctor:: = obj
        new ctor

  # Make properties readonly and not configurable
  # using ECMAScript 5 property descriptors
  readonly: do ->
    if support.propertyDescriptors
      readonlyDescriptor =
        writable: false
        enumerable: true
        configurable: false
      (obj, properties...) ->
        for prop in properties
          readonlyDescriptor.value = obj[prop]
          Object.defineProperty obj, prop, readonlyDescriptor
        true
    else
      ->
        false

  # String Helpers
  # --------------

  # Upcase the first character
  upcase: (str) ->
    str.charAt(0).toUpperCase() + str.substring(1)

  # underScoreHelper -> under_score_helper
  underscorize: (string) ->
    string.replace /[A-Z]/g, (char, index) ->
      (if index isnt 0 then '_' else '') + char.toLowerCase()