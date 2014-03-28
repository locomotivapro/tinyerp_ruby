require 'spec_helper'

describe TinyerpRuby::Connection do
  context 'without environment argument' do
    let(:connection) { TinyerpRuby::Connection.new('aassdfasfaf') }

    it "use production" do
      expect(connection.environment).to eq TinyerpRuby::Production
    end

    it "recognize production url" do
      expect(connection.base_url).to eq "http://www.tiny.com.br/api2.php?wsdl"
    end
  end

  context 'with environment argument' do
    let(:connection) { TinyerpRuby::Connection.new('aassdfasfaf', :test) }

    it "use passed one" do
      expect(connection.environment).to eq TinyerpRuby::Test
    end

    it "recognize environment argument" do
      expect(connection.base_url).to eq "http://test.com"
    end

    it "raise error if environment doesnt exists" do
      expect{TinyerpRuby::Connection.new('aasdfasfda', :other)}.to raise_error
    end
  end

  it "initialize with an api key and environment" do
      expect{TinyerpRuby::Connection.new('aasdfasfda', :test)}.to_not raise_error
  end

  it "initialize with a api key" do
      expect{TinyerpRuby::Connection.new('aasdfasfda')}.to_not raise_error
  end

  it "return api key" do
    expect( TinyerpRuby::Connection.new('apiapiapi').api_key ).to eq 'apiapiapi'
  end
end
