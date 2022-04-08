function hImg = PVH_imgPlotResp_FC1(matResp,idxOrder,vtFrm,bROC)

if(nargin<4)
    bROC = false;
end

matResp_R = matResp(idxOrder,:);
%hImg = imagesc(flipud(matResp_R));
hImg = imagesc(matResp_R);
hold on;
for n=1:length(vtFrm)
    plot([vtFrm(n);vtFrm(n)],[0;size(matResp,1)+0.5],'k:','linewidth',2);
end

if(bROC)
    set(gca,'clim',[0 1]);
    load('Diff_RWB_Map.mat');
    colormap(gca,clrmap_RWB);
end

set(hImg,'UserData',idxOrder);
dcm_obj = datacursormode(gcf);
set(dcm_obj,'UpdateFcn',@updatefcn_Map);
set(gca,'ydir','norm');