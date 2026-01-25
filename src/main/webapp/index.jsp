<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>DevOps Roadmap and Status</title>
     <title>DevOps Roadmap and Status</title>
    <style>
      * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto,
          sans-serif;
      }

      body {
        min-height: 100vh;
        background-color: #f3f4f6;
      }

      .container {
        display: flex;
        min-height: 100vh;
      }

      /* Left Column - DevOps Roadmap */
      .roadmap {
        width: 50%;
        padding: 2rem;
        background-color: white;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        overflow-y: auto;
      }

      .roadmap h2 {
        font-size: 2rem;
        font-weight: bold;
        margin-bottom: 2rem;
        color: #1f2937;
      }

      .roadmap-item {
        position: relative;
        display: flex;
        align-items: flex-start;
        gap: 1rem;
        padding: 1.5rem;
        background-color: #f9fafb;
        border: 1px solid #e5e7eb;
        border-radius: 0.5rem;
        margin-bottom: 1.5rem;
        transition: background-color 0.2s;
      }

      .roadmap-item:hover {
        background-color: #f3f4f6;
      }

      .icon {
        background-color: #eff6ff;
        color: #2563eb;
        padding: 0.75rem;
        border-radius: 0.5rem;
        width: 3rem;
        height: 3rem;
        display: flex;
        align-items: center;
        justify-content: center;
      }

      .roadmap-content h3 {
        font-size: 1.25rem;
        font-weight: 600;
        color: #1f2937;
        margin-bottom: 0.5rem;
      }

      .roadmap-content p {
        color: #4b5563;
        line-height: 1.5;
      }

      /* Right Column - Project Status */
      .status {
        width: 50%;
        padding: 2rem;
        background-color: #1f2937;
        color: white;
        overflow-y: auto;
      }

      .status h2 {
        font-size: 2rem;
        font-weight: bold;
        margin-bottom: 2rem;
      }

      .status-section {
        margin-bottom: 2rem;
      }

      .status-section h3 {
        color: #60a5fa;
        font-size: 1.25rem;
        margin-bottom: 1rem;
        padding-bottom: 0.5rem;
        border-bottom: 1px solid #4b5563;
      }

      .status-item {
        background-color: #374151;
        padding: 1rem;
        border-radius: 0.5rem;
        margin-bottom: 1rem;
      }

      .status-item .date {
        color: #9ca3af;
        font-size: 0.875rem;
        margin-bottom: 0.5rem;
      }

      .status-item .content {
        color: #f3f4f6;
        line-height: 1.5;
      }

      .status-item .tag {
        display: inline-block;
        background-color: #2563eb;
        color: white;
        padding: 0.25rem 0.75rem;
        border-radius: 1rem;
        font-size: 0.875rem;
        margin-top: 0.5rem;
      }
      .icon img {
        width: 50px;
        height: 50px;
      }
      /* .completed{
            display: inline-block;
            background-color:gold;
            text-align: center;
            position: absolute;
            top:12px;
            left:510px;
            margin-top: 10px;
           border-top-right-radius: 10px; 
            width:120px;
            transform: rotate(40deg);

        } */
      .side {
        display: flex;
        justify-content: space-between;
      }

      .roadmap-item {
        position: relative;
        display: flex;
        align-items: flex-start;
        gap: 1rem;
        padding: 1.5rem;
        background-color: #f9fafb;
        border: 1px solid #e5e7eb;
        border-radius: 0.5rem;
        margin-bottom: 1.5rem;
        transition: background-color 0.2s;
        overflow: hidden;
      }

      .ribbon {
        position: absolute;
        top: 10px;
        right: -40px;
        transform: rotate(45deg);
        width: 140px;
        text-align: center;
        font-size: 0.875rem;
        color: white;
        padding: 0.25rem 0;
        z-index: 1;
      }

      .ribbon.completed {
        background-color: #facc15; /* gold */
        color: #1f2937;
        text-indent: 10px;;
        font-weight: bold;
      }

      .ribbon.pending {
        background-color: #ef4444; /* red */
        font-weight: bold;
      }

      .ribbon.in-progress {
        background-color: #3b82f6; /* blue */
        font-weight: bold;
      }

      .navbar {
    width: 100%;
    background-color: #271124;
    color: white;
    height: 100px;
    display: flex;
    flex-direction: row;
    gap:20px;
    align-items: center;
    justify-content: space-around;
    }

    .navbar img {
      width: 80px;
      height: 80px;
      border-radius: 50%;
      margin-left: 30px;
      /* margin-bottom: 1rem; */
      border: 3px solid white;
      object-position: top;
      /* object-fit: cover; */
    }

    .navbar h3 {
      font-size: 1.25rem;
      margin-bottom: 0.25rem;
    }

    .navbar p {
      font-size: 0.875rem;
      color: #9ca3af;
      text-align: center;
    }
    .profile{
      display:flex
    }
    .name{
      margin-left: 10px;
      margin-top:15px;
      font-family:Arial, Helvetica, sans-serif
    }
    .Suneel {
      border: 5px solid white;
    border-top: 0px;
    border-right: 0px;
    border-bottom: 0px;
    padding: 20px;
}
.dj {
  font-style: italic;
  text-decoration: underline;
}
    </style>
  </head>
  <body>

    <div class="navbar">
      <div class="profile">
        <img src="" alt="Your Logo"/>
        <h3 class="name"> MH- DevOps Test APP
          <p class="dj">Sr.DevOps Engineer</p>
        </h3>
      </div>
       <i><q class="Suneel">Every Broken Pipeline is a Lesson, Every Fix makes you Stronger!!</q></i>
      </div>


    <div class="container">
      <!-- Left Column - DevOps Roadmap -->
      <div class="roadmap">
        <h2>DevOps Roadmap</h2>
        <div class="roadmap-items">
          <div class="roadmap-item">
            <div class="icon">
              <img
                src="https://www.stickerpress.in/media/products/800x800/b66880fed2234b05b1264254b5fae4d1.jpg"
                alt=""
              />
            </div>
            <div class="roadmap-content">
              <div class="side">
                <h3>Git & GitHub</h3>
                <span class="ribbon completed">Completed</span>
              </div>
              <p>
                Version Control System & Repository Management, Branching
                Strategies, Pull Requests, Code Reviews
              </p>
            </div>
          </div>
          <div class="roadmap-item">
            <div class="icon">
              <img
                src="https://www.svgrepo.com/show/373829/maven.svg"
                alt=""
              />
            </div>
            <div class="roadmap-content">
              <h3>Maven</h3>
              <span class="ribbon completed">Completed</span>

              <p>
                Build Automation, Dependency Management, Project Object Model
                (POM), Build Lifecycles
              </p>
            </div>
          </div>
          <div class="roadmap-item">
            <div class="icon">
              <img
                src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-xxUGtIiKKym7sK95GyeRg7wWBHKO_p3aQw&s"
                alt=""
              />
            </div>
            <div class="roadmap-content">
              <h3>Jenkins</h3>
              <span class="ribbon completed">Process</span>

              <p>
                Continuous Integration/Continuous Deployment, Pipeline as Code,
                Automated Testing, Build Automation
              </p>
            </div>
          </div>
          <div class="roadmap-item">
            <div class="icon">
              <img
                src="https://images.icon-icons.com/2389/PNG/512/ansible_logo_icon_145495.png"
                alt=""
              />
            </div>
            <div class="roadmap-content">
              <h3>Ansible</h3>
              <p>
                Infrastructure as Code, Configuration Management, Playbooks,
                Roles, Inventory Management
              </p>
            </div>
          </div>
          <div class="roadmap-item">
            <div class="icon">
              <img
                src="https://cdn4.iconfinder.com/data/icons/logos-and-brands/512/97_Docker_logo_logos-512.png"
                alt=""
              />
            </div>
            <div class="roadmap-content">
              <h3>Docker</h3>
              <p>
                Containerization, Image Creation, Docker Compose, Container
                Orchestration, Registry Management
              </p>
            </div>
          </div>
          <div class="roadmap-item">
            <div class="icon">
              <img
                src="https://upload.wikimedia.org/wikipedia/commons/thumb/3/39/Kubernetes_logo_without_workmark.svg/2109px-Kubernetes_logo_without_workmark.svg.png"
                alt=""
              />
            </div>
            <div class="roadmap-content">
              <h3>Kubernetes</h3>
              <p>
                Container Orchestration, Pod Management, Services, Deployments,
                StatefulSets, ConfigMaps & Secrets
              </p>
            </div>
          </div>
          <div class="roadmap-item">
            <div class="icon">
              <img
                src="https://img.icons8.com/fluent/512/terraform.png"
                alt=""
              />
            </div>
            <div class="roadmap-content">
              <h3>Terraform</h3>
              <p>
                Infrastructure as Code, Resource Management, State Management,
                Provider Configuration, Modules
              </p>
            </div>
          </div>
        </div>
      </div>

      <!-- Right Column - Project Status -->
      <div class="status">
        <h2>Project Status</h2>

        <div class="status-section">
          <h3>Jenkins Project</h3>
          <div class="status-item">
            <div class="date">July 9, 2025</div>
            <div class="content">
             Currently working on Jenkins
            </div>
            <span class="tag">Process</span>
          </div>
        <div class="status-item">
            <div class="date">July 9, 2025</div>
            <div class="content">
              Successfully Configured Tomcat App Server
            </div>
            <span class="tag">Completed</span>
          </div>
        </div>
      <div class="status-item">
            <div class="date">July 9, 2025</div>
            <div class="content">
              Successfully Completed Jenkins FreeStyle Deployment
            </div>
            <span class="tag">Completed</span>
          </div>
        </div>
    </div>
    </div>
  </body>
</html>
