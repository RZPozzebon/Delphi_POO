unit ClienteController;

interface

uses
  ClasseCliente,System.SysUtils,DAOCliente, Vcl.Dialogs,System.RegularExpressions;

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
const
  EmailPattern = '^([a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,})$';
var
  RegEx: TRegEx;
begin
  // Inicializa a express�o regular
  RegEx := TRegEx.Create(EmailPattern);
  // Verifica se o e-mail corresponde ao padr�o
  Result := RegEx.IsMatch(AEmail);
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
  if (DateToStr(ModeloCliente.FDataAniversario) = '') then
  begin
    result := false;
    raise Exception.Create('Data obrigat�ria **');
  end;
  // Validar e-mail
  if not(emailValido(ModeloCliente.FContatoCliente)) then
  begin
    result := false;
    raise Exception.Create('E-mail inv�lido.');
  end;
  // Fim Valida��o e-mail
end;

end.

