#include <iostream>
using namespace std;

int main()
{
  register signed int count = 0;
  register char cmd;

  while(cin.get(cmd)){    
    if(cmd == '('){ count++; }
    if(cmd == ')'){ count--; }
  }
  cout << endl << "Floor: " << count << endl;
  
  return 0;
}
