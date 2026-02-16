<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>MH DevOps Roadmap & Status</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Space+Mono:ital,wght@0,400;0,700;1,400&family=Syne:wght@400;600;700;800&display=swap" rel="stylesheet">

  <style>
    :root {
      --bg-dark: #0d0f14;
      --bg-panel: #141720;
      --bg-card: #1a1e2e;
      --bg-card-hover: #1f2438;
      --accent-blue: #4f8ef7;
      --accent-cyan: #00d4aa;
      --accent-gold: #f5c542;
      --accent-red: #ff5c5c;
      --text-primary: #eef0f7;
      --text-secondary: #8b92b3;
      --text-muted: #555d80;
      --border: #252a3d;
      --border-glow: rgba(79, 142, 247, 0.3);
      --font-display: 'Syne', sans-serif;
      --font-mono: 'Space Mono', monospace;
    }

    /* ─── LIGHT MODE VARIABLES ─── */
    html.light {
      --bg-dark: #f0f2f8;
      --bg-panel: #e4e8f4;
      --bg-card: #ffffff;
      --bg-card-hover: #f5f7ff;
      --accent-blue: #2563eb;
      --accent-cyan: #0891b2;
      --accent-gold: #d97706;
      --accent-red: #dc2626;
      --text-primary: #111827;
      --text-secondary: #374151;
      --text-muted: #9ca3af;
      --border: #d1d5e8;
      --border-glow: rgba(37, 99, 235, 0.25);
    }

    html.light .navbar {
      background: linear-gradient(135deg, #dde3f5 0%, #c8d0ed 100%);
    }

    html.light .status {
      background: linear-gradient(180deg, #e8ecf7 0%, #dde3f5 100%);
    }

    html.light body::before {
      opacity: 0.15;
    }

    html.light .status-card::before {
      background: var(--accent-cyan);
    }

    html.light .roadmap-item.completed {
      border-left-color: var(--accent-cyan);
    }

    /* ─── SMOOTH THEME TRANSITION ─── */
    *, *::before, *::after {
      transition: background-color 0.3s ease, border-color 0.3s ease, color 0.2s ease, box-shadow 0.3s ease;
    }

    *, *::before, *::after {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    body {
      background-color: var(--bg-dark);
      color: var(--text-primary);
      font-family: var(--font-display);
      min-height: 100vh;
      overflow-x: hidden;
    }

    /* ─── NOISE OVERLAY ─── */
    body::before {
      content: '';
      position: fixed;
      inset: 0;
      background-image: url("data:image/svg+xml,%3Csvg viewBox='0 0 256 256' xmlns='http://www.w3.org/2000/svg'%3E%3Cfilter id='noise'%3E%3CfeTurbulence type='fractalNoise' baseFrequency='0.9' numOctaves='4' stitchTiles='stitch'/%3E%3C/filter%3E%3Crect width='100%25' height='100%25' filter='url(%23noise)' opacity='0.03'/%3E%3C/svg%3E");
      pointer-events: none;
      z-index: 0;
      opacity: 0.4;
    }

    /* ─── NAVBAR ─── */
    .navbar {
      position: sticky;
      top: 0;
      z-index: 100;
      background: linear-gradient(135deg, #0d1117 0%, #161b2e 100%);
      border-bottom: 1px solid var(--border);
      padding: 0 3rem;
      height: 80px;
      display: flex;
      align-items: center;
      justify-content: space-between;
      backdrop-filter: blur(12px);
    }

    .navbar::after {
      content: '';
      position: absolute;
      bottom: 0;
      left: 0;
      right: 0;
      height: 1px;
      background: linear-gradient(90deg, transparent, var(--accent-blue), var(--accent-cyan), transparent);
    }

    .profile {
      display: flex;
      align-items: center;
      gap: 1rem;
    }

    .profile-avatar {
      width: 48px;
      height: 48px;
      border-radius: 50%;
      border: 2px solid var(--accent-blue);
      object-fit: cover;
      box-shadow: 0 0 16px rgba(79, 142, 247, 0.4);
    }

    .profile-info h3 {
      font-size: 1rem;
      font-weight: 700;
      letter-spacing: 0.05em;
      color: var(--text-primary);
    }

    .profile-info p {
      font-family: var(--font-mono);
      font-size: 0.7rem;
      color: var(--accent-cyan);
      letter-spacing: 0.08em;
    }

    .navbar-quote {
      font-family: var(--font-mono);
      font-size: 0.75rem;
      font-style: italic;
      color: var(--text-muted);
      max-width: 400px;
      text-align: center;
      line-height: 1.5;
      border-left: 2px solid var(--accent-blue);
      padding-left: 1rem;
    }

    .navbar-badge {
      display: flex;
      align-items: center;
      gap: 0.5rem;
      background: var(--bg-card);
      border: 1px solid var(--border);
      border-radius: 999px;
      padding: 0.4rem 1rem;
    }

    .pulse-dot {
      width: 8px;
      height: 8px;
      border-radius: 50%;
      background: var(--accent-cyan);
      animation: pulse 2s infinite;
    }

    @keyframes pulse {
      0%, 100% { box-shadow: 0 0 0 0 rgba(0, 212, 170, 0.5); }
      50% { box-shadow: 0 0 0 6px rgba(0, 212, 170, 0); }
    }

    .navbar-badge span {
      font-family: var(--font-mono);
      font-size: 0.7rem;
      color: var(--accent-cyan);
      letter-spacing: 0.05em;
    }

    /* ─── LAYOUT ─── */
    .container {
      display: grid;
      grid-template-columns: 1fr 1fr;
      min-height: calc(100vh - 80px);
      position: relative;
      z-index: 1;
    }

    /* ─── LEFT COLUMN ─── */
    .roadmap {
      padding: 2.5rem 2rem;
      border-right: 1px solid var(--border);
      overflow-y: auto;
    }

    .section-header {
      display: flex;
      align-items: center;
      gap: 0.75rem;
      margin-bottom: 2rem;
    }

    .section-header h2 {
      font-size: 1.5rem;
      font-weight: 800;
      letter-spacing: 0.04em;
      text-transform: uppercase;
      color: var(--text-primary);
    }

    .section-label {
      font-family: var(--font-mono);
      font-size: 0.65rem;
      letter-spacing: 0.12em;
      text-transform: uppercase;
      color: var(--accent-blue);
      background: rgba(79, 142, 247, 0.1);
      border: 1px solid rgba(79, 142, 247, 0.25);
      padding: 0.25rem 0.6rem;
      border-radius: 4px;
    }

    /* ─── ROADMAP ITEMS ─── */
    .roadmap-item {
      position: relative;
      display: flex;
      align-items: flex-start;
      gap: 1rem;
      padding: 1.25rem 1.25rem 1.25rem 1.25rem;
      background-color: var(--bg-card);
      border: 1px solid var(--border);
      border-radius: 10px;
      margin-bottom: 1rem;
      transition: all 0.25s ease;
      overflow: hidden;
      animation: fadeSlideIn 0.4s ease both;
    }

    .roadmap-item:nth-child(1) { animation-delay: 0.05s; }
    .roadmap-item:nth-child(2) { animation-delay: 0.10s; }
    .roadmap-item:nth-child(3) { animation-delay: 0.15s; }
    .roadmap-item:nth-child(4) { animation-delay: 0.20s; }
    .roadmap-item:nth-child(5) { animation-delay: 0.25s; }
    .roadmap-item:nth-child(6) { animation-delay: 0.30s; }
    .roadmap-item:nth-child(7) { animation-delay: 0.35s; }

    @keyframes fadeSlideIn {
      from { opacity: 0; transform: translateY(12px); }
      to   { opacity: 1; transform: translateY(0); }
    }

    .roadmap-item:hover {
      background-color: var(--bg-card-hover);
      border-color: var(--border-glow);
      transform: translateY(-2px);
      box-shadow: 0 8px 24px rgba(0, 0, 0, 0.3), 0 0 0 1px var(--border-glow);
    }

    .roadmap-item.completed {
      border-left: 3px solid var(--accent-cyan);
    }

    .roadmap-item.pending {
      border-left: 3px solid var(--text-muted);
    }

    .item-icon {
      flex-shrink: 0;
      width: 44px;
      height: 44px;
      background: var(--bg-panel);
      border: 1px solid var(--border);
      border-radius: 8px;
      display: flex;
      align-items: center;
      justify-content: center;
      padding: 6px;
    }

    .item-icon img,
    .item-icon svg {
      width: 100%;
      height: 100%;
      object-fit: contain;
    }

    .item-body {
      flex: 1;
      min-width: 0;
    }

    .item-top {
      display: flex;
      align-items: center;
      justify-content: space-between;
      gap: 0.5rem;
      margin-bottom: 0.4rem;
      flex-wrap: wrap;
    }

    .item-body h3 {
      font-size: 1rem;
      font-weight: 700;
      color: var(--text-primary);
      letter-spacing: 0.02em;
    }

    .item-body p {
      font-size: 0.82rem;
      color: var(--text-secondary);
      line-height: 1.6;
    }

    /* ─── STATUS BADGES ─── */
    .badge {
      display: inline-flex;
      align-items: center;
      gap: 0.35rem;
      font-family: var(--font-mono);
      font-size: 0.65rem;
      letter-spacing: 0.08em;
      text-transform: uppercase;
      font-weight: 700;
      padding: 0.2rem 0.6rem;
      border-radius: 4px;
      white-space: nowrap;
      flex-shrink: 0;
    }

    .badge::before {
      content: '';
      width: 5px;
      height: 5px;
      border-radius: 50%;
      background: currentColor;
    }

    .badge.completed {
      background: rgba(0, 212, 170, 0.12);
      color: var(--accent-cyan);
      border: 1px solid rgba(0, 212, 170, 0.3);
    }

    .badge.pending {
      background: rgba(85, 93, 128, 0.15);
      color: var(--text-muted);
      border: 1px solid rgba(85, 93, 128, 0.3);
    }

    .badge.in-progress {
      background: rgba(79, 142, 247, 0.12);
      color: var(--accent-blue);
      border: 1px solid rgba(79, 142, 247, 0.3);
    }

    /* ─── RIGHT COLUMN ─── */
    .status {
      padding: 2.5rem 2rem;
      overflow-y: auto;
      background: linear-gradient(180deg, var(--bg-dark) 0%, #0e101a 100%);
    }

    .status-section {
      margin-bottom: 2rem;
    }

    .status-section-header {
      display: flex;
      align-items: center;
      gap: 0.75rem;
      margin-bottom: 1rem;
      padding-bottom: 0.75rem;
      border-bottom: 1px solid var(--border);
    }

    .status-section-header h3 {
      font-size: 1rem;
      font-weight: 700;
      letter-spacing: 0.05em;
      text-transform: uppercase;
      color: var(--accent-blue);
    }

    .status-count {
      font-family: var(--font-mono);
      font-size: 0.65rem;
      color: var(--text-muted);
      background: var(--bg-card);
      border: 1px solid var(--border);
      padding: 0.15rem 0.5rem;
      border-radius: 99px;
    }

    /* ─── STATUS CARDS ─── */
    .status-card {
      background: var(--bg-card);
      border: 1px solid var(--border);
      border-radius: 10px;
      padding: 1rem 1.25rem;
      margin-bottom: 0.75rem;
      transition: all 0.2s ease;
      position: relative;
      overflow: hidden;
      animation: fadeSlideIn 0.4s ease both;
    }

    .status-card::before {
      content: '';
      position: absolute;
      left: 0;
      top: 0;
      bottom: 0;
      width: 3px;
      background: var(--accent-cyan);
      border-radius: 2px 0 0 2px;
    }

    .status-card:hover {
      border-color: var(--border-glow);
      transform: translateX(3px);
    }

    .status-card .card-date {
      font-family: var(--font-mono);
      font-size: 0.68rem;
      color: var(--text-muted);
      margin-bottom: 0.4rem;
      letter-spacing: 0.05em;
    }

    .status-card .card-content {
      font-size: 0.9rem;
      color: var(--text-primary);
      line-height: 1.5;
      margin-bottom: 0.6rem;
    }

    .tag {
      display: inline-flex;
      align-items: center;
      gap: 0.3rem;
      font-family: var(--font-mono);
      font-size: 0.65rem;
      letter-spacing: 0.06em;
      text-transform: uppercase;
      background: rgba(0, 212, 170, 0.1);
      color: var(--accent-cyan);
      border: 1px solid rgba(0, 212, 170, 0.25);
      padding: 0.2rem 0.6rem;
      border-radius: 4px;
    }

    .tag.pending-tag {
      background: rgba(255, 92, 92, 0.1);
      color: var(--accent-red);
      border-color: rgba(255, 92, 92, 0.25);
    }

    .tag.progress-tag {
      background: rgba(79, 142, 247, 0.1);
      color: var(--accent-blue);
      border-color: rgba(79, 142, 247, 0.25);
    }

    /* ─── PROGRESS STATS ─── */
    .stats-grid {
      display: grid;
      grid-template-columns: repeat(3, 1fr);
      gap: 0.75rem;
      margin-bottom: 2rem;
    }

    .stat-card {
      background: var(--bg-card);
      border: 1px solid var(--border);
      border-radius: 10px;
      padding: 1rem;
      text-align: center;
    }

    .stat-value {
      font-size: 1.75rem;
      font-weight: 800;
      line-height: 1;
      margin-bottom: 0.25rem;
    }

    .stat-value.cyan { color: var(--accent-cyan); }
    .stat-value.muted { color: var(--text-muted); }
    .stat-value.blue { color: var(--accent-blue); }

    .stat-label {
      font-family: var(--font-mono);
      font-size: 0.65rem;
      color: var(--text-muted);
      letter-spacing: 0.08em;
      text-transform: uppercase;
    }

    /* ─── PROGRESS BAR ─── */
    .progress-section {
      background: var(--bg-card);
      border: 1px solid var(--border);
      border-radius: 10px;
      padding: 1.25rem;
      margin-bottom: 2rem;
    }

    .progress-label {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 0.75rem;
    }

    .progress-label span:first-child {
      font-size: 0.8rem;
      font-weight: 600;
      color: var(--text-secondary);
    }

    .progress-label span:last-child {
      font-family: var(--font-mono);
      font-size: 0.75rem;
      color: var(--accent-cyan);
    }

    .progress-bar {
      height: 6px;
      background: var(--border);
      border-radius: 999px;
      overflow: hidden;
    }

    .progress-fill {
      height: 100%;
      background: linear-gradient(90deg, var(--accent-blue), var(--accent-cyan));
      border-radius: 999px;
      animation: fillBar 1.2s ease both 0.3s;
      transform-origin: left;
    }

    @keyframes fillBar {
      from { width: 0 !important; }
    }

    /* ─── SCROLLBAR ─── */
    ::-webkit-scrollbar {
      width: 4px;
    }

    ::-webkit-scrollbar-track {
      background: transparent;
    }

    ::-webkit-scrollbar-thumb {
      background: var(--border);
      border-radius: 2px;
    }

    /* ─── RESPONSIVE ─── */
    @media (max-width: 768px) {
      .container {
        grid-template-columns: 1fr;
      }

      .roadmap {
        border-right: none;
        border-bottom: 1px solid var(--border);
      }

      .navbar {
        padding: 0 1rem;
        height: auto;
        padding: 1rem;
        flex-wrap: wrap;
        gap: 0.75rem;
      }

      .navbar-quote {
        display: none;
      }

      .stats-grid {
        grid-template-columns: repeat(3, 1fr);
      }
    }
    /* ─── NOTE BUTTON on each card ─── */
    .note-btn {
      display: inline-flex;
      align-items: center;
      gap: 0.3rem;
      margin-top: 0.65rem;
      font-family: var(--font-mono);
      font-size: 0.65rem;
      letter-spacing: 0.06em;
      color: var(--text-muted);
      background: transparent;
      border: 1px dashed var(--border);
      border-radius: 6px;
      padding: 0.25rem 0.6rem;
      cursor: pointer;
      transition: all 0.2s ease;
    }

    .note-btn:hover {
      color: var(--accent-gold);
      border-color: var(--accent-gold);
      background: rgba(245, 197, 66, 0.06);
    }

    .note-btn.has-note {
      color: var(--accent-gold);
      border-color: var(--accent-gold);
      border-style: solid;
      background: rgba(245, 197, 66, 0.08);
    }

    /* ─── WHITEBOARD OVERLAY ─── */
    .whiteboard-overlay {
      position: fixed;
      inset: 0;
      background: rgba(0, 0, 0, 0.55);
      z-index: 200;
      display: flex;
      align-items: center;
      justify-content: center;
      opacity: 0;
      pointer-events: none;
      transition: opacity 0.25s ease;
      backdrop-filter: blur(4px);
    }

    .whiteboard-overlay.open {
      opacity: 1;
      pointer-events: all;
    }

    /* ─── WHITEBOARD PANEL ─── */
    .whiteboard {
      width: 620px;
      max-width: 95vw;
      max-height: 90vh;
      background: var(--bg-card);
      border: 1px solid var(--border);
      border-radius: 16px;
      box-shadow: 0 32px 80px rgba(0,0,0,0.5);
      display: flex;
      flex-direction: column;
      overflow: hidden;
      transform: scale(0.94) translateY(16px);
      transition: transform 0.3s cubic-bezier(0.34, 1.56, 0.64, 1);
    }

    .whiteboard-overlay.open .whiteboard {
      transform: scale(1) translateY(0);
    }

    .whiteboard-header {
      display: flex;
      align-items: center;
      justify-content: space-between;
      padding: 1.1rem 1.4rem;
      border-bottom: 1px solid var(--border);
      background: var(--bg-panel);
      flex-shrink: 0;
    }

    .whiteboard-title {
      display: flex;
      align-items: center;
      gap: 0.6rem;
    }

    .whiteboard-title span.tool-icon-wrap {
      width: 32px;
      height: 32px;
      display: flex;
      align-items: center;
      justify-content: center;
      background: var(--bg-card);
      border: 1px solid var(--border);
      border-radius: 6px;
    }

    .whiteboard-title h4 {
      font-size: 1rem;
      font-weight: 700;
      color: var(--text-primary);
    }

    .whiteboard-title p {
      font-family: var(--font-mono);
      font-size: 0.65rem;
      color: var(--text-muted);
      margin-top: 1px;
    }

    .whiteboard-close {
      background: none;
      border: none;
      cursor: pointer;
      color: var(--text-muted);
      font-size: 1.2rem;
      line-height: 1;
      padding: 0.3rem;
      border-radius: 6px;
      transition: all 0.15s;
    }

    .whiteboard-close:hover {
      background: var(--bg-card-hover);
      color: var(--text-primary);
    }

    /* ─── TOOLBAR ─── */
    .whiteboard-toolbar {
      display: flex;
      align-items: center;
      gap: 0.4rem;
      padding: 0.65rem 1.4rem;
      border-bottom: 1px solid var(--border);
      background: var(--bg-panel);
      flex-wrap: wrap;
      flex-shrink: 0;
    }

    .tb-btn {
      background: var(--bg-card);
      border: 1px solid var(--border);
      border-radius: 6px;
      padding: 0.3rem 0.6rem;
      font-family: var(--font-mono);
      font-size: 0.7rem;
      color: var(--text-secondary);
      cursor: pointer;
      transition: all 0.15s;
    }

    .tb-btn:hover {
      border-color: var(--accent-blue);
      color: var(--accent-blue);
    }

    .tb-sep {
      width: 1px;
      height: 20px;
      background: var(--border);
      margin: 0 0.2rem;
    }

    .tb-color {
      width: 22px;
      height: 22px;
      border-radius: 50%;
      border: 2px solid transparent;
      cursor: pointer;
      transition: transform 0.15s;
    }

    .tb-color:hover, .tb-color.active {
      transform: scale(1.25);
      border-color: white;
    }

    /* ─── NOTES TEXTAREA ─── */
    .whiteboard-body {
      flex: 1;
      display: flex;
      flex-direction: column;
      overflow: hidden;
    }

    .notes-area {
      flex: 1;
      padding: 1.2rem 1.4rem;
      background: var(--bg-card);
      border: none;
      outline: none;
      resize: none;
      font-family: var(--font-mono);
      font-size: 0.85rem;
      line-height: 1.75;
      color: var(--text-primary);
      min-height: 200px;
    }

    .notes-area::placeholder {
      color: var(--text-muted);
    }

    /* ─── CHECKLIST AREA ─── */
    .checklist-area {
      padding: 0 1.4rem 0.5rem;
      display: none;
      flex-direction: column;
      gap: 0.4rem;
      max-height: 180px;
      overflow-y: auto;
    }

    .checklist-area.visible {
      display: flex;
    }

    .check-item {
      display: flex;
      align-items: center;
      gap: 0.6rem;
      background: var(--bg-panel);
      border: 1px solid var(--border);
      border-radius: 6px;
      padding: 0.4rem 0.7rem;
      animation: fadeSlideIn 0.2s ease both;
    }

    .check-item input[type="checkbox"] {
      accent-color: var(--accent-cyan);
      width: 14px;
      height: 14px;
      flex-shrink: 0;
      cursor: pointer;
    }

    .check-item label {
      flex: 1;
      font-family: var(--font-mono);
      font-size: 0.78rem;
      color: var(--text-secondary);
      cursor: pointer;
    }

    .check-item input[type="checkbox"]:checked + label {
      text-decoration: line-through;
      color: var(--text-muted);
    }

    .check-item .del-check {
      background: none;
      border: none;
      color: var(--text-muted);
      cursor: pointer;
      font-size: 0.8rem;
      padding: 0 0.2rem;
    }

    .check-item .del-check:hover { color: var(--accent-red); }

    .add-check-row {
      display: none;
      align-items: center;
      gap: 0.5rem;
      padding: 0.5rem 1.4rem;
      border-top: 1px solid var(--border);
      flex-shrink: 0;
    }

    .add-check-row.visible { display: flex; }

    .add-check-input {
      flex: 1;
      background: var(--bg-panel);
      border: 1px solid var(--border);
      border-radius: 6px;
      padding: 0.35rem 0.7rem;
      font-family: var(--font-mono);
      font-size: 0.78rem;
      color: var(--text-primary);
      outline: none;
    }

    .add-check-input:focus { border-color: var(--accent-blue); }

    .add-check-btn {
      background: var(--accent-blue);
      border: none;
      color: white;
      border-radius: 6px;
      padding: 0.35rem 0.75rem;
      font-family: var(--font-mono);
      font-size: 0.75rem;
      cursor: pointer;
    }

    /* ─── FOOTER ─── */
    .whiteboard-footer {
      display: flex;
      align-items: center;
      justify-content: space-between;
      padding: 0.75rem 1.4rem;
      border-top: 1px solid var(--border);
      background: var(--bg-panel);
      flex-shrink: 0;
      gap: 0.5rem;
    }

    .char-count {
      font-family: var(--font-mono);
      font-size: 0.65rem;
      color: var(--text-muted);
    }

    .wb-save-btn {
      background: var(--accent-cyan);
      border: none;
      color: #0d0f14;
      font-family: var(--font-mono);
      font-size: 0.75rem;
      font-weight: 700;
      letter-spacing: 0.06em;
      padding: 0.45rem 1.2rem;
      border-radius: 6px;
      cursor: pointer;
      transition: all 0.2s;
    }

    .wb-save-btn:hover {
      opacity: 0.85;
      transform: translateY(-1px);
    }

    .wb-save-btn.saved {
      background: var(--accent-gold);
    }

    .wb-clear-btn {
      background: none;
      border: 1px solid var(--border);
      color: var(--text-muted);
      font-family: var(--font-mono);
      font-size: 0.7rem;
      padding: 0.4rem 0.8rem;
      border-radius: 6px;
      cursor: pointer;
      transition: all 0.15s;
    }

    .wb-clear-btn:hover {
      border-color: var(--accent-red);
      color: var(--accent-red);
    }

    html.light .whiteboard {
      box-shadow: 0 32px 80px rgba(0,0,0,0.2);
    }

    html.light .notes-area {
      background: #fff;
    }

    /* ─── THEME TOGGLE ─── */
    .theme-toggle {
      position: relative;
      display: flex;
      align-items: center;
      gap: 0.5rem;
      cursor: pointer;
      user-select: none;
      background: var(--bg-card);
      border: 1px solid var(--border);
      border-radius: 999px;
      padding: 0.35rem 0.75rem 0.35rem 0.5rem;
      font-family: var(--font-mono);
      font-size: 0.65rem;
      letter-spacing: 0.06em;
      color: var(--text-secondary);
    }

    .theme-toggle:hover {
      border-color: var(--accent-blue);
      color: var(--text-primary);
    }

    .toggle-track {
      width: 36px;
      height: 20px;
      background: var(--border);
      border-radius: 999px;
      position: relative;
      transition: background 0.3s ease;
      flex-shrink: 0;
    }

    html.light .toggle-track {
      background: var(--accent-blue);
    }

    .toggle-thumb {
      position: absolute;
      top: 3px;
      left: 3px;
      width: 14px;
      height: 14px;
      border-radius: 50%;
      background: var(--text-muted);
      transition: transform 0.3s cubic-bezier(0.34, 1.56, 0.64, 1), background 0.3s ease;
    }

    html.light .toggle-thumb {
      transform: translateX(16px);
      background: white;
    }

    .toggle-icon {
      font-size: 0.85rem;
      line-height: 1;
    }

  </style>
</head>
<body>

  <!-- ─── NAVBAR ─── -->
  <header class="navbar">
    <div class="profile">
      <img class="profile-avatar" src="data:image/jpeg;base64,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" alt="Mujahid" />
      <div class="profile-info">
        <h3>MH — DevOps Test App</h3>
        <p>Sr. DevOps Engineer</p>
      </div>
    </div>

    <blockquote class="navbar-quote">
      "Every broken pipeline is a lesson. Every fix makes you stronger."
    </blockquote>

    <div style="display:flex;align-items:center;gap:0.75rem;">
      <button class="theme-toggle" id="themeToggle" aria-label="Toggle dark/light mode">
        <span class="toggle-icon" id="toggleIcon">🌙</span>
        <div class="toggle-track">
          <div class="toggle-thumb"></div>
        </div>
        <span id="toggleLabel">Dark</span>
      </button>

      <div class="navbar-badge">
        <span class="pulse-dot"></span>
        <span>Active Sprint</span>
      </div>
    </div>
  </header>

  <!-- ─── MAIN LAYOUT ─── -->
  <div class="container">

    <!-- ─── LEFT: ROADMAP ─── -->
    <section class="roadmap">
      <div class="section-header">
        <h2>DevOps Roadmap</h2>
        <span class="section-label">7 Topics</span>
      </div>

      <!-- Git & GitHub -->
      <div class="roadmap-item completed">
        <div class="item-icon">
          <!-- Git SVG -->
          <svg viewBox="0 0 92 92" xmlns="http://www.w3.org/2000/svg" fill="none" width="36" height="36">
            <path fill="#F05133" d="M90.156 41.965L50.036 1.848a5.913 5.913 0 00-8.368 0l-8.332 8.332 10.566 10.566a7.03 7.03 0 017.26 1.684 7.043 7.043 0 011.673 7.277l10.183 10.184a7.026 7.026 0 017.278 1.672 7.04 7.04 0 010 9.957 7.045 7.045 0 01-9.961 0 7.05 7.05 0 01-1.532-7.66L49.86 33.123v24.863a7.04 7.04 0 011.858 1.328 7.04 7.04 0 010 9.957 7.045 7.045 0 01-9.96 0 7.04 7.04 0 010-9.957 7.074 7.074 0 012.152-1.503V32.867a7.07 7.07 0 01-2.152-1.503 7.05 7.05 0 01-1.512-7.7L29.906 13.095 1.734 41.268a5.918 5.918 0 000 8.37l40.12 40.116a5.913 5.913 0 008.368 0l39.934-39.934a5.918 5.918 0 000-8.855z"/>
          </svg>
        </div>
        <div class="item-body">
          <div class="item-top">
            <h3>Git &amp; GitHub</h3>
            <span class="badge completed">Completed</span>
          </div>
          <p>Version Control System &amp; Repository Management, Branching Strategies, Pull Requests, Code Reviews</p>
          <button class="note-btn" data-tool="git" onclick="openWhiteboard('git','Git &amp; GitHub')">📝 Notes</button>
        </div>
      </div>

      <!-- Maven -->
      <div class="roadmap-item completed">
        <div class="item-icon">
          <!-- Maven SVG -->
          <svg viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg" width="36" height="36">
            <rect width="100" height="100" rx="12" fill="#C71A36"/>
            <text x="50" y="58" font-family="Georgia,serif" font-weight="bold" font-size="28" fill="white" text-anchor="middle">M</text>
            <text x="50" y="74" font-family="Georgia,serif" font-size="11" fill="#ffaaaa" text-anchor="middle">maven</text>
          </svg>
        </div>
        <div class="item-body">
          <div class="item-top">
            <h3>Maven</h3>
            <span class="badge completed">Completed</span>
          </div>
          <p>Build Automation, Dependency Management, Project Object Model (POM), Build Lifecycles</p>
          <button class="note-btn" data-tool="maven" onclick="openWhiteboard('maven','Maven')">📝 Notes</button>
        </div>
      </div>

      <!-- Jenkins -->
      <div class="roadmap-item completed">
        <div class="item-icon">
          <!-- Jenkins SVG -->
          <svg viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg" width="36" height="36">
            <ellipse cx="50" cy="42" rx="32" ry="36" fill="#D33833"/>
            <ellipse cx="50" cy="40" rx="28" ry="32" fill="#F0D6B7"/>
            <circle cx="42" cy="36" r="4" fill="#2C2C2C"/>
            <circle cx="58" cy="36" r="4" fill="#2C2C2C"/>
            <path d="M38 52 Q50 62 62 52" stroke="#2C2C2C" stroke-width="2.5" fill="none" stroke-linecap="round"/>
            <path d="M30 20 Q50 5 70 20" stroke="#2C2C2C" stroke-width="3" fill="none"/>
            <rect x="44" y="70" width="12" height="18" rx="3" fill="#D33833"/>
            <ellipse cx="50" cy="90" rx="14" ry="5" fill="#B02020"/>
          </svg>
        </div>
        <div class="item-body">
          <div class="item-top">
            <h3>Jenkins</h3>
            <span class="badge completed">Completed</span>
          </div>
          <p>Continuous Integration/Continuous Deployment, Pipeline as Code, Automated Testing, Build Automation</p>
          <button class="note-btn" data-tool="jenkins" onclick="openWhiteboard('jenkins','Jenkins')">📝 Notes</button>
        </div>
      </div>

      <!-- Ansible -->
      <div class="roadmap-item pending">
        <div class="item-icon">
          <!-- Ansible SVG -->
          <svg viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg" width="36" height="36">
            <circle cx="50" cy="50" r="48" fill="#1A1918"/>
            <path d="M50 10 A40 40 0 1 1 49.999 10Z" fill="#1A1918"/>
            <circle cx="50" cy="50" r="48" fill="none" stroke="#EE0000" stroke-width="3"/>
            <path d="M35 75 L55 25 L75 75 L60 55 Z" fill="white"/>
          </svg>
        </div>
        <div class="item-body">
          <div class="item-top">
            <h3>Ansible</h3>
            <span class="badge pending">Pending</span>
          </div>
          <p>Infrastructure as Code, Configuration Management, Playbooks, Roles, Inventory Management</p>
          <button class="note-btn" data-tool="ansible" onclick="openWhiteboard('ansible','Ansible')">📝 Notes</button>
        </div>
      </div>

      <!-- Docker -->
      <div class="roadmap-item pending">
        <div class="item-icon">
          <!-- Docker SVG -->
          <svg viewBox="0 0 100 70" xmlns="http://www.w3.org/2000/svg" width="40" height="28">
            <!-- Containers grid -->
            <rect x="4" y="28" width="16" height="14" rx="2" fill="#2496ED"/>
            <rect x="22" y="28" width="16" height="14" rx="2" fill="#2496ED"/>
            <rect x="40" y="28" width="16" height="14" rx="2" fill="#2496ED"/>
            <rect x="22" y="12" width="16" height="14" rx="2" fill="#2496ED"/>
            <rect x="40" y="12" width="16" height="14" rx="2" fill="#2496ED"/>
            <rect x="40" y="0" width="16" height="10" rx="2" fill="#2496ED"/>
            <!-- Whale body -->
            <path d="M8 46 Q50 58 90 46 Q95 55 85 62 Q50 70 15 62 Q5 55 8 46Z" fill="#2496ED"/>
            <!-- Water spray -->
            <path d="M78 36 Q82 28 80 22" stroke="#2496ED" stroke-width="2.5" fill="none" stroke-linecap="round"/>
            <path d="M80 22 Q84 18 82 14" stroke="#2496ED" stroke-width="2" fill="none" stroke-linecap="round"/>
          </svg>
        </div>
        <div class="item-body">
          <div class="item-top">
            <h3>Docker</h3>
            <span class="badge pending">Pending</span>
          </div>
          <p>Containerization, Image Creation, Docker Compose, Container Orchestration, Registry Management</p>
          <button class="note-btn" data-tool="docker" onclick="openWhiteboard('docker','Docker')">📝 Notes</button>
        </div>
      </div>

      <!-- Kubernetes -->
      <div class="roadmap-item pending">
        <div class="item-icon">
          <!-- Kubernetes SVG -->
          <svg viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg" width="36" height="36">
            <circle cx="50" cy="50" r="48" fill="#326CE5"/>
            <!-- Helm wheel spokes -->
            <line x1="50" y1="10" x2="50" y2="90" stroke="white" stroke-width="4" stroke-linecap="round"/>
            <line x1="10" y1="50" x2="90" y2="50" stroke="white" stroke-width="4" stroke-linecap="round"/>
            <line x1="21" y1="21" x2="79" y2="79" stroke="white" stroke-width="4" stroke-linecap="round"/>
            <line x1="79" y1="21" x2="21" y2="79" stroke="white" stroke-width="4" stroke-linecap="round"/>
            <!-- Outer ring -->
            <circle cx="50" cy="50" r="40" fill="none" stroke="white" stroke-width="5"/>
            <!-- Center hub -->
            <circle cx="50" cy="50" r="12" fill="white"/>
            <circle cx="50" cy="50" r="7" fill="#326CE5"/>
          </svg>
        </div>
        <div class="item-body">
          <div class="item-top">
            <h3>Kubernetes</h3>
            <span class="badge pending">Pending</span>
          </div>
          <p>Container Orchestration, Pod Management, Services, Deployments, StatefulSets, ConfigMaps &amp; Secrets</p>
          <button class="note-btn" data-tool="kubernetes" onclick="openWhiteboard('kubernetes','Kubernetes')">📝 Notes</button>
        </div>
      </div>

      <!-- Terraform -->
      <div class="roadmap-item pending">
        <div class="item-icon">
          <!-- Terraform SVG -->
          <svg viewBox="0 0 100 115" xmlns="http://www.w3.org/2000/svg" width="32" height="37">
            <polygon points="38,0 38,40 72,20" fill="#7B42BC"/>
            <polygon points="0,22 0,62 34,42" fill="#7B42BC"/>
            <polygon points="40,22 40,62 74,42" fill="#5C4EE5"/>
            <polygon points="40,68 40,108 74,88" fill="#7B42BC"/>
          </svg>
        </div>
        <div class="item-body">
          <div class="item-top">
            <h3>Terraform</h3>
            <span class="badge pending">Pending</span>
          </div>
          <p>Infrastructure as Code, Resource Management, State Management, Provider Configuration, Modules</p>
          <button class="note-btn" data-tool="terraform" onclick="openWhiteboard('terraform','Terraform')">📝 Notes</button>
        </div>
      </div>
    </section>

    <!-- ─── RIGHT: STATUS ─── -->
    <section class="status">
      <div class="section-header">
        <h2>Project Status</h2>
        <span class="section-label">Live</span>
      </div>

      <!-- Stats Overview -->
      <div class="stats-grid">
        <div class="stat-card">
          <div class="stat-value cyan">3</div>
          <div class="stat-label">Completed</div>
        </div>
        <div class="stat-card">
          <div class="stat-value muted">4</div>
          <div class="stat-label">Pending</div>
        </div>
        <div class="stat-card">
          <div class="stat-value blue">7</div>
          <div class="stat-label">Total</div>
        </div>
      </div>

      <!-- Progress Bar -->
      <div class="progress-section">
        <div class="progress-label">
          <span>Overall Progress</span>
          <span>43%</span>
        </div>
        <div class="progress-bar">
          <div class="progress-fill" style="width: 43%;"></div>
        </div>
      </div>

      <!-- Jenkins Project -->
      <div class="status-section">
        <div class="status-section-header">
          <h3>Jenkins Project</h3>
          <span class="status-count">3 entries</span>
        </div>

        <div class="status-card">
          <div class="card-date">January 25, 2026</div>
          <div class="card-content">Successfully installed and configured Jenkins CI/CD server</div>
          <span class="tag">✓ Completed</span>
        </div>

        <div class="status-card">
          <div class="card-date">January 25, 2026</div>
          <div class="card-content">Successfully configured Tomcat App Server</div>
          <span class="tag">✓ Completed</span>
        </div>

        <div class="status-card">
          <div class="card-date">January 25, 2026</div>
          <div class="card-content">Successfully completed Jenkins FreeStyle Deployment</div>
          <span class="tag">✓ Completed</span>
        </div>
      </div>

      <!-- Next Up -->
      <div class="status-section">
        <div class="status-section-header">
          <h3>Next Up</h3>
          <span class="status-count">2 planned</span>
        </div>

        <div class="status-card" style="--border-left-color: var(--text-muted);">
          <div class="card-date">Upcoming</div>
          <div class="card-content">Ansible — Infrastructure as Code &amp; Configuration Management</div>
          <span class="tag pending-tag">◌ Pending</span>
        </div>

        <div class="status-card">
          <div class="card-date">Upcoming</div>
          <div class="card-content">Docker — Containerization &amp; Image Creation Pipeline</div>
          <span class="tag pending-tag">◌ Pending</span>
        </div>
      </div>
    </section>
  </div>
  <!-- ─── WHITEBOARD OVERLAY ─── -->
  <div class="whiteboard-overlay" id="wbOverlay" onclick="overlayClick(event)">
    <div class="whiteboard" id="whiteboardPanel">

      <!-- Header -->
      <div class="whiteboard-header">
        <div class="whiteboard-title">
          <div class="tool-icon-wrap" id="wbIconWrap"></div>
          <div>
            <h4 id="wbToolName">Notes</h4>
            <p>Whiteboard — click Save to keep your notes</p>
          </div>
        </div>
        <button class="whiteboard-close" onclick="closeWhiteboard()" title="Close">✕</button>
      </div>

      <!-- Toolbar -->
      <div class="whiteboard-toolbar">
        <button class="tb-btn" onclick="formatText('bold')" title="Bold"><b>B</b></button>
        <button class="tb-btn" onclick="formatText('italic')" title="Italic"><i>I</i></button>
        <button class="tb-btn" onclick="insertBullet()" title="Bullet">• List</button>
        <button class="tb-btn" onclick="insertHeading()" title="Heading">H1</button>
        <div class="tb-sep"></div>
        <button class="tb-btn" onclick="toggleChecklist()" title="Checklist" id="checklistToggleBtn">☑ Checklist</button>
        <div class="tb-sep"></div>
        <span style="font-family:var(--font-mono);font-size:0.65rem;color:var(--text-muted);letter-spacing:0.05em;">Color:</span>
        <span class="tb-color active" style="background:#eef0f7" data-color="#eef0f7" onclick="setColor(this)" title="White"></span>
        <span class="tb-color" style="background:#00d4aa" data-color="#00d4aa" onclick="setColor(this)" title="Cyan"></span>
        <span class="tb-color" style="background:#4f8ef7" data-color="#4f8ef7" onclick="setColor(this)" title="Blue"></span>
        <span class="tb-color" style="background:#f5c542" data-color="#f5c542" onclick="setColor(this)" title="Gold"></span>
        <span class="tb-color" style="background:#ff5c5c" data-color="#ff5c5c" onclick="setColor(this)" title="Red"></span>
      </div>

      <!-- Body -->
      <div class="whiteboard-body">
        <!-- Checklist section -->
        <div class="checklist-area" id="checklistArea"></div>
        <div class="add-check-row" id="addCheckRow">
          <input class="add-check-input" id="checkInput" type="text" placeholder="Add checklist item..." onkeydown="checkEnter(event)" />
          <button class="add-check-btn" onclick="addCheckItem()">+ Add</button>
        </div>
        <!-- Free-text notes -->
        <textarea class="notes-area" id="notesTextarea"
          placeholder="✍️  Start writing your notes here...&#10;&#10;Tip: Use the toolbar above for formatting, or add a checklist for tasks."
          oninput="updateCharCount()"></textarea>
      </div>

      <!-- Footer -->
      <div class="whiteboard-footer">
        <span class="char-count" id="charCount">0 chars</span>
        <div style="display:flex;gap:0.5rem;">
          <button class="wb-clear-btn" onclick="clearNotes()">🗑 Clear</button>
          <button class="wb-save-btn" id="wbSaveBtn" onclick="saveNotes()">💾 Save</button>
        </div>
      </div>

    </div>
  </div>

  <script>
    // ─── THEME TOGGLE ───
    const toggle = document.getElementById('themeToggle');
    const icon   = document.getElementById('toggleIcon');
    const label  = document.getElementById('toggleLabel');
    const html   = document.documentElement;

    if (localStorage.getItem('theme') === 'light') {
      html.classList.add('light');
      icon.textContent  = '☀️';
      label.textContent = 'Light';
    }

    toggle.addEventListener('click', () => {
      const isLight = html.classList.toggle('light');
      icon.textContent  = isLight ? '☀️' : '🌙';
      label.textContent = isLight ? 'Light' : 'Dark';
      localStorage.setItem('theme', isLight ? 'light' : 'dark');
    });

    // ─── WHITEBOARD STATE ───
    let currentTool = null;
    let checklistData = {};   // { toolKey: [{text, done}] }
    let noteColor = '#eef0f7';
    let checklistVisible = false;

    // Load all saved checklist data
    try {
      const saved = localStorage.getItem('wb_checklists');
      if (saved) checklistData = JSON.parse(saved);
    } catch(e) {}

    // ─── OPEN / CLOSE ───
    function openWhiteboard(toolKey, toolName) {
      currentTool = toolKey;
      checklistVisible = false;

      // Set header
      document.getElementById('wbToolName').textContent = toolName;

      // Clone icon from card
      const srcBtn  = document.querySelector(`.note-btn[data-tool="${toolKey}"]`);
      const srcIcon = srcBtn?.closest('.roadmap-item')?.querySelector('.item-icon');
      const wrap    = document.getElementById('wbIconWrap');
      wrap.innerHTML = srcIcon ? srcIcon.innerHTML : '📋';

      // Load notes text
      const saved = localStorage.getItem(`wb_note_${toolKey}`) || '';
      const textarea = document.getElementById('notesTextarea');
      textarea.value = saved;
      textarea.style.color = localStorage.getItem(`wb_color_${toolKey}`) || 'var(--text-primary)';
      noteColor = localStorage.getItem(`wb_color_${toolKey}`) || '#eef0f7';

      // Sync color picker
      document.querySelectorAll('.tb-color').forEach(el => {
        el.classList.toggle('active', el.dataset.color === noteColor);
      });

      // Load checklist
      renderChecklist(toolKey);
      document.getElementById('checklistArea').classList.remove('visible');
      document.getElementById('addCheckRow').classList.remove('visible');
      document.getElementById('checklistToggleBtn').style.borderColor = '';
      document.getElementById('checklistToggleBtn').style.color = '';

      updateCharCount();

      // Open overlay
      document.getElementById('wbOverlay').classList.add('open');
      setTimeout(() => textarea.focus(), 320);
    }

    function closeWhiteboard() {
      document.getElementById('wbOverlay').classList.remove('open');
      currentTool = null;
    }

    function overlayClick(e) {
      if (e.target === document.getElementById('wbOverlay')) closeWhiteboard();
    }

    // Escape key closes
    document.addEventListener('keydown', e => {
      if (e.key === 'Escape') closeWhiteboard();
    });

    // ─── SAVE / CLEAR ───
    function saveNotes() {
      if (!currentTool) return;
      const text = document.getElementById('notesTextarea').value;
      localStorage.setItem(`wb_note_${currentTool}`, text);
      localStorage.setItem(`wb_color_${currentTool}`, noteColor);
      localStorage.setItem('wb_checklists', JSON.stringify(checklistData));

      // Update note button state
      const btn = document.querySelector(`.note-btn[data-tool="${currentTool}"]`);
      const hasContent = text.trim().length > 0 || (checklistData[currentTool]?.length > 0);
      if (btn) btn.classList.toggle('has-note', hasContent);
      if (btn) btn.textContent = hasContent ? '📝 Notes ●' : '📝 Notes';

      // Saved feedback
      const saveBtn = document.getElementById('wbSaveBtn');
      saveBtn.textContent = '✓ Saved!';
      saveBtn.classList.add('saved');
      setTimeout(() => {
        saveBtn.textContent = '💾 Save';
        saveBtn.classList.remove('saved');
      }, 1800);
    }

    function clearNotes() {
      if (!confirm('Clear all notes and checklist for this tool?')) return;
      document.getElementById('notesTextarea').value = '';
      if (currentTool) {
        checklistData[currentTool] = [];
        renderChecklist(currentTool);
        localStorage.removeItem(`wb_note_${currentTool}`);
        localStorage.removeItem(`wb_color_${currentTool}`);
        localStorage.setItem('wb_checklists', JSON.stringify(checklistData));
        const btn = document.querySelector(`.note-btn[data-tool="${currentTool}"]`);
        if (btn) { btn.classList.remove('has-note'); btn.textContent = '📝 Notes'; }
      }
      updateCharCount();
    }

    // ─── CHAR COUNT ───
    function updateCharCount() {
      const len = document.getElementById('notesTextarea').value.length;
      document.getElementById('charCount').textContent = `${len} char${len !== 1 ? 's' : ''}`;
    }

    // ─── SIMPLE FORMATTING (inserts markdown-style text) ───
    function formatText(type) {
      const ta = document.getElementById('notesTextarea');
      const start = ta.selectionStart, end = ta.selectionEnd;
      const sel = ta.value.substring(start, end) || 'text';
      let replacement = '';
      if (type === 'bold')   replacement = `**${sel}**`;
      if (type === 'italic') replacement = `_${sel}_`;
      ta.setRangeText(replacement, start, end, 'select');
      ta.focus();
      updateCharCount();
    }

    function insertBullet() {
      const ta = document.getElementById('notesTextarea');
      const pos = ta.selectionStart;
      const before = ta.value.substring(0, pos);
      const after  = ta.value.substring(pos);
      const newline = before.length > 0 && !before.endsWith('\n') ? '\n' : '';
      ta.value = before + newline + '• ' + after;
      ta.selectionStart = ta.selectionEnd = pos + newline.length + 2;
      ta.focus();
      updateCharCount();
    }

    function insertHeading() {
      const ta = document.getElementById('notesTextarea');
      const pos = ta.selectionStart;
      const before = ta.value.substring(0, pos);
      const after  = ta.value.substring(pos);
      const newline = before.length > 0 && !before.endsWith('\n') ? '\n' : '';
      ta.value = before + newline + '## ' + after;
      ta.selectionStart = ta.selectionEnd = pos + newline.length + 3;
      ta.focus();
      updateCharCount();
    }

    // ─── COLOR ───
    function setColor(el) {
      noteColor = el.dataset.color;
      document.querySelectorAll('.tb-color').forEach(e => e.classList.remove('active'));
      el.classList.add('active');
      document.getElementById('notesTextarea').style.color = noteColor;
    }

    // ─── CHECKLIST ───
    function toggleChecklist() {
      checklistVisible = !checklistVisible;
      document.getElementById('checklistArea').classList.toggle('visible', checklistVisible);
      document.getElementById('addCheckRow').classList.toggle('visible', checklistVisible);
      const btn = document.getElementById('checklistToggleBtn');
      btn.style.borderColor = checklistVisible ? 'var(--accent-cyan)' : '';
      btn.style.color       = checklistVisible ? 'var(--accent-cyan)' : '';
      if (checklistVisible) document.getElementById('checkInput').focus();
    }

    function renderChecklist(toolKey) {
      const area = document.getElementById('checklistArea');
      const items = checklistData[toolKey] || [];
      area.innerHTML = items.map((item, i) => `
        <div class="check-item">
          <input type="checkbox" id="chk_${i}" ${item.done ? 'checked' : ''} onchange="toggleCheck(${i})">
          <label for="chk_${i}">${escHtml(item.text)}</label>
          <button class="del-check" onclick="deleteCheck(${i})" title="Remove">✕</button>
        </div>
      `).join('');
    }

    function addCheckItem() {
      const input = document.getElementById('checkInput');
      const text = input.value.trim();
      if (!text || !currentTool) return;
      if (!checklistData[currentTool]) checklistData[currentTool] = [];
      checklistData[currentTool].push({ text, done: false });
      renderChecklist(currentTool);
      input.value = '';
      input.focus();
    }

    function checkEnter(e) {
      if (e.key === 'Enter') { e.preventDefault(); addCheckItem(); }
    }

    function toggleCheck(i) {
      if (!currentTool || !checklistData[currentTool]) return;
      checklistData[currentTool][i].done = !checklistData[currentTool][i].done;
    }

    function deleteCheck(i) {
      if (!currentTool || !checklistData[currentTool]) return;
      checklistData[currentTool].splice(i, 1);
      renderChecklist(currentTool);
    }

    function escHtml(str) {
      return str.replace(/&/g,'&amp;').replace(/</g,'&lt;').replace(/>/g,'&gt;').replace(/"/g,'&quot;');
    }

    // ─── RESTORE NOTE BUTTON STATES ON LOAD ───
    document.querySelectorAll('.note-btn').forEach(btn => {
      const key = btn.dataset.tool;
      const hasNote = !!(localStorage.getItem(`wb_note_${key}`)?.trim());
      const hasCheck = (checklistData[key]?.length > 0);
      if (hasNote || hasCheck) {
        btn.classList.add('has-note');
        btn.textContent = '📝 Notes ●';
      }
    });
  </script>
</body>
</html>
