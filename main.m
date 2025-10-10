%% Interferogram Despekling Algorithms
% 
% 0 - Input Images (Interferograms)
% 1 - Despekling Algorithms
% 2 - Phase Unwrapping Algorithms
%
% Dr. Emrah Onat
% 30.09.2025
% 

%% Main Code 

clear all
close all
clc

%% Display
disp('--- Algorithms ---');

fid = fopen( 'results.txt', 'wt' );
fprintf( fid, '%3s %13s %8s %3s %10s %10s %10s %10s %10s %10s %8s %10s %10s %10s %10s\r\n','#i', '#Input','Filter', 'WS', 'RMSE_int', 'PSNR_int', 'EQP_int', 'EPI_int', 'SPD_int', 'nres_int', '#PUAlg','Duration_PU', '#Residue', '#BranchCut', 'RMSE_PU');

iteration = 0;
for i = 4:4
%     fprintf( fid, '%61s\r\n','------------------------------------------------------------');
    %% Input Images
    % 1 - P00 - ifsar.512x512
    % 2 - P00 - head.256x256
    % 3 - P00 - knee.256x256
    % 4 - PCS - longs.152x458 GT
    % 5 - PCS - isola.157x458 GT
    % 6 - P0S - shear.257x257
    % 7 - P0S - spiral.257x257
    % 8 - P00 - noise.257x257
    % 9 - P00 - peaks.101x101
    % 10 -P0S - noisypeaks.101x101
    % 11 -P00 - volcano.1591x561
    % 12 -P0S - gaussele.100x100
    % 13 -P0S - gaussmask.150x100
    % 14 -P0S - gaussmask2.150x100
    % 15 -P00 - numphant.150x100
    
    numberofinputimage = i;
    [Inpimage, phaseimage_noiseless, phaseimage, maskimage, corrimage, surfimage] = inputexamples(numberofinputimage, fid);
    
%     figure;
%     subplot(311);imagesc(phaseimage);title(['Input Phase Image, #Map = ' num2str(numberofinputimage)]);
%     subplot(312);imagesc(corrimage);title('Input Correlation Map');
%     subplot(313);mesh(surfimage);title('Groundtruth Unwrapped Map');

    figure_map = figure; imagesc(phaseimage_noiseless);title('Groundtruth Interferogram');
%     saveas(figure_map,"InterferogramGroundtruth.svg") % For Paper

    surfimage = surfimage-min(min(surfimage)); surfimage = surfimage/max(max(surfimage)); 
    figure_map = figure;mesh(surfimage);title('Groundtruth DEM');
%     saveas(figure_map,"DEMGroundtruth.svg") % For Paper
    
    for j = 14:15
        %% Interferogram Despeckling
        % 0 - No Despeckling
        % 1 - Mean
        % 2 - Median
        % 3 - Pivoting Median
        % 4 - Frost
        % 5 - Modified Frost
        % 6 - Lee
        % 7 - Kuan
        % 8 - Kuwahara
        % 9 - Goldstein
        % 10 - Baran
        % 11 - NL InSAR (only Linux and Windows x32)
        % 12 - BM3D (only Linux)
        % 13 - BM3D-ADMM
        % 14 - PPB
        % 15 - PPB-Ite


        if j==16 || j==23 || j==36 || j==46
            continue;
        end

        numberofDespAlgo = j;

        for m = 3:2:3
            windowsize = m;

            % Despeckling
            [DESPtype desp_int] = DespGen(numberofDespAlgo, phaseimage, windowsize, fid);
            figure_map = figure;
            imagesc(desp_int);title(['Despeckled Interferogram, WindowSize = ' num2str(windowsize) ', #Algo = ' DESPtype]);
            colormap gray;
    
%             name = string(date);
%             imgno = string(numberofinputimage);
%             winno = string(windowsize);
%             name=name+DESPtype+winno+imgno;
%             saveas(figure_map,name+"desp_int.svg")

            % Calculation of Parameters
            [RMSE_int PSNR_int EQP_int EPI_int SPD_int nres_int] = param_calculations_int(phaseimage_noiseless, phaseimage, desp_int);
%             maskimage = ones(size(desp_int));
            qualmap = corrimage;
            I = [iteration; i; j; m; RMSE_int; PSNR_int; EQP_int; EPI_int; SPD_int; nres_int];
    
            for k = 17:17
                %% Phase Unwrapping Algorithms
                % 0 - Itoh Matlab
                % 1 - Goldstein Matlab
                % 2 - Goldstein C/C++
                % 3 - Quality Guided Matlab
                % 4 - Quality Guided C/C++
                % 5 - Mask Cut C/C++
                % 6 - Flynn C/C++
                % 7 - PUMA
                % 8 - SPUD
                % 9 - fp-Matlab
                % 10 - fp-wff-Matlab
                % 11 - fp-wfr-Matlab
                % 12 - Constantinini
                % 13 - 2D-SRNCP
                % 14 - 2D-SRNCP-V2
                % 15 - Unweighted LS
                % 16 - Lp Norm
                % 17 - PCG
                % 18 - unwt
                % 19 - HBP
                
                if k==7 && (i== 6 || i==7 || i==8 || i==10 || i==1 || i==11)
                    continue;
                end
                if k==6 && (i==10)
                    continue;
                end
                if k==3 || k==10 || k==11
                    continue;
                end
    
                numberofPUAlgo = k;
                % Phase Unwrapping
%                 desp_int = desp_int .* maskimage;
                tic;
                [PUAlg, resmap, BCmap, unwrappedmap] = PUalgorithms(numberofPUAlgo, desp_int, maskimage, qualmap);
                duration = toc;
                resnumber = length(find(resmap));
                BClength = sum(sum(BCmap));
                unwrappedmap = unwrappedmap-min(min(unwrappedmap)); unwrappedmap = unwrappedmap/max(max(unwrappedmap)); 
                unwrappedmap = unwrappedmap .* maskimage;
                surfimage = surfimage-min(min(surfimage)); surfimage = surfimage/max(max(surfimage)); 
                rmse_uW = rms(rms(surfimage(1:size(unwrappedmap,1),1:size(unwrappedmap,2))-unwrappedmap));
                
                figure
                subplot(321);imagesc(phaseimage);title(['Input Phase Image, #Input = ' Inpimage]);
                subplot(322);imagesc(desp_int);title(['Despeckled Int, WS = ' num2str(windowsize) ', #Algo = ' DESPtype]);
                subplot(323);imagesc(resmap);title(['Residue Map, #Res = ' num2str(resnumber)]);
                subplot(324);imagesc(BCmap);title(['Branch-Cut Map, length = ' num2str(BClength)]);
                subplot(325);imagesc(unwrappedmap);title(['Unwrapped Map, RMSE = ' num2str(rmse_uW)]);
                subplot(326);mesh(unwrappedmap);title(['Unwrapped Map, PU Algo = ' PUAlg]);

                figure_map = figure; imagesc(desp_int);title(['Noisy Interferogram, RMSE_1 = ' num2str(RMSE_int) ' , Filter = ' DESPtype]);
                saveas(figure_map,"Interferogram"+DESPtype+".svg")

                figure_map = figure; mesh(unwrappedmap);title(['DEM, RMSE_2 = ' num2str(rmse_uW) ' , Filter = ' DESPtype]);
                saveas(figure_map,"DEM"+DESPtype+".svg");

                
                iteration = iteration +1;
                A = [iteration; i; j; m; k; resnumber; BClength; rmse_uW; duration];
    
                fprintf( fid, '%3d %13s %8s %3d %10f %10f %10f %10f %10f %10d %8s %10f %10d %10d %10f\r\n', iteration, Inpimage, DESPtype, windowsize, RMSE_int, PSNR_int, EQP_int, EPI_int, SPD_int, nres_int, PUAlg, duration, resnumber, BClength, rmse_uW);
    %             fprintf( fid, '%5s \r\n', PUAlg);
            end
        end
    end
end

fclose(fid);
open('results.txt');