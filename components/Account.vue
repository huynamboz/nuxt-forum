<script setup>
const supabase = useSupabaseClient()

const loading = ref(true)
const username = ref('')
const website = ref('')
const avatar_path = ref('')

loading.value = true
const user = useSupabaseUser()

const { data } = await supabase
  .from('profiles')
  .select(`username, website, avatar_url, role`)
  .eq('id', user.value.id)
  .single()

if (data) {
  username.value = data.username
  website.value = data.website
  avatar_path.value = data.avatar_url
}

loading.value = false

async function updateProfile() {
  try {
    loading.value = true
    const user = useSupabaseUser()

    const updates = {
      id: user.value.id,
      username: username.value,
      website: website.value,
      avatar_url: avatar_path.value,
      updated_at: new Date(),
    }

    const { error } = await supabase.from('profiles').upsert(updates, {
      returning: 'minimal', // Don't return the value after inserting
    })
    if (error) throw error
  } catch (error) {
    alert(error.message)
  } finally {
    loading.value = false
  }
}

async function signOut() {
  try {
    loading.value = true
    const { error } = await supabase.auth.signOut()
    if (error) throw error
    user.value = null
  } catch (error) {
    alert(error.message)
  } finally {
    loading.value = false
  }
}

const title = ref('')
const content = ref('')

async function createPost() {
  try {
    loading.value = true
    const user = useSupabaseUser()

    const { data, error } = await supabase.from('posts').insert([
      {
        user_id: user.value.id,
        title: title.value,
        content: content.value,
        created_at: new Date(),
      },
    ])
    if (error) throw error
    console.log('Post created:', data)
  } catch (error) {
    alert(error.message)
  } finally {
    loading.value = false
  }
}

// get list of posts from the database return created_by get from user_id column of posts table
const posts = ref([])

// try {
//   const data = useFetch('/api/posts')
  
// if (error) {
//   alert(error.message)
// } else {
//   posts.value = postsData
// }
// } catch (error) {
//   console.log(error)
// }


</script>

<template>
  <form class="form-widget" @submit.prevent="updateProfile">
    <div>
      <label for="email">Email</label>
      <input id="email" type="text" :value="user.email" disabled />
    </div>
    <div>
      <label for="username">Username</label>
      <input id="username" type="text" v-model="username" />
    </div>
    <div>
      <label for="website">Website</label>
      <UInput v-model="website" />
      <input id="website" type="url" v-model="website" />
    </div>

    <div>
      <input
        type="submit"
        class="button primary block"
        :value="loading ? 'Loading ...' : 'Update'"
        :disabled="loading"
      />
    </div>

    <div>
      <button class="button block" @click="signOut" :disabled="loading">Sign Out</button>
    </div>
  </form>

  <!-- form create post with title & content -->
  <form class="form-widget" @submit.prevent="createPost">
    <div>
      <label for="title">Title</label>
      <input id="title" type="text" v-model="title" />
    </div>
    <div>
      <label for="content">Content</label>
      <textarea id="content" v-model="content" />
    </div>

    <div>
      <input
        type="submit"
        class="button primary block"
        :value="loading ? 'Loading ...' : 'Create Post'"
        :disabled="loading"
      />
    </div>
  </form>
</template>