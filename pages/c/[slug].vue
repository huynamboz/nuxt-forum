<script setup lang="ts">
import { getChannel } from '~/services/channels';

const channel = ref()

const { params } = useRoute()

const { data } = await getChannel(String(params.slug))
</script>
<template>
  <div class="overflow-hidden h-full flex flex-col">
    <div class="h-[60px] bg-white border-b flex items-center justify-between px-5">
      <div v-if="data" class="h-full flex items-center gap-2">
        <UIcon name="i-hugeicons-align-box-top-left" class="w-7 min-w-7 h-7" />
        <div>
          <p class="font-semibold">{{ data.name }}</p>
          <p class="text-xs text-gray-500">{{ data.description }}</p>
        </div>
      </div>

      <UButton label="Tạo bài viết" color="gray">
        <template #trailing>
          <UIcon name="hugeicons:add-01" class="w-5 h-5" />
        </template>
      </UButton>
    </div>
    <div class="overflow-auto h-full">
      <NuxtPage />
    </div>
  </div>
</template>