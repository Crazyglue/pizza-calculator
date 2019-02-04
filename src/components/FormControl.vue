<template>
    <v-container fluid pt-0 pb-0>
        <v-layout column  pt-2>
            
            <v-flex xs12>
                <v-layout class="subheading" align-center justify-center>
                    <slot name="title" />
                    <v-tooltip bottom v-if="$slots.tooltip" class="tooltip__wrapper">
                        <v-icon
                            small
                            slot="activator"
                            color="secondary"
                            dark
                        >
                            mdi-help-circle
                        </v-icon>
                        <slot name="tooltip" />
                    </v-tooltip>
                </v-layout>
            </v-flex>

            <v-flex xs12>
                <v-layout align-center justify-space-between row fill-height>
                    <v-btn 
                        fab 
                        small 
                        @click="$emit('click', (-1 * incrementAmount))" 
                        dark 
                        color="light-green"
                        :disabled="minDisabled"
                    >
                        <v-icon dark>mdi-minus</v-icon>
                    </v-btn>
                    <span class="display-1">
                        <slot />
                    </span>
                    <v-btn 
                        fab 
                        small 
                        @click="$emit('click', incrementAmount)" 
                        dark 
                        color="light-green"
                        :disabled="maxDisabled"
                    >
                        <v-icon dark>mdi-plus</v-icon>
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

.tooltip__wrapper {
    margin-left: 0.25em;
}
</style>
