<script setup lang="ts">
import PostDetail from '~/components/posts/PostDetail.vue';

import { getPost } from '~/services/posts';

const { params } = useRoute()

const { data } = await getPost(String(params.slug), String(params.post_slug))

const post = computed(() => data?.value)

console.log(post.value)

</script>
<template>
  <div class="py-5">
    <div class="flex flex-col items-center">
      <div>
          <NuxtLink :to="{ name: 'c-slug' }" class="flex gap-2 items-center mb-4">
            <Icon name="hugeicons:arrow-left-02" class="w-5 h-5" />
            Quay lại
          </NuxtLink>
        <PostDetail v-if="post" :post="post" />
      </div>
    </div>
  </div>
</template>