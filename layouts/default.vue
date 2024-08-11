<script setup>
import Header from '~/components/layouts/Header.vue'
import Sidebar from '~/components/layouts/Sidebar.vue'
</script>
<template>
  <div class="h-screen overflow-hidden flex flex-col">
    <Header />
    <div class="flex flex-auto overflow-hidden items-stretch">
      <Sidebar />
      <div class="flex-auto overflow-y-auto overflow-x-hidden">
        <slot />
      </div>
    </div>
  </div>
</template>
