require 'redmine'

module RepositoriesControllerHook

   def self.included(base)
      RepositoriesController.class_eval do

         alias redmine_restructuredtext_viewer_orig_entry entry
         def entry
            redmine_restructuredtext_viewer_orig_entry
            if not performed? and @path =~ /\.(rst|rest)\z/
               @content = RbST.new(@content).to_html(:language => 'en', :part => 'fragment', :tab_width => 4)
               @content.force_encoding("utf-8") if @content.respond_to?(:force_encoding)
               render :action => "entry_restructuredtext"
            end
         rescue => e
            @error = e.message
            render :action => "entry_restructuredtext_error"
         end

         alias redmine_restructuredtext_viewer_is_entry_text_data? is_entry_text_data?
         def is_entry_text_data?(ent, path)
            return true if path =~ /\.(rst|rest)\z/
            redmine_restructuredtext_viewer_is_entry_text_data?(ent, path)
         end

      end
   end
end

RepositoriesController.send(:include, RepositoriesControllerHook) unless RepositoriesController.included_modules.include? RepositoriesControllerHook

# Local Variables:
# mode: ruby
# indent-tabs-mode: t
# tab-width: 3
# ruby-indent-level: 3
# End:
# vim: ts=3
