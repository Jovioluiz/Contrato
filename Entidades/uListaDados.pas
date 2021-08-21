unit uListaDados;

interface

uses uDataModulo;

type TListaDados = class
  private
    FDados: Tdm;
    procedure SetDados(const Value: Tdm);

  public
    constructor Create;
    destructor Destroy; override;
    property Dados: Tdm read FDados write SetDados;
end;

implementation



{ TListaDados }

constructor TListaDados.Create;
begin
  FDados := Tdm.Create(nil);
end;

destructor TListaDados.Destroy;
begin
  FDados.Free;
  inherited;
end;

procedure TListaDados.SetDados(const Value: Tdm);
begin
  FDados := Value;
end;

end.
