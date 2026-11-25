print('\n'.join(map(str,dict(
    tuple(zip(range(0,100),range(100)))+
    tuple(zip(range(0,100,3),("fizz",)*(100//3)))+
    tuple(zip(range(0,100,5),("buzz",)*(100//5)))+
    tuple(zip(range(0,100,15),("fizzbuzz",)*(100//15)))
    ).values()))[9:])
