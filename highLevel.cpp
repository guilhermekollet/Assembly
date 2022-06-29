#include <iostream>
#include  <string>

using namespace std;

int main (){
    int vetA [] = {810 ,100, 560, 380, 600, 87};
    int vetB [] = {555, 817 ,124, 890 ,456};
    int vetC [] = {345, 200, 700, 180, 600, 490};
    int vetD[10];
    
    int sumA = 0 , sumB = 0 , sumC = 0; 
    int n = 6;
    int min = 419;
    int k = 0;

    for (int i = 0; i < 6; i++)
    {
        if(vetA[i] < min) 
        {
            cout << "valor menor encontrado no vetor A: " << vetA[i] << endl;
            vetD[k] = vetA[i];
            k++;
        }

    }

    for (int i = 0; i < 6; i++)
    {
        if(vetB[i] < min) 
        {
            cout << "valor menor encontrado no vetor B: " << vetB[i] << endl;
            vetD[k] = vetB[i];
            k++;
        }

    }

    for (int i = 0; i < 6; i++)
    {
        if(vetC[i] < min) 
        {
            cout << "valor menor encontrado no vetor C: " << vetC[i] << endl;
            vetD[k] = vetC[i];
            k++;
        }

    }

    cout << "vetor D: ";

    for (int i=0; i<k; i++)
    {

        cout << vetD[i] << " ";

    }
    cout << endl;
    cout << "k: " << k << endl;
    return 0 ;
}

