class AddCountFeaturedProposalToSettings < ActiveRecord::Migration
  def change
    execute "INSERT INTO settings (key, value) VALUES ('count_featured_proposals', 3);"
  end
end
