module SlackNotifier
  NOTIFIER = Slack::Notifier.new "#{ENV['SLACK_NOTIFIER_WEEBHOOK']}" do
    defaults channel: "#geral",
             username: "notificação"
  end
end
