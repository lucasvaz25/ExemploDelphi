unit ufTarefa2;

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
  UFBase,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.ComCtrls;

type
  TfTarefa2 = class( TfBase )
    EdThread1: TLabeledEdit;
    BtnInit1: TButton;
    ProgressBar1: TProgressBar;
    ProgressBar2: TProgressBar;
    Label1: TLabel;
    Label2: TLabel;
    EdThread2: TLabeledEdit;
    procedure BtnInit1Click( Sender: TObject );
    procedure FormCreate( Sender: TObject );
  private
    { Private declarations }

    ListThread: TList;
    Count: Integer;
    procedure CriarThread;

  public
    { Public declarations }
  end;

implementation

uses
  UMyThread;

const
  QtdThread = 2;

{$R *.dfm}


procedure TfTarefa2.BtnInit1Click( Sender: TObject );
begin
  Self.CriarThread;
end;

procedure TfTarefa2.CriarThread;
var
  Thread1: TMyThread;
  Thread2: TMyThread;
  I: Integer;

begin
  inherited;
  if ( EdThread1.Text = '' ) or ( EdThread2.Text = '' ) then
  begin
    ShowMessage( 'Insira um valor v?lido!' );
    Exit;
  end;

  if not( Assigned( ListThread ) ) then
    ListThread := TList.Create;

  for I := 0 to QtdThread - 1 do
  begin
    if ListThread.Count <> QtdThread then
    begin
      ListThread.Add( TMyThread.Create( StrToInt( TEdit(
                  FindComponent( 'EdThread' + IntToStr( I + 1 ) ) ).Text ),
                  TProgressBar( FindComponent( 'ProgressBar' + IntToStr( I + 1 ) ) ) ) );
      TMyThread( ListThread[ I ] ).Resume;
      BtnInit1.Caption := 'Pausar';
    end
    else
    begin
      If not( TProgressBar( FindComponent( 'ProgressBar' + IntToStr( I + 1 ) ) ).Position =
                  TProgressBar( FindComponent( 'ProgressBar' + IntToStr( I + 1 ) ) ).Max ) then
      begin
        if TMyThread( ListThread[ I ] ).Suspended then
          TMyThread( ListThread[ I ] ).Resume
        else
          TMyThread( ListThread[ I ] ).Suspend;
      end
      else
      begin
        Count := Count + 1;
        if Count = QtdThread then
        begin
          FreeAndNil( ListThread );
          CriarThread;
        end;
      end;

      BtnInit1.Caption := 'Iniciar';
    end;

  end;
  Count := 0;

end;

procedure TfTarefa2.FormCreate( Sender: TObject );
begin
  inherited;
  Count := 0;
end;

end.
