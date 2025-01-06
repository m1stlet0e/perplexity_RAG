from config import Settings
from tavily import TavilyClient

settings=Settings()
tavily_client = TavilyClient(api_key="settings.TAVILY_API_KEY")#initialised the tavily client with the api key

class SearchService:
    #1 function that is public which is the web search function
    def web_search(self,query:str):#we will be getting query from the parameter of the function-this function is basiclly going to search the web and going to return the results it gets
        # print(settings.TAVILY_API_KEY)
        response = tavily_client.search("Who is Leo Messi?")
        print(response)