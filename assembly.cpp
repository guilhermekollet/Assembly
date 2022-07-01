#include <iostream>

int main ()
{
    
    int A [] = {345 ,100, 560, 943};
    int B [] = {800, 255, 817, 765};
    int C [] = {740, 200, 700, 180};

    int n = 4;
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
            std::cout << D[k] << " ";
            k++;
        }
    }

    for(int i = 0; i < n; i++)
    {
        if(B[i] < MIN) 
        {
            D[k] = B[i];
            std::cout << D[k] << " ";
            k++;
        }
    }

    for(int i = 0; i < n; i++)
    {
        if(C[i] < MIN) 
        {
            D[k] = C[i];
            std::cout << D[k] << " ";
            k++;
        }
    }
    std::cout << "- k: " << k;
    std::cin >> n; //apenas para não encerrar a execução

    return 0;
}