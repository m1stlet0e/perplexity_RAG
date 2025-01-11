from config import Settings
from tavily import TavilyClient
import trafilatura
settings=Settings()
tavily_client = TavilyClient(api_key=settings.TAVILY_API_KEY)#initialised the tavily client with the api key

class SearchService:
    #1 function that is public which is the web search function
    def web_search(self,query:str):#we will be getting query from the parameter of the function-this function is basiclly going to search the web and going to return the results it gets
        try:
            results=[]
            # print(settings.TAVILY_API_KEY)
            
            response = tavily_client.search(query,max_results=10)#searching the query and getting the response
            # print(response.get("results",[]))#if results is not present,then it will return an empty list
            search_results=response.get("results",[])

            for result in search_results:
                downloaded=trafilatura.fetch_url(result.get("url"))#could have also done result["url"] but this is more safer
                #now i want to extract the content from the downloaded content
                content=trafilatura.extract(downloaded,include_comments=False)#extracting the content from the downloaded content and not including the html comments

                results.append({
                    "title":result.get("title",""),
                    "url":result.get("url"),
                    "content":content or "",
                })
                #we are doing this since we want to give additional context to gemini but also when we will be displaying the results on frontend we have to list out the sources


            return results  #  job of this web search function is to return the list of results that it gets from the web search 
        except Exception as e:
            print(e)
        