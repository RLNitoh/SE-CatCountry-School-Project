# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# all users for DB
Alex = User.create!(
   userID: '1',
   userName: 'Alex',
   email: 'alex.taylor@email.com',
   password: 'Alex1234',
   dateRegistered: '4-12-2022',
   about: 'I am alex',
   reportCount: 0
)
Alex.user_image.attach(io: File.open(Rails.root.join('app/assets/images/Lion.jpeg')),
filename: 'Lion.jpeg')

Hunter = User.create!(
   userID: '2',
   userName: 'Hunter',
   email: 'HunterGatherer@email.com',
   password: 'Hunter1234',
   dateRegistered: '4-12-2022',
   about: 'I am Hunter',
   reportCount: 0
)

Hunter.user_image.attach(io: File.open(Rails.root.join('app/assets/images/LionZoo.jpeg')),
filename: 'LionZoo.jpeg')

Matt = User.create!(
   userID: '3',
   userName: 'Matt',
   email: 'matt@email.com',
   password: 'password',
   dateRegistered: '4-12-2022',
   about: 'I am Matt',
   reportCount: 0
)

Matt.user_image.attach(io: File.open(Rails.root.join('app/assets/images/RedPanda.jpeg')),
filename: 'RedPanda.jpeg')

Blan = User.create!(
   userID: '4',
   userName: 'Blan',
   email: 'BLANka.StreetFighter@email.com',
   password: 'Blan1234',
   dateRegistered: '4-12-2022',
   about: 'I am Blan',
   reportCount: 0
)

Blan.user_image.attach(io: File.open(Rails.root.join('app/assets/images/TigersSpace.jpeg')),
filename: 'TigersSpace.jpeg')

#all posts per user

p1 = Post.create!(
    postID: '1',
    userID: '1', #belongs to Alex
    title: 'Today was a good day!',
    content: 'I saw a Lion today!',
    date: Date.new(2022, 4, 15),
    isPublic: true,
    creator: Alex,
    likes: '5'
)
p1.post_image.attach(io: File.open(Rails.root.join('app/assets/images/LionZoo.jpeg')),
filename: 'LionZoo.jpeg')

Post.create!(
    postID: '2',
    userID: '1', #belongs to Alex
    title: 'I got mauled by a tiger...',
    content: 'See the scars I hold in my chest? Tiger uppercut',
    date: Date.new(2022, 4, 20),
    isPublic: false,
    creator: Alex,
    likes: '25'
)
Post.create!(
    postID: '3',
    userID: '2', #belongs to Hunter
    title: 'Check out the Zoo!',
    content: 'Sure wish there were hairless cats here...',
    date: Date.new(2022, 4, 5),
    isPublic: true,
    creator: Hunter,
    likes: '1'
)
p4 = Post.create!(
    postID: '4',
    userID: '2', #belongs to Hunter
    title: 'Cheers',
    content: 'Gave a red panda a coors light today. That illegal?',
    date: Date.new(2022, 3, 7),
    isPublic: false,
    creator: Hunter,
    likes: '5'
)
p4.post_image.attach(io: File.open(Rails.root.join('app/assets/images/RedPandaZoo.jpeg')),
filename: 'RedPandaZoo.jpeg')

Post.create!(
    postID: '5',
    userID: '3', #belongs to Matt
    title: 'Cats in the sun',
    content: 'Liger is my spirit animal',
    date: Date.new(1902, 4, 15),
    isPublic: true,
    creator: Matt,
    likes: '100'
)
p6 = Post.create!(
    postID: '6',
    userID: '3', #belongs to Matt
    title: '$9 for a cheeseburger?',
    content: 'The zoo is trying to rip you off with high prices! Time to revolt! Viva La Resistonce',
    date: Date.new(2025, 4, 15),
    isPublic: false,
    creator: Matt,
    likes: '0'
)
p6.post_image.attach(io: File.open(Rails.root.join('app/assets/images/RipOff.jpeg')),
filename: 'RipOff.jpeg')

Post.create!(
    postID: '7',
    userID: '4', #belongs to Blan
    title: 'Red pandas are cats?',
    content: 'Are they though? Why are they in cat country on the website?',
    date: '[REDACTED]',
    isPublic: true,
    creator: Blan,
    likes: '42'
)

p8 = Post.create!(
    postID: '8',
    userID: '4', #belongs to Blan
    title: 'Tigers in Space',
    content: 'Just thought of the best idea.... Tigers.... but in space!',
    date: Date.new(3022, 4, 15),
    isPublic: false,
    creator: Blan,
    likes: '2'
)
p8.post_image.attach(io: File.open(Rails.root.join('app/assets/images/TigersSpace.jpeg')),
filename: 'TigersSpace.jpeg')

# some games used for testing

Game.create!(
    CatName: "Alex",
    CatNameDistractor1: "Skipper",
    CatNameDistractor2: "Julien",
    CatNameDistractor3: "Melman",
    NameAnswer: "",
    CatOrigin: "Africa",
    CatOriginDistractor1: "North America",
    CatOriginDistractor2: "Europe",
    CatOriginDistractor3: "Australia",
    OriginAnswer: "",
    CatPicture: "Lion.jpeg",
    GameID: 1    
)
Game.create!(
    CatName: "Rojo",
    CatNameDistractor1: "Azul",
    CatNameDistractor2: "Verde",
    CatNameDistractor3: "Amarillo",
    NameAnswer: "",
    CatOrigin: "Asia",
    CatOriginDistractor1: "Africa",
    CatOriginDistractor2: "Australia",
    CatOriginDistractor3: "South America",
    OriginAnswer: "",
    CatPicture: "RedPanda.jpeg",
    GameID: 2    
)
