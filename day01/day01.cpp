#include <iostream>
using namespace std;

int main()
{
  register signed int dws = 0;
  register signed int ups = 0;
  register char cmd;

  while(cin.get(cmd)){
    if(cmd == '('){ ups++; }
    if(cmd == ')'){ dws++; }
    if(ups-dws == -1){cout << "B1: " << (ups+dws) << endl; }
  }
  cout << "Floor: " << (ups-dws) << endl;
  
  return 0;
}
