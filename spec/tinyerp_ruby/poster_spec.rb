require 'spec_helper'

describe TinyerpRuby::Poster do
    let(:connection) { TinyerpRuby::Connection.new API_KEY }
    let(:webservice) { TinyerpRuby::Service.new connection }
    let(:params) { {id: '1234', formato: 'json'} }

  describe '#call', :vcr do
    it 'output a hash' do
      response = webservice.obter_contato_xml(params)
      expect(response).to be_kind_of(Hash)
    end

    it 'output keys as symbols' do
      response = webservice.obter_contato_xml(params)
      expect(response.first[0]).to be_kind_of(Symbol)
    end
  end

end
