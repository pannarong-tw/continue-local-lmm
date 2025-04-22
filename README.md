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

## Running a Model

To run a specific model, use:
```bash
ollama run <model_name>
```
For example, to run the `qwen2.5:1.5b` model:, run the following command:
```bash
ollama run qwen2.5:1.5b
```
This will download and load the model, making it available to Continue.dev.

Helpful commands:

- View installed models:
```bash
ollama list
```

- Remove a model:
```bash
ollama remove <model_name>
```
Browse available models: [Ollama Model Library](https://ollama.com/library)

---

## Using Continue.dev

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
   