import { serverSupabaseClient } from '#supabase/server'

export default eventHandler(async (event) => {
  const client = await serverSupabaseClient(event)

  // get slug from query
  const post_slug = event.context.params?.post_slug

  console.log(post_slug)

  if (!post_slug) {
    return { data: null }
  }

  const { data, error } = await client
  .from('posts')
  .select(`id, title, content, slug, created_at, created_by:user_id(*), pinned, channel:channels(*)`)
  .eq('slug', post_slug)
  .maybeSingle()

  if (data) {
    return data
  } else {
    return []
  }
})
