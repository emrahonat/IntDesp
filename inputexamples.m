% Dr. Emrah Onat
% 10.12.2025
%  
% 

%% Phase, Corr and Surf Example Inputs for the Algorithms

function [I, G_noiseless, G, M, C, S] = inputexamples(ex,fidx)

switch ex
    case 1
        disp('----------------- ifsar.512x512 -----------------');fprintf('\n');
        fprintf( fidx, '%61s\r\n','--------------------------------ifsar.512x512-------------------------------------');
        I = 'ifsar';
        fid = fopen('ifsar.512x512.phase','r','b'); 
        G = fread(fid, 512*512, 'uchar'); 
        G = reshape(G,512,512);
        fclose(fid);
        G = 2*pi*G/max(max(abs(G)))-pi;
        G_noiseless = G;
        M = ones(size(G));
        C = ones(size(G));
        S = zeros(size(G));
    case 2
        disp('----------------- head.256x256 -----------------');fprintf('\n');
        fprintf( fidx, '%61s\r\n','--------------------------------head.256x256-------------------------------------');
        I = 'head';
        fid = fopen('head.256x256.phase','r','b'); 
        G = fread(fid, 256*256, 'uchar'); 
        G = reshape(G,256,256);
        fclose(fid);
        G = 2*pi*G/max(max(abs(G)))-pi;
        G_noiseless = G;
        M = ones(size(G));
        C = ones(size(G));
        S = zeros(size(G));
    case 3
        disp('----------------- knee.256x256 -----------------');fprintf('\n');
        fprintf( fidx, '%61s\r\n','--------------------------------knee.256x256-------------------------------------');
        I = 'knee';
        fid = fopen('knee.256x256.phase','r','b'); 
        G = fread(fid, 256*256, 'uchar'); 
        G = reshape(G,256,256);
        fclose(fid);
        G = 2*pi*G/max(max(abs(G)))-pi;
        M = ones(size(G));
        C = ones(size(G));
        S = zeros(size(G));
    case 4
        disp('----------------- longs.152x458 -----------------');fprintf('\n');
        fprintf( fidx, '%61s\r\n','--------------------------------longs.152x458-------------------------------------');
        I = 'longs';
        fid = fopen('longs.152x458.phase','r','b'); 
        G = fread(fid, 152*458, 'uchar'); 
        G = reshape(G,152,458);
        G = double(G);
        fclose(fid);
        G = 2*pi*G/max(max(abs(G)))-pi;
        G_noiseless = G;
%         G = G+4.5*(rand(size(G))-0.5); % Adding Phase Noise on it - BE CAREFUL
        load('noisylongs_45.mat');
        fid = fopen('longs.152x458.mask','r','b'); 
        M = fread(fid, 152*458, 'uchar'); 
        M = reshape(M,152,458);
        fclose(fid);
        M = M/max(max(abs(M)));
        fid = fopen('longs.152x458.corr','r','b'); 
        C = fread(fid, 152*458, 'uchar'); 
        C = reshape(C,152,458);
        fclose(fid);
        C = C/max(max(abs(C)));
        fid = fopen('longs.152x458.surf','r','b'); 
        S = fread(fid, 152*458, 'float'); 
        S = reshape(S,152,458);
        S = double(S);
        fclose(fid);
    case 5
        disp('----------------- isola.157x458 -----------------');fprintf('\n');
        fprintf( fidx, '%61s\r\n','--------------------------------isola.157x458-------------------------------------');
        I = 'isola';
        fid = fopen('isola.157x458.phase','r','b'); 
        G = fread(fid, 157*458, 'uchar'); 
        G = reshape(G,157,458);
        fclose(fid); 
        G = 2*pi*G/max(max(abs(G)))-pi;
        G_noiseless = G;
        G = G+4.5*(rand(size(G))-0.5);      % Adding Phase Noise on it - BE CAREFUL
        load('noisyisola_06.mat');
        fid = fopen('isola.157x458.mask','r','b'); 
        M = fread(fid, 157*458, 'uchar'); 
        M = reshape(M,157,458);
        fclose(fid);
        M = M/max(max(abs(M)));
        fid = fopen('isola.157x458.corr','r','b'); 
        C = fread(fid, 157*458, 'uchar'); 
        C = reshape(C,157,458);
        fclose(fid); 
        C = C/max(max(abs(C)));
        fid = fopen('isola.157x458.surf','r','b'); 
        S = fread(fid, 157*458, 'float'); 
        S = reshape(S,157,458);
        S = double(S);
        fclose(fid); 
    case 6
        disp('----------------- shear.257x257 -----------------');fprintf('\n');
        fprintf( fidx, '%61s\r\n','--------------------------------shear.257x257-------------------------------------');
        I = 'shear';
        fid = fopen('shear.257x257.phase','r','b'); 
        G = fread(fid, 257*257, 'uchar'); 
        G = reshape(G,257,257);
        fclose(fid);
        G = 2*pi*G/max(max(abs(G)))-pi;
        M = ones(size(G));
        C = ones(size(G));
        fid = fopen('shear.257x257.surf','r','b'); 
        S = fread(fid, 257*257, 'float'); 
        S = reshape(S,257,257);
        S = double(S);
        fclose(fid);
    case 7
        disp('----------------- spiral.257x257 -----------------');fprintf('\n');
        fprintf( fidx, '%61s\r\n','--------------------------------spiral.257x257-------------------------------------');
        I = 'spiral';
        fid = fopen('spiral.257x257.phase','r','b'); 
        G = fread(fid, 257 * 257, 'uchar'); 
        G = reshape(G,257,257);
        fclose(fid); 
        G = 2*pi*G/max(max(abs(G)))-pi;
        M = ones(size(G));
        C = ones(size(G));
        fid = fopen('spiral.257x257.surf','r','b'); 
        S = fread(fid, 257 * 257, 'float'); 
        S = reshape(S,257,257);
        S = double(S);
        fclose(fid); 
    case 8
        disp('----------------- noise.257x257 -----------------');fprintf('\n');
        fprintf( fidx, '%61s\r\n','--------------------------------noise.257x257-------------------------------------');
        I = 'noise';
        fid = fopen('noise.257x257.phase','r','b'); 
        G = fread(fid, 257 * 257, 'uchar'); 
        G = reshape(G,257,257);
        fclose(fid);
        G = 2*pi*G/max(max(abs(G)))-pi;
        G_noiseless = G;
        M = ones(size(G));
        C = ones(size(G));
        S = zeros(size(G));
    case 9
        disp('----------------- peaks.101x101 -----------------');fprintf('\n');
        fprintf( fidx, '%61s\r\n','--------------------------------peaks.101x101-------------------------------------');
        I = 'peaks101';
        area_range = 256;
        [X,Y,S] = peaks(area_range);
        S = abs(S);
        M = ones(size(S));
        C = ones(size(S));
        G = mod(S+pi,2*pi)-pi;
        G_noiseless = G;
    case 10 % from Constanini code
        disp('----------------- noisypeaks.101x101 -----------------');fprintf('\n');
        fprintf( fidx, '%61s\r\n','--------------------------------noisypeaks.101x101-------------------------------------');
        I = 'noisypeaks101';
        area_range = 101;
        phi = peaks(area_range);
        S = phi;
%         phi(:,end)=[];
        
        % Add uniform random noise +/- 17 degree
        phi = phi+0.6*(rand(size(phi))-0.5);
        
        % Salt/peper noise
        margin = 3; % costantini does not like noise in the border
        badfraction = 3e-2; % 1-3 percent
        nsp = floor(badfraction*numel(phi));
        y = margin + ceil(rand(1,nsp)*(size(phi,1)-2*margin));
        x = margin + ceil(rand(1,nsp)*(size(phi,2)-2*margin));
        idx = sub2ind(size(phi),y,x);
        phi(idx) = phi(idx) + pi*randn(size(idx));
        
        % Wrapped phase
        [X,Y,S] = peaks(area_range);
        G_noiseless = S;
        G = mod(phi+pi,2*pi)-pi;
        load('noisypeaks101.mat');
        M = ones(size(S));
        C = ones(size(S));
    case 11 % from SPUD code
        disp('----------------- volcaono.1591x561 -----------------');fprintf('\n');
        fprintf( fidx, '%61s\r\n','--------------------------------volcano.1591x561-------------------------------------');
        I = 'volcano';
        psi = double(imread('wrapphasevolcano.png'));
        G = 2*pi./(max(psi(:))-min(psi(:))) .*(psi-min(psi(:)))-pi; % Buna bakilacak
        G = 2*pi*psi/max(max(abs(psi)))-pi;
        M = ones(size(G));
        C = ones(size(G));
        S = zeros(size(G));
    case 12 % from PUMA code
        disp('----------------- gaussele.100x100 -----------------');fprintf('\n');
        fprintf( fidx, '%61s\r\n','--------------------------------gaussele.100x100-------------------------------------');
        I = 'gaussele';
        
        M=100;
        N=100;
        z1=gaussele(M,N,14*pi,10,15); 
        % generate insar pair according to model (2002, TIP, vol. 11, no 4.)
        co=0.95;	% noise (coherence: co = 1 => no noise; co = 0 => only noise (no signal))
        [x1 x2] = insarpair_v2(ones(M), co*ones(M), z1, 0);	
        % compute interferogram 
        G  = angle(x1.*conj(x2));
        M = ones(size(G));
        C = ones(size(G));
        S = z1;
    case 13 % from PUMA code
        disp('----------------- gaussmask.150x100 -----------------');fprintf('\n');
        fprintf( fidx, '%61s\r\n','--------------------------------gaussmask.150x100-------------------------------------');
        I = 'gaussmask';
        M=150;
        N=100;
        mx=75; my=50;
        mask = ones(M,N); mask(1:mx,1:my)=0;
        % build Gaussian elevation
        z=gaussele(M,N,14*pi,10,15).*mask;
        % generate insar pair according to model (2002, TIP, vol. 11, no 4.)
        co=1; % noise (coherence: co = 1 => no noise; co = 0 => only noise  (no signal))
        [x1 x2] = insarpair(ones(M,N), co*ones(M,N), z, 0);
        G = angle(x1.*conj(x2));
        M = ones(size(G));
        C = ones(size(G));
        S = z;
    case 14 % from PUMA code
        disp('----------------- gaussmask2.150x100 -----------------');fprintf('\n');
        fprintf( fidx, '%61s\r\n','--------------------------------gaussmask2.150x100-------------------------------------');
        I = 'gaussmask2';
        
        M=150;
        N=100;
        load maskrotnotcenter;
        maskrotnotcenter = fliplr(maskrotnotcenter);
        % build Gaussian elevation
        z=gaussele(M,N,14*pi,10,15).*maskrotnotcenter;
        % generate insar pair according to model (2002, TIP, vol. 11, no 4.)
        co=1; % noise (coherence: co = 1 => no noise; co = 0 => only noise  (no signal))
        [x1 x2] = insarpair(ones(M,N), co*ones(M,N), z, 0);
        G = angle(x1.*conj(x2));
        M = ones(size(G));
        C = ones(size(G));
        S = z;
    case 15 % from sunwrap code
        disp('----------------- numphant.150x100 -----------------');fprintf('\n');
        fprintf( fidx, '%61s\r\n','--------------------------------numphant.150x100-------------------------------------');
        I = 'numphant';
        
        load complex_ex;
        G = angle(complex_ex);
        M = ones(size(G));
        C = ones(size(G));
        S = zeros(size(G));
    case 16 % from 
        disp('----------------- etna.1024x1024 -----------------');fprintf('\n');
        fprintf( fidx, '%61s\r\n','--------------------------------etna.1024x1024-------------------------------------');
        I = 'etna1024';
        %etna1024 = Flatten_Interferogram(1:1024,1500:2523);
        load('etna1024.mat');
%         load('Flatten_Interferogram_Etna');
%         etna1024 = Flatten_Interferogram(512:512+512,2000:2512);
        G = etna1024;
        G_noiseless = G;
        M = ones(size(G));
        load('Etna_coherencemap.mat');
        CoherenceMap = CoherenceMap';
        C = CoherenceMap(1:1024,1500:2523);
%         C = CoherenceMap(512:512+512,2000:2512);
        S = zeros(size(G));   
    case 17 % from 
        disp('----------------- etna.2000x5198 -----------------');fprintf('\n');
        fprintf( fidx, '%61s\r\n','--------------------------------etna.2000x5198-------------------------------------');
        I = 'etna2000';
        load('Flatten_Interferogram_Etna.mat');
        G = Flatten_Interferogram;
        G_noiseless = Flatten_Interferogram;
        M = ones(size(G));
        load('Etna_coherencemap.mat');
        C = CoherenceMap';
        S = zeros(size(G));  
end
        
end
