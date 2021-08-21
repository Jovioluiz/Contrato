program Contratos;

uses
  Vcl.Forms,
  fPrincipal in 'fPrincipal.pas' {frmPrincipal},
  uContrato in 'Entidades\uContrato.pas',
  uParcela in 'Entidades\uParcela.pas',
  uServicoPagamento in 'Servicos\uServicoPagamento.pas',
  uServicoPayPal in 'Servicos\uServicoPayPal.pas',
  uServicoContrato in 'Servicos\uServicoContrato.pas',
  uDataModulo in 'DataModulo\uDataModulo.pas' {dm: TDataModule},
  uListaDados in 'Entidades\uListaDados.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(Tdm, dm);
  Application.Run;
end.
