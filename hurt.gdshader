shader_type canvas_item;
uniform float flashPercentage:hint_range(0.0, 1.0,0.01) = 0.01;

void fragment() {
	vec4 white = vec4(1.0);
	vec4 currentColor = texture(TEXTURE,UV);
	COLOR = mix(currentColor, white, flashPercentage);
	COLOR.a = currentColor.a;
}
