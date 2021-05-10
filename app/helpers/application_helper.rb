module ApplicationHelper
  def default_meta_tags
    {
      title: "<%= yield(:title) %>" ,
      description: " yield(:description) ",
      canonical: request.original_url,  # 優先されるurl
      charset: "UTF-8",
      icon: [href: image_url('favicon.ico')]
      # OGPの設定をしておくとfacebook, twitterなどの投稿を見た目よくしてくれます。
    }
  end
end
