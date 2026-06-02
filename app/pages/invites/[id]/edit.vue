<template>
  <layout-admin-layout>
    <div class="px-4 py-6 sm:px-6 lg:px-8 max-w-4xl mx-auto">
      <div class="mb-8 flex justify-between items-center">
        <div>
          <h1 class="text-2xl font-semibold leading-6 text-gray-900 dark:text-white">Edit Invitation</h1>
          <p class="mt-2 text-sm text-gray-700 dark:text-gray-400">Modify the fields below to update your wedding invitation.</p>
        </div>
        <div v-if="loadingInvite" class="text-gray-500 animate-pulse text-sm">Loading invitation details...</div>
      </div>

      <form @submit.prevent="updateInvite" class="space-y-8 bg-white dark:bg-gray-800 p-6 sm:p-8 rounded-xl shadow-sm border border-gray-100 dark:border-gray-700">
        
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
              <input v-model="sinhalaForm.sub_title" type="text" id="sinhala_title" class="block w-full rounded-md border-0 py-2.5 px-3.5 text-gray-900 dark:text-white shadow-sm ring-1 ring-inset ring-gray-300 dark:ring-gray-600 dark:bg-gray-700 focus:ring-2 focus:ring-inset focus:ring-brand-500 sm:text-sm sm:leading-6" required />
            </div>
          </div>

          <div class="grid grid-cols-1 gap-6 sm:grid-cols-2">
            <div>
              <label for="bride_parents" class="block text-sm font-medium leading-6 text-gray-900 dark:text-gray-200">Bride's Parents (මනාලියගේ මව්පියන්)</label>
              <div class="mt-2">
                <textarea v-model="sinhalaForm.bride_parents" id="bride_parents" rows="3" class="block w-full rounded-md border-0 py-2.5 px-3.5 text-gray-900 dark:text-white shadow-sm ring-1 ring-inset ring-gray-300 dark:ring-gray-600 dark:bg-gray-700 focus:ring-2 focus:ring-inset focus:ring-brand-500 sm:text-sm sm:leading-6" required></textarea>
              </div>
            </div>

            <div>
              <label for="groom_parents" class="block text-sm font-medium leading-6 text-gray-900 dark:text-gray-200">Groom's Parents (මනාලයාගේ මව්පියන්)</label>
              <div class="mt-2">
                <textarea v-model="sinhalaForm.groom_parents" id="groom_parents" rows="3" class="block w-full rounded-md border-0 py-2.5 px-3.5 text-gray-900 dark:text-white shadow-sm ring-1 ring-inset ring-gray-300 dark:ring-gray-600 dark:bg-gray-700 focus:ring-2 focus:ring-inset focus:ring-brand-500 sm:text-sm sm:leading-6" required></textarea>
              </div>
            </div>
          </div>

          <div class="grid grid-cols-1 gap-6 sm:grid-cols-2">
            <div>
              <label for="bride_name" class="block text-sm font-medium leading-6 text-gray-900 dark:text-gray-200">Bride's Name (මනාලියගේ නම)</label>
              <div class="mt-2">
                <input v-model="sinhalaForm.bride_name" type="text" id="bride_name" class="block w-full rounded-md border-0 py-2.5 px-3.5 text-gray-900 dark:text-white shadow-sm ring-1 ring-inset ring-gray-300 dark:ring-gray-600 dark:bg-gray-700 focus:ring-2 focus:ring-inset focus:ring-brand-500 sm:text-sm sm:leading-6" required />
              </div>
            </div>

            <div>
              <label for="groom_name" class="block text-sm font-medium leading-6 text-gray-900 dark:text-gray-200">Groom's Name (මනාලයාගේ නම)</label>
              <div class="mt-2">
                <input v-model="sinhalaForm.groom_name" type="text" id="groom_name" class="block w-full rounded-md border-0 py-2.5 px-3.5 text-gray-900 dark:text-white shadow-sm ring-1 ring-inset ring-gray-300 dark:ring-gray-600 dark:bg-gray-700 focus:ring-2 focus:ring-inset focus:ring-brand-500 sm:text-sm sm:leading-6" required />
              </div>
            </div>
          </div>

          <div class="grid grid-cols-1 gap-6 sm:grid-cols-2">
            <div>
              <label for="poruwa_time" class="block text-sm font-medium leading-6 text-gray-900 dark:text-gray-200">Poruwa Ceremony Time (Optional)</label>
              <div class="mt-2">
                <input v-model="sinhalaForm.poruwa_time" type="text" id="poruwa_time" class="block w-full rounded-md border-0 py-2.5 px-3.5 text-gray-900 dark:text-white shadow-sm ring-1 ring-inset ring-gray-300 dark:ring-gray-600 dark:bg-gray-700 focus:ring-2 focus:ring-inset focus:ring-brand-500 sm:text-sm sm:leading-6" />
              </div>
            </div>

            <div>
              <label for="rsvp_contact" class="block text-sm font-medium leading-6 text-gray-900 dark:text-gray-200">RSVP Contact Number</label>
              <div class="mt-2">
                <input v-model="sinhalaForm.rsvp_contact" type="text" id="rsvp_contact" class="block w-full rounded-md border-0 py-2.5 px-3.5 text-gray-900 dark:text-white shadow-sm ring-1 ring-inset ring-gray-300 dark:ring-gray-600 dark:bg-gray-700 focus:ring-2 focus:ring-inset focus:ring-brand-500 sm:text-sm sm:leading-6" required />
              </div>
            </div>
          </div>

          <div>
            <label for="invite_note" class="block text-sm font-medium leading-6 text-gray-900 dark:text-gray-200">Custom Invitation Note (ආරාධනා වැකිය)</label>
            <div class="mt-2">
              <input v-model="sinhalaForm.invite_note" type="text" id="invite_note" class="block w-full rounded-md border-0 py-2.5 px-3.5 text-gray-900 dark:text-white shadow-sm ring-1 ring-inset ring-gray-300 dark:ring-gray-600 dark:bg-gray-700 focus:ring-2 focus:ring-inset focus:ring-brand-500 sm:text-sm sm:leading-6" required />
            </div>
          </div>
        </div>

        <!-- Golden Rich Custom Fields -->
        <div v-if="selectedTemplate === 'golden_rich'" class="space-y-6 border-t border-gray-100 dark:border-gray-700 pt-6">
          <h2 class="text-lg font-medium text-gray-900 dark:text-white">Golden Rich (Rustic) Card Details</h2>
          
          <div>
            <label for="rich_names" class="block text-sm font-medium leading-6 text-gray-900 dark:text-gray-200">Couple Names (Calligraphy Wreath)</label>
            <div class="mt-2">
              <input v-model="richForm.couple_names" type="text" id="rich_names" class="block w-full rounded-md border-0 py-2.5 px-3.5 text-gray-900 dark:text-white shadow-sm ring-1 ring-inset ring-gray-300 dark:ring-gray-600 dark:bg-gray-700 focus:ring-2 focus:ring-inset focus:ring-brand-500 sm:text-sm sm:leading-6" required />
            </div>
          </div>

          <div>
            <label for="rich_invite_text" class="block text-sm font-medium leading-6 text-gray-900 dark:text-gray-200">Wedding Invitation Line</label>
            <div class="mt-2">
              <input v-model="richForm.invite_text" type="text" id="rich_invite_text" class="block w-full rounded-md border-0 py-2.5 px-3.5 text-gray-900 dark:text-white shadow-sm ring-1 ring-inset ring-gray-300 dark:ring-gray-600 dark:bg-gray-700 focus:ring-2 focus:ring-inset focus:ring-brand-500 sm:text-sm sm:leading-6" required />
            </div>
          </div>

          <div class="grid grid-cols-1 gap-6 sm:grid-cols-2">
            <div>
              <label for="rich_rsvp_by" class="block text-sm font-medium leading-6 text-gray-900 dark:text-gray-200">RSVP Deadline</label>
              <div class="mt-2">
                <input v-model="richForm.rsvp_by" type="text" id="rich_rsvp_by" class="block w-full rounded-md border-0 py-2.5 px-3.5 text-gray-900 dark:text-white shadow-sm ring-1 ring-inset ring-gray-300 dark:ring-gray-600 dark:bg-gray-700 focus:ring-2 focus:ring-inset focus:ring-brand-500 sm:text-sm sm:leading-6" required />
              </div>
            </div>

            <div>
              <label for="rich_dress_code" class="block text-sm font-medium leading-6 text-gray-900 dark:text-gray-200">Special Note / Dress Code (Optional)</label>
              <div class="mt-2">
                <input v-model="richForm.dress_code" type="text" id="rich_dress_code" class="block w-full rounded-md border-0 py-2.5 px-3.5 text-gray-900 dark:text-white shadow-sm ring-1 ring-inset ring-gray-300 dark:ring-gray-600 dark:bg-gray-700 focus:ring-2 focus:ring-inset focus:ring-brand-500 sm:text-sm sm:leading-6" />
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
              <input v-model="form.couple_names" type="text" name="names" id="names" class="block w-full rounded-md border-0 py-2.5 px-3.5 text-gray-900 dark:text-white shadow-sm ring-1 ring-inset ring-gray-300 dark:ring-gray-600 dark:bg-gray-700 focus:ring-2 focus:ring-inset focus:ring-brand-500 sm:text-sm sm:leading-6" :required="selectedTemplate === 'modern'" />
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
                <input v-model="form.location" type="text" name="location" id="location" class="block w-full rounded-md border-0 py-2.5 px-3.5 text-gray-900 dark:text-white shadow-sm ring-1 ring-inset ring-gray-300 dark:ring-gray-600 dark:bg-gray-700 focus:ring-2 focus:ring-inset focus:ring-brand-500 sm:text-sm sm:leading-6" required />
              </div>
            </div>
          </div>

          <!-- Google Maps Link -->
          <div>
            <label for="map_url" class="block text-sm font-medium leading-6 text-gray-900 dark:text-gray-200">Google Maps Link (Optional)</label>
            <div class="mt-2">
              <input v-model="form.map_url" type="url" name="map_url" id="map_url" class="block w-full rounded-md border-0 py-2.5 px-3.5 text-gray-900 dark:text-white shadow-sm ring-1 ring-inset ring-gray-300 dark:ring-gray-600 dark:bg-gray-700 focus:ring-2 focus:ring-inset focus:ring-brand-500 sm:text-sm sm:leading-6" />
            </div>
          </div>

          <!-- Special Comments (Only shown for modern layout) -->
          <div v-if="selectedTemplate === 'modern'">
            <label for="comments" class="block text-sm font-medium leading-6 text-gray-900 dark:text-gray-200">Special Comments (Optional)</label>
            <div class="mt-2">
              <textarea v-model="form.special_comments" id="comments" name="comments" rows="3" class="block w-full rounded-md border-0 py-2.5 px-3.5 text-gray-900 dark:text-white shadow-sm ring-1 ring-inset ring-gray-300 dark:ring-gray-600 dark:bg-gray-700 focus:ring-2 focus:ring-inset focus:ring-brand-500 sm:text-sm sm:leading-6"></textarea>
            </div>
          </div>

          <!-- Image Upload (Only shown for modern layout) -->
          <div v-if="selectedTemplate === 'modern'">
            <label class="block text-sm font-medium leading-6 text-gray-900 dark:text-gray-200">Couple Photo</label>
            <div class="mt-2 flex items-center gap-x-3">
              <input type="file" accept="image/*" @change="handleFileUpload" class="block w-full text-sm text-gray-900 dark:text-gray-300 file:mr-4 file:py-2 file:px-4 file:rounded-md file:border-0 file:text-sm file:font-semibold file:bg-brand-55 file:text-brand-700 hover:file:bg-brand-100 dark:file:bg-gray-700 dark:file:text-white" />
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
          <button type="submit" :disabled="loading || loadingInvite" class="px-6 py-2 text-sm font-medium text-white bg-brand-500 rounded-md shadow-sm hover:bg-brand-600 disabled:opacity-50 disabled:cursor-not-allowed">
            <span v-if="loading">Saving...</span>
            <span v-else>Update Invitation</span>
          </button>
        </div>
      </form>
    </div>
  </layout-admin-layout>
</template>

<script setup lang="ts">
import { ref, reactive, onMounted } from 'vue'

const supabase = useSupabaseClient()
const route = useRoute()
const router = useRouter()

const loading = ref(false)
const loadingInvite = ref(true)
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

const loadInvitation = async () => {
  try {
    loadingInvite.value = true
    const { data: { user: currentUser } } = await supabase.auth.getUser()
    if (!currentUser) return

    const { data, error } = await supabase
      .from('invitations')
      .select('*')
      .eq('id', route.params.id)
      .eq('user_id', currentUser.id)
      .single()

    if (error) throw error

    if (data) {
      // Map general fields
      form.event_date = new Date(data.event_date).toISOString().slice(0, 16)
      form.location = data.location
      form.map_url = data.map_url || ''
      form.image_url = data.image_url || ''
      form.theme_color = data.theme_color.replace('_sinhala', '').replace('_rich', '')

      // Check template type from special_comments
      if (data.special_comments && data.special_comments.startsWith('{') && data.special_comments.endsWith('}')) {
        const payload = JSON.parse(data.special_comments)
        if (payload.is_sinhala) {
          selectedTemplate.value = 'sinhala'
          sinhalaForm.sub_title = payload.sub_title || 'ශ්‍රී සුභ මංගලම්....!'
          sinhalaForm.bride_parents = payload.bride_parents || ''
          sinhalaForm.bride_name = payload.bride_name || ''
          sinhalaForm.groom_parents = payload.groom_parents || ''
          sinhalaForm.groom_name = payload.groom_name || ''
          sinhalaForm.poruwa_time = payload.poruwa_time || ''
          sinhalaForm.invite_note = payload.invite_note || 'ඔබට/ඔබ දෙපලට/ඔබ සැමට සෙනෙහසින් ඇරයුම් කරමු.'
          sinhalaForm.rsvp_contact = payload.rsvp_contact || ''
        } else if (payload.is_golden_rich) {
          selectedTemplate.value = 'golden_rich'
          richForm.couple_names = payload.couple_names || ''
          richForm.invite_text = payload.invite_text || ''
          richForm.rsvp_by = payload.rsvp_by || ''
          richForm.dress_code = payload.dress_code || ''
        }
      } else {
        selectedTemplate.value = 'modern'
        form.couple_names = data.couple_names
        form.special_comments = data.special_comments || ''
      }
    }
  } catch (error: any) {
    console.error('Error loading invitation details:', error)
    alert('Error loading invitation: ' + error.message)
    router.push('/')
  } finally {
    loadingInvite.value = false
  }
}

onMounted(() => {
  loadInvitation()
})

const handleFileUpload = async (event: any) => {
  const file = event.target.files[0]
  if (!file) return

  try {
    uploadingImage.value = true
    const { data: { user: currentUser } } = await supabase.auth.getUser()
    const fileExt = file.name.split('.').pop()
    const fileName = `${Math.random()}.${fileExt}`
    const filePath = `${currentUser?.id}/${fileName}`

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

const updateInvite = async () => {
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

    const { error } = await supabase
      .from('invitations')
      .update({
        couple_names: coupleNames,
        event_date: new Date(form.event_date).toISOString(),
        location: form.location,
        map_url: form.map_url,
        special_comments: comments,
        theme_color: themeColor,
        image_url: selectedTemplate.value === 'modern' ? form.image_url : ''
      })
      .eq('id', route.params.id)

    if (error) throw error

    router.push('/')
  } catch (error: any) {
    console.error('Error updating invitation:', error)
    alert('Error updating invitation: ' + error.message)
  } finally {
    loading.value = false
  }
}
</script>
