#include #include
using namespace std;

int main ()
{

	int vetA [] = {810 ,100, 560, 380, 600, 87};
	int vetB [] = {555, 817 ,124, 890 ,456};
	int vetC [] = {345, 200, 700, 180, 600, 490};

	int sumA = 0 , sumB = 0 , sumC = 0;
	int n = 6;

	for (int i = 0; i < 6; i++)
	{
		sumA += vetA[i];
	}

	cout << sumA << endl;

return 0;
}