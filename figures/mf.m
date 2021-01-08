s_rect = [1];
s_mrect = [1 0 1 0 1];
L = 5;
% m_sequence comes from <https://github.com/askuric/m_sequences_tools>
s_pn = m_sequence(2, L);
% if you don't wanna download the aforementioned packages, uncomment it
% s_pn = [0 1 1 1 0 0 0 1 0 1 0 1 1 0 1 0 0 0 0 1 1 0 0 1 0 0 1 1 1 1 1];
% the period number of m sequence
N = 10;
s_m = repmat(s_pn, 1, N);
% the length of pn sequence
M = 2^L - 1;
l = 2;
sample = M*(N - l):M*(N + l);
s_barker13 = [1 1 1 1 1 -1 -1 1 1 -1 1 -1 1];
% note: 4 digit barker code is not only
% s_barker4 = [1 1 1 -1];
s_barker4 = [1 1 -1 1];
s_barker7 = [1 1 1 -1 -1 1 -1];
s_barker4times7 = s_barker7'*s_barker4;
s_barker4_7 = s_barker4times7(:);
for k = {'rect' 'mrect' 'm' 'pn' 'barker13' 'barker4_7'}
for k = {'m'}
	name = k{:};
	eval(['s = s_' name ';']);
	stem(s);
	xlabel('$t$');
	ylabel('$s(t)$');
	eval(['print -dpdflatexstandalone /tmp/' name]);
	r = conv(s, flip(s));
	if name == 'm'
		stem(r(sample));
	else
		stem(r);
	end
	xlabel('$t$');
	ylabel('$r(t)$');
	eval(['print -dpdflatexstandalone /tmp/' name '-out']);
end
