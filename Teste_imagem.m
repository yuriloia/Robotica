%% Programa teste para o TEEE de Rob�tica 

%Ip da C�mera
clear all

% mylego = legoev3('usb');
% mymotor = motor(mylego,'C');
% mymotor1 = motor(mylego,'B');

url = 'http://192.168.0.107:8080/shot.jpg';

%Leitura da imagem fornecida pelo Ip da c�mera 
ss  = imread(url);

%Consegue os par�metros das imagens enviadas pelo celular
fh = image(ss);

%V�deo de Sa�da e abertura do v�deo de sa�da
 %OutVideo = VideoWriter('video6','MPEG-4');
 %open(OutVideo);
 quadro = 40;
 %In�cio do contador e contagem de frames
i = 0;
while(1)
    %Atualiza��o da imagem que ser� analisada 
    ss  = imread(url);
    fh = image(ss);
    
    %A � o v�deo em preto e branco 
    A = rgb2gray(ss);
  %  writeVideo(OutVideo,A);
    i = i + 1;
  
    
    ss(221:221+quadro-1, 299:300, :) = 0;
    ss(221:221+quadro-1, 299:300, 3) = 255;
    ss(221:221+quadro-1, 341:342, :) = 0;
    ss(221:221+quadro-1, 341:342, 3) = 255;
    ss(219:220, 301:301+quadro-1, :) = 0;
    ss(219:220, 301:301+quadro-1, 3) = 255;
    ss(261:262, 301:301+quadro-1, :) = 0;
    ss(261:262, 301:301+quadro-1, 3) = 255;
    k = 0;
    
    ss(80:81+quadro-1, 179:180, :) = 0;
    ss(80:81+quadro-1, 179:180, 3) = 255;
    ss(80:81+quadro-1, 220:221, :) = 0;
    ss(80:81+quadro-1, 220:221, 3) = 255;
    ss(120:121, 181:181+quadro-1, :) = 0;
    ss(120:121, 181:181+quadro-1, 3) = 255;
    ss(79:80, 181:181+quadro-1, :) = 0;
    ss(79:80, 181:181+quadro-1, 3) = 255;
    tic
    %Contagem de blobs pretos, ou em escalas de cinza, para detec��o 
    %"n" indica as linhas e "j" as colunas
    for n = 221:221+quadro-1
        
        for j = 301:301+quadro-1
            %A condi��o � a escala de cinza que est� sendo indentificada e
            %� contada todas as vezes que � verdadeira
            
            %ss(n-1,j-1,:) = 0;
            %ss(n-1,j-1,3) = 255;
            if A(n,j) < 120
                k = k + 1;    
            end
        end
    end
    %k
    %Se tiver mais de 1400 pixels pretos acontece a detec��o e
    %consequentemente h� o "beep" no lego.
    
    set(fh,'CData',ss);
    drawnow;
    a = 100;
    b = 200;
    if (k >= 1400)
        a
        %beep(mylego);
%         mymotor.Speed = 20; % velocidade do motor
%         mymotor1.Speed = 20;
%         start(mymotor); %iniciar
%         start(mymotor1);
    else
        b
%         stop(mymotor);
%         stop(mymotor1);
    end
    toc
end
stop(mymotor);
%close(OutVideo);
