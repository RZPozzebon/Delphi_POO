unit ClienteController;

interface

uses
  ClasseCliente,System.SysUtils,DAOCliente, Vcl.Dialogs;

type
  TClienteController = class
    private
     // Metodos de valida��o
     function emailValido(AEmail : String) : Boolean;
    public
     function validarDadosCliente(ModeloCliente : TClasseCliente) : Boolean;
     procedure Salvar(AModeloCliente : TClasseCliente);
  end;
implementation

{ TClienteController }
function TClienteController.emailValido(AEmail : String): Boolean;
begin
  //
end;

procedure TClienteController.Salvar(AModeloCliente: TClasseCliente);
var
  DAOCliente : TDAOCliente;
begin
  DAOCliente := TDAOCliente.Create;
  try
    try
      if (validarDadosCliente(AModeloCliente)) then
        DAOCliente.salvar(AModeloCliente);

      ShowMessage('Cliente cadastrado com sucesso.');
    except
      on e : Exception do
      begin
        raise Exception.Create(e.Message);
      end;
    end;
  finally
    FreeAndNil(DAOCliente);
  end;
end;

function TClienteController.validarDadosCliente(ModeloCliente : TClasseCliente): Boolean;
begin
  result := true;
  if(ModeloCliente.FNome = '') then
  begin
    result := false;
    raise Exception.Create('Nome obrigat�rio **');
  end;
  if (ModeloCliente.FSexo = '') then
  begin
    result := false;
    raise Exception.Create('Sexo obrigat�rio **');
  end;

  // Validar e-mail
  if(ModeloCliente.FContatoCliente = '') then
  begin
    result := false;
    raise Exception.Create('E-mail obrigat�rio **');
  end;
//  if not(emailValido(ModeloCliente.FContatoCliente)) then
//  begin
//    result := false;
//    raise Exception.Create('Favor preencher um e-mail v�lido.');
//  end;
  // Fim Valida��o e-mail
end;

end.

