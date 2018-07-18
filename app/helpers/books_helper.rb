module BooksHelper
  def gravatar_book book, size: 80
    gravatar_url =
      "https://secure.gravatar.com/avatar/1?s=#{size}"
    image_tag(gravatar_url, alt: book.name, class: "gravatar")
  end
end
