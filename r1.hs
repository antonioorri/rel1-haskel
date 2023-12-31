-------------------------------------------------------------------------------
-- Estructuras de Datos. 2º ETSI Informática. UMA
-- Práctica 1
--
-- Alumno: APELLIDOS, NOMBRE
-------------------------------------------------------------------------------

import Test.QuickCheck

-- Ejercicio 1
esTerna :: Integer -> Integer -> Integer -> Bool
esTerna x y z | z*z == x*x + y*y = True
              | otherwise = False

terna :: Integer -> Integer -> (Integer,Integer,Integer)
terna x y = (x*x - y*y, 2*x*y , x*x+y*y)

p_ternas x y = x>0 && y>0 && x>y ==> esTerna l1 l2 h
    where
        (l1,l2,h) = terna x y

-------------------------------------------------------------------------------
-- Ejercicio 2 - intercambia
-------------------------------------------------------------------------------

intercambia :: (a,b) -> (b,a)
intercambia (x,y) = (y,x)

-------------------------------------------------------------------------------
-- Ejercicio 3 - ordena2 y ordena3
-------------------------------------------------------------------------------

-- 3.a
ordena2 :: Ord a => (a,a) -> (a,a)
ordena2 (x,y)   | x>y =(y,x)
                | otherwise = (x,y)

p1_ordena2 x y = enOrden (ordena2 (x,y))
   where enOrden (x,y) = x <= y

p2_ordena2 x y = mismosElementos (x,y) (ordena2 (x,y))
   where
      mismosElementos (x,y) (x',y') =
           (x == x' && y == y') || (x == y' && y == x')

-- 3.b
ordena3 :: Ord a => (a,a,a) -> (a,a,a)
ordena3 (x,y,z) | x<=y && y<=z = (x,y,z)
                | x<=z && z<=y = (x,z,y)
                | y<=x && x<=z = (y,x,z)
                | y<=z && z<=x = (y,z,x)
                | z<=x && x<=y = (z,x,y)
                | z<=y && y<=x = (z,y,x)
                
                


-- 3.c
p1_ordena3 x y z = enOrden (ordena3 (x,y,z))
   where enOrden (x,y,z) = x <= y && y<=z
p2_ordena3 x y z = mismosElementos (x,y,x) (ordena3 (x,y,z))
   where
      mismosElementos (x,y,z) (x',y',z') =
           (x == x' && y == y' && z== z') 
           || (x == y' && y == x' && z == z')
           || (x==z' && y==y' && z == z')
           || (x==x' && y==z' && z ==y')
-------------------------------------------------------------------------------
-- Ejercicio 4 - max2
-------------------------------------------------------------------------------

-- 4.a
max2 :: Ord a => a -> a -> a
max2 x y    | x>=y = x
            |otherwise = y

-- 4.b
-- p1_max2: el máximo de dos números x e y coincide o bien con x o bien con y.

p1_max2 x  y = x == max2 x y  || y == max2 x y
-- p2_max2: el máximo de x e y es mayor o igual que x y mayor o igual que y.

p2_max2 x y = max2 x y >= x && max2 x y >= y

-- p3_max2: si x es mayor o igual que y, entonces el máximo de x e y es x.

p3_max2 x y =  x>= y && max x y == x

-- p4_max2: si y es mayor o igual que x, entonces el máximo de x e y es y.

p4_max2 x y =  x<= y && max x y == y

-------------------------------------------------------------------------------
-- Ejercicio 5 - entre (resuelto, se usa en el ejercicio 7)
-------------------------------------------------------------------------------

entre :: Ord a => a -> (a, a) -> Bool
entre x (inf,sup) = inf <= x && x <= sup

--Ejercicio 6

iguales3 :: Eq a => (a,a,a) -> Bool
iguales3(x,y,z) = x==y && x == z && z==y

-------------------------------------------------------------------------------
-- Ejercicio 7 - descomponer
-------------------------------------------------------------------------------

-- Para este ejercicio nos interesa utilizar la función predefinida:
--
--              divMod :: Integral a => a -> a -> (a, a)
--
-- que calcula simultáneamente el cociente y el resto de la división entera:
--
--   *Main> divMod 30 7
--   (4,2)

-- 7.a
type TotalSegundos = Integer
type Horas         = Integer
type Minutos       = Integer
type Segundos      = Integer

descomponer :: TotalSegundos -> (Horas,Minutos,Segundos)
descomponer x = ()

-- 7.b
p_descomponer x = x>=0 ==> h*3600 + m*60 + s == x
                           && m `entre` (0,59)
                           && s `entre` (0,59)
                             where (h,m,s) = descomponer x

-------------------------------------------------------------------------------
-- Ejercicio 14 - potencia
-------------------------------------------------------------------------------

-- 14.a
potencia :: Integer -> Integer -> Integer
potencia b n = undefined -- completar

-- 14.b
potencia' :: Integer -> Integer -> Integer
potencia' b n = undefined -- completar

-- 14.c
p_pot b n =
   potencia b m == sol && potencia' b m == sol
   where sol = b^m
         m = abs n
-- 14.d
{-

Escribe en este comentario tu razonamiento:

-}

-------------------------------------------------------------------------------
-- Ejercicio 17 - mediana
-------------------------------------------------------------------------------
{-

mediana :: Ord a => (a, a, a, a, a) -> a
mediana (x,y,z,t,u)
 | x > z 		= mediana (z,y,x,t,u)
 | y > z   		= mediana (x,z,y,t,u)
  ...

-}