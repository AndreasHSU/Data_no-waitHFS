% PI =[
% 
%    144   154    42   180   194    58   126   196   172   136;
%     81    56    56    44    28    47    47     4    99    32];

B= sum(PI);
[~,I]=sort(B); 
PI=PI(:,I);