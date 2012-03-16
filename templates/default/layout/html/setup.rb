include Helpers::FilterHelper

def init
  @page_title = options[:title]
  super
end

def index
  legitimate_objects = @objects.select { |o| o.has_tag?('url') }
  @topics = {}

  legitimate_objects.each do |object|
    object.tags('topic').each { |topic| (@topics[topic.text] ||= []) << object }
  end

  @resources = legitimate_objects.sort_by {|o| o.tags('url').first.text }

  @overall_objects = @objects.find_all {|o| o.has_tag?('overall')}.sort_by {|o| o.tag('overall').text}
  super
end
