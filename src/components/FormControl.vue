<template>
     <v-layout wrap pb-2 pt-2>
        <v-flex xs12>
            <span class="subheading"><slot name="title" /></span>
        </v-flex>

        <v-flex xs12 class="form-control-container">
            <v-btn  @click="$emit('click', (-1 * incrementAmount))">-</v-btn>
            <span class="display-1"><slot /></span>
            <v-btn @click="$emit('click', incrementAmount)">+</v-btn>
        </v-flex>
        

    </v-layout>
</template>

<script>
export default {
    name: 'FormControl',
    props: {
        incrementAmount: {
            type: Number,
            required: true
        }
    }
}
</script>

<style>
.form-control-container {
    display: flex;
    flex-direction: row;
    align-items: center;
    justify-content: space-between;
}
</style>
