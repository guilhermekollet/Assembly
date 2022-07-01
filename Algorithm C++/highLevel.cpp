#include <iostream>
#include  <string>

using namespace std;

int main ()
{
    
    int A [] = {810 ,100, 560, 380, 600, 87};
    int B [] = {800, 555, 817, 124, 890, 456};
    int C [] = {345, 200, 700, 180, 600, 490};

    int n = 6;
    int k = 0;

    int MIN = 1000;

    int sumA = 0;
    int sumB = 0;
    int sumC = 0;

    int D[50];
    
    cout << "Vetor A: ";

    for (int i = 0; i < n; i++)
    {

        cout << A[i] << " ";

    }

    cout << endl << "Vetor B: ";

    for (int i = 0; i < n; i++)
    {

        cout << B[i] << " ";

    }

    cout << endl << "Vetor C: ";

    for (int i = 0; i < n; i++)
    {

        cout << C[i] << " ";

    }

    cout << endl;
    cout << "n: " << n << endl;
    cout << endl;

    

    for(int i = 0; i < n; i++)
    {

        sumA += A[i];
        sumB += B[i];
        sumC += C[i];

    }

    sumA = sumA / n;
    sumB = sumB / n;
    sumC = sumC / n;

    cout << "media A: " << sumA << endl;
    cout << "media B: " << sumB << endl;
    cout << "media C: " << sumC << endl;

    cout << endl;

    if(sumA < MIN)
    MIN = sumA;

    if(sumB < MIN)
    MIN = sumB;

    if(sumC < MIN)
    MIN = sumC;

    cout << "Minimo: " << MIN << endl;

    cout << endl;

    for(int i = 0; i < n; i++)
    {
        if(A[i] < MIN) 
        {
            D[k] = A[i];
            k++;
        }
    }

    for(int i = 0; i < n; i++)
    {

        if(B[i] < MIN) 
        {
            D[k] = B[i];
            k++;
        }
    }

    for(int i = 0; i < n; i++)
    {

        if(C[i] < MIN) 
        {
            D[k] = C[i];
            k++;
        }
    }

    cout << "Vetor D: ";

    for (int i=0; i < k; i++)
    {

        cout << D[i] << " ";

    }

    cout << endl;

    cout << "k: " << k << endl;
    return 0 ;
}

