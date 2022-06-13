class EnemyA extends GameObject {
  int Ecooldown, Ethreshold;

  EnemyA() {
    super(random(width), -20, 0, 3, 40, yellow2, 1);
    Ecooldown = 30;
    Ethreshold = Ecooldown;
  }

  void act() {
    super.act();

    // managing guns
    Ecooldown++;
    if ( Ecooldown>= Ethreshold) {
      //shoot
      objects.add(new EnemyBullet(x, y, 0, 10));
      objects.add(new EnemyBullet(x, y, 10, 0));
      objects.add(new EnemyBullet(x, y, 0, -10));
      objects.add(new EnemyBullet(x, y, -10, 0));
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
      objects.add(new Particles(x+5, y+5, 10, 10));
      objects.add(new Particles(x+3, y+3, 15, 10));
      objects.add(new Particles(x+4, y+2, 5, 10));
       objects.add(new Particles(x+6, y+7, -5, 10));
      // float x, float y, float vx, float vy
    }
    if (offScreen()) lives = 0;
  }
}
