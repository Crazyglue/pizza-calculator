<template>
  <v-container>
    <v-layout
      text-xs-center
      wrap
    >
      <v-flex xs12>
        <v-img
          :src="require('../assets/logo.svg')"
          class="my-3"
          contain
          height="150"
        ></v-img>
      </v-flex>

      <v-flex mb-4 xs12 sm8 offset-sm2>
        <v-flex sm8 offset-sm2>

          <FormControl 
            @click="(v) => ballSize += v"
            :incrementAmount="5"
          >
            <template slot="title">
              Ball size (g)
            </template>
            {{ ballSize }}
          </FormControl>

          <v-divider></v-divider>

          <FormControl 
            @click="(v) => numBalls += v"
            :incrementAmount="1"
          >
            <template slot="title">
              Number of balls
            </template>
            {{ numBalls }}
          </FormControl>

          <v-divider></v-divider>

          <FormControl 
            @click="(v) => hydration += v"
            :incrementAmount=".05"
          >
            <template slot="title">
              Hydration (%)
            </template>
            {{ hydration | twoDecimal }}
          </FormControl>
        </v-flex>
        </v-flex>

      <v-flex mb-4 xs12 sm8 offset-sm2 class="results" pa-2>
        <v-layout wrap>
          <Ingredient
            :name="'Flour'"
            :value="flour | round"
            :units="'g'"
          />
          <Ingredient
            :name="'Water'"
            :value="water | round"
            :units="'g/ml'"
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
      twoDecimal(v) {
        return v.toPrecision(2)
      },
      round(v) {
        return Math.round(v);
      }
    }
  }
</script>

<style scoped>

</style>
