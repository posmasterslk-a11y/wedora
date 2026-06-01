<template>
  <layout-admin-layout>
    <div class="px-4 py-6 sm:px-6 lg:px-8 max-w-4xl mx-auto">
      <div class="mb-8">
        <h1 class="text-2xl font-semibold leading-6 text-gray-900 dark:text-white">Create New Invitation</h1>
        <p class="mt-2 text-sm text-gray-700 dark:text-gray-400">Fill in the details below to generate your beautiful, animated wedding invitation.</p>
      </div>

      <form @submit.prevent="createInvite" class="space-y-8 bg-white dark:bg-gray-800 p-6 sm:p-8 rounded-xl shadow-sm border border-gray-100 dark:border-gray-700">
        
        <!-- Couple Names -->
        <div>
          <label for="names" class="block text-sm font-medium leading-6 text-gray-900 dark:text-gray-200">Couple Names</label>
          <div class="mt-2">
            <input v-model="form.couple_names" type="text" name="names" id="names" class="block w-full rounded-md border-0 py-2.5 px-3.5 text-gray-900 dark:text-white shadow-sm ring-1 ring-inset ring-gray-300 dark:ring-gray-600 dark:bg-gray-700 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-brand-500 sm:text-sm sm:leading-6" placeholder="e.g., Romeo & Juliet" required />
          </div>
        </div>

        <div class="grid grid-cols-1 gap-x-6 gap-y-8 sm:grid-cols-2">
          <!-- Event Date -->
          <div>
            <label for="date" class="block text-sm font-medium leading-6 text-gray-900 dark:text-gray-200">Event Date & Time</label>
            <div class="mt-2">
              <input v-model="form.event_date" type="datetime-local" name="date" id="date" class="block w-full rounded-md border-0 py-2.5 px-3.5 text-gray-900 dark:text-white shadow-sm ring-1 ring-inset ring-gray-300 dark:ring-gray-600 dark:bg-gray-700 focus:ring-2 focus:ring-inset focus:ring-brand-500 sm:text-sm sm:leading-6" required />
            </div>
          </div>

          <!-- Location -->
          <div>
            <label for="location" class="block text-sm font-medium leading-6 text-gray-900 dark:text-gray-200">Venue / Location Name</label>
            <div class="mt-2">
              <input v-model="form.location" type="text" name="location" id="location" class="block w-full rounded-md border-0 py-2.5 px-3.5 text-gray-900 dark:text-white shadow-sm ring-1 ring-inset ring-gray-300 dark:ring-gray-600 dark:bg-gray-700 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-brand-500 sm:text-sm sm:leading-6" placeholder="e.g., Shangri-La Colombo" required />
            </div>
          </div>
        </div>

        <!-- Google Maps Link -->
        <div>
          <label for="map_url" class="block text-sm font-medium leading-6 text-gray-900 dark:text-gray-200">Google Maps Link (Optional)</label>
          <div class="mt-2">
            <input v-model="form.map_url" type="url" name="map_url" id="map_url" class="block w-full rounded-md border-0 py-2.5 px-3.5 text-gray-900 dark:text-white shadow-sm ring-1 ring-inset ring-gray-300 dark:ring-gray-600 dark:bg-gray-700 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-brand-500 sm:text-sm sm:leading-6" placeholder="https://maps.app.goo.gl/..." />
          </div>
        </div>

        <!-- Special Comments -->
        <div>
          <label for="comments" class="block text-sm font-medium leading-6 text-gray-900 dark:text-gray-200">Special Comments (Optional)</label>
          <div class="mt-2">
            <textarea v-model="form.special_comments" id="comments" name="comments" rows="3" class="block w-full rounded-md border-0 py-2.5 px-3.5 text-gray-900 dark:text-white shadow-sm ring-1 ring-inset ring-gray-300 dark:ring-gray-600 dark:bg-gray-700 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-brand-500 sm:text-sm sm:leading-6" placeholder="Dress code, RSVP details, etc."></textarea>
          </div>
        </div>

        <!-- Image Upload -->
        <div>
          <label class="block text-sm font-medium leading-6 text-gray-900 dark:text-gray-200">Couple Photo</label>
          <div class="mt-2 flex items-center gap-x-3">
            <input type="file" accept="image/*" @change="handleFileUpload" class="block w-full text-sm text-gray-900 dark:text-gray-300 file:mr-4 file:py-2 file:px-4 file:rounded-md file:border-0 file:text-sm file:font-semibold file:bg-brand-50 file:text-brand-700 hover:file:bg-brand-100 dark:file:bg-gray-700 dark:file:text-white" />
          </div>
          <p v-if="uploadingImage" class="mt-2 text-sm text-brand-600">Uploading image...</p>
          <div v-if="form.image_url" class="mt-4">
            <img :src="form.image_url" alt="Couple Photo" class="h-40 w-auto rounded-lg object-cover shadow-sm border border-gray-200 dark:border-gray-700" />
          </div>
        </div>

        <!-- Theme Color -->
        <div>
          <label class="block text-sm font-medium leading-6 text-gray-900 dark:text-gray-200">Theme Color</label>
          <div class="mt-3 flex items-center gap-4">
            <label v-for="theme in themes" :key="theme.id" class="relative cursor-pointer">
              <input type="radio" v-model="form.theme_color" :value="theme.id" class="peer sr-only" name="theme_color" />
              <div :class="[theme.bgClass, 'w-10 h-10 rounded-full border-2 border-transparent peer-checked:ring-2 peer-checked:ring-offset-2 peer-checked:ring-offset-white dark:peer-checked:ring-offset-gray-800 transition-all shadow-sm']" :style="{ '--tw-ring-color': theme.hex }"></div>
              <span class="mt-2 block text-xs text-center font-medium text-gray-900 dark:text-gray-300 peer-checked:text-brand-500">{{ theme.name }}</span>
            </label>
          </div>
        </div>

        <!-- Submit Button -->
        <div class="pt-4 border-t border-gray-200 dark:border-gray-700 flex justify-end gap-3">
          <router-link to="/" class="px-4 py-2 text-sm font-medium text-gray-700 dark:text-gray-200 bg-white dark:bg-gray-700 border border-gray-300 dark:border-gray-600 rounded-md shadow-sm hover:bg-gray-50 dark:hover:bg-gray-600">Cancel</router-link>
          <button type="submit" :disabled="loading" class="px-6 py-2 text-sm font-medium text-white bg-brand-500 rounded-md shadow-sm hover:bg-brand-600 disabled:opacity-50 disabled:cursor-not-allowed">
            <span v-if="loading">Creating...</span>
            <span v-else>Generate Invitation</span>
          </button>
        </div>
      </form>
    </div>
  </layout-admin-layout>
</template>

<script setup lang="ts">
import { ref, reactive } from 'vue'

const supabase = useSupabaseClient()
const user = useSupabaseUser()
const router = useRouter()

const loading = ref(false)

const themes = [
  { id: 'rose', name: 'Rose Gold', bgClass: 'bg-[#b76e79]', hex: '#b76e79' },
  { id: 'emerald', name: 'Emerald', bgClass: 'bg-[#50C878]', hex: '#50C878' },
  { id: 'dark', name: 'Midnight', bgClass: 'bg-[#1a202c]', hex: '#1a202c' },
  { id: 'ocean', name: 'Ocean', bgClass: 'bg-[#0077b6]', hex: '#0077b6' },
]

const form = reactive({
  couple_names: '',
  event_date: '',
  location: '',
  map_url: '',
  special_comments: '',
  theme_color: 'rose',
  image_url: '' // We will implement image upload next
})

const uploadingImage = ref(false)

const handleFileUpload = async (event: any) => {
  const file = event.target.files[0]
  if (!file) return

  try {
    uploadingImage.value = true
    const fileExt = file.name.split('.').pop()
    const fileName = `${Math.random()}.${fileExt}`
    const filePath = `${user.value?.id}/${fileName}`

    const { error: uploadError } = await supabase.storage
      .from('invites')
      .upload(filePath, file)

    if (uploadError) throw uploadError

    const { data } = supabase.storage.from('invites').getPublicUrl(filePath)
    form.image_url = data.publicUrl
  } catch (error: any) {
    console.error('Error uploading image:', error)
    alert('Error uploading image: ' + error.message)
  } finally {
    uploadingImage.value = false
  }
}

const createInvite = async () => {
  if (!user.value) {
    alert("You must be logged in to create an invitation.")
    return
  }

  loading.value = true
  
  try {
    const { data, error } = await supabase.from('invitations').insert({
      user_id: user.value.id,
      couple_names: form.couple_names,
      event_date: new Date(form.event_date).toISOString(),
      location: form.location,
      map_url: form.map_url,
      special_comments: form.special_comments,
      theme_color: form.theme_color,
      image_url: form.image_url
    }).select().single()

    if (error) throw error

    // Navigate back to dashboard on success
    router.push('/')
  } catch (error: any) {
    console.error('Error creating invitation', error)
    alert(error.message)
  } finally {
    loading.value = false
  }
}
</script>
