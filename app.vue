<script setup>
const user = useSupabaseUser()
</script>

<template>
  <NuxtLoadingIndicator />
   <NuxtLayout>
    <NuxtPage />
  </NuxtLayout>
 
</template>