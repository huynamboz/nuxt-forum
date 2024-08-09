<script setup lang="ts">
const user = useSupabaseUser()
</script>
<template>
   <div class="container flex justify-center" style="padding: 50px 0 100px 0">
    <Account v-if="user" />
    <Auth v-else />
    <NuxtLink to="/auth/login">Posts</NuxtLink>
  </div>
</template>