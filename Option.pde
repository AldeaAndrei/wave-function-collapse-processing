class Option
{
 
  private String name;
  
  private Rules rules;
  
  private PImage image;
  private int rotations;
  
  public Option(String name, String imagePath, int rotations, Rules rules)
  {
    this.name = name;
    this.rules= new Rules(rules);
    //load image
    this.image = loadImage(imagePath);
    //rotate
    this.rotations = rotations;
    this.rules.rotate(rotations);
    
  }
  
}
