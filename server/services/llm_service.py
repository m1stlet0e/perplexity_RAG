#llm=gemini
import google.generativeai as genai

from config import Settings

settings = Settings()
class LLMService:
    def __init__(self):
        genai.configure(api_key=settings.GEMINI_API_KEY)#understood this from the google ai studio get code
        self_model=genai.GenerativeModel("gemini-2.0-flash-exp")
    def generate_response(self,query:str,search_results:list[dict]):
        #Source 1:<url>
        #<content>
        #Source 2:<url>
        #<content>
        #query:
        #prompt->hey provide a detailed response based on this context only and don't use your external knowlede untill it is absolutely necessary
        context_text="\\n\n".join([
            f"Source {i+1} {result['url']}:\n{result['content']}"
            for i,result in enumerate(search_results)#for every element that we see in search results we are going to loop over it and just going to say that this source has this url and on a new line i will mention the content
        ])
        
        #multi line string
        full_prompt=f""""
        Context from web search:
        {context_text}

        Query:{query}

        Please provide a comprehensive, detailed ,well-cited accurate response using the above context.Think and reason deeply. Ensure it answers the query the user is asking. Do not use your own knowledge untill it is absolutely necssary
        """

        response=self.model.generate_content(full_prompt,stream=True)#stream=True means that we are going to get the response in chunks
        #stream=True means that this becomes a generator ,so this generate content fxn is return a bunch of values so i will loop over it and return them
        for chunk in response:
            #return chunk.text
            yield chunk.text

        # return response.text