infra/
├── main.tf                ✅ ← Entry point (calls modules)
├── variables.tf           ✅ ← Location, RG name, etc.
├── outputs.tf             ✅ ← Output AKS name, URLs
├── backend.tf             ✅ ← Remote state config (Azure Storage)
├── network.tf             ⏳ ← VNet, subnets, private DNS
├── aks.tf                 ⏳ ← AKS cluster with autoscaling
├── acr.tf                 ⏳ ← Azure Container Registry
├── apim.tf                ⏳ ← API Management (APIM)
├── db.tf                  ⏳ ← PostgreSQL + private endpoint
├── cache.tf               ⏳ ← Azure Cache for Redis
├── eventhub.tf            ⏳ ← Azure Event Hub
├── monitoring.tf          ⏳ ← Azure Monitor + Grafana
