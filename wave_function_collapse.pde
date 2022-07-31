int mapSize = 100;
int windowSize = 1000;

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
}

void draw()
{
  map.pickNext();
  map.updateCells();
  map.draw();
}
