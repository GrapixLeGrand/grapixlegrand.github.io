generate_random_rand(permutation_args_t*):
        mov     eax, DWORD PTR [rdi+16]
        test    eax, eax
        je      .L7
        push    r12
        push    rbp
        mov     rbp, rdi
        push    rbx
        xor     ebx, ebx
.L3:
        mov     rax, QWORD PTR [rbp+8]
        lea     r12, [rax+rbx*4]
        call    rand
        mov     DWORD PTR [r12], eax
        inc     rbx
        movsx   rax, DWORD PTR [rbp+16]
        cmp     rax, rbx
        ja      .L3
        pop     rbx
        pop     rbp
        pop     r12
        ret
.L7:
        ret
generate_random_manual(permutation_args_t*):
        mov     eax, DWORD PTR [rdi+16]
        test    eax, eax
        je      .L15
        mov     rcx, QWORD PTR [rdi+8]
        xor     edx, edx
.L13:
        imul    eax, DWORD PTR [rdi+80], 214013
        add     eax, 2531011
        mov     DWORD PTR [rdi+80], eax
        shr     eax, 16
        and     eax, 32767
        mov     DWORD PTR [rcx+rdx*4], eax
        inc     rdx
        movsx   rax, DWORD PTR [rdi+16]
        cmp     rax, rdx
        ja      .L13
.L15:
        ret
generate_random_dummy(permutation_args_t*):
        mov     eax, DWORD PTR [rdi+16]
        test    eax, eax
        je      .L20
        mov     rcx, QWORD PTR [rdi+8]
        xor     eax, eax
.L18:
        mov     DWORD PTR [rcx+rax*4], eax
        inc     rax
        movsx   rdx, DWORD PTR [rdi+16]
        cmp     rdx, rax
        ja      .L18
.L20:
        ret
