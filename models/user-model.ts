enum UserRoles {
  OWNER = "owner",
  EDITOR = "editor",
  CONTRIBUTOR = "contributor",
  VIEWER = "viewer",
}

export interface User {
  uid: string;
  email: string;
  displayName: string | null;
  photoURL?: string | null;
  createdAt: Date;
  updatedAt: Date;
}

export interface Tenant {
  id: string;
  name: string;
  description?: string;
  createdAt: Date;
  updatedAt: Date;
  logoUrl?: string;
  defaultDomains?: string[];
}

export interface UserRole {
  userId: string;
  role: UserRoles;
  domains: string[];
  createdAt: Date;
  updatedAt: Date;
}
