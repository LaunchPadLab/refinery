
RSpec.shared_context 'user refinery' do

  # Movie, Actor Classes and serializers
  before(:context) do
    class UserRefinery
      extend Refinery

      ignore :created_at, :updated_at

      permit :id
      permit :name
      permit :email, required: true
      permit :public

      many_nested :posts
      one_nested :tag, format: false
    end

    class PostRefinery
      extend Refinery

      ignore :created_at, :updated_at

      permit :id
      permit :title, required: true
      permit :_destroy

      many_nested :comments
    end

    class CommentRefinery
      extend Refinery

      ignore :created_at, :updated_at

      permit :id
      permit :text, required: true
      permit :_destroy
    end

    class TagRefinery
      extend Refinery

      ignore :created_at, :updated_at, :display_name

      permit :id
      permit :type
      permit :name

      one_nested :tag_group, format: false
      one_nested :tag_category, format: false
    end
  end
end