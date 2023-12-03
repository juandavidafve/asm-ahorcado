;Estructura Básica de un programa ensamblador UFPS Arq Computadores
.model small
.386
.stack 64

.data
input db ?, '$'; Almacenar el input
newline db 13, 10, '$' ; Caracteres de nueva linea
message_start db "Escriba una letra:$"; Mensaje inicio
message_end db "El valor escrito fue:$"; mensaje fin
progress db 16 dup ('_'), "$" ; valores contestados

test_word db "manzana$"

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
; call play_word
play_word proc near
    mov cl, 0 ; definir el indice en 0

read_word:
    ; taba mirando la parte de la pantalla
    ;push cx
    ;mov ax, 0600H; función y pagina tota la pantalla
    ;mov bh, 71H; -> Color FONDO – LETRA “Blanco - Azul”
    ;mov cx, 0000H; -> Posición de inicio
    ;mov dx, 184FH; -> Posición Final
    ;int 10H; Interrupción
    ;pop cx

    ; imprimir la palabra
    lea dx, [si]
    call print

    ; leer caracter
    call read_char
    
    ; llenar progreso
    mov ah, input

    call fill_progress

    ; control del bucle
    inc cl
    cmp cl, ch
    jl read_word

    ret
play_word endp

; Completar el progreso a medida que se escriben las letras
;   mov ah, letra a buscar
;   mov ch, longitud_palabra (ya proviene del metodo play_word)
;   lea si, palabra (ya proviene del metodo play_word)
fill_progress proc near
    push cx ; guardar el valor de cx en la pila, para evitar que quede modificado cuando termine el procedimiento 

    ; ch lonigud palabra
    ; cl control del ciclo
    ; di letra de la palabra
    ; bx string de progreso
    ; ah letra a buscar
    
    mov cl, 0
    mov di, si
    lea bx, progress;

read_progress:
    cmp ah, [di]
    je modify_progress
    jmp continue_read_progress

modify_progress:
    mov [bx], ah


continue_read_progress:
    inc di ; pasar a la siguiente letra de la palabra
    inc bx ; pasar al siguiente caracter de progress
    ; control del bucle
    inc cl
    cmp cl, ch
    jl read_progress


    ; limpiar caracteres sobrantes de progress, cuando la palabra es menor o igual 16 caracteres
clear_progress_overflow:

    mov al, '$'
    mov [bx], al

    inc bx ; pasar al siguiente caracter de progress
    ; control del bucle
    inc cl
    cmp cl, 16
    jle clear_progress_overflow

    ; imprimir progreso
    lea dx, progress
    call print

    pop cx; cargar el valor inicial de cx al momento de invocar el procedimiento

    ret
fill_progress endp

; Leer un caracter
; No recibe registros, el valor leido se almacena en la variable input
read_char proc near

    lea dx, message_start ; almacenar mensaje
    call print

    mov ax, 0100H ; Leer por consola
    int 21H; llamar al SO
    mov [input], al ; almacenar input

    lea dx, message_end ; mensaje fin
    call print

    lea dx, input ; almacenar input
    call print

    ret

read_char endp


; Imprimir en consola
;    lea dx, texto
;    call print
print proc near
    
    push dx

    lea dx, newline ; almacenar mensaje
    mov ax, 0900H ; Escribir en consola
    int 21H; llamar al SO

    pop dx

    mov ax, 0900H ; Escribir en consola
    int 21H; llamar al SO

    lea dx, newline ; almacenar mensaje
    mov ax, 0900H ; Escribir en consola
    int 21H; llamar al SO

    ret
print endp

print_ahorcado proc near
; Imprimir segun la cant de fallos

; 0 fallos
;══════════

; 1 fallo

;╦╦
;║║
;║║
;║║
;║║
;║║
;║║
;╩╩════════

; 2 fallos
;╦╦═══════
;║║
;║║
;║║
;║║
;║║
;║║
;╩╩════════

; 3 fallos

;╦╦═══════
;║║
;║║
;║║      │
;║║      │
;║║
;║║
;╩╩════════

; 4 fallos

;╦╦═══════
;║║
;║║      
;║║     /│
;║║      │
;║║
;║║
;╩╩════════

; 5 fallos

;╦╦═══════
;║║
;║║      
;║║     /│\
;║║      │
;║║
;║║
;╩╩════════

; 6 fallos

;╦╦═══════
;║║
;║║      
;║║     /│\
;║║      │
;║║     /
;║║
;╩╩════════

; 7 fallos

;╦╦═══════
;║║
;║║      
;║║     /│\
;║║      │
;║║     / \
;║║
;╩╩════════

; 8 fallos

;╦╦══════╕
;║║      │
;║║      ☺
;║║     /│\
;║║      │
;║║     / \
;║║
;╩╩════════
    ret
print_ahorcado endp

end