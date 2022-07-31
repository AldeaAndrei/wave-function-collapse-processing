class Rules
{
  public String[] up;
  public String[] down;
  public String[] left;
  public String[] right;

  public Rules(String[] up, String[] right, String[] down, String[] left)
  {
    this.up = new String[up.length];
    this.down = new String[down.length];
    this.left = new String[left.length];
    this.right = new String[right.length];

    arrayCopy(up, this.up);
    arrayCopy(down, this.down);
    arrayCopy(left, this.left);
    arrayCopy(right, this.right);
  }

  public Rules(Rules copyRules)
  {
    this.up = new String[copyRules.up.length];
    this.down = new String[copyRules.down.length];
    this.left = new String[copyRules.left.length];
    this.right = new String[copyRules.right.length];

    arrayCopy(copyRules.up, this.up);
    arrayCopy(copyRules.down, this.down);
    arrayCopy(copyRules.left, this.left);
    arrayCopy(copyRules.right, this.right);
  }

  public boolean equalRulesArrays(String[] r1, String[] r2)
  {
    if (r1.length != r2.length) return false;

    for (int i = 0; i < r1.length; i++)
    {
      if (!r1[i].equals(r2[i])) return false;
    }

    return true;
  }

  public void rotate(int rotations)
  {
    if (rotations > 3) rotations %= 4;

    switch(rotations) {
    case 0: 
      {
        break;
      }
    case 1: 
      {
        String[] temp;
        temp = up;
        up = right;
        right = down;
        down = left;
        left = temp;
        break;
      }
    case 2: 
      {
        String[] temp;
        temp = up;
        up = down;
        down = temp;

        temp = right;
        right = left;
        left = temp;
        break;
      }
    case 3: 
      {
        String[] temp;
        temp = up;
        up = left;
        left = down;
        down = right;
        right = temp;
        break;
      }
    default: 
      break;
    }
  }
}
