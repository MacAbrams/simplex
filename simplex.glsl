float rand(vec2 st) {
    return fract(sin(dot(st.xy,
                         vec2(12.9898,78.233)))*
        43758.5453123);
}
vec2 rand2(vec2 st){
  st=  vec2(dot(st,vec2(238.231,561.23)),dot(st,vec2(-253.123,486.239)) );
  
  return (-1.0 + 2.0*fract(sin(st)*43758.5453123))/sqrt(2.);
  
}
const float pi = 3.14159265358979323846;
float mi(float a){

    return a*a*(3.-2.*a);
    //return cos(a/sqrt(3.)*pi*2.)/2.+0.5;
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

    vec2 la = sf;
    vec2 lb = sf-vec2(1.-sqrt(3.)/4.,sqrt(3.)/2.);
    vec2 lc = sf-(f.x<f.y?vec2(-sqrt(3.)/4.,sqrt(3.)/2.):vec2(1.,0.));
    // vec3 a = vec3(1.,0.,0.);
    // vec3 b = vec3(0.,1.,0.);
    // vec3 c = vec3(0.,0.,1.);
    vec2 a = rand2(al);
    vec2 b = rand2(bl);
    vec2 c = rand2(cl);
    //vec2 g = a*mi(length(la))+b*mi(length(lb))+c*mi(length(lc));
    vec3 w;
    w.x = dot(la,la);
    w.y = dot(lb,lb);
    w.z = dot(lc,lc);

    w *= w;
    w *= w;
    vec3 d;
    
    d.x = dot(a,la);
    d.y = dot(b,lb);
    d.z = dot(c,lc);
    d *= w;

    vec3 v = vec3(d.x+d.y+d.z);
    //vec3 v = a*mi(la)+b*mi(lb)+c*mi(lc);
    // if(mod(al.x,2.)==1.){
    //     v = a*lb;
    // }
    // if(mod(al.y,2.)==mod(al.x,2.)){
    //     v = a*lc;//+vec3(0.,1.,0.)*(sqrt(3.)/2.-lc);
    // }

    //a = normalize(uv-vec2(5.));
    //t= rand2(vec2(0.));
    //v = vec3(dot(t,a)*mi(length(uv-vec2(5.)))+0.5);

    col = vec3(v)*2.;


    gl_FragColor = vec4(col,1.);
}