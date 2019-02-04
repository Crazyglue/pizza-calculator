<template>
    <v-flex sm3 xs6 pl-1 pt-1 pr-1>
        <v-card
            space-between
            class="mx-auto"
            color="#388E3C"
            dark
            pt-1
        >           
            <v-card-title >
                <span class="title font-weight-light">{{ name }}</span>    
            </v-card-title> 
            <v-card-title>
                    <v-img
                        :src="require(`../assets/${name.toLowerCase()}.svg`)"
                        height="80"
                        contain
                    />
                
            </v-card-title>

            <v-card-text class="headline font-weight-bold ingredient__text">
                
                    <span>{{ value }}</span>
                    <span class="font-weight-light">{{ units }}</span>
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

<style scoped>
svg {
    fill: #ffffff;
    stroke: #fff;
}
.ingredient__text {
    padding-top: 0px;
}
</style>
