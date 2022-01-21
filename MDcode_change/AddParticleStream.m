function [ output_args ] = AddParticleStream(num, x0, y0, z0, PartAng, Type, Ep, Seper)
global AtomSpacing x y z AtomType Vx Vy Vz Mass0 Mass1 Mass2 nAtoms

if Type == 0
    Mass = Mass0;
elseif Type ==1
    Mass = Mass2;
else
    Mass = Mass1;
end

for p = 0:num - 1
    nAtoms = nAtoms + 1;
    x(nAtoms) = x0 * AtomSpacing - Seper * p * AtomSpacing * cos(PartAng);
    y(nAtoms) = y0 * AtomSpacing - Seper * p * AtomSpacing * sin(PartAng);
    z(nAtoms) = z0 * AtomSpacing - Seper * p * AtomSpacing * (sin(PartAng)^2);
    AtomType(nAtoms) = Type;
end

V = sqrt(4 * Ep / Mass); % atoms move faster 

for p = 1:num
    Vx(nAtoms - num + p) = V * cos(PartAng);
    Vy(nAtoms - num + p) = V * sin(PartAng);
    Vz(nAtoms - num + p) = V * (sin(PartAng))^2;
end

end
