% calibrate the main lobe to side lobe ratio
a = [4 5.5];
l = 0;
for N = [8 16]
	figure;
	l++;
	hold on;
	k = -N/2:0.01:N/2;
	for	k0 = 1/N-1/2:1/N:1/2
		h = @(k) abs(sin(pi*(k - k0))./sin(pi*(k - k0)/N)/N);
		plot(k, 20*a(l)*log10(h(k)));
	end
	hold off;
	ylim([-120 0]);
	xlim([-1.5 1.5]);
	xlabel('$k$');
	ylabel('$H_{k_0}(k)$/dB');
	legend([repmat('$H_{', N, 1) num2str((1:N)') repmat('}(k)$', N, 1)])
	eval(['print -dpdflatexstandalone /tmp/mtd' num2str(N)])
end
