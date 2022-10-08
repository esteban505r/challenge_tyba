import 'dart:math';

class Utils{

  static String randomUniversityImage(){
    Random random = new Random();
    int randomNumber = random.nextInt(100);
    if(randomNumber<33){
      return "university1.png";
    }
    if(randomNumber<66){
      return "university2.png";
    }
    return "university3.png";
  }

}