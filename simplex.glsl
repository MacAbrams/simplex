void main(){
    vec2 uv = gl_FragCoord.xy/iResolution.xy;
    uv.x*= iResolution.x/iResolution.y;
    uv*=10.;
    vec3 col = vec3(0.);
    vec2 t = vec2(uv.x+uv.y/2.,uv.y*2./sqrt(3.));
    vec2 f = fract(t);
    vec2 al = floor(t);
    vec2 bl = al+vec2(1.);
    vec2 cl = al+(f.x>f.y?vec2(1.,0.):vec2(0.,1.));
    col = vec3(f,f.x>f.y);

    gl_FragColor = vec4(col,1.);
}