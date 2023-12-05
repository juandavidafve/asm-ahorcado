;Estructura Básica de un programa ensamblador UFPS Arq Computadores
.model small
.386
.stack 64

.data
input db ?, '$'; Almacenar el input
progress db 32 dup ('0'), '$' ; Valores introducidos

; Strings del programa
msg_ask_input db "Escriba una letra:$"
msg_wrong_ans db "Letra incorrecta$"
msg_winner db "Ganaste$"
msg_loser db "Perdiste$"
msg_next_word db "Presiona una tecla para jugar la siguiente palabra$"
newline db 13, 10, '$' ; Caracteres de nueva linea
endstr db '$' ; Caracter de fin de string

;String logo e integrantes
logoe db 13, 10
      db "     |-----------------------S-I-S-T-E-M-I-C-O-S---------------------------|",13,10
      db "     |        /     #  #%  &                                               |",13,10
      db "     |        /     #  #%  &                                               |",13,10
      db "     |     . (################.        -===============================-   |",13,10
      db "     |  (((# #.(           ,  & ((((   | *********INTEGRANTES**********|   |",13,10
      db "     |     , #          *  ,  &        |===============================|   |",13,10
      db "     |     , #    &    &   ,  &        |                               |   |",13,10
      db "     |  %%%% # &&  (        % & %%%%   |     JUAN AFANADOR - 1152247   |   |",13,10
      db "     |     , #                &        |     OMAR JAIMES  - 1152263    |   |",13,10
      db "     |     , #            . & &        |      BRYAN VERA  - 1152277    |   |",13,10
      db "     |     , %&&&&&&&&&&&&&&&&(        |    SAIMER SAAVEDRA - 1152280  |   |",13,10
      db "     |        /     #  #%  &           |                               |   |",13,10
      db "     |        /     #  #%  &           '-------------------------------'   |",13,10
      db "     |-------------------ALTA-CALIDAD-ARQUITECTURA-DE-PC-------------------|$"

menu_option db "     |---------------------------------------------------------------------|",13,10
            db "     |       BIENVENIDOS A AHORCADO                                        |",13,10
            db "     |                                                   __    ___  __  __ |",13,10
            db "     |       Elige la tematica:                         /__\  / __)(  \/  )|",13,10
            db "     |    1. Fruta         2. Animal                   /(__)\ \__ \ )    ( |",13,10
            db "     |          3. Transporte                         (__)(__)(___/(_/\/\_)|",13,10
            db "     |---------------------------------------------------------------------|$"

;Strings de variables
frutas db "manzana$", "platano$", "fresa$", "uva$", "naranja$", "sandia$", "pera$", "kiwi$", "mango$", "cereza$"
frutas_lengths db 7, 7, 5, 3, 7, 6, 4, 4, 5, 7

animales db "perro$", "gato$", "elefante$", "jirafa$", "tigre$", "cebra$", "loro$", "mono$", "koala$", "oso$"
animales_lengths db 5, 4, 8, 6, 5, 5, 4, 4, 5, 3

transportes db "auto$", "bicicleta$", "barco$", "avion$", "tren$", "camion$", "motocicleta$", "helicoptero$", "submarino$", "taxi$"
transportes_lengths db 4, 9, 5, 5, 4, 6, 11, 11, 9, 4

ascii_art db "          $"
          db "          $"
          db "          $"
          db "          $"
          db "          $"
          db "          $"
          db "          $"
          db 0CDH, 0CDH, 0CDH, 0CDH, 0CDH, 0CDH, 0CDH, 0CDH, 0CDH, 0CDH, '$'
          ;
          db 0CBH, 0CBH, "        $" 
          db 0BAH, 0BAH, "        $" 
          db 0BAH, 0BAH, "        $"
          db 0BAH, 0BAH, "        $"
          db 0BAH, 0BAH, "        $"
          db 0BAH, 0BAH, "        $"
          db 0BAH, 0BAH, "        $"
          db 0CAH, 0CAH, 0CDH, 0CDH, 0CDH, 0CDH, 0CDH, 0CDH, 0CDH, 0CDH, '$'
          ;
          db 0CBH, 0CBH, 0CDH, 0CDH, 0CDH, 0CDH, 0CDH, 0CDH, 0CDH, " $"
          db 0BAH, 0BAH, "        $" 
          db 0BAH, 0BAH, "        $"
          db 0BAH, 0BAH, "        $"
          db 0BAH, 0BAH, "        $"
          db 0BAH, 0BAH, "        $"
          db 0BAH, 0BAH, "        $"
          db 0CAH, 0CAH, 0CDH, 0CDH, 0CDH, 0CDH, 0CDH, 0CDH, 0CDH, 0CDH, '$'
          ;
          db 0CBH, 0CBH, 0CDH, 0CDH, 0CDH, 0CDH, 0CDH, 0CDH, 0CDH, " $"
          db 0BAH, 0BAH, "        $" 
          db 0BAH, 0BAH, "        $"
          db 0BAH, 0BAH, "      ", 0B3H, " $"
          db 0BAH, 0BAH, "      ", 0B3H, " $"
          db 0BAH, 0BAH, "        $"
          db 0BAH, 0BAH, "        $"
          db 0CAH, 0CAH, 0CDH, 0CDH, 0CDH, 0CDH, 0CDH, 0CDH, 0CDH, 0CDH, '$'
          ;
          db 0CBH, 0CBH, 0CDH, 0CDH, 0CDH, 0CDH, 0CDH, 0CDH, 0CDH, " $"
          db 0BAH, 0BAH, "        $" 
          db 0BAH, 0BAH, "        $"
          db 0BAH, 0BAH, "     ", 02FH , 0B3H, " $"
          db 0BAH, 0BAH, "      ", 0B3H, " $"
          db 0BAH, 0BAH, "        $"
          db 0BAH, 0BAH, "        $"
          db 0CAH, 0CAH, 0CDH, 0CDH, 0CDH, 0CDH, 0CDH, 0CDH, 0CDH, 0CDH, '$'
          ;
          db 0CBH, 0CBH, 0CDH, 0CDH, 0CDH, 0CDH, 0CDH, 0CDH, 0CDH, " $"
          db 0BAH, 0BAH, "        $" 
          db 0BAH, 0BAH, "        $"
          db 0BAH, 0BAH, "     ", 02FH , 0B3H, 05CH , '$'
          db 0BAH, 0BAH, "      ", 0B3H, " $"
          db 0BAH, 0BAH, "        $"
          db 0BAH, 0BAH, "        $"
          db 0CAH, 0CAH, 0CDH, 0CDH, 0CDH, 0CDH, 0CDH, 0CDH, 0CDH, 0CDH, '$'
          ;
          db 0CBH, 0CBH, 0CDH, 0CDH, 0CDH, 0CDH, 0CDH, 0CDH, 0CDH, " $"
          db 0BAH, 0BAH, "        $" 
          db 0BAH, 0BAH, "        $"
          db 0BAH, 0BAH, "     ", 02FH , 0B3H, 05CH , '$'
          db 0BAH, 0BAH, "      ", 0B3H, " $"
          db 0BAH, 0BAH, "      ", 02FH , " $"
          db 0BAH, 0BAH, "        $"
          db 0CAH, 0CAH, 0CDH, 0CDH, 0CDH, 0CDH, 0CDH, 0CDH, 0CDH, 0CDH, '$'
          ;
          db 0CBH, 0CBH, 0CDH, 0CDH, 0CDH, 0CDH, 0CDH, 0CDH, 0CDH, " $"
          db 0BAH, 0BAH, "        $" 
          db 0BAH, 0BAH, "        $"
          db 0BAH, 0BAH, "     ", 02FH , 0B3H, 05CH , '$'
          db 0BAH, 0BAH, "      ", 0B3H, " $"
          db 0BAH, 0BAH, "      ", 02FH , 05CH , '$'
          db 0BAH, 0BAH, "        $"
          db 0CAH, 0CAH, 0CDH, 0CDH, 0CDH, 0CDH, 0CDH, 0CDH, 0CDH, 0CDH, '$'
          ;
          db 0CBH, 0CBH, 0CDH, 0CDH, 0CDH, 0CDH, 0CDH, 0CDH, 0CDH, " $"
          db 0BAH, 0BAH, "      ", 0B3H, " $"
          db 0BAH, 0BAH, "      ", 'O', " $"
          db 0BAH, 0BAH, "     ", 02FH , 0B3H, 05CH , '$'
          db 0BAH, 0BAH, "      ", 0B3H, " $"
          db 0BAH, 0BAH, "      ", 02FH , 05CH , '$'
          db 0BAH, 0BAH, "        $"
          db 0CAH, 0CAH, 0CDH, 0CDH, 0CDH, 0CDH, 0CDH, 0CDH, 0CDH, 0CDH, '$'

;string db '$$'

.code
inicio proc near
    mov ax, @data ; Cargar el segmento de datos en ax.
    mov ds, ax ; Establecer ds con el segmento de datos.
    
    call clear_screen

    ;;Imprimir menu
    call print_menu

    ;;Seleccionar opción
    call select_option
    
    ; Empezar el juego
    call play
    
salir:
    mov ax, 4C00H  ; Interrupcion de terminar
    int 21H        ; Llamada a la interrupcion

inicio endp

; Inicia el juego, itera cada palabra de una categoria
; Recibe
; si, arreglo de strings
; bx, arreglo de longitudes de si
play proc near
    push ax
    push bx
    push cx
    push dx
    push si

    ; Inicializar cl - control del ciclo
    mov cl, 0

    play_loop:

    ; Guardar el valor de bx en ax
    mov ax, [bx]
    mov ah, 0

    ; Mover a ch la cant de letras en la palabra
    mov ch, al
    call play_word

    ; Saltar mensaje de siguiente palabra si ya está en la ultima
    cmp cl, 9
    je play_loop_skip_next_msg

    ; Mostrar mensaje de siguiente palabra
    lea dx, msg_next_word
    call read_char
    
    play_loop_skip_next_msg:
    ; Pasar si a la siguiente palabra
    add si, ax
    inc si ; Agregar un caracter más para $
    inc bx ; Pasar bx al siguiente numero

    ; control del ciclo
    inc cl
    cmp cl, 10 ; Cant de palabras
    jl play_loop

    pop si
    pop dx
    pop cx
    pop bx
    pop ax
ret
play endp

; Jugar con una palabra
; lea si, palabra
; mov ch, longitud
play_word proc near
    push ax; preserver el valor de ax
    push cx; preserver el valor de cx
    push dx; preserver el valor de dx

    mov cl, 0 ; definir el contador de errores en 0
    call init_progress ; inicializar el string de progreso

read_word:

    ; imprimir progreso
    lea dx, progress
    call print

    ; Imprimir ascii del ahorcado
    mov ah, cl
    call print_ahorcado

    ; leer caracter
    lea dx, msg_ask_input
    call read_char

    ; limpiar pantalla
    ;call clear_screen
    
    ; llenar progreso
    mov ah, input
    mov dx, 0
    call fill_progress

    cmp dl, 0
    je char_not_found
    jmp char_continue

char_not_found:
    ; sumar 1 al contador de fallos
    inc cl;

    ; Imprimir mensaje
    push dx
    lea dx, msg_wrong_ans
    call print
    pop dx
char_continue:
    cmp dh, 1
    je word_finished

    ; control del bucle
    cmp cl, 8
    jl read_word

    ; imprimir mensaje perder
    lea dx, msg_loser
    call print

    ; imprimir respuesta
    lea dx, [si]
    call print

    jmp word_continue

word_finished:
    ; imprimir mensaje ganar
    lea dx, msg_winner
    call print

word_continue:

    ; imprimir progreso
    lea dx, progress
    call print

    ; Imprimir ascii del ahorcado
    mov ah, cl
    call print_ahorcado

    pop dx; devolver dx a su valor original
    pop cx; devolver cx a su valor original
    pop ax; devolver ax a su valor original
    
    ret
play_word endp


; Inicializar el string de progreso
;   lea si, palabra (ya proviene del metodo play_word)
;   mov ch, longitud_palabra (ya proviene del metodo play_word)
init_progress proc near
    push ax ; preserver el valor de ax
    push bx ; preservar el valor de bx
    push cx ; preservar el valor de cx
    push di ; preservar el valor de di
    
    mov cl, 0 ; indice del bucle
    lea bx, progress; acceder al string progress
    mov di, si; crear el apuntador a la palabra

    init_progress_fill:

    ; escribir '_ '
    mov ax, " _" 
    mov [bx], ax
    
    inc di ; pasar a la siguiente letra de la palabra
    ; saltar 2 caracteres de progress
    inc bx 
    inc bx
    ; control del bucle
    inc cl
    cmp cl, ch
    jl init_progress_fill

    cmp cl, 16
    jl init_progress_clear
    jmp init_process_continue

    init_progress_clear:
    ; escribir '$$'
    mov ax, "$$"
    mov [bx], ax

    inc bx; pasar al siguiente caracter de progress
    inc bx; 
    ; control de bucle
    inc cl
    cmp cl, 16
    jl init_progress_clear

    init_process_continue:

    pop di; devolver di a su valor original
    pop cx; devolver cx a su valor original
    pop bx; devolver bx a su valor original
    pop ax; devolver ax a su valor original

    ret
init_progress endp

; Completar el progreso a medida que se escriben las letras
;   mov ah, letra a buscar
;   mov dx, 0
;   mov ch, longitud_palabra (ya proviene del metodo play_word)
;   lea si, palabra (ya proviene del metodo play_word)
; retorna
; dl se encontro la letra 
; dh la palabra esta completa 
fill_progress proc near
    push bx ; guardar el valor de bx en la pila
    push cx ; guardar el valor de cx en la pila
    push di ; guardar el valor de di en la pila

    ; ch longitud palabra
    ; cl control del ciclo
    ; di letra de la palabra
    ; bx string de progreso
    ; ah letra a buscar
    ; dl se encontro la letra 
    ; dh la palabra esta completa 
    
    mov cl, 0
    mov di, si
    lea bx, progress;

read_progress:
    cmp ah, [di]
    je modify_progress
    jmp continue_read_progress

modify_progress:
    mov [bx], ah
    mov dl, 1; se encontro la letra

continue_read_progress:
    inc di ; pasar a la siguiente letra de la palabra
    inc bx ; pasar al siguiente caracter de progress
    inc bx
    ; control del bucle
    inc cl
    cmp cl, ch
    jl read_progress

    ; Verificar si la palabra esta completa
    call check_progress
    
    pop di; cargar el valor inicial de di
    pop cx; cargar el valor inicial de cx
    pop bx; cargar el valor inicial de bx

    ret
fill_progress endp

; Verifica si la palabra ya está completa
; Lee el string progress
; mov ch, longitud_palabra
; retorna
; dh 1 si la palabra esta completa, 0 si no esta completa
check_progress proc near
    push ax; guardar el valor original de ax
    push bx; guardar el valor original de bx
    push cx; guardar valor original de cx

    mov dh, 1 ; la palabra esta completa
    mov cl, 0 ; indice del bucle
    lea bx, progress; acceder al string progress

check_progress_loop: 
    mov al, [bx]
    cmp al, '_'
    je check_progress_false

    ; Pasar a los siguientes 2 caracteres de progress
    inc bx
    inc bx
    ; Control de bucle
    inc cl
    cmp cl, ch
    jl check_progress_loop;
    jmp check_progress_continue;
    
check_progress_false:
    mov dh, 0; La palabra no esta completa

check_progress_continue:
    pop cx; cargar el valor original de cx
    pop bx; cargar el valor orignal de bx
    pop ax; cargar el valor orignal de ax
    ret
check_progress endp

; Leer un caracter
; Recibe dx, para mostrar un mensaje
; El valor leido se almacena en la variable input
read_char proc near
    push ax

    call print

    mov ax, 0100H ; Leer por consola
    int 21H; llamar al SO
    mov [input], al ; almacenar input

    ; imprimir salto de linea
    push dx
    lea dx, newline ; almacenar mensaje
    mov ax, 0900H ; Escribir nueva linea
    int 21H; llamar al SO
    pop dx

    pop ax
    ret

read_char endp

;Obtiene la opcion que digite el usuario
; retorna
; si, arreglo de cadenas
; bx, arreglo de longitudes
select_option proc near

select_option_loop:

    ; Lee el numero que digitado
    push dx

    ; Posicionar cursor sobre la misma posicion para evitar que se desplace
    mov dx, 1600H
    call set_console_pos

    ; Leer un caracter sin escribir mensaje
    lea dx, endstr
    call read_char 

    pop dx

    ; Compara el input con las opciones
    cmp input, '1'
    je select_fruta

    cmp input, '2'
    je select_animal

    cmp input, '3'
    je select_transporte
    jmp select_option_loop

select_fruta:
    call color_fruta

    lea si, frutas
    lea bx, frutas_lengths
    jmp finalizar

select_animal:
    call color_animal

    lea si, animales
    lea bx, animales_lengths
    jmp finalizar

select_transporte:
    call color_transporte

    lea si, transportes
    lea bx, transportes_lengths
    jmp finalizar

finalizar:

    ret
select_option endp

;Imprimir el menu
print_menu proc near
    push dx
    
     ;Imprimir integrantes
    lea dx, logoe
    call print

    lea dx, endstr
    call print

    ;Imprimir menu optiones
    lea dx, menu_option 
    call print
    pop dx

    ret
print_menu endp

; Imprimir en consola
;    lea dx, texto
;    call print
print proc near
    push ax
    push dx
   
    mov ax, 0900H ; Escribir en consola
    int 21H; llamar al SO

    lea dx, newline ; almacenar mensaje
    mov ax, 0900H ; Escribir en consola
    int 21H; llamar al SO

    pop dx
    pop ax
    ret
print endp

; Establecer posicion de la consola
; Recibe
; dx, posicion
set_console_pos proc near
    push ax
    push bx
    push dx

    mov AH,02H; función
    mov BH,00H; pagina actual
    INT 10H; Interrupción

    pop dx
    pop bx
    pop ax

    ret
set_console_pos endp


; Imprime el ahorcado
; Recibe
; ah contador de errores
print_ahorcado proc near
    ; Almacenar los valores originales de cxdx
    push ax
    push cx
    push dx
    push si
    push di

    mov cl, 0 ; indice del ciclo
    lea si, ascii_art ; Cadena ascii
    lea di, [si] ; Caracter actual

    ; Calcular offset
    mov al, 88
    mul ah

    add di, ax
    
print_ahorcado_loop:
    ; imprimir el ascii
    mov dx, di
    call print

    ; pasar al siguiente string
    add di, 11
    ; Control del ciclo
    inc cl
    cmp cl, 8
    jl print_ahorcado_loop;

    pop di
    pop si
    pop dx
    pop cx
    pop ax
    ret
print_ahorcado endp

clear_screen proc near ;procedimiento limpiar pantalla
    push ax
    push bx
    push cx
    push dx

    mov ax,0600H ;funci¢n 06h
    mov bh,02h ;N£mero de atributo(colores)
    mov cx,0000h ;fila y columnas iniciales
    mov dx,184fh ;fila y columna finales
    int 10h ;interrupción 10h de la BIOS
    
    pop dx
    pop cx
    pop bx
    pop ax

    ret
clear_screen endp

color_fruta proc near ;procedimiento limpiar pantalla
    push ax
    push bx
    push cx
    push dx

    mov ax,0600H ;funci¢n 06h
    mov bh, 70h ;N£mero de atributo(colores)
    mov cx,0000h ;fila y columnas iniciales
    mov dx,184fh ;fila y columna finales
    int 10h ;interrupción 10h de la BIOS
    
    pop dx
    pop cx
    pop bx
    pop ax

    ret
color_fruta endp

color_animal proc near ;procedimiento limpiar pantalla
    push ax
    push bx
    push cx
    push dx

    mov ax,0600H ;funci¢n 06h
    mov bh,17h ;N£mero de atributo(colores)
    mov cx,0000h ;fila y columnas iniciales
    mov dx,184fh ;fila y columna finales
    int 10h ;interrupción 10h de la BIOS
    
    pop dx
    pop cx
    pop bx
    pop ax

    ret
color_animal endp

color_transporte proc near ;procedimiento limpiar pantalla
    push ax
    push bx
    push cx
    push dx

    mov ax,0600H ;funci¢n 06h
    mov bh,27h ;N£mero de atributo(colores)
    mov cx,0000h ;fila y columnas iniciales
    mov dx,184fh ;fila y columna finales
    int 10h ;interrupción 10h de la BIOS
    
    pop dx
    pop cx
    pop bx
    pop ax

    ret
color_transporte endp

end