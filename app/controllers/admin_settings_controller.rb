class AdminSettingsController < ApplicationController
  layout 'temporary'

  before_filter :find_settings, only: [:first_tab_one, :save_first_tab_one, :first_tab_two, :save_first_tab_two, :first_tab_three, :save_first_tab_three, :second_tab_one, :save_second_tab_one, :second_tab_two, :save_second_tab_two, :second_tab_three, :save_second_tab_three, :third_tab_one, :save_third_tab_one, :third_tab_two, :save_third_tab_two, :third_tab_three, :save_third_tab_three, :fourth_tab_one, :save_fourth_tab_one, :fourth_tab_two, :save_fourth_tab_two, :fourth_tab_three, :save_fourth_tab_three, :fifth_tab_one, :save_fifth_tab_one, :fifth_tab_two, :save_fifth_tab_two, :fifth_tab_three, :save_fifth_tab_three]

	def logo
		unless AdminPhoto.where('type = ?', "logo").blank?
			@main_logo = AdminPhoto.where('type = ?', "logo").first
		end
	end

	def save_logo
	   unless params[:admin][:logo].blank?
		unless AdminPhoto.where('type = ?', "logo").bla
nk?
			@main_logo = AdminPhoto.where('type = ?', "logo").first
			@main_logo.logo = params[:admin][:logo]
			@main_logo.type = "logo"
		else
			@main_logo = AdminPhoto.new
			@main_logo.logo = params[:admin][:logo]
			@main_logo.type = "logo"
		end
		unless @main_logo.valid?
			flash.now[:alert] = @main_logo.errors.full_messages.join(", ")
			render action: 'logo'
			return
		else
			@main_logo.save!
			flash[:notice] = "Logo saved successfully."
		end
	   end
	   redirect_to kd_logo_admin_settings_url
	end

	def kd_logo
		unless AdminPhoto.where('type = ?', "kd_logo").blank?
			@kd_logo = AdminPhoto.where('type = ?', "kd_logo").first
		end
	end
	def save_kd_logo
	    unless params[:kd_logo][:logo].blank?
		unless AdminPhoto.where('type = ?', "kd_logo").
blank?
			@kd_logo = AdminPhoto.where('type = ?', "kd_logo").first
			@kd_logo.logo = params[:kd_logo][:logo]
			@kd_logo.type = "kd_logo"
		else
			@kd_logo = AdminPhoto.new
			@kd_logo.logo = params[:kd_logo][:logo]
			@kd_logo.type = "kd_logo"
		end
		unless @kd_logo.valid?
			flash.now[:alert] = @kd_logo.errors.full_messages.join(', ')
			render action: 'kd_logo'
			return
		else
			@kd_logo.save!
			flash[:notice] = "Kaliedoscope logo saved successfully."
		end
	    end
	    redirect_to background_admin_settings_url
	end

	def background
                unless AdminPhoto.where('type = ?', "background").blank?
                        @background = AdminPhoto.where('type = ?', "background").first
                end
        end
        def save_background
	    unless params[:background][:logo].blank?
                unless AdminPhoto.where('type = ?', "background").
blank?
                        @background = AdminPhoto.where('type = ?', "background").first
                        @background.logo = params[:background][:logo]
                        @background.type = "background"
                else
                        @background = AdminPhoto.new
                        @background.logo = params[:background][:logo]
                        @background.type = "background"
                end
                unless @background.valid?
                        flash.now[:alert] = @background.errors.full_messages.join(', ')
                        render action: 'background'
                        return
                else
                        @kd_logo.save!
                        flash[:notice] = "Background image saved successfully."
                end
	    end
	    redirect_to tabs_admin_settings_url
	end

	def tabs
		unless AdminSetting.all.blank?
			@admin_settings = AdminSetting.first
		end
	end
	def save_tabs
		unless AdminSetting.all.blank?
			@admin_settings = AdminSetting.first
			@admin_settings.update_attributes(params_setting)
		else
			@admin_settings = AdminSetting.new(params_setting)
		end
		@admin_settings.valid?
		if @admin_settings.errors.any?
			flash.now[:alert] = @admin_settings.errors.full_messages.join(', ')
			render acton: 'tabs'
			return
		else
			@admin_settings.save
			flash[:notice] = "Tab Settings saved successfully."
			redirect_to first_tab_one_admin_settings_url
		end
	end

	def first_tab_one
		unless MedaDatum.where('tab=? and column=?', 1, 1).blank?
			@first_tab = MetaDatum.where('tab=? and column=?', 1, 1).first
		end
	end
	def save_first_tab_one
		unless MedaDatum.where('tab=? and column=?', 1, 1).blank?
			@first_tab = MetaDatum.where('tab=? and column=?', 1, 1).first
			@first_tab.update_attributes(meta_params)
		else
			@first_tab = MetaDatum.new(meta_params)
		end
		error_messages = []
		@asset = Hash.new
		params[:meta_datum][:image_count].to_i.each do |i|
			@asset["i"] = Asset.new
			@asset["i"] = params[:meta_datum]["image#{i}"]
			@asset["i"].meta_datum = @first_tab
			@asset["i"].valid?
			if @asset["i"].errors.any?
				error_messages << @asset["i"].errors.full_messages
			end
		end
		@first_tab.valid?
		if @first_tab.errors.any?
			error_messages << @first_tab.errors.full_messages
			flash.now[:alert] = error_messages.join(', ')
			render action: 'first_tab_one'
			return
		else
			@first_tab.save
			flash[:notice] = "Data saved successfully."
		    if @settings.tabs = 1 and @settings.tab_1_columns = 1
			redirect_to home_sites_url
		    elsif @settings.tabs > 1 and @settings.tab_1_columns = 1
			redirect_to second_tab_one_admin_settings_url
		    else
			redirect_to first_tab_two_admin_settings_url
		    end
		end
	end

	def first_tab_two
		unless MedaDatum.where('tab=? and column=?', 1, 2).blank?
			@first_tab = MetaDatum.where('tab=? and column=?', 1, 2).first
		end
	end
	def save_first_tab_two
		unless MedaDatum.where('tab=? and column=?', 1, 2).blank?
			@first_tab = MetaDatum.where('tab=? and column=?', 1, 2).first
			@first_tab.update_attributes(meta_params)
		else
			@first_tab = MetaDatum.new(meta_params)
		end
		error_messages = []
		@asset = Hash.new
		params[:meta_datum][:image_count].to_i.each do |i|
			@asset["i"] = Asset.new
			@asset["i"] = params[:meta_datum]["image#{i}"]
			@asset["i"].meta_datum = @first_tab
			@asset["i"].valid?
			if @asset["i"].errors.any?
				error_messages << @asset["i"].errors.full_messages
			end
		end
		@first_tab.valid?
		if @first_tab.errors.any?
			error_messages << @first_tab.errors.full_messages
			flash.now[:alert] = error_messages.join(', ')
			render action: 'first_tab_two'
			return
		else
			@first_tab.save
			flash[:notice] = "Data saved successfully."
		   if @settings.tabs = 1 and @settings.tab_1_columns = 2
			redirect_to home_sites_url
		   elsif @settings.tabs > 1 and @settings.tab_1_columns = 2
			redirect_to second_tab_one_admin_settings_url
		   else
			redirect_to first_tab_three_admin_settings_url
		   end
		end
	end

	def first_tab_three
		unless MedaDatum.where('tab=? and column=?', 1, 3).blank?
			@first_tab = MetaDatum.where('tab=? and column=?', 1, 3).first
		end
	end
	def save_first_tab_three
		unless MedaDatum.where('tab=? and column=?', 1, 3).blank?
			@first_tab = MetaDatum.where('tab=? and column=?', 1, 3).first
			@first_tab.update_attributes(meta_params)
		else
			@first_tab = MetaDatum.new(meta_params)
		end
		error_messages = []
		@asset = Hash.new
		params[:meta_datum][:image_count].to_i.each do |i|
			@asset["i"] = Asset.new
			@asset["i"] = params[:meta_datum]["image#{i}"]
			@asset["i"].meta_datum = @first_tab
			@asset["i"].valid?
			if @asset["i"].errors.any?
				error_messages << @asset["i"].errors.full_messages
			end
		end
		@first_tab.valid?
		if @first_tab.errors.any?	
			error_messages = @first_tab.errors.full_messages
			flash.now[:alert] = error_messages.join(', ')
			render action: 'first_tab_three'
			return
		else
			@first_tab.save
			flash[:notice] = "Data saved successfully."
		   if @settings.tabs = 1
			redirect_to home_sites_url
		   else
			redirect_to second_tab_one_admin_settings_url
		   end
		end
	end

	def second_tab_one
		unless MedaDatum.where('tab=? and column=?', 2, 1).blank?
			@first_tab = MetaDatum.where('tab=? and column=?', 2, 1).first
		end
	end
	def save_second_tab_one
		unless MedaDatum.where('tab=? and column=?', 2, 1).blank?
			@first_tab = MetaDatum.where('tab=? and column=?', 2, 1).first
			@first_tab.update_attributes(meta_params)
		else
			@first_tab = MetaDatum.new(meta_params)
		end
		error_messages = []
		@asset = Hash.new
		params[:meta_datum][:image_count].to_i.each do |i|
			@asset["i"] = Asset.new
			@asset["i"] = params[:meta_datum]["image#{i}"]
			@asset["i"].meta_datum = @first_tab
			@asset["i"].valid?
			if @asset["i"].errors.any?
				error_messages << @asset["i"].errors.full_messages
			end
		end
		@first_tab.valid?
		if @first_tab.errors.any?
			error_messages << @first_tab.errors.full_messages
			flash.now[:alert] = error_messages.join(', ')
			render action: 'second_tab_one'
			return
		else
			@first_tab.save
			flash[:notice] = "Data saved successfully."
		   if @settings.tabs = 2 and @settings.tab_2_columns=1
			redirect_to home_sites_url
		   elsif @settings.tabs > 2 and @settings.tab_2_columns=1
			redirect_to third_tab_one_admin_settings_url
		   else
			redirect_to second_tab_two_admin_settings_url
		   end
		end
	end

	def second_tab_two
		unless MedaDatum.where('tab=? and column=?', 2, 2).blank?
			@first_tab = MetaDatum.where('tab=? and column=?', 2, 2).first
		end
	end
	def save_second_tab_two
		unless MedaDatum.where('tab=? and column=?', 2, 2).blank?
			@first_tab = MetaDatum.where('tab=? and column=?', 2, 2).first
			@first_tab.update_attributes(meta_params)
		else
			@first_tab = MetaDatum.new(meta_params)
		end
		error_messages = []
		@asset = Hash.new
		params[:meta_datum][:image_count].to_i.each do |i|
			@asset["i"] = Asset.new
			@asset["i"] = params[:meta_datum]["image#{i}"]
			@asset["i"].meta_datum = @first_tab
			@asset["i"].valid?
			if @asset["i"].errors.any?
				error_messages << @asset["i"].errors.full_messages
			end
		end
		@first_tab.valid?
		if @first_tab.errors.any?
			error_messages = @first_tab.errors.full_messages
			flash.now[:alert] = error_messages.join(', ')
			render action: 'second_tab_two'
			return
		else
			@first_tab.save
			flash[:notice] = "Data saved successfully."
		    if @settings.tabs = 2 and @settings.tab_2_columns = 2
			redirect_to home_sites_url
		    elsif @settings.tabs > 2 and @settings.tab_2_columns = 2
			redirect_to third_tab_one_admin_settings_url
		    else
			redirect_to second_tab_three_admin_settings_url
		    end
		end
	end

	def second_tab_three
		unless MedaDatum.where('tab=? and column=?', 2, 3).blank?
			@first_tab = MetaDatum.where('tab=? and column=?', 2, 3).first
		end
	end
	def save_second_tab_three
		unless MedaDatum.where('tab=? and column=?', 2, 3).blank?
			@first_tab = MetaDatum.where('tab=? and column=?', 2, 3).first
			@first_tab.update_attributes(meta_params)
		else
			@first_tab = MetaDatum.new(meta_params)
		end
		error_messages = []
		@asset = Hash.new
		params[:meta_datum][:image_count].to_i.each do |i|
			@asset["i"] = Asset.new
			@asset["i"] = params[:meta_datum]["image#{i}"]
			@asset["i"].meta_datum = @first_tab
			@asset["i"].valid?
			if @asset["i"].errors.any?
				error_messages << @asset["i"].errors.full_messages
			end
		end
		@first_tab.valid?
		if @first_tab.errors.any?
			error_messages << @first_tab.errors.full_messages
			flash.now[:alert] = error_messages.join(', ')
			render action: 'second_tab_three'
			return
		else
			@first_tab.save
			flash[:notice] = "Data saved successfully."
		    if @settings.tabs = 2
			redirect_to home_sites_url
		    else
			redirect_to third_tab_one_admin_settings_url
		    end
		end
	end

	def third_tab_one
		unless MedaDatum.where('tab=? and column=?', 3, 1).blank?
			@first_tab = MetaDatum.where('tab=? and column=?', 3, 1).first
		end
	end
	def save_third_tab_one
		unless MedaDatum.where('tab=? and column=?', 3, 1).blank?
			@first_tab = MetaDatum.where('tab=? and column=?', 3, 1).first
			@first_tab.update_attributes(meta_params)
		else
			@first_tab = MetaDatum.new(meta_params)
		end
		error_messages = []
		@asset = Hash.new
		params[:meta_datum][:image_count].to_i.each do |i|
			@asset["i"] = Asset.new
			@asset["i"] = params[:meta_datum]["image#{i}"]
			@asset["i"].meta_datum = @first_tab
			@asset["i"].valid?
			if @asset["i"].errors.any?
				error_messages << @asset["i"].errors.full_messages
			end
		end
		@first_tab.valid?
		if @first_tab.errors.any?
			error_messages << @first_tab.errors.full_messaages
			flash.now[:alert] = error_messages.join(', ')
			render action: 'third_tab_one'
			return
		else
			@first_tab.save
			flash[:notice] = "Data saved successfully."
		   if @settings.tabs=3 and @settings.tab_3_columns=1
			redirect_to home_sites_url
		   elsif @settings.tabs>3 and @settings.tab_3_columns=1
			redirect_to fourth_tab_one_admin_settings_url
		   else
			redirect_to third_tab_two_admin_settings_url
		   end
		end
	end

	def third_tab_two
		unless MedaDatum.where('tab=? and column=?', 3, 2).blank?
			@first_tab = MetaDatum.where('tab=? and column=?', 3, 2).first
		end
	end
	def save_third_tab_two
		unless MedaDatum.where('tab=? and column=?', 3, 2).blank?
			@first_tab = MetaDatum.where('tab=? and column=?', 3, 2).first
			@first_tab.update_attributes(meta_params)
		else
			@first_tab = MetaDatum.new(meta_params)
		end
		error_messages = []
		@asset = Hash.new
		params[:meta_datum][:image_count].to_i.each do |i|
			@asset["i"] = Asset.new
			@asset["i"] = params[:meta_datum]["image#{i}"]
			@asset["i"].meta_datum = @first_tab
			@asset["i"].valid?
			if @asset["i"].errors.any?
				error_messages << @asset["i"].errors.full_messages
			end
		end
		@first_tab.valid?
		if @first_tab.errors.any?
			error_messages << @first_tab.errors.full_messages
			flash.now[:alert] = error_messages.join(', ')
			render action: 'third_tab_two'
			return
		else
			@first_tab.save
			flash[:notice] = "Data saved successfully."
		    if @settings.tabs=3 and @settings.tab_3_columns=2
			redirect_to home_sites_url
		    elsif @settings.tabs>3 and @settings.tab_3_columns=2
			redirect_to fourth_tab_one_admin_settings_url
		    else
			redirect_to third_tab_three_admin_settings_url
		    end
		end
	end

	def third_tab_three
		unless MedaDatum.where('tab=? and column=?', 3, 3).blank?
			@first_tab = MetaDatum.where('tab=? and column=?', 3, 3).first
		end
	end
	def save_third_tab_three
		unless MedaDatum.where('tab=? and column=?', 3, 3).blank?
			@first_tab = MetaDatum.where('tab=? and column=?', 3, 3).first
			@first_tab.update_attributes(meta_params)
		else
			@first_tab = MetaDatum.new(meta_params)
		end
		error_messages = []
		@asset = Hash.new
		params[:meta_datum][:image_count].to_i.each do |i|
			@asset["i"] = Asset.new
			@asset["i"] = params[:meta_datum]["image#{i}"]
			@asset["i"].meta_datum = @first_tab
			@asset["i"].valid?
			if @asset["i"].errors.any?
				error_messages << @asset["i"].errors.full_messages
			end
		end
		@first_tab.valid?
		if @first_tab.errors.any?
			error_messages << @first_tab.errors.full_messages
			flash.now[:alert] = error_messages.join(', ')
			render action: 'third_tab_three'
			return
		else
			@first_tab.save
			flash[:notice] = "Data saved successfully."
		    if @settings = 3
			redirect_to home_sites_url
		    else
			redirect_to fourth_tab_one_admin_settings_url
		    end
		end
	end

	def fourth_tab_one
		unless MedaDatum.where('tab=? and column=?', 4, 1).blank?
			@first_tab = MetaDatum.where('tab=? and column=?', 4, 1).first
		end
	end
	def save_fourth_tab_one
		unless MedaDatum.where('tab=? and column=?', 4, 1).blank?
			@first_tab = MetaDatum.where('tab=? and column=?', 4, 1).first
			@first_tab.update_attributes(meta_params)
		else
			@first_tab = MetaDatum.new(meta_params)
		end
		error_messages = []
		@asset = Hash.new
		params[:meta_datum][:image_count].to_i.each do |i|
			@asset["i"] = Asset.new
			@asset["i"] = params[:meta_datum]["image#{i}"]
			@asset["i"].meta_datum = @first_tab
			@asset["i"].valid?
			if @asset["i"].errors.any?
				error_messages << @asset["i"].errors.full_messages
			end
		end
		@first_tab.valid?
		if @first_tab.errors.any?
			error_messages << @first_tab.errors.full_messages
			flash.now[:alert] = error_messages.join(', ')
			render action: 'fourth_tab_one'
			return
		else
			@first_tab.save
			flash[:notice] = "Data saved successfully."
		   if @settings.tabs=4 and @settings.tab_4_columns=1
			redirect_to home_site_url
		   elsif @settings.tabs>4 and @settings.tab_4_columns=1
			redirect_to fifth_tab_one_admin_settings_url
		   else
			redirect_to fourth_tab_two_admin_settings_url
		   end
		end
	end

	def fourth_tab_two
		unless MedaDatum.where('tab=? and column=?', 4, 2).blank?
			@first_tab = MetaDatum.where('tab=? and column=?', 4, 2).first
		end
	end
	def save_fourth_tab_two
		unless MedaDatum.where('tab=? and column=?', 4, 2).blank?
			@first_tab = MetaDatum.where('tab=? and column=?', 4, 2).first
			@first_tab.update_attributes(meta_params)
		else
			@first_tab = MetaDatum.new(meta_params)
		end
		error_messages = []
		@asset = Hash.new
		params[:meta_datum][:image_count].to_i.each do |i|
			@asset["i"] = Asset.new
			@asset["i"] = params[:meta_datum]["image#{i}"]
			@asset["i"].meta_datum = @first_tab
			@asset["i"].valid?
			if @asset["i"].errors.any?
				error_messages << @asset["i"].errors.full_messages
			end
		end
		@first_tab.valid?
		if @first_tab.errors.any?
			error_messages << @first_tab.errors.full_messages
			flash.now[:alert] = error_messages.join(', ')
			render action: 'fourth_tab_two'
			return
		else
			@first_tab.save
			flash[:notice] = "Data saved successfully."
		   if @settings.tabs=4 and @settings.tab_4_columns=2
			redirect_to home_site_url
		   elsif @settings.tabs>4 and @settings.tab_4_columns=2
			redirect_to fifth_tab_one_admin_settings_url
		   else
			redirect_to fourth_tab_three_admin_settings_url
		   end
		end
	end

	def fourth_tab_three
		unless MedaDatum.where('tab=? and column=?', 4, 3).blank?
			@first_tab = MetaDatum.where('tab=? and column=?', 4, 3).first
		end
	end
	def save_fouth_tab_three
		unless MedaDatum.where('tab=? and column=?', 4, 3).blank?
			@first_tab = MetaDatum.where('tab=? and column=?', 4, 3).first
			@first_tab.update_attributes(meta_params)
		else
			@first_tab = MetaDatum.new(meta_params)
		end
		error_messages = []
		@asset = Hash.new
		params[:meta_datum][:image_count].to_i.each do |i|
			@asset["i"] = Asset.new
			@asset["i"] = params[:meta_datum]["image#{i}"]
			@asset["i"].meta_datum = @first_tab
			@asset["i"].valid?
			if @asset["i"].errors.any?
				error_messages << @asset["i"].errors.full_messages
			end
		end
		@first_tab.valid?
		if @first_tab.errors.any?
			error_messages << @first_tab.errors.full_messages
			flash.now[:alert] = error_messages.join(', ')
			render action: 'fourth_tab_three'
			return
		else
			@first_tab.save
			flash[:notice] = "Data saved successfully."
		   if @settings.tabs=4
			redirect_to home_sites_url
		   else
			redirect_to fifth_tab_one_admin_settings_url
		   end
		end
	end

	def fifth_tab_one
		unless MedaDatum.where('tab=? and column=?', 5, 1).blank?
			@first_tab = MetaDatum.where('tab=? and column=?', 5, 1).first
		end
	end
	def save_fifth_tab_one
		unless MedaDatum.where('tab=? and column=?', 5, 1).blank?
			@first_tab = MetaDatum.where('tab=? and column=?', 5, 1).first
			@first_tab.update_attributes(meta_params)
		else
			@first_tab = MetaDatum.new(mmeta_params)
		end
		error_messages = []
		@asset = Hash.new
		params[:meta_datum][:image_count].to_i.each do |i|
			@asset["i"] = Asset.new
			@asset["i"] = params[:meta_datum]["image#{i}"]
			@asset["i"].meta_datum = @first_tab
			@asset["i"].valid?
			if @asset["i"].errors.any?
				error_messages << @asset["i"].errors.full_messages
			end
		end
		@first_tab.valid?
		if @first_tab.errors.any?
			error_messages << @first_tab.errors.full_messages
			flash.now[:alert] = error_messages.join(', ')
			render action: 'fifth_tab_one'
			return
		else
			@first_tab.save
			flash[:notice] = "Data saved successfully."
		   if @settings.tab_5_columns=1
			redirect_to home_sites_url
		   else
			redirect_to fifth_tab_two_admin_settings_url
		   end
		end
	end

	def fifth_tab_two
		unless MedaDatum.where('tab=? and column=?', 5, 2).blank?
			@first_tab = MetaDatum.where('tab=? and column=?', 5, 2).first
		end
	end
	def save_fifth_tab_two
		unless MedaDatum.where('tab=? and column=?', 5, 2).blank?
			@first_tab = MetaDatum.where('tab=? and column=?', 5, 2).first
			@first_tab.update_attributes(meta_params)
		else
			@first_tab = MetaDatum.new(meta_params)
		end
		error_messages = []
		@asset = Hash.new
		params[:meta_datum][:image_count].to_i.each do |i|
			@asset["i"] = Asset.new
			@asset["i"] = params[:meta_datum]["image#{i}"]
			@asset["i"].meta_datum = @first_tab
			@asset["i"].valid?
			if @asset["i"].errors.any?
				error_messages << @asset["i"].errors.full_messages
			end
		end

		@first_tabvalid?
		if @first_tab.errors.any?
			error_messages << @first_tab.errors.full_messages
			flash.now[:alert] = error_messages.join(', ')
			render action: 'fifth_tab_two'
			return
		else
			@first_tab.save
			flash[:notice] = "Data saved successfully."
		    if @settings.tab_5_columns=2
			redirect_to home_sites_url
		    else
			redirect_to fifth_tab_three_admin_settings_url
		    end
		end
	end

	def fifth_tab_three
		unless MedaDatum.where('tab=? and column=?', 5, 3).blank?
			@first_tab = MetaDatum.where('tab=? and column=?', 5, 3).first
		end
	end
	def save_fifth_tab_three
		unless MedaDatum.where('tab=? and column=?', 5, 3).blank?
			@first_tab = MetaDatum.where('tab=? and column=?', 5, 3).first
			@first_tab.update_attributes(meta_params)
		else
			@first_tab = MetaDatum.new(meta_params)
		end
		error_messages = []
		@asset = Hash.new
		params[:meta_datum][:image_count].to_i.each do |i|
			@asset["i"] = Asset.new
			@asset["i"] = params[:meta_datum]["image#{i}"]
			@asset["i"].meta_datum = @first_tab
			@asset["i"].valid?
			if @asset["i"].errors.any?
				error_messages << @asset["i"].errors.full_messages
			end
		end
		@first_tab.valid?
		if @first_tab.errors.any?
			error_messages << @first_tab.errors.full_messages
			flash.now[:alert] = error_messages.join(', ')
			render action: 'fifth_tab_three'
			return
		else
			@first_tab.save
			flash[:notice] = "Data saved successfully."
			redirect_to home_sites_url
		end
	end

	def announcement
		unless Announcement.all.blank?
			@announcement = Announcement.first
		end
	end
	def save_announcement
		unless Announcement.all.blank?
			@announcement = Announcement.first
			@announcement.update_attributes(announcement_params)
		else
			@announcement.new(announcement_params)
		end
		@announcement.valid?
		if @announcement.errors.any?
			flash.now[:alert] = @announcement.errors.full_messages.join(', ')
			render action: 'announcement'
			return
		else
			@announcement.save
			flash[:notice] = 'Announcement successfully saved.'
			redirect_to logo_admin_settings_url
		end
	end

	def maintenance
		if Announcement.all.blank?
			flash.now[:alert] = "Please apply announcement first."
			redirect_to announcement_admin_settings_url
		else
			@announcement = Announcement.first
			@announcement.maintenance = true
			@announcement.save!
		end
	end

  private

	def meta_params
		params.require(:meta_datum).permit(:heading, :title, :description, :image_count)
	end

	def announcement_params
		params.require(:announcement).permit(:start_time, :end_time, :status)
	end
	
#	def params_logo
#		params.require(:admin_photo).permit(:logo, :type)
#	end

	def params_setting
		params.require(:admin_setting).permit(:tabs, :tab_1_coumns, :tab_2_columns, :tab_3_columns, :tab_4_columns, :tab_5_columns)

	def find_settings
		@settings = AdminSetting.first
	end

end
