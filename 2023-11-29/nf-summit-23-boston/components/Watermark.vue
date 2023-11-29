<script setup lang="ts">
import { ref } from "vue";

const props = defineProps({
  icon: {
    default: "",
  },
});
</script>

<template>
  <div class="absolute right-30px bottom-30px">
    <!-- TODO Make sure this Yellow is right -->
    <simple-icons-duckdb class="text-4xl text-[#fff000]" />
  </div>
</template>
