<template>
    <v-container fluid pt-0 pb-0>
        <v-layout column pb-2 pt-2>
            
            <v-flex xs12>
                <span class="subheading"><slot name="title" /></span>
            </v-flex>

            <v-flex xs12>
                <v-layout align-center justify-space-between row fill-height>
                    <v-btn 
                        fab 
                        large 
                        @click="$emit('click', (-1 * incrementAmount))" 
                        dark 
                        color="light-green"
                        :disabled="minDisabled"
                    >
                        <v-icon dark>remove</v-icon>
                    </v-btn>
                    <span class="display-1">
                        <slot />
                    </span>
                    <v-btn 
                        fab 
                        large 
                        @click="$emit('click', incrementAmount)" 
                        dark 
                        color="light-green"
                        :disabled="maxDisabled"
                    >
                        <v-icon dark>add</v-icon>
                    </v-btn>
                </v-layout>
            </v-flex>

        </v-layout>
    </v-container>
</template>

<script>
export default {
    name: 'FormControl',
    props: {
        incrementAmount: {
            type: Number,
            required: true
        },
        minDisabled: {
            type: Boolean,
            required: true
        },
        maxDisabled: {
            type: Boolean,
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
