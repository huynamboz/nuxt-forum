<script setup lang="ts">
import type { Post } from '~/types/posts';
import ViewMore from '../base/ViewMore.vue';
defineProps<{
  post: Post
}>()
</script>
<template>
  <UCard class="avatar w-full max-w-[650px]">
    <div>
      
      <div class="flex justify-between w-full gap-5">
        <NuxtLink :to="{ name: 'c-slug-posts-post_slug', params: { post_slug: post.slug } }"
          class="text-xl font-bold mb-5" style="word-break:break-word;">{{ post.title }}</NuxtLink>
        <UIcon name="i-hugeicons-pin" class="w-5 min-w-5 h-5" />
      </div>

      <div class="flex gap-3">
        <UAvatar class="avatar" src="https://avatars.githubusercontent.com/u/739984?v=4" alt="benjamincanac"
          size="md" />
        <div>
          <div class="flex items-center gap-2">
            <h2 class="text-sm font-semibold">{{ [post.created_by.first_name, post.created_by.last_name].join(" ") }}
            </h2>
            <UBadge v-if="post.created_by.role === 'ADMIN'" :ui="{ rounded: 'rounded-full' }" class="text-xs">{{
              post.created_by.role.toLowerCase() }}</UBadge>
          </div>
          <p class="text-gray-500 text-xs">Post in {{ post.channel.name }}</p>
        </div>
      </div>

      <!-- prevent hydras miss match -->
      <ClientOnly>
        <span style="white-space: pre-line" class="text-gray-800 mt-5 block text-sm">
          {{ post.content }}
        </span>
      </ClientOnly>
    </div>
    <template #footer>
      <div class="flex justify-between w-full">
        <div class="flex items-center gap-3">
          <UAvatarGroup size="sm" :max="2">
            <UAvatar src="https://avatars.githubusercontent.com/u/739984?v=4" alt="benjamincanac" />
            <UAvatar src="https://avatars.githubusercontent.com/u/904724?v=4" alt="Atinux" />
            <UAvatar src="https://avatars.githubusercontent.com/u/7547335?v=4" alt="smarroufin" />
          </UAvatarGroup>
          <p>đã thích</p>
        </div>
        <div class="flex items-center text-sm gap-3 font-semibold text-gray-700">
          <UIcon name="i-heroicons-chat" class="w-5 min-w-5 h-5" />
          <p>200 bình luận</p>
        </div>
      </div>
    </template>
  </UCard>
</template>