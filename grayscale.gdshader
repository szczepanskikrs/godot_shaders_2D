shader_type canvas_item;

void fragment() {
	vec4 original = texture(TEXTURE,UV);
	vec3 gray = vec3(original.r * 0.299 + original.g * 0.587 +original.b * 0.114);
	COLOR = vec4(gray, original.a);
}
