class TreeController < ApplicationController
  def index
=begin
    if params[:fil].blank?
      session[:base_dir] = (Rails.root).to_s
    else
     session[:base_dir] = session[:base_dir] + "/"+params["fil"] + "/"

    end
    @baseDir = session[:base_dir]
=end

    if !params[:dir].blank?
    @dir = File.absolute_path params[:dir];
    end
    if @dir.nil?
      @dir = (Rails.root).to_s
    end
    Dir.chdir(@dir)

    @fileList = Dir["*"].select {|f| !File.directory? f}

    @dirList = Dir["*"].select {|d| File.directory? d}

  end
  def show
  end

  def download
    @file = params[:fil];
  end

  def browse
    @dir = File.absolute_path params[:dir];
    index
  end
end
