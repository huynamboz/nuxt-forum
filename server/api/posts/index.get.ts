import { serverSupabaseClient } from '#supabase/server'

export default eventHandler(async (event) => {
  const client = await serverSupabaseClient(event)

  const { data, error } = await client
  .from('posts')
  .select(`id, title, content, created_at, created_by:user_id(*)`)
  .order('created_at', { ascending: false })
  console.log("data", data, error)
  if (data) {
    return { data: data[0] }
  } else {
    return { data: null }
  }
})
