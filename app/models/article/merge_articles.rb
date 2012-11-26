class Article::MergeArticles
	
	attr_reader :article1, :article2

	def initialize(article1, article2)
		@article1 = article1
		@article2 = article2
	end

	def merge
		article1.body += " " + article2.body
		article2.comments.each do |comment|
			comment.update_attribute(:article_id, article1.id)
		end

		article1.save
		article2.reload
		article2.destroy
		article1
	end
	
end