from pydantic import BaseModel

#pydantic allows us to specify the type and will automatically tell the fastapi endpoint that what we are requesting for is the body of the request and not nothing else
class ChatBody(BaseModel):
    query: str
#we have created a class ChatBody which extends the BaseModel(as soon as we extend it,it means that this is a pydantic model) and we have a query attribute which is of type string    
#we require query from the body and the query will be gonna be of the type string
#this will perform the type validation for us