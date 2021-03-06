unit uContrato;

interface

uses
  System.Generics.Collections, uParcela;

type TContrato = class
  private
    FNumero: Integer;
    FData: TDateTime;
    FValorTotal: Currency;
    FParcelas: TObjectList<TParcela>;
    procedure SetNumero(const Value: Integer);
    procedure SetData(const Value: TDateTime);
    procedure SetValorTotal(const Value: Currency);

  public
    procedure AddParcelas(Parcelas: TParcela);
    constructor Create;
    destructor Destroy; override;

    property Numero: Integer read FNumero write SetNumero;
    property Data: TDateTime read FData write SetData;
    property ValorTotal: Currency read FValorTotal write SetValorTotal;
    property Parcelas: TObjectList<TParcela> read FParcelas write FParcelas;

end;

implementation

{ TContrato }

procedure TContrato.AddParcelas(Parcelas: TParcela);
var
  i: integer;
begin
  FParcelas.Add(TParcela.Create);
  i := FParcelas.Count - 1;
  FParcelas[i].DataVencimento := Parcelas.DataVencimento;
  FParcelas[i].ValorParcela := Parcelas.ValorParcela;
end;

constructor TContrato.Create;
begin
  FParcelas := TObjectList<TParcela>.Create;
end;

destructor TContrato.Destroy;
begin
  FParcelas.Free;
  inherited;
end;

procedure TContrato.SetData(const Value: TDateTime);
begin
  FData := Value;
end;

procedure TContrato.SetValorTotal(const Value: Currency);
begin
  FValorTotal := Value;
end;

procedure TContrato.SetNumero(const Value: Integer);
begin
  FNumero := Value;
end;

end.
