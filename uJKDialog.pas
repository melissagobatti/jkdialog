unit uJKDialog;

interface

uses
  Forms,
  ExtCtrls,
  Graphics,
  Controls,
  SysUtils,
  uformDialogs;

type
  TTipoDialogo = (tdMensagem, tdAlerta, tdErro, tdSucesso);

function JKDialog(ATitulo, AMensagem: String; ATipo: TTipoDialogo): boolean;

const
  Padrao_Azul = $00f39621;
  Padrao_Verm = $003946f6;
  Padrao_Amar = $000bc3ff;
  Padrao_Verd = $0052b14e;

implementation

function JKDialog(ATitulo, AMensagem: String; ATipo: TTipoDialogo): boolean;
var
  s: String;
begin
  s                            := ExtractFilePath(ParamStr(0));
  Result                       := True;
  JKFormDialog                 := TJKFormDialog.Create(nil);
  JKFormDialog.BorderStyle     := bsNone;
  JKFormDialog.Position        := poWorkAreaCenter;
  JKFormDialog.pTopo.Caption   := ATitulo;
  JKFormDialog.pTopo.Font.Size := 14;
  JKFormDialog.lTexto.Caption  := AMensagem;

  case ATipo of

    tdMensagem:
    begin
      JKFormDialog.Cor := Padrao_Azul;
      JKFormDialog.ACBrGIF.Filename := (s + 'icons/information.gif');
    end;

    tdAlerta:
    begin
      JKFormDialog.Cor := Padrao_Amar;
      JKFormDialog.ACBrGIF.Filename := (s + 'icons/alert.gif');
    end;

    tdErro:
    begin
      JKFormDialog.Cor := Padrao_Verm;
      JKFormDialog.ACBrGIF.Filename := (s + 'icons/stop.gif');
    end;

    tdSucesso:
    begin
      JKFormDialog.Cor := Padrao_Verd;
      JKFormDialog.ACBrGIF.Filename := (s + 'icons/sucess.gif');
    end;

  end;

  if (ATipo IN [tdAlerta, tdErro, tdSucesso]) then begin
    JKFormDialog.pNo.Visible  := False;
    JKFormDialog.lYes.Caption := 'OK';
  end;

  JKFormDialog.ACBrGIF.Start;
  Result := JKFormDialog.ShowModal = mrYes;

  FreeAndNil(JKFormDialog);
end;

end.
