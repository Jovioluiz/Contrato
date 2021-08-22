unit uServicoContrato;

interface

uses
  uServicoPayPal, uContrato, System.SysUtils, uServicoPagamento, System.Generics.Collections,
  uParcela;

type TServicoContrato = class
  private
    FTipoService: IServicoPagamento;
    FDicionario: TDictionary<Integer, TContrato>;
    procedure AdicionaContratoDicionario(Contrato: TContrato; Parcelas: TParcela);

  public
    procedure ProcessaContrato(Contrato: TContrato; Meses: Integer);
    constructor Create(Servico: IServicoPagamento);

    property TipoService: IServicoPagamento read FTipoService write FTipoService;
end;

implementation

uses
  uServicoPayGo;

{ TServicoContrato }

constructor TServicoContrato.Create(Servico: IServicoPagamento);
begin
  FTipoService := Servico;
end;

procedure TServicoContrato.AdicionaContratoDicionario(Contrato: TContrato; Parcelas: TParcela);
begin
  FDicionario := TDictionary<Integer, TContrato>.Create;

  try
    if not FDicionario.ContainsKey(Contrato.Numero) then
    begin
      FDicionario.Add(Contrato.Numero, TContrato.Create);
      FDicionario[Contrato.Numero].AddParcelas(Parcelas);
    end;
  finally
    FDicionario.Free;
  end;
end;

procedure TServicoContrato.ProcessaContrato(Contrato: TContrato; Meses: Integer);
var
  valorBase,
  valorParcela,
  valorAdicional: Currency;
  Parcela: TParcela;
begin
  Parcela := TParcela.Create;
  valorAdicional := 0;

  try
    valorBase := Contrato.ValorTotal / Meses;

    for var i := 0 to Pred(Meses) do
    begin
      Parcela.DataVencimento := IncMonth(Contrato.Data, i + 1);
      valorParcela := valorBase + FTipoService.AdicaoParcela(valorBase, i + 1);

      if (FTipoService is TServicoPayGo) then
        valorAdicional := (FTipoService as TServicoPayGo).CalculaValorAdicional(valorParcela);
      Parcela.ValorParcela := valorParcela + valorAdicional + FTipoService.TaxaPagamento(valorParcela);
      Contrato.AddParcelas(Parcela);
      AdicionaContratoDicionario(Contrato, Parcela);
    end;
  finally
    Parcela.Free;
  end;
end;

end.
