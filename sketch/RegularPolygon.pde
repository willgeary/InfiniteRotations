class RegularPolygon {
  float x;
  float y;
  float r;
  float n;
  float angle;
  ArrayList<PVector> vertices = new ArrayList<PVector>();
  
  RegularPolygon(float _x, float _y, float _r, float _n) {
    x = _x;
    y = _y;
    r = _r;
    n = _n;
    angle = TWO_PI / _n;
  }
  
  void init() {
    for (float a = 0; a < TWO_PI; a += angle) {
      float sx = x + cos(a) * r;
      float sy = y + sin(a) * r;
      vertices.add( new PVector(sx, sy));
    }
  }
  
  void show() {
    beginShape();
    for (int i = 0; i < vertices.size(); i++) {
      PVector vert = vertices.get(i);
      vertex(vert.x, vert.y);
    }
    endShape(CLOSE);
  }
  
  void star() {
    for (int i=0; i < vertices.size(); i++) {
      PVector start = vertices.get(i);
      for (int j=0; j < vertices.size(); j++) {
        PVector end = vertices.get(j);
        line(start.x, start.y, end.x, end.y);
      }
    }
  }
  
  ArrayList<PVector> getVertices() {
    return vertices;
  }
}