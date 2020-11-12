unit mrextafar;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Shape1: TShape;
    Shape2: TShape;
    Timer1: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);

    procedure Timer1Timer(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  xSpeed:integer;
  ySpeed:integer;
  score:integer=0;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Timer1Timer(Sender: TObject);
begin

     shape1.top:=shape1.top+ySpeed;
     shape1.left:=shape1.left+xSpeed;
     label2.caption:=inttostr(shape1.Left);
     label3.caption:=inttostr(shape1.top);


     if (shape1.left<=0) then xSpeed:=-xSpeed;//left
     if (shape1.left>=Form1.width -shape1.width) then xSpeed:=-xSpeed;//right
     if (shape1.top<=0) then ySpeed:=-ySpeed;//top

     if ( (shape1.top>=550-shape1.height) and (shape1.left>=shape2.left) and (shape1.left<=shape2.Left+shape2.Width) ) then   //platform
     begin
       yspeed:=-yspeed;
       score:=score+1;
       Label1.caption:='score'+inttostr(score);
       end;
     if (shape1.Top>=556) then
     begin
       timer1.Enabled:=false;
       button1.Visible:=true;
       button2.Visible:=true;
       label4.Visible:=true;
       button1.caption:='Restart';
     end;
     end;

procedure TForm1.FormCreate (Sender: TObject);
begin
xSpeed:=4;
ySpeed:=4;
button1.visible:=true;
button1.caption:='Start';
timer1.enabled:=false;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  button1.Visible:=true;
  Label1.caption:='Score: 0';
  shape1.Top:=210;
  shape1.left:=210;
  shape2.top:=550;
  shape2.left:=175;
  timer1.Enabled:=true;
  button1.visible:=false;
  button2.Visible:=False;
  label4.Visible:=false;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
 button2.Visible:=true;
 CLOSE();
 button2.Visible:=False;
 button1.visible:=false;
 label4.Visible:=false;
end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState
  );
begin
  if key = 37 then shape2.left:=shape2.left-8;
  if key = 39 then shape2.left:=shape2.left+8;

  if (shape2.left<=0) then shape2.left:=0;
  if (shape2.left+shape2.width>=Form1.Width)then shape2.left:=Form1.Width-shape2.width;
end;




end.

