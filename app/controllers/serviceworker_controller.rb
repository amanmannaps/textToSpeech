class ServiceworkerController < ApplicationController
  def serviceworker
    render file: 'public/serviceworker.js'
  end
end