%% Programa teste para o TEEE de Robótica 

%Ip da Câmera
clear all

mylego = legoev3('usb');
mymotor = motor(mylego,'A');


url = 'http://192.168.0.102:8080/shot.jpg';

%Leitura da imagem fornecida pelo Ip da câmera 
ss  = imread(url);

%Consegue os parâmetros das imagens enviadas pelo celular
fh = image(ss);

%Vídeo de Saída e abertura do vídeo de saída
 %OutVideo = VideoWriter('video6','MPEG-4');
 %open(OutVideo);
 quadro = 40;
 %Início do contador e contagem de frames
i = 0;
while(1)
    %Atualização da imagem que será analisada 
    ss  = imread(url);
    fh = image(ss);
    
    %A é o vídeo em preto e branco 
    A = rgb2gray(ss);
  %  writeVideo(OutVideo,A);
    i = i + 1;
  
    
    ss(221:260, 299:300, :) = 0;
    ss(221:260, 299:300, 3) = 255;
    ss(221:260, 341:342, :) = 0;
    ss(221:260, 341:342, 3) = 255;
    ss(219:220, 301:340, :) = 0;
    ss(219:220, 301:340, 3) = 255;
    ss(261:262, 301:340, :) = 0;
    ss(261:262, 301:340, 3) = 255;
    k = 0;
    
    tic
    %Contagem de blobs pretos, ou em escalas de cinza, para detecção 
    %"n" indica as linhas e "j" as colunas
    for n = 221:221+quadro-1
        
        for j = 301:301+quadro-1
            %A condição é a escala de cinza que está sendo indentificada e
            %é contada todas as vezes que é verdadeira
            
            %ss(n-1,j-1,:) = 0;
            %ss(n-1,j-1,3) = 255;
            if A(n,j) < 50
                k = k + 1;    
            end
        end
    end
    k
    %Se tiver mais de 1400 pixels pretos acontece a detecção e
    %consequentemente há o "beep" no lego.
    
    set(fh,'CData',ss);
    drawnow;
    
    if (k >= 1400)
        %beep(mylego);
        mymotor.Speed = 20; % velocidade do motor
        start(mymotor); %iniciar
    else
        mymotor.Speed = -20; % velocidade do motor reversa
        start(mymotor); %iniciar
    end
    toc
end
stop(mymotor);
%close(OutVideo);
