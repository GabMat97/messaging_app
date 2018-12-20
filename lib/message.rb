class Message

attr_reader :content, :time

def initialize(content)
  @content = content
  @time = Time.now
end
end
