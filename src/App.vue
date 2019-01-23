<template>
  <v-app>
    <v-toolbar app>
      <v-toolbar-title class="headline text-uppercase">
        <span>ALAMO</span>
        <span class="font-weight-light">PIZZA</span>
      </v-toolbar-title>
      </v-spacer>
    </v-toolbar>

    <v-content>
      <Main/>
    </v-content>
  </v-app>
</template>

<script>
import Main from './components/Main';

export default {
  name: 'App',
  components: {
    Main
  },
  data () {
    return {}
  }
}
</script>
