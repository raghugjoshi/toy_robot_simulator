class Document < ApplicationRecord
	mount_uploader :name, DocumentUploader

	# Validations
	validates	:name, presence: true

end
