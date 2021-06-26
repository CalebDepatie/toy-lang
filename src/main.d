module main;

int main(string[] args) {
  import std.stdio: writeln;

  repl r = new repl();

  r.mainloop(); // READ - EVAL - PRINT - LOOP

  return 0;
}

class repl {
  private:

  public:
  this() pure @safe @nogc {}

  void mainloop() {
    import std.stdio: readln;
    import std.stdio: writeln;
    import lexer: lex;
    import parser: parse;

    auto p = new parse();

    string line;
    while ((line = readln()) !is null) {
      p.exec(lex(line));

    }
  }
}
