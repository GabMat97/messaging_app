require 'message'

RSpec.describe Message do

  let (:message_text) { double(:message_text) }
  it 'stores text' do
  message = Message.new(message_text)
  expect(message.content).to eq message_text
end
end
