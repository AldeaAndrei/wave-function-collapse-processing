int mapSize = 25;
int windowSize = 500;

public OptionsLookup globalLookup; 

Map map;

void settings()
{
  size(windowSize, windowSize);
}

void setup()
{
  globalLookup = new OptionsLookup();
  map = new Map(mapSize, windowSize);

  //while (map.pickNext())
  //{
  //  map.updateCells();
  //}
}

void draw()
{

  map.pickNext();
  map.updateCells();

  map.draw();
}
