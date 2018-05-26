#include <stdio.h>
int main(int argc, char const *argv[])
{
    int input;
    scanf("%d", &input);
    switch (input)
    {
    case  0:
        printf("%d\n",1);
        break;
    case  1:
        printf("%d\n",1);
        break;
    case  2:
        printf("%d\n",2);
        break;
    case  3:
        printf("%d\n",6);
        break;
    case  4:
        printf("%d\n",4);
        break;
    default:
        printf("%d\n",0);
        break;
    }

    return 0;
}
