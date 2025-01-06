from fastapi import FastAPI

from pydantic_models.chat_body import ChatBody
from services.llm_service import LLMService
from services.sort_source_service import SortSourceService
from services.search_service import SearchService

app=FastAPI()#it searches for this word app and then it will create an instance of the FastAPI class and then it will be used to define the routes
#if named other vairable rather than app then it gives error

# @app.get("/")
# def hello_world():
#     return "Hello World"#whatever we return over here will be the return value for when the user reaches the forward slash route

search_service=SearchService()#we have created an instance of the SearchService class
sort_source_service=SortSourceService()#we have created an instance of the SortSourceService class
llm_service=LLMService()#we have created an instance of the LLMService class

#chat
#if used query in the parameter of function-->> /chat?query=Who%20is%20Rivaan?-->we will get this partciular string from the query(that's not how u get the body of the request)
#to get the body of the request we will have to create a pydanitc model that will allow us to get the body
@app.post("/chat")
def chat_endpoint(body: ChatBody):
    #search the web and find appropriate sources(step1)
    search_results=search_service.web_search(body.query)
    # print(search_results)


    #sort the sources based on the content(step2)
    #how?->do a similiarity search between the query and search_results:if similarity is high then i want it to rank up
    sorted_results=sort_source_service.sort_sources(body.query,search_results)
    print(sorted_results)


    #genearte the response using an llm model(step3)
    response=llm_service.generate_response(body.query,sorted_results)


    return response