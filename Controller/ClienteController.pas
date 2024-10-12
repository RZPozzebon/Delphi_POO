unit ClienteController;

interface

uses
  ClasseCliente,System.SysUtils;

type
  TClienteController = class
    private
     FModeloCliente : TClasseCliente;

     // Metodos de valida��o
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
    raise Exception.Create('Nome obrigat�rio **');
  if (FModeloCliente.FSexo = '') then
    raise Exception.Create('Sexo obrigat�rio **');

end;

end.

