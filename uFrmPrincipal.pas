unit uFrmPrincipal;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Menus;

type
  Tmenu = class( TForm )
    MainMenu1: TMainMenu;
    Arefas1: TMenuItem;
    BtnTarefa1: TMenuItem;
    BtnTarefa2: TMenuItem;
    BtnTarefa3: TMenuItem;
    procedure BtnTarefa2Click( Sender: TObject );
    procedure BtnTarefa1Click( Sender: TObject );
    procedure BtnTarefa3Click( Sender: TObject );
  private
    { Private declarations }
    procedure ExibeForm( Classe: TFormClass );
  public
    { Public declarations }
  end;

var
  Menu: Tmenu;

implementation

uses
  UFTarefa1,
  UFTarefa2,
  UFTarefa3;
{$R *.dfm}

{ Tmenu }

procedure Tmenu.BtnTarefa1Click( Sender: TObject );
begin
  Self.ExibeForm( TfTarefa1 );
end;

procedure Tmenu.BtnTarefa2Click( Sender: TObject );
begin
  Self.ExibeForm( TfTarefa2 );
end;

procedure Tmenu.BtnTarefa3Click( Sender: TObject );
begin
  Self.ExibeForm( TfTarefa3 );
end;

procedure Tmenu.ExibeForm( Classe: TFormClass );
var
  I: Integer;
begin
  for I := 0 to MDIChildCount - 1 do
  begin
    if ( MDIChildren[ I ] is Classe ) then
    begin
      if ( MDIChildren[ I ].WindowState = WsMinimized ) then
        MDIChildren[ I ].WindowState := WsMaximized;

      MDIChildren[ I ].BringToFront;
      MDIChildren[ I ].SetFocus;
      Exit;
    end;
  end;
  Classe.Create( Application );
end;

end.
