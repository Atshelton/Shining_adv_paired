require_relative "test_helper"

class AppTest < Minitest::Test
  include Rack::Test::Methods

  def app
    AdventureGame
  end

  def test_adventure
    assert AdventureGame
  end

  def test_homepage
    response = get '/'
    assert_equal "Welcome, come play with us, forever and ever and ever...", response.body
  end

  def test_login_homepage
    response = post "/login"
    assert_equal(User.last.to_json, response.body)
  end

  def test_adventure_page
    response = get "/adventure"
    assert_equal \
      "You wake up in the hotel, you see your tricycle, and your truck which would you like to play with?", response.body
  end

  def test_user_individuality
    user = User.create
    response = get("/user/#{user.id}")
    assert_equal 200, response.status
    assert_equal(user.to_json, response.body)
  end

end
