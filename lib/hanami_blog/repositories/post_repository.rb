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
    aggregate(:comments).to_a
    #all
  end

  def create_dummy_posts
    1000.times do
      words = "Eat and than sleep on your face purrr purr littel cat, little cat purr purr cats go for world domination Cat ipsum dolor sit amet, when in doubt, wash put toy mouse in food bowl run out of litter box at full speed sweet beast who's the baby. Eat grass, throw it back up sleep on dog bed, force dog to sleep on floor yet jump launch to pounce upon little yarn mouse, bare fangs at toy run hide in litter box until treats are fed yet hack up furballs, put butt in owner's face, and lies down meow. Scamper slap kitten brother with paw but knock over christmas tree always hungry.".split(' ')

      create_with_comments(title: words.sample(20).shuffle.join(' '), body: words.shuffle.join(' '), author: words.sample(3).shuffle.join(' '), comments: [
        {
          author: words.sample(3).shuffle.join(' '),
          body: words.sample(30).shuffle.join(' ')
        },
        {
          author: words.sample(3).shuffle.join(' '),
          body: words.sample(30).shuffle.join(' ')
        },
        {
          author: words.sample(3).shuffle.join(' '),
          body: words.sample(30).shuffle.join(' ')
        }
      ])
    end
  end
end
