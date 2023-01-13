from robot.libraries.BuiltIn import BuiltIn
from robot.api.deco import keyword
import random
from enum import Enum


class Color(Enum):
    RED = "\033[31m"
    GREEN = "\033[32m"

@keyword("OUTPUT CONSOLE")
def out_console(text: str, color_green: bool = True):
    color = Color.GREEN.value
    if not color_green: color = Color.RED.value
    BuiltIn().log_to_console(f"{color}"+f"\nSTEP - {text}")


@keyword("INCREMENT VARIABLE")
def increment(variable):
    variable = int(variable)
    return variable + 1

"""
    ${VARIABLE}    GENERATE NUMBER RANDOM      INIT    END
"""
@keyword("GENERATE NUMBER RANDOM")
def random_generate(init=1, end=100) -> int:
    if type(init) == int and type(end) == int:
        return random.randint(init, end)
    elif type(init) == float and type(end) == float:
        return random.uniform(init, end)
    else:
        raise Exception("Tipo de entrada inválido.")

