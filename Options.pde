class Options
{
  private OptionsLookup lookup;
  private ArrayList<Option> options;

  public Options()
  {
    lookup = globalLookup;

    options = new ArrayList<Option>();
    loadAllOptions();
  }

  public void loadAllOptions()
  {

    for (int i = 0; i < lookup.options.length; i++)
    {
      options.add(lookup.options[i]);
    }
  }

  public Option getRandomOption()
  {
    if (options.size() == 0) 
    {
      println("NO OPTIONS");
      return null;
    }
    if (options.size() == 1) return options.get(0);

    return options.get((int)random(options.size()));
  }

  public void setOptionsByRules(Rules rules, String rulesTo)
  {
    switch(rulesTo)
    {
    case "UP": 
      {
        ArrayList<Option> toRemove = new ArrayList<Option>();
        for(Option o : options)
        {
          if(!o.rules.equalRulesArrays(o.rules.down, rules.up))
          {
            toRemove.add(o);
          }
        }
        for(Option o : toRemove)
        {
           options.remove(o); 
        }
        break;
      }
    case "RIGHT": 
      {
        ArrayList<Option> toRemove = new ArrayList<Option>();
        for(Option o : options)
        {
          if(!o.rules.equalRulesArrays(o.rules.left, rules.right))
          {
            toRemove.add(o);
          }
        }
        for(Option o : toRemove)
        {
           options.remove(o); 
        }
        break;
      }
    case "DOWN": 
      {
        ArrayList<Option> toRemove = new ArrayList<Option>();
        for(Option o : options)
        {
          if(!o.rules.equalRulesArrays(o.rules.up, rules.down))
          {
            toRemove.add(o);
          }
        }
        for(Option o : toRemove)
        {
           options.remove(o); 
        }
        break;
      }
    case "LEFT": 
      {
        ArrayList<Option> toRemove = new ArrayList<Option>();
        for(Option o : options)
        {
          if(!o.rules.equalRulesArrays(o.rules.right, rules.left))
          {
            toRemove.add(o);
          }
        }
        for(Option o : toRemove)
        {
           options.remove(o); 
        }
        break;
      }
    default: 
      break;
    }
  }

  public int size()
  {
    return options.size();
  }
}
