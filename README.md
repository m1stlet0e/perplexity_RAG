# Perplexity App Clone

This repository contains the implementation of a Perplexity app clone using **Flutter**, **Tavily API**, and **Gemini API**. The application mimics the functionality of a Perplexity-like search assistant, providing accurate and concise answers based on web searches and LLM (Large Language Model) responses.

## Features

1. **Web Search Integration:** Searches the web for relevant information using Tavily API.
2. **Content Ranking:** Implements a similarity-based ranking mechanism for retrieved sources.
3. **LLM Response Generation:** Generates detailed and context-aware responses using Gemini API.

---

## Architecture Overview

The backend logic of the app is structured into three main steps:

### Step 1: Search the Web
- **Objective:** Retrieve relevant web sources for the given query.
- **API Used:** Tavily API.

### Step 2: Source Ranking
- **Objective:** Sort the retrieved sources based on their relevance to the query.
- **Methodology:**
  - Perform a similarity search between the query and search results.
  - Convert both the query and search result texts into high-dimensional vectors using a sentence transformer.
  - Calculate cosine similarity between the vectors.
  - Rank sources based on their similarity scores (higher similarity = higher rank).

### Step 3: Response Generation
- **Objective:** Generate a detailed and coherent response using the top-ranked sources.
- **API Used:** Gemini API.

---

## Technologies Used

1. **Flutter:** For building the frontend of the application.
2. **Tavily API:** To perform web searches and fetch relevant results.
3. **Gemini API:** For leveraging LLM capabilities to generate responses.
4. **Sentence Transformers:** To perform similarity searches using vector embeddings.

---

## Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/your-repo-link.git
   ```
2. Navigate to the project directory:
   ```bash
   cd perplexity_app_clone
   ```
3. Install dependencies:
   ```bash
   flutter pub get
   ```
4. Configure the APIs:
   - Obtain API keys for Tavily and Gemini.
   - Add them to the appropriate configuration file.

5. Run the application:
   ```bash
   flutter run
   ```

---

## Usage

1. Enter your query in the search bar.
2. The app will:
   - Search the web for relevant sources.
   - Rank the sources based on content similarity.
   - Generate and display a concise response.
3. View the ranked sources and the final response.

---

## How It Works

### Backend Workflow
1. **Input Query:** The user inputs a query in natural language.
2. **Web Search:** Tavily API retrieves web search results.
3. **Similarity Ranking:** The app calculates cosine similarity between the query and search results to rank sources.
4. **Response Generation:** Gemini API uses the top-ranked sources to generate a response.

---

## Example

### Query:
> "How does photosynthesis work?"

### Workflow:
1. **Search Results:** Fetch relevant links and snippets on photosynthesis.
2. **Rank Sources:** Identify the most relevant sources by calculating similarity scores.
3. **Final Response:** Generate an answer explaining photosynthesis in detail, leveraging LLM capabilities.

---

## Future Improvements

- Integrate more advanced ranking algorithms to improve source selection.
- Enable multi-modal support for images and videos.
- Optimize response generation time.

---

## Contributing

Contributions are welcome! Please fork the repository and submit a pull request.

---

## License

This project is licensed under the MIT License. See the LICENSE file for details.

---

## Acknowledgments

- [Sentence Transformers](https://www.sbert.net/)
- [Tavily API Documentation](https://tavily-docs-link)
- [Gemini API Documentation](https://gemini-docs-link)

