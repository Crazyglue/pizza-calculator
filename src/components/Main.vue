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
              v-for="control in filteredInputs"
              :key="control.key"
              @click="(v) => inputData[control.key] += v"
              :incrementAmount="control.incrementAmount"
              :min-disabled="inputData[control.key] <= control.minVal"
              :max-disabled="inputData[control.key] >= control.maxVal"
            >

              <template slot="title">
                {{ control.name }}
              </template>

              <template slot="tooltip" v-if="control.tooltip">
                <span>{{ control.tooltip }}</span>
              </template>

              {{ inputData[control.key] | toPercent(control.units) }}
              <span v-if="control.units" class="font-weight-light">
                {{ control.units }}
              </span>

            </FormControl>
        </v-layout>
      </v-flex>

      <v-flex mb-4 xs12 sm8 offset-sm2 class="results" pl-2 pr-2>
        <v-layout wrap>
          <Ingredient
            :name="'Flour'"
            :value="flour"
            :units="'g'"
          />
          <Ingredient
            :name="'Water'"
            :value="water"
            :units="'g'"
          />
          <Ingredient
            :name="'Yeast'"
            :value="yeast"
            :units="'g'"
          />
          <Ingredient
            :name="'Salt'"
            :value="salt"
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

  const inputs = [
    { name: 'Pizza size', tooltip: 'A 10-12" pizza is 250g and a 14-16" pizza is 300g', units: 'g', incrementAmount: 5, isAdvanced: false, key: 'ballSize' },
    { name: 'Pizzas', tooltip: null, minVal: 1, incrementAmount: 1, isAdvanced: false, key: 'numBalls' },
    { name: 'Hydration', tooltip: 'The amount of water to add as a percentage of how much flour (measured by its weight). The lower temperature the oven, the higher the hydration should be. 70% being the upper end', minVal: 0.50, maxVal: 1, units: '%', incrementAmount: 0.05, isAdvanced: false, key: 'hydration' },
    { name: 'Yeast', tooltip: 'The amount of yeast to add, as a percentage of flour. Typically 1% is enough', minVal: 0.01, maxVal: 0.09, units: '%', incrementAmount: 0.01, isAdvanced: true, key: 'yeastPercent' },
    { name: 'Salt', tooltip: 'The amount of salt to add, as a percentage of flour. Default 2%', minVal: 0.01, maxVal: 0.1, units: '%', incrementAmount: 0.01, isAdvanced: true, key: 'saltPercent' }
  ]

  export default {
    components: {
      Ingredient,
      FormControl
    },
    name: 'Main',
    data() {
      return {
        isAdvanced: false,
        inputs,
        inputData: {
          ballSize: 250,
          numBalls: 2,
          hydration: 0.65,
          yeastPercent: 0.01,
          saltPercent: 0.02
        }
      }
    },
    computed: {
      filteredInputs() {
        // TODO: Simplify this?
        return this.inputs.filter(i => {
          if (this.isAdvanced) return true;
          else if (!this.isAdvanced && !i.isAdvanced) return true;
          else return false;
        })
      },
      totalWeight() {
        return this.inputData.ballSize * this.inputData.numBalls;
      },
      flour() {
        return (this.totalWeight) / (1 + this.inputData.hydration);
      },
      water() {
        return this.totalWeight - this.flour;
      },
      yeast() {
        return this.flour * this.inputData.yeastPercent;
      },
      salt() {
        return this.flour * this.inputData.saltPercent;
      }
    },
    filters: {
      toPercent(v, units) {
        if (units !== '%') return v;
        return Math.round(v * 100);
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
