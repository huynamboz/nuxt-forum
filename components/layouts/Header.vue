<template>
  <header class="h-[46px] min-h-[46px] w-full bg-white border border-b flex items-center justify-between px-5">
    <div class="flex items-center gap-2">
      <UIcon name="i-hugeicons-apple-stocks" class="w-5 min-w-5 h-5" />
      <p class="font-bold">COD Comuunity</p>
    </div>
    <div>
      <UInput
        icon="i-heroicons-magnifying-glass-20-solid"
        size="sm"
        class="w-full min-w-[500px]"
        color="white"
        :trailing="false"
        placeholder="Search..."
      />
    </div>
    <div class="flex items-center">
      <UButton label="Đăng nhập" color="gray">
        <template #trailing>
          <UIcon name="i-heroicons-arrow-right-20-solid" class="w-5 h-5" />
        </template>
      </UButton>
      <UAvatar
        src="https://avatars.githubusercontent.com/u/739984?v=4"
        alt="benjamincanac"
        size="sm"
        class="avatar"
      />
    </div>
  </header>
</template>