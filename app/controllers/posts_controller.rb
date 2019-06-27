class PostsController < ApplicationController
	before_action :authenticate_user!, only: [:index, :new, :edit, :create, :update, :destroy]
	def index
		@user  = current_user
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

  def show
    @post = Post.find(params[:id])
		##@post.urlに埋め込み用のリンクを入れておかないとうまくいきません##
		@posts = Post.all
  end

	def edit
		@post = Post.all
	end

	def create
		url = post_create_params[:url]

			#XVIDEOS
		if url.match(/https?:\/\/www\.xvideos\.com\/video[\w]*\/[\w]*/)
			thumbnail = get_thumbnail(url)
			url.gsub!(/https?:\/\/www\.xvideos\.com\/video/, 'https://www.xvideo.com/embedframe/')
			#PornHub
		elsif url.match(/https?:\/\/[a-z]*\.pornhub\.com\/view_video\.php\?viewkey=[\w]*/)
			thumbnail = get_thumbnail(url)
			url.gsub!(/https?:\/\/[a-z]*\.pornhub\.com\/view_video\.php\?viewkey=/, 'https://jp.pornhub.com/embed/')
			#TUBE8
		elsif url.match(/https?:\/\/[a-z]{2,}\.tube8\.[a-z]{2,}\/[\w\%]*\/[\w\-]*\/[0-9]*\//)
			thumbnail = get_thumbnail(url)
			url.gsub!(/https?:\/\/[a-z]{2,}\.tube8\.[a-z]{2,}\//,'https://www.tube8.com/embed/')
			#javynow
		elsif url.match(/https?:\/\/javynow\.com\/video\/[\w]*\//)
			thumbnail = get_thumbnail_javynow(url)
			url.gsub!(/\/video\//,'/player/')
		elsif url.match(/https?:\/\/www\.youtube\.com\/watch\?v=[\w]*/)
			thumbnail = get_thumbnail(url)
			url.gsub!(/https?:\/\/www\.youtube\.com\/watch\?v=/, 'https://www.youtube.com/embed/')
			#xHamster
		elsif url.match(/https?:\/\/xhamster\.com\/videos\/[\w-]*/)
			thumbnail = get_thumbnail(url)
			#erovideo
		elsif url.match(/https?:\/\/(en\.)?ero-video\.net\/movie\/\?mcd=[\w]*/)
			#FC2
		elsif url.match(/https?:\/\/video\.fc2\.com\/a\/content\/[\w]*/)

		else

		end

		@post = Post.new(post_create_params.merge(thumbnail: thumbnail))
		@post.url = url
		respond_to do |format|
      if @post.save
        format.html { redirect_to posts_path(nonclear: true) }
      else
        format.html { render :new }
      end
    end
	end

	def update
		@posts = Post.all
		respond_to do |format|
      if @post.update(post_update_params)
        format.html { redirect_to posts_path(nonclear: true) }
      else
        format.html { render :new }
      end
    end

	end

	def destroy
		@post.destroy
	end

	private

	def get_thumbnail(url) #xvideos,pornhub,tube8,xhamsterで動作
		require 'open-uri'
		content = open(url)
		doc = Nokogiri::HTML.parse(content)
		img = doc.xpath("//meta[@property='og:image']/@content")
		return nil if img.blank?
		img = img.first.value
		img.present? && img.include?('jpg') ? img : nil
	end

	def get_thumbnail_javynow(url) #javynowで動作
		require 'open-uri'
		content = open(url)
		doc = Nokogiri::HTML.parse(content)
		img = doc.css('div#wrapper img')
		return nil if img.blank?
		img = img.first[:src]
		img.present? && img.include?('jpg') ? img : nil
	end

	def post_create_params
		params.require(:post).permit(:title, :comment, :url, :thumbnail)
	end

	def post_update_params
		params.require(:post).permit(:title, :comment, :url, :thumbnail)
	end
end
