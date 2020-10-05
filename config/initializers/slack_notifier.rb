module SlackNotifier
  NOTIFIER = Slack::Notifier.new "https://hooks.slack.com/services/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" do
    defaults channel: "#geral",
             username: "notificação"
  end
end
