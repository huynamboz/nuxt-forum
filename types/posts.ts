import type { Channel } from "./channels"
import type { User } from "./user"

export interface Post {
  id: string
  title: string
  content: string
  created_at: string
  channel: Channel
  created_by: User
  slug: string
}

export interface CreatedBy {
  id: string
  role: string
  email: any
  website: any
  username: string
  last_name: string
  avatar_url: string
  first_name: string
  updated_at: any
}
