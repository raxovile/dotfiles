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
Die Debugging-Plugins `nvim-dap`, `nvim-dap-ui` und `nvim-dap-virtual-text` ermöglichen das Debuggen direkt innerhalb von Neovim. Sie unterstützen unter anderem .NET- und PowerShell-Anwendungen und bieten eine erweiterte Visualisierung von Debug-Informationen.

**Hauptkomponenten:**

- **Adapter-Konfiguration:**
  - **.NET (CoreCLR):** Einrichtung von `netcoredbg` für C#-Anwendungen.
  - **PowerShell:** Konfiguration von PowerShell Editor Services für das Debuggen von PowerShell-Skripten.
  
- **Virtuelle Debug-Informationen:**
  - Das Plugin `nvim-dap-virtual-text` zeigt Variablenwerte und Debugging-Informationen direkt im Quellcode an, wodurch die Nachverfolgung von Programmzuständen erheblich erleichtert wird.

- **Konfigurationen:**  
  - `.cs`-Dateien und PowerShell-Skripte werden speziell für Debugging-Aufgaben konfiguriert.
  - Die virtuelle Textanzeige für Debugging-Informationen ist standardmäßig aktiviert und kann mit `:DapVirtualTextEnable` oder `:DapVirtualTextDisable` angepasst werden.

- **Keybindings:**  
  - Standardisierte Debugging-Tasten wie `<F5>` (Fortfahren), `<F10>` (Schritt überspringen), `<F11>` (Schritt hinein), `<F12>` (Schritt hinaus).
  - Breakpoint-Verwaltung (`<Leader>b` zum Hinzufügen/Entfernen von Breakpoints) und erweiterte Aktionen wie bedingte Breakpoints (`<Leader>B`) oder Logpunkte (`<Leader>lp`).
  - Zugriff auf das REPL (`<Leader>dr`) und das erneute Ausführen von Debug-Sitzungen (`<Leader>dl`).

**Vorteile der Integration von `nvim-dap-virtual-text`:**
- Direkte Visualisierung von Variablenwerten und Änderungen im Quellcode.
- Unterstützung für mehrere Debug-Adapter.
- Anpassbare Anzeigeoptionen, wie z. B. das Hervorheben geänderter Variablen oder das Anzeigen von Stop-Gründen.

Mit diesen Tools wird Neovim zu einer umfassenden und visuellen Debugging-Umgebung, die sowohl für Anfänger als auch für fortgeschrittene Entwickler geeignet ist.

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

### Telescope Plugin

**Zweck:**  
Telescope bietet eine leistungsstarke Fuzzy-Suche für Dateien, Symbole, LSP-Informationen und mehr direkt in Neovim.

**Datei:** `telescope.lua`

- **Ladeverhalten und Abhängigkeiten:**  
  Wird beim `VimEnter`-Ereignis geladen und erfordert mehrere Abhängigkeiten (u.a. `plenary.nvim`, `telescope-fzf-native.nvim`, `telescope-ui-select.nvim`, `nvim-web-devicons`, `telescope-file-browser.nvim`).
  
- **Konfiguration und Keymaps:**  
  Konfiguriert Erweiterungen für UI-Selektoren und Dateibrowser sowie diverse Keymaps für schnelle Suchaktionen und Navigation.

Die vollständige Konfiguration befindet sich in der separaten Datei `telescope.lua`.

### Treesitter Plugin

**Zweck:**  
Treesitter sorgt für fortschrittliche Syntaxhervorhebung, Einrückung, Faltung und andere sprachspezifische Verbesserungen durch die Verwendung von Parsern.

**Datei:** `treesitter.lua`

- **Installation und Updates:**  
  Das Plugin aktualisiert die Treesitter-Parser automatisch mit `:TSUpdate`.
  
- **Konfiguration:**  
  - **Ensure Installed:** Stellt sicher, dass Parser für gängige Sprachen (z.B. Bash, C, HTML, Lua, Markdown, Vimscript, C#) installiert sind.
  - **Highlighting:** Aktiviert syntaxbasiertes Highlighting und fügt zusätzliche Regex-Hervorhebungen für Ruby hinzu.
  - **Indentation:** Aktiviert die automatische Einrückung für die meisten Sprachen, deaktiviert jedoch für Ruby.
  - **Folding:** Aktiviert Code-Folding basierend auf Treesitter.

Die vollständige Konfiguration befindet sich in der separaten Datei `treesitter.lua`.

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

### LSP-Konfiguration

**Zweck:**  
Die LSP-Konfiguration integriert Language Server Protokoll (LSP) Unterstützung in Neovim, um intelligente Funktionen wie Autovervollständigung, Fehlerdiagnosen, Code-Navigation und Refactoring-Tools bereitzustellen. Sie sorgt für eine nahtlose Entwicklungserfahrung über verschiedene Programmiersprachen hinweg.

**Wichtige Aspekte der Konfiguration:**

- **Grundgerüst:**  
  - Verwendet `neovim/nvim-lspconfig` als Basis für die LSP-Integration.
  - Ergänzt durch `mason.nvim` und verwandte Plugins für die automatische Installation und Verwaltung von LSP-Servern und zugehörigen Tools.
  - Bindet Status- und Fortschrittsanzeigen durch Plugins wie `fidget.nvim` und `lsp-status.nvim` ein.

- **Server-spezifische Einstellungen:**  
  - **Lua:** Konfiguration des Lua Language Servers mit angepassten Einstellungen für Autovervollständigung und Diagnostik.
  - **C# (OmniSharp):**  
    - Einrichtung des OmniSharp Language Servers für C#-Dateien.
    - Konfiguration umfasst Anpassungen wie das Organisieren von Imports und Code-Aktionen.
  - **PowerShell:**  
    - Einrichtung des PowerShell Editor Services für PowerShell-Skripte.
    - Anpassungen für die Codeformatierung und korrekte Casing von Aliases.

- **Allgemeine LSP-Funktionen:**  
  - Automatisches Einrichten von Keymaps beim Anhängen eines LSP-Clients an einen Buffer, z. B. für das Springen zu Definitionen, Referenzen, Implementierungen und mehr.
  - Autohervorhebung von Symbolreferenzen im Dokument und Möglichkeiten zum Löschen dieser Hervorhebungen.
  - Unterstützung für Inlay-Hints, die zusätzliche Informationen im Code anzeigen können.
  - Integration mit `nvim-cmp` zur Bereitstellung von LSP-gestützten Vervollständigungen.
  - Konfiguration von Diagnostik-Einstellungen zur Darstellung von Fehlern und Warnungen im Editor.

- **Ergänzende Tools:**  
  - Verwendung von `null-ls.nvim` für die Integration externer Linter und Formatter wie `clang_format`.
  - Lazy-Entwicklung (`lazydev.nvim`) zur Unterstützung der Lua-Entwicklung und Neovim-API-Vervollständigung.

**Vorteile der LSP-Integration:**

- **Intelligente Funktionen:**  
  Verbesserte Autovervollständigung, sofortige Feedback zu Codefehlern und -warnungen, sowie kontextbezogene Codeaktionen erleichtern den Entwicklungsprozess erheblich.
  
- **Automatisierung und Konsistenz:**  
  Automatische Installation und Konfiguration der benötigten Sprachserver stellen sicher, dass die Entwicklungsumgebung konsistent und stets auf dem neuesten Stand ist.

- **Erweiterbarkeit:**  
  Die modulare Konfiguration ermöglicht es, weitere LSP-Server und Tools einfach hinzuzufügen oder bestehende anzupassen, um spezifischen Entwicklungsanforderungen gerecht zu werden.

### Theme

**Zweck:**  
Das Theme-Plugin `onedarkpro.nvim` sorgt für eine ansprechende und klare Farbgebung, die die Lesbarkeit und den ästhetischen Eindruck des Editors verbessert.

**Konfiguration und Verhalten:**

- **Plugin:** `olimorris/onedarkpro.nvim`
- **Priority:** Wird mit hoher Priorität (`priority = 1000`) geladen, um sicherzustellen, dass das Farbschema frühzeitig gesetzt wird.
- **Initialisierung:**  
  - Setzt das `onedark` Farbthema als aktives Colorscheme.
  - Passt die Darstellung von Kommentaren an, indem die grafischen Attribute (`gui`) deaktiviert werden, um z. B. kursive oder fette Schrift zu vermeiden.

### Utilities und diverse Plugins

**Zweck:**  
Diese Datei bündelt eine Sammlung kleiner, aber nützlicher Plugins, die verschiedene unterstützende Funktionen bereitstellen und den Arbeitsalltag in Neovim erleichtern.

**Datei:** `misc.lua`

**Enthaltene Plugins und ihre Funktionen:**
- **vim-sleuth:**  
  - Erkennt automatisch die Tabstop- und Shiftwidth-Einstellungen basierend auf dem geöffneten File.
- **lazy.nvim:**  
  - Lazy Plugin Manager zur effizienten Plugin-Verwaltung *(falls nicht bereits zentral in `lazyInstallation.lua` konfiguriert)*.
- **ripgrep:**  
  - Schnelle Dateisuche über das Kommandozeilentool `ripgrep`.
- **plenary.nvim:**  
  - Eine Utility-Bibliothek, die von vielen Neovim-Plugins verwendet wird.
- **vim-ps1:**  
  - Unterstützt die Syntaxhervorhebung für PowerShell-Skripte.
- **azure-functions.nvim:**  
  - Bietet Unterstützung für Azure Functions innerhalb von Neovim.

Die vollständige Konfiguration dieser Plugins befindet sich in der separaten Datei `misc.lua`.

## Auto-Format on Save

Die Konfiguration implementiert automatisches Formatieren beim Speichern für folgende Dateitypen:

- **C# (`*.cs`):**  
  Beim Speichern einer C#-Datei wird durch einen Autocommand `vim.lsp.buf.format()` eine Formatierung ausgeführt.

- **Web- und Script-Dateien:**  
  Vor dem Speichern von Dateien mit den Endungen:
  - `.json`
  - `.js`
  - `.ts`
  - `.css`
  - `.scss`
  - `.md`
  - `.html`  
  wird `Prettier` asynchron ausgeführt, um den Code zu formatieren.















