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
newline db 13, 10, '$' ; Caracteres de nueva linea

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

test_word db "manzana$"

;string db '$$'

.code
inicio proc near
    mov ax, @data ; Cargar el segmento de datos en ax.
    mov ds, ax ; Establecer ds con el segmento de datos.

    lea si, test_word
    mov ch, 7
    call play_word

salir:
    mov ax, 4C00H  ; Interrupcion de terminar
    int 21H        ; Llamada a la interrupcion

inicio endp

; Jugar con una palabra
; lea si, palabra
; mov ch, longitud
play_word proc near
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

    ret
play_word endp


; Inicializar el string de progreso
;   lea si, palabra (ya proviene del metodo play_word)
;   mov ch, longitud_palabra (ya proviene del metodo play_word)
init_progress proc near
    push cx ; preservar el valor de cx
    
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
    pop cx ; devolver cx a su valor original
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
    push cx ; guardar el valor de cx en la pila, para evitar que quede modificado cuando termine el procedimiento 
    
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
    
    pop cx; cargar el valor inicial de cx al momento de invocar el procedimiento

    ret
fill_progress endp

; Verifica si la palabra ya está completa
; Lee el string progress
; mov ch, longitud_palabra
; retorna
; dh 1 si la palabra esta completa, 0 si no esta completa
check_progress proc near
    push cx; guardar valor original de cx
    mov dh, 1 ; la palabra esta completa
    mov cl, 0 ; indice del bucle
    lea bx, progress; acceder al string progress

check_progress_loop:
    mov al, [bx]
    cmp al, '_'
    je check_progress_false

    inc bx
    inc bx ; pasar al siguiente caracter de progress
    ; Control de bucle
    inc cl
    cmp cl, ch
    jl check_progress_loop;
    jmp check_progress_continue;
    
check_progress_false:
    mov dh, 0; La palabra no esta completa

check_progress_continue:
    pop cx; cargar el valor original de cx
    ret
check_progress endp

; Leer un caracter
; No recibe registros, el valor leido se almacena en la variable input
read_char proc near

    lea dx, msg_ask_input ; almacenar mensaje
    call print

    mov ax, 0100H ; Leer por consola
    int 21H; llamar al SO
    mov [input], al ; almacenar input

    ; imprimir salto de linea
    lea dx, newline ; almacenar mensaje
    mov ax, 0900H ; Escribir nueva linea
    int 21H; llamar al SO

    ret

read_char endp


; Imprimir en consola
;    lea dx, texto
;    call print
print proc near

    mov ax, 0900H ; Escribir en consola
    int 21H; llamar al SO

    lea dx, newline ; almacenar mensaje
    mov ax, 0900H ; Escribir en consola
    int 21H; llamar al SO

    ret
print endp

; Imprime el ahorcado
; Recibe
; ah contador de errores
print_ahorcado proc near
    ; Almacenar los valores originales de cxdx
    push ax
    push cx
    push dx
    push si

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
    mov bh,1bh ;N£mero de atributo(colores)
    mov cx,0000h ;fila y columnas iniciales
    mov dx,184fh ;fila y columna finales
    int 10h ;interrupción 10h de la BIOS
    
    pop dx
    pop cx
    pop bx
    pop ax

    ret
clear_screen endp

;;--metodo para imprimir el valor de un registro--;;
;	;recibe:
;	;	ax: el numero a imprimir	
;	printint proc near
;		push ax
;		push bx
;		push cx
;		push dx
;		push si
;			;; ----- INICIO DEL CODIGO DE IMPRIMIR, LO QUE QUIERA IMPRIMIR, METALO EN X
;			mov cx, 0 ; contador de digitos
;		to_stack: ;mete los digitos en la pila para reversarlos
;		
;			mov dx, 0 ; este guarda el residuo de la division
;			inc cx ;+1 digito
;			mov bx, 10 ;divisor
;			
;			div bx 
;			push dx ;metemos ax mod 10 a la cola (dx)
;			cmp ax, 0 ;si ax es 0, salimos
;			jne to_stack     
;		
;		lea si, string
;			
;		to_string: ;pasa de la pila al string
;			mov dx, 0
;			pop dx
;			add dx,48
;			mov [si], dx
;			inc si
;			dec cx
;			cmp cx, 0
;			jne to_string
;		imprimir:;imprime
;			mov cl, '$'
;			mov [si], cl
;			lea dx, string
;
;			;output the string 
;			;loaded in dx  
;			mov ah,09h 
;			int 21h  
;
;			;salto de linea
;			MOV dl, 10
;			MOV ah, 02h
;			INT 21h
;			MOV dl, 13
;			MOV ah, 02h
;			INT 21h
;		mov cx, 10
;		reset: ;resetea string, para almacenar el siguiente numero
;			lea si, string
;			mov dx, '$'
;			mov [si], dx
;			inc si
;			dec cx
;			cmp cx, 0
;			jne reset
;		xor cx, cx
;		pop si
;		pop dx
;		pop cx
;		pop bx
;		pop ax
;	ret
;   printint endp
end