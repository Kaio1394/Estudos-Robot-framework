import yaml
import os 
from robot.libraries.BuiltIn import BuiltIn
from robot.api.deco import keyword

@keyword("GET LOCATOR")
def GetLocator(page: str, index: int, name_locator: str) -> str:
    locator = ""
    try:        
        with open(os.path.dirname(__file__) + "/data_tests.yaml", 'r') as file:
            data = yaml.safe_load(file)
            locator = data[page][index][name_locator]
        return locator
    except:
        raise Exception("Locator not found.")

