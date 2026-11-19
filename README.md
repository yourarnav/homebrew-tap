# homebrew-tap

Personal [Homebrew](https://brew.sh/) tap for macOS applications by [@yourarnav](https://github.com/yourarnav) / [byArnav](https://byarnav.com).

## Usage

Add this tap to your Homebrew installation:

```bash
brew tap yourarnav/tap
```

Then install any of the apps listed below:

```bash
brew install --cask <formula>
```

---

## Available Casks

| App | Description | Install Command |
|---|---|---|
| **[Vow](https://vow.byarnav.com/)** | System-level offline lock on a timer for macOS. Cuts network access for deep focus with zero instant cancel. | `brew install --cask vow` |
| **[CodexReserve](https://github.com/yourarnav/CodexReserve)** | Two rings in your menu bar. Codex limits, nothing else. | `brew install --cask codexreserve` |
| **[Aether](https://github.com/yourarnav/Aether)** | Ultra-lightweight native macOS menu bar dictation powered by Groq Whisper. | `brew install --cask aether` |
| **[PDFtoImages](https://github.com/yourarnav/PDFtoImages)** | Ultra-lightweight native macOS tool to convert PDF documents to high-res images. | `brew install --cask pdftoimages` |

---

## Updating

To update your installed casks:

```bash
brew update
brew upgrade --cask <formula>
```
