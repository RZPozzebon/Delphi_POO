program Venda_Produto;

uses
  Vcl.Forms,
  frmPrincipal in 'View\frmPrincipal.pas' {FormPrincipal},
  ClasseCliente in 'Model\ClasseCliente.pas',
  ClienteController in 'Controller\ClienteController.pas',
  frmCliente in 'View\Cliente\frmCliente.pas' {frmCadastroCliente},
  DAOCliente in 'DAO\DAOCliente.pas',
  frmProduto in 'View\Produto\frmProduto.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.Run;
end.
