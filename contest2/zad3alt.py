t=int(input())
for i in range(t):
    n=int(input())
    x=input().split()
    for j in range(n):
        x[j]=(int(x[j]),j)
    c=1
    A=x
    r=n
    d={}
    while True:
        #print(A)
        B=[]
        B.append(A[0])
        for j in range(1,r-1):
            if min(A[j-1][0],A[j+1][0])<=A[j][0]:
                B.append(A[j])
            else:
                d[A[j]]=c
        B.append(A[r-1])
        if (B==A):
            break
        A=B
        r=len(A)
        c+=1
    #print(d)
    for j in range(n):
        if j==n-1:
            print(0)
        elif x[j] in d:
            print(d[x[j]],end=" ")
        else:
            print(0,end=" ")
 