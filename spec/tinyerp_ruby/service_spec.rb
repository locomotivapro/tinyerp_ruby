require 'spec_helper'

describe TinyerpRuby::Service do
  context 'with invalid connection' do
    it 'raise a error' do
      expect{TinyerpRuby::Service.new('124')}.to raise_error
    end
  end

  context 'with valid connection' do
    it 'initializes correctly' do
      conn = TinyerpRuby::Connection.new('asfasdkjkl')
      expect{TinyerpRuby::Service.new(conn)}.to_not raise_error
    end
  end

  context 'accepts', :vcr do
    conn = TinyerpRuby::Connection.new(API_KEY)
    poster = TinyerpRuby::Service.new(conn)

    TinyerpRuby::Service::SERVICES.each do |service|
      it "##{service.to_s} as a valid service" do
        expect{ poster.send(service, {}) }.to_not raise_error
      end
    end

    it 'send message to Poster module' do
      expect(TinyerpRuby::Poster).to receive(:call)
      poster.pesquisar_vendedores_service({})
    end

    it 'raise error when passing something else than a Hash' do
      expect { poster.pesquisar_vendedores_service('anything') }.to raise_error
    end

    it 'return a hash with body response'
  end

  context 'unaccepted services' do
    it 'raise error' do
      conn = TinyerpRuby::Connection.new('asfasdkjkl')
      poster = TinyerpRuby::Service.new(conn)
      expect{ poster.other_method({}) }.to raise_error
    end
  end

end
