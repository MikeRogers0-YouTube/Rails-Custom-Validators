require "rails_helper"

RSpec.describe FilterWordsValidator do
  subject { FilterWordsValidator.new({attributes: {any: true}, in: ["javascript"]}) }

  let(:errors) { ActiveModel::Errors.new(OpenStruct.new) }

  # https://relishapp.com/rspec/rspec-mocks/docs/verifying-doubles/using-an-instance-double
  let(:record) { instance_double(ActiveModel::Validations, errors: errors) }

  describe "#validate_each(record, attribute, value)" do
    it "adds error to invalid record when 'javascript' is added" do
      expect {
        subject.validate_each(record, :body_rendered, "not javascript")
      }.to change(record.errors, :count)
        .and change { record.errors.first&.type }.to eq(:invalid)
    end

    it "does not add error when field is safe" do
      expect {
        subject.validate_each(record, :body_rendered, "Happy Field")
      }.to_not change(record.errors, :count)
    end
  end
end
