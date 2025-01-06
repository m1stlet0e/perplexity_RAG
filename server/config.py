#i want to go 1 step further and secure this api key, i want to use dot-env to secure this api key

from dotenv import load_dotenv
from pydantic_settings import BaseSettings
load_dotenv()#loaded the dotenv file from python env

#class settings extend the base settings that came from pydantic settings 
#so when we extend the base settings,pydantic will automatically go and pull the environment variables,(i.e TAVILY_API_KEY) from the .env file(or from the environment variables u have passed anywhere else in your machine) 
#gitignore the .env file when pushing in repo(purpose is to securely store your api key so that no one sees it)
class Settings(BaseSettings):
    TAVILY_API_KEY: str=""#if it is present,it will be figured out otherwise i have initialised it to a empty string