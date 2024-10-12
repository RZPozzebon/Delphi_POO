program Venda_Produto;

uses
  Vcl.Forms,
  frmPrincipal in 'View\frmPrincipal.pas' {Form1},
  ClasseCliente in 'Model\ClasseCliente.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
