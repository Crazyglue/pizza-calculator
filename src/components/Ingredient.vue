<template>
    <v-flex mb-1 sm6 xs6 pa-1>
        <v-card
            space-between
            class="mx-auto"
            color="#388E3C"
            dark
            pt-1
        >

            
            <v-card-title>
                
                    <v-img
                        :src="require(`../assets/${name.toLowerCase()}.svg`)"
                        height="150"
                        contain
                    />
                
            </v-card-title>

            <v-spacer></v-spacer>

            <v-card-text class="headline font-weight-bold">
                <v-layout column>
                <span class="title font-weight-light">{{ name }}</span>
                {{ value | addUnits(units) }}
                </v-layout>
            </v-card-text>
        </v-card>
        </v-flex>
</template>

<script>
export default {
    name: 'Ingredient',
    props: {
        name: {
            type: String,
            required: true
        },
        value: {
            type: Number,
            required: true
        },
        units: {
            type: String,
            required: true
        }
    },
    filters: {
        addUnits(v, units) {
            return `${v} (${units})`
        }
    }
}
</script>

<style>

</style>
