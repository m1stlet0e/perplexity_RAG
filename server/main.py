from fastapi import FastAPI

from pydantic_models.chat_body import ChatBody
from services.search_service import SearchService

app=FastAPI()#it searches for this word app and then it will create an instance of the FastAPI class and then it will be used to define the routes
#if named other vairable rather than app then it gives error

# @app.get("/")
# def hello_world():
#     return "Hello World"#whatever we return over here will be the return value for when the user reaches the forward slash route

search_service=SearchService()#we have created an instance of the SearchService class


#chat
#if used query in the parameter of function-->> /chat?query=Who%20is%20Rivaan?-->we will get this partciular string from the query(that's not how u get the body of the request)
#to get the body of the request we will have to create a pydanitc model that will allow us to get the body
@app.post("/chat")
def chat_endpoint(body: ChatBody):
    #search the web and find appropriate sources(step1)
    search_service.web_search(body.query)

    return body.query