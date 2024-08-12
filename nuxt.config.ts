// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  compatibilityDate: '2024-04-03',
  modules: ['@nuxtjs/supabase', '@nuxt/ui', '@nuxtjs/tailwindcss'],
  tailwindcss: {
    cssPath: ['~/assets/css/tailwind.css', { injectPosition: "first" }],
    configPath: 'tailwind.config',
  },
  vite: {
    define: {
      global: "window",
    },
},
  css: ['@/public/assets/main.css'],
  supabase: {
    // Options
    redirect: false
  },
  devtools: { enabled: true }
})
