module Web::Controllers::Home
  class Index
    include Web::Action

    expose :posts

    def call(params)
      @posts = PostRepository.new.all_with_comments
    end
  end
end
