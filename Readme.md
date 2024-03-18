#Exemples simples de programmes lex/flex

[Flex](https://fr.wikipedia.org/wiki/Flex_(logiciel)) est un générateur d'analyseurs lexicaux pour C.

Il prend en entrée une spécification définie avec des expressions régulières et leurs actions associées et 
génère en sortie un programme java qui lit un fichier d'entrées, compare ces entrées avec les expressions régulières 
de la spécification et exécute les actions correspondantes.

L'analyseur lexical généré utilise un automate à états finis déterministe.

Si la plupart du temps les analyseurs lexicaux générés par lex/flex servent de point d'entrée pour des analyseurs syntaxiques 
comme [Yacc/Bison](https://fr.wikipedia.org/wiki/GNU_Bison), ils peuvent aussi, comme dans ces exemples, être utilisés seuls.

## Exemple 1 : un analyseur qui compte les 'a' et le 'e'

Spécification Flex : [test1.l](test1.l)
Le source C généré se trouvera dans **test1.c**.

## Exemple 2 : un analyseur qui compte les minuscules, majuscules et les espaces...

Spécification Flex : [test2.l](test2.l)
Le source C généré se trouvera dans **test3.c**.

## Exemple 4 : compter les 'le' et les 'i' et mise en majuscule.

Spécification Flex : [test3.l](test3.l)
Le source C généré se trouvera dans **test3.c**.

## Construction des exemples :
La commande `make test1 test2 test3` permet de générer les analyseurs, de les compiler et de générer un exécutable pour chacun des exemples).

Pour Tester les exemples taper les commandes suivantes :

Exemple 1 :

```
./test1 test.txt
```
Résultat prévu : 

```
le(1) te(2)st e(3)st importa(1)nt. 
A(2)ussi la(3) ré(4)ussite(5), le(6) coura(4)ge(7), le(8) bon se(9)ns.

nb A :  4, nb E : 9
```

Exemple 2 :

```
./test2 test.txt
```
Résultat prévu : 

```
Minuscules :  49, Majuscules : 1, Blancs : 11, Autres : 6
```

Exemple 3 : 

```
./test3 test.txt
```
Résultat prévu : 

```
LE TEST EST IMPORTANT. 
AUSSI LA RéUSSITE, LE COURAGE, LE BON SENS.

nb le : 3, nb i : 3
```

### Remarques

Pour compiler les exemples vous aurez besoin d'avoir installé préalablement les outils flex/gcc/make.

Sinon vous pouvez générer un container docker (`docker build -t testlex .`)
puis lancer les exemples en utilisant docker :  `docker run --rm -it testlex ./test3 test.txt`
