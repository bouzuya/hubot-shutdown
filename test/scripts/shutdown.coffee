{Robot, User, TextMessage} = require 'hubot'
assert = require 'power-assert'
path = require 'path'
sinon = require 'sinon'

describe 'shutdown', ->
  beforeEach (done) ->
    @sinon = sinon.sandbox.create()
    # for warning: possible EventEmitter memory leak detected.
    # process.on 'uncaughtException'
    @sinon.stub process, 'on', -> null
    @robot = new Robot(path.resolve(__dirname, '..'), 'shell', false, 'hubot')
    @robot.adapter.on 'connected', =>
      @robot.load path.resolve(__dirname, '../../src/scripts')
      setTimeout done, 10 # wait for parseHelp()
    @robot.run()

  afterEach (done) ->
    @robot.brain.on 'close', =>
      @sinon.restore()
      done()
    @robot.shutdown()

  describe 'listeners[0].regex', ->
    describe 'valid patterns', ->
      beforeEach ->
        @tests = [
          message: '@hubot shutdown'
          matches: ['@hubot shutdown']
        ]

      it 'should match', ->
        @tests.forEach ({ message, matches }) =>
          callback = @sinon.spy()
          @robot.listeners[0].callback = callback
          sender = new User 'bouzuya', room: 'hitoridokusho'
          @robot.adapter.receive new TextMessage(sender, message)
          actualMatches = callback.firstCall.args[0].match.map((i) -> i)
          assert callback.callCount is 1
          assert.deepEqual actualMatches, matches

  describe 'listeners[0].callback', ->
    beforeEach ->
      @hello = @robot.listeners[0].callback

    describe 'receive "@hubot shutdown"', ->
      beforeEach ->
        @send = @sinon.spy()
        @shutdown = @sinon.spy()
        @hello
          match: ['@hubot shutdown']
          send: @send
          robot:
            shutdown: @shutdown

      it 'send "See you!" and shutdown', ->
        assert @send.callCount is 1
        assert @send.firstCall.args[0] is 'See you!'
        assert @shutdown.callCount is 1

  describe 'robot.helpCommands()', ->
    it 'should be ["hubot shutdown - graceful shutdown"]', ->
      assert.deepEqual @robot.helpCommands(), [
        "hubot shutdown - graceful shutdown"
      ]
