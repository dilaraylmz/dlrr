ArrayList<RectangleElement> elements; // ArrayList to store elements

void setup() {
  size(400, 400);
  background(255);
  elements = new ArrayList<RectangleElement>();
}

void draw() {
  background(255);
  
  // Display and update elements
  for (int i = 0; i < elements.size(); i++) {
    RectangleElement e = elements.get(i);
    e.display();
    e.update();
    
    // Remove elements that are out of bounds
    if (e.isOutOfBound()) {
      elements.remove(i);
    }
  }
  
  // Add new elements randomly
  if (random(1) < 0.03) { // Adjust the probability to control the frequency of appearance
    elements.add(new RectangleElement());
  }
}

// RectangleElement class
class RectangleElement {
  float x, y; // Position of the element
  float width, height; // Size of the element
  float transparency; // Transparency of the element
  float fadeSpeed; // Speed of fading
  
  RectangleElement() {
    x = random(width);
    y = height / 2;
    width = random(100, 400); // Adjusted sizes to be five times bigger
    height = random(100, 400); // Adjusted sizes to be five times bigger
    transparency = 255; // Initial transparency
    fadeSpeed = random(1, 5);
  }
  
  // Display the element
  void display() {
    noStroke();
    fill(255, 0, 0, transparency); // Color of the element (red with transparency)
    rectMode(CENTER);
    rect(x, y, width, height);
  }
  
  // Update the element's transparency
  void update() {
    transparency -= fadeSpeed;
  }
  
  // Check if the element is out of bounds
  boolean isOutOfBound() {
    return transparency <= 0;
  }
}
