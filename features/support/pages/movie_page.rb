class MoviePage
  include Capybara::DSL

  def form
    MovieAdd.new
  end

  def sweet_alert
    SweerAlert.new
  end

  def initialize
    @movie_list_css = "table tbody tr"
  end

  def movie_tr(movie)
    find(@movie_list_css, text: movie['title'])
  end

  def remove(title)
    movie_tr(title).find(".btn-trash").click
  end

  def has_no_movie(title)
    page.has_no_css?(@movie_list_css, text: title)
  end

  def has_movie(title)
    pas.has_css?(@movie_list_css, text: title)
  end
end
