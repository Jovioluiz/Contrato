program Contratos;

uses
  Vcl.Forms,
  fPrincipal in 'fPrincipal.pas' {Form1},
  uContrato in 'Entidades\uContrato.pas',
  uParcela in 'Entidades\uParcela.pas',
  uServicoPagamento in 'Servicos\uServicoPagamento.pas',
  uServicoPayPal in 'Servicos\uServicoPayPal.pas',
  uServicoContrato in 'Servicos\uServicoContrato.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
