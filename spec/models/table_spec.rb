require 'rails_helper'

RSpec.describe Table, type: :model do
  describe 'Table' do 
    let(:table) { FactoryBot.build(:table) }
    
    describe 'database_columns' do
      it 'has width column' do
        should have_db_column(:width).of_type(:integer)
      end
      it 'has height column' do
        should have_db_column(:height).of_type(:integer)
      end
    end

    describe 'validations' do 
      before(:each) do 
        expect(table).to be_valid
      end

      describe 'width' do 
        context 'when width and height are nil' do
          it 'validates width for nil value' do 
            table.width = nil
            expect(table).to be_invalid
          end

          it 'validates height for nil value' do 
            table.height = nil
            expect(table).to be_invalid
          end
        end

        context 'when width and height are negative' do
          it 'validates width for negative value' do 
            table.width = -1
            expect(table).to be_invalid
          end

          it 'validates height for negative value' do 
            table.height = -1
            expect(table).to be_invalid
          end
        end
      end
    end
  end
end

