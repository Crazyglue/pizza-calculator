<template>
  <v-container>
    <v-layout
      text-xs-center
      wrap
    >
      <v-flex xs12>
        <span class="headline">CHEAT</span>
        <span class="headline font-weight-light">ZA</span>
        <!-- <v-img
          :src="require('../assets/logo.svg')"
          class="my-3"
          contain
          height="150"
        ></v-img> -->
        <hr />
      </v-flex>

      <v-flex mb-4 xs12 sm8 offset-sm2>
        <v-layout sm8 offset-sm2 align-center column justify-center>

          <FormControl 
            @click="(v) => ballSize += v"
            :incrementAmount="5"
          >
            <template slot="title">
              Pizza size (g)
            </template>
            <v-layout slot="tooltip" column>
              <span>a 10-12" pizza is 250g</span>
              <span>and a 14-16" pizza is 300g</span>
            </v-layout>
            <span>{{ ballSize }}</span>
          </FormControl>

          <FormControl 
            @click="(v) => numBalls += v"
            :incrementAmount="1"
            :min-disabled="numBalls === 1"
          >
            <template slot="title">
              Pizzas
            </template>
            
            {{ numBalls }}
          </FormControl>

          <FormControl 
            @click="(v) => hydration += v"
            :incrementAmount=".05"
            :min-disabled="hydration <= 0.50"
            :max-disabled="hydration >= 1"
          >
            <template slot="title">
              Hydration (%)
            </template>
            <template slot="tooltip">
              Hydration is the amount of water to add as a percentage of how much flour (measured by its weight)
            </template>
            {{ hydration | toPercent }}%
          </FormControl>
        </v-layout>
      </v-flex>

      <v-flex mb-4 xs12 sm8 offset-sm2 class="results" pl-2 pr-2>
        <v-layout wrap>
          <Ingredient
            :name="'Flour'"
            :value="flour | round"
            :units="'g'"
          />
          <Ingredient
            :name="'Water'"
            :value="water | round"
            :units="'g'"
          />
          <Ingredient
            :name="'Yeast'"
            :value="yeast | round"
            :units="'g'"
          />
          <Ingredient
            :name="'Salt'"
            :value="salt | round"
            :units="'g'"
          />
        </v-layout>
      </v-flex>
    </v-layout>
  </v-container>
</template>

<script>
  import Ingredient from './Ingredient.vue';
  import FormControl from './FormControl.vue';
  export default {
    components: {
      Ingredient,
      FormControl
    },
    name: 'Main',
    data() {
      return {
        ballSize: 250,
        numBalls: 2,
        hydration: 0.65
      }
    },
    computed: {
      totalWeight() {
        return this.ballSize * this.numBalls;
      },
      flour() {
        return (this.totalWeight) / (1 + this.hydration);
      },
      water() {
        return this.totalWeight - this.flour;
      },
      yeast() {
        return this.flour * 0.01;
      },
      salt() {
        return this.flour * 0.02;
      }
    },
    filters: {
      toPercent(v) {
        return Math.round(v * 100);
      },
      round(v) {
        return Math.round(v);
      }
    }
  }
</script>

<style scoped>
hr {
  border-bottom: none;
  border-right: none;
  border-left: none;
}
</style>
