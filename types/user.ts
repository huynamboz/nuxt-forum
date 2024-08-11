export interface User {
  id: string
  name: string
  email: string
  avatar_url: string
  first_name: string
  last_name: string
  role: "ADMIN" | "MEMBER" | "MOD"
}