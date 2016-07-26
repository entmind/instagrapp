module BlogsHelper
    def choose_new_or_edit    # 追記したよ。dive03
        if action_name == 'new' || action_name == 'confirm'  # アクションが、newまたは、confirmの時にのみtrueを返却します。dive03
            confirm_blogs_path
        elsif action_name == 'edit'
            blog_path
        end
    end
end
