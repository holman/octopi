require File.join(File.dirname(__FILE__), 'test_helper')

class IssueTest < Test::Unit::TestCase
  include Octopi
  
  def setup
    fake_everything
    @user = User.find("fcoury")
    @repo = @user.repository("octopi")
    @issue = @repo.issues.first
  end

  
  context Issue do
    should "return the correct issue by number" do
      assert_equal @issue.number, Issue.find(@repo, @issue.number).number
      assert_equal @issue.number, Issue.find(@user, @repo, @issue.number).number
      assert_equal @issue.number, Issue.find(@repo.owner, @repo.name, @issue.number).number
    end

    should "return the correct issue by using repo.issue number" do
      assert_equal @issue.number, @repo.issue(@issue.number).number
    end
  end
end