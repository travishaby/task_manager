class Task
  attr_accessor :id,
                :title,
                :description

  def initialize(data)
    @id          = data[:id]
    @title       = data[:title]
    @description = data[:description]
  end
end
