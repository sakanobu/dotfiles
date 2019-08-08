# def tintin(end):
#     for i in range(1, end):
#         if i % 15 == 0:
#             print('FizzBuzz')
#         elif i % 3 == 0:
#             print('Fizz')
#         elif i % 5 == 0:
#             print('Buzz')
#         else:
#             print(i)
#
# tintin(12)
#
#
# for i in [1, 5, 12]:
#     print(i)
#
# hairetu = [1, 100, 'aiueo']
# print(hairetu[0])
# print(hairetu[1])
# print(hairetu[2])

class Dog:
    number = 0
    def __init__(self, name):
        self.name = name
        Dog.number += 1

    def what_is_name(self):
        print('The dog name is ' + self.name + '.')

    def how_many_dogs(self):
        print('I have ' + str(Dog.number) + 'dogs.')

a = Dog('Tom')
a.what_is_name()

b = Dog('Jake')
b.what_is_name()

a.how_many_dogs()
