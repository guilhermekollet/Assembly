#include <iostream>
#include  <string>

using namespace std;

int main (){
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
    

    for(int i = 0; i < n; i++)
    {

        sumA += A[i];
        sumB += B[i];
        sumC += C[i];

    }

    sumA = sumA / n;
    sumB = sumB / n;
    sumC = sumC / n;

    if(sumA < MIN)
    MIN = sumA;

    if(sumB < MIN)
    MIN = sumB;

    if(sumC < MIN)
    MIN = sumC;

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

    return 0 ;
}

