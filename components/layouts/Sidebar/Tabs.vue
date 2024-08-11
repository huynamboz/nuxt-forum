<script setup lang="ts">
// const categories = ref([
//   {
//     id: 1,
//     name: "TỔNG QUAN",
//     channels: [
//       {
//         id: 1,
//         name: "Tất cả",
//         icon: "i-solar-buildings-outline",
//       },
//       {
//         id: 2,
//         name: "Đã lưu",
//         icon: "i-solar-bookmark-linear",
//       },
//     ],
//   },
//   {
//     id: 2,
//     name: "NHÓM",
//     channels: [
//       {
//         id: 1,
//         name: "Nhóm của bạn",
//         icon: "i-hugeicons-square-lock-01",
//       },
//       {
//         id: 2,
//         name: "Nhóm đã tham gia",
//         icon: "i-hugeicons-square-lock-01",
//       },
//     ],
//   },
//   {
//     id: 3,
//     name: "TRANG",
//     channels: [
//       {
//         id: 1,
//         name: "Trang của bạn",
//         icon: "i-hugeicons-square-lock-01",
//       },
//       {
//         id: 2,
//         name: "Trang đã thích",
//         icon: "i-hugeicons-square-lock-01",
//       },
//     ],
//   },
//   {
//     id: 4,
//     name: "SỰ KIỆN",
//     channels: [
//       {
//         id: 1,
//         name: "Sự kiện của bạn",
//         icon: "i-solar-calendar-outline",
//       },
//       {
//         id: 2,
//         name: "Sự kiện đã tham gia",
//         icon: "i-solar-calendar-add-outline",
//       },
//     ],
//   },
//   {
//     id: 5,
//     name: "MARKETPLACE",
//     channels: [
//       {
//         id: 1,
//         name: "Mua bán",
//         icon: "i-solar-shopping-cart-outline",
//       },
//       {
//         id: 2,
//         name: "Nhóm mua bán",
//         icon: "i-solar-shopping-bag-outline",
//       },
//     ],
//   },
//   {
//     id: 6,
//     name: "VIDEO",
//     channels: [
//       {
//         id: 1,
//         name: "Video của bạn",
//         icon: "i-hugeicons-square-lock-01",
//       },
//       {
//         id: 2,
//         name: "Video đã xem",
//         icon: "i-hugeicons-square-lock-01",
//       },
//     ],
//   },
// ])

const route = useRoute()


const { data } = await useFetch('/api/channels')
console.log(data.value)

// const categories = computed(() => {
//   return data ? data.value?.map((c) => c.channel_category) : []
// })
</script>
<template>
  <div class="flex flex-col p-3 overflow-y-hidden hover:overflow-y-auto active:overflow-y-auto focus:overflow-y-auto h-full">
    <div v-for="category in data" :key="category.id">
      <div class="h-8 flex items-center px-1 font-semibold text-gray-600 mt-5">
        {{ category.name }}
      </div>
      <div class="mt-1">
        <NuxtLink 
          :to="`/c/${channel.slug || channel.id}`" 
          v-for="channel in category.channels" 
          :key="channel.id" 
          :class="{ '!bg-gray-200 !text-gray-800' : route.path.includes(`/c/${channel.slug}`) }"
          class="mt-1 text-gray-600 text-sm flex items-center gap-2 px-3 rounded-lg py-2 cursor-pointer hover:bg-gray-100">
          <Icon :name="channel.icon || 'i-hugeicons-square-lock-01'" class="w-4 h-4" />
          <p>
            {{ channel.name }}
          </p>
        </NuxtLink>
      </div>
    </div>
  </div>
</template>