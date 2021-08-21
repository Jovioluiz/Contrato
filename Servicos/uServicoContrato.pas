unit uServicoContrato;

interface

uses
  uServicoPayPal, uContrato, System.SysUtils, uServicoPagamento;

type TServicoContrato = class
  private
    FTipoService: IServicoPagamento;

  public
    procedure ProcessaContrato(Contrato: TContrato; Meses: Integer);
    constructor Create(Servico: IServicoPagamento);

    property TipoService: IServicoPagamento read FTipoService write FTipoService;
end;

implementation

uses
  uParcela;

{ TServicoContrato }

constructor TServicoContrato.Create(Servico: IServicoPagamento);
begin
  FTipoService := Servico;
end;

procedure TServicoContrato.ProcessaContrato(Contrato: TContrato; Meses: Integer);
var
  valorBase,
  valorParcela: Currency;
  Parcela: TParcela;
begin
  Parcela := TParcela.Create;

  try
    valorBase := Contrato.ValorTotal / Meses;

    for var i := 0 to Pred(Meses) do
    begin
      Parcela.DataVencimento := IncMonth(Contrato.Data, i + 1);
      valorParcela := valorBase + FTipoService.AdicaoParcela(valorBase, i + 1);
      Parcela.ValorParcela := valorParcela + FTipoService.TaxaPagamento(valorParcela);

      Contrato.AddParcelas(Parcela);
    end;
  finally
    Parcela.Free;
  end;
end;

end.
