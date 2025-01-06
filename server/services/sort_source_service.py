from typing import List
from sentence_transformers import SentenceTransformer
import numpy as np

class SortSourceService:
    def __init__(self):
        self.embedding_model=SentenceTransformer("all-miniLM-L6-v2")#initialised the sentence transformer model with the all-miniLM-L6-v2 model

    def sort_sources(self, query:str,search_results:List[dict]):
        query_embedding=self.embedding_model.encode(query)#encoding the query
        #print(len(query_embedding))#checks if the length of the query embedding is 384(no. of dimensions of the matrix)
        # print(query_embedding)

        releveant_docs=[]
        #now i will loop through the search results and i will embedd each of the values in the search results
        for res in search_results:
            res_embedding=self.embedding_model.encode(res['content'])#in python,no diff bw " "ans ' '
            similarity=np.dot(query_embedding,res_embedding)/(np.linalg.norm(query_embedding)*np.linalg.norm(res_embedding))#calculating the similarity between the query and the content of the search results

            res['relevance_score']=similarity#adding the similarity to the search results
       
            #now i want to filter the docs based on the relevance score so that if the relevance score is greater than 0.3 then i want to keep it otherwise not
            if similarity>0.3:
                releveant_docs.append(res)

         #now i want to sort the relevant docs based on the relevance score
        return sorted(relevant_docs,key=lambda x:x['relevance_score'],reverse=True)#sorting the relevant docs based on the relevance score in descending order
        #lambda is a anonymous fxn which will tell the sorted fxn that we want to sort based on a particular key