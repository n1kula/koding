remote = require 'app/remote'

module.exports = CheckClonedStackTemplateExist = (stackTemplate) ->
  return no  unless stackTemplate

  originalStackTemplateId = stackTemplate.config?.clonedFrom

  return no  unless originalStackTemplateId
  remote.api.JStackTemplate.one { _id: originalStackTemplateId }, (err, template) ->
    return yes  if template
    return no
