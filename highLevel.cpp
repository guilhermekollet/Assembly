#include <iostream>
#include  <string>

using namespace std;

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

    cout << "Vetor A: ";

    for (int i=0; i < N; i++)
    {

        cout << vetA[i] << " ";

    }

    cout << endl << "Vetor B: ";

    for (int i=0; i < N; i++)
    {

        cout << vetB[i] << " ";

    }

    cout << endl << "Vetor C: ";

    for (int i=0; i < N; i++)
    {

        cout << vetC[i] << " ";

    }

    cout << endl;
    cout << "N: " << N << endl;
    cout << endl;

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

    cout << "Somatorio A: " << sumA << " media A: " << mediaA << endl;
    cout << "Somatorio B: " << sumB << " media B: " << mediaB << endl;
    cout << "Somatorio C: " << sumC << " media C: " << mediaC << endl;

    cout << endl;

    if(mediaA < MIN)
    MIN = mediaA;

    if(mediaB < MIN)
    MIN = mediaB;

    if(mediaC < MIN)
    MIN = mediaC;

    cout << "Minimo: " << MIN << endl;

    cout << endl;

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

    cout << "vetor D: ";

    for (int i=0; i < K; i++)
    {

        cout << vetD[i] << " ";

    }

    cout << endl;

    cout << "K: " << K << endl;
    return 0 ;
}

