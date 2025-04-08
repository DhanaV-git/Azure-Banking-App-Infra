## 🏦 Azure Banking App – Microservices Architecture
![License](https://img.shields.io/badge/License-MIT-yellow)

This project delivers a cloud-native, containerized **Banking Application** powered by **Azure Kubernetes Service (AKS)**, designed to demonstrate microservices architecture, CI/CD pipelines, and infrastructure automation.
### 🚀 A cloud-native, full-stack banking application deployed using:
- **React + Vite (Frontend)**
- **Spring Boot (Java Microservices)**
- **Azure AKS + ACR + APIM + Redis + PostgreSQL**
- **CI/CD with GitHub Actions + Azure DevOps**
- **Infrastructure as Code with Terraform**

---

## 📁 Folder Structure

```bash
banking-app/
├── frontend/                   # React + Vite app
├── user-service/              # Java Spring Boot (port 8081)
├── account-service/           # Java Spring Boot (port 8082)
├── transaction-service/       # Java Spring Boot (port 8083)
├── helm-charts/               # Helm charts for AKS deployment
├── infra/                     # Terraform for full Azure infra
├── azure-pipelines/           # Azure DevOps pipelines (infra only)
├── .github/workflows/         # GitHub Actions for Docker builds & pushes
└── README.md
```

---

## ⚙️ Tech Stack

| Layer             | Tech                                   |
|-------------------|----------------------------------------|
| Frontend          | React (Vite), Tailwind CSS, Lucide Icons |
| Microservices     | Spring Boot, Java 17                   |
| API Gateway       | Azure API Management (APIM)            |
| Auth/Caching      | Azure Cache for Redis                  |
| Database          | Azure PostgreSQL Flexible Server       |
| Message Queue     | Azure Event Hub                        |
| Hosting           | Azure Kubernetes Service (AKS)         |
| Container Registry| Azure Container Registry (ACR)         |
| Monitoring        | Azure Monitor + Log Analytics + Grafana|
| CI/CD             | GitHub Actions + Azure DevOps          |
| Infra             | Terraform (modular)                    |

---

## 🔁 Deployment Pipelines

### 🧪 GitHub Actions ( For Testing Purpose )
| Workflow                          | Purpose                     |
|----------------------------------|-----------------------------|
| `dockerhub-push.yml`             | Push Docker image to Docker Hub |
| `acr-push-frontend.yml`          | Build & push to ACR         |
| `user-service-push.yml`, etc.    | Build & push other services |

### 🔧 Azure DevOps
| Pipeline File                    | Purpose                          |
|----------------------------------|----------------------------------|
| `terraform-infra-pipeline.yml`   | Spins up full Azure infra via Terraform |
| (optional) Helm release pipelines| Deploy apps into AKS (optional)  |

---

## 🚢 Docker Image Naming

Images are built and pushed to ACR via GitHub Actions:

![image](https://github.com/user-attachments/assets/c574874a-76e1-42f7-800d-647c57038f2e)


```
<registry>.azurecr.io/<service>:latest

e.g.
<your-Azure-ACR>.azurecr.io/frontend:latest
```

---

## 🧱 Infrastructure Modules (Terraform)

| Module         | Description                         |
|----------------|-------------------------------------|
| `network.tf`   | VNet, subnets                       |
| `aks.tf`       | AKS Cluster with autoscaling        |
| `acr.tf`       | Azure Container Registry            |
| `db.tf`        | Azure PostgreSQL                    |
| `apim.tf`      | Azure API Management                |
| `cache.tf`     | Azure Redis                         |
| `eventhub.tf`  | Event stream for telemetry          |
| `monitoring.tf`| Azure Monitor + Grafana             |

---

## 📦 Helm Chart Example

Each service has a chart in `helm-charts/`:
```bash
helm install user-service ./helm-charts/user-service --set image.repository=<acr-url>/user-service
```

---

## 🧪 Local Development (Frontend)

```bash
cd frontend
npm install
npm run dev
```

Visit: [http://localhost:5173](http://localhost:5173)

---

## 📞 API Test Buttons in UI

![image](https://github.com/user-attachments/assets/758452a0-df1c-46aa-ba24-fb1802396cc0)


- 👤 **User Service**: `/api/v1/users/123`
- 💳 **Account Service**: `/api/v1/accounts/123`
- 🚀 **Transaction Service**: `/api/v1/transactions`

✅ All calls routed through `VITE_API_GATEWAY_URL` set in `.env` or container args.

---

## 📄 Environment Variables

| Variable              | Used In        | Example                           |
|------------------------|----------------|------------------------------------|
| `VITE_API_GATEWAY_URL` | Frontend        | `https://your-apim.azure-api.net` |
| `SPRING_DATASOURCE_URL`| Microservices   | `jdbc:postgresql://...`           |
| `REDIS_HOST`           | Microservices   | `your-redis.redis.cache.windows.net` |

---

## ✅ Status: Production-Ready

- [x] All services containerized
- [x] Built + pushed via GitHub Actions
- [x] Secure ACR access from AKS
- [x] Infra provisioned via Terraform
- [x] Monitoring integrated
- [x] OpenAPI spec & Helm optional for final deployment

---

## 📬 Contributing

1. Fork the repo
2. Create a feature branch
3. Open a PR
4. GitHub Actions will test and push your Docker image automatically

---

## 👨‍💻 Author & License

**Designed & Built by Dhana**  
Backed by 💙 Azure + GitHub Actions

This project is licensed under the **MIT License**.  
See `LICENSE` for more information.

For support or inquiries: [dhanalakshmi.vnvudl@gmail.com](mailto:dhanalakshmi.vnvudl@gmail.com)
