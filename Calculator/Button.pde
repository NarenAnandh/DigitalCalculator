class Button {
  int x, y, w, h, v; //Position
  char o;
  boolean hov, num; //Hover

  //Constructer
  Button(int x, int y, int w, int h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }

  Button asNumber(int v) {
    num = true;
    this.v = v;
    return this;
  }

  Button asOperation(char o) {
    num = false;
    this.o = o;
    return this;
  }
  //Display method
  void display() {
    //shadow
    fill(180, 180, 180, 80);
    textFont(loadFont("Krungthep-48.vlw"));
    noStroke();
    rect(x+3, y+3, w, h, 4);
    if (hov) {
      fill(150);
    } else {
      fill(180);
    }
    stroke(0);
    rect(x, y, w, h);
    fill(0);
    textSize(14);
    if (num) {
      text(v, x+5, y+h-4);
    } else {
      if (o == 'C') {
        text("C", x+5, y+h-5);
      } else if (o == '/') {
        text("/", x+5, y+h-5);
      } else if (o == '%') {
        text("%", x+5, y+h-5);
      } else if (o == '.') {
        text(".", x+5, y+h-5);
    } else if (o == '√') {
        text("√", x+5, y+h-5);
    } else if (o == 'n') {
      text("+/-", x+5, y+h-5);
    } else if (o == '-') {
      text("-", x+5, y+h-5);
    } else if (o == '=') {
      text("=", x+6, y+h-5);
    } else if (o == '+') {
      text("+", x+6, y+h-5);
    } else if (o == '*') {
      text("X", x+6, y+h-5);
    } else if (o == '^') {
      text("^2", x+6, y+h-5);
    } else if (o == '$') {
      text("^3", x+6, y+h-5);
    }else {
      text(o, x, y);
    }
  }
}

// Hover method
void over() {
  hov = mouseX>x && mouseX<x+w && mouseY>y && mouseY<y+h;
}
}
