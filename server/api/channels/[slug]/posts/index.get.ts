import { serverSupabaseClient } from '#supabase/server'

export default eventHandler(async (event) => {
  const client = await serverSupabaseClient(event)

  // get slug from query
  const slug = event.context.params?.slug

  if (!slug) {
    return { data: null }
  }

  const { data, error } = await client
  .from('posts')
  .select(`id, title, content, slug, created_at, created_by:user_id(*), pinned,channel:channels!inner(id, slug, name)`)
  .order('created_at', { ascending: false })
  .eq('channel.slug', slug)

  if (data) {
    return data
  } else {
    return []
  }
})
