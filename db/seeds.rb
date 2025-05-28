Review.destroy_all
Book.destroy_all
User.destroy_all
Category.destroy_all

# Category
category1 = Category.create(name: "SciFi")
category2 = Category.create(name: "Romance")
category3 = Category.create(name: "Thriller")
category4 = Category.create(name: "Horror")
category5 = Category.create(name: "Fantasy")
category6 = Category.create(name: "Biography")
category7 = Category.create(name: "Mistery")

# User
user1 = User.create!(email: "example@mail.com", password: "123456", full_name: "Edgar Allan Poe", address: "Boston, Massachusetts, United States")

# Creating books
Book.create(title: "Harry Potter: Philosopher's Stone", description: "The exciting beginning of a world full of magic, adventure, and friendship. Until his eleventh birthday, Harry believes he is a completely normal boy. But then he learns that he is to attend the School of Witchcraft and Wizardry because he is a wizard!", author: "Rowling J.K.", category: category1, user: user1)
Book.create(title: "Harry Potter: Chamber of Secrets", description: "School is finally back! Only someone whose holidays were awful could let out such a sigh: Harry Potter. But like last school year, there's more to the program than just Potions and Transfiguration. Something horrible is wreaking havoc in the school.", author: "Rowling J.K.", category: category2, user: user1)
Book.create(title: "Harry Potter: Prisoner of Azkaban", description: "A spell with unexpected consequences. Of course, Harry knows that magic is strictly forbidden during the holidays, yet he casts a levitation spell on his horrible aunt.", author: "Rowling J.K.", category: category3, user: user1)
Book.create(title: "Harry Potter: Goblet of Fire", description: "A magical tournament and Voldemort on the rise. Harry's fourth year at Hogwarts begins and a competition keeps the students on edge: the Triwizard Tournament, in which Harry takes on a role he could never have imagined.", author: "Rowling J.K.", category: category4, user: user1)
Book.create(title: "Harry Potter: Order of the Phoenix", description: "Harry and his friends form up for battle. It's summer vacation, and once again Harry is stuck with the unspeakable Dursleys. But this time he's more worried than ever - why doesn't he learn anything about the dark forces that have recently arisen?", author: "Rowling J.K.", category: category5, user: user1)
Book.create(title: "Harry Potter: Half-Blood Prince", description: "Voldemort's Dark Past. Since Voldemort, the most dangerous Dark wizard of all time, returned, unrest and violence have reigned in the magical world.", author: "Rowling J.K.", category: category6, user: user1)
Book.create(title: "Harry Potter: Deathly Hallows", description: "The final battle between Harry and the Dark Lord. A return to Hogwarts is out of the question for Harry. He must do everything in his power to find the remaining Horcruxes. Only when they are destroyed can Voldemort's reign of terror end. ", author: "Rowling J.K.", category: category7, user: user1)

# Reviews
Review.create(content: "Great book! The condition of the book is also great!", rating: rand(1..5), user: user1)
Review.create(content: "I love this book! The condition of the book is also great!", rating: rand(1..5), user: user1)
Review.create(content: "Nice", rating: rand(1..5), user: user1)
Review.create(content: "Not bad", rating: rand(1..5), user: user1)
Review.create(content: "I love this book, would definitely borrow more", rating: rand(1..5), user: user1)
Review.create(content: "Nice experience, I will borrow more books!", rating: rand(1..5), user: user1)
Review.create(content: "It was nice", rating: rand(1..5), user: user1)
