shader_type canvas_item;

uniform sampler2D noiseTexture;
uniform float disolvePercentage:hint_range(0.0, 1.0, 0.1) = 0;

void fragment() {
	vec4 original = texture(TEXTURE, UV);
	vec4 noise = texture(noiseTexture, UV);
	float alfa = original.a;
	
	if(noise.b > disolvePercentage){
		alfa = 0.0;
	}
	
	COLOR = vec4(original.rgb, alfa);
}
