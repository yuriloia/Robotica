%% Programa teste para o TEEE de Rob�tica 

%Ip da C�mera
url = 'http://192.168.0.104:8080/shot.jpg';

%Leitura da imagem fornecida pelo Ip da c�mera 
ss  = imread(url);

%Consegue os par�metros das imagens enviadas pelo celular
fh = image(ss);

%V�deo de Sa�da e abertura do v�deo de sa�da
 OutVideo = VideoWriter('video5','MPEG-4');
 open(OutVideo);
 
 %In�cio do contador e contagem de frames
i = 0;
while(i <= 300)
    %Atualiza��o da imagem que ser� analisada 
   ss  = imread(url);
    fh = image(ss);
    
    %A � o v�deo em preto e branco 
    A = rgb2gray(ss);
    writeVideo(OutVideo,A);
    i = i + 1;
    
    set(fh,'CData',A);
     drawnow;
    k = 0; 
    tic
    
    %Contagem de blobs pretos, ou em escalas de cinza, para detec��o 
    %"n" indica as linhas e "j" as colunas
    for n = 221:260
        for j = 301:340
           
            %A condi��o � a escala de cinza que est� sendo indentificada e
            %� contada todas as vezes que � verdadeira
            if A(n,j) < 50
                k = k + 1;
            
            end
        end
    end
    k
    %Se tiver mais de 1400 pixels pretos acontece a detec��o e
    %consequentemente h� o "beep" no lego.
    
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
close(OutVideo);
