require "open-uri"

# Clearing db tables
puts "start - destroying all existing db records..."
Review.destroy_all
Book.destroy_all
User.destroy_all
Category.destroy_all

# Category
puts "creating category instances..."
category1 = Category.create(name: "SciFi")
category2 = Category.create(name: "Romance")
category3 = Category.create(name: "Thriller")
category4 = Category.create(name: "Horror")
category5 = Category.create(name: "Fantasy")
category6 = Category.create(name: "Biography")
category7 = Category.create(name: "Mistery")

# Images
puts "pulling some book covers from cloudinary..."
image1 = URI.parse("https://res.cloudinary.com/dovux98py/image/upload/v1748444148/Harry-Potter-und-die-Kammer-des-Schreckens-Harry-Potter-2_dw9mhw.jpg").open
image2 = URI.parse("https://res.cloudinary.com/dovux98py/image/upload/v1748444147/Harry-Potter-und-der-Stein-der-Weisen-Harry-Potter-1_tm1fqm.jpg").open
image3 = URI.parse("https://res.cloudinary.com/dovux98py/image/upload/v1748444145/Harry-Potter-und-der-Gefangene-von-Askaban-Harry-Potter-3_qr5ufw.jpg").open
image4 = URI.parse("https://res.cloudinary.com/dovux98py/image/upload/v1748444138/Harry-Potter-and-the-Prisoner-of-Azkaban_ms1xyd.jpg").open
image5 = URI.parse("https://res.cloudinary.com/dovux98py/image/upload/v1748444137/Harry-Potter-1-y-la-piedra-filosofal_h1yhkt.jpg").open
image6 = URI.parse("https://res.cloudinary.com/dovux98py/image/upload/v1748444138/Harry-Potter-and-the-Philosophers-Stone_cd8yyt.jpg").open

# User
puts "creating demo user..."
user1 = User.create!(email: "example@mail.com", password: "123456", full_name: "Edgar Allan Poe", address: "Boston, Massachusetts, United States")

# Creating books
puts "creating book instances..."
book1 = Book.create(title: "Harry Potter: Chamber of Secrets", description: "School is finally back! Only someone whose holidays were awful could let out such a sigh: Harry Potter. But like last school year, there's more to the program than just Potions and Transfiguration. Something horrible is wreaking havoc in the school.", author: "Rowling J.K.", category: category2, user: user1)
book2 = Book.create(title: "Harry Potter: Prisoner of Azkaban", description: "A spell with unexpected consequences. Of course, Harry knows that magic is strictly forbidden during the holidays, yet he casts a levitation spell on his horrible aunt.", author: "Rowling J.K.", category: category3, user: user1)
book3 = Book.create(title: "Harry Potter: Goblet of Fire", description: "A magical tournament and Voldemort on the rise. Harry's fourth year at Hogwarts begins and a competition keeps the students on edge: the Triwizard Tournament, in which Harry takes on a role he could never have imagined.", author: "Rowling J.K.", category: category4, user: user1)
book4 = Book.create(title: "Harry Potter: Order of the Phoenix", description: "Harry and his friends form up for battle. It's summer vacation, and once again Harry is stuck with the unspeakable Dursleys. But this time he's more worried than ever - why doesn't he learn anything about the dark forces that have recently arisen?", author: "Rowling J.K.", category: category5, user: user1)
book5 = Book.create(title: "Harry Potter: Half-Blood Prince", description: "Voldemort's Dark Past. Since Voldemort, the most dangerous Dark wizard of all time, returned, unrest and violence have reigned in the magical world.", author: "Rowling J.K.", category: category6, user: user1)
book6 = Book.create(title: "Harry Potter: Deathly Hallows", description: "The final battle between Harry and the Dark Lord. A return to Hogwarts is out of the question for Harry. He must do everything in his power to find the remaining Horcruxes. Only when they are destroyed can Voldemort's reign of terror end. ", author: "Rowling J.K.", category: category7, user: user1)

# Attaching images
puts "attaching book covers to books..."
book1.photo.attach(io: image1, filename: "book_cover.png", content_type: "image/png")
book2.photo.attach(io: image2, filename: "book_cover.png", content_type: "image/png")
book3.photo.attach(io: image3, filename: "book_cover.png", content_type: "image/png")
book4.photo.attach(io: image4, filename: "book_cover.png", content_type: "image/png")
book5.photo.attach(io: image5, filename: "book_cover.png", content_type: "image/png")
book6.photo.attach(io: image6, filename: "book_cover.png", content_type: "image/png")

# Reviews
puts "creating review instances..."
Review.create(content: "Great book! The condition of the book is also great!", rating: rand(1..5), user: user1)
Review.create(content: "I love this book! The condition of the book is also great!", rating: rand(1..5), user: user1)
Review.create(content: "Nice", rating: rand(1..5), user: user1)
Review.create(content: "Not bad", rating: rand(1..5), user: user1)
Review.create(content: "I love this book, would definitely borrow more", rating: rand(1..5), user: user1)
Review.create(content: "Nice experience, I will borrow more books!", rating: rand(1..5), user: user1)
Review.create(content: "It was nice", rating: rand(1..5), user: user1)

# Message
puts "created #{Category.count} categories, #{User.count} users, #{Book.count} books, #{Review.count} reviews."
