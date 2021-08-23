object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'frmPrincipal'
  ClientHeight = 428
  ClientWidth = 615
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 40
    Width = 83
    Height = 13
    Caption = 'Numero Contrato'
  end
  object Label2: TLabel
    Left = 68
    Top = 67
    Width = 23
    Height = 13
    Caption = 'Data'
  end
  object Label3: TLabel
    Left = 21
    Top = 94
    Width = 70
    Height = 13
    Caption = 'Valor Contrato'
  end
  object Label4: TLabel
    Left = 8
    Top = 121
    Width = 80
    Height = 13
    Caption = 'Numero Parcelas'
  end
  object edtNumeroContrato: TEdit
    Left = 97
    Top = 32
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object edtValorContrato: TEdit
    Left = 97
    Top = 86
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object edtData: TEdit
    Left = 97
    Top = 59
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object edtNumeroParcelas: TEdit
    Left = 97
    Top = 113
    Width = 121
    Height = 21
    TabOrder = 3
  end
  object Button1: TButton
    Left = 97
    Top = 140
    Width = 121
    Height = 25
    Caption = 'Calcular'
    TabOrder = 4
    OnClick = Button1Click
  end
  object dbGrid: TDBGrid
    Left = 8
    Top = 171
    Width = 599
    Height = 238
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object rgTipoServico: TRadioGroup
    Left = 224
    Top = 32
    Width = 185
    Height = 102
    Caption = 'Tipo  Servi'#231'o'
    Items.Strings = (
      'PayPal'
      'PayGo')
    TabOrder = 6
  end
end
