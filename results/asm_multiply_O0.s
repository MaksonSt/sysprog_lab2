0000000000001358 <multiply(std::vector<float, std::allocator<float> > const&, std::vector<float, std::allocator<float> > const&, std::vector<float, std::allocator<float> >&, int)>:
    1358:	endbr64
    135c:	push   rbp
    135d:	mov    rbp,rsp
    1360:	sub    rsp,0x40
    1364:	mov    QWORD PTR [rbp-0x28],rdi
    1368:	mov    QWORD PTR [rbp-0x30],rsi
    136c:	mov    QWORD PTR [rbp-0x38],rdx
    1370:	mov    DWORD PTR [rbp-0x3c],ecx
    1373:	mov    DWORD PTR [rbp-0x14],0x0
    137a:	jmp    1475 <multiply(std::vector<float, std::allocator<float> > const&, std::vector<float, std::allocator<float> > const&, std::vector<float, std::allocator<float> >&, int)+0x11d>
    137f:	mov    DWORD PTR [rbp-0x10],0x0
    1386:	jmp    13b4 <multiply(std::vector<float, std::allocator<float> > const&, std::vector<float, std::allocator<float> > const&, std::vector<float, std::allocator<float> >&, int)+0x5c>
    1388:	mov    eax,DWORD PTR [rbp-0x14]
    138b:	imul   eax,DWORD PTR [rbp-0x3c]
    138f:	mov    edx,eax
    1391:	mov    eax,DWORD PTR [rbp-0x10]
    1394:	add    eax,edx
    1396:	movsxd rdx,eax
    1399:	mov    rax,QWORD PTR [rbp-0x38]
    139d:	mov    rsi,rdx
    13a0:	mov    rdi,rax
    13a3:	call   1b2a <std::vector<float, std::allocator<float> >::operator[](unsigned long)>
    13a8:	pxor   xmm0,xmm0
    13ac:	movss  DWORD PTR [rax],xmm0
    13b0:	add    DWORD PTR [rbp-0x10],0x1
    13b4:	mov    eax,DWORD PTR [rbp-0x10]
    13b7:	cmp    eax,DWORD PTR [rbp-0x3c]
    13ba:	jl     1388 <multiply(std::vector<float, std::allocator<float> > const&, std::vector<float, std::allocator<float> > const&, std::vector<float, std::allocator<float> >&, int)+0x30>
    13bc:	mov    DWORD PTR [rbp-0xc],0x0
    13c3:	jmp    1465 <multiply(std::vector<float, std::allocator<float> > const&, std::vector<float, std::allocator<float> > const&, std::vector<float, std::allocator<float> >&, int)+0x10d>
    13c8:	mov    eax,DWORD PTR [rbp-0x14]
    13cb:	imul   eax,DWORD PTR [rbp-0x3c]
    13cf:	mov    edx,eax
    13d1:	mov    eax,DWORD PTR [rbp-0xc]
    13d4:	add    eax,edx
    13d6:	movsxd rdx,eax
    13d9:	mov    rax,QWORD PTR [rbp-0x28]
    13dd:	mov    rsi,rdx
    13e0:	mov    rdi,rax
    13e3:	call   1b7c <std::vector<float, std::allocator<float> >::operator[](unsigned long) const>
    13e8:	movss  xmm0,DWORD PTR [rax]
    13ec:	movss  DWORD PTR [rbp-0x4],xmm0
    13f1:	mov    DWORD PTR [rbp-0x8],0x0
    13f8:	jmp    1459 <multiply(std::vector<float, std::allocator<float> > const&, std::vector<float, std::allocator<float> > const&, std::vector<float, std::allocator<float> >&, int)+0x101>
    13fa:	mov    eax,DWORD PTR [rbp-0xc]
    13fd:	imul   eax,DWORD PTR [rbp-0x3c]
    1401:	mov    edx,eax
    1403:	mov    eax,DWORD PTR [rbp-0x8]
    1406:	add    eax,edx
    1408:	movsxd rdx,eax
    140b:	mov    rax,QWORD PTR [rbp-0x30]
    140f:	mov    rsi,rdx
    1412:	mov    rdi,rax
    1415:	call   1b7c <std::vector<float, std::allocator<float> >::operator[](unsigned long) const>
    141a:	movss  xmm0,DWORD PTR [rax]
    141e:	mulss  xmm0,DWORD PTR [rbp-0x4]
    1423:	movss  DWORD PTR [rbp-0x40],xmm0
    1428:	mov    eax,DWORD PTR [rbp-0x14]
    142b:	imul   eax,DWORD PTR [rbp-0x3c]
    142f:	mov    edx,eax
    1431:	mov    eax,DWORD PTR [rbp-0x8]
    1434:	add    eax,edx
    1436:	movsxd rdx,eax
    1439:	mov    rax,QWORD PTR [rbp-0x38]
    143d:	mov    rsi,rdx
    1440:	mov    rdi,rax
    1443:	call   1b2a <std::vector<float, std::allocator<float> >::operator[](unsigned long)>
    1448:	movss  xmm0,DWORD PTR [rax]
    144c:	addss  xmm0,DWORD PTR [rbp-0x40]
    1451:	movss  DWORD PTR [rax],xmm0
    1455:	add    DWORD PTR [rbp-0x8],0x1
    1459:	mov    eax,DWORD PTR [rbp-0x8]
    145c:	cmp    eax,DWORD PTR [rbp-0x3c]
    145f:	jl     13fa <multiply(std::vector<float, std::allocator<float> > const&, std::vector<float, std::allocator<float> > const&, std::vector<float, std::allocator<float> >&, int)+0xa2>
    1461:	add    DWORD PTR [rbp-0xc],0x1
    1465:	mov    eax,DWORD PTR [rbp-0xc]
    1468:	cmp    eax,DWORD PTR [rbp-0x3c]
    146b:	jl     13c8 <multiply(std::vector<float, std::allocator<float> > const&, std::vector<float, std::allocator<float> > const&, std::vector<float, std::allocator<float> >&, int)+0x70>
    1471:	add    DWORD PTR [rbp-0x14],0x1
    1475:	mov    eax,DWORD PTR [rbp-0x14]
    1478:	cmp    eax,DWORD PTR [rbp-0x3c]
    147b:	jl     137f <multiply(std::vector<float, std::allocator<float> > const&, std::vector<float, std::allocator<float> > const&, std::vector<float, std::allocator<float> >&, int)+0x27>
    1481:	nop
    1482:	nop
    1483:	leave
    1484:	ret
