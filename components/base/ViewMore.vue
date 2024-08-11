<script setup lang="ts">
defineProps<{
  content: string;
}>();
const isShowFullText = ref(false);
</script>

<template>
  <div class="summary">
    <span style="white-space: pre-line" class="text-gray-800 mt-5 block text-sm">{{
      isShowFullText ? content : content.slice(0, 80) + '...'
    }}</span>
    <button class="text-gray-600 text-sm hover:underline" @click="isShowFullText = !isShowFullText">
      {{ isShowFullText ? 'Thu gọn' : 'Xem thêm' }}
    </button>
  </div>
</template>