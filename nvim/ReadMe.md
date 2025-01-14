# Neovim Konfiguration – Übersicht

Diese README-Datei bietet eine zentrale Übersicht über die Konfigurationen, Plugins, Shortcuts und weitere Anpassungen in diesem Neovim-Setup. Sie dient als Nachschlagewerk, um schnell einen Überblick über die Funktionen und Einstellungen zu erhalten.

## Inhaltsverzeichnis

- [Überblick](#überblick)
- [Globale Einstellungen](#globale-einstellungen)
- [Plugin-Management](#plugin-management)
- [Optionen und Einstellungen](#optionen-und-einstellungen)
- [Autocommands](#autocommands)
- [Keymaps & Shortcuts](#keymaps--shortcuts)
- [Plugins im Detail](#plugins-im-detail)
  - [Completion Plugin](#completion-plugin)
  - [DAP Plugin](#dap-plugin)
  - [Git-bezogene Plugins](#git-bezogene-plugins)
  - [Editor-Verbesserungs-Plugins](#editor-verbesserungs-plugins)
  - [Telescope Plugin](#telescope-plugin)
  - [LSP-Konfiguration](#lsp-konfiguration)
  - [Theme](#theme)
- [Auto-Format on Save](#auto-format-on-save)
- [Zukünftige Erweiterungen](#zukünftige-erweiterungen)

## Überblick

Diese Neovim-Konfiguration besteht aus mehreren Lua-Skripten, die unterschiedliche Aspekte der Editor-Anpassung abdecken:

- `globals.lua`: Globale Einstellungen und Variablen
- `lazyInstallation.lua`: Installation und Einrichtung des Lazy.nvim Plugin-Managers
- `options.lua`: Editor-Optionen, Autocommands und Keymaps
- `basicAutocommands.lua`: Grundlegende Autocommand-Einstellungen
- Plugin-spezifische Konfigurationsdateien, z. B. für Completion, Debugging (DAP), Git, Editor-Verbesserungen, Telescope, LSP und Theme

## Globale Einstellungen

**Datei:** `globals.lua`

- Setzt `<Space>` als Leader-Key.
- Aktiviert Nerd Font-Unterstützung, falls installiert.
- Konfiguriert allgemeine Einstellungen für Copilot und andere globale Variablen.

## Plugin-Management

**Datei:** `lazyInstallation.lua`

- Installiert und richtet den Plugin-Manager [lazy.nvim](https://github.com/folke/lazy.nvim) ein, falls dieser nicht vorhanden ist.
- Fügt `lazy.nvim` zum Runtime-Pfad hinzu.

## Optionen und Einstellungen

**Datei:** `options.lua`

Diese Datei enthält umfassende Einstellungen für Neovim, darunter Anzeigeoptionen, Editor-Verhalten, Zwischenablage, Speicher- und Leistungsoptimierungen, Fensteraufteilung, Whitespace-Anzeige, Folding, Shell-Einstellungen sowie Basis-Keymaps und Autocommands.

## Autocommands

**Dateien:** `basicAutocommands.lua` und `options.lua`

- **TextYankPost:** Hebt Textstellen nach dem Kopieren hervor.
- **C# Formatierung:** Formatiert C#-Dateien automatisch beim Speichern.
- **Prettier on Save:** Führt Prettier automatisch bei bestimmten Dateitypen (z.B. `.js`, `.ts`, `.css`, `.scss`, `.md`, `.html`) vor dem Speichern aus.
- **Weitere Autocommands:** Einrichtung von Tree-sitter-Folding und Shell-Konfiguration basierend auf dem Betriebssystem.

## Keymaps & Shortcuts

Die Konfiguration definiert diverse Keymaps für die Editor-Nutzung:

- **Fensternavigation:** `Ctrl` + `h/j/k/l` zur Navigation zwischen Splits.
- **Suchhighlight löschen:** `<Esc>` löscht Suchhighlight im Normalmodus.
- **Terminal-Modus Verlassen:** `<Esc><Esc>` im Terminalmodus zum Verlassen.
- **Pfeiltasten-Deaktivierung:** Nutzt `h/j/k/l` statt der Pfeiltasten.
- **Diagnostik und Schnellfixlisten:** `<leader>q` öffnet die Diagnostic Quickfix-Liste.

Weitere Shortcuts und Keymaps sind für spezifische Plugins und Funktionen definiert.

## Plugins im Detail

### Completion Plugin

**Zweck:**  
Der `nvim-cmp` Completion-Engine bietet kontextbezogene Vervollständigungen im Editor. Ergänzt wird dies durch LuaSnip für Snippet-Unterstützung und weitere Quellen wie LSP und Pfad-Vervollständigung.

**Wichtige Aspekte der Konfiguration:**

- **Trigger:** Wird beim Eintritt in den Einfügemodus (`InsertEnter`) geladen.
- **Abhängigkeiten:**  
  - `LuaSnip` zur Erweiterung von Code-Snippets.
  - Integrationen für LSP, Pfadvervollständigung und weitere.
- **Mappings:**  
  - Navigieren und Auswählen von Vervollständigungsvorschlägen mit `<C-n>`, `<C-p>`, `<C-y>` usw.
  - Erweiterung und Rücksprung in Snippets mit `<C-l>` und `<C-h>`.

### DAP Plugin

**Zweck:**  
Die Debugging-Plugins `nvim-dap` und `nvim-dap-ui` ermöglichen das Debuggen direkt innerhalb von Neovim. Sie unterstützen unter anderem .NET- und PowerShell-Anwendungen.

**Hauptkomponenten:**

- **Adapter-Konfiguration:**
  - **.NET (CoreCLR):** Einrichtung von `netcoredbg` für C#-Anwendungen.
  - **PowerShell:** Konfiguration von PowerShell Editor Services für das Debuggen von PowerShell-Skripten.
  
- **Konfigurationen:**  
  - `.cs`-Dateien und PowerShell-Skripte werden speziell konfiguriert.
  
- **Keybindings:**  
  - Standardisierte Debugging-Tasten wie `<F5>`, `<F10>`, `<F11>`, `<F12>`, etc.
  - Breakpoint-Verwaltung und REPL-Zugriffe über `<Leader>`-Shortcuts.

### Git-bezogene Plugins

**Dateien:** `git.lua`

Diese Datei bündelt Plugins für die Git-Integration:

- **vim-fugitive:**  
  - Bietet umfassende Git-Integration innerhalb von Neovim, einschließlich Befehlen zum Committen, Branchenwechseln und mehr.

- **gitsigns.nvim:**  
  - Zeigt Git-Änderungshinweise direkt im Editor an (z. B. Hinzufügen, Löschen, Ändern von Zeilen).
  - Konfigurierbare Symbole für Änderungen (z. B. `+` für Hinzufügen, `~` für Änderung).

**Wichtige Aspekte der Konfiguration:**

- Beide Plugins verbessern den Workflow im Umgang mit Git innerhalb von Neovim.
- `gitsigns.nvim` wurde so konfiguriert, dass es spezifische Symbole für unterschiedliche Git-Operationen verwendet.

### Editor-Verbesserungs-Plugins

**Datei:** `editor.lua`

Diese Datei enthält Plugins zur Verbesserung der allgemeinen Editor-Erfahrung:

- **nvim-autopairs:**  
  - Automatische Klammerpaarung, um das Tippen von schließenden Klammern, Anführungszeichen etc. zu erleichtern.
  - Integriert mit Tree-sitter für eine bessere Erkennung von Codeblöcken.
  - Deaktiviert in bestimmten Dateitypen wie `TelescopePrompt` und `vim`.

- **conform.nvim:**  
  - Bietet Autoformatierung für verschiedene Dateitypen.
  - **Trigger:** Wird vor dem Speichern von Dateien ausgeführt (`BufWritePre`).
  - **Bedienung:** Kann manuell über `<leader>f` ausgelöst werden, um das aktuelle Buffer zu formatieren.
  - **Konfiguration:**  
    - Fehlerbenachrichtigungen sind deaktiviert (`notify_on_error = false`).
    - Formatierungseinstellungen basierend auf Dateitypen, z.B. `stylua` für Lua, `clang_format` für C#, etc.
    - Spezifische Formatierungsoptionen werden für C/C++ festgelegt.

- **indent-blankline.nvim:**  
  - Visualisiert Einrückungslinien im Editor, um die Code-Struktur auf einen Blick erkennbar zu machen.
  - **Integration:** In `editor.lua` eingebunden, um thematisch zur Verbesserung der Editor-Oberfläche zu passen.
  - **Standardoptionen:** Aktiviert mit den standardmäßigen Einstellungen.

- **vim-prettier:**  
  - In `editor.lua` integriert.
  - Bietet Code-Formatierung für eine Vielzahl von Dateitypen wie JavaScript, TypeScript, CSS, SCSS, JSON, Markdown und HTML.
  - Kann über den Befehl `:Prettier` ausgeführt werden und wird thematisch zur Autoformatierung und anderen Editor-Verbesserungen gruppiert.

- **which-key.nvim:**  
  - Ebenfalls in `editor.lua` integriert.
  - Bietet eine Übersicht über verfügbare Tastenkombinationen und zeigt kontextbezogene Hinweise an, wenn Schlüssel wie der Leader gedrückt werden.
  - Konfiguriert, um Gruppen von Keymaps wie `[C]ode`, `[D]ocument`, `[R]ename`, `[S]earch`, `[W]orkspace`, `[T]oggle` sowie Git-Hunk-bezogene Aktionen anzuzeigen.

**Wichtige Aspekte der Konfiguration:**

- **Autoformat on Save:**  
  - Konform ist so eingerichtet, dass es beim Speichern von Dateien automatisch die formatierenden Tools aufruft, sofern diese konfiguriert sind.
  - Anpassbare Formatierungsoptionen je nach Dateityp erlauben eine flexible Handhabung verschiedener Programmiersprachen.

### Telescope Plugin

**Zweck:**  
Telescope bietet eine leistungsstarke Fuzzy-Suche für Dateien, Symbole, LSP-Informationen und vieles mehr direkt in Neovim.

**Datei:** `telescope.lua`

**Ladeverhalten und Abhängigkeiten:**
- Wird beim `VimEnter`-Ereignis geladen.
- Abhängigkeiten:
  - `plenary.nvim` für grundlegende Lua-Funktionalitäten.
  - `telescope-fzf-native.nvim` für schnelle und effiziente Fuzzy-Suche (wird bei Bedarf mit `make` kompiliert).
  - `telescope-ui-select.nvim` für Dropdown-ähnliche Auswahlmenüs.
  - `nvim-web-devicons` zur Anzeige von Icons (abhängig von Nerd Font).
  - `telescope-file-browser.nvim` für Dateibrowser-Funktionen.

**Konfiguration und Verhalten:**
- Konfiguriert Erweiterungen:
  - `ui-select` verwendet ein Dropdown-Theme.
  - `file_browser` integriert sich in NetRW mit dem „ivy“-Theme.
- Lädt dynamisch die Erweiterungen `fzf`, `ui-select` und `file_browser`, sofern verfügbar.
- Definiert zahlreiche Keymaps für Telescope-Funktionen:
  - Sucht Hilfe (`<leader>sh`), Keymaps (`<leader>sk`), Dateien (`<leader>sf`), etc.
  - Spezielle Funktionen wie die fuzzy Suche im aktuellen Buffer oder Live-Grep in offenen Dateien.
  - Shortcut für das Durchsuchen der Neovim-Konfigurationsdateien (`<leader>sn`).
  - Keymap für den Telescope File Browser (`<leader>fb`).

**Vorteile:**  
Durch die Auslagerung in eine eigene Datei bleibt die Konfiguration modular und übersichtlich. Telescope verbessert die Navigation und Dateisuche innerhalb von Neovim erheblich und ist flexibel anpassbar durch Erweiterungen und individuelle Tastenzuweisungen.

## LSP-Konfiguration

*(Unverändert aus vorheriger Version)*

## Theme

*(Unverändert aus vorheriger Version)*

## Auto-Format on Save

*(Unverändert aus vorheriger Version)*

## Zukünftige Erweiterungen

*(Unverändert aus vorheriger Version)*
