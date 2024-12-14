shader_type canvas_item;

group_uniforms Textures;
uniform sampler2D mainNoise: repeat_enable;
uniform sampler2D frontNoise: repeat_enable;
uniform sampler2D screen: hint_screen_texture;

group_uniforms Color;
uniform vec4 foamTopColor: source_color;
uniform vec4 foamBottomColor: source_color;
uniform float redRatio: hint_range(0.0, 1.0, 0.1) = 0.25;
uniform float greenRatio: hint_range(0.0, 1.0, 0.1) = 0.55;
uniform float blueRation: hint_range(0.0, 1.0, 0.1) = 1.0;

group_uniforms Scrolling;
uniform float strength: hint_range(0.0, 0.25, 0.001);
uniform vec2 offset = vec2(0.02);
uniform float foamBottomRatio: hint_range(0.0, 0.5, 0.1) = 0.1;
uniform float foam: hint_range(0.0, 1.0, 0.01) = 0.1;

void fragment() {
	vec2 sinScrollNormalized = offset * (sin(TIME)+1.0) * 0.5;
	vec2 timeScroll = -offset * TIME;
	vec4 mainNoiseScrolled = texture(mainNoise, UV + sinScrollNormalized);
	vec4 frontNoiseScrolled = texture(frontNoise, UV+timeScroll);
	float noise = mainNoiseScrolled.g * frontNoiseScrolled.g;
	vec4 original = texture(screen,SCREEN_UV + (noise * strength));
	if(foam > noise ){
		COLOR = foamTopColor;
	}
	else if(foam > noise - foamBottomRatio){
		COLOR = foamBottomColor;
	}
	else {
		COLOR = vec4(original.r * redRatio, original.g * greenRatio, original.b * blueRation, original.a);
	}
}
