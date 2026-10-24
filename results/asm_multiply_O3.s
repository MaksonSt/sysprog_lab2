00000000000015d0 <multiply(std::vector<float, std::allocator<float> > const&, std::vector<float, std::allocator<float> > const&, std::vector<float, std::allocator<float> >&, int) [clone .isra.0]>:
    15d0:	push   rbp
    15d1:	mov    rbp,rsp
    15d4:	push   r15
    15d6:	push   r14
    15d8:	push   r13
    15da:	push   r12
    15dc:	push   rbx
    15dd:	and    rsp,0xffffffffffffffe0
    15e1:	sub    rsp,0x60
    15e5:	mov    QWORD PTR [rsp+0x28],rdi
    15ea:	test   ecx,ecx
    15ec:	jle    1877 <multiply(std::vector<float, std::allocator<float> > const&, std::vector<float, std::allocator<float> > const&, std::vector<float, std::allocator<float> >&, int) [clone .isra.0]+0x2a7>
    15f2:	movsxd r15,ecx
    15f5:	mov    r13d,ecx
    15f8:	mov    r14,rdx
    15fb:	mov    rcx,rdx
    15fe:	lea    rax,[r15*4+0x0]
    1606:	mov    edx,r13d
    1609:	mov    r12d,r13d
    160c:	lea    r11d,[r13-0x1]
    1610:	add    rdi,rax
    1613:	shr    r12d,0x3
    1617:	xor    r9d,r9d
    161a:	mov    rbx,rsi
    161d:	mov    QWORD PTR [rsp+0x58],rdi
    1622:	lea    rdi,[rdx*4+0x0]
    162a:	shl    r12,0x5
    162e:	mov    QWORD PTR [rsp+0x50],0x0
    1637:	mov    QWORD PTR [rsp+0x30],rdi
    163c:	mov    edi,r13d
    163f:	mov    DWORD PTR [rsp+0x4c],0x0
    1647:	mov    QWORD PTR [rsp+0x20],rax
    164c:	and    edi,0xfffffff8
    164f:	mov    DWORD PTR [rsp+0x40],r9d
    1654:	mov    DWORD PTR [rsp+0x1c],r11d
    1659:	mov    DWORD PTR [rsp+0x44],edi
    165d:	mov    edi,r13d
    1660:	and    edi,0x7
    1663:	mov    DWORD PTR [rsp+0x3c],edi
    1667:	dec    edi
    1669:	mov    DWORD PTR [rsp+0x38],edi
    166d:	nop    DWORD PTR [rax]
    1670:	mov    rdx,QWORD PTR [rsp+0x30]
    1675:	mov    rdi,rcx
    1678:	xor    esi,esi
    167a:	call   10f0 <memset@plt>
    167f:	mov    rdi,QWORD PTR [rsp+0x50]
    1684:	xor    edx,edx
    1686:	xor    r8d,r8d
    1689:	mov    rcx,rax
    168c:	mov    rax,QWORD PTR [rsp+0x28]
    1691:	mov    r11d,DWORD PTR [rsp+0x1c]
    1696:	lea    r10,[rbx+0x4]
    169a:	lea    rdi,[rax+rdi*4]
    169e:	xchg   ax,ax
    16a0:	vmovss xmm1,DWORD PTR [rdi]
    16a4:	lea    rax,[rdx*4+0x0]
    16ac:	cmp    r11d,0x2
    16b0:	jbe    16ca <multiply(std::vector<float, std::allocator<float> > const&, std::vector<float, std::allocator<float> > const&, std::vector<float, std::allocator<float> >&, int) [clone .isra.0]+0xfa>
    16b2:	lea    rax,[rdx*4+0x0]
    16ba:	mov    rsi,rcx
    16bd:	lea    r9,[r10+rax*1]
    16c1:	sub    rsi,r9
    16c4:	cmp    rsi,0x18
    16c8:	ja     1740 <multiply(std::vector<float, std::allocator<float> > const&, std::vector<float, std::allocator<float> > const&, std::vector<float, std::allocator<float> >&, int) [clone .isra.0]+0x170>
    16ca:	lea    rsi,[rdx+r15*1]
    16ce:	add    rax,rbx
    16d1:	mov    rdx,rcx
    16d4:	lea    r9,[rbx+rsi*4]
    16d8:	nop    DWORD PTR [rax+rax*1+0x0]
    16e0:	vmovss xmm0,DWORD PTR [rax]
    16e4:	add    rax,0x4
    16e8:	add    rdx,0x4
    16ec:	vfmadd213ss xmm0,xmm1,DWORD PTR [rdx-0x4]
    16f2:	vmovss DWORD PTR [rdx-0x4],xmm0
    16f7:	cmp    r9,rax
    16fa:	jne    16e0 <multiply(std::vector<float, std::allocator<float> > const&, std::vector<float, std::allocator<float> > const&, std::vector<float, std::allocator<float> >&, int) [clone .isra.0]+0x110>
    16fc:	mov    rax,QWORD PTR [rsp+0x58]
    1701:	add    rdi,0x4
    1705:	add    r8d,r13d
    1708:	mov    rdx,rsi
    170b:	cmp    rdi,rax
    170e:	jne    16a0 <multiply(std::vector<float, std::allocator<float> > const&, std::vector<float, std::allocator<float> > const&, std::vector<float, std::allocator<float> >&, int) [clone .isra.0]+0xd0>
    1710:	inc    DWORD PTR [rsp+0x40]
    1714:	mov    rdi,QWORD PTR [rsp+0x20]
    1719:	mov    eax,DWORD PTR [rsp+0x40]
    171d:	add    QWORD PTR [rsp+0x58],rdi
    1722:	add    DWORD PTR [rsp+0x4c],r13d
    1727:	add    QWORD PTR [rsp+0x50],r15
    172c:	add    rcx,rdi
    172f:	cmp    r13d,eax
    1732:	je     1874 <multiply(std::vector<float, std::allocator<float> > const&, std::vector<float, std::allocator<float> > const&, std::vector<float, std::allocator<float> >&, int) [clone .isra.0]+0x2a4>
    1738:	vzeroupper
    173b:	jmp    1670 <multiply(std::vector<float, std::allocator<float> > const&, std::vector<float, std::allocator<float> > const&, std::vector<float, std::allocator<float> >&, int) [clone .isra.0]+0xa0>
    1740:	cmp    r11d,0x6
    1744:	jbe    1859 <multiply(std::vector<float, std::allocator<float> > const&, std::vector<float, std::allocator<float> > const&, std::vector<float, std::allocator<float> >&, int) [clone .isra.0]+0x289>
    174a:	add    rax,rbx
    174d:	vbroadcastss ymm2,xmm1
    1752:	xor    esi,esi
    1754:	data16 cs nop WORD PTR [rax+rax*1+0x0]
    175f:	nop
    1760:	vmovups ymm0,YMMWORD PTR [rax+rsi*1]
    1765:	vfmadd213ps ymm0,ymm2,YMMWORD PTR [rcx+rsi*1]
    176b:	vmovups YMMWORD PTR [rcx+rsi*1],ymm0
    1770:	add    rsi,0x20
    1774:	cmp    r12,rsi
    1777:	jne    1760 <multiply(std::vector<float, std::allocator<float> > const&, std::vector<float, std::allocator<float> > const&, std::vector<float, std::allocator<float> >&, int) [clone .isra.0]+0x190>
    1779:	cmp    DWORD PTR [rsp+0x44],r13d
    177e:	je     1850 <multiply(std::vector<float, std::allocator<float> > const&, std::vector<float, std::allocator<float> > const&, std::vector<float, std::allocator<float> >&, int) [clone .isra.0]+0x280>
    1784:	cmp    DWORD PTR [rsp+0x38],0x2
    1789:	mov    eax,DWORD PTR [rsp+0x3c]
    178d:	jbe    186b <multiply(std::vector<float, std::allocator<float> > const&, std::vector<float, std::allocator<float> > const&, std::vector<float, std::allocator<float> >&, int) [clone .isra.0]+0x29b>
    1793:	mov    r9d,DWORD PTR [rsp+0x44]
    1798:	mov    esi,r9d
    179b:	mov    DWORD PTR [rsp+0x48],r9d
    17a0:	mov    r9,QWORD PTR [rsp+0x50]
    17a5:	vshufps xmm0,xmm1,xmm1,0x0
    17aa:	add    r9,rsi
    17ad:	add    rsi,rdx
    17b0:	lea    r9,[r14+r9*4]
    17b4:	vmovups xmm3,XMMWORD PTR [r9]
    17b9:	vfmadd132ps xmm0,xmm3,XMMWORD PTR [rbx+rsi*4]
    17bf:	lea    rsi,[rdx+r15*1]
    17c3:	vmovups XMMWORD PTR [r9],xmm0
    17c8:	test   al,0x3
    17ca:	je     16fc <multiply(std::vector<float, std::allocator<float> > const&, std::vector<float, std::allocator<float> > const&, std::vector<float, std::allocator<float> >&, int) [clone .isra.0]+0x12c>
    17d0:	mov    esi,DWORD PTR [rsp+0x48]
    17d4:	and    eax,0xfffffffc
    17d7:	add    eax,esi
    17d9:	mov    esi,DWORD PTR [rsp+0x4c]
    17dd:	add    esi,eax
    17df:	movsxd rsi,esi
    17e2:	lea    r9,[r14+rsi*4]
    17e6:	lea    esi,[r8+rax*1]
    17ea:	movsxd rsi,esi
    17ed:	vmovss xmm0,DWORD PTR [rbx+rsi*4]
    17f2:	lea    esi,[rax+0x1]
    17f5:	vfmadd213ss xmm0,xmm1,DWORD PTR [r9]
    17fa:	vmovss DWORD PTR [r9],xmm0
    17ff:	cmp    r13d,esi
    1802:	jle    1850 <multiply(std::vector<float, std::allocator<float> > const&, std::vector<float, std::allocator<float> > const&, std::vector<float, std::allocator<float> >&, int) [clone .isra.0]+0x280>
    1804:	mov    r9d,DWORD PTR [rsp+0x4c]
    1809:	add    eax,0x2
    180c:	add    r9d,esi
    180f:	add    esi,r8d
    1812:	movsxd r9,r9d
    1815:	movsxd rsi,esi
    1818:	vmovss xmm0,DWORD PTR [rbx+rsi*4]
    181d:	lea    r9,[r14+r9*4]
    1821:	vfmadd213ss xmm0,xmm1,DWORD PTR [r9]
    1826:	vmovss DWORD PTR [r9],xmm0
    182b:	cmp    r13d,eax
    182e:	jle    1850 <multiply(std::vector<float, std::allocator<float> > const&, std::vector<float, std::allocator<float> > const&, std::vector<float, std::allocator<float> >&, int) [clone .isra.0]+0x280>
    1830:	mov    esi,DWORD PTR [rsp+0x4c]
    1834:	add    esi,eax
    1836:	add    eax,r8d
    1839:	movsxd rsi,esi
    183c:	cdqe
    183e:	lea    rsi,[r14+rsi*4]
    1842:	vmovss xmm4,DWORD PTR [rsi]
    1846:	vfmadd132ss xmm1,xmm4,DWORD PTR [rbx+rax*4]
    184c:	vmovss DWORD PTR [rsi],xmm1
    1850:	lea    rsi,[rdx+r15*1]
    1854:	jmp    16fc <multiply(std::vector<float, std::allocator<float> > const&, std::vector<float, std::allocator<float> > const&, std::vector<float, std::allocator<float> >&, int) [clone .isra.0]+0x12c>
    1859:	mov    eax,r13d
    185c:	xor    esi,esi
    185e:	mov    DWORD PTR [rsp+0x48],0x0
    1866:	jmp    17a0 <multiply(std::vector<float, std::allocator<float> > const&, std::vector<float, std::allocator<float> > const&, std::vector<float, std::allocator<float> >&, int) [clone .isra.0]+0x1d0>
    186b:	mov    eax,DWORD PTR [rsp+0x44]
    186f:	jmp    17d9 <multiply(std::vector<float, std::allocator<float> > const&, std::vector<float, std::allocator<float> > const&, std::vector<float, std::allocator<float> >&, int) [clone .isra.0]+0x209>
    1874:	vzeroupper
    1877:	lea    rsp,[rbp-0x28]
    187b:	pop    rbx
    187c:	pop    r12
    187e:	pop    r13
    1880:	pop    r14
    1882:	pop    r15
    1884:	pop    rbp
    1885:	ret
    1886:	cs nop WORD PTR [rax+rax*1+0x0]
