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
      <svg viewBox="0 0 48 48" xmlns="http://www.w3.org/2000/svg" width="48" height="48" class="profile-avatar">
        <circle cx="24" cy="24" r="24" fill="#1a1e2e"/>
        <circle cx="24" cy="19" r="8" fill="#4f8ef7"/>
        <ellipse cx="24" cy="40" rx="13" ry="9" fill="#4f8ef7"/>
        <text x="24" y="23" font-family="sans-serif" font-weight="800" font-size="8" fill="white" text-anchor="middle">MH</text>
      </svg>
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
  <script>
    const toggle = document.getElementById('themeToggle');
    const icon   = document.getElementById('toggleIcon');
    const label  = document.getElementById('toggleLabel');
    const html   = document.documentElement;

    // Restore saved preference
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
  </script>
</body>
</html>
