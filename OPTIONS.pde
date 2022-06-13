void options() {
  fill(255);
  rect(600, 700, 150, 50);
  fill(255);
  text("Return Home", 700, 720);
}

void optionsClicks() {
  if ( mouseX >600 && mouseX< 700 && mouseY>700 && mouseY< 750) {
    mode=INTRO;
  }
}
