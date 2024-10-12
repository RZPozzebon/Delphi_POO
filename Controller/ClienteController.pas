unit ClienteController;

interface

uses
  ClasseCliente,System.SysUtils;

type
  TClienteController = class
    private
     FModeloCliente : TClasseCliente;

     // Metodos de validação
     function validarDadosCliente : Boolean;
    public
     constructor Create(ModeloCliente : TClasseCliente);
  end;
implementation

{ TClienteController }

constructor TClienteController.Create(ModeloCliente: TClasseCliente);
begin
   FModeloCliente := ModeloCliente;

   validarDadosCliente;
end;

function TClienteController.validarDadosCliente: Boolean;
begin
  if(FModeloCliente.FNome = '') then
    raise Exception.Create('Nome obrigatório **');
  if (FModeloCliente.FSexo = '') then
    raise Exception.Create('Sexo obrigatório **');

end;

end.

