float rand(vec2 st) {
    return fract(sin(dot(st.xy,
                         vec2(12.9898,78.233)))*
        43758.5453123);
}
const float pi = 3.14159265358979323846;
float mi(float a){

    return cos(a/sqrt(3.)*pi*2.)/2.+0.5;
}

void main(){
    vec2 uv = gl_FragCoord.xy/iResolution.xy;
    uv.x*= iResolution.x/iResolution.y;
    uv*=10.;
    vec3 col = vec3(0.);
    vec2 t = vec2(uv.x+uv.y/2.,uv.y*2./sqrt(3.));
    vec2 f = fract(t);
    vec2 al = floor(t);
    vec2 bl = al+vec2(1.);
    vec2 cl = al+(f.x<f.y?vec2(0.,1.):vec2(1.,0.));
    vec2 sf = vec2(f.x-f.y*sqrt(3.)/4.,f.y*sqrt(3.)/2.);

    float la = length(sf);
    float lb = length(sf-vec2(1.-sqrt(3.)/4.,sqrt(3.)/2.));
    float lc = length(sf-(f.x<f.y?vec2(-sqrt(3.)/4.,sqrt(3.)/2.):vec2(1.,0.)));
    // vec3 a = vec3(1.,0.,0.);
    // vec3 b = vec3(0.,1.,0.);
    // vec3 c = vec3(0.,0.,1.);
    vec3 a = vec3(rand(al));
    vec3 b = vec3(rand(bl));
    vec3 c = vec3(rand(cl));
    vec3 v = a*mi(la)+b*mi(lb)+c*mi(lc);
    // if(mod(al.x,2.)==1.){
    //     v = a*lb;
    // }
    // if(mod(al.y,2.)==mod(al.x,2.)){
    //     v = a*lc;//+vec3(0.,1.,0.)*(sqrt(3.)/2.-lc);
    // }


    col = vec3(v);


    gl_FragColor = vec4(col,1.);
}