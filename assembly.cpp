#include <iostream>

int main (){
    int vetA [] = {810 ,100, 560, 380, 600, 87};
    int vetB [] = {800, 555, 817, 124, 890, 456};
    int vetC [] = {345, 200, 700, 180, 600, 490};
    int vetD[10];
    
    int N = 6;
    int K = 0;
    int I = 0;
    int MIN = 1000;

    int sumA = 0;
    int sumB = 0;
    int sumC = 0;

    int mediaA = 0;
    int mediaB = 0;
    int mediaC = 0;
    
    while(I < N)
    {
        sumA += vetA[I];
        sumB += vetB[I];
        sumC += vetC[I];

        I++;
    }

    mediaA = sumA / N;
    mediaB = sumB / N;
    mediaC = sumC / N;

    if(mediaA < MIN)
    MIN = mediaA;

    if(mediaB < MIN)
    MIN = mediaB;

    if(mediaC < MIN)
    MIN = mediaC;

    I = 0;

    while(I < N)
    {
        if(vetA[I] < MIN) 
        {
            vetD[K] = vetA[I];
            K++;
        }

        if(vetB[I] < MIN) 
        {
            vetD[K] = vetB[I];
            K++;
        }

        if(vetC[I] < MIN) 
        {
            vetD[K] = vetC[I];
            K++;
        }

        I++;

    }

return 0 ;
}

