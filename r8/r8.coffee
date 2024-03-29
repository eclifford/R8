((root, factory) ->
  if typeof define is "function" and define.amd
    # AMD. Register as an anonymous module.
    define [], factory
  else   
    # Browser globals
    root.R8 = factory(root.b)
) this, () ->

  R8 = window.R8 =
    version: "0.0.1"

  #= api
  #= permissions
  #= core
  #= module



  # Just return a value to define the module export.
  # This example returns an object, but the module
  # can return a function as the exported value.
  return R8




# # Utility function watching for RequireJS errors
# # @ param err [String] the error 
# #
# require.onError = (err) ->
#   if err.requireType is 'timeout'
#     console.error "Could not load module #{err.requireModules}"
#   else
#     failedId = err.requireModules && err.requireModules[0]
#     require.undef failedId
#     throw err