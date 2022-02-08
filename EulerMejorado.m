%Realizar un programa en Matlab que obtenga la solución de la ecuación diferencial ordinaria (EDO)  dy/dx=f(x,y)

clear; %Borrar las variables
clc; %Borrar la pantalla

%DEFINICIÓN EXTERNA de la funcion f(x,y)

%Pedir al usuario los límites en x para la solución de la EDO,condición
%inicial y el número de divisiones
a = input('Ingresa el límite a del rango en la ecuación diferencial.   a = ');
b = input('Ingresa el límite b del rango en la ecuación diferencial.   b = ');
alpha = input('Ingresa la condición inicial.  y(0) = ');
n = input('Ingresa el número de divisiones.  n = ');

%Cálculo de la separación de los intervalos
h = (b-a)/n;


xi = a; %Inicializar la variable xi a usar en el ciclo
yi = alpha; %Inicializar la variable yi a usar en el ciclo

for i= 1:n %El ciclo for para que se repita n veces
    
    a_yi_p = f(xi,yi);
    yi_p = yi + h.*a_yi_p; %Fórmula de método de Euler
    
    %xi = xi + i.*h; %Fórmula para el incremento de x en el intervalo dado
    
    xi2 = xi + i.*h;
    a_yi =  f(xi2,yi_p);
    yi = yi+(h/2)*(a_yi_p + a_yi);

    Xi(i) = xi2; %Guardar los valores de xi en cada iteración 
    Yi(i) = yi; %Guardar los valores de yi en cada iteración 
    contador(i)=i;
end

n=[contador n+1]';
Xi=[a Xi]'; %Vector Xi transpuesto
Yi=[alpha Yi]'; %Vector Yi transpuesto
T= table(n,Xi,Yi); %Forma tabular de los vectores xi y yi con el índice.
disp(T); %Impresión de la tabla anterior

plot(Xi,Yi);
hold on
grid on