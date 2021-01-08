f = 9.6e6;
F = 10e6;
t = 0:1/10/F:100/F;
s_i = cos(2*pi*f*t).*cos(2*pi*F*t);
s_q = cos(2*pi*f*t).*sin(2*pi*F*t);
plot(t, [s_i; s_q]);

pkg load signal;
lp = fir1(10, (F - f)/F, 'low');
r_i = 2*filter(lp, 1, s_i);
r_q = 2*filter(lp, 1, s_q);
hold on;
plot(t, [r_i; r_q], 'LineWidth', 3);
xlabel('$t$/s');
legend(['$s_i(t)$'; '$s_q(t)$'; '$r_i(t)$'; '$r_q(t)$']);
print -dpdflatexstandalone /tmp/iq.tex
