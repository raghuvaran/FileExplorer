class Tree2Controller < ApplicationController
  def index
    # Default assign Rails public directory
    @dir = (Rails.root).to_s + '/public'
    root_path = Pathname.new(Rails.root)

    # If :dir is sent (not blank) get required directory into @dir
    @dir += '/' + params[:dir] unless params[:dir].blank?

    #todo validate @dir

    # Change directory to @dir
    Dir.chdir(@dir)

    # file_list is array of files in @dir
    file_list = Dir['*'].select {|f| !File.directory? f}

    # @file_hash key => file name, value => relative path of parent directory to Rails.root
    @file_hash = Hash.new
    file_list.each do |f|
      @file_hash[f]= Pathname.new(File.absolute_path f).parent.relative_path_from(root_path).to_s
    end

    # dir_list is array of directories in @dir
    dir_list = Dir['*'].select {|d| File.directory? d}

    # @dir_hash key => directory name, value => relative path to Rails.root
    @dir_hash = Hash.new
    dir_list.each do |d|
      @dir_hash[d]= Pathname.new(File.absolute_path d).relative_path_from(root_path).to_s
    end
  end

  def show
  end

  def download
    # If @fil and @path are not passed do ...
    if params[:fil].blank? || params[:path].blank?

      # todo let user know about the error

      redirect_to tree2_index_url
    else
      @file = params[:fil]

      # todo validate :fil and :path

      send_file Rails.root.join(params[:path], params[:fil])#, x_sendfile: true

      # Update database
      @down_file = DownFile.new(name:params[:fil], path:params[:path])
      @down_file.save
    end
  end

  def browse
  end
end
