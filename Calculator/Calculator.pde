Button[] numButtons = new Button[10];
Button[] opButtons = new Button[12];
String ls, rs;
float ans;
char op;
boolean left, eq;

void setup() {
  size(200, 300);
  //SIZE: 200, 325
  ls = "0";
  rs="0";
  ans = 0.0;
  op = ' ';
  left = true;
  eq = false;
  numButtons[0] = new Button(55, 225, 40, 20).asNumber(0);
  numButtons[1] = new Button(10, 150, 40, 20).asNumber(1);
  numButtons[2] = new Button(55, 150, 40, 20).asNumber(2);
  numButtons[3] = new Button(100, 150, 40, 20).asNumber(3);
  numButtons[4] = new Button(10, 175, 40, 20).asNumber(4);
  numButtons[5] = new Button(55, 175, 40, 20).asNumber(5);
  numButtons[6] = new Button(100, 175, 40, 20).asNumber(6);
  numButtons[7] = new Button(10, 200, 40, 20).asNumber(7);
  numButtons[8] = new Button(55, 200, 40, 20).asNumber(8);
  numButtons[9] = new Button(100, 200, 40, 20).asNumber(9);


  opButtons[0] = new Button(145, 125, 40, 20).asOperation('C');
  opButtons[1] = new Button(145, 150, 40, 20).asOperation('+');
  opButtons[2] = new Button(145, 175, 40, 20).asOperation('-');
  opButtons[3] = new Button(145, 200, 40, 20).asOperation('*');
  opButtons[4] = new Button(145, 225, 40, 20).asOperation('/');
  opButtons[5] = new Button(10, 225, 40, 20).asOperation('.');
  opButtons[6] = new Button(145, 250, 40, 20).asOperation('=');
  opButtons[7] = new Button(10, 125, 40, 20).asOperation('n');
  opButtons[8] = new Button(10, 250, 40, 20).asOperation('^');
  opButtons[9] = new Button(100, 225, 40, 20).asOperation('%');
  opButtons[10] = new Button(100, 250, 40, 20).asOperation('√');
  opButtons[11] = new Button(55, 250, 40, 20).asOperation('$');
}

void draw() {
  background(0);
  for (int i=0; i<numButtons.length; i++) {
    numButtons[i].display();
    numButtons[i].over();
  }
  for (int i=0; i<opButtons.length; i++) {
    opButtons[i].display();
    opButtons[i].over();
  }
  updateDisplay();
}

void mousePressed() {
  for (int i=0; i<numButtons.length; i++) {
    if (numButtons[i].hov && left) {
      ls += numButtons[i].v;
      //!=not
    } else if (numButtons [i].hov && !left) {
      rs+= numButtons[i].v;
    }
  }
  for (int i=0; i<opButtons.length; i++) {
    if (opButtons[i].hov && opButtons[i].o == '+') {
      left = false;
      op = opButtons[i].o;
      rs = "";
    } else if (opButtons[i].hov && opButtons[i].o == '-') {
      left = false;
      op = opButtons[i].o;
      rs = "";
    } else if (opButtons[i].hov && opButtons[i].o == '*') {
      left = false;
      op = opButtons[i].o;
      rs = "";
    } else if (opButtons[i].hov && opButtons[i].o == '/') {
      left = false;
      op = opButtons[i].o;
      rs = "";
    } else if (opButtons[i].hov && opButtons[i].o == 'C') {
      performClear();
    } else if (opButtons[i].hov && opButtons[i].o == '=') {
      eq = true;
      performCalc();
    } else if (opButtons[i].hov && opButtons[i].o == 'n') {
      if (left) {
        ans = float(ls)*-1;
        ls = str((float)ans);
      } else {
        ans = float(rs)*-1;
        rs = str((float)ans);
      }
    } else if (opButtons[i].hov && opButtons[i].o == '%') {
      if (left) {
        ans = float(ls)*0.01;
        ls = str((float)ans);
      } else {
        ans = float(rs)*0.01;
        rs = str((float)ans);
      }
    } else if (opButtons[i].hov && opButtons[i].o == '^') {
      if (left) {
        ans = float(ls)*float(ls);
        ls = str((float)ans);
      } else {
        ans = float(rs)*float(rs);
        rs = str((float)ans);
      }
    } else if (opButtons[i].hov && opButtons[i].o == '$') {
      if (left) {
        ans = float(ls)*float(ls)*float(ls);
        ls = str((float)ans);
      } else {
        ans = float(rs)*float(rs)*float(rs);
        rs = str((float)ans);
      }
    } else if (opButtons[i].hov && opButtons[i].o == '.') {
      if (left) {
        ls += opButtons[i].o;
      } else {
        rs += opButtons[i].o;
      }
    } else if (opButtons[i].hov && opButtons[i].o == '√') {
      if (left) {
        ans = sqrt(float(ls));
        ls = str((float)ans);
      } else {
        ans = sqrt(float(rs));
        rs = str((float)ans);
      }
    }
  }
}
void performClear() {
  ls = "0";
  rs = "0";
  ans = 0.0;
  op = ' ';
  left = true;
  eq = false;
}

void updateDisplay() {
  fill(90, 100);
  noStroke();
  rect(13, 13, 170, 85, 4);
  textSize(20);
  fill(177);
  //text("Left:" + left, 15, 35);
  //text("Op:" + op, 10, 110);
  //text("Number:" + ls, 20, 35);
  //text("" + rs, 90, 35);
  if (eq) {
    text((float)ans, 15, 80);
  } else {
    if (left) {
      text(ls, 15, 80);
    } else {
      text(rs, 15, 80);
    }
  }
}
void performCalc() {
  switch(op) {
  case '+':
    ans = float(ls)+float(rs);
    ls = str((float)ans);
    left = true;
    break;
  case'-':
    ans = float(ls)-float(rs);
    ls = str((float)ans);
    left = true;
    break;
  case'*':
    ans = float(ls)*float(rs);
    ls = str((float)ans);
    left = true;
    break;
  case'/':
    ans = float(ls)/float(rs);
    ls = str((float)ans);
    left = true;
    break;
  }
}
