require 'csv'

# Clear existing data (if needed)
Author.delete_all
Book.delete_all

# Path to your CSV file
csv_file = 'db/data/books.csv'

# Read CSV and dynamically fetch headers
headers = CSV.open(csv_file, 'r') { |csv| csv.first }

# Import Authors
CSV.foreach(csv_file, headers: true) do |row|
  # Assuming 'author_name' and 'bio' are columns in your CSV
  Author.create(
    name: row[headers.index('author_name')],
    bio: row[headers.index('bio')]
  )
end

# Import Books
CSV.foreach(csv_file, headers: true) do |row|
  # Find the author by name (ensure 'author_name' column is correct in your CSV)
  author = Author.find_by(name: row[headers.index('author_name')])
  Book.create(
    title: row[headers.index('title')],
    published_date: row[headers.index('published_date')],
    genre: row[headers.index('genre')],
    author: author
  )
end
