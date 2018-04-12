require "image_processing/mini_magick"

class ImageUploader < Shrine
  plugin :remove_attachment
end