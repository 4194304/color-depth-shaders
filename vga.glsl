#version 330 core

// Constants
const int NUM_COLORS = 16;  // Number of colors in the palette

// Define the 16-color palette in RGB format
const vec3 palette[NUM_COLORS] = vec3[](
    vec3(1.0, 0.0, 0.0),      // Red
    vec3(0.0, 1.0, 0.0),      // Green
    vec3(0.0, 0.0, 1.0),      // Blue
    vec3(1.0, 1.0, 0.0),      // Yellow
    vec3(0.0, 1.0, 1.0),      // Cyan
    vec3(1.0, 0.0, 1.0),      // Magenta
    vec3(0.5, 0.0, 0.0),      // Dark Red
    vec3(0.0, 0.5, 0.0),      // Dark Green
    vec3(0.0, 0.0, 0.5),      // Dark Blue
    vec3(0.5, 0.5, 0.0),      // Olive
    vec3(0.0, 0.5, 0.5),      // Teal
    vec3(0.5, 0.0, 0.5),      // Purple
    vec3(1.0, 1.0, 1.0),      // White
    vec3(0.75, 0.75, 0.75),   // Silver
    vec3(0.5, 0.5, 0.5),      // Gray
    vec3(0.0, 0.0, 0.0)       // Black
);

// Uniforms
in vec2 texcoord;
uniform float opacity;
uniform sampler2D tex;

// Function to clamp values
#define saturate(v) clamp(v, 0.0, 1.0)

// Function to find the closest color in the palette by comparing normalized RGB values
vec3 get_closest_palette_color(vec3 color) {
    float min_dist = 1e10;
    vec3 closest_color = palette[0];

    // Loop through each color in the palette and find the closest match
    for (int i = 0; i < NUM_COLORS; i++) {
        // Direct RGB comparison using Euclidean distance
        float dist = length(color - palette[i]);
        if (dist < min_dist) {
            min_dist = dist;
            closest_color = palette[i];
        }
    }

    return closest_color;
}

// Main shader function that applies the closest palette color mapping
vec4 window_shader() {
    // Fetch the texture color at the given coordinates
    vec4 color = texelFetch(tex, ivec2(texcoord), 0) * opacity;

    // Normalize the RGB color (assuming it's in the [0, 1] range already)
    // If your color is in the [0, 255] range, you'd want to divide by 255
    vec3 normalized_color = color.rgb;

    // Find the closest match to the palette color
    vec3 closest_palette_color = get_closest_palette_color(normalized_color);

    // Return the closest palette color with the original alpha
    return vec4(closest_palette_color, color.a);
}
