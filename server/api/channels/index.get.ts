import { serverSupabaseClient } from '#supabase/server'

// get list of channel categories
export default eventHandler(async (event) => {
  const client = await serverSupabaseClient(event)

  const { data, error } = await client
  .from('channel_categories')
  .select(`id, name, channels (*)`)
  if (data) {
    return data
  } else {
    return []
  }
})
