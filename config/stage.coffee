fs = require 'fs'
nodePath = require 'path'

deepFreeze = require 'koding-deep-freeze'

version = fs.readFileSync nodePath.join(__dirname, '../.revision'), 'utf-8'

# STAGING
mongo = 'koding_stage_user:dkslkds84ddj@localhost:38017/koding_stage?auto_reconnect'

module.exports = deepFreeze
  projectRoot   : nodePath.join __dirname, '..'
  version       : version
  webPort       : [3020..3030]
  mongo         : mongo
  runBroker     : no
  configureBroker: no
  buildClient   : no
  basicAuth     :
    username    : 'koding'
    password    : '314159'
  social        :
    numberOfWorkers: 10
  client        :
    version     : version
    minify      : no
    js          : "./website/js/kd.#{version}.js"
    css         : "./website/css/kd.#{version}.css"
    indexMaster : "./client/index-master.html"
    index       : "./website_nonstatic/index.html"
    closureCompilerPath: "./builders/closure/compiler.jar"
    includesFile: '../CakefileIncludes.coffee'
    useStaticFileServer: no
    staticFilesBaseUrl: 'https://dev-api.koding.com'
    runtimeOptions:
      version   : version
      mainUri   : 'https://dev.koding.com'
      broker    :
        apiKey  : 'a6f121a130a44c7f5325'
        sockJS  : 'https://mq.koding.com/subscribe'
        auth    : 'https://dev.koding.com/auth'
        vhost   : '/'
      apiUri    : 'https://dev-api.koding.com'
      appsUri   : 'http://dev-app.koding.com'
      env       : 'stage'
  mq            :
    host        : 'localhost'
    login       : 'test'
    password    : 'test'
    vhost       : '/'
    pidFile     : '/var/run/broker.pid'
  kites:
    disconnectTimeout: 3e3
  email         :
    host        : 'koding.com'
    protocol    : 'https:'
    defaultFromAddress: 'hello@koding.com'
  guests:
     # define this to limit the number of guset accounts
     # to be cleaned up per collection cycle.
    batchSize   : undefined
    cleanupCron : '*/10 * * * * *'
    poolSize    : 1e4
  logger        :
    mq          :
      host      : 'localhost'
      login     : 'stage'
      password  : '#[85_[*zh7%4;4l6T]F!'
      vhost     : 'stage-logs'
  pidFile       : '/tmp/koding.server.pid'