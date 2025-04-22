# Continue.dev + Local LLM Setup

This guide walks you through setting up [Continue.dev](https://continue.dev) with a locally running LLM using [Ollama](https://ollama.com).

> **Note:** Continue.dev currently supports **VSCode** and **IntelliJ IDEs** only.

---

## Setup

Run the setup script to install the necessary dependencies:

```bash
bash scripts/setup-ollama.sh
```
Run the setup script to install dependencies:
This will:
- Install Homebrew
- Install Ollama

---

## Starting the LLM Server

Start the Ollama server with:
```bash
ollama serve
```
By default, the server runs on port `11434`.
You can change this by setting the `PORT` environment variable.

Once the server is running, open a new terminal tab to continue.

---

## Pulling Required Models
Continue.dev requires three types of models to function properly:

- Chat model – handles natural language conversation
- Autocomplete model – powers inline code suggestions
- Embeddings model – enables context and semantic search

You can choose from various compatible models, but the following are recommended:
```bash
ollama pull llama3.1:8b                  # Chat model
ollama pull qwen2.5-coder:1.5b-base      # Autocomplete model
ollama pull nomic-embed-text:latest      # Embeddings model
```

These commands will download and load the models locally for use with Continue.dev.

Helpful commands:

- View installed models:
```bash
ollama list
```

- Remove a model:
```bash
ollama rm <model_name>
```
Browse available models: [Ollama Model Library](https://ollama.com/library)

---

## Using Continue.dev

To use Continue.dev first install the [VSCode Continue.dev extension](https://marketplace.visualstudio.com/items?itemName=Continue.continue) in your IDE.

Once the required models are pulled and the Ollama server is running, you're all set to use Continue.dev with local LLM support.

---

## Extra: Running the UI (Optional)
This section is recommended if you want to use a UI to interact with your local models.

1. Complete the setup up to **Running a Model**.
2. Run the following to install Docker and Docker Compose:
   ```bash
   bash scripts/setup-docker.sh
   ```
3. Start Colima (a Docker alternative for macOS):
   ```bash
    colima start --memory 8 --cpu 4
    ``` 
    To stop Colima
    ```bash
    colima stop
    ```
    To check Colima's status:
    ```bash
    colima status
    ```
4. Run the command to start the UI
   