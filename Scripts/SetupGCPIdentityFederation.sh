PROJECT_ID="lefewaresolutions-poc"
SERVICE_ACCOUNT_NAME="lws-d-iac-sa"
POOL_NAME="my-pool"
REPO="LefeWareSolutions/GoogleCloudPlatformIaCTemplates"

gcloud iam service-accounts create ${SERVICE_ACCOUNT_NAME}\
  --project "${PROJECT_ID}"

#Create Workload Identity Pool
gcloud iam workload-identity-pools create $POOL_NAME \
  --project="${PROJECT_ID}" \
  --location="global" \
  --display-name="Demo pool"

gcloud iam workload-identity-pools describe $POOL_NAME \
  --project="${PROJECT_ID}" \
  --location="global" \
  --format="value(name)"

WORKLOAD_IDENTITY_POOL_ID="projects/385050593732/locations/global/workloadIdentityPools/my-pool"

# Create a Workload Identity Provider in that pool
gcloud iam workload-identity-pools providers create-oidc "my-provider" \
  --project="${PROJECT_ID}" \
  --location="global" \
  --workload-identity-pool="my-pool" \
  --display-name="Demo provider" \
  --attribute-mapping="google.subject=assertion.sub,attribute.actor=assertion.actor,attribute.aud=assertion.aud" \
  --issuer-uri="https://token.actions.githubusercontent.com"


#Allow authentications from the Workload Identity Provider to impersonate the desired Service Account:
gcloud iam service-accounts add-iam-policy-binding "${SERVICE_ACCOUNT_NAME}@${PROJECT_ID}.iam.gserviceaccount.com" \
  --project="${PROJECT_ID}" \
  --role="roles/iam.workloadIdentityUser" \
  --member="principalSet://iam.googleapis.com/${WORKLOAD_IDENTITY_POOL_ID}/attribute.repository/${REPO}"


# Extract the Workload Identity Provider resource name:
gcloud iam workload-identity-pools providers describe "my-provider" \
  --project="${PROJECT_ID}" \
  --location="global" \
  --workload-identity-pool="my-pool" \
  --format="value(name)"