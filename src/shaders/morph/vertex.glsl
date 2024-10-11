uniform float uMorphFactor;
uniform float uTime;
attribute vec3 torusPosition;
attribute vec3 lemniscatePosition;

varying vec3 vNormal;

void main() {
    //for time based morph
    //float morphFactor = (sin(uTime * 3.14) + 1.0) / 2.0;
    vec3 morphedPosition = mix(torusPosition, lemniscatePosition, uMorphFactor);
    vec4 modelPosition = modelMatrix * vec4(morphedPosition , 1.0);
    gl_Position = projectionMatrix * viewMatrix * modelPosition;
    
    // Interpolate normals
     vNormal = normalize(normalMatrix * normal);
}