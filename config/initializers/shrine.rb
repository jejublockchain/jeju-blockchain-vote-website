require "shrine"
require "shrine/storage/file_system"

Shrine.storages = {
  cache: Shrine::Storage::FileSystem.new("public", prefix: "uploads/cache"), # temporary
  store: Shrine::Storage::FileSystem.new("public", prefix: "uploads/store"), # permanent
}

Shrine.plugin :activerecord
Shrine.plugin :cached_attachment_data
Shrine.plugin :validation_helpers
Shrine.plugin :determine_mime_type
Shrine.plugin :processing
Shrine.plugin :versions   # enable Shrine to handle a hash of files
Shrine.plugin :delete_raw # delete processed files after uploading
Shrine.plugin :remove_attachment
Shrine.plugin :logging, format: :json
Shrine.plugin :download_endpoint, storages: [:store], prefix: "attachments"
