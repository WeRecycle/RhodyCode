module ProjectsHelper
  def followers_list project
    list = @project.followers.reject {|follower| follower.id == @project.owner.id}.map {|follower| follower.email}.join(",")
    return "No followers" if list.empty?
  end
end
