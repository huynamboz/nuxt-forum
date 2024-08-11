import { serverSupabaseClient } from '#supabase/server'
import { throwError } from '~/server/utils/exception'

// get channel by slug
export default eventHandler(async (event) => {
  const client = await serverSupabaseClient(event)

  const slug = event.context.params!.slug

  const { data, error } = await client
  .from('channels')
  .select(`id, name, description, members:members(user:user_id(user_id:id, first_name, last_name, email, avatar_url, role))`)
  .eq('slug', slug)
  .maybeSingle()

  if (data) {
    return data
  } else if (error) {
    throw throwError(error.code, error.message)
  }
})
