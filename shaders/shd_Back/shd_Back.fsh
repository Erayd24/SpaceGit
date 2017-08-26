
varying vec2 texCoord;
varying vec4 v_vColour;

void main(){
    vec4 color = vec4(texCoord.x, texCoord.y, 0.5, 1);
    
    gl_FragColor = color * texture2D(gm_BaseTexture, texCoord);
}

