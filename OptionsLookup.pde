class OptionsLookup
{
  public OptionsLookup()
  {
    println("OptionsLookup");
  }

  private Rules X = new Rules(
    new String[]{"x"}, 
    new String[]{"x"}, 
    new String[]{"x"}, 
    new String[]{"x"}
    ); 

  private Rules T = new Rules(
    new String[]{"x"}, 
    new String[]{"i"}, 
    new String[]{"i"}, 
    new String[]{"i"}
    );

  private Rules I = new Rules(
    new String[]{"i"}, 
    new String[]{"x"}, 
    new String[]{"i"}, 
    new String[]{"x"}
    );

  private Rules L = new Rules(
    new String[]{"i"}, 
    new String[]{"i"}, 
    new String[]{"x"}, 
    new String[]{"x"}
    );

  private Rules V = new Rules(
    new String[]{"i"}, 
    new String[]{"x"}, 
    new String[]{"x"}, 
    new String[]{"x"}
    );

  private Rules TR = new Rules(
    new String[]{"w"}, 
    new String[]{"x"}, 
    new String[]{"i"}, 
    new String[]{"x"}
    );

  private Rules W = new Rules(
    new String[]{"x"}, 
    new String[]{"w"}, 
    new String[]{"x"}, 
    new String[]{"w"}
    );

  private Rules BR = new Rules(
    new String[]{"i"}, 
    new String[]{"w"}, 
    new String[]{"i"}, 
    new String[]{"w"}
    );

  public Option[] options = {
    new Option("X", "resources/substrate.png", 0, X), 

    new Option("T-r0", "resources/t.png", 0, T), 
    new Option("T-r1", "resources/t.png", 1, T), 
    new Option("T-r2", "resources/t.png", 2, T), 
    new Option("T-r3", "resources/t.png", 3, T), 

    new Option("I-r0", "resources/track.png", 0, I), 
    new Option("I-r1", "resources/track.png", 1, I), 

    new Option("L-r0", "resources/turn.png", 0, L), 
    new Option("L-r1", "resources/turn.png", 1, L), 
    new Option("L-r2", "resources/turn.png", 2, L), 
    new Option("L-r3", "resources/turn.png", 3, L), 

    new Option("TR-r0", "resources/transition.png", 0, TR), 
    new Option("TR-r1", "resources/transition.png", 1, TR), 
    new Option("TR-r2", "resources/transition.png", 2, TR), 
    new Option("TR-r3", "resources/transition.png", 3, TR), 

    new Option("W-r0", "resources/wire.png", 0, W), 
    new Option("W-r1", "resources/wire.png", 1, W), 
    new Option("W-r2", "resources/wire.png", 2, W), 
    new Option("W-r3", "resources/wire.png", 3, W), 

    new Option("BR-r0", "resources/bridge.png", 0, BR), 
    new Option("BR-r1", "resources/bridge.png", 1, BR), 
    new Option("BR-r2", "resources/bridge.png", 2, BR), 
    new Option("BR-r3", "resources/bridge.png", 3, BR), 

    new Option("V-r0", "resources/vias.png", 0, V), 
    new Option("V-r1", "resources/vias.png", 1, V), 
    new Option("V-r2", "resources/vias.png", 2, V), 
    new Option("V-r3", "resources/vias.png", 3, V)
  };
}
