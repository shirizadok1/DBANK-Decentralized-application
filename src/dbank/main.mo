import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank {
  stable var currentValue: Float = 300;
  currentValue := 300;
    Debug.print(debug_show(currentValue));


  stable var startTime= Time.now();
  //startTime := Time.now();
  Debug.print(debug_show(startTime));

  let id = 4847484848744848;
  //Debug.print(debug_show(id));

  public func topUp(amount: Float) {
    currentValue += amount;
   Debug.print(debug_show(currentValue));
};

  public func withdrawl(amount: Float){
    let tempValue: Float = currentValue - amount;
    if(tempValue >= 0) {
    currentValue -= amount;
    Debug.print(debug_show(currentValue));
    } else {
      Debug.print("error");
    }
  };

  public query func checkBalance(): async Float {
    return currentValue;
  };

  //topUp();

  public func compound () {
    let currentTime = Time.now();
    let timeElapesedNS = currentTime- startTime;
    let timeElapesedS = timeElapesedNS / 1000000000; //converting nano seconds to seconds
    currentValue := currentValue * (1.01 ** Float.fromInt(timeElapesedS));
    startTime := currentTime;
  }
}
