shader_type canvas_item;

uniform sampler2D gradientTexture;
uniform sampler2D  screenTexture: hint_screen_texture, filter_nearest;

void fragment() {
	vec4 preGradient = texture(TEXTURE, UV);
	vec4 original = texture(gradientTexture, UV);
	vec3 gray = vec3(preGradient.r*0.299 + preGradient.g*0.587 +preGradient.b * 0.114);

	COLOR = vec4((gray * original.xyz).xyz, preGradient.a);
}
