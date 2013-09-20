# GET ================================================================

get '/' do
  # Look in app/views/index.erb
  @post_list = Post.order("created_at DESC")
  erb :index
end

# POST ===============================================================

post '/' do
	new_post = Post.create(title: params[:title], description: params[:description])
	tags = Tag.create(name: params[:tags])
	id = new_post.id
	p new_post
	new_post.tags << tags
	redirect "/"
end