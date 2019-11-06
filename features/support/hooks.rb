Before do
  @login_page = LoginPage.new
  @sidebar = SideBarView.new
  @movie_page = MoviePage.new

  # page.driver.browser.manage.window.maximize
  page.current_window.resize_to(1440,900)
end

Before("@login") do
  user = CONFIG["users"]["cat_manager"]
  @login_page.go
  @login_page.with(user["email"], user["email"])
end

After do |scenario|
  if scenario.falied?  
    temp_shot = page.take_screenshot("log/temp_shot.png")
    screenshot = Base64.econde64[File.open[temp_shot].read]
    embed[screenshot, "image/png", "Screenshot"]
  end
end
