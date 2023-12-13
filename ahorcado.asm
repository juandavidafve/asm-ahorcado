;Estructura Básica de un programa ensamblador UFPS Arq Computadores
.model small
.386
.stack 64

.data
input db ?, '$'; Almacenar el input
progress db 32 dup ('0'), '$' ; Valores introducidos
characters db 18 dup ('0'), 13, 10
           db 18 dup ('0'), 13, 10
           db 16 dup ('0'), '$', '$'  ; Alfabeto, letras disponibles

; Strings del programa
msg_ask_input db "Escriba una letra:$"
msg_ask_string db "Ingrese una palabra (Sin tildes):$"
msg_winner db "     ___       __   ___  ________   ________   _______   ________ ",13,10
           db "         |\  \     |\  \|\  \|\   ___  \|\   ___  \|\  ___ \ |\   __  \",13,10
           db "         \ \  \    \ \  \ \  \ \  \\ \  \ \  \\ \  \ \   __/|\ \  \|\  \",13,10
           db "          \ \  \  __\ \  \ \  \ \  \\ \  \ \  \\ \  \ \  \_|/_\ \   _  _\",13,10
           db "           \ \  \|\__\_\  \ \  \ \  \\ \  \ \  \\ \  \ \  \_|\ \ \  \\  \|",13,10
           db "            \ \____________\ \__\ \__\\ \__\ \__\\ \__\ \_______\ \__\\ _\",13,10
           db "             \|____________|\|__|\|__| \|__|\|__| \|__|\|_______|\|__|\|__|",13,10
           db "$"
msg_loser db "               :::        ::::::::   ::::::::  :::::::::: :::::::::",13,10
          db "                   :+:       :+:    :+: :+:    :+: :+:        :+:    :+:",13,10
          db "                  +:+       +:+    +:+ +:+        +:+        +:+    +:+",13,10
          db "                 +#+       +#+    +:+ +#++:++#++ +#++:++#   +#++:++#:",13,10
          db "               +#+       +#+    +#+        +#+ +#+        +#+    +#+",13,10          
          db "              #+#       #+#    #+# #+#    #+# #+#        #+#    #+#",13,10
          db "             ########## ########   ########  ########## ###    ###", 13, 10
          db "$"
msg_next_word db "Presiona C para continuar con otra palabra o ESC para salir$"
msg_end_game db "Presiona ESC para salir$"
newline db 13, 10, '$' ; Caracteres de nueva linea
endstr db '$' ; Caracter de fin de string
color db 02H ; Tipo de color
color_finish db '$' ; variable color para finish
conteo db 0 ; Contar de letras de una cadena

;String logo e integrantes
menu db 13, 10
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
      db "     |-------------------ALTA-CALIDAD-ARQUITECTURA-DE-PC-------------------|",13,10
      db "     |---------------------------------------------------------------------|",13,10
      db "     |       BIENVENIDOS A AHORCADO                                        |",13,10
      db "     |                                                   __    ___  __  __ |",13,10
      db "     |       Elige la tematica:                         /__\  / __)(  \/  )|",13,10
      db "     |    1. Fruta         2. Animal                   /(__)\ \__ \ )    ( |",13,10
      db "     |    3. Transporte    4. Palabra libre           (__)(__)(___/(_/\/\_)|",13,10
      db "     |                                                                     |",13,10
      db "     |ESC. Salir                                                           |",13,10
      db "     |---------------------------------------------------------------------|$"

;Strings de variables
frutas db "manzana$", "platano$", "fresa$", "uva$", "naranja$", "sandia$", "pera$", "kiwi$", "mango$", "cereza$", "mandarina$", "coco$", "almendra$", "frambuesa$", "papaya$", "mora$", "higo$", "toronja$", "guayaba$", "pitaya$" 
frutas_lengths db 7, 7, 5, 3, 7, 6, 4, 4, 5, 6, 9, 4, 8, 9, 6, 4, 4, 7, 7, 6

animales db "perro$", "gato$", "elefante$", "jirafa$", "tigre$", "cebra$", "loro$", "mono$", "koala$", "oso$", "medusa$", "almeja$", "liebre$", "avestruz$", "tarantula$", "venado$", "cachalote$", "foca$", "calamar$", "mandril$"
animales_lengths db 5, 4, 8, 6, 5, 5, 4, 4, 5, 3, 6, 6, 6, 8, 9, 6, 9, 4, 7, 7

transportes db "auto$", "bicicleta$", "barco$", "avion$", "tren$", "camion$", "motocicleta$", "helicoptero$", "submarino$", "taxi$", "metro$", "tractor$", "kayak$", "teleferico$", "lancha$", "tanque$", "skate$", "dirigible$", "ferry$", "furgoneta$"
transportes_lengths db 4, 9, 5, 5, 4, 6, 11, 11, 9, 4, 5, 7, 5, 10, 6, 6, 5, 9, 5, 9

free_word db 16 dup (0), 0 ; Para palabra libre

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
          db 0BAH, 0BAH, "     ", 02FH , "  $"
          db 0BAH, 0BAH, "        $"
          db 0CAH, 0CAH, 0CDH, 0CDH, 0CDH, 0CDH, 0CDH, 0CDH, 0CDH, 0CDH, '$'
          ;
          db 0CBH, 0CBH, 0CDH, 0CDH, 0CDH, 0CDH, 0CDH, 0CDH, 0CDH, " $"
          db 0BAH, 0BAH, "        $" 
          db 0BAH, 0BAH, "        $"
          db 0BAH, 0BAH, "     ", 02FH , 0B3H, 05CH , '$'
          db 0BAH, 0BAH, "      ", 0B3H, " $"
          db 0BAH, 0BAH, "     ", 02FH , " ", 05CH , '$'
          db 0BAH, 0BAH, "        $"
          db 0CAH, 0CAH, 0CDH, 0CDH, 0CDH, 0CDH, 0CDH, 0CDH, 0CDH, 0CDH, '$'
          ;
          db 0CBH, 0CBH, 0CDH, 0CDH, 0CDH, 0CDH, 0CDH, 0CDH, 0CDH, " $"
          db 0BAH, 0BAH, "      ", 0B3H, " $"
          db 0BAH, 0BAH, "      ", 'O', " $"
          db 0BAH, 0BAH, "     ", 02FH , 0B3H, 05CH , '$'
          db 0BAH, 0BAH, "      ", 0B3H, " $"
          db 0BAH, 0BAH, "     ", 02FH , " ", 05CH , '$'
          db 0BAH, 0BAH, "        $"
          db 0CAH, 0CAH, 0CDH, 0CDH, 0CDH, 0CDH, 0CDH, 0CDH, 0CDH, 0CDH, '$'

.code
inicio proc near
    mov ax, @data ; Cargar el segmento de datos en ax.
    mov ds, ax ; Establecer ds con el segmento de datos.
    
    game_loop:
    ; Limpiar la pantalla
    mov [color], 02H
    call select_color ; cambio

    ;;Imprimir menu
    call print_menu

    ;;Seleccionar opción
    call select_option

    ; Si la opción fue salir, terminar el programa
    cmp si, 0
    je salir

    ; Si no, entonces empezar el juego
    cmp input, '4'
    je jugarLibre
    
    jmp jugarCadenas

    jugarLibre:
    call play_free
    jmp presalir

    jugarCadenas:
    call play
    
presalir:
    call clean_string
    jmp game_loop

salir:
    mov ax, 4C00H  ; Interrupcion de terminar
    int 21H        ; Llamada a la interrupcion

inicio endp

; -- MÉTODO: INICIALIZAR JUEGO --
; Este método inicia el juego solo cuando es palabra libre
; No se devuelve al menú
play_free proc near

    push ax
    push bx
    push cx
    push dx
    push si

    play_loopFREE:
    ; Guardar el valor de bx en ax
    mov ax, [bx]
    mov ah, 0

    ; Mover a ch la cant de letras en la palabra
    mov ch, al
    call play_word

    lea dx, msg_next_word 
    call print ;Imprime el mensaje de continuar (C) o EXIT
    
    lea dx, endstr
    call print
    play_loop_read_next_inputFREE: 
    ; Mostrar mensaje de siguiente palabra

    ;Leer caracter (No imprime, solo lee)
    mov dx, 1800H
    call set_console_pos

    call read_onlychar 
    
    ;Esta sección realiza comparaciones de acuerdo a las teclas
    cmp input, 1BH ; Compara si la tecla es ESC
    je play_exitFREE ; Si son iguales, vuelve al menú

    cmp input, 63H ; Compara si la tecla es c (minúscula) para continuar
    je play_loop_continueFREE
    
    cmp input, 2EH ; Comparar si la tecla es C (mayúscula) para continuar
    je play_loop_continueFREE

    jmp play_loop_read_next_inputFREE ; Si es una tecla diferente, se repite hasta que presione C/c o ESC
    ;FIN comparaciones

    play_loop_continueFREE:
    call select_color ;Vuelve a seleccionar el color, limpia la pantalla
    call clean_string

    ; Como el método no se devuelve al menú, debe leer la cadena y contar la misma aquí
    lea dx, msg_ask_string
    call print 

    lea dx, endstr
    call print

    call read_string
    call count_string

    call select_color ;Vuelve a seleccionar el color, limpia la pantalla

    jmp play_loopFREE

    play_exitFREE:

    pop si
    pop dx
    pop cx
    pop bx
    pop ax

    ret
play_free endp

; -- MÉTODO: INICIALIZAR JUEGO --
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
    cmp cl, 19
    je play_loop_skip_prompt

    lea dx, msg_next_word 
    call print ;Imprime el mensaje de continuar (C) o EXIT
    
    play_loop_read_next_input: 
    ; Mostrar mensaje de siguiente palabra

    ;Leer caracter (No imprime, solo lee)
    mov dx, 1800H
    call set_console_pos

    call read_onlychar 
    
    ;Esta sección realiza comparaciones de acuerdo a las teclas
    cmp input, 1BH ; Compara si la tecla es ESC
    je play_exit ; Si son iguales, vuelve al menú

    cmp input, 63H ; Compara si la tecla es c (minúscula) para continuar
    je play_loop_continue
    
    cmp input, 2EH ; Comparar si la tecla es C (mayúscula) para continuar
    je play_loop_continue

    jmp play_loop_read_next_input ; Si es una tecla diferente, se repite hasta que presione C/c o ESC
    ;FIN comparaciones

    play_loop_continue:
    call select_color ;Vuelve a seleccionar el color, limpia la pantalla

    play_loop_skip_prompt:  
    

    ; Pasar si a la siguiente palabra
    add si, ax
    inc si ; Agregar un caracter más para el $ al final de cada palabra
    inc bx ; Pasar bx al siguiente numero

    ; control del ciclo
    inc cl
    cmp cl, 20 ; Cant de palabras
    jl play_loop

    play_finish_input:

    ; Solicitar la tecla ESC para salir
    lea dx, msg_end_game
    call read_char
    cmp input, 1BH ; Compara si la tecla es ESC
    jne play_finish_input ; Si son iguales, se sale del juego

    play_exit:

    pop si
    pop dx
    pop cx
    pop bx
    pop ax
ret
play endp

; -- MÉTODO: JUGAR CON PALABRA --
; Jugar con una palabra
; lea si, palabra
; mov ch, longitud
play_word proc near
    push ax; preserver el valor de ax
    push cx; preserver el valor de cx
    push dx; preserver el valor de dx

    mov cl, 0 ; definir el contador de errores en 0
    call init_progress ; inicializar el string de progreso
    call init_characters ; inicializar el string de letras del alfabeto

read_word:

    ; imprimir progreso
    lea dx, progress
    call print

    ; Imprimir ascii del ahorcado
    mov ah, cl
    call print_ahorcado

    ; Imprimir salto de linea
    lea dx, newline
    call print

    ; Imprimir las letras disponibles
    lea dx, characters
    call print

    ; Imprimir salto de linea
    lea dx, newline
    call print
    
    ; leer caracter
    lea dx, msg_ask_input
    call read_char
    
    jmp play_word_check_input

    ; Ignorar cuando la letra es diferente de a-z
    play_word_ignore_input:
    mov dx, 1600H
    call set_console_pos
    
    lea dx, endstr
    call read_char

    play_word_check_input:
    cmp input, 'a'
    jl play_word_ignore_input
    cmp input, 'z'
    jg play_word_ignore_input

    ; llenar progreso
    mov ah, input
    mov dx, 0
    call fill_progress

    cmp dl, 0
    je char_not_found
    jmp char_continue

char_not_found:
    ; Eliminar caracter de los disponibles
    call remove_char
    ; dl pasa a ser 1 si el caracter se ha escrito previamente

    ; No sumar al contador de fallos si el caracter ya ha sido marcado
    cmp dl, 0
    je char_continue

    inc cl ; sumar 1 al contador de fallos
    call select_color ;Vuelve a seleccionar el color

char_continue:
    ; Eliminar caracter de los disponibles
    call remove_char

    call select_color ;Vuelve a seleccionar el color
    cmp dh, 1
    je word_finished

    ; control del bucle
    cmp cl, 8
    jl read_word

    ;Llenar la palabra
    call complete_word

    ; imprimir mensaje de perder
    mov color_finish, 04h ;cambia color font rojo
    call select_color_finish
    mov dx,0405h
    call ubicar
    lea dx, msg_loser
    call print

    jmp word_continue

word_finished:
  
    ; imprimir mensaje ganar
    mov color_finish, 06h ;cambia color font amarrillo
    call select_color_finish
    mov dx,0405h
    call ubicar
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

; -- MÉTODO: INICIALIZAR STRING CON LETRAS DEL ALFABETO --
; Llena el string characters con las letras del alfabeto. Este string lleva registro de las teclas presionadas
init_characters proc near
    push ax
    push bx
    push cx
    push si

    lea si, characters ; Cargar la cadena de caracteres disponibles
    mov cx, 26 ; Hay 26 letras en el alfabeto
    mov ax, " a"; 'a' se almacena en ah y ' ' se almacena en al

    loop_char_srt:
    mov [si], ax ; modificar el string

    inc al ; aumentar el valor ascii

    ; Si la letra es j o s, hacer un salto de linea, si no, continua el bucle
    cmp al, 'j'
    je loop_char_srt_break_line
    cmp al, 's'
    je loop_char_srt_break_line
    jmp loop_char_srt_skip_break_line

    loop_char_srt_break_line:
    mov bx, 10
    inc si
    mov [si], bx

    mov bx, 13
    inc si
    mov [si], bx

    loop_char_srt_skip_break_line:
    ; Pasar a las siguientes dos posiciones de si, una para la letra y otra para el espacio
    inc si
    inc si
    loop loop_char_srt

    pop si
    pop cx
    pop bx
    pop ax
    ret
init_characters endp

; -- MÉTODO: INICIALIZAR STRING PROGRESO --
; Inicializar el string de progreso
; Recibe
;   si, palabra
;   ch, longitud_palabra
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

; Eliminar la letra introducida de la lista de letras disponibles
; Recibe   
;   ah, letra a buscar
; retorna
;   dl se encontro la letra, 0 o 1
remove_char proc near 
    push bx
    push cx
    push si

    lea si, characters ; Cargar la cadena de caracteres disponibles
    mov cx, 56 ; Hay 56 espacios en el string characters
    mov dl, 0

    remove_char_loop:
    ; Comparar si el caracter actual y el que se buscan son iguales
    cmp [si], ah
    jne next_remove_char_loop

    ; Si son iguales, modificarlo
    mov bx, [si]
    mov bl, 'X'

    mov [si], bx
    mov dl, 1

    next_remove_char_loop:
    ; Pasar a las siguiente posiciones de si
    inc si
    loop remove_char_loop

    pop si
    pop cx
    pop bx

    ret 
remove_char endp


; -- MÉTODO: COMPLETAR PROGRESO --
; Completar el progreso a medida que se escriben las letras
; Recibe   
;   ah, letra a buscar
;   ch, longitud_palabra
;   si, palabra
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

    mov dx, 0
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
    ; pasar a los siguientes dos caracteres de progress
    inc bx
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

; -- MÉTODO: VERIFICAR PALABRA --
; Verifica si la palabra ya está completa leyendo el string progress
; Recibe
; ch, longitud_palabra
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

; -- MÉTODO: COMPLETAR PALABRA --
; Completa la palabra en el string progress
complete_word proc near
    push ax
    push cx
    push dx
    push di 

    mov cl, ch
    mov di, si
complete_word_loop:
    mov ah, [di]
    call fill_progress
    
    inc di
    dec cl
    cmp cl, 0
    jg complete_word_loop

    pop di
    pop dx
    pop cx
    pop ax
ret
complete_word endp

; -- MÉTODO: LEER CARACTER --
; Leer un caracter (Imprime primero un mensaje)
; Recibe dx, para mostrar un mensaje
; El valor leido se almacena en la variable input
read_char proc near
    
    call print

    push ax

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

; -- MÉTODO: LEER CARACTER --
; Leer un caracter (No imprime)
read_onlychar proc near

    push ax

    mov ax, 0100H ; Leer por consola
    int 21H; llamar al SO
    mov [input], al ; almacenar input

    pop ax

    ret
read_onlychar endp

; -- MÉTODO: LEER CADENA --
;Lee una cadena
read_string proc near
    push ax
    push si

    mov si, 0

    leerCadena:
    mov ax, 0100H ; Leer por consola
    int 21H; llamar al SO

    ; Comprobar si el carácter es una letra (mayúscula o minúscula)
    cmp al, 0dh
    je finRead

    cmp al, 'A'
    jl  leerCadena

    cmp al, 'Z'
    jle minuscula

    cmp al, 'a'
    jl  leerCadena

    cmp al, 'z'
    jle copiarDato

    ;jmp not_letter

    minuscula:
    ;add al, 32
    ;or al, 00100000B ; Otra forma de pasar a minúscula

    copiarDato:
    mov free_word[si], al ; almacenar input
    inc si
    jmp leerCadena

    
    finRead:
    pop si
    pop ax
    ret

read_string endp

; -- MÉTODO: SELECCIONAR OPCIÓN --
;Obtiene la opcion que digite el usuario
; retorna
; si, arreglo de cadenas, 0 cuando se selecciona salir
; bx, arreglo de longitudes, 0 cuando se selecciona salir
select_option proc near

select_option_loop:

    ; Lee el numero que digitado
    push dx

    ; Posicionar cursor sobre la misma posicion para evitar que se desplace
    mov dx, 1600H
    call set_console_pos

    ; Leer un caracter sin escribir mensaje
    lea dx, newline

    call print
    call read_onlychar 

    pop dx

    ; Compara el input con las opciones
    cmp input, '1'
    je select_fruta

    cmp input, '2'
    je select_animal

    cmp input, '3'
    je select_transporte

    cmp input, '4' ;Palabra libre
    je leerString
    jmp seguir

    leerString: ; Leer el string
    lea dx, newline
    call print

    lea dx, msg_ask_string
    call print
    call read_string

    ;cmp input, '4' ;Seleccionar palabra libre
    je select_libre

    seguir:
    cmp input, 1BH ; TECLA ESCAPE / ESC
    je select_exit

    jmp select_option_loop

select_fruta:
    mov color, 70h
    call select_color

    lea si, frutas
    lea bx, frutas_lengths

    jmp finalizar

select_animal:
    mov color, 17h
    call select_color

    lea si, animales
    lea bx, animales_lengths

    jmp finalizar

select_transporte:
    mov color, 27h
    call select_color

    lea si, transportes
    lea bx, transportes_lengths

    jmp finalizar

select_libre:
    mov color, 37h
    call select_color

    lea si, free_word
    call count_string
    lea bx, conteo

    jmp finalizar

select_exit:
    mov si, 0
    mov bx, 0

finalizar:

    ret
select_option endp

; -- MÉTODO: IMPRIMIR MENÚ --
;Imprimir el menú
print_menu proc near
    push dx
    
    ;Imprimir Menú
    lea dx, menu
    call print

    pop dx

    ret
print_menu endp

; -- MÉTODO: IMPRIMIR TEXTO CONSOLA --
; Imprimir un texto en consola
; Recibe 
; dx, texto
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

; -- MÉTODO: ESTABLECER POSICIÓN CONSOLA --
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

; -- MÉTODO: IMPRIMIR AHORCADO --
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

; -- MÉTODO: SELECCIONAR COLOR --
; Limpiar la pantalla y cambiar su color
; El color lo lee desde la variable color
select_color proc near
    push ax
    push bx
    push cx
    push dx

    mov ax,0600H ; Función 06h
    mov bh,[color] ;Número de atributo(colores)
    mov cx,0000h ; fila y columna inicial
    mov dx,184fh ; fila y columna final
    int 10h ; interrupción 10h de la BIOS
    
    pop dx
    pop cx
    pop bx
    pop ax
    ret
select_color endp

; -- MÉTODO: SELECCIONAR COLOR WINNER/LOSER --
; Limpiar la pantalla y cambiar su color
; El color lo lee desde la variable color_finish
select_color_finish proc near
    push ax
    push bx
    push cx
    push dx

    mov ax,0600H ;funci¢n 06h
    mov bh,[color_finish] ;N£mero de atributo(colores)
    mov cx,0405h ;fila y columnas iniciales
    mov dx,0A4Bh ;fila y columna finales
    int 10h ;interrupción 10h de la BIOS
    
    pop dx
    pop cx
    pop bx
    pop ax
    ret
select_color_finish endp

; -- MÉTODO: LIMPIAR STRING --
;Limpiar un string (Lo llena de ceros (0))
clean_string proc near

    push ax
    push cx
    push dx

    mov cx, 16      ; Longitud del buffer
    lea di, free_word ; Puntero al buffer
    xor al, al          ; Valor cero (0)
    
    clean_loop:
    mov [di], al ;(0)   ; Sobrescribir el byte actual con cero
    inc di          ; Mover al siguiente byte
    loop clean_loop ; Repetir hasta que se limpie toda la cadena

    pop dx
    pop cx
    pop ax

    ret
clean_string endp

; -- MÉTODO: CONTAR LETRAS --
;Contar letras de una cadena
count_string proc near

    push ax
    push cx
    push si

    lea si, free_word   ; Cargar la dirección efectiva de la cadena en si
    mov cx, 16        ; Longitud de cadena
    mov conteo, 0       ; Inicializar el conteo de letras
    
    count_letters:
        mov al, [si]    ; Cargar el byte actual de la cadena en al
        cmp al, 0       ; Comprobar si es el final de la cadena
        je  end_count   ; Si es el final, salir del bucle
        
        inc conteo  ; Incrementar el conteo de letras
        inc si      ; Mover al siguiente byte

        loop count_letters ; Repetir hasta el final de la cadena

        end_count:

        pop si
        pop cx
        pop ax
    ret
count_string endp

UBICAR proc near 
push ax
push bx

  mov ah,02h           	   
  mov bh,00h            	   
  int 10h

pop bx
pop ax                	
  ret                   		   
UBICAR endp  
end