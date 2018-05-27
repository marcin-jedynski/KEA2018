#include <cstdio>
#include <stack>
#include <queue>
using namespace std;

queue<int>VODWIEDZONE;//POmocniczy stos do symulacji odwiedzonych

void pokaz_odwiedzone()
{
    //Jakie już odwiedziliśmy
    queue<int>kopia = VODWIEDZONE;
    printf("Juz odwiedzone: ");
    while(!kopia.empty())
    {
        printf("%d  ",kopia.front());
        kopia.pop();
    }
}

void pokaz_zawartosc_stosu_i_odwiedzone(stack<int> stos)
{
    pokaz_odwiedzone();
    if(stos.empty())
    {
        printf("\nStos PUSTY!\n");
        return;
    }
    
    printf("\nZawartosc stosu:\n%d<--------- TOP\n",stos.top());
    stos.pop();
    while(!stos.empty())
    {
        printf("%d\n",stos.top());
        stos.pop();
    }
}

void pokaz_zawartosc_kolejki_i_odwiedzone(queue<int> kolejka)
{
    pokaz_odwiedzone();
    if(kolejka.empty())
    {
        printf("\nKolejka PUSTA!\n");
        return;
    }
    
    printf("\nZawartosc kolejki: %d",kolejka.front());
    kolejka.pop();
    while(!kolejka.empty())
    {
        printf("  %d",kolejka.front());
        kolejka.pop();
    }
}
////////////////////////////////////////////////////////////////////////


//////////////////BFS///////////////////////////////////////////////////

void BFS(int * G,int n,int szukany)
{
    queue<int> kolejka;
    
    bool V[n+1];
    for(int j=1;j<=n;++j)V[j] = 0;//Wierzchołki nie odwiedzone
    
    kolejka.push(szukany);//Wrzucamy startujący wierzchołek na kolejke
    
    while(!kolejka.empty())
    {
        pokaz_zawartosc_kolejki_i_odwiedzone(kolejka);//Do symulacji
        
        
        szukany = kolejka.front();
        kolejka.pop();//Usuwamy odwiedzany element
        
        printf("\n\nOdwiedzam: %d\n",szukany);
        
        VODWIEDZONE.push(szukany);//Do symulacji odwiedzonych
        
        V[szukany] = 0;//ODwiedziliśmy już ten
        
        for(int j = 1;j <= n;++j)
        {
            // if(G[(szukany*n)+j] != 0){printf("poszukiwanie znajomych dla: %d znajomy to: %d",szukany,G[(szukany*n)+j]);}
            // printf("poszukiwanie znajomych dla: %d znajomy to: %d",szukany,G[(szukany*n)+j]);
            if(G[(szukany*n)+j] != 0 && V[j] == 0)
            {
                kolejka.push(j);//Wrzucamy na stos jego sąsiadów
                V[j] = V[szukany]+1;//Znaznaczamy ,że go odwiedzimy!(w niedalekiej przyszłości)
                //Inaczej będziemy mieli np taką sytuację w stosie 2,3,4,2 <-- 2x dwójka
            }
        }
            for(int i=1;i<=n;i++)printf("odległość do %d to: %d\n",i,V[i]);
    }
    
    pokaz_zawartosc_kolejki_i_odwiedzone(kolejka);//Do symulacji
    
}
////////////////////////////////////////////////////////////////////////

int main()
{
    int n,m, vert,edge,color;
    scanf("%d %d", &n,&m);
    int * tab = new int[(n+1)*(n+1)]();
    for(int i=0;i<m;i++){
        scanf("%d %d %d",&vert,&edge,&color);
        tab[n*vert+edge]=color;
    }
    for(int i=1;i<=n;i++){
        for(int j=1;j<=n;j++){
            printf("%d ", tab[n*i+j]);
        }
        printf("\n");
    }
    printf("\n\nBFS\n\n");  
    BFS(tab,n,1);
    delete tab;
    
    return 0;
}