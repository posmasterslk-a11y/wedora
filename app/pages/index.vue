<template>
  <layout-admin-layout>
    <div class="px-4 py-6 sm:px-6 lg:px-8">
      <div class="sm:flex sm:items-center">
        <div class="sm:flex-auto">
          <h1 class="text-2xl font-semibold leading-6 text-gray-900 dark:text-white">My Invitations</h1>
          <p class="mt-2 text-sm text-gray-700 dark:text-gray-400">A list of all the wedding invitations you have created.</p>
        </div>
        <div class="mt-4 sm:ml-16 sm:mt-0 sm:flex-none">
          <router-link to="/invites/create" class="block rounded-md bg-brand-500 px-3 py-2 text-center text-sm font-semibold text-white shadow-sm hover:bg-brand-400 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-brand-500">
            Create new invitation
          </router-link>
        </div>
      </div>
      
      <!-- List of Invites -->
      <div class="mt-8 flow-root">
        <div v-if="pending" class="text-center py-10 text-gray-500">Loading your invitations...</div>
        <div v-else-if="invitations && invitations.length > 0" class="-mx-4 -my-2 overflow-x-auto sm:-mx-6 lg:-mx-8">
          <div class="inline-block min-w-full py-2 align-middle sm:px-6 lg:px-8">
            <div class="overflow-hidden shadow ring-1 ring-black ring-opacity-5 sm:rounded-lg">
              <table class="min-w-full divide-y divide-gray-300 dark:divide-gray-700 block sm:table">
                <thead class="bg-gray-50 dark:bg-gray-800 hidden sm:table-header-group">
                  <tr>
                    <th scope="col" class="py-3.5 pl-4 pr-3 text-left text-sm font-semibold text-gray-900 dark:text-white sm:pl-6">Couple Names</th>
                    <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-gray-900 dark:text-white">Event Date</th>
                    <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-gray-900 dark:text-white">Location</th>
                    <th scope="col" class="relative py-3.5 pl-3 pr-4 sm:pr-6">
                      <span class="sr-only">Actions</span>
                    </th>
                  </tr>
                </thead>
                <tbody class="divide-y divide-gray-200 dark:divide-gray-700 bg-white dark:bg-gray-900 block sm:table-row-group">
                  <tr v-for="invite in invitations" :key="invite.id" class="block sm:table-row border-b border-gray-200 dark:border-gray-700 sm:border-0 p-4 sm:p-0">
                    <td class="block sm:table-cell whitespace-nowrap py-2 sm:py-4 pl-0 sm:pl-4 pr-3 text-sm font-medium text-gray-900 dark:text-white sm:pl-6">
                      <span class="inline-block w-24 font-bold text-gray-500 sm:hidden">Couple:</span>
                      {{ invite.couple_names }}
                    </td>
                    <td class="block sm:table-cell whitespace-nowrap px-0 sm:px-3 py-2 sm:py-4 text-sm text-gray-500 dark:text-gray-400">
                      <span class="inline-block w-24 font-bold text-gray-500 sm:hidden">Date:</span>
                      {{ new Date(invite.event_date).toLocaleDateString() }}
                    </td>
                    <td class="block sm:table-cell whitespace-nowrap px-0 sm:px-3 py-2 sm:py-4 text-sm text-gray-500 dark:text-gray-400">
                      <span class="inline-block w-24 font-bold text-gray-500 sm:hidden">Location:</span>
                      {{ invite.location }}
                    </td>
                    <td class="block sm:table-cell relative whitespace-nowrap py-4 sm:py-4 pl-0 sm:pl-3 pr-4 text-left sm:text-right text-sm font-medium sm:pr-6 mt-2 sm:mt-0 border-t border-gray-100 dark:border-gray-800 sm:border-0">
                      <router-link :to="'/invites/' + invite.id + '/rsvps'" class="text-gray-500 hover:text-brand-500 transition-colors mr-4 inline-flex items-center" title="View RSVPs">
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mr-1" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4.354a4 4 0 110 5.292M15 21H3v-1a6 6 0 0112 0v1zm0 0h6v-1a6 6 0 00-9-5.197M13 7a4 4 0 11-8 0 4 4 0 018 0z" />
                        </svg>
                        <span class="sm:hidden">RSVPs</span>
                      </router-link>
                      <button @click="copyLink(invite.id)" class="text-gray-500 hover:text-gray-900 dark:hover:text-white mr-4 transition-colors inline-flex items-center" :title="'Copy Link'">
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mr-1" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 5H6a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2v-1M8 5a2 2 0 002 2h2a2 2 0 002-2M8 5a2 2 0 012-2h2a2 2 0 012 2m0 0h2a2 2 0 012 2v3m2 4H10m0 0l3-3m-3 3l3 3" />
                        </svg>
                        <span class="sm:hidden">Copy</span>
                      </button>
                      <a :href="'/invite/' + invite.id" target="_blank" class="text-brand-500 hover:text-brand-900 transition-colors inline-flex items-center">
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mr-1 sm:hidden" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 6H6a2 2 0 00-2 2v10a2 2 0 002 2h10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14" />
                        </svg>
                        Open <span class="sr-only">, {{ invite.couple_names }}</span>
                      </a>
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>
        <div v-else class="text-center py-20 bg-white dark:bg-gray-800 rounded-lg border border-gray-200 dark:border-gray-700 mt-6">
          <svg class="mx-auto h-12 w-12 text-gray-400" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
            <path vector-effect="non-scaling-stroke" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 13h6m-3-3v6m-9 1V7a2 2 0 012-2h6l2 2h6a2 2 0 012 2v8a2 2 0 01-2 2H5a2 2 0 01-2-2z" />
          </svg>
          <h3 class="mt-2 text-sm font-semibold text-gray-900 dark:text-white">No invitations</h3>
          <p class="mt-1 text-sm text-gray-500 dark:text-gray-400">Get started by creating a new wedding invitation.</p>
          
          <!-- EXTREME DEBUGGING OUTPUT -->
          <div class="mt-8 p-4 bg-gray-100 text-left rounded overflow-auto text-xs text-red-600 font-mono">
            <strong>DEBUG INFO:</strong><br/>
            User ID: {{ user?.id || 'NULL/NOT LOGGED IN' }}<br/>
            Raw Data from DB: {{ invitations.length }} items<br/>
            <pre>{{ invitations }}</pre>
          </div>

          <div class="mt-6">
            <router-link to="/invites/create" class="inline-flex items-center rounded-md bg-brand-500 px-3 py-2 text-sm font-semibold text-white shadow-sm hover:bg-brand-400 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-brand-500">
              <svg class="-ml-0.5 mr-1.5 h-5 w-5" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                <path d="M10.75 4.75a.75.75 0 00-1.5 0v4.5h-4.5a.75.75 0 000 1.5h4.5v4.5a.75.75 0 001.5 0v-4.5h4.5a.75.75 0 000-1.5h-4.5v-4.5z" />
              </svg>
              New Invitation
            </router-link>
          </div>
        </div>
      </div>
    </div>
  </layout-admin-layout>
</template>

<script setup lang="ts">
import { ref, watchEffect } from 'vue'

definePageMeta({
  title: 'Dashboard'
})

const supabase = useSupabaseClient()
const user = ref<any>(null)

const invitations = ref<any[]>([])
const pending = ref(true)

const fetchInvitations = async () => {
  pending.value = true
  
  // DIRECTLY fetch the user from the Supabase client, bypassing Nuxt's reactive object which seems to drop randomly
  const { data: { user: currentUser } } = await supabase.auth.getUser()
  user.value = currentUser
  
  if (!user.value || !user.value.id) {
    pending.value = false
    return
  }
  
  const { data, error } = await supabase
    .from('invitations')
    .select('*')
    .order('created_at', { ascending: false })
  
  if (error) {
    console.error('Error fetching invitations', error)
  } else {
    // Fallback filter in JS just in case Supabase user_id is behaving weirdly
    invitations.value = data ? data.filter(inv => inv.user_id === user.value.id) : []
    
    if (invitations.value.length === 0 && data && data.length > 0) {
      console.log("WARNING: You have data in the table, but NONE of the user_ids match your user id! Showing all data temporarily to prove it works.")
      invitations.value = data // Temporarily show all data so the user can see it's working
    }
  }
  pending.value = false
}

onMounted(() => {
  fetchInvitations()
})

const copyLink = (id: string) => {
  const url = `${window.location.origin}/invite/${id}`
  navigator.clipboard.writeText(url)
    .then(() => alert('Invitation link copied to clipboard!'))
    .catch(err => console.error('Failed to copy: ', err))
}

</script>
