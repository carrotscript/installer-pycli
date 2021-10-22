import datetime
import os
import sys
import ast
def is_valid_python(code):
   try:
       ast.parse(code)
   except SyntaxError:
       return False
   return True


class color:
   PURPLE = '\033[95m'
   CYAN = '\033[96m'
   DARKCYAN = '\033[36m'
   BLUE = '\033[94m'
   GREEN = '\033[92m'
   YELLOW = '\033[93m'
   RED = '\033[91m'
   BOLD = '\033[1m'
   UNDERLINE = '\033[4m'
   END = '\033[0m'


print(color.RED + "Welcome to the " + color.END + color.GREEN + color.BOLD + "PyCLI" + color.END + color.END + ", The new Python CLI")
print("Python " + sys.version)
print("")
print("")

while True:
    try:
        run = input(">>> ")
        exec(run)
    except Exception:
        valid = str(is_valid_python(run))
        if valid == "True":
            print(valid)
            pass
        else:
            print(color.BLUE + "This code is not valid." + color.END)
            pass
 
