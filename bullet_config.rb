config.after_initialize do
    Bullet.enable = true
    Bullet.alert = true
    Bullet.bullet_logger = true
    Bullet.console = true
    Bullet.growl = false
    # Bullet.xmpp = { account: 'bullets_account@jabber.org',
    #                 password: 'bullets_password_for_jabber',
    #                 receiver: 'your_account@jabber.org',
    #                 show_online_status: true }
    Bullet.rails_logger = true
    Bullet.honeybadger = true
    Bullet.bugsnag = true
    Bullet.airbrake = true
    Bullet.rollbar = true
    Bullet.add_footer = true
    # Bullet.stacktrace_includes = [ 'your_gem', 'your_middleware' ]
    # Bullet.stacktrace_excludes = [ 'their_gem', 'their_middleware' ]
    # Bullet.slack = { webhook_url: 'http://some.slack.url', channel: '#default', username: 'notifier' }
   
    # Each of these settings defaults to true

    # Detect N+1 queries
    # Bullet.n_plus_one_query_enable     = false

    # Detect eager-loaded associations which are not used
    # Bullet.unused_eager_loading_enable = false

    # Detect unnecessary COUNT queries which could be avoided
    # with a counter_cache
    # Bullet.counter_cache_enable        = false
  end
