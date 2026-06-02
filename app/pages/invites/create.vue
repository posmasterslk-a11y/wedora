<template>
  <layout-admin-layout>
    <div class="px-4 py-6 sm:px-6 lg:px-8 max-w-4xl mx-auto">
      <div class="mb-8">
        <h1 class="text-2xl font-semibold leading-6 text-gray-900 dark:text-white">Create New Invitation</h1>
        <p class="mt-2 text-sm text-gray-700 dark:text-gray-400">Fill in the details below to generate your beautiful, animated wedding invitation.</p>
      </div>

      <form @submit.prevent="createInvite" class="space-y-8 bg-white dark:bg-gray-800 p-6 sm:p-8 rounded-xl shadow-sm border border-gray-100 dark:border-gray-700">
        
        <!-- Template Selector -->
        <div>
          <label class="block text-sm font-medium leading-6 text-gray-900 dark:text-gray-200">Select Invitation Template</label>
          <div class="mt-3 grid grid-cols-1 gap-4 sm:grid-cols-3">
            <!-- Modern Arch -->
            <label class="relative flex cursor-pointer rounded-lg border bg-white dark:bg-gray-700 p-4 shadow-sm focus:outline-none" :class="[selectedTemplate === 'modern' ? 'border-brand-500 ring-2 ring-brand-500' : 'border-gray-300 dark:border-gray-600']">
              <input type="radio" v-model="selectedTemplate" value="modern" class="sr-only" />
              <span class="flex flex-1">
                <span class="flex flex-col">
                  <span class="block text-sm font-medium text-gray-900 dark:text-white">Modern Arch</span>
                  <span class="mt-1 flex items-center text-[10px] text-gray-500 dark:text-gray-400">Sleek navy-blue & gold laser-cut lace template with elegant contemporary typography.</span>
                </span>
              </span>
              <span class="flex h-5 items-center" v-if="selectedTemplate === 'modern'">
                <span class="h-4 w-4 rounded-full bg-brand-500 flex items-center justify-center">
                  <span class="h-2 w-2 rounded-full bg-white"></span>
                </span>
              </span>
            </label>

            <!-- Traditional Sinhala -->
            <label class="relative flex cursor-pointer rounded-lg border bg-white dark:bg-gray-700 p-4 shadow-sm focus:outline-none" :class="[selectedTemplate === 'sinhala' ? 'border-brand-500 ring-2 ring-brand-500' : 'border-gray-300 dark:border-gray-600']">
              <input type="radio" v-model="selectedTemplate" value="sinhala" class="sr-only" />
              <span class="flex flex-1">
                <span class="flex flex-col">
                  <span class="block text-sm font-medium text-gray-900 dark:text-white">Traditional Sinhala</span>
                  <span class="mt-1 flex items-center text-[10px] text-gray-500 dark:text-gray-400">Premium gold-pressed look with Noto Sinhala fonts, custom parents' details, and Kandyan couple illustration.</span>
                </span>
              </span>
              <span class="flex h-5 items-center" v-if="selectedTemplate === 'sinhala'">
                <span class="h-4 w-4 rounded-full bg-brand-500 flex items-center justify-center">
                  <span class="h-2 w-2 rounded-full bg-white"></span>
                </span>
              </span>
            </label>

            <!-- Golden Rich (Rustic Wreath & Hanging Calendar Tag) -->
            <label class="relative flex cursor-pointer rounded-lg border bg-white dark:bg-gray-700 p-4 shadow-sm focus:outline-none" :class="[selectedTemplate === 'golden_rich' ? 'border-brand-500 ring-2 ring-brand-500' : 'border-gray-300 dark:border-gray-600']">
              <input type="radio" v-model="selectedTemplate" value="golden_rich" class="sr-only" />
              <span class="flex flex-1">
                <span class="flex flex-col">
                  <span class="block text-sm font-medium text-gray-900 dark:text-white">Golden Rich (Rustic)</span>
                  <span class="mt-1 flex items-center text-[10px] text-gray-500 dark:text-gray-400">Exquisite rustic wreath design tied with jute twine coir rope and a custom heart-marked calendar tag.</span>
                </span>
              </span>
              <span class="flex h-5 items-center" v-if="selectedTemplate === 'golden_rich'">
                <span class="h-4 w-4 rounded-full bg-brand-500 flex items-center justify-center">
                  <span class="h-2 w-2 rounded-full bg-white"></span>
                </span>
              </span>
            </label>
          </div>
        </div>

        <!-- Traditional Sinhala Fields -->
        <div v-if="selectedTemplate === 'sinhala'" class="space-y-6 border-t border-gray-100 dark:border-gray-700 pt-6">
          <h2 class="text-lg font-medium text-gray-900 dark:text-white">Traditional Sinhala Card Details</h2>
          
          <div>
            <label for="sinhala_title" class="block text-sm font-medium leading-6 text-gray-900 dark:text-gray-200">Greeting Header (ආරාධනා ශීර්ෂය)</label>
            <div class="mt-2">
              <input v-model="sinhalaForm.sub_title" type="text" id="sinhala_title" class="block w-full rounded-md border-0 py-2.5 px-3.5 text-gray-900 dark:text-white shadow-sm ring-1 ring-inset ring-gray-300 dark:ring-gray-600 dark:bg-gray-700 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-brand-500 sm:text-sm sm:leading-6" placeholder="e.g., ශ්‍රී සුභ මංගලම්....!" required />
            </div>
          </div>

          <div class="grid grid-cols-1 gap-6 sm:grid-cols-2">
            <div>
              <label for="bride_parents" class="block text-sm font-medium leading-6 text-gray-900 dark:text-gray-200">Bride's Parents (මනාලියගේ මව්පියන්)</label>
              <div class="mt-2">
                <textarea v-model="sinhalaForm.bride_parents" id="bride_parents" rows="3" class="block w-full rounded-md border-0 py-2.5 px-3.5 text-gray-900 dark:text-white shadow-sm ring-1 ring-inset ring-gray-300 dark:ring-gray-600 dark:bg-gray-700 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-brand-500 sm:text-sm sm:leading-6" placeholder="e.g., ඩී.පී. රත්නපාල මහතාගේ සහ එච්.පී. කරුණාවතී මහත්මියගේ ආදරණීය දියණිය" required></textarea>
              </div>
            </div>

            <div>
              <label for="groom_parents" class="block text-sm font-medium leading-6 text-gray-900 dark:text-gray-200">Groom's Parents (මනාලයාගේ මව්පියන්)</label>
              <div class="mt-2">
                <textarea v-model="sinhalaForm.groom_parents" id="groom_parents" rows="3" class="block w-full rounded-md border-0 py-2.5 px-3.5 text-gray-900 dark:text-white shadow-sm ring-1 ring-inset ring-gray-300 dark:ring-gray-600 dark:bg-gray-700 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-brand-500 sm:text-sm sm:leading-6" placeholder="e.g., හේමන් දසනායක මහතාගේ සහ චිත්‍රා දසනායක මහත්මියගේ ආදරණීය පුතණුවන්" required></textarea>
              </div>
            </div>
          </div>

          <div class="grid grid-cols-1 gap-6 sm:grid-cols-2">
            <div>
              <label for="bride_name" class="block text-sm font-medium leading-6 text-gray-900 dark:text-gray-200">Bride's Name (මනාලියගේ නම)</label>
              <div class="mt-2">
                <input v-model="sinhalaForm.bride_name" type="text" id="bride_name" class="block w-full rounded-md border-0 py-2.5 px-3.5 text-gray-900 dark:text-white shadow-sm ring-1 ring-inset ring-gray-300 dark:ring-gray-600 dark:bg-gray-700 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-brand-500 sm:text-sm sm:leading-6" placeholder="e.g., දිල්හානි" required />
              </div>
            </div>

            <div>
              <label for="groom_name" class="block text-sm font-medium leading-6 text-gray-900 dark:text-gray-200">Groom's Name (මනාලයාගේ නම)</label>
              <div class="mt-2">
                <input v-model="sinhalaForm.groom_name" type="text" id="groom_name" class="block w-full rounded-md border-0 py-2.5 px-3.5 text-gray-900 dark:text-white shadow-sm ring-1 ring-inset ring-gray-300 dark:ring-gray-600 dark:bg-gray-700 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-brand-500 sm:text-sm sm:leading-6" placeholder="e.g., කේස්වන්" required />
              </div>
            </div>
          </div>

          <div class="grid grid-cols-1 gap-6 sm:grid-cols-2">
            <div>
              <label for="poruwa_time" class="block text-sm font-medium leading-6 text-gray-900 dark:text-gray-200">Poruwa Ceremony Time (පෝරුවේ චාරිත්‍ර වේලාව - Optional)</label>
              <div class="mt-2">
                <input v-model="sinhalaForm.poruwa_time" type="text" id="poruwa_time" class="block w-full rounded-md border-0 py-2.5 px-3.5 text-gray-900 dark:text-white shadow-sm ring-1 ring-inset ring-gray-300 dark:ring-gray-600 dark:bg-gray-700 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-brand-500 sm:text-sm sm:leading-6" placeholder="e.g., පෝරුවේ චාරිත්‍ර පෙ.ව. 09.30" />
              </div>
            </div>

            <div>
              <label for="rsvp_contact" class="block text-sm font-medium leading-6 text-gray-900 dark:text-gray-200">RSVP Contact Number (සම්බන්ධතා දුරකථන අංකය)</label>
              <div class="mt-2">
                <input v-model="sinhalaForm.rsvp_contact" type="text" id="rsvp_contact" class="block w-full rounded-md border-0 py-2.5 px-3.5 text-gray-900 dark:text-white shadow-sm ring-1 ring-inset ring-gray-300 dark:ring-gray-600 dark:bg-gray-700 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-brand-500 sm:text-sm sm:leading-6" placeholder="e.g., දිල්හානි : 077-1111059" required />
              </div>
            </div>
          </div>

          <div>
            <label for="invite_note" class="block text-sm font-medium leading-6 text-gray-900 dark:text-gray-200">Custom Invitation Note (ආරාධනා වැකිය)</label>
            <div class="mt-2">
              <input v-model="sinhalaForm.invite_note" type="text" id="invite_note" class="block w-full rounded-md border-0 py-2.5 px-3.5 text-gray-900 dark:text-white shadow-sm ring-1 ring-inset ring-gray-300 dark:ring-gray-600 dark:bg-gray-700 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-brand-500 sm:text-sm sm:leading-6" placeholder="e.g., ඔබට/ඔබ දෙපලට/ඔබ සැමට සෙනෙහසින් ඇරයුම් කරමු." required />
            </div>
          </div>
        </div>

        <!-- Golden Rich Custom Fields -->
        <div v-if="selectedTemplate === 'golden_rich'" class="space-y-6 border-t border-gray-100 dark:border-gray-700 pt-6">
          <h2 class="text-lg font-medium text-gray-900 dark:text-white">Golden Rich (Rustic) Card Details</h2>
          
          <div>
            <label for="rich_names" class="block text-sm font-medium leading-6 text-gray-900 dark:text-gray-200">Couple Names (Calligraphy Wreath)</label>
            <div class="mt-2">
              <input v-model="richForm.couple_names" type="text" id="rich_names" class="block w-full rounded-md border-0 py-2.5 px-3.5 text-gray-900 dark:text-white shadow-sm ring-1 ring-inset ring-gray-300 dark:ring-gray-600 dark:bg-gray-700 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-brand-500 sm:text-sm sm:leading-6" placeholder="e.g., Sakuni & Anuka" required />
            </div>
          </div>

          <div>
            <label for="rich_invite_text" class="block text-sm font-medium leading-6 text-gray-900 dark:text-gray-200">Wedding Invitation Line</label>
            <div class="mt-2">
              <input v-model="richForm.invite_text" type="text" id="rich_invite_text" class="block w-full rounded-md border-0 py-2.5 px-3.5 text-gray-900 dark:text-white shadow-sm ring-1 ring-inset ring-gray-300 dark:ring-gray-600 dark:bg-gray-700 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-brand-500 sm:text-sm sm:leading-6" placeholder="e.g., Together with their families, invite you to celebrate their wedding" required />
            </div>
          </div>

          <div class="grid grid-cols-1 gap-6 sm:grid-cols-2">
            <div>
              <label for="rich_rsvp_by" class="block text-sm font-medium leading-6 text-gray-900 dark:text-gray-200">RSVP Deadline</label>
              <div class="mt-2">
                <input v-model="richForm.rsvp_by" type="text" id="rich_rsvp_by" class="block w-full rounded-md border-0 py-2.5 px-3.5 text-gray-900 dark:text-white shadow-sm ring-1 ring-inset ring-gray-300 dark:ring-gray-600 dark:bg-gray-700 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-brand-500 sm:text-sm sm:leading-6" placeholder="e.g., KINDLY RSVP BY 10TH AUGUST 2026" required />
              </div>
            </div>

            <div>
              <label for="rich_dress_code" class="block text-sm font-medium leading-6 text-gray-900 dark:text-gray-200">Special Note / Dress Code (Optional)</label>
              <div class="mt-2">
                <input v-model="richForm.dress_code" type="text" id="rich_dress_code" class="block w-full rounded-md border-0 py-2.5 px-3.5 text-gray-900 dark:text-white shadow-sm ring-1 ring-inset ring-gray-300 dark:ring-gray-600 dark:bg-gray-700 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-brand-500 sm:text-sm sm:leading-6" placeholder="e.g., Dress Code: Soft Pastels / Smart Casual" />
              </div>
            </div>
          </div>
        </div>

        <!-- Standard Fields (Common) -->
        <div class="space-y-6 border-t border-gray-100 dark:border-gray-700 pt-6">
          <h2 class="text-lg font-medium text-gray-900 dark:text-white">General Event Info</h2>
          
          <!-- Couple Names (Only if modern template) -->
          <div v-if="selectedTemplate === 'modern'">
            <label for="names" class="block text-sm font-medium leading-6 text-gray-900 dark:text-gray-200">Couple Names</label>
            <div class="mt-2">
              <input v-model="form.couple_names" type="text" name="names" id="names" class="block w-full rounded-md border-0 py-2.5 px-3.5 text-gray-900 dark:text-white shadow-sm ring-1 ring-inset ring-gray-300 dark:ring-gray-600 dark:bg-gray-700 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-brand-500 sm:text-sm sm:leading-6" placeholder="e.g., Romeo & Juliet" :required="selectedTemplate === 'modern'" />
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
                <input v-model="form.location" type="text" name="location" id="location" class="block w-full rounded-md border-0 py-2.5 px-3.5 text-gray-900 dark:text-white shadow-sm ring-1 ring-inset ring-gray-300 dark:ring-gray-600 dark:bg-gray-700 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-brand-500 sm:text-sm sm:leading-6" placeholder="e.g., Rajahala Resort, Ratnapura" required />
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

          <!-- Special Comments (Only shown for modern layout) -->
          <div v-if="selectedTemplate === 'modern'">
            <label for="comments" class="block text-sm font-medium leading-6 text-gray-900 dark:text-gray-200">Special Comments (Optional)</label>
            <div class="mt-2">
              <textarea v-model="form.special_comments" id="comments" name="comments" rows="3" class="block w-full rounded-md border-0 py-2.5 px-3.5 text-gray-900 dark:text-white shadow-sm ring-1 ring-inset ring-gray-300 dark:ring-gray-600 dark:bg-gray-700 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-brand-500 sm:text-sm sm:leading-6" placeholder="Dress code, RSVP details, etc."></textarea>
            </div>
          </div>

          <!-- Image Upload (Only shown for modern layout) -->
          <div v-if="selectedTemplate === 'modern'">
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
            <label class="block text-sm font-medium leading-6 text-gray-900 dark:text-gray-200">Theme Color Palette</label>
            <div class="mt-3 flex items-center gap-4">
              <label v-for="theme in themes" :key="theme.id" class="relative cursor-pointer">
                <input type="radio" v-model="form.theme_color" :value="theme.id" class="peer sr-only" name="theme_color" />
                <div :class="[theme.bgClass, 'w-10 h-10 rounded-full border-2 border-transparent peer-checked:ring-2 peer-checked:ring-offset-2 peer-checked:ring-offset-white dark:peer-checked:ring-offset-gray-800 transition-all shadow-sm']" :style="{ '--tw-ring-color': theme.hex }"></div>
                <span class="mt-2 block text-xs text-center font-medium text-gray-900 dark:text-gray-300 peer-checked:text-brand-500">{{ theme.name }}</span>
              </label>
            </div>
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
const selectedTemplate = ref('modern') // 'modern', 'sinhala', 'golden_rich'

const themes = [
  { id: 'rose', name: 'Rose Gold', bgClass: 'bg-[#b76e79]', hex: '#b76e79' },
  { id: 'emerald', name: 'Emerald', bgClass: 'bg-[#50C878]', hex: '#50C878' },
  { id: 'dark', name: 'Midnight', bgClass: 'bg-[#1a202c]', hex: '#1a202c' },
  { id: 'ocean', name: 'Ocean Blue', bgClass: 'bg-[#0077b6]', hex: '#0077b6' },
]

const form = reactive({
  couple_names: '',
  event_date: '',
  location: '',
  map_url: '',
  special_comments: '',
  theme_color: 'rose',
  image_url: ''
})

const sinhalaForm = reactive({
  sub_title: 'ශ්‍රී සුභ මංගලම්....!',
  bride_parents: '',
  bride_name: '',
  groom_parents: '',
  groom_name: '',
  poruwa_time: '',
  invite_note: 'ඔබට/ඔබ දෙපලට/ඔබ සැමට සෙනෙහසින් ඇරයුම් කරමු.',
  rsvp_contact: ''
})

const richForm = reactive({
  couple_names: '',
  invite_text: 'Together with their families, invite you to celebrate their wedding',
  rsvp_by: 'KINDLY RSVP BY 10TH AUGUST',
  dress_code: ''
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
  const { data: { user: currentUser } } = await supabase.auth.getUser()
  if (!currentUser) {
    alert("You must be logged in to create an invitation.")
    return
  }

  loading.value = true
  
  try {
    let coupleNames = form.couple_names
    let comments = form.special_comments
    let themeColor = form.theme_color

    if (selectedTemplate.value === 'sinhala') {
      coupleNames = `${sinhalaForm.bride_name} & ${sinhalaForm.groom_name}`
      themeColor = `${form.theme_color}_sinhala`
      
      const payload = {
        is_sinhala: true,
        sub_title: sinhalaForm.sub_title,
        bride_parents: sinhalaForm.bride_parents,
        bride_name: sinhalaForm.bride_name,
        groom_parents: sinhalaForm.groom_parents,
        groom_name: sinhalaForm.groom_name,
        poruwa_time: sinhalaForm.poruwa_time,
        invite_note: sinhalaForm.invite_note,
        rsvp_contact: sinhalaForm.rsvp_contact
      }
      comments = JSON.stringify(payload)
    } else if (selectedTemplate.value === 'golden_rich') {
      coupleNames = richForm.couple_names
      themeColor = `${form.theme_color}_rich`
      
      const payload = {
        is_golden_rich: true,
        couple_names: richForm.couple_names,
        invite_text: richForm.invite_text,
        rsvp_by: richForm.rsvp_by,
        dress_code: richForm.dress_code
      }
      comments = JSON.stringify(payload)
    }

    const { data, error } = await supabase.from('invitations').insert({
      user_id: currentUser.id,
      couple_names: coupleNames,
      event_date: new Date(form.event_date).toISOString(),
      location: form.location,
      map_url: form.map_url,
      special_comments: comments,
      theme_color: themeColor,
      image_url: form.image_url
    }).select().single()

    if (error) throw error

    router.push('/')
  } catch (error: any) {
    console.error('Error creating invitation', error)
    alert(error.message)
  } finally {
    loading.value = false
  }
}
</script>
