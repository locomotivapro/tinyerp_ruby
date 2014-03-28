module TinyerpRuby
  class Service
    SERVICES = [:pesquisar_vendedores_service, :pesquisar_contatos_service, :obter_contato_service, :incluir_contato_service, :alterar_contato_service, :pesquisar_grupos_tag_service, :incluir_grupo_tag_service, :alterar_grupo_tag_service, :pesquisar_tag_service, :incluir_tag_service, :alterar_tag_service, :pesquisar_produtos_service, :obter_produto_service, :incluir_produto_service, :alterar_produto_service, :obter_estoque_produto_service, :obter_estrutura_produto_service, :obter_tags_produto_service, :lista_atualizacoes_produtos_service, :lista_atualizacoes_estoque_service, :pesquisar_pedidos_service, :obter_pedido_service, :incluir_pedido_service, :pesquisar_notas_fiscais_service, :obter_nota_fiscal_service, :incluir_nota_fiscal_service, :obter_xml_nota_fiscal, :pesquisar_notas_servico_service, :obter_nota_servico_service, :incluir_nota_servico_service, :pesquisar_contratos_service, :obter_contrato_service, :incluir_contrato_service, :gerar_ordem_produca_pedido_service, :pesquisar_contatos_xml, :obter_contato_xml, :incluir_contato_xml, :alterar_contato_xml, :pesquisar_grupos_tag_xml, :incluir_grupo_tag_xml, :alterar_grupo_tag_xml, :pesquisar_tag_xml, :incluir_tag_xml, :alterar_tag_xml, :pesquisar_produtos_xml, :obter_produto_xml, :incluir_produto_xml, :alterar_produto_xml, :obter_estoque_produto_xml, :obter_estrutura_produto_xml, :obter_tags_produto_xml, :lista_atualizacoes_produtos_xml, :lista_atualizacoes_estoque_xml, :pesquisar_pedidos_xml, :obter_pedido_xml, :incluir_pedido_xml, :pesquisar_notas_fiscais_xml, :obter_nota_fiscal_xml, :incluir_nota_fiscal_xml, :pesquisar_notas_servico_xml, :obter_nota_servico_xml, :incluir_nota_servico_xml, :pesquisar_contratos_xml, :obter_contrato_xml, :incluir_contrato_xml]

    def initialize(connection)
      raise StandartError unless connection.kind_of?(TinyerpRuby::Connection)
      @connection = connection
    end

    def method_missing(method, *args, &block)
      method = method.to_sym
      if SERVICES.include?(method)
        poster(method, args)
      else
        super
      end
    end

    private

    def poster(method, args)
      params = args.first
      raise ArgumentError unless params.kind_of?(Hash)
      poster = Poster.call(@connection, method, params)
      poster
    end

  end
end

