class Map
{
  private int mapSize;
  private int windowSize;

  private Cell[][] cells;

  private ArrayList<Integer> uncollapsed;

  public Map(int mapSize, int windowSize)
  {
    this.mapSize = mapSize;
    this.windowSize = windowSize;

    cells = new Cell[mapSize][mapSize];

    initMap();
    initUncollapsed();

    //cells[mapSize/2][mapSize/2].collapse();
  }

  private void initUncollapsed()
  {
    uncollapsed = new ArrayList<Integer>();

    for (int  i = 0; i < mapSize*mapSize; i++)
    {
      uncollapsed.add(i);
    }
  }

  private void initMap()
  {
    int cellSize = windowSize/mapSize;

    for (int  i = 0; i < mapSize; i++)
    {
      for (int  j = 0; j < mapSize; j++)
      {
        cells[i][j] = new Cell(new PVector(i * cellSize, j * cellSize), cellSize);
      }
    }
  }

  public void updateCells()
  {
    for (int  i = 0; i < mapSize; i++)
    {
      for (int  j = 0; j < mapSize; j++)
      {
        if (cells[i][j].collapsed)
        {
          if (i - 1 >= 0) 
          {
            cells[i - 1][j].options.setOptionsByRules(cells[i][j].option.rules, "LEFT");
          }
          if (i + 1 < mapSize) 
          {
            cells[i + 1][j].options.setOptionsByRules(cells[i][j].option.rules, "RIGHT");
          }
          if (j - 1 >= 0) 
          {
            cells[i][j - 1].options.setOptionsByRules(cells[i][j].option.rules, "UP");
          }
          if (j + 1 < mapSize) 
          {
            cells[i][j + 1].options.setOptionsByRules(cells[i][j].option.rules, "DOWN");
          }
        }
      }
    }
  }

  public boolean pickNext()
  {
    int minOp = 999999;
    ArrayList<Cell> cellsToCollapse = new ArrayList<Cell>();
    ArrayList<Integer> cellsToCollapseIndex = new ArrayList<Integer>();

    //println(uncollapsed.size());
    for (Integer i : uncollapsed)
    {
      int op = cells[i / mapSize][i % mapSize].options.size();
      if (op < minOp) minOp = op;
    }

    //for (int  i = 0; i < mapSize; i++)
    //{
    //  for (int  j = 0; j < mapSize; j++)
    //  {
    //    if (!cells[i][j].collapsed)
    //    {
    //      if (cells[i][j].options.size() < minOp &&
    //        cells[i][j].options.size() > 0)
    //      {
    //        minOp = cells[i][j].options.size();
    //      } else if (cells[i][j].options.size() == 0)
    //      {
    //        //initMap();
    //        //println("zero case");
    //      }
    //    }
    //  }
    //}

    for (Integer i : uncollapsed)
    {
      int op = cells[i / mapSize][i % mapSize].options.size();
      if (cells[i / mapSize][i % mapSize].options.size() == minOp)
      {
        cellsToCollapse.add(cells[i / mapSize][i % mapSize]);
        cellsToCollapseIndex.add(i);
      }
    }

    //for (int  i = 0; i < mapSize; i++)
    //{
    //  for (int  j = 0; j < mapSize; j++)
    //  {
    //    if (!cells[i][j].collapsed)
    //    {
    //      if (cells[i][j].options.size() == minOp)
    //      {
    //        cellsToCollapse.add(cells[i][j]);
    //        cellsToCollapseIndex.add(i * mapSize + j);
    //      }
    //    }
    //  }
    //}

    if (cellsToCollapse.size() < 1)
    {
      //cells[(int)random(mapSize)][(int)random(mapSize)].collapse();
      return false;
    }

    int rand = (int)random(cellsToCollapse.size());

    if (!cellsToCollapse.get(rand).collapse())
    {
      solveUncollapsed(rand);
    }

    uncollapsed.remove(cellsToCollapseIndex.get(rand));

    if (uncollapsed.size() == 0) return false;
    return true;
  }

  public void solveUncollapsed(int index)
  {

    int uncollapsedi = index/mapSize;
    int uncollapsedj = index%mapSize;
    
    println("i:" + index);
    println("x: " + uncollapsedi);
    println("y: " + uncollapsedj);

    int removeSize = 2;

    for (int i = -removeSize; i <= removeSize; i++)
    {
      for (int j = -removeSize; j <= removeSize; j++)
      {
        if((0 <= uncollapsedi + i && uncollapsedi + i < mapSize) && (0 <= uncollapsedj + j && uncollapsedj + j < mapSize))
        {
          int uncollapseIndex = (uncollapsedi + i) * mapSize + (uncollapsedj + j);
          if(uncollapsed.contains(uncollapseIndex))
          {
             cells[uncollapsedi + i][uncollapsedj + j].uncollapse(); 
          }
          else
          {
            uncollapsed.add(uncollapseIndex);
            cells[uncollapsedi + i][uncollapsedj + j].uncollapse();
          }
        }
      }
    }
  }

  public void draw()
  {
    for (int  i = 0; i < mapSize; i++)
    {
      for (int  j = 0; j < mapSize; j++)
      {
        cells[i][j].draw();
      }
    }
  }
}
