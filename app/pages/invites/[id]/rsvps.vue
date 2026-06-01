<template>
  <layout-admin-layout>
    <div class="px-4 py-6 sm:px-6 lg:px-8 max-w-5xl mx-auto">
      <div class="sm:flex sm:items-center mb-8">
        <div class="sm:flex-auto">
          <router-link to="/" class="text-sm font-semibold text-brand-500 hover:text-brand-600 mb-2 inline-block">&larr; Back to Dashboard</router-link>
          <h1 class="text-2xl font-semibold leading-6 text-gray-900 dark:text-white">RSVPs for {{ invite?.couple_names }}</h1>
          <p class="mt-2 text-sm text-gray-700 dark:text-gray-400">Manage and view attendance confirmations for your wedding.</p>
        </div>
        <div class="mt-4 sm:ml-16 sm:mt-0 flex flex-col items-end">
          <div class="text-3xl font-bold text-gray-900 dark:text-white">{{ totalAttending }}</div>
          <div class="text-sm text-gray-500 dark:text-gray-400 uppercase tracking-wide font-medium">Total Guests Attending</div>
        </div>
      </div>
      
      <!-- List of RSVPs -->
      <div class="flow-root">
        <div v-if="pending" class="text-center py-10 text-gray-500">Loading RSVPs...</div>
        <div v-else-if="rsvps && rsvps.length > 0" class="-mx-4 -my-2 overflow-x-auto sm:-mx-6 lg:-mx-8">
          <div class="inline-block min-w-full py-2 align-middle sm:px-6 lg:px-8">
            <div class="overflow-hidden shadow ring-1 ring-black ring-opacity-5 sm:rounded-lg">
              <table class="min-w-full divide-y divide-gray-300 dark:divide-gray-700">
                <thead class="bg-gray-50 dark:bg-gray-800">
                  <tr>
                    <th scope="col" class="py-3.5 pl-4 pr-3 text-left text-sm font-semibold text-gray-900 dark:text-white sm:pl-6">Guest Name</th>
                    <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-gray-900 dark:text-white">Status</th>
                    <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-gray-900 dark:text-white">Guest Count</th>
                    <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-gray-900 dark:text-white">Responded On</th>
                  </tr>
                </thead>
                <tbody class="divide-y divide-gray-200 dark:divide-gray-700 bg-white dark:bg-gray-900">
                  <tr v-for="rsvp in rsvps" :key="rsvp.id">
                    <td class="whitespace-nowrap py-4 pl-4 pr-3 text-sm font-medium text-gray-900 dark:text-white sm:pl-6">{{ rsvp.guest_name }}</td>
                    <td class="whitespace-nowrap px-3 py-4 text-sm">
                      <span v-if="rsvp.is_attending" class="inline-flex items-center rounded-md bg-green-50 px-2 py-1 text-xs font-medium text-green-700 ring-1 ring-inset ring-green-600/20">Attending</span>
                      <span v-else class="inline-flex items-center rounded-md bg-red-50 px-2 py-1 text-xs font-medium text-red-700 ring-1 ring-inset ring-red-600/10">Not Attending</span>
                    </td>
                    <td class="whitespace-nowrap px-3 py-4 text-sm text-gray-500 dark:text-gray-400">{{ rsvp.is_attending ? rsvp.guest_count : '-' }}</td>
                    <td class="whitespace-nowrap px-3 py-4 text-sm text-gray-500 dark:text-gray-400">{{ new Date(rsvp.created_at).toLocaleDateString() }}</td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>
        <div v-else class="text-center py-20 bg-white dark:bg-gray-800 rounded-lg border border-gray-200 dark:border-gray-700 mt-6">
          <svg class="mx-auto h-12 w-12 text-gray-400" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M12 4.354a4 4 0 110 5.292M15 21H3v-1a6 6 0 0112 0v1zm0 0h6v-1a6 6 0 00-9-5.197M13 7a4 4 0 11-8 0 4 4 0 018 0z" />
          </svg>
          <h3 class="mt-2 text-sm font-semibold text-gray-900 dark:text-white">No RSVPs yet</h3>
          <p class="mt-1 text-sm text-gray-500 dark:text-gray-400">Guests haven't started confirming their attendance.</p>
        </div>
      </div>
    </div>
  </layout-admin-layout>
</template>

<script setup lang="ts">
import { computed } from 'vue'

definePageMeta({
  title: 'RSVPs'
})

const route = useRoute()
const supabase = useSupabaseClient()
const inviteId = route.params.id

// Fetch Invitation info
const { data: invite } = useAsyncData(`invite-${inviteId}`, async () => {
  const { data } = await supabase
    .from('invitations')
    .select('couple_names')
    .eq('id', inviteId)
    .single()
  return data
})

// Fetch RSVPs
const { data: rsvps, pending } = useAsyncData(`rsvps-${inviteId}`, async () => {
  const { data, error } = await supabase
    .from('rsvps')
    .select('*')
    .eq('invitation_id', inviteId)
    .order('created_at', { ascending: false })
  
  if (error) {
    console.error('Error fetching RSVPs', error)
    return []
  }
  return data
})

const totalAttending = computed(() => {
  if (!rsvps.value) return 0
  return rsvps.value.reduce((total: number, rsvp: any) => {
    return total + (rsvp.is_attending ? (rsvp.guest_count || 1) : 0)
  }, 0)
})
</script>
