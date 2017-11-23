module Web::Controllers::Home
  class Create
    include Web::Action

    def call(params)
      PostRepository.new.create_dummy_posts
    end
  end
end
