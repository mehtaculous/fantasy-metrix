require 'faker'


# Create Users
8.times do
user = User.new(
  username: Faker::Name.name,
  email:    Faker::Internet.email,
  password: Faker::Lorem.characters(10)
)
user.skip_confirmation!
user.save!
end
users = User.all

# Create Admin User
admin = User.new(
  username: 'Admin',
  email:    'admin@example.com',
  password: 'password',
  role:     'admin'
)
admin.skip_confirmation!
admin.save!
 
# Create Standard User
standard = User.new(
  username: 'Sahil',
  email:    'samehta91@gmail.com',
  password: 'password'
)
standard.skip_confirmation!
standard.save!


# Create Articles
24.times do
  Article.create!(
    user: users.sample,
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraphs(30),
    image_path: Faker::Avatar.image
  )
end
articles = Article.all


# Create Teams
Team.create!(name: 'Buffalo Bills', image_path: 'buffalo/bills.png')
Team.create!(name: 'Miami Dolphins', image_path: 'miami/dolphins.png')
Team.create!(name: 'New England Patriots', image_path: 'new_england/patriots.png')
Team.create!(name: 'New York Jets', image_path: 'new_york_jets/jets.png')
Team.create!(name: 'Baltimore Ravens', image_path: 'baltimore/ravens.png')
Team.create!(name: 'Cincinnati Bengals', image_path: 'cincinnati/bengals.png')
Team.create!(name: 'Cleveland Browns', image_path: 'cleveland/browns.png')
Team.create!(name: 'Pittsburgh Steelers', image_path: 'pittsburgh/steelers.png')
Team.create!(name: 'Houston Texans', image_path: 'houston/texans.png')
Team.create!(name: 'Indianapolis Colts', image_path: 'indianapolis/colts.png')
Team.create!(name: 'Jacksonville Jaguars', image_path: 'jacksonville/jaguars.png')
Team.create!(name: 'Tennessee Titans', image_path: 'tennessee/titans.png')
Team.create!(name: 'Denver Broncos', image_path: 'denver/broncos.png')
Team.create!(name: 'Kansas City Chiefs', image_path: 'kansas_city/chiefs.png')
Team.create!(name: 'Oakland Raiders', image_path: 'oakland/raiders.png')
Team.create!(name: 'San Diego Chargers', image_path: 'san_diego/chargers.png')
Team.create!(name: 'Dallas Cowboys', image_path: 'dallas/cowboys.png')
Team.create!(name: 'New York Giants', image_path: 'new_york_giants/giants.png')
Team.create!(name: 'Philadelphia Eagles', image_path: 'philadelphia/eagles.png')
Team.create!(name: 'Washington Redskins', image_path: 'washington/redskins.png')
Team.create!(name: 'Chicago Bears', image_path: 'chicago/bears.png')
Team.create!(name: 'Detroit Lions', image_path: 'detroit/lions.png')
Team.create!(name: 'Green Bay Packers', image_path: 'green_bay/packers.png')
Team.create!(name: 'Minnesota Vikings', image_path: 'minnesota/vikings.png')
Team.create!(name: 'Atlanta Falcons', image_path: 'atlanta/falcons.png')
Team.create!(name: 'Carolina Panthers', image_path: 'carolina/panthers.png')
Team.create!(name: 'New Orleans Saints', image_path: 'new_orleans/saints.png')
Team.create!(name: 'Tampa Bay Buccaneers', image_path: 'tampa_bay/buccaneers.png')
Team.create!(name: 'Arizona Cardinals', image_path: 'arizona/cardinals.png')
Team.create!(name: 'San Francisco 49ers', image_path: 'san_francisco/niners.png')
Team.create!(name: 'Seattle Seahawks', image_path: 'seattle/seahawks.png')
Team.create!(name: 'St. Louis Rams', image_path: 'st_louis/rams.png')
teams = Team.all


# Create Topics
Topic.create!(name: 'SLEEPERS', image_path: Faker::Avatar.image)
Topic.create!(name: 'DYNASTY', image_path: Faker::Avatar.image)
Topic.create!(name: 'INJURIES', image_path: Faker::Avatar.image)
Topic.create!(name: 'WAIVER WIRE', image_path: Faker::Avatar.image)
Topic.create!(name: 'START / SIT', image_path: Faker::Avatar.image)
Topic.create!(name: 'TRADE ADVICE', image_path: Faker::Avatar.image)
topics = Topic.all

# Create Posts
250.times do
  Post.create!(
    user:  users.sample,
    topic: topics.sample,
    title: Faker::Lorem.sentence,
    body:  Faker::Lorem.paragraph
  )
end
posts = Post.all
 
# Create Comments
1000.times do
  Comment.create!(
    post: posts.sample,
    user: users.sample,
    body: Faker::Lorem.paragraph
  )
end


puts "Seed finished"
puts "#{User.count} users created"
puts "#{Article.count} articles created"
puts "#{Team.count} teams created"
puts "#{Topic.count} topics created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"