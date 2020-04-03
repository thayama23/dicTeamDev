module ApplicationHelper
  def markdown(text)
    html_render = MarkdownParser.new(filter_html: true, hard_wrap: true)
    options = {
      autolink: true,
      space_after_headers: true,
      no_intra_emphasis: true,
      fenced_code_blocks: true,
      tables: true,
      hard_wrap: true,
      xhtml: true,
      lax_html_blocks: true,
      strikethrough: true
    }
    markdown = Redcarpet::Markdown.new(html_render, options)
    markdown.render(text)
  end

  def select_posting_article_path(article)
    if article.new_record?
      agenda_articles_path(article.agenda, article)
    else
      article_path(article)
    end
  end

  # 追記
  # def current_user
  #   @current_user ||= User.find_by(id: session[:user_id])
  # end

  # def logged_in?
  #   current_user.present?
  # end
  # 追記終わり
end
