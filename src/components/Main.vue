<template>
  <v-container>
    <v-layout
      text-xs-center
      wrap
    >
      <v-flex xs12 row>
        <span>
          <span class="headline">CHEAT</span>
          <span class="headline font-weight-light">ZA</span>

        </span>
        <v-switch
            color="#D32F2F"
            :label="'Advanced'"
            v-model="isAdvanced"
          ></v-switch>
        <hr />
      </v-flex>

      <v-flex mb-4 xs12 sm8 offset-sm2>
        <v-layout sm8 offset-sm2 align-center column justify-center transition="slide-x-transition">
            <FormControl
              :key="'size'" 
              @click="(v) => ballSize += v"
              :incrementAmount="5"
            >
              <template slot="title">
                Pizza size
              </template>
              <v-layout slot="tooltip" column>
                <span>a 10-12" pizza is 250g</span>
                <span>and a 14-16" pizza is 300g</span>
              </v-layout>
              <span>{{ ballSize }}<span class="font-weight-light">g</span></span>
            </FormControl>

            <FormControl 
              :key="'number-pizzas'"
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
              :key="'hydration'"
              @click="(v) => hydration += v"
              :incrementAmount=".05"
              :min-disabled="hydration <= 0.50"
              :max-disabled="hydration >= 1"
            >
              <template slot="title">
                Hydration
              </template>
              <template slot="tooltip">
                The amount of water to add as a percentage of how much flour (measured by its weight). The lower temperature the oven, the higher the hydration should be. 70% being the upper end
              </template>
              {{ hydration | toPercent }}<span class="font-weight-light">%</span>
            </FormControl>

            <FormControl 
              v-if="isAdvanced"
              :key="'yeast'"
              @click="(v) => yeastPercent += v"
              :incrementAmount=".01"
              :min-disabled="yeastPercent <= 0.0"
              :max-disabled="yeastPercent > 0.09"
            >
              <template slot="title">
                Yeast
              </template>
              <template slot="tooltip">
                The amount of yeast to add, as a percentage of flour. Typically 1% is enough
              </template>
              {{ yeastPercent | toPercent }}<span class="font-weight-light">%</span>
            </FormControl>

            <FormControl 
              v-if="isAdvanced"
              :key="'salt'"
              @click="(v) => saltPercent += v"
              :incrementAmount=".01"
              :min-disabled="saltPercent <= 0.0"
              :max-disabled="saltPercent >= 0.1"
            >
              <template slot="title">
                Salt
              </template>
              <template slot="tooltip">
                The amount of salt to add, as a percentage of flour. Default 2%
              </template>
              {{ saltPercent | toPercent }}<span class="font-weight-light">%</span>
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
        hydration: 0.65,
        yeastPercent: 0.01,
        saltPercent: 0.02,
        isAdvanced: false
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
        return this.flour * this.yeastPercent;
      },
      salt() {
        return this.flour * this.saltPercent;
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
