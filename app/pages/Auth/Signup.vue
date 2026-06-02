<template>
  <FullScreenLayout>
    <div class="relative p-6 bg-white z-1 dark:bg-gray-900 sm:p-0">
      <div class="relative flex flex-col justify-center w-full h-screen lg:flex-row dark:bg-gray-900">
        
        <div class="flex flex-col flex-1 w-full lg:w-1/2 justify-center">
          <div class="flex flex-col justify-center w-full max-w-md mx-auto px-4">
            
            <!-- Branding for Mobile -->
            <div class="text-center mb-8 lg:hidden">
              <img src="/logo.png" alt="Wedora Logo" class="h-32 w-auto object-contain mx-auto" />
            </div>

            <div class="text-center sm:text-left mb-8">
              <h1 class="mb-3 font-bold text-gray-900 text-2xl dark:text-white/90 tracking-tight sm:text-3xl">
                Get Started with Wedora
              </h1>
              <p class="text-sm text-gray-500 dark:text-gray-400 leading-relaxed">
                Beautiful, modern digital wedding invitations. Create an account with your Google account to customize, and manage your invitations effortlessly!
              </p>
            </div>

            <!-- Single Sign-On (SSO) Google Signup Button -->
            <div class="space-y-4">
              <button
                @click.prevent="signUpWithGoogle"
                class="flex w-full items-center justify-center gap-3 py-3.5 text-sm font-semibold text-gray-700 transition-all duration-300 bg-gray-50 border border-gray-200 rounded-xl px-7 hover:bg-gray-100 hover:text-gray-900 hover:shadow-md dark:bg-white/5 dark:border-gray-800 dark:text-white/90 dark:hover:bg-white/10"
              >
                <!-- Google SVG Logo -->
                <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                  <path d="M18.7511 10.1944C18.7511 9.47495 18.6915 8.94995 18.5626 8.40552H10.1797V11.6527H15.1003C15.0011 12.4597 14.4654 13.675 13.2749 14.4916L13.2582 14.6003L15.9087 16.6126L16.0924 16.6305C17.7788 15.1041 18.7511 12.8583 18.7511 10.1944Z" fill="#4285F4" />
                  <path d="M10.1788 18.75C12.5895 18.75 14.6133 17.9722 16.0915 16.6305L13.274 14.4916C12.5201 15.0068 11.5081 15.3666 10.1788 15.3666C7.81773 15.3666 5.81379 13.8402 5.09944 11.7305L4.99473 11.7392L2.23868 13.8295L2.20264 13.9277C3.67087 16.786 6.68674 18.75 10.1788 18.75Z" fill="#34A853" />
                  <path d="M5.10014 11.7305C4.91165 11.186 4.80257 10.6027 4.80257 9.99992C4.80257 9.3971 4.91165 8.81379 5.09022 8.26935L5.08523 8.1534L2.29464 6.02954L2.20333 6.0721C1.5982 7.25823 1.25098 8.5902 1.25098 9.99992C1.25098 11.4096 1.5982 12.7415 2.20333 13.9277L5.10014 11.7305Z" fill="#FBBC05" />
                  <path d="M10.1789 4.63331C11.8554 4.63331 12.9864 5.34303 13.6312 5.93612L16.1511 3.525C14.6035 2.11528 12.5895 1.25 10.1789 1.25C6.68676 1.25 3.67088 3.21387 2.20264 6.07218L5.08953 8.26943C5.81381 6.15972 7.81776 4.63331 10.1789 4.63331Z" fill="#EB4335" />
                </svg>
                Continue with Google
              </button>
            </div>

            <!-- Switch to Sign In -->
            <div class="mt-6 text-center sm:text-left">
              <p class="text-sm text-gray-550 dark:text-gray-400">
                Already have an account?
                <router-link to="/auth/signin" class="font-semibold text-brand-600 hover:text-brand-700 dark:text-brand-400 dark:hover:text-brand-300 transition-colors">
                  Sign In
                </router-link>
              </p>
            </div>

            <!-- Footer terms note -->
            <p class="mt-8 text-center text-xs text-gray-400 dark:text-gray-500">
              By signing up, you agree to our Terms of Service and Privacy Policy.
            </p>

          </div>
        </div>

        <!-- Right Side Panel -->
        <div class="relative items-center hidden w-full h-full lg:w-1/2 bg-brand-950 dark:bg-white/5 lg:grid">
          <div class="flex items-center justify-center z-1">
            <common-grid-shape />
            <div class="flex flex-col items-center max-w-xs">
              <router-link to="/" class="block mb-4">
                <img src="/logo.png" alt="Wedora Logo" class="h-20 w-auto object-contain mx-auto" />
              </router-link>
              <p class="text-center text-gray-400 dark:text-white/60 text-sm">
                Create and manage beautiful, modern wedding invitations effortlessly.
              </p>
            </div>
          </div>
        </div>

      </div>
    </div>
  </FullScreenLayout>
</template>

<script setup lang="ts">
import CommonGridShape from '@/components/common/CommonGridShape.vue'
import FullScreenLayout from '@/components/layout/FullScreenLayout.vue'

definePageMeta({
  path: '/auth/signup'
})

const supabase = useSupabaseClient()

const signUpWithGoogle = async () => {
  const { error } = await supabase.auth.signInWithOAuth({
    provider: 'google',
    options: {
      redirectTo: window.location.origin + '/confirm'
    }
  })
  if (error) {
    console.error('Error signing up with Google', error)
  }
}
</script>
