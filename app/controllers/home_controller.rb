class HomeController < ApplicationController
  def index
    if session[:xx].nil?
      session[:xx] = 0
    else
      session[:xx] += 1
    end
    logger.info 'session='+session[:xx].to_s
    begin
      @u = User.first.dup
      @u.email = (0...8).map { (65 + rand(26)).chr }.join+'@example.com'
      @u.name = 'dada'
      @u.password = 'zxasqw12'
      @u.save
      @result = {:errors => @u.errors.empty?, :valid => @u.valid?, :inspect => @u.errors.inspect}
    rescue TypeError
      @result = 'there is no user'
    end
    e = Exchange.new :name => (0...8).map { (65 + rand(26)).chr }.join
    e.save
    #render 'index', :locals => {:result => result, :u =>}
    #render :text => "<table border='2'><tr><td>#{session[:xx]}</td></tr></table>"
  end
end
