module PostsHelper

  def can_destroy_post?(post)
    user_signed_in? && post.user_id == current_user.id
  end

end
