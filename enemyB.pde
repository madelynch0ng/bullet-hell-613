class EnemyB extends GameObject {

  int Ecooldown, Ethreshold;

  EnemyB() {
    super(random(width), -20, 0, 3, 40, o1, 1);
    Ecooldown = 30;
    Ethreshold = Ecooldown;
  }

  void act() {
    super.act();

    //shoot

    Ecooldown++;
    if ( Ecooldown>= Ethreshold) {
      //shoot
      objects.add(new EnemyBullet(x+5, y, 10, 0));
      Ecooldown = 0;
    }


    //collisions
    int i = 0;
    while (i < objects.size()) {
      GameObject obj = objects.get(i); 
      if (obj instanceof Bullet) {
        if (collidingWith(obj)) {
          lives--;
        }
      }
      i++;
    }
    if (lives==0) {
      objects.add(new Particles(x, y, 10, 10));
      objects.add(new Particles(x, y, 5, 10));
      objects.add(new Particles(x, y, 3, 10));
    }
    if (offScreen()) lives = 0;
    if (offScreen()) lives = 0;
  }
}
