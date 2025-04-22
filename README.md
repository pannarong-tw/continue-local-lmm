# Continue.dev + Local LLM Setup

This guide walks you through setting up [Continue.dev](https://continue.dev) with a locally running LLM using [Ollama](https://ollama.com).

> **Note:** Continue.dev currently supports **VSCode** and **IntelliJ IDEs** only.

---

## Setup

Run the setup script to install the necessary dependencies:

```bash
bash scripts/setup-ollama.sh
```

This script will:
- Install Homebrew (if not already installed)
- Install Ollama

---

## Starting the LLM Server

Start the Ollama server with:
```bash
ollama serve
```
By default, the server runs on port `11434`. You can change this by setting the `PORT` environment variable.

Once the server is running, open a new terminal tab to continue.

---

## Pulling Required Models
Continue.dev requires three types of models to function properly:

- Chat model – handles natural language conversation
- Autocomplete model – powers inline code suggestions
- Embeddings model – enables context and semantic search

Recommended models:
```bash
ollama pull llama3.1:8b                  # Chat model
ollama pull qwen2.5-coder:1.5b-base      # Autocomplete model
ollama pull nomic-embed-text:latest      # Embeddings model
```

Helpful commands:

- List installed models:
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

1. Install the Continue.dev extension for VSCode or your supported IDE.

2. Update your `~/.continue/config.yaml` file with your local model configurations:
```yaml
# Specify the models used by Continue.dev
models:
  - name: Ollama Llama 3.1
    provider: ollama
    model: llama3.1:8b
    roles:
      - chat
  - name: Qwen2.5 Coder
    provider: ollama
    model: qwen2.5-coder:1.5b-base
    roles:
      - autocomplete
  - name: Nomic Embed Text
    provider: ollama
    model: nomic-embed-text:latest
    roles:
      - embed
```

Once your models are pulled and the Ollama server is running, Continue.dev should be ready to use with local LLM support.

---

## Extra: Running a Web UI (Optional)

If you'd like a visual interface for interacting with your local LLMs, you can run **Open WebUI**—a simple web-based frontend. We’ll use **Docker Compose** to set it up.

### Prerequisites
Make sure you’ve completed the earlier steps up to **Pulling Required Models** and that the Ollama server is running.

### 1. Install Docker and Docker Compose
Run the following script to install both:
```bash
bash scripts/setup-docker.sh
   ```
### 2. Start Colima (a Docker alternative for macOS):

Colima is a lightweight alternative to Docker Desktop on macOS. To start it with enough resources:

```bash
colima start --memory 8 --cpu 4
``` 
- stop Colima
```bash
colima stop
```

- Check Colima's status:
```bash
colima status
```

### 3. Launch the Web UI

With Colima running, start the Open WebUI container:

```bash
docker-compose up
```
  
Once it’s up, open your browser and go to:

> http://localhost:3000

You should now be able to interact with your local models through a friendly UI.