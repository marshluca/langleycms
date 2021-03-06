module Refinery
  module Articles
    class ArticlesController < ::ApplicationController

      before_filter :find_all_articles
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @article in the line below:
        present(@page)
      end

      def show
        @article = Article.find(params[:id])


        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @article in the line below:
        present(@page)
      end

    protected

      def find_all_articles
        @articles = Article.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/articles").first
      end

    end
  end
end
