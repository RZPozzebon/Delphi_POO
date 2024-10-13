object frmCadastroCliente: TfrmCadastroCliente
  Left = 0
  Top = 0
  Caption = 'Cadatro de Cliente'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  TextHeight = 15
  object pnlLabelTitulo: TPanel
    Left = 0
    Top = 0
    Width = 624
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    Caption = 'Cadastro de clientes'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMenuHighlight
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    ExplicitWidth = 622
  end
  object pnlCamposCadastro: TPanel
    Left = 0
    Top = 41
    Width = 624
    Height = 400
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitWidth = 622
    ExplicitHeight = 392
    object lblContatoemail: TLabel
      Left = 112
      Top = 105
      Width = 88
      Height = 15
      Caption = 'Contato (e-mail)'
    end
    object lblNomeCliente: TLabel
      Left = 112
      Top = 56
      Width = 88
      Height = 15
      Caption = 'Nome do cliente'
    end
    object lblDataAniversario: TLabel
      Left = 112
      Top = 211
      Width = 105
      Height = 15
      Caption = 'Data de nascimento'
    end
    object lblSexo: TLabel
      Left = 112
      Top = 163
      Width = 25
      Height = 15
      Caption = 'Sexo'
    end
    object lblNomeObrigatorio: TLabel
      Left = 249
      Top = 32
      Width = 108
      Height = 15
      Caption = 'nome Obrigatorio **'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object lblEmailObrigatorio: TLabel
      Left = 248
      Top = 80
      Width = 111
      Height = 15
      Caption = 'e-mail Obrigatorio **'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object edtNomeCliente: TEdit
      Left = 244
      Top = 48
      Width = 267
      Height = 23
      TabOrder = 0
      Text = 'Rodrigo'
    end
    object edtEmailCliente: TEdit
      Left = 245
      Top = 97
      Width = 267
      Height = 23
      TabOrder = 1
      Text = 'rodrigo@gmail.com'
    end
    object rgSexoCliente: TRadioGroup
      Left = 244
      Top = 145
      Width = 267
      Height = 33
      Columns = 3
      Items.Strings = (
        'Mulher'
        'Homen'
        'Outros')
      TabOrder = 2
      OnClick = rgSexoClienteClick
    end
    object dtpDataNascimento: TDateTimePicker
      Left = 244
      Top = 204
      Width = 267
      Height = 23
      Date = 45577.000000000000000000
      Time = 0.663858125000842800
      TabOrder = 3
    end
    object btnSalvarCliente: TButton
      Left = 198
      Top = 263
      Width = 75
      Height = 25
      Caption = 'salvar'
      TabOrder = 4
      OnClick = btnSalvarClienteClick
    end
    object btnCancelarCliente: TButton
      Left = 350
      Top = 263
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 5
    end
  end
end
