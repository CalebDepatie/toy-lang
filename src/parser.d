module parser;

class parse {
  private:
    import lexer: token;
    import std.stdio: writeln;

    int[string] stores;

    /*
    immutable void function(string)[string] actions = [
      "add": function(string a) { this.stores["str"] += this.stores[a]; },
      "sub": function(string a) { this.stores["str"] -= this.stores[a]; },
      "mul": function(string a) { this.stores["str"] *= this.stores[a]; },
      "div": function(string a) { this.stores["str"] /= this.stores[a]; },
      "mov": function(string a) { this.stores["str"] = this.stores[a]; },
      "set": function(string a) { this.stores[a] = this.stores["str"]; },
      "out": function(string a) { writeln(this.stores[a]); }
    ]; */

  public:
    this() @safe {
      stores["str"] = 0;
      stores["tmp"] = 0;
    }

    void exec(token[] tk) {
      import lexer: tokenType;
      import std.conv: to;

      string store = tk[1].value;

      if (tk[1].type == tokenType.value) {
        this.stores["tmp"] = to!int(tk[1].value);
        store = "tmp";
      }

      switch (tk[0].value) {
        case "add": {
          this.stores["str"] += this.stores[store];
          break;
        }
        case "sub": {
          this.stores["str"] -= this.stores[store];
          break;
        }
        case "mul": {
          this.stores["str"] *= this.stores[store];
          break;
        }
        case "div": {
          this.stores["str"] /= this.stores[store];
          break;
        }
        case "mov": {
          this.stores[store] = this.stores["str"];
          break;
        }
        case "set": {
          this.stores["str"] = this.stores[store];
          break;
        }
        case "out": {
          writeln(this.stores[store]);
          break;
        }
        default: assert(0);
      }

      //this.actions[tk[0].value](store);
    }

}
