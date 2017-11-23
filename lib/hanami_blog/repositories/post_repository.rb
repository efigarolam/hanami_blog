class PostRepository < Hanami::Repository
  associations do
    has_many :comments
  end

  def create_with_comments(data)
    assoc(:comments).create(data)
  end

  def find_with_comments(id)
    aggregate(:comments).where(id: id).as(Post).one
  end

  def all_with_comments
    aggregate(:comments).as(Post).to_a
  end
end
