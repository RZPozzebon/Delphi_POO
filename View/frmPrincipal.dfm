object FormPrincipal: TFormPrincipal
  Left = 0
  Top = 0
  Caption = 'Principal'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenuPrincipal
  Position = poMainFormCenter
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 624
    Height = 441
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
  end
  object MainMenuPrincipal: TMainMenu
    Left = 568
    Top = 8
    object Cadastro1: TMenuItem
      Caption = 'Cadastro'
      object Cliente1: TMenuItem
        Caption = 'Cliente'
        OnClick = Cliente1Click
      end
    end
  end
end
