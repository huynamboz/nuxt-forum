<script setup lang="ts">
import PostItem from '~/components/posts/PostItem.vue';
import { getPosts } from '~/services/posts';


const { params } = useRoute()
const {data} = await getPosts(String(params.slug))
console.log(data.value)
const posts = computed(() => data?.value)
</script>

<template>
  <div class="flex justify-center py-10 flex-auto px-5">
    
   <div v-if="data">
    <PostItem class="mt-5" v-for="post in posts" :key="post.id" :post="post" />
    <!-- <NuxtLink :to="{ name: 'c-slug-posts-post_slug', params: { post_slug : 1 }}">Post 1</NuxtLink> -->
    <!-- [BUG]: version 3.12.4 #28373 -->
    <!-- {{ $route.params.slug }} -->
   </div>
  </div>
</template>

<style>

</style>