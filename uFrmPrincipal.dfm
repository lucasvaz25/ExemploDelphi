object menu: Tmenu
  Left = 0
  Top = 0
  Caption = 'Principal'
  ClientHeight = 465
  ClientWidth = 729
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MainMenu1
  OldCreateOrder = False
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 64
    Top = 32
    object arefas1: TMenuItem
      Caption = 'Tarefas'
      object btnTarefa1: TMenuItem
        Caption = 'Tarefa 1'
        OnClick = btnTarefa1Click
      end
      object btnTarefa2: TMenuItem
        Caption = 'Tarefa 2'
        OnClick = btnTarefa2Click
      end
      object btnTarefa3: TMenuItem
        Caption = 'Tarefa 3'
        OnClick = btnTarefa3Click
      end
    end
  end
end
