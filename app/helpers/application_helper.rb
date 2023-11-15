# app/helpers/application_helper.rb
module ApplicationHelper
  def random_unsplash_images(size = '160x120', count = 1)
    images = []
    count.times do
      images << image_tag("https://source.unsplash.com/random/#{size}", alt: 'Random Image')
    end
    images.join.html_safe
  end

end
