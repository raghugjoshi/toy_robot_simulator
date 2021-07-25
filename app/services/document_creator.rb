class DocumentCreator
	attr_reader	:document_params

	def initialize(document_params)
		@document_params = document_params
	end

	def create
		Document.create(name: document_params[:name])
	end

end