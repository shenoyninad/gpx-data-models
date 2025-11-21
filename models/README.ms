```
tenants/                      ← List of all tenants
  {tenantId}/
      name
      createdAt
      updatedAt
      ...

      roles/                 ← Users + Roles for this tenant
         {userId}

      domains/               ← Domain (category) structure
         {domainId}

      gpx/                   ← One or many GPX documents
         {gpxId}
            steps/
                {stepId}
                    substeps/
                        {substepId}

            approvalQueue/
                {changeId}

      media/
```

This design assumes:

- Firebase Authentication is used for sign-in
- Firestore stores user profiles
- Tenants and roles are stored under `/tenants/{tenantId}/roles/{userId}`
- After login, the client fetches the user’s tenant memberships + roles

### 1 - /auth/login

```
{
  "email": "user@example.com",
  "password": "your-password"
}
```

- Firebase method - signInWithEmailAndPassword()
- firebase endpoint to use to fetch user information - users/{uid}

```
{
  "user": {
    "uid": "abc123",
    "email": "user@example.com",
    "displayName": "Alex Smith",
    "photoURL": null
  },
  "tenants": [
    {
      "tenantId": "ringpower",
      "role": "editor",
      "domains": ["welding", "machining"]
    },
    {
      "tenantId": "tesla",
      "role": "viewer",
      "domains": []
    }
  ],
  "token": "<FIREBASE_ID_TOKEN>"
}

```
