inherited fTarefa3: TfTarefa3
  Caption = 'fTarefa3'
  ClientHeight = 463
  ClientWidth = 656
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitTop = -79
  ExplicitWidth = 672
  ExplicitHeight = 502
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 32
    Top = 21
    Width = 96
    Height = 13
    Caption = 'Valores por projeto:'
  end
  object DBGrid1: TDBGrid
    Left = 32
    Top = 40
    Width = 593
    Height = 289
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        Title.Caption = 'IdProjeto'
        Visible = True
      end
      item
        Expanded = False
        Title.Caption = 'NomeProjeto'
        Width = 408
        Visible = True
      end
      item
        Expanded = False
        Title.Caption = 'Valor'
        Width = 76
        Visible = True
      end>
  end
  object edTotal: TLabeledEdit
    Left = 504
    Top = 362
    Width = 121
    Height = 21
    EditLabel.Width = 44
    EditLabel.Height = 13
    EditLabel.Caption = 'Total R$:'
    ReadOnly = True
    TabOrder = 1
  end
  object edTotalDiv: TLabeledEdit
    Left = 504
    Top = 426
    Width = 121
    Height = 21
    EditLabel.Width = 86
    EditLabel.Height = 13
    EditLabel.Caption = 'Total Divis'#245'es R$:'
    TabOrder = 2
  end
  object btnTotal: TButton
    Left = 416
    Top = 360
    Width = 75
    Height = 25
    Caption = 'Obter Total'
    TabOrder = 3
    OnClick = btnTotalClick
  end
  object btnTotalDiv: TButton
    Left = 376
    Top = 424
    Width = 115
    Height = 25
    Caption = 'Obter Total Divis'#245'es'
    TabOrder = 4
    OnClick = btnTotalDivClick
  end
end
