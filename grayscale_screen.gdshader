shader_type canvas_item;
uniform sampler2D screen: hint_screen_texture;

void fragment() {
	vec4 screenSpace = texture(screen, SCREEN_UV);
	vec3 gray = vec3(screenSpace.r * 0.299 + screenSpace.g * 0.587 +screenSpace.b * 0.114);
	COLOR = vec4(gray, screenSpace.a);
}
