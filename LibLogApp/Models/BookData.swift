import Foundation

struct BookData {
    static let latestBooks: [Book] = [
        Book(
            id: UUID().uuidString,
            imageName: "catcherintherye",
            title: "Catcher in the Rye",
            author: "J.D. Salinger",
            genre: "Novel",
            description: "A classic coming-of-age story about teenage alienation and rebellion, following Holden Caulfield's journey through New York City.",
            pageCount: 277,
            category: "Fiction",
            publisher: "Little, Brown and Company",
            language: "English"
        ),
        Book(
            id: UUID().uuidString,
            imageName: "1984",
            title: "1984",
            author: "George Orwell",
            genre: "Science Fiction",
            description: "A dystopian novel set in a totalitarian regime under constant surveillance, exploring themes of freedom and oppression.",
            pageCount: 328,
            category: "Dystopian",
            publisher: "Secker & Warburg",
            language: "English"
        ),
        Book(
            id: UUID().uuidString,
            imageName: "prideandprejudice",
            title: "Pride and Prejudice",
            author: "Jane Austen",
            genre: "Romance",
            description: "A timeless romantic tale of manners and misunderstandings, focusing on Elizabeth Bennet and Mr. Darcy.",
            pageCount: 432,
            category: "Classic",
            publisher: "T. Egerton",
            language: "English"
        ),
        Book(
            id: UUID().uuidString,
            imageName: "sherlockholmes",
            title: "Sherlock Holmes",
            author: "Arthur Conan Doyle",
            genre: "Crime",
            description: "A brilliant detective uses sharp observation and deductive reasoning to solve London's most puzzling crimes.",
            pageCount: 307,
            category: "Mystery",
            publisher: "George Newnes",
            language: "English"
        ),
        Book(
            id: UUID().uuidString,
            imageName: "sapiens",
            title: "Sapiens",
            author: "Yuval Noah Harari",
            genre: "History",
            description: "An exploration of human history, from the Stone Age to modern civilization, analyzing the forces that shaped our world.",
            pageCount: 498,
            category: "Non-fiction",
            publisher: "Harvill Secker",
            language: "English"
        ),
        Book(
            id: UUID().uuidString,
            imageName: "bravenewworld",
            title: "Brave New World",
            author: "Aldous Huxley",
            genre: "Science Fiction",
            description: "A futuristic society driven by technology and control, where individuality and freedom are nearly extinct.",
            pageCount: 268,
            category: "Dystopian",
            publisher: "Chatto & Windus",
            language: "English"
        )
    ]

    static let popularBooks: [Book] = [
        Book(
            id: UUID().uuidString,
            imageName: "dune",
            title: "Dune",
            author: "Frank Herbert",
            genre: "Science Fiction",
            description: "A sci-fi epic on the desert planet Arrakis, full of politics, betrayal, and destiny.",
            pageCount: 412,
            category: "Science Fiction",
            publisher: "Chilton Books",
            language: "English"
        ),
        Book(
            id: UUID().uuidString,
            imageName: "foundation",
            title: "Foundation",
            author: "Isaac Asimov",
            genre: "Science Fiction",
            description: "A visionary story of mathematics and history predicting the fall and rise of empires.",
            pageCount: 255,
            category: "Science Fiction",
            publisher: "Gnome Press",
            language: "English"
        ),
        Book(
            id: UUID().uuidString,
            imageName: "neuromancer",
            title: "Neuromancer",
            author: "William Gibson",
            genre: "Science Fiction",
            description: "A cyberpunk classic about hackers, artificial intelligence, and a gritty future world.",
            pageCount: 271,
            category: "Cyberpunk",
            publisher: "Ace",
            language: "English"
        ),
        Book(
            id: UUID().uuidString,
            imageName: "thegreatgatsby",
            title: "The Great Gatsby",
            author: "F. Scott Fitzgerald",
            genre: "Novel",
            description: "A story of wealth, love, and betrayal in 1920s America, narrated by Nick Carraway.",
            pageCount: 180,
            category: "Classic",
            publisher: "Charles Scribner's Sons",
            language: "English"
        ),
        Book(
            id: UUID().uuidString,
            imageName: "tokillamockingbird",
            title: "To Kill a Mockingbird",
            author: "Harper Lee",
            genre: "Novel",
            description: "A powerful tale of racial injustice and childhood innocence in the American South.",
            pageCount: 281,
            category: "Fiction",
            publisher: "J.B. Lippincott & Co.",
            language: "English"
        ),
        Book(
            id: UUID().uuidString,
            imageName: "thealchemist",
            title: "The Alchemist",
            author: "Paulo Coelho",
            genre: "Novel",
            description: "A philosophical journey of a young shepherd seeking his personal legend.",
            pageCount: 208,
            category: "Fiction",
            publisher: "HarperTorch",
            language: "English"
        ),
        Book(
            id: UUID().uuidString,
            imageName: "janeeyre",
            title: "Jane Eyre",
            author: "Charlotte Brontë",
            genre: "Romance",
            description: "An orphaned young woman finds love and independence while confronting dark secrets.",
            pageCount: 500,
            category: "Classic",
            publisher: "Smith, Elder & Co.",
            language: "English"
        ),
        Book(
            id: UUID().uuidString,
            imageName: "mebeforeyou",
            title: "Me Before You",
            author: "Jojo Moyes",
            genre: "Romance",
            description: "A heartwarming yet tragic story of love between Louisa and a paralyzed man named Will.",
            pageCount: 369,
            category: "Contemporary Romance",
            publisher: "Michael Joseph",
            language: "English"
        ),
        Book(
            id: UUID().uuidString,
            imageName: "thegirlwiththedragontattoo",
            title: "The Girl with the Dragon Tattoo",
            author: "Stieg Larsson",
            genre: "Crime",
            description: "A gripping mystery involving a journalist, a hacker, and decades-old family secrets.",
            pageCount: 465,
            category: "Mystery",
            publisher: "Norstedts Förlag",
            language: "English"
        ),
        Book(
            id: UUID().uuidString,
            imageName: "gonegirl",
            title: "Gone Girl",
            author: "Gillian Flynn",
            genre: "Thriller",
            description: "A dark and twisted psychological thriller about a missing wife and hidden truths.",
            pageCount: 432,
            category: "Psychological Thriller",
            publisher: "Crown Publishing Group",
            language: "English"
        ),
        Book(
            id: UUID().uuidString,
            imageName: "thedavincicode",
            title: "The Da Vinci Code",
            author: "Dan Brown",
            genre: "Thriller",
            description: "A thrilling chase through historical secrets, symbology, and hidden conspiracies.",
            pageCount: 454,
            category: "Mystery Thriller",
            publisher: "Doubleday",
            language: "English"
        ),
        Book(
            id: UUID().uuidString,
            imageName: "agameofthrones",
            title: "A Game of Thrones",
            author: "George R.R. Martin",
            genre: "Fantasy",
            description: "A brutal and complex tale of politics, betrayal, and war in the Seven Kingdoms.",
            pageCount: 694,
            category: "Epic Fantasy",
            publisher: "Bantam Spectra",
            language: "English"
        ),
        Book(
            id: UUID().uuidString,
            imageName: "thehobbit",
            title: "The Hobbit",
            author: "J.R.R. Tolkien",
            genre: "Fantasy",
            description: "Bilbo Baggins joins a quest to reclaim a mountain of treasure from a dragon.",
            pageCount: 310,
            category: "Fantasy",
            publisher: "George Allen & Unwin",
            language: "English"
        ),
        Book(
            id: UUID().uuidString,
            imageName: "harrypotter",
            title: "Harry Potter and the Philosopher's Stone",
            author: "J.K. Rowling",
            genre: "Fantasy",
            description: "A young boy discovers he's a wizard and attends Hogwarts School of Witchcraft and Wizardry.",
            pageCount: 223,
            category: "Fantasy",
            publisher: "Bloomsbury",
            language: "English"
        ),
        Book(
            id: UUID().uuidString,
            imageName: "meditations",
            title: "Meditations",
            author: "Marcus Aurelius",
            genre: "Philosophy",
            description: "Personal writings of the Roman Emperor reflecting on Stoic philosophy and life.",
            pageCount: 254,
            category: "Philosophy",
            publisher: "Penguin Classics",
            language: "English"
        ),
        Book(
            id: UUID().uuidString,
            imageName: "thinkingfastandslow",
            title: "Thinking, Fast and Slow",
            author: "Daniel Kahneman",
            genre: "Psychology",
            description: "An exploration of two systems of thought: fast, intuitive thinking and slow, deliberate reasoning.",
            pageCount: 499,
            category: "Cognitive Psychology",
            publisher: "Farrar, Straus and Giroux",
            language: "English"
        ),
        Book(
            id: UUID().uuidString,
            imageName: "theartofwar",
            title: "The Art of War",
            author: "Sun Tzu",
            genre: "History",
            description: "An ancient Chinese military treatise offering timeless strategies for warfare and leadership.",
            pageCount: 273,
            category: "Military Strategy",
            publisher: "Oxford University Press",
            language: "English"
        )
        
    ]
}
extension BookData {
    static let allBooks: [Book] = latestBooks + popularBooks
}

