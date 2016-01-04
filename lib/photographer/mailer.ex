defmodule Photographer.Mailer do
  use Mailgun.Client,
  domain: Application.get_env(:photographer, :mailgun_domain),
  key: Application.get_env(:photographer, :mailgun_key)

  def send_message_email(name, message) do
    send_email to: Application.get_env(:photographer, :recepient_email),
    from: "noreply@example.com",
    subject: "New message from Evgeniia site!",
    text: "Name: #{name} Message: #{message}"
  end
end
