class StaticController < ApplicationController
  skip_before_filter :ensure_login

  def help
  end

  def landingpage
  end
end
