program ProvaDelphiApp;

uses
  Vcl.Forms,
  uFrmPrincipal in 'uFrmPrincipal.pas' {menu},
  UMyThread in 'Model\UMyThread.pas',
  uFBase in 'View\uFBase.pas' {fBase},
  ufTarefa2 in 'View\ufTarefa2.pas' {fTarefa2},
  ufTarefa1 in 'View\ufTarefa1.pas' {fTarefa1},
  ufTarefa3 in 'View\ufTarefa3.pas' {fTarefa3},
  uProjeto in 'Model\uProjeto.pas',
  uPai in 'Model\uPai.pas',
  uDao in 'Model\uDao.pas',
  uProjetoDao in 'Model\uProjetoDao.pas',
  uController in 'Controller\uController.pas',
  uProjetoController in 'Controller\uProjetoController.pas';

{$R *.res}


begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMenu, Menu);
  Application.Run;

end.
