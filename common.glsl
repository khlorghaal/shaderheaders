//khlors header github.com/khlorghaal/shaderheaders
//WTF license

//Define-Switches
#define SHADERTOY
#define GLES

#ifdef SHADERTOY
	//shadertoy includes anything conforming to shadertoy api
	#define  res      (iResolution.xy)
	#define ires ivec2(iResolution.xy)
	#define mouse ((iMouse.xy-res/2.)/(res*2.))
	#define mouse_ang (mouse*TAU)
	#define time float(iTime)

	#define MAIN void mainImage(out vec4 col, in vec2 _fc)
	#define INIT_UV \
		vec2 uv= _fc/res;\
		vec2 uvn= nmaps(uv);\
		vec2 p= uvn*vec2(asp,1.);
#endif

//Consts
const float PI=  3.14159265359;
const float TAU= (PI*2.);
const float PHI= 1.61803399;
const float DEG2RAD= 0.01745329251;
const float  SQRT2=    sqrt(2.);
const float RSQRT2= 1./SQRT2;
const float BIG= 1e8;
const float ETA= 1e-4;
#define eqf(a,b) ( abs((a)-(b))<ETA )

//Aliases
#define fc (gl_FragCoord.xy)
#define aspect (res.x/res.y)
#define asp aspect
#define aspinv (1./aspect)
#define vec1 float
#define ivec1 int
#define uvec1 uint
#define len length
#define lerp mix
#define norm normalize
#define sat  saturate
#define sats saturate_signed
#define smooth(x) smoothstep(0.,1.,x)
#define tex texture
#define re return


vec4   srgb(vec4 c){ re pow(c,vec4(   2.2)); }//technically inaccurate
vec4 unsrgb(vec4 c){ re pow(c,vec4(1./2.2)); }
vec4 texsrgb(sampler2D s,   vec2 uv){ re unsrgb(texture(s,uv)); }
vec4 texsrgb(samplerCube s, vec3  r){ re unsrgb(texture(s, r)); }

vec2 mods(vec2 x, vec1 y){ re mod(x,vec2(y));}
vec3 mods(vec3 x, vec1 y){ re mod(x,vec3(y));}
vec4 mods(vec4 x, vec1 y){ re mod(x,vec4(y));}

vec2 pows(vec2 x, vec1 y){ re pow(x,vec2(y));}
vec3 pows(vec3 x, vec1 y){ re pow(x,vec3(y));}
vec4 pows(vec4 x, vec1 y){ re pow(x,vec4(y));}

 vec2 clamps( vec2 x,  vec1 min,  vec1 max){ re clamp(x,  vec2(min), vec2(max));}
 vec3 clamps( vec3 x,  vec1 min,  vec1 max){ re clamp(x,  vec3(min), vec3(max));}
 vec4 clamps( vec4 x,  vec1 min,  vec1 max){ re clamp(x,  vec4(min), vec4(max));}
ivec2 clamps(ivec2 x, ivec1 min, ivec1 max){ re clamp(x, ivec2(min),ivec2(max));}
ivec3 clamps(ivec3 x, ivec1 min, ivec1 max){ re clamp(x, ivec3(min),ivec3(max));}
ivec4 clamps(ivec4 x, ivec1 min, ivec1 max){ re clamp(x, ivec4(min),ivec4(max));}

 vec2 mins( vec2 v,  vec1 s){ re min(v,  vec2(s));}
 vec3 mins( vec3 v,  vec1 s){ re min(v,  vec3(s));}
 vec4 mins( vec4 v,  vec1 s){ re min(v,  vec4(s));}
 vec2 maxs( vec2 v,  vec1 s){ re max(v,  vec2(s));}
 vec3 maxs( vec3 v,  vec1 s){ re max(v,  vec3(s));}
 vec4 maxs( vec4 v,  vec1 s){ re max(v,  vec4(s));}
 vec2 mins( vec1 s,  vec2 v){ re min(v,  vec2(s));}
 vec3 mins( vec1 s,  vec3 v){ re min(v,  vec3(s));}
 vec4 mins( vec1 s,  vec4 v){ re min(v,  vec4(s));}
 vec2 maxs( vec1 s,  vec2 v){ re max(v,  vec2(s));}
 vec3 maxs( vec1 s,  vec3 v){ re max(v,  vec3(s));}
 vec4 maxs( vec1 s,  vec4 v){ re max(v,  vec4(s));}
ivec2 mins(ivec2 v, ivec1 s){ re min(v, ivec2(s));}
ivec3 mins(ivec3 v, ivec1 s){ re min(v, ivec3(s));}
ivec4 mins(ivec4 v, ivec1 s){ re min(v, ivec4(s));}
ivec2 maxs(ivec2 v, ivec1 s){ re max(v, ivec2(s));}
ivec3 maxs(ivec3 v, ivec1 s){ re max(v, ivec3(s));}
ivec4 maxs(ivec4 v, ivec1 s){ re max(v, ivec4(s));}
ivec2 mins(ivec1 s, ivec2 v){ re min(v, ivec2(s));}
ivec3 mins(ivec1 s, ivec3 v){ re min(v, ivec3(s));}
ivec4 mins(ivec1 s, ivec4 v){ re min(v, ivec4(s));}
ivec2 maxs(ivec1 s, ivec2 v){ re max(v, ivec2(s));}
ivec3 maxs(ivec1 s, ivec3 v){ re max(v, ivec3(s));}
ivec4 maxs(ivec1 s, ivec4 v){ re max(v, ivec4(s));}

float maxv( vec2 a){ re                 max(a.x,a.y)  ;}
float maxv( vec3 a){ re         max(a.z,max(a.x,a.y)) ;}
float maxv( vec4 a){ re max(a.w,max(a.z,max(a.x,a.y)));}
float minv( vec2 a){ re                 min(a.x,a.y)  ;}
float minv( vec3 a){ re         min(a.z,min(a.x,a.y)) ;}
float minv( vec4 a){ re min(a.w,min(a.z,min(a.x,a.y)));}
  int maxv(ivec2 a){ re                 max(a.x,a.y)  ;}
  int maxv(ivec3 a){ re         max(a.z,max(a.x,a.y)) ;}
  int maxv(ivec4 a){ re max(a.w,max(a.z,max(a.x,a.y)));}
  int minv(ivec2 a){ re                 min(a.x,a.y)  ;}
  int minv(ivec3 a){ re         min(a.z,min(a.x,a.y)) ;}
  int minv(ivec4 a){ re min(a.w,min(a.z,min(a.x,a.y)));}

int doti(ivec2 a, ivec2 b){ re a.x*b.x + a.y*b.y; }
int doti(ivec3 a, ivec3 b){ re a.x*b.x + a.y*b.y + a.z*b.z; }
int doti(ivec4 a, ivec4 b){ re a.x*b.x + a.y*b.y + a.z*b.z + a.w*b.w; }

//hacky shite
int sqrti(int x){re int(sqrt(float(x)));}
int cbrti(int x){re int( pow(float(x),1./3.));}

//normalized-map to signed  [0,1]->[-1,1]
vec1 nmaps(vec1 x){ re x*2.-1.; }
vec2 nmaps(vec2 x){ re x*2.-1.; }
vec3 nmaps(vec3 x){ re x*2.-1.; }
vec4 nmaps(vec4 x){ re x*2.-1.; }
//normalized-map to unsigned  [-1,1]->[0,1]
vec1 nmapu(vec1 x){ re x*.5+.5; }
vec2 nmapu(vec2 x){ re x*.5+.5; }
vec3 nmapu(vec3 x){ re x*.5+.5; }
vec4 nmapu(vec4 x){ re x*.5+.5; }

//waves [0,1]
float saww(float x){ re mod(x,1.); }
float triw(float x){ re abs( mod(x,2.) -1.); }
  int triw(int x, int a){ re abs( abs(x%(a*2))-a ); }
float sqaw(float x){ re step(.5,fract(x)); }

float sum ( vec2 v){ re dot(v,vec2(1));}
float sum ( vec3 v){ re dot(v,vec3(1));}
float sum ( vec4 v){ re dot(v,vec4(1));}
  int sum (ivec2 v){ re v.x+v.y;}
  int sum (ivec3 v){ re v.x+v.y+v.z;}
  int sum (ivec4 v){ re v.x+v.y+v.z+v.w;}
float prod( vec2 v){ re v.x*v.y;}//product
float prod( vec3 v){ re v.x*v.y*v.z;}
float prod( vec4 v){ re v.x*v.y*v.z*v.w;}
  int prod(ivec2 v){ re v.x*v.y;}
  int prod(ivec3 v){ re v.x*v.y*v.z;}
  int prod(ivec4 v){ re v.x*v.y*v.z*v.w;}

#define sqrtabs(x) sqrt(abs(x))
#define powabs(x,p) pow(abs(x),p)

vec1 saturate(vec1 x){ re clamp (x, 0.,1.);}
vec2 saturate(vec2 x){ re clamps(x, 0.,1.);}
vec3 saturate(vec3 x){ re clamps(x, 0.,1.);}
vec4 saturate(vec4 x){ re clamps(x, 0.,1.);}
#define lerpsat(a,b,x) lerp(a,b,saturate(x))

vec1 saturate_signed(vec1 x){ re clamp (x, -1.,1.);}
vec2 saturate_signed(vec2 x){ re clamps(x, -1.,1.);}
vec3 saturate_signed(vec3 x){ re clamps(x, -1.,1.);}
vec4 saturate_signed(vec4 x){ re clamps(x, -1.,1.);}

#define smoother(x) (x*x*x * (x*(x*6.-15.)+10.) )


float pow2i(int x){ re float(1<<x); }

//nearest power of 2
int npo2(float x){ re int(log2(x)); }
int npo3(float x){ re int(log(x)/log(3.)); }

float angle(vec2 v){ re atan(v.y,v.x); }
vec1 angn(vec1 t){ re t-ceil(t/TAU-.5)*TAU; }//angle-normalize
vec2 angn(vec2 t){ re t-ceil(t/TAU-.5)*TAU; }

bool real(vec1 x){ re !( isnan(x)||isinf(x) ); }
bool real(vec2 x){ re real(prod(x)); }
bool real(vec3 x){ re real(prod(x)); }
bool real(vec4 x){ re real(prod(x)); }
vec1 rationalize(vec1 x){ re real(x)? x:vec1(0.); }
vec2 rationalize(vec2 x){ re real(x)? x:vec2(0.); }
vec3 rationalize(vec3 x){ re real(x)? x:vec3(0.); }
vec4 rationalize(vec4 x){ re real(x)? x:vec4(0.); }

#define range( _n)    for(int n= 0; n!=_n; n++)
#define range2(_n,_p) for(int n=_n; n!=_p; n++)

//im not sure if this is linear or srgb, or if that even matters much
#define LUMVEC vec3(0.2126, 0.7152, 0.0722)
float lum(vec3 c){ re dot(c,vec3(LUMVEC)); }

#define BLACK  vec3(0.,0.,0.)
#define RED    vec3(1.,0.,0.)
#define GREEN  vec3(0.,1.,0.)
#define BLUE   vec3(0.,0.,1.)
#define YELLOW vec3(1.,1.,0.)
#define CYAN   vec3(0.,1.,1.)
#define PURPLE vec3(1.,0.,1.)
#define WHITE  vec3(1.,1.,1.)

#define I32_MAX     0x7FFFFFFF
#define I16_MAX 0x00010000
#define I32_MAXF     float(INT_MAX)
#define I16_MAXF float(I16_MAX)
vec1 unfix16(ivec1 x){ re vec1(x)/I16_MAXF; }
vec2 unfix16(ivec2 x){ re vec2(x)/I16_MAXF; }
vec3 unfix16(ivec3 x){ re vec3(x)/I16_MAXF; }
vec4 unfix16(ivec4 x){ re vec4(x)/I16_MAXF; }
ivec1 fixed16(vec1 x){ re ivec1(I16_MAXF*x); }
ivec2 fixed16(vec2 x){ re ivec2(I16_MAXF*x); }
ivec3 fixed16(vec3 x){ re ivec3(I16_MAXF*x); }
ivec4 fixed16(vec4 x){ re ivec4(I16_MAXF*x); }

ivec4 hash(ivec4 x){ //murmur
	x*= 0xcc9e2d51;
    x^=(x<<15)|(x>>17);
    x*= 0x1b873593;
	re x;
}
//[-max,+max]->[0,1]
vec1 hashf(vec1 x){ re abs(vec1(hash(ivec4(fixed16(x),0.,0.,0.)).x  ))/I32_MAXF; }
vec2 hashf(vec2 x){ re abs(vec2(hash(ivec4(fixed16(x),0.,0.   )).xy ))/I32_MAXF; }
vec3 hashf(vec3 x){ re abs(vec3(hash(ivec4(fixed16(x),0.      )).xyz))/I32_MAXF; }
vec4 hashf(vec4 x){ re abs(vec4(hash(ivec4(fixed16(x)         ))    ))/I32_MAXF; }

//kinda suck but okay
#define R2A vec2(.99231, .9933)//should probably be replaced with xors
#define R2B vec2(.99111, .9945)
#define R3A vec3(.99312, .98313, .9846)
#define R3B vec3(.99111, .98414, .9935)
#define R4A vec4(.99412, .99343, .99565, .99473)
#define R4B vec4(.99612, .99836, .99387, .99376)
//n->n
vec1 rand (vec1 x){ re hashf(x);   }
vec2 rand (vec2 x){ re hashf(     x*hashf(    x+x.yx       )); }
vec3 rand (vec3 x){ re hashf(1.e2*x*hashf(R3A+x+x.yzx+x.zxy)); }
vec4 rand (vec4 x){ re hashf(     x*hashf(    x+x.yzwx+x.zwxy+x.wxyz)); }
//n->1
vec1 rand1(vec2 x){ re hashf(dot(x*R2A-R2B,-x*R2B+R2A)/x.x);  }
vec1 rand1(vec3 x){ re hashf(dot(x+R3A-R3B,-x+R3B+R3A));  }
vec1 rand1(vec4 x){ re hashf(dot(x+R4A-R4B,-x+R4B+R4A));  }
//1->n
vec2 rand2(vec1 x){ re hashf(x+R2A);   }
vec3 rand3(vec1 x){ re hashf(x+R3A);   }

float bilerp(
	float nn, float np,
	float pn, float pp,
	vec2 l
){
	vec2 lx= lerp(
		vec2(nn,np),
		vec2(pp,pp),
		l.x);
	re lerp(lx.x,lx.y,l.y);
}
vec2 bilerp(
	vec2 nn, vec2 np,
	vec2 pn, vec2 pp,
	vec2 l
){
	vec4 lx= lerp(
		vec4(nn,np),
		vec4(pp,pp),
		l.xxxx);
	re lerp(lx.xy,lx.zw,l.yy);
}

//value noise
float vnse(vec1 x){ re lerp(rand(floor(x)),rand(ceil(x)),fract(x)); }
float vnse(vec2 p){
	vec2 fr= fract(p);
	vec2 f= floor(p);
	vec2 c= ceil(p);
	float nn= rand1(vec2(f.x,f.y));
	float np= rand1(vec2(f.x,c.y));
	float pn= rand1(vec2(c.x,f.y));
	float pp= rand1(vec2(c.x,c.y));
	vec4 v= vec4(nn,np,pn,pp);
	vec2 lx= lerp(v.xy,v.zw, fr.xx);
	re lerp( lx.x,lx.y, fr.y );
}
float vnse(vec3 p){
	vec3 fr= fract(p);
	vec3 f= floor(p);
	vec3 c= ceil(p);
	float nnn= rand1(vec3(f.x,f.y,f.z));
	float nnp= rand1(vec3(f.x,f.y,c.z));
	float npn= rand1(vec3(f.x,c.y,f.z));
	float npp= rand1(vec3(f.x,c.y,c.z));
	float pnn= rand1(vec3(c.x,f.y,f.z));
	float pnp= rand1(vec3(c.x,f.y,c.z));
	float ppn= rand1(vec3(c.x,c.y,f.z));
	float ppp= rand1(vec3(c.x,c.y,c.z));
	vec4 zn= vec4(
		nnn,
		npn,
		pnn,
		ppn
	);
	vec4 zp= vec4(
		nnp,
		npp,
		pnp,
		ppp
	);
	vec4 lx= lerp(zn,zp, fr.zzzz);
	vec2 ly= lerp(lx.xz, lx.yw, fr.yy);
	re lerp(ly.x,ly.y, fr.x);
}

float perlin(float p){
	float fr= fract(p);
	float frn= fr-1.;
	float f= floor(p);
	float c= ceil(p);
	float a= nmaps(rand(f));
	float b= nmaps(rand(c));
	re lerp(a,b,smooth(fr));
}
float perlin(vec3 p){ //eschew dimension>2 for textures
	vec3 fr= fract(p);
	vec3 frn= fr-1.;
	vec3 f= floor(p);
	vec3 c= ceil(p);
	vec3 nnn= nmaps(rand(vec3(f.x,f.y,f.z)));
	vec3 nnp= nmaps(rand(vec3(f.x,f.y,c.z)));
	vec3 npn= nmaps(rand(vec3(f.x,c.y,f.z)));
	vec3 npp= nmaps(rand(vec3(f.x,c.y,c.z)));
	vec3 pnn= nmaps(rand(vec3(c.x,f.y,f.z)));
	vec3 pnp= nmaps(rand(vec3(c.x,f.y,c.z)));
	vec3 ppn= nmaps(rand(vec3(c.x,c.y,f.z)));
	vec3 ppp= nmaps(rand(vec3(c.x,c.y,c.z)));
	float d_nnn= dot(nnn, vec3(fr .x, fr .y, fr .z));
	float d_nnp= dot(nnp, vec3(fr .x, fr .y, frn.z));
	float d_npn= dot(npn, vec3(fr .x, frn.y, fr .z));
	float d_npp= dot(npp, vec3(fr .x, frn.y, frn.z));
	float d_pnn= dot(pnn, vec3(frn.x, fr .y, fr .z));
	float d_pnp= dot(pnp, vec3(frn.x, fr .y, frn.z));
	float d_ppn= dot(ppn, vec3(frn.x, frn.y, fr .z));
	float d_ppp= dot(ppp, vec3(frn.x, frn.y, frn.z));
	vec4 zn= vec4(
		d_nnn,
		d_npn,
		d_pnn,
		d_ppn
	);
	vec4 zp= vec4(
		d_nnp,
		d_npp,
		d_pnp,
		d_ppp
	);
	vec4 lx= lerp(zn,zp, smooth(fr.zzzz));
	vec2 ly= lerp(lx.xz, lx.yw, smooth(fr.yy));
	re nmapu(lerp(ly.x,ly.y, smooth(fr.x)));
}


//value noise smooth vector, smooth distinct from lerped
vec2 vnsesv(vec2 p){
	vec2 fr= fract(p);
	vec2 frn= fr-1.;
	vec2 f= floor(p);
	vec2 c= ceil(p);
	vec2 nn= rand(vec2(f.x,f.y));
	vec2 np= rand(vec2(f.x,f.y));
	vec2 pn= rand(vec2(f.x,c.y));
	vec2 pp= rand(vec2(f.x,c.y));

	re bilerp(nn,np,pn,pp, smooth(fr));
}
vec3 vnsesv(vec3 p){
	vec3 fr= fract(p);
	vec3 frn= fr-1.;
	vec3 f= floor(p);
	vec3 c= ceil(p);
	vec3 nnn= rand(vec3(f.x,f.y,f.z));
	vec3 nnp= rand(vec3(f.x,f.y,c.z));
	vec3 npn= rand(vec3(f.x,c.y,f.z));
	vec3 npp= rand(vec3(f.x,c.y,c.z));
	vec3 pnn= rand(vec3(c.x,f.y,f.z));
	vec3 pnp= rand(vec3(c.x,f.y,c.z));
	vec3 ppn= rand(vec3(c.x,c.y,f.z));
	vec3 ppp= rand(vec3(c.x,c.y,c.z));

	re trilerp(nnn,nnp,npn,npp,pnn,pnp,ppn,ppp, smooth(fr));
}


float worley(vec3 c){
    float acc= 1.;
    vec3 cfl= floor(c);
    vec3 cfr= fract(c);
    for(int i=-1; i<=1; i++){
    for(int j=-1; j<=1; j++){
    for(int k=-1; k<=1; k++){
        vec3 g= vec3(i,j,k)+cfl;
        vec3 p= rand(g)+g;
        float l= len(p-c);
        acc= min(acc,l);
    }}}
	re acc;
}

#define dFdxy1(x) vec2( dFdx(  x),dFdy(  y) )
#define dFdxy2(v) vec2( dFdx(v.x),dFdy(v.y) )

// O(3) avoid
#define grad2(f,x) \
	((vec2( \
    	f(x+vec2(ETA,0)), \
		f(x+vec2(0,ETA)) \
	  )-f(x))/ETA)
#define grad3(f,x) \
	((vec3( \
    	f(x+vec3(ETA,0,0)), \
		f(x+vec3(0,ETA,0)), \
		f(x+vec3(0,0,ETA)) \
	  )-f(x))/ETA)
#define gradnorm2(f,x)  \
	norm(vec3(grad2(f,x),1.))
#define gradnorm3(f,x)  \
	norm(grad3(f,x))

mat2 rot2d(float t){
    float c= cos(t);
    float s= sin(t);
    re mat2(
        c,-s,
        s, c
    );
    
}
mat3 rotx(float t){
    float c= cos(t);
    float s= sin(t);
    re mat3(
        1, 0, 0,
        0, c,-s,
        0, s, c
    );
}
mat3 roty(float t){
    float c= cos(t);
    float s= sin(t);
    re mat3(
         c,0,s,
         0,1,0,
    	-s,0,c
    );
}
mat3 rotz(float t){
    float c= cos(t);
    float s= sin(t);
    re mat3(
        c,-s,0,
        s, c,0,
    	0, 0,1
    );
}

//azimuth, inclination
vec3 azincl(vec2 a){
    a.x+= PI/2.;
    vec2 s= sin(a);//sin theta, sin phi
    vec2 c= cos(a);//cos theta, cos phi
    vec3 ret= vec3(c.x,s);
    ret.xy*= c.y;
    re ret;
}

//versor from axis-angle
vec4 vrsr(vec3 w){
	//i dont understand quats but can copypaste them
    w.z*= -1.;
	vec3 wn= norm(w);
    float th2= len(w)/2.;
    re vec4(sin(th2)*wn,cos(th2));
}
vec3 rot(vec3 v, vec3 w){
	vec4 q= vrsr(w);
	re v + 2.*cross(cross(v, q.xyz) + q.w*v, q.xyz);
}

struct ray{
	vec3 a;//*
    vec3 c;//+
};

//globals for cameras
float fov= 80.;
float near= .0;

ray look_persp(vec2 uvn, vec2 a){
	ray o;
	float fov_s= tan(deg2rad*.5*fov);
    o.a= norm( roty(a.x) * rotx(-a.y) * vec3(uvn*fov_s,1.));
    o.c= o.a*near;
    re o;
}
ray look_orbit(vec2 uvn, vec2 a, float d){
    ray o;
	float fov_s= tan(deg2rad*.5*fov);
    mat3x3 mat= roty(a.x) * rotx(-a.y);
    o.a= norm( mat * vec3(uvn*fov_s,1.));
    o.c= mat[2]*-d + o.a*near;
	re o;
}
