<div align="center">
  <img src="https://img.shields.io/badge/React-20232A?style=for-the-badge&logo=react&logoColor=61DAFB" alt="React" />
  <img src="https://img.shields.io/badge/Node.js-339933?style=for-the-badge&logo=nodedotjs&logoColor=white" alt="Node.js" />
  <img src="https://img.shields.io/badge/Express.js-000000?style=for-the-badge&logo=express&logoColor=white" alt="Express" />
  <img src="https://img.shields.io/badge/MongoDB-4EA94B?style=for-the-badge&logo=mongodb&logoColor=white" alt="MongoDB" />
  <img src="https://img.shields.io/badge/Tailwind_CSS-38B2AC?style=for-the-badge&logo=tailwind-css&logoColor=white" alt="Tailwind" />
</div>

<h1 align="center">🚀 TeamTasker</h1>

<p align="center">
  <strong>A modern, responsive, full-stack Task Management platform built with the MERN stack.</strong><br>
  Built with clean, simple, and functional code for an internship assignment.
</p>

---

## ✨ Features

- 🔐 **Secure Authentication:** JWT-based user signup, login, and protected routes.
- 👥 **Role-Based Access Control:**
  - 👑 **Admins:** Full control. Create/Delete projects, assign tasks, add members, and manage everything.
  - 👷 **Members:** Streamlined view. Can only see assigned projects/tasks and update their own task statuses.
- 📁 **Project Workspaces:** Organize your team by creating isolated projects and assigning specific members.
- ✅ **Task Tracking:** Create detailed tasks with Priority flags (Low, Medium, High), deadlines, and Status pipelines (Todo, In Progress, Completed).
- 📊 **Live Dashboard:** A beautiful glassmorphic analytics view of your team's overall progress.

---

## 🛠️ Tech Stack

**Frontend:**
- ⚛️ **React** (Vite for lightning-fast builds)
- 🎨 **Tailwind CSS v4** (Modern utility-first styling with Glassmorphism)
- 🧭 **React Router DOM** (Client-side routing)
- 🔌 **Axios** (API communication)
- 🪶 **Lucide React** (Beautiful SVG icons)

**Backend:**
- 🟢 **Node.js & Express.js** (Robust REST API)
- 🍃 **MongoDB Atlas & Mongoose** (Cloud NoSQL Database)
- 🛡️ **bcryptjs & JWT** (Security and Authentication)

---

## 📂 Folder Structure

```text
sonu/
├── backend/               # Node.js + Express backend
│   ├── middleware/            # Mongoose schemas (User, Project, Task)
│   ├── models/            # Mongoose schemas (User, Project, Task)
│   ├── routes/            # Mongoose schemas (User, Project, Task)
│   ├── server.js          # Main entry point and all API routes
│   └── package.json       
│
├── frontend/              # React frontend
│   ├── src/
│   │   ├── components/    # Reusable UI (Layout, Navbar, Sidebar)
│   │   ├── pages/         # Core Views (Login, Dashboard, Projects, Tasks)
│   │   ├── api.js         # Axios instance setup
│   │   ├── App.jsx        # Routing setup
│   │   ├── index.css      # styling
│   │   └── main.jsx       # React DOM render
│   ├── index.html
│   ├── vite.config.js
│   └── package.json
│
├── package.json           # Root Monorepo configuration
└── README.md
```

---

## 💻 Running Locally (Development Mode)

Want to run this on your own machine? It's incredibly simple. You will need two terminal windows open—one for the backend server and one for the React frontend.

**Prerequisites:** Make sure you have [Node.js](https://nodejs.org/) installed.

### 1. Clone & Setup
```bash
git clone <your-repo-url>
cd TeamTasker
```

### 2. Start the Backend
Open your first terminal and run:
```bash
cd backend
npm install
```
Create a `.env` file inside the `backend` folder and add your configuration:
```env
PORT=5000
MONGODB_URI=mongodb+srv://<username>:<password>@cluster0...
JWT_SECRET=my_super_secret_key_123
```

Now, start the backend server:
```bash
npm run dev
```
*(You should see `Server running on port 5000` and `Connected to MongoDB`)*

### 3. Start the Frontend
Open a **second, new terminal window** and run:
```bash
cd frontend
npm install
npm run dev
```

🚀 **Open your browser and navigate to `http://localhost:5173`.** The app is now running with full hot-reloading enabled!

---

## ☁️ Deployment Steps

### 🚂 Deploying on Railway (100% Free & Easy Method)
I have configured this codebase as a **Monorepo**. This means the Express backend automatically builds and serves your React frontend. You only need to deploy **ONE** service on Railway, keeping you perfectly within their free tier!

1. **Push your code to GitHub.**
2. **Go to [Railway.app](https://railway.app/)** and sign in with GitHub.
3. **Deploy the App:**
   - Click **"New Project"** -> **"Deploy from GitHub repo"**.
   - Select your repository and click **"Deploy Now"**.
4. **Configure Environment Variables:**
   - Click on your newly created service in Railway.
   - Go to the **Variables** tab.
   - Add `MONGODB_URI` and paste your MongoDB Atlas connection string.
   - Add `JWT_SECRET` and type a random strong string.
5. **Watch the Magic Happen:**
   - Railway will automatically detect the root `package.json`.
   - It will run `npm install` for both frontend and backend.
   - It will run `npm run build` to compile the Vite React app.
   - It will run `npm start` to boot up the Node.js server.
6. **Get your Live Domain:**
   - Go to the **Settings** tab.
   - Under "Networking", click **"Generate Domain"**.
   - **Click the link and your app is live!** 🎉

---

## 🍃 MongoDB Atlas Setup (If needed)

If you are running this locally and need your own database:
1. Go to [MongoDB Atlas](https://www.mongodb.com/cloud/atlas) and create a free cluster.
2. Under "Database Access", create a new database user with a password.
3. **CRITICAL:** Under "Network Access", add `0.0.0.0/0` to allow access from anywhere. (This is necessary if you want an evaluator to connect using your URI).
4. Click "Connect", choose "Connect your application", and copy the connection string.
5. Replace `<password>` in the string and paste it into your `backend/.env` file.

---

## 📡 API Endpoints

| Resource | Method | Endpoint | Description | Access |
|---|---|---|---|---|
| **Auth** | `POST` | `/api/auth/signup` | Register a new user | Public |
| **Auth** | `POST` | `/api/auth/login` | Login and get JWT | Public |
| **Projects**| `GET` | `/api/projects` | Fetch all workspaces | Admin (All) / Member (Assigned) |
| **Projects**| `POST` | `/api/projects` | Create new workspace | **Admin Only** |
| **Projects**| `DELETE`| `/api/projects/:id`| Delete workspace & tasks| **Admin Only** |
| **Tasks** | `GET` | `/api/tasks` | Fetch all tasks | Admin (All) / Member (Assigned) |
| **Tasks** | `POST` | `/api/tasks` | Create new task | **Admin Only** |
| **Tasks** | `PATCH`| `/api/tasks/:id` | Update task status | Admin (Any) / Member (Own) |
| **Tasks** | `DELETE`| `/api/tasks/:id` | Delete a task | **Admin Only** |
| **Users** | `GET` | `/api/users` | List users for assignment| **Admin Only** |

---

## 👨‍💻 Author

Built by **Sonu**. Thanks for checking it out! ✌️