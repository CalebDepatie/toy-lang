module lexer;

token[] lex(const string s) {
  token[] tokens = [];
  int cur_ind    = 0;
  // known incoming format, ACTION SPACE VALUE || IDEN
  while (s[cur_ind] != ' ') { cur_ind++; }

  tokens ~= new token(tokenType.action, s[0..cur_ind]);
  cur_ind++;
  // number or iden
  if (s[cur_ind] >= '0' && s[cur_ind] <= '9') {
    tokens ~= new token(tokenType.value, s[cur_ind..s.length-1]);
  } else {
    tokens ~= new token(tokenType.iden, s[cur_ind..s.length-1]);
  }

  return tokens;
}

enum tokenType {
  action,
  value,
  iden
}

class token {
  immutable tokenType type;
  immutable string value;

  this(tokenType type, string value) pure @safe @nogc {
    this.type = type; this.value = value;
  }
  this(tokenType type, char value, int line) pure @safe {
    import std.conv: to;
    this.type = type; this.value = to!string(value);
  }

  override string toString() pure @trusted {
    import std.conv: to;
    char[] s;

    s ~= to!string(this.type) ~ ' ';
    s ~= this.value;

    return s;
  }
 };
