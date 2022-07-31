class Cell
{
  private PVector position;
  private int size;

  private Options options;

  private boolean collapsed = false;
  private Option option;

  //temp
  private color c = color(random(255), random(255), random(255));

  public Cell(PVector position, int size)
  {
    this.position = position;
    this.size = size;

    options = new Options();
  }

  public void collapse()
  {
    option = options.getRandomOption();

    if (option == null) return;

    collapsed = true;
    option.image.resize(size, size);
  }

  public void draw()
  {
    if (!collapsed) {
      strokeWeight(1);
      stroke(100);
      fill(30);
      rect(position.x, position.y, size, size);
      //fill(255);
      //text(options.size(), position.x + size/2, position.y + size/2);
    } else {
      imageMode(CENTER);
      pushMatrix();
      translate(position.x + size/2, position.y + size/2);
      rotate(radians(-90) * option.rotations);
      image(option.image, 0, 0);
      popMatrix();
      fill(255);
      //text(option.rules.up[0], position.x + size/2, position.y + size/2 - 10);
      //text(option.rules.right[0], position.x + size/2 + 10, position.y + size/2);
      //text(option.rules.down[0], position.x + size/2, position.y + size/2 + 10);
      //text(option.rules.left[0], position.x + size/2 - 10, position.y + size/2);
      //text(option.name, position.x + size/2, position.y + size/2);
    }
  }
}
