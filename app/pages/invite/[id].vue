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

  <!-- Traditional Sinhala Invitation Template -->
  <main v-else-if="isSinhala" class="min-h-screen font-sinhala-sans bg-[#fbf9f4] text-[#3c3220] relative flex items-center justify-center py-10 px-4">
    
    <!-- Royal Palace Gates (Raja Maligawa Doors) Opening Animation Overlay -->
    <div v-if="!isOpenedFully" class="fixed inset-0 z-50 flex items-center justify-center overflow-hidden bg-black/60 backdrop-blur-md" :class="{'pointer-events-none': opening}">
      
      <!-- Left Gate (Royal Carved Teak Wood & Gold border) -->
      <div 
        class="absolute inset-y-0 left-0 w-1/2 shadow-[10px_0_30px_rgba(0,0,0,0.5)] border-r border-[#c5a85c]/40 flex items-center justify-end transition-all duration-[1600ms] ease-out-cubic origin-left"
        :style="opening ? 'transform: perspective(1600px) rotateY(-110deg) scale(0.98); opacity: 0; filter: brightness(0.3);' : 'transform: perspective(1600px) rotateY(0deg) scale(1); opacity: 1;'"
        style="background: linear-gradient(135deg, #3a220c 0%, #1c0e03 100%);"
      >
        <!-- Gold Frame Border on Left Door -->
        <div class="absolute inset-4 sm:inset-6 border-[3px] border-double border-[#c5a85c]/30 pointer-events-none rounded-sm"></div>
        <div class="absolute top-8 left-8 text-[#c5a85c]/20 w-16 h-16">
          <svg viewBox="0 0 100 100" class="w-full h-full fill-current"><path d="M 0 0 L 40 0 C 35 15 15 35 0 40 Z" /></svg>
        </div>
        <div class="absolute bottom-8 left-8 text-[#c5a85c]/20 w-16 h-16 transform -rotate-90">
          <svg viewBox="0 0 100 100" class="w-full h-full fill-current"><path d="M 0 0 L 40 0 C 35 15 15 35 0 40 Z" /></svg>
        </div>
      </div>
      
      <!-- Right Gate (Royal Carved Teak Wood & Gold border) -->
      <div 
        class="absolute inset-y-0 right-0 w-1/2 shadow-[-10px_0_30px_rgba(0,0,0,0.5)] border-l border-[#c5a85c]/40 flex items-center justify-start transition-all duration-[1600ms] ease-out-cubic origin-right"
        :style="opening ? 'transform: perspective(1600px) rotateY(110deg) scale(0.98); opacity: 0; filter: brightness(0.3);' : 'transform: perspective(1600px) rotateY(0deg) scale(1); opacity: 1;'"
        style="background: linear-gradient(135deg, #321c08 0%, #150a01 100%);"
      >
        <!-- Gold Frame Border on Right Door -->
        <div class="absolute inset-4 sm:inset-6 border-[3px] border-double border-[#c5a85c]/30 pointer-events-none rounded-sm"></div>
        <div class="absolute top-8 right-8 text-[#c5a85c]/20 w-16 h-16 transform rotate-90">
          <svg viewBox="0 0 100 100" class="w-full h-full fill-current"><path d="M 0 0 L 40 0 C 35 15 15 35 0 40 Z" /></svg>
        </div>
        <div class="absolute bottom-8 right-8 text-[#c5a85c]/20 w-16 h-16 transform rotate-180">
          <svg viewBox="0 0 100 100" class="w-full h-full fill-current"><path d="M 0 0 L 40 0 C 35 15 15 35 0 40 Z" /></svg>
        </div>
      </div>
      
      <!-- Majestic Golden Moonstone/Brass Handle Seal -->
      <div 
        @click="openInvitation" 
        class="relative z-10 flex flex-col items-center justify-center cursor-pointer group transition-all duration-700 ease-in-out"
        :class="opening ? 'opacity-0 scale-150 rotate-12 blur-md' : 'opacity-100 scale-100 rotate-0'"
      >
        <!-- Traditional Royal Door Knocker / Brass Emblem -->
        <div class="w-28 h-28 sm:w-32 sm:h-32 rounded-full bg-gradient-to-br from-[#e5c57d] via-[#b08b35] to-[#7f601b] text-white flex items-center justify-center shadow-[0_15px_35px_rgba(0,0,0,0.6)] group-hover:scale-110 transition-transform duration-300 border-4 border-[#fff5dd]/80 relative">
          <!-- Outer radial glowing lines -->
          <div class="absolute inset-0.5 rounded-full border-2 border-dashed border-[#ffe099]/40 animate-[spin_20s_linear_infinite]"></div>
          <!-- Ring door handle ornament inside -->
          <div class="w-20 h-20 rounded-full border-4 border-[#fff2d1]/30 flex items-center justify-center shadow-[inset_0_4px_10px_rgba(0,0,0,0.3)]">
            <span class="font-yatra text-4xl sm:text-5xl drop-shadow-[0_2px_4px_rgba(0,0,0,0.4)] text-[#fffbf2]">{{ initials }}</span>
          </div>
        </div>
        <div class="mt-8 bg-black/40 px-6 py-2 rounded-full border border-[#c5a85c]/30 backdrop-blur-sm transition-colors group-hover:bg-[#c5a85c]/20">
          <p class="text-[#fefcf9] font-sinhala-serif font-semibold tracking-[0.22em] uppercase text-sm sm:text-base animate-pulse group-hover:animate-none">මංගල සභාවට පිවිසෙන්න</p>
        </div>
      </div>
    </div>

    <!-- Invitation Card Layout -->
    <div class="relative w-full max-w-2xl min-h-screen py-16 px-6 sm:px-12 bg-[#fefcf9] border-[12px] border-double border-[#c5a85c]/40 shadow-2xl overflow-hidden flex flex-col items-center text-center">
      
      <!-- Gold Pressed Decorative Corner Ornaments -->
      <div class="absolute top-4 left-4 w-28 h-28 text-[#c5a85c]/40 pointer-events-none">
        <svg viewBox="0 0 100 100" class="w-full h-full fill-current">
          <path d="M 0 0 L 40 0 C 35 15 15 35 0 40 Z" />
          <path d="M 0 0 C 20 5 35 20 40 40 C 30 35 5 25 0 0" />
          <circle cx="20" cy="20" r="2" />
          <circle cx="10" cy="30" r="1.5" />
          <circle cx="30" cy="10" r="1.5" />
        </svg>
      </div>
      <div class="absolute top-4 right-4 w-28 h-28 text-[#c5a85c]/40 pointer-events-none transform rotate-90">
        <svg viewBox="0 0 100 100" class="w-full h-full fill-current">
          <path d="M 0 0 L 40 0 C 35 15 15 35 0 40 Z" />
          <path d="M 0 0 C 20 5 35 20 40 40 C 30 35 5 25 0 0" />
          <circle cx="20" cy="20" r="2" />
          <circle cx="10" cy="30" r="1.5" />
          <circle cx="30" cy="10" r="1.5" />
        </svg>
      </div>
      <div class="absolute bottom-4 left-4 w-28 h-28 text-[#c5a85c]/40 pointer-events-none transform -rotate-90">
        <svg viewBox="0 0 100 100" class="w-full h-full fill-current">
          <path d="M 0 0 L 40 0 C 35 15 15 35 0 40 Z" />
          <path d="M 0 0 C 20 5 35 20 40 40 C 30 35 5 25 0 0" />
          <circle cx="20" cy="20" r="2" />
          <circle cx="10" cy="30" r="1.5" />
          <circle cx="30" cy="10" r="1.5" />
        </svg>
      </div>
      <div class="absolute bottom-4 right-4 w-28 h-28 text-[#c5a85c]/40 pointer-events-none transform rotate-180">
        <svg viewBox="0 0 100 100" class="w-full h-full fill-current">
          <path d="M 0 0 L 40 0 C 35 15 15 35 0 40 Z" />
          <path d="M 0 0 C 20 5 35 20 40 40 C 30 35 5 25 0 0" />
          <circle cx="20" cy="20" r="2" />
          <circle cx="10" cy="30" r="1.5" />
          <circle cx="30" cy="10" r="1.5" />
        </svg>
      </div>

      <!-- Main Content Block -->
      <div class="relative z-10 w-full flex flex-col items-center" :class="isOpenedFully ? 'animate-fade-in-up' : 'opacity-0'">
        
        <!-- Subtitle Header -->
        <h3 class="font-yatra text-4xl sm:text-5xl text-[#c5a85c] drop-shadow-sm mb-8 tracking-wider">
          {{ sinhalaData.sub_title || 'ශ්‍රී සුභ මංගලම්....!' }}
        </h3>

        <!-- Bride Parents Section -->
        <div class="mb-4 max-w-lg">
          <p class="font-sinhala-serif text-base sm:text-lg leading-relaxed text-[#5c4a37]">
            {{ sinhalaData.bride_parents }}
          </p>
          <span class="block text-xs font-sinhala-serif text-[#c5a85c] uppercase tracking-widest mt-1">ආදරණීය දියණිය</span>
        </div>

        <!-- Bride Name -->
        <h1 class="font-yatra text-4xl sm:text-5xl my-3 text-[#b08b35] drop-shadow-sm border-b-2 border-double border-[#c5a85c]/30 px-6 pb-2">
          {{ sinhalaData.bride_name }}
        </h1>

        <!-- Joining Word -->
        <p class="font-sinhala-serif text-sm sm:text-base italic my-4 text-[#8a7258]">
          සමග අතිනත ගැනීමේ ප්‍රීතිය නිමිත්තෙන්
        </p>

        <!-- Groom Parents Section -->
        <div class="mb-4 max-w-lg">
          <p class="font-sinhala-serif text-base sm:text-lg leading-relaxed text-[#5c4a37]">
            {{ sinhalaData.groom_parents }}
          </p>
          <span class="block text-xs font-sinhala-serif text-[#c5a85c] uppercase tracking-widest mt-1">ආදරණීය පුතණුවන්</span>
        </div>

        <!-- Groom Name -->
        <h1 class="font-yatra text-4xl sm:text-5xl my-3 text-[#b08b35] drop-shadow-sm border-b-2 border-double border-[#c5a85c]/30 px-6 pb-2">
          {{ sinhalaData.groom_name }}
        </h1>

        <!-- Joining Invitation word -->
        <p class="font-sinhala-serif text-sm sm:text-base text-[#5c4a37] mb-8 font-semibold">
          සමඟ අතිනත ගැනීමේ ප්‍රීතිය නිමිත්තෙන්
        </p>

        <!-- Gold Date Box (Sri Lankan Card Style) -->
        <div class="w-72 sm:w-80 border-y border-[#c5a85c] py-4 my-6 relative flex flex-col items-center">
          <p class="font-sinhala-serif text-[#b08b35] font-semibold text-lg tracking-widest mb-1">{{ sinhalaMonth }}</p>
          <div class="flex items-center justify-center gap-6 w-full">
            <span class="font-sinhala-serif text-sm sm:text-base text-[#8a7258] border-r border-[#c5a85c]/30 pr-4">{{ sinhalaDayOfWeek }}</span>
            <span class="font-yatra text-5xl sm:text-6xl text-[#b08b35] font-bold drop-shadow-sm px-2">{{ eventDateObj.getDate() }}</span>
            <span class="font-sinhala-serif text-sm sm:text-base text-[#8a7258] border-l border-[#c5a85c]/30 pl-4">{{ eventDateObj.getFullYear() }}</span>
          </div>
        </div>

        <!-- Event Times -->
        <div class="my-6">
          <p class="font-sinhala-serif text-base sm:text-lg text-[#5c4a37] font-semibold leading-relaxed">
            පෙ.ව. {{ formattedSinhalaTime }} සිට ප.ව. {{ formattedEndTime }} දක්වා
          </p>
          <!-- Poruwa time -->
          <p v-if="sinhalaData.poruwa_time" class="font-sinhala-serif text-sm sm:text-base italic text-[#c5a85c] mt-2 font-medium bg-[#c5a85c]/5 px-4 py-1.5 rounded-full border border-[#c5a85c]/20">
            ({{ sinhalaData.poruwa_time }})
          </p>
        </div>

        <!-- Venue / Location Box -->
        <div class="my-8 max-w-lg p-6 bg-[#FAF6EE] border border-[#c5a85c]/30 rounded-xl shadow-sm w-full">
          <div class="w-10 h-10 mx-auto text-[#c5a85c] mb-3">
            <svg fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z" />
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z" />
            </svg>
          </div>
          <h4 class="font-sinhala-serif text-sm text-[#c5a85c] uppercase tracking-widest mb-1 font-semibold">උත්සව ශාලාව</h4>
          <p class="font-sinhala-serif text-lg text-[#5c4a37] font-semibold leading-relaxed">
            {{ invite.location }}
          </p>
          <div class="mt-4" v-if="invite.map_url">
            <a :href="invite.map_url" target="_blank" class="inline-flex items-center justify-center px-5 py-2 text-xs font-semibold text-white bg-[#b08b35] hover:bg-[#9a7525] rounded-full shadow transition-colors">
              සිතියම බලන්න (Open in Maps)
            </a>
          </div>
        </div>

        <!-- Custom Invite Note -->
        <p class="font-sinhala-serif text-base sm:text-lg italic text-[#8a7258] my-4 leading-relaxed font-medium">
          " {{ sinhalaData.invite_note || 'ඔබට/ඔබ දෙපලට/ඔබ සැමට සෙනෙහසින් ඇරයුම් කරමු.' }} "
        </p>

        <!-- Elegant Sri Lankan Cartoon Couple Illustration -->
        <div class="relative w-full py-8 flex items-center justify-center gap-12 mt-6">
          <div class="w-64 h-36 relative flex items-center justify-center">
            <!-- Custom Premium SVG Kandyan Couple & Heart Ring Illustration -->
            <svg viewBox="0 0 300 160" class="w-full h-full text-[#b08b35]">
              <!-- Left: Kandyan Groom Outline style -->
              <g transform="translate(10, 10) scale(0.6)">
                <!-- Groom Mul Anduma crown -->
                <path d="M 50 10 L 80 40 L 20 40 Z" fill="none" stroke="currentColor" stroke-width="3" stroke-linejoin="round"/>
                <circle cx="50" cy="20" r="3" fill="currentColor"/>
                <path d="M 35 40 L 65 40" stroke="currentColor" stroke-width="3"/>
                <!-- Face -->
                <circle cx="50" cy="55" r="15" fill="none" stroke="currentColor" stroke-width="3"/>
                <!-- Jacket Details -->
                <path d="M 50 70 L 50 120" stroke="currentColor" stroke-width="3"/>
                <path d="M 25 75 L 50 70 L 75 75 L 85 105 L 50 120 L 15 105 Z" fill="none" stroke="currentColor" stroke-width="3"/>
                <path d="M 30 120 L 50 120 L 70 120 L 80 150 L 50 160 L 20 150 Z" fill="none" stroke="currentColor" stroke-width="3"/>
              </g>
              
              <!-- Right: Traditional Kandyan Bride (Osariya) Outline -->
              <g transform="translate(210, 10) scale(0.6)">
                <!-- Nalalpata Ornament -->
                <path d="M 30 45 C 30 30 70 30 70 45 Z" fill="currentColor"/>
                <circle cx="50" cy="30" r="3" fill="currentColor"/>
                <path d="M 40 33 C 45 38 55 38 60 33" fill="none" stroke="currentColor" stroke-width="2"/>
                <!-- Face -->
                <circle cx="50" cy="55" r="15" fill="none" stroke="currentColor" stroke-width="3"/>
                <!-- Saree & Necklace -->
                <path d="M 50 70 C 35 75 25 90 25 110 L 75 110 C 75 90 65 75 50 70" fill="none" stroke="currentColor" stroke-width="3"/>
                <path d="M 30 110 L 20 155 L 80 155 L 70 110 Z" fill="none" stroke="currentColor" stroke-width="3"/>
                <!-- Potta -->
                <path d="M 38 78 C 30 95 30 125 40 155" fill="none" stroke="currentColor" stroke-width="3"/>
              </g>
              
              <!-- Center: Couple Double-Heart Logo Rings -->
              <g transform="translate(105, 30)">
                <!-- Ring 1 -->
                <path d="M 40 40 C 20 15 0 35 40 70 C 80 35 60 15 40 40" fill="none" stroke="currentColor" stroke-width="4" stroke-linecap="round"/>
                <!-- Ring 2 -->
                <path d="M 70 40 C 50 15 30 35 70 70 C 110 35 90 15 70 40" fill="none" stroke="currentColor" stroke-width="4" stroke-linecap="round"/>
                <!-- Initials -->
                <text x="32" y="48" font-family="'Yatra One', serif" font-size="16" font-weight="bold" fill="currentColor">{{ initials.charAt(0) }}</text>
                <text x="62" y="48" font-family="'Yatra One', serif" font-size="16" font-weight="bold" fill="currentColor">{{ initials.length > 1 ? initials.charAt(1) : initials.charAt(0) }}</text>
              </g>
            </svg>
          </div>
        </div>

        <!-- RSVP Form Section -->
        <div class="w-full mt-10 border-t border-[#c5a85c]/20 pt-10">
          <h2 class="font-yatra text-3xl mb-4 text-[#b08b35]">RSVP (පිළිතුරු එවන්න)</h2>
          <p class="font-sinhala-serif text-sm text-[#8a7258] mb-8">කරුණාකර ඔබගේ සහභාගීත්වය අප වෙත දන්වන්න.</p>

          <div v-if="rsvpSubmitted" class="p-8 rounded-2xl bg-white border-2 border-double border-[#c5a85c]/30 shadow-md max-w-md mx-auto">
            <div class="w-12 h-12 mx-auto text-[#c5a85c] mb-4">
              <svg fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7" /></svg>
            </div>
            <h3 class="font-sinhala-serif text-xl text-[#5c4a37] font-semibold mb-2">බොහෝම ස්තූතියි!</h3>
            <p class="font-sinhala-serif text-sm text-[#8a7258]">ඔබගේ ප්‍රතිචාරය සාර්ථකව ලැබුණි. අපි ඔබ එනතුරු බලා සිටිමු!</p>
          </div>

          <form v-else @submit.prevent="submitRsvp" class="max-w-md mx-auto space-y-5 text-left p-6 sm:p-8 bg-white border border-[#c5a85c]/30 rounded-xl shadow-md relative">
            <div v-if="submittingRsvp" class="absolute inset-0 z-10 bg-white/80 rounded-xl flex items-center justify-center backdrop-blur-sm">
              <div class="w-8 h-8 border-4 border-[#b08b35] border-t-transparent rounded-full animate-spin"></div>
            </div>
            
            <div>
              <label for="name" class="block text-sm font-semibold text-[#5c4a37] font-sinhala-serif">ඔබගේ නම (Your Name)</label>
              <input v-model="rsvpForm.guest_name" type="text" id="name" required class="mt-2 block w-full rounded-md border border-[#c5a85c]/30 py-2.5 px-3.5 text-gray-900 shadow-sm focus:ring-2 focus:ring-[#b08b35] sm:text-sm bg-white" placeholder="John Doe">
            </div>

            <div>
              <label class="block text-sm font-semibold text-[#5c4a37] font-sinhala-serif mb-2">සහභාගී වන්නේද? (Will you attend?)</label>
              <div class="flex items-center gap-4">
                <label class="flex items-center cursor-pointer p-3 border rounded-lg flex-1 border-gray-300 hover:border-[#b08b35] transition-colors" :class="{'ring-2 ring-[#b08b35] border-[#b08b35]': rsvpForm.is_attending === true}">
                  <input type="radio" v-model="rsvpForm.is_attending" :value="true" class="sr-only" required>
                  <div class="w-4 h-4 rounded-full border border-gray-300 flex items-center justify-center mr-3" :class="{'border-[#b08b35]': rsvpForm.is_attending === true}">
                    <div class="w-2.5 h-2.5 rounded-full bg-[#b08b35] transition-transform scale-0" :class="{'scale-100': rsvpForm.is_attending === true}"></div>
                  </div>
                  <span class="text-xs font-semibold text-gray-900 font-sinhala-serif">සතුටින් පැමිණෙමි</span>
                </label>
                
                <label class="flex items-center cursor-pointer p-3 border rounded-lg flex-1 border-gray-300 hover:border-[#b08b35] transition-colors" :class="{'ring-2 ring-[#b08b35] border-[#b08b35]': rsvpForm.is_attending === false}">
                  <input type="radio" v-model="rsvpForm.is_attending" :value="false" class="sr-only" required>
                  <div class="w-4 h-4 rounded-full border border-gray-300 flex items-center justify-center mr-3" :class="{'border-[#b08b35]': rsvpForm.is_attending === false}">
                    <div class="w-2.5 h-2.5 rounded-full bg-[#b08b35] transition-transform scale-0" :class="{'scale-100': rsvpForm.is_attending === false}"></div>
                  </div>
                  <span class="text-xs font-semibold text-gray-900 font-sinhala-serif">පැමිණීමට නොහැක</span>
                </label>
              </div>
            </div>

            <div v-if="rsvpForm.is_attending">
              <label for="count" class="block text-sm font-semibold text-[#5c4a37] font-sinhala-serif">සහභාගී වන ගණන (Guests)</label>
              <select v-model="rsvpForm.guest_count" id="count" class="mt-2 block w-full rounded-md border border-[#c5a85c]/30 py-2.5 px-3.5 text-gray-900 bg-white">
                <option value="1">මා පමණක් (1)</option>
                <option value="2">දෙදෙනෙක් (2)</option>
                <option value="3">තිදෙනෙක් (3)</option>
                <option value="4">සිව්දෙනෙක් (4)</option>
                <option value="5">පස්දෙනෙක් (5)</option>
              </select>
            </div>

            <button type="submit" class="w-full py-3 px-4 mt-4 rounded-full text-white bg-[#b08b35] hover:bg-[#9a7525] shadow-lg hover:shadow-xl transition-all font-semibold font-sinhala-serif text-center">
              ලියාපදිංචි කරන්න (Send RSVP)
            </button>
          </form>

          <!-- RSVP Contact Info Display -->
          <div class="mt-8 font-sinhala-serif text-[#5c4a37] text-sm sm:text-base font-semibold">
            විමසීම් : {{ sinhalaData.rsvp_contact }}
          </div>
        </div>

      </div>
    </div>
  </main>

  <!-- Default Modern Template -->
  <main v-else :class="['min-h-screen font-sans', themeClass, {'overflow-hidden h-screen': !isOpenedFully}]" :style="cssVars">
    
    <!-- Card Opening Animation Overlay -->
    <div v-if="!isOpenedFully" class="fixed inset-0 z-50 flex items-center justify-center overflow-hidden bg-theme-bg/30 backdrop-blur-sm" :class="{'pointer-events-none': opening}">
      
      <!-- Left Door -->
      <div 
        class="absolute inset-y-0 left-0 w-1/2 bg-theme-bg border-r border-theme-accent/20 shadow-2xl flex items-center justify-end pr-1 transition-all duration-[1200ms] ease-out-cubic origin-left"
        :style="opening ? 'transform: perspective(1200px) rotateY(-100deg); opacity: 0;' : 'transform: perspective(1200px) rotateY(0deg); opacity: 1;'"
      >
        <div class="w-px h-1/2 bg-theme-accent/10"></div>
      </div>
      
      <!-- Right Door -->
      <div 
        class="absolute inset-y-0 right-0 w-1/2 bg-theme-bg border-l border-theme-accent/20 shadow-2xl flex items-center justify-start pl-1 transition-all duration-[1200ms] ease-out-cubic origin-right"
        :style="opening ? 'transform: perspective(1200px) rotateY(100deg); opacity: 0;' : 'transform: perspective(1200px) rotateY(0deg); opacity: 1;'"
      >
        <div class="w-px h-1/2 bg-theme-accent/10"></div>
      </div>
      
      <!-- Center Seal / Tap to Open -->
      <div 
        @click="openInvitation" 
        class="relative z-10 flex flex-col items-center justify-center cursor-pointer group transition-all duration-700 ease-in-out"
        :class="opening ? 'opacity-0 scale-150 rotate-12 blur-sm' : 'opacity-100 scale-100 rotate-0'"
      >
        <div class="w-24 h-24 sm:w-28 sm:h-28 rounded-full bg-theme-accent text-white flex items-center justify-center shadow-[0_10px_30px_rgba(0,0,0,0.2)] group-hover:scale-110 transition-transform duration-300 border-4 border-white/20">
          <span class="font-serif text-3xl sm:text-4xl italic shadow-sm">{{ initials }}</span>
        </div>
        <p class="mt-6 text-theme-accent font-medium tracking-[0.2em] uppercase text-xs sm:text-sm animate-pulse group-hover:animate-none">Tap to Open</p>
      </div>
    </div>

    <!-- Hero Section -->
    <section class="relative min-h-[90vh] w-full flex flex-col items-center justify-center pt-20 pb-12 overflow-hidden bg-theme-bg text-theme-text px-6">
      <!-- Decorative Elements -->
      <div class="absolute top-0 left-0 w-64 h-64 bg-theme-accent/5 rounded-full blur-3xl -translate-x-1/2 -translate-y-1/2"></div>
      <div class="absolute bottom-0 right-0 w-80 h-80 bg-theme-accent/5 rounded-full blur-3xl translate-x-1/3 translate-y-1/3"></div>

      <!-- Content Container -->
      <div class="relative z-20 flex flex-col items-center justify-center w-full max-w-lg mx-auto mt-4" :class="isOpenedFully ? 'animate-fade-in-up' : 'opacity-0'">
        
        <!-- Modern Arched Photo Frame -->
        <div v-if="invite.image_url" class="relative w-64 h-80 sm:w-72 sm:h-96 mb-10 overflow-hidden shadow-2xl ring-4 ring-white/50 dark:ring-gray-800/50" style="border-radius: 10rem 10rem 0 0;">
          <img :src="invite.image_url" alt="Couple" class="w-full h-full object-cover transition-transform duration-1000 hover:scale-105" />
          <div class="absolute inset-0 ring-1 ring-inset ring-theme-accent/20" style="border-radius: 10rem 10rem 0 0;"></div>
        </div>
        
        <!-- Typography -->
        <div class="text-center">
          <p class="text-xs md:text-sm tracking-[0.4em] uppercase mb-5 text-theme-accent font-medium">We are getting married</p>
          <h1 class="text-5xl md:text-6xl lg:text-7xl mb-6 leading-tight drop-shadow-sm font-script">{{ invite.couple_names }}</h1>
          <div class="w-12 h-px bg-theme-accent mx-auto mb-6"></div>
          <p class="text-lg md:text-xl font-light tracking-widest mb-10 text-theme-text/80 font-heading">{{ formattedDate }}</p>
        </div>
        
        <!-- Scroll Down Button -->
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
              <option value="1">Just Me (1)</option>
              <option value="2">Two of Us (2)</option>
              <option value="3">Three of Us (3)</option>
              <option value="4">Four of Us (4)</option>
              <option value="5">Five of Us (5)</option>
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
  layout: false // Use no layout for the public invite page
})

const route = useRoute()
const supabase = useSupabaseClient()

// Animation State
const opening = ref(false)
const isOpenedFully = ref(false)

const openInvitation = () => {
  opening.value = true
  // Wait for the doors to swing open before revealing content
  setTimeout(() => {
    isOpenedFully.value = true
    nextTick(() => {
      initScrollAnimations()
    })
  }, 1600) // Match the 1600ms duration of the royal palace gates
}

// Fetch Invitation Data
const invite = ref<any>(null)
const pending = ref(true)
const isSinhala = ref(false)
const sinhalaData = ref<any>({})

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
    // Parse Sinhala Details from special_comments if applicable
    if (data.special_comments && data.special_comments.startsWith('{') && data.special_comments.endsWith('}')) {
      try {
        const parsed = JSON.parse(data.special_comments)
        if (parsed.is_sinhala) {
          isSinhala.value = true
          sinhalaData.value = parsed
        }
      } catch (e) {
        console.error('Error parsing special comments as JSON:', e)
      }
    }
  }
  pending.value = false
}

onMounted(() => {
  fetchInvite()
})

// Formatting Dates
const eventDateObj = computed(() => invite.value ? new Date(invite.value.event_date) : new Date())
const formattedDate = computed(() => eventDateObj.value.toLocaleDateString('en-US', { month: 'long', day: 'numeric', year: 'numeric' }))
const formattedFullDate = computed(() => eventDateObj.value.toLocaleDateString('en-US', { weekday: 'long', month: 'long', day: 'numeric', year: 'numeric' }))
const formattedTime = computed(() => eventDateObj.value.toLocaleTimeString('en-US', { hour: 'numeric', minute: '2-digit' }))

// Sinhala Date Formats
const sinhalaMonths = ['ජනවාරි', 'පෙබරවාරි', 'මාර්තු', 'අප්‍රේල්', 'මැයි', 'ජූනි', 'ජූලි', 'අගෝස්තු', 'සැප්තැම්බර්', 'ඔක්තෝබර්', 'නොවැම්බර්', 'දෙසැම්බර්']
const sinhalaDays = ['ඉරිදා', 'සඳුදා', 'අඟහරුවාදා', 'බදාදා', 'බ්‍රහස්පතින්දා', 'සිකුරාදා', 'සෙනසුරාදා']

const sinhalaMonth = computed(() => sinhalaMonths[eventDateObj.value.getMonth()])
const sinhalaDayOfWeek = computed(() => sinhalaDays[eventDateObj.value.getDay()])

const formattedSinhalaTime = computed(() => {
  let hours = eventDateObj.value.getHours()
  let minutes = eventDateObj.value.getMinutes()
  hours = hours % 12
  hours = hours ? hours : 12 // the hour '0' should be '12'
  const minStr = minutes < 10 ? '0' + minutes : minutes
  return `${hours}.${minStr}`
})

const formattedEndTime = computed(() => {
  // Traditional Sinhala cards end in late afternoon, usually 3.30 PM. We can estimate event duration to be 6.5 hours
  const end = new Date(eventDateObj.value.getTime() + 6.5 * 60 * 60 * 1000)
  let hours = end.getHours()
  let minutes = end.getMinutes()
  hours = hours % 12
  hours = hours ? hours : 12
  const minStr = minutes < 10 ? '0' + minutes : minutes
  return `${hours}.${minStr}`
})

// Theme Logic
const themes = {
  rose: { bg: '#fff0f5', text: '#4a3b3c', accent: '#b76e79' },
  emerald: { bg: '#f0fff4', text: '#274e37', accent: '#50C878' },
  dark: { bg: '#1a202c', text: '#f7fafc', accent: '#e2e8f0' },
  ocean: { bg: '#f0f8ff', text: '#1b3b5c', accent: '#0077b6' },
}

const themeClass = computed(() => {
  if (!invite.value) return 'theme-rose'
  const baseTheme = invite.value.theme_color.replace('_sinhala', '')
  return `theme-${baseTheme}`
})

const initials = computed(() => {
  if (isSinhala.value && sinhalaData.value.bride_name) {
    const b = sinhalaData.value.bride_name.trim().charAt(0)
    const g = sinhalaData.value.groom_name.trim().charAt(0)
    return `${b}${g}`
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
  const baseTheme = invite.value.theme_color.replace('_sinhala', '')
  const theme = themes[baseTheme as keyof typeof themes] || themes.rose
  return {
    '--theme-bg': theme.bg,
    '--theme-text': theme.text,
    '--theme-accent': theme.accent,
  }
})

// Scroll Logic & Animations
const scrollToDetails = () => {
  document.getElementById('details')?.scrollIntoView({ behavior: 'smooth' })
}

const initScrollAnimations = () => {
  // Simple intersection observer for scroll reveal animations
  const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        entry.target.classList.add('animate-reveal')
      }
    })
  }, { threshold: 0.1 })

  document.querySelectorAll('.reveal').forEach((el) => observer.observe(el))
}

// RSVP Logic
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

// Calendar Link Generator
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

/* Traditional Sinhala Fonts */
.font-yatra { font-family: 'Yatra One', cursive, serif; }
.font-sinhala-serif { font-family: 'Noto Serif Sinhala', serif; }
.font-sinhala-sans { font-family: 'Noto Sans Sinhala', sans-serif; }

/* CSS Variables fallbacks */
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

/* Animations */
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
