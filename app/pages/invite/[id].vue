<template>
  <div v-if="pending" class="h-screen w-screen flex items-center justify-center bg-white">
    <div class="animate-pulse flex flex-col items-center">
      <div class="w-16 h-16 border-4 border-brand-500 border-t-transparent rounded-full animate-spin"></div>
      <p class="mt-4 text-brand-600 font-medium tracking-widest uppercase text-sm">Opening Invitation</p>
    </div>
  </div>
  
  <div v-else-if="!invite" class="h-screen w-screen flex items-center justify-center bg-gray-50">
    <div class="text-center p-8 bg-white rounded-2xl shadow-xl max-w-md w-full mx-4 border border-gray-100">
      <div class="w-20 h-20 mx-auto bg-red-100 text-red-500 rounded-full flex items-center justify-center mb-6">
        <svg class="w-10 h-10" fill="none" viewBox="0 0 24 24" stroke="currentColor">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
        </svg>
      </div>
      <h1 class="text-2xl font-bold text-gray-900 mb-2">Invitation Not Found</h1>
      <p class="text-gray-500">The link you followed might be broken or the invitation has been removed.</p>
    </div>
  </div>

  <!-- Template 1: Traditional Sinhala Invitation -->
  <main v-else-if="isSinhala" class="min-h-screen font-sinhala-sans bg-[#fbf9f4] text-[#3c3220] relative flex items-center justify-center py-10 px-4">
    <!-- Royal Palace Gates (Raja Maligawa Doors) Opening Animation Overlay -->
    <div v-if="!isOpenedFully" class="fixed inset-0 z-50 flex items-center justify-center overflow-hidden bg-black/60 backdrop-blur-md" :class="{'pointer-events-none': opening}">
      <!-- Left Gate -->
      <div 
        class="absolute inset-y-0 left-0 w-1/2 shadow-[10px_0_30px_rgba(0,0,0,0.5)] border-r border-[#c5a85c]/40 flex items-center justify-end transition-all duration-[1600ms] ease-out-cubic origin-left"
        :style="opening ? 'transform: perspective(1600px) rotateY(-110deg) scale(0.98); opacity: 0; filter: brightness(0.3);' : 'transform: perspective(1600px) rotateY(0deg) scale(1); opacity: 1;'"
        style="background: linear-gradient(135deg, #3a220c 0%, #1c0e03 100%);"
      >
        <div class="absolute inset-4 sm:inset-6 border-[3px] border-double border-[#c5a85c]/30 pointer-events-none rounded-sm"></div>
        <div class="absolute top-8 left-8 text-[#c5a85c]/20 w-16 h-16"><svg viewBox="0 0 100 100" class="w-full h-full fill-current"><path d="M 0 0 L 40 0 C 35 15 15 35 0 40 Z" /></svg></div>
        <div class="absolute bottom-8 left-8 text-[#c5a85c]/20 w-16 h-16 transform -rotate-90"><svg viewBox="0 0 100 100" class="w-full h-full fill-current"><path d="M 0 0 L 40 0 C 35 15 15 35 0 40 Z" /></svg></div>
      </div>
      <!-- Right Gate -->
      <div 
        class="absolute inset-y-0 right-0 w-1/2 shadow-[-10px_0_30px_rgba(0,0,0,0.5)] border-l border-[#c5a85c]/40 flex items-center justify-start transition-all duration-[1600ms] ease-out-cubic origin-right"
        :style="opening ? 'transform: perspective(1600px) rotateY(110deg) scale(0.98); opacity: 0; filter: brightness(0.3);' : 'transform: perspective(1600px) rotateY(0deg) scale(1); opacity: 1;'"
        style="background: linear-gradient(135deg, #321c08 0%, #150a01 100%);"
      >
        <div class="absolute inset-4 sm:inset-6 border-[3px] border-double border-[#c5a85c]/30 pointer-events-none rounded-sm"></div>
        <div class="absolute top-8 right-8 text-[#c5a85c]/20 w-16 h-16 transform rotate-90"><svg viewBox="0 0 100 100" class="w-full h-full fill-current"><path d="M 0 0 L 40 0 C 35 15 15 35 0 40 Z" /></svg></div>
        <div class="absolute bottom-8 right-8 text-[#c5a85c]/20 w-16 h-16 transform rotate-180"><svg viewBox="0 0 100 100" class="w-full h-full fill-current"><path d="M 0 0 L 40 0 C 35 15 15 35 0 40 Z" /></svg></div>
      </div>
      <!-- Center Seal -->
      <div @click="openInvitation" class="relative z-10 flex flex-col items-center justify-center cursor-pointer group transition-all duration-700 ease-in-out" :class="opening ? 'opacity-0 scale-150 rotate-12 blur-md' : 'opacity-100 scale-100 rotate-0'">
        <div class="w-28 h-28 sm:w-32 sm:h-32 rounded-full bg-gradient-to-br from-[#e5c57d] via-[#b08b35] to-[#7f601b] text-white flex items-center justify-center shadow-[0_15px_35px_rgba(0,0,0,0.6)] group-hover:scale-110 transition-transform duration-300 border-4 border-[#fff5dd]/80 relative">
          <div class="absolute inset-0.5 rounded-full border-2 border-dashed border-[#ffe099]/40 animate-[spin_20s_linear_infinite]"></div>
          <div class="w-20 h-20 rounded-full border-4 border-[#fff2d1]/30 flex items-center justify-center shadow-[inset_0_4px_10px_rgba(0,0,0,0.3)]">
            <span class="font-yatra text-4xl sm:text-5xl drop-shadow-[0_2px_4px_rgba(0,0,0,0.4)] text-[#fffbf2]">{{ initials }}</span>
          </div>
        </div>
        <div class="mt-8 bg-black/40 px-6 py-2 rounded-full border border-[#c5a85c]/30 backdrop-blur-sm transition-colors group-hover:bg-[#c5a85c]/20">
          <p class="text-[#fefcf9] font-sinhala-serif font-semibold tracking-[0.22em] uppercase text-sm sm:text-base animate-pulse group-hover:animate-none">මංගල සභාවට පිවිසෙන්න</p>
        </div>
      </div>
    </div>

    <!-- Main Card Content -->
    <div class="relative w-full max-w-2xl min-h-screen py-16 px-6 sm:px-12 bg-[#fefcf9] border-[12px] border-double border-[#c5a85c]/40 shadow-2xl overflow-hidden flex flex-col items-center text-center">
      <!-- Ornaments -->
      <div class="absolute top-4 left-4 w-28 h-28 text-[#c5a85c]/40 pointer-events-none"><svg viewBox="0 0 100 100" class="w-full h-full fill-current"><path d="M 0 0 L 40 0 C 35 15 15 35 0 40 Z" /><path d="M 0 0 C 20 5 35 20 40 40 C 30 35 5 25 0 0" /><circle cx="20" cy="20" r="2" /><circle cx="10" cy="30" r="1.5" /><circle cx="30" cy="10" r="1.5" /></svg></div>
      <div class="absolute top-4 right-4 w-28 h-28 text-[#c5a85c]/40 pointer-events-none transform rotate-90"><svg viewBox="0 0 100 100" class="w-full h-full fill-current"><path d="M 0 0 L 40 0 C 35 15 15 35 0 40 Z" /><path d="M 0 0 C 20 5 35 20 40 40 C 30 35 5 25 0 0" /><circle cx="20" cy="20" r="2" /><circle cx="10" cy="30" r="1.5" /><circle cx="30" cy="10" r="1.5" /></svg></div>
      <div class="absolute bottom-4 left-4 w-28 h-28 text-[#c5a85c]/40 pointer-events-none transform -rotate-90"><svg viewBox="0 0 100 100" class="w-full h-full fill-current"><path d="M 0 0 L 40 0 C 35 15 15 35 0 40 Z" /><path d="M 0 0 C 20 5 35 20 40 40 C 30 35 5 25 0 0" /><circle cx="20" cy="20" r="2" /><circle cx="10" cy="30" r="1.5" /><circle cx="30" cy="10" r="1.5" /></svg></div>
      <div class="absolute bottom-4 right-4 w-28 h-28 text-[#c5a85c]/40 pointer-events-none transform rotate-180"><svg viewBox="0 0 100 100" class="w-full h-full fill-current"><path d="M 0 0 L 40 0 C 35 15 15 35 0 40 Z" /><path d="M 0 0 C 20 5 35 20 40 40 C 30 35 5 25 0 0" /><circle cx="20" cy="20" r="2" /><circle cx="10" cy="30" r="1.5" /><circle cx="30" cy="10" r="1.5" /></svg></div>

      <div class="relative z-10 w-full flex flex-col items-center" :class="isOpenedFully ? 'animate-fade-in-up' : 'opacity-0'">
        <h3 class="font-yatra text-4xl sm:text-5xl text-[#c5a85c] drop-shadow-sm mb-8 tracking-wider text-center w-full">{{ sinhalaData.sub_title }}</h3>
        
        <div class="mb-4 max-w-lg">
          <p class="font-sinhala-serif text-base sm:text-lg leading-relaxed text-[#5c4a37]">{{ sinhalaData.bride_parents }}</p>
          <span class="block text-xs font-sinhala-serif text-[#c5a85c] uppercase tracking-widest mt-1">ආදරණීය දියණිය</span>
        </div>

        <h1 class="font-yatra text-4xl sm:text-5xl my-3 text-[#b08b35] drop-shadow-sm border-b-2 border-double border-[#c5a85c]/30 px-6 pb-2">{{ sinhalaData.bride_name }}</h1>
        <p class="font-sinhala-serif text-sm sm:text-base italic my-4 text-[#8a7258]">සමග අතිනත ගැනීමේ ප්‍රීතිය නිමිත්තෙන්</p>

        <div class="mb-4 max-w-lg">
          <p class="font-sinhala-serif text-base sm:text-lg leading-relaxed text-[#5c4a37]">{{ sinhalaData.groom_parents }}</p>
          <span class="block text-xs font-sinhala-serif text-[#c5a85c] uppercase tracking-widest mt-1">ආදරණීය පුතණුවන්</span>
        </div>

        <h1 class="font-yatra text-4xl sm:text-5xl my-3 text-[#b08b35] drop-shadow-sm border-b-2 border-double border-[#c5a85c]/30 px-6 pb-2">{{ sinhalaData.groom_name }}</h1>
        <p class="font-sinhala-serif text-sm sm:text-base text-[#5c4a37] mb-8 font-semibold">සමඟ අතිනත ගැනීමේ ප්‍රීතිය නිමිත්තෙන්</p>

        <!-- Date Box -->
        <div class="w-72 sm:w-80 border-y border-[#c5a85c] py-4 my-6 relative flex flex-col items-center">
          <p class="font-sinhala-serif text-[#b08b35] font-semibold text-lg tracking-widest mb-1">{{ sinhalaMonth }}</p>
          <div class="flex items-center justify-center gap-6 w-full">
            <span class="font-sinhala-serif text-sm sm:text-base text-[#8a7258] border-r border-[#c5a85c]/30 pr-4">{{ sinhalaDayOfWeek }}</span>
            <span class="font-yatra text-5xl sm:text-6xl text-[#b08b35] font-bold drop-shadow-sm px-2">{{ eventDateObj.getDate() }}</span>
            <span class="font-sinhala-serif text-sm sm:text-base text-[#8a7258] border-l border-[#c5a85c]/30 pl-4">{{ eventDateObj.getFullYear() }}</span>
          </div>
        </div>

        <div class="my-6">
          <p class="font-sinhala-serif text-base sm:text-lg text-[#5c4a37] font-semibold leading-relaxed">පෙ.ව. {{ formattedSinhalaTime }} සිට ප.ව. {{ formattedEndTime }} දක්වා</p>
          <p v-if="sinhalaData.poruwa_time" class="font-sinhala-serif text-sm sm:text-base italic text-[#c5a85c] mt-2 font-medium bg-[#c5a85c]/5 px-4 py-1.5 rounded-full border border-[#c5a85c]/20">({{ sinhalaData.poruwa_time }})</p>
        </div>

        <div class="my-8 max-w-lg p-6 bg-[#FAF6EE] border border-[#c5a85c]/30 rounded-xl shadow-sm w-full">
          <h4 class="font-sinhala-serif text-sm text-[#c5a85c] uppercase tracking-widest mb-1 font-semibold">උත්සව ශාලාව</h4>
          <p class="font-sinhala-serif text-lg text-[#5c4a37] font-semibold leading-relaxed">{{ invite.location }}</p>
          <div class="mt-4" v-if="invite.map_url">
            <a :href="invite.map_url" target="_blank" class="inline-flex items-center justify-center px-5 py-2 text-xs font-semibold text-white bg-[#b08b35] hover:bg-[#9a7525] rounded-full shadow transition-colors">සිතියම බලන්න</a>
          </div>
        </div>

        <p class="font-sinhala-serif text-base sm:text-lg italic text-[#8a7258] my-4 font-medium">" {{ sinhalaData.invite_note }} "</p>

        <!-- Illustration -->
        <div class="relative w-full py-8 flex items-center justify-center gap-12 mt-6">
          <div class="w-64 h-36 relative flex items-center justify-center">
            <svg viewBox="0 0 300 160" class="w-full h-full text-[#b08b35]">
              <g transform="translate(10, 10) scale(0.6)">
                <path d="M 50 10 L 80 40 L 20 40 Z" fill="none" stroke="currentColor" stroke-width="3" stroke-linejoin="round"/><circle cx="50" cy="20" r="3" fill="currentColor"/><path d="M 35 40 L 65 40" stroke="currentColor" stroke-width="3"/><circle cx="50" cy="55" r="15" fill="none" stroke="currentColor" stroke-width="3"/><path d="M 50 70 L 50 120" stroke="currentColor" stroke-width="3"/><path d="M 25 75 L 50 70 L 75 75 L 85 105 L 50 120 L 15 105 Z" fill="none" stroke="currentColor" stroke-width="3"/><path d="M 30 120 L 50 120 L 70 120 L 80 150 L 50 160 L 20 150 Z" fill="none" stroke="currentColor" stroke-width="3"/>
              </g>
              <g transform="translate(210, 10) scale(0.6)">
                <path d="M 30 45 C 30 30 70 30 70 45 Z" fill="currentColor"/><circle cx="50" cy="30" r="3" fill="currentColor"/><path d="M 40 33 C 45 38 55 38 60 33" fill="none" stroke="currentColor" stroke-width="2"/><circle cx="50" cy="55" r="15" fill="none" stroke="currentColor" stroke-width="3"/><path d="M 50 70 C 35 75 25 90 25 110 L 75 110 C 75 90 65 75 50 70" fill="none" stroke="currentColor" stroke-width="3"/><path d="M 30 110 L 20 155 L 80 155 L 70 110 Z" fill="none" stroke="currentColor" stroke-width="3"/><path d="M 38 78 C 30 95 30 125 40 155" fill="none" stroke="currentColor" stroke-width="3"/>
              </g>
              <g transform="translate(105, 30)">
                <path d="M 40 40 C 20 15 0 35 40 70 C 80 35 60 15 40 40" fill="none" stroke="currentColor" stroke-width="4" stroke-linecap="round"/><path d="M 70 40 C 50 15 30 35 70 70 C 110 35 90 15 70 40" fill="none" stroke="currentColor" stroke-width="4" stroke-linecap="round"/><text x="32" y="48" font-family="'Yatra One', serif" font-size="16" font-weight="bold" fill="currentColor">{{ initials.charAt(0) }}</text><text x="62" y="48" font-family="'Yatra One', serif" font-size="16" font-weight="bold" fill="currentColor">{{ initials.length > 1 ? initials.charAt(1) : initials.charAt(0) }}</text>
              </g>
            </svg>
          </div>
        </div>

        <!-- RSVP -->
        <div class="w-full mt-10 border-t border-[#c5a85c]/20 pt-10">
          <h2 class="font-yatra text-3xl mb-4 text-[#b08b35]">RSVP (පිළිතුරු එවන්න)</h2>
          <div v-if="rsvpSubmitted" class="p-8 rounded-2xl bg-white border-2 border-double border-[#c5a85c]/30 shadow-md max-w-md mx-auto">
            <h3 class="font-sinhala-serif text-xl text-[#5c4a37] font-semibold mb-2">බොහෝම ස්තූතියි!</h3>
            <p class="font-sinhala-serif text-sm text-[#8a7258]">ඔබගේ ප්‍රතිචාරය සාර්ථකව ලැබුණි.</p>
          </div>
          <form v-else @submit.prevent="submitRsvp" class="max-w-md mx-auto space-y-5 text-left p-6 sm:p-8 bg-white border border-[#c5a85c]/30 rounded-xl shadow-md relative">
            <div v-if="submittingRsvp" class="absolute inset-0 z-10 bg-white/80 rounded-xl flex items-center justify-center"><div class="w-8 h-8 border-4 border-[#b08b35] border-t-transparent rounded-full animate-spin"></div></div>
            <div>
              <label for="name" class="block text-sm font-semibold text-[#5c4a37] font-sinhala-serif">ඔබගේ නම</label>
              <input v-model="rsvpForm.guest_name" type="text" id="name" required class="mt-2 block w-full rounded-md border border-[#c5a85c]/30 py-2.5 px-3.5 bg-white">
            </div>
            <div>
              <label class="block text-sm font-semibold text-[#5c4a37] font-sinhala-serif mb-2">සහභාගී වන්නේද?</label>
              <div class="flex items-center gap-4">
                <label class="flex items-center cursor-pointer p-3 border rounded-lg flex-1 border-gray-300 bg-white" :class="{'ring-2 ring-[#b08b35] border-[#b08b35]': rsvpForm.is_attending === true}"><input type="radio" v-model="rsvpForm.is_attending" :value="true" class="sr-only">සතුටින් පැමිණෙමි</label>
                <label class="flex items-center cursor-pointer p-3 border rounded-lg flex-1 border-gray-300 bg-white" :class="{'ring-2 ring-[#b08b35] border-[#b08b35]': rsvpForm.is_attending === false}"><input type="radio" v-model="rsvpForm.is_attending" :value="false" class="sr-only">පැමිණීමට නොහැක</label>
              </div>
            </div>
            <div v-if="rsvpForm.is_attending">
              <label for="count" class="block text-sm font-semibold text-[#5c4a37] font-sinhala-serif">සහභාගී වන ගණන</label>
              <select v-model="rsvpForm.guest_count" id="count" class="mt-2 block w-full rounded-md border border-[#c5a85c]/30 py-2.5 px-3.5 bg-white">
                <option value="1">මා පමණක් (1)</option><option value="2">දෙදෙනෙක් (2)</option><option value="3">තිදෙනෙක් (3)</option>
              </select>
            </div>
            <button type="submit" class="w-full py-3 px-4 mt-4 rounded-full text-white bg-[#b08b35] hover:bg-[#9a7525] shadow font-semibold font-sinhala-serif text-center">ලියාපදිංචි කරන්න (Send RSVP)</button>
          </form>
          <div class="mt-8 font-sinhala-serif text-[#5c4a37] text-sm sm:text-base font-semibold">විමසීම් : {{ sinhalaData.rsvp_contact }}</div>
        </div>
      </div>
    </div>
  </main>

  <!-- Template 2: Golden Rich Rustic Wreath & Calendar Tag Template -->
  <main v-else-if="isGoldenRich" class="min-h-screen font-sans bg-[#1c140c] relative flex items-center justify-center py-10 px-4 overflow-x-hidden">
    
    <!-- Coir Thread Twine Bow & Hanging Calendar Tag Opening Overlay -->
    <div v-if="!isOpenedFully" class="fixed inset-0 z-50 flex items-center justify-center bg-[#291b0f] shadow-2xl overflow-hidden" :class="{'pointer-events-none': opening}">
      
      <!-- Hard Wood Table Surface Background -->
      <div class="absolute inset-0 bg-[radial-gradient(ellipse_at_center,#462d18_0%,#170c04_100%)] opacity-80"></div>
      
      <!-- The Card Base tied with coir rope -->
      <div 
        class="relative w-full max-w-md bg-[#faf8f2] py-14 px-8 border-[6px] border-[#a48660]/20 shadow-[0_20px_50px_rgba(0,0,0,0.8)] rounded flex flex-col items-center text-center transition-all duration-[1400ms]"
        :style="opening ? 'transform: translateY(60px) scale(0.95); opacity: 0; filter: blur(6px);' : 'transform: translateY(0) scale(1); opacity: 1;'"
      >
        <!-- Gold leafy graphic at top of envelope card -->
        <span class="font-heading italic text-2xl text-[#8d6e43] mb-4">{{ richData.couple_names }}</span>
        <div class="w-24 h-px bg-[#a48660]/30 mb-8"></div>
        
        <!-- Jute Twine Thread Rope SVG tied in Bow across the card -->
        <div class="w-full relative py-6 flex items-center justify-center my-6">
          <!-- Horizontal Coir String -->
          <div class="absolute inset-x-0 h-1 bg-[#866540] shadow-sm rounded"></div>
          
          <!-- Coir Bow Knotted in center -->
          <svg viewBox="0 0 100 60" class="w-24 h-16 absolute z-20 text-[#866540] fill-none stroke-current" :class="{'animate-bounce': !opening}">
            <!-- Bow Left Loop -->
            <path d="M 50 30 C 20 10 10 30 50 30" stroke-width="4" stroke-linecap="round"/>
            <!-- Bow Right Loop -->
            <path d="M 50 30 C 80 10 90 30 50 30" stroke-width="4" stroke-linecap="round"/>
            <!-- Loose End Left -->
            <path d="M 50 30 Q 30 45 35 55" stroke-width="3" stroke-linecap="round"/>
            <!-- Loose End Right -->
            <path d="M 50 30 Q 70 48 60 58" stroke-width="3" stroke-linecap="round"/>
            <!-- Center Knot -->
            <circle cx="50" cy="30" r="5" fill="#674a27"/>
          </svg>
          
          <!-- Hanging Calendar Card Tag (Hangs down from coir bow) -->
          <div 
            class="absolute top-8 left-1/2 -translate-x-12 w-28 bg-white border border-[#866540]/30 shadow-md p-2 rounded-sm rotate-6 z-10 transition-transform hover:rotate-12 duration-300"
            :style="opening ? 'transform: translateY(50px) rotate(45deg); opacity: 0;' : ''"
          >
            <!-- Tiny string link to knot -->
            <div class="absolute -top-3 left-1/2 -translate-x-px w-0.5 h-3 bg-[#866540]"></div>
            <p class="text-[9px] font-bold text-[#866540] uppercase tracking-wider mb-1">{{ monthShortName }} {{ eventDateObj.getFullYear() }}</p>
            
            <!-- Calendar grid preview -->
            <div class="grid grid-cols-7 gap-px text-[7px] text-gray-400 font-sans border-t border-[#866540]/10 pt-1.5">
              <span v-for="d in ['S','M','T','W','T','F','S']" :key="d" class="font-bold text-[6px] text-gray-500">{{ d }}</span>
              <!-- Grid placeholder days -->
              <span v-for="i in calendarOffset" :key="'o'+i"></span>
              <span 
                v-for="dayNum in daysInMonth" 
                :key="dayNum" 
                :class="['flex items-center justify-center h-3 w-3 rounded-full font-medium', dayNum === eventDateObj.getDate() ? 'bg-red-500 text-white font-bold animate-pulse' : 'text-gray-600']"
              >
                {{ dayNum }}
              </span>
            </div>
            <p class="text-[8px] font-bold text-[#8d6e43] mt-2 italic font-script">Save The Date</p>
          </div>
        </div>

        <button 
          @click="openInvitation" 
          class="mt-32 px-6 py-2.5 rounded-full border-2 border-[#866540]/60 text-[#866540] hover:bg-[#866540] hover:text-white transition-all font-semibold uppercase tracking-widest text-xs animate-pulse"
        >
          Untie String to Open
        </button>
      </div>
    </div>

    <!-- Main Golden Rich Card Layout -->
    <div class="relative w-full max-w-xl min-h-screen py-16 px-6 sm:px-12 bg-[#faf7f0] border-[8px] border-[#e2d5c3] shadow-2xl rounded flex flex-col items-center">
      
      <div class="relative z-10 w-full flex flex-col items-center" :class="isOpenedFully ? 'animate-fade-in-up' : 'opacity-0'">
        
        <!-- Elegant Watercolor Wreath (Leafy & Floral Circle Wreath via custom SVG) -->
        <div class="relative w-64 h-64 mb-8 flex items-center justify-center">
          <svg viewBox="0 0 200 200" class="w-full h-full text-[#8d6e43]">
            <!-- Outer delicate leafy wreath circles -->
            <circle cx="100" cy="100" r="76" fill="none" stroke="#d4af37" stroke-width="1.5" stroke-dasharray="2 3"/>
            <circle cx="100" cy="100" r="70" fill="none" stroke="#8d6e43" stroke-width="0.5"/>
            
            <!-- Floral / Leafy branches spiraling around -->
            <g fill="currentColor" opacity="0.8">
              <path d="M 100 24 C 110 24 125 35 130 40 L 126 44 C 122 39 110 30 100 30 Z"/>
              <path d="M 100 24 C 90 24 75 35 70 40 L 74 44 C 78 39 90 30 100 30 Z"/>
              <path d="M 170 100 C 170 110 159 125 154 130 L 150 126 C 155 122 164 110 164 100 Z"/>
              <!-- Pink/gold floral vector designs on wreath -->
              <circle cx="130" cy="40" r="5" fill="#e9a69a"/>
              <circle cx="70" cy="40" r="5" fill="#e9a69a"/>
              <circle cx="154" cy="130" r="6" fill="#e9a69a"/>
              <circle cx="46" cy="130" r="6" fill="#e9a69a"/>
            </g>
          </svg>
          
          <!-- Couple Names in Wreath -->
          <div class="absolute inset-0 flex flex-col items-center justify-center p-8">
            <span class="font-script text-4xl text-[#463013] leading-none mb-1">{{ initialsForWreath[0] }}</span>
            <span class="text-sm font-light text-gray-500 italic my-0.5">and</span>
            <span class="font-script text-4xl text-[#463013] leading-none mt-1">{{ initialsForWreath[1] }}</span>
          </div>
        </div>

        <!-- Typography Details -->
        <p class="text-xs uppercase tracking-[0.25em] text-[#866540] font-semibold mb-6">Wedding Invitation</p>
        <p class="font-sans text-sm font-light text-gray-600 max-w-sm mb-8 leading-relaxed">
          {{ richData.invite_text || 'Together with their families, invite you to celebrate their wedding' }}
        </p>

        <!-- Dynamic Calendar Box with red heart circling the date -->
        <div class="bg-white border border-[#e2d5c3] shadow-md p-6 rounded-lg w-72 mb-10 text-center">
          <h4 class="font-heading text-lg text-[#8d6e43] uppercase tracking-widest font-semibold mb-4 border-b border-[#e2d5c3] pb-2">
            {{ formattedMonthYear }}
          </h4>
          <div class="grid grid-cols-7 gap-y-3 gap-x-2 text-xs font-sans text-gray-400">
            <span v-for="d in ['S','M','T','W','T','F','S']" :key="'w'+d" class="font-bold text-[#8d6e43]">{{ d }}</span>
            <span v-for="i in calendarOffset" :key="'ro'+i"></span>
            <span 
              v-for="dayNum in daysInMonth" 
              :key="'rd'+dayNum" 
              :class="['relative flex items-center justify-center h-6 w-6 mx-auto font-medium transition-all duration-300', dayNum === eventDateObj.getDate() ? 'scale-110 font-bold z-10' : 'text-gray-700']"
            >
              <!-- Heart marker background if today -->
              <span v-if="dayNum === eventDateObj.getDate()" class="absolute inset-0 text-red-500 flex items-center justify-center animate-pulse">
                <svg fill="currentColor" viewBox="0 0 24 24" class="w-full h-full opacity-80"><path d="M12 21.35l-1.45-1.32C5.4 15.36 2 12.28 2 8.5 2 5.42 4.42 3 7.5 3c1.74 0 3.41.81 4.5 2.09C13.09 3.81 14.76 3 16.5 3 19.58 3 22 5.42 22 8.5c0 3.78-3.4 6.86-8.55 11.54L12 21.35z"/></svg>
              </span>
              <span :class="dayNum === eventDateObj.getDate() ? 'text-white drop-shadow-sm font-semibold' : ''">{{ dayNum }}</span>
            </span>
          </div>
          <p class="text-[10px] text-red-500 uppercase tracking-widest font-bold mt-4 font-script">Save The Date</p>
        </div>

        <!-- Venue & Time Details -->
        <div class="space-y-6 text-center max-w-md border-t border-[#e2d5c3] pt-8 w-full font-sans">
          <div class="flex flex-col items-center">
            <h5 class="text-[10px] uppercase tracking-widest text-[#8d6e43] font-bold mb-1">When</h5>
            <p class="text-base text-gray-800 font-semibold">{{ formattedFullDate }}</p>
            <p class="text-sm text-gray-500 mt-0.5">FROM {{ formattedTime }} ONWARDS</p>
          </div>

          <div class="flex flex-col items-center">
            <h5 class="text-[10px] uppercase tracking-widest text-[#8d6e43] font-bold mb-1">Where</h5>
            <p class="text-base text-gray-800 font-semibold leading-snug">{{ invite.location }}</p>
            <a v-if="invite.map_url" :href="invite.map_url" target="_blank" class="text-xs text-[#8d6e43] hover:underline font-semibold mt-1">
              Open in Google Maps
            </a>
          </div>

          <div v-if="richData.dress_code" class="flex flex-col items-center py-2 px-6 bg-white border border-[#e2d5c3] rounded-md inline-block mx-auto max-w-sm">
            <p class="text-xs text-[#8c7457] italic font-medium">{{ richData.dress_code }}</p>
          </div>
        </div>

        <!-- RSVP Form Section -->
        <div class="w-full mt-12 border-t border-[#e2d5c3] pt-12">
          <h2 class="font-heading text-2xl mb-2 text-[#8d6e43] font-bold">RSVP</h2>
          <p class="text-xs text-gray-500 mb-8 uppercase tracking-widest">{{ richData.rsvp_by }}</p>

          <div v-if="rsvpSubmitted" class="p-8 rounded bg-white border border-[#e2d5c3] shadow-md max-w-md mx-auto">
            <h3 class="font-heading text-xl text-gray-800 mb-2 font-medium">Thank You!</h3>
            <p class="text-sm text-gray-500 font-light">Your response has been received. We can't wait to celebrate with you!</p>
          </div>

          <form v-else @submit.prevent="submitRsvp" class="max-w-md mx-auto space-y-5 text-left p-6 sm:p-8 bg-white border border-[#e2d5c3] rounded shadow-md relative">
            <div v-if="submittingRsvp" class="absolute inset-0 z-10 bg-white/80 rounded flex items-center justify-center">
              <div class="w-8 h-8 border-4 border-[#8d6e43] border-t-transparent rounded-full animate-spin"></div>
            </div>
            
            <div>
              <label for="rich_guest_name" class="block text-xs font-bold text-gray-600 uppercase">Your Name</label>
              <input v-model="rsvpForm.guest_name" type="text" id="rich_guest_name" required class="mt-2 block w-full rounded border-[#e2d5c3] py-2.5 px-3 bg-white text-sm focus:ring-1 focus:ring-[#8d6e43] focus:border-[#8d6e43]">
            </div>

            <div>
              <label class="block text-xs font-bold text-gray-600 uppercase mb-2">Will you attend?</label>
              <div class="flex items-center gap-4">
                <label class="flex items-center cursor-pointer p-3 border rounded flex-1 border-gray-300 bg-white text-sm" :class="{'ring-1 ring-[#8d6e43] border-[#8d6e43]': rsvpForm.is_attending === true}">
                  <input type="radio" v-model="rsvpForm.is_attending" :value="true" class="sr-only" required>Joyfully Accept
                </label>
                <label class="flex items-center cursor-pointer p-3 border rounded flex-1 border-gray-300 bg-white text-sm" :class="{'ring-1 ring-[#8d6e43] border-[#8d6e43]': rsvpForm.is_attending === false}">
                  <input type="radio" v-model="rsvpForm.is_attending" :value="false" class="sr-only" required>Regretfully Decline
                </label>
              </div>
            </div>

            <div v-if="rsvpForm.is_attending">
              <label for="rich_guest_count" class="block text-xs font-bold text-gray-600 uppercase">Number of Guests</label>
              <select v-model="rsvpForm.guest_count" id="rich_guest_count" class="mt-2 block w-full rounded border-[#e2d5c3] py-2.5 px-3 bg-white text-sm">
                <option value="1">Just Me (1)</option><option value="2">Two of Us (2)</option><option value="3">Three of Us (3)</option>
              </select>
            </div>

            <button type="submit" class="w-full py-3 px-4 mt-4 rounded text-white bg-[#8d6e43] hover:bg-[#6e5430] shadow transition-colors font-bold uppercase text-xs tracking-widest">
              Submit RSVP
            </button>
          </form>
        </div>

      </div>
    </div>
  </main>

  <!-- Template 3: Default Modern Envelope Layout (English) -->
  <main v-else :class="['min-h-screen font-sans', themeClass, {'overflow-hidden h-screen': !isOpenedFully}]" :style="cssVars">
    
    <!-- Premium Laser-Cut Envelope / Opening Overlay -->
    <div v-if="!isOpenedFully" class="fixed inset-0 z-50 flex items-center justify-center overflow-hidden bg-black/60 backdrop-blur-md" :class="{'pointer-events-none': opening}">
      
      <!-- Left Laser-Cut Gate -->
      <div 
        class="absolute inset-y-0 left-0 w-1/2 flex items-center justify-end transition-all duration-[1600ms] ease-out-cubic origin-left shadow-[5px_0_20px_rgba(0,0,0,0.6)]"
        :style="opening ? 'transform: perspective(1600px) rotateY(-110deg) scale(0.98); opacity: 0; filter: brightness(0.3);' : 'transform: perspective(1600px) rotateY(0deg) scale(1); opacity: 1;'"
        style="background: #0f1c3f;"
      >
        <!-- Left Gold Lace SVG Overlay -->
        <svg class="absolute right-0 inset-y-0 w-44 h-full text-[#d4af37]/80 opacity-90 fill-current pointer-events-none" viewBox="0 0 100 600" preserveAspectRatio="none">
          <path d="M 0 0 Q 30 50 10 100 Q 60 150 20 200 Q 80 250 30 300 Q 80 350 30 400 Q 60 450 20 500 Q 30 550 0 600 Z" />
          <path d="M 0 20 C 50 80 100 40 80 120 C 60 200 100 180 70 260 C 40 340 90 320 70 400 C 50 480 90 460 60 540 C 30 620 0 580 0 600" fill="none" stroke="#d4af37" stroke-width="3"/>
          <circle cx="50" cy="80" r="4" fill="#d4af37"/><circle cx="35" cy="180" r="3" fill="#d4af37"/><circle cx="65" cy="280" r="5" fill="#d4af37"/><circle cx="40" cy="380" r="4" fill="#d4af37"/><circle cx="55" cy="480" r="3" fill="#d4af37"/>
        </svg>
        <div class="absolute inset-4 border border-[#d4af37]/20 pointer-events-none rounded-sm"></div>
      </div>
      
      <!-- Right Laser-Cut Gate -->
      <div 
        class="absolute inset-y-0 right-0 w-1/2 flex items-center justify-start transition-all duration-[1600ms] ease-out-cubic origin-right shadow-[-5px_0_20px_rgba(0,0,0,0.6)]"
        :style="opening ? 'transform: perspective(1600px) rotateY(110deg) scale(0.98); opacity: 0; filter: brightness(0.3);' : 'transform: perspective(1600px) rotateY(0deg) scale(1); opacity: 1;'"
        style="background: #0f1c3f;"
      >
        <!-- Right Gold Lace SVG Overlay -->
        <svg class="absolute left-0 inset-y-0 w-44 h-full text-[#d4af37]/80 opacity-90 fill-current pointer-events-none transform scale-x-[-1]" viewBox="0 0 100 600" preserveAspectRatio="none">
          <path d="M 0 0 Q 30 50 10 100 Q 60 150 20 200 Q 80 250 30 300 Q 80 350 30 400 Q 60 450 20 500 Q 30 550 0 600 Z" />
          <path d="M 0 20 C 50 80 100 40 80 120 C 60 200 100 180 70 260 C 40 340 90 320 70 400 C 50 480 90 460 60 540 C 30 620 0 580 0 600" fill="none" stroke="#d4af37" stroke-width="3"/>
          <circle cx="50" cy="80" r="4" fill="#d4af37"/><circle cx="35" cy="180" r="3" fill="#d4af37"/><circle cx="65" cy="280" r="5" fill="#d4af37"/><circle cx="40" cy="380" r="4" fill="#d4af37"/><circle cx="55" cy="480" r="3" fill="#d4af37"/>
        </svg>
        <div class="absolute inset-4 border border-[#d4af37]/20 pointer-events-none rounded-sm"></div>
      </div>

      <!-- Navy & Gold Belly Band (Ribbon) in the Center -->
      <div 
        @click="openInvitation"
        class="absolute z-10 w-full max-w-lg h-24 sm:h-28 bg-[#0c1630] border-y-4 border-double border-[#d4af37] shadow-[0_10px_35px_rgba(0,0,0,0.6)] px-4 flex flex-col items-center justify-center cursor-pointer group transition-all duration-[1200ms] ease-out-cubic"
        :style="opening ? 'transform: translateY(-80px) scale(0.9); opacity: 0; filter: blur(4px);' : 'transform: translateY(0) scale(1); opacity: 1;'"
      >
        <h2 class="font-heading italic text-xl sm:text-2xl text-[#d4af37] tracking-wider drop-shadow-md text-center">
          {{ invite.couple_names }}
        </h2>
        <div class="w-16 h-px bg-[#d4af37]/40 my-1"></div>
        <p class="text-white/60 tracking-[0.25em] text-[10px] sm:text-xs uppercase font-sans font-medium animate-pulse group-hover:animate-none">
          Click to Open Invitation
        </p>
      </div>
    </div>

    <!-- Hero Section -->
    <section class="relative min-h-[90vh] w-full flex flex-col items-center justify-center pt-20 pb-12 overflow-hidden bg-theme-bg text-theme-text px-6">
      <div class="absolute top-0 left-0 w-64 h-64 bg-theme-accent/5 rounded-full blur-3xl -translate-x-1/2 -translate-y-1/2"></div>
      <div class="absolute bottom-0 right-0 w-80 h-80 bg-theme-accent/5 rounded-full blur-3xl translate-x-1/3 translate-y-1/3"></div>

      <div class="relative z-20 flex flex-col items-center justify-center w-full max-w-lg mx-auto mt-4" :class="isOpenedFully ? 'animate-fade-in-up' : 'opacity-0'">
        
        <div v-if="invite.image_url" class="relative w-64 h-80 sm:w-72 sm:h-96 mb-10 overflow-hidden shadow-2xl ring-4 ring-white/50 dark:ring-gray-800/50" style="border-radius: 10rem 10rem 0 0;">
          <img :src="invite.image_url" alt="Couple" class="w-full h-full object-cover transition-transform duration-1000 hover:scale-105" />
          <div class="absolute inset-0 ring-1 ring-inset ring-theme-accent/20" style="border-radius: 10rem 10rem 0 0;"></div>
        </div>
        
        <div class="text-center">
          <p class="text-xs md:text-sm tracking-[0.4em] uppercase mb-5 text-theme-accent font-medium">We are getting married</p>
          <h1 class="text-5xl md:text-6xl lg:text-7xl mb-6 leading-tight drop-shadow-sm font-script">{{ invite.couple_names }}</h1>
          <div class="w-12 h-px bg-theme-accent mx-auto mb-6"></div>
          <p class="text-lg md:text-xl font-light tracking-widest mb-10 text-theme-text/80 font-heading">{{ formattedDate }}</p>
        </div>
        
        <button @click="scrollToDetails" class="mt-4 p-4 rounded-full border border-theme-accent/30 text-theme-accent hover:bg-theme-accent hover:text-white transition-all duration-300 animate-bounce bg-theme-bg shadow-sm">
          <svg class="w-5 h-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M19 14l-7 7m0 0l-7-7m7 7V3" />
          </svg>
        </button>
      </div>
    </section>

    <!-- Details Section -->
    <section id="details" class="py-24 px-6 bg-white dark:bg-gray-900 text-gray-800 dark:text-gray-100 font-heading">
      <div class="max-w-3xl mx-auto text-center space-y-16">
        
        <div class="reveal">
          <h2 class="text-4xl mb-4 text-theme-accent font-script">The Details</h2>
          <p class="text-gray-500 dark:text-gray-400 font-light max-w-xl mx-auto leading-relaxed">
            We are so excited to share our special day with you. Please join us to celebrate our love and commitment.
          </p>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-2 gap-12 mt-12">
          <!-- When -->
          <div class="reveal p-8 rounded-2xl bg-gray-50 dark:bg-gray-800/50 border border-gray-100 dark:border-gray-800 hover:shadow-lg transition-shadow duration-300 flex flex-col h-full">
            <div class="w-12 h-12 mx-auto bg-theme-accent/10 text-theme-accent rounded-full flex items-center justify-center mb-6">
              <svg class="w-6 h-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z" />
              </svg>
            </div>
            <h3 class="text-xl font-medium mb-3">When</h3>
            <p class="font-light text-gray-600 dark:text-gray-300">{{ formattedFullDate }}</p>
            <p class="font-light text-gray-600 dark:text-gray-300 mb-6">{{ formattedTime }}</p>
            <div class="mt-auto">
              <a :href="calendarUrl" target="_blank" class="inline-flex items-center justify-center px-4 py-2 text-sm font-medium text-theme-accent bg-theme-accent/10 rounded-full hover:bg-theme-accent hover:text-white transition-colors">
                <svg class="w-4 h-4 mr-2" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z" /></svg>
                Add to Calendar
              </a>
            </div>
          </div>

          <!-- Where -->
          <div class="reveal p-8 rounded-2xl bg-gray-50 dark:bg-gray-800/50 border border-gray-100 dark:border-gray-800 hover:shadow-lg transition-shadow duration-300 flex flex-col h-full">
            <div class="w-12 h-12 mx-auto bg-theme-accent/10 text-theme-accent rounded-full flex items-center justify-center mb-6">
              <svg class="w-6 h-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z" />
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z" />
              </svg>
            </div>
            <h3 class="text-xl font-medium mb-3">Where</h3>
            <p class="font-light text-gray-600 dark:text-gray-300 mb-6">{{ invite.location }}</p>
            <div class="mt-auto" v-if="invite.map_url">
              <a :href="invite.map_url" target="_blank" class="inline-flex items-center justify-center px-4 py-2 text-sm font-medium text-theme-accent bg-theme-accent/10 rounded-full hover:bg-theme-accent hover:text-white transition-colors">
                <svg class="w-4 h-4 mr-2" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 20l-5.447-2.724A1 1 0 013 16.382V5.618a1 1 0 011.447-.894L9 7m0 13l6-3m-6 3V7m6 10l4.553 2.276A1 1 0 0021 18.382V7.618a1 1 0 00-.553-.894L15 4m0 13V4m0 0L9 7" /></svg>
                Open in Maps
              </a>
            </div>
          </div>
        </div>

        <div v-if="invite.special_comments" class="reveal mt-16 p-8 bg-theme-accent/5 rounded-2xl border border-theme-accent/20">
          <h3 class="text-lg font-medium text-theme-accent mb-4 uppercase tracking-widest text-sm">A note from the couple</h3>
          <p class="font-light leading-relaxed italic text-gray-700 dark:text-gray-300 font-sans">"{{ invite.special_comments }}"</p>
        </div>

      </div>
    </section>

    <!-- RSVP Section -->
    <section class="py-24 px-6 bg-theme-bg/50 border-t border-theme-accent/10 font-heading">
      <div class="max-w-2xl mx-auto text-center">
        <div class="reveal">
          <h2 class="text-5xl mb-4 text-theme-accent font-script">RSVP</h2>
          <p class="text-theme-text/80 font-light mb-12">Please kindly respond by letting us know if you can make it.</p>
        </div>

        <div v-if="rsvpSubmitted" class="reveal p-8 rounded-2xl bg-white dark:bg-gray-800 shadow-xl border border-green-100 dark:border-green-900">
          <div class="w-16 h-16 mx-auto bg-green-100 text-green-500 rounded-full flex items-center justify-center mb-6">
            <svg class="w-8 h-8" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7" /></svg>
          </div>
          <h3 class="text-2xl font-medium text-gray-900 dark:text-white mb-2">Thank You!</h3>
          <p class="text-gray-500 dark:text-gray-400 font-light">Your response has been received. We can't wait to celebrate with you!</p>
        </div>

        <form v-else @submit.prevent="submitRsvp" class="reveal space-y-6 text-left p-8 rounded-2xl bg-white dark:bg-gray-800 shadow-xl border border-theme-accent/10 relative">
          <div v-if="submittingRsvp" class="absolute inset-0 z-10 bg-white/80 dark:bg-gray-800/80 rounded-2xl flex items-center justify-center backdrop-blur-sm">
            <div class="w-10 h-10 border-4 border-theme-accent border-t-transparent rounded-full animate-spin"></div>
          </div>
          
          <div>
            <label for="name_modern" class="block text-sm font-medium text-gray-700 dark:text-gray-300">Your Full Name</label>
            <input v-model="rsvpForm.guest_name" type="text" id="name_modern" required class="mt-2 block w-full rounded-md border-0 py-3 px-4 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 focus:ring-2 focus:ring-inset focus:ring-theme-accent sm:text-sm sm:leading-6 dark:bg-gray-700 dark:ring-gray-600 dark:text-white" placeholder="John Doe">
          </div>

          <div>
            <label class="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">Will you attend?</label>
            <div class="flex items-center gap-4">
              <label class="flex items-center cursor-pointer p-3 border rounded-lg flex-1 border-gray-300 dark:border-gray-600 hover:border-theme-accent transition-colors" :class="{'ring-2 ring-theme-accent border-theme-accent': rsvpForm.is_attending === true}">
                <input type="radio" v-model="rsvpForm.is_attending" :value="true" class="sr-only" required>
                <div class="w-5 h-5 rounded-full border border-gray-300 flex items-center justify-center mr-3" :class="{'border-theme-accent': rsvpForm.is_attending === true}">
                  <div class="w-3 h-3 rounded-full bg-theme-accent transition-transform scale-0" :class="{'scale-100': rsvpForm.is_attending === true}"></div>
                </div>
                <span class="text-sm font-medium text-gray-900 dark:text-white">Joyfully Accept</span>
              </label>
              
              <label class="flex items-center cursor-pointer p-3 border rounded-lg flex-1 border-gray-300 dark:border-gray-600 hover:border-theme-accent transition-colors" :class="{'ring-2 ring-theme-accent border-theme-accent': rsvpForm.is_attending === false}">
                <input type="radio" v-model="rsvpForm.is_attending" :value="false" class="sr-only" required>
                <div class="w-5 h-5 rounded-full border border-gray-300 flex items-center justify-center mr-3" :class="{'border-theme-accent': rsvpForm.is_attending === false}">
                  <div class="w-3 h-3 rounded-full bg-theme-accent transition-transform scale-0" :class="{'scale-100': rsvpForm.is_attending === false}"></div>
                </div>
                <span class="text-sm font-medium text-gray-900 dark:text-white">Regretfully Decline</span>
              </label>
            </div>
          </div>

          <div v-if="rsvpForm.is_attending">
            <label for="count_modern" class="block text-sm font-medium text-gray-700 dark:text-gray-300">Number of Guests</label>
            <select v-model="rsvpForm.guest_count" id="count_modern" class="mt-2 block w-full rounded-md border-0 py-3 px-4 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 focus:ring-2 focus:ring-inset focus:ring-theme-accent sm:text-sm sm:leading-6 dark:bg-gray-700 dark:ring-gray-600 dark:text-white">
              <option value="1">Just Me (1)</option><option value="2">Two of Us (2)</option><option value="3">Three of Us (3)</option>
            </select>
          </div>

          <button type="submit" class="w-full py-3 px-4 mt-4 rounded-full text-white bg-theme-accent hover:bg-theme-accent/90 shadow-lg hover:shadow-xl transition-all duration-300 font-medium">
            Send RSVP
          </button>
        </form>
      </div>
    </section>
  </main>
</template>

<script setup lang="ts">
import { ref, computed, onMounted, nextTick } from 'vue'

definePageMeta({
  layout: false
})

const route = useRoute()
const supabase = useSupabaseClient()

// Animation State
const opening = ref(false)
const isOpenedFully = ref(false)

const openInvitation = () => {
  opening.value = true
  setTimeout(() => {
    isOpenedFully.value = true
    nextTick(() => {
      initScrollAnimations()
    })
  }, 1600)
}

// Fetch Invitation Data
const invite = ref<any>(null)
const pending = ref(true)
const isSinhala = ref(false)
const isGoldenRich = ref(false)
const sinhalaData = ref<any>({})
const richData = ref<any>({})

const fetchInvite = async () => {
  pending.value = true
  const { data, error } = await supabase
    .from('invitations')
    .select('*')
    .eq('id', route.params.id)
    .single()
  
  if (error) {
    console.error('Error fetching invitation:', error)
  } else {
    invite.value = data
    if (data.special_comments && data.special_comments.startsWith('{') && data.special_comments.endsWith('}')) {
      try {
        const parsed = JSON.parse(data.special_comments)
        if (parsed.is_sinhala) {
          isSinhala.value = true
          sinhalaData.value = parsed
        } else if (parsed.is_golden_rich) {
          isGoldenRich.value = true
          richData.value = parsed
        }
      } catch (e) {
        console.error('Error parsing JSON payload:', e)
      }
    }
  }
  pending.value = false
}

onMounted(() => {
  fetchInvite()
})

// Dates
const eventDateObj = computed(() => invite.value ? new Date(invite.value.event_date) : new Date())
const formattedDate = computed(() => eventDateObj.value.toLocaleDateString('en-US', { month: 'long', day: 'numeric', year: 'numeric' }))
const formattedFullDate = computed(() => eventDateObj.value.toLocaleDateString('en-US', { weekday: 'long', month: 'long', day: 'numeric', year: 'numeric' }))
const formattedTime = computed(() => eventDateObj.value.toLocaleTimeString('en-US', { hour: 'numeric', minute: '2-digit' }))

// Sinhala Date formats
const sinhalaMonths = ['ජනවාරි', 'පෙබරවාරි', 'මාර්තු', 'අප්‍රේල්', 'මැයි', 'ජූනි', 'ජූලි', 'අගෝස්තු', 'සැප්තැම්බර්', 'ඔක්තෝබර්', 'නොවැම්බර්', 'දෙසැම්බර්']
const sinhalaDays = ['ඉරිදා', 'සඳුදා', 'අඟහරුවාදා', 'බදාදා', 'බ්‍රහස්පතින්දා', 'සිකුරාදා', 'සෙනසුරාදා']

const sinhalaMonth = computed(() => sinhalaMonths[eventDateObj.value.getMonth()])
const sinhalaDayOfWeek = computed(() => sinhalaDays[eventDateObj.value.getDay()])

const formattedSinhalaTime = computed(() => {
  let hours = eventDateObj.value.getHours()
  let minutes = eventDateObj.value.getMinutes()
  hours = hours % 12
  hours = hours ? hours : 12
  const minStr = minutes < 10 ? '0' + minutes : minutes
  return `${hours}.${minStr}`
})

const formattedEndTime = computed(() => {
  const end = new Date(eventDateObj.value.getTime() + 6.5 * 60 * 60 * 1000)
  let hours = end.getHours()
  let minutes = end.getMinutes()
  hours = hours % 12
  hours = hours ? hours : 12
  const minStr = minutes < 10 ? '0' + minutes : minutes
  return `${hours}.${minStr}`
})

// Golden Rich Date helpers
const monthShortNames = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
const monthShortName = computed(() => monthShortNames[eventDateObj.value.getMonth()])
const formattedMonthYear = computed(() => eventDateObj.value.toLocaleDateString('en-US', { month: 'long', year: 'numeric' }).toUpperCase())

// Generate calendar numbers
const daysInMonth = computed(() => new Date(eventDateObj.value.getFullYear(), eventDateObj.value.getMonth() + 1, 0).getDate())
const calendarOffset = computed(() => new Date(eventDateObj.value.getFullYear(), eventDateObj.value.getMonth(), 1).getDay())

const initialsForWreath = computed(() => {
  if (!richData.value.couple_names) return ['W','E']
  const parts = richData.value.couple_names.split('&').map((s:string) => s.trim())
  if (parts.length >= 2) {
    return [parts[0], parts[1]]
  }
  return [richData.value.couple_names, '']
})

// Themes
const themes = {
  rose: { bg: '#fff0f5', text: '#4a3b3c', accent: '#b76e79' },
  emerald: { bg: '#f0fff4', text: '#274e37', accent: '#50C878' },
  dark: { bg: '#1a202c', text: '#f7fafc', accent: '#e2e8f0' },
  ocean: { bg: '#f0f8ff', text: '#1b3b5c', accent: '#0077b6' },
}

const themeClass = computed(() => {
  if (!invite.value) return 'theme-rose'
  const baseTheme = invite.value.theme_color.replace('_sinhala', '').replace('_rich', '')
  return `theme-${baseTheme}`
})

const initials = computed(() => {
  if (isSinhala.value && sinhalaData.value.bride_name) {
    const b = sinhalaData.value.bride_name.trim().charAt(0)
    const g = sinhalaData.value.groom_name.trim().charAt(0)
    return `${b}${g}`
  }
  if (isGoldenRich.value && richData.value.couple_names) {
    const parts = richData.value.couple_names.split('&').map((s:string) => s.trim())
    if (parts.length >= 2) {
      return `${parts[0].charAt(0)}${parts[1].charAt(0)}`
    }
  }
  if (!invite.value || !invite.value.couple_names) return 'W'
  const names = invite.value.couple_names.split('&').map((n: string) => n.trim())
  if (names.length >= 2) {
    return `${names[0].charAt(0)}${names[1].charAt(0)}`
  }
  return invite.value.couple_names.charAt(0)
})

const cssVars = computed(() => {
  if (!invite.value) return {}
  const baseTheme = invite.value.theme_color.replace('_sinhala', '').replace('_rich', '')
  const theme = themes[baseTheme as keyof typeof themes] || themes.rose
  return {
    '--theme-bg': theme.bg,
    '--theme-text': theme.text,
    '--theme-accent': theme.accent,
  }
})

const scrollToDetails = () => {
  document.getElementById('details')?.scrollIntoView({ behavior: 'smooth' })
}

const initScrollAnimations = () => {
  const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        entry.target.classList.add('animate-reveal')
      }
    })
  }, { threshold: 0.1 })
  document.querySelectorAll('.reveal').forEach((el) => observer.observe(el))
}

const rsvpForm = ref({
  guest_name: '',
  is_attending: null as boolean | null,
  guest_count: '1'
})
const submittingRsvp = ref(false)
const rsvpSubmitted = ref(false)

const submitRsvp = async () => {
  if (!rsvpForm.value.guest_name || rsvpForm.value.is_attending === null) return
  submittingRsvp.value = true
  const { error } = await supabase.from('rsvps').insert({
    invitation_id: route.params.id,
    guest_name: rsvpForm.value.guest_name,
    is_attending: rsvpForm.value.is_attending,
    guest_count: rsvpForm.value.is_attending ? parseInt(rsvpForm.value.guest_count) : 0
  })
  submittingRsvp.value = false
  if (error) {
    console.error('Error submitting RSVP', error)
    alert('Sorry, there was an error submitting your RSVP.')
  } else {
    rsvpSubmitted.value = true
  }
}

const calendarUrl = computed(() => {
  if (!invite.value) return '#'
  const title = encodeURIComponent(`Wedding: ${invite.value.couple_names}`)
  const dates = eventDateObj.value.toISOString().replace(/-|:|\.\d\d\d/g, '') + '/' + eventDateObj.value.toISOString().replace(/-|:|\.\d\d\d/g, '')
  const details = encodeURIComponent('Join us for our special day!')
  const location = encodeURIComponent(invite.value.location)
  return `https://calendar.google.com/calendar/render?action=TEMPLATE&text=${title}&dates=${dates}&details=${details}&location=${location}`
})
</script>

<style>
@import url('https://fonts.googleapis.com/css2?family=Great+Vibes&family=Playfair+Display:ital,wght@0,400;0,500;1,400&family=Inter:wght@300;400;500&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Noto+Serif+Sinhala:wght@300;400;600;700&family=Noto+Sans+Sinhala:wght@300;400;600&family=Yatra+One&display=swap');

.font-script { font-family: 'Great Vibes', cursive; }
.font-heading { font-family: 'Playfair Display', serif; }
.font-sans { font-family: 'Inter', sans-serif; }

.font-yatra { font-family: 'Yatra One', cursive, serif; }
.font-sinhala-serif { font-family: 'Noto Serif Sinhala', serif; }
.font-sinhala-sans { font-family: 'Noto Sans Sinhala', sans-serif; }

:root {
  --theme-bg: #fff0f5;
  --theme-text: #4a3b3c;
  --theme-accent: #b76e79;
}

.bg-theme-bg { background-color: var(--theme-bg); }
.text-theme-text { color: var(--theme-text); }
.text-theme-accent { color: var(--theme-accent); }
.bg-theme-accent { background-color: var(--theme-accent); }

.ease-out-cubic {
  transition-timing-function: cubic-bezier(0.33, 1, 0.68, 1);
}

@keyframes fadeInUp {
  from { opacity: 0; transform: translateY(20px); }
  to { opacity: 1; transform: translateY(0); }
}

.animate-fade-in-up {
  animation: fadeInUp 1s ease-out forwards;
}

.reveal {
  opacity: 0;
  transform: translateY(30px);
  transition: all 0.8s cubic-bezier(0.5, 0, 0, 1);
}

.animate-reveal {
  opacity: 1;
  transform: translateY(0);
}
</style>
