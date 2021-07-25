require 'rails_helper'

RSpec.describe Document, type: :model do
  describe 'Document' do
    let(:document) { build(:document) }

    describe 'database_columns' do
      it 'should have column named full_name' do
        should have_db_column(:name).of_type(:string)
      end
    end

    describe 'validations' do
      before(:each) do
        expect(document).to be_valid
      end

      describe 'name' do
        it 'validates name for nil value' do
          document.name = nil
          expect(document).to be_invalid
        end
      end
    end
  end
end
