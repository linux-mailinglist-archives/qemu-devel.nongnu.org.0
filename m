Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B002536171
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jun 2019 18:37:18 +0200 (CEST)
Received: from localhost ([127.0.0.1]:46141 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hYYua-0007YF-W2
	for lists+qemu-devel@lfdr.de; Wed, 05 Jun 2019 12:37:17 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39903)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1hYYtU-0006yU-Bk
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 12:36:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1hYYtS-0003tv-Ch
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 12:36:08 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:33207)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1hYYtQ-0003kp-Jc
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 12:36:05 -0400
Received: by mail-wr1-f66.google.com with SMTP id n9so7725820wru.0
	for <qemu-devel@nongnu.org>; Wed, 05 Jun 2019 09:36:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=1dVdyGq+h/qy1t96Vw6FKbtWHzhAufiXsNUfaixqU5k=;
	b=pimN1ni9ejDxLE4t3LFugY/i2xcGR/eAi/pL45vNCckKD9Kbeo1Nn5mM9BwT/M5sqM
	BTIdP9ptIVB1wJYa7QXw/ufCNe4Psq3AQOKMN77GoDPFiGfxyDAyOntSS+Hq5mq0L65V
	/3427IuhnqTt3ObFbfRuIUvIPzqYZcNnjnB4dZANaYg+1wJdPDmcp38wylRN2HX5z0td
	SLZQFo0VY7WnAbHaeFh3eL0qxf/2ek4uPN9sSs51qmCms+QbB6j6nWaMup8meNQmzvyd
	vKpZCHNTHm/WwJ1a7s08DTt3c4O60r75psf6lzwMQu7h4oCapuTjlq/YG3jdSCp0eaPk
	bXzA==
X-Gm-Message-State: APjAAAUJmaRLSUpXBbM7EDi+GLJoUhEK0Zr+JygINB/VayQ9x6TnT2bV
	jBTxX+MIIGjyTanFN43z/+cqWw==
X-Google-Smtp-Source: APXvYqxIXahgdTBtDi1FDZdmyaAgBykHoOVncvJYnsAfhqu/EHqTclJYHkrq6LoaTtpffZCpZC9ARQ==
X-Received: by 2002:adf:ef48:: with SMTP id c8mr4296253wrp.352.1559752562076; 
	Wed, 05 Jun 2019 09:36:02 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:657f:501:149f:5617?
	([2001:b07:6468:f312:657f:501:149f:5617])
	by smtp.gmail.com with ESMTPSA id
	x15sm15490668wrt.87.2019.06.05.09.36.01
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Jun 2019 09:36:01 -0700 (PDT)
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
	qemu-devel@nongnu.org
References: <20190605162326.13896-1-alex.bennee@linaro.org>
	<20190605162326.13896-5-alex.bennee@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <67c5b73f-ff36-0b14-e3c0-3e3ffc184e75@redhat.com>
Date: Wed, 5 Jun 2019 18:36:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190605162326.13896-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.66
Subject: Re: [Qemu-devel] [PATCH v1 4/4] tests/tcg/x86_64: add a PVHVM crt.o
 for x86_64 system tests
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Eduardo Habkost <ehabkost@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/06/19 18:23, Alex Bennée wrote:
> Instead of doing the full real to 64 bit dance we are attempting to
> leverage Xen's PVHVM boot spec to go from 32 bit to 64 bit.

It's PVH, "PVHVM" is something else. :)

Paolo

> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  tests/tcg/i386/Makefile.softmmu-target |   1 +
>  tests/tcg/x86_64/system/boot.S         | 277 +++++++++++++++++++++++++
>  tests/tcg/x86_64/system/kernel.ld      |  33 +++
>  3 files changed, 311 insertions(+)
>  create mode 100644 tests/tcg/x86_64/system/boot.S
>  create mode 100644 tests/tcg/x86_64/system/kernel.ld
> 
> diff --git a/tests/tcg/i386/Makefile.softmmu-target b/tests/tcg/i386/Makefile.softmmu-target
> index e1d880f9b5..0a4364868c 100644
> --- a/tests/tcg/i386/Makefile.softmmu-target
> +++ b/tests/tcg/i386/Makefile.softmmu-target
> @@ -14,6 +14,7 @@ CRT_OBJS=boot.o
>  
>  ifeq ($(TARGET_X86_64), y)
>  CRT_PATH=$(X64_SYSTEM_SRC)
> +CFLAGS=-march=x86-64
>  LINK_SCRIPT=$(X64_SYSTEM_SRC)/kernel.ld
>  LDFLAGS=-Wl,-T$(LINK_SCRIPT) -Wl,-melf_x86_64
>  else
> diff --git a/tests/tcg/x86_64/system/boot.S b/tests/tcg/x86_64/system/boot.S
> new file mode 100644
> index 0000000000..205cfbd398
> --- /dev/null
> +++ b/tests/tcg/x86_64/system/boot.S
> @@ -0,0 +1,277 @@
> +/*
> + * x86_64 boot and support code
> + *
> + * Copyright 2019 Linaro
> + *
> + * This work is licensed under the terms of the GNU GPL, version 3 or later.
> + * See the COPYING file in the top-level directory.
> + *
> + * Unlike the i386 version we instead use Xen's PVHVM booting header
> + * which should drop us automatically into 32 bit mode ready to go. I've
> + * nabbed bits of the Linux kernel setup to achieve this.
> + *
> + * SPDX-License-Identifier: GPL-3.0-or-later
> + */
> +
> +        .section .head
> +
> +#define ELFNOTE_START(name, type, flags)	\
> +.pushsection .note.name, flags,@note	;	\
> +  .balign 4				;	\
> +  .long 2f - 1f		/* namesz */	;	\
> +  .long 4484f - 3f	/* descsz */	;	\
> +  .long type				;	\
> +1:.asciz #name				;	\
> +2:.balign 4				;	\
> +3:
> +
> +#define ELFNOTE_END				\
> +4484:.balign 4				;	\
> +.popsection				;
> +
> +#define ELFNOTE(name, type, desc)		\
> +	ELFNOTE_START(name, type, "")		\
> +		desc			;	\
> +	ELFNOTE_END
> +
> +#define XEN_ELFNOTE_ENTRY          1
> +#define XEN_ELFNOTE_HYPERCALL_PAGE 2
> +#define XEN_ELFNOTE_VIRT_BASE      3
> +#define XEN_ELFNOTE_PADDR_OFFSET   4
> +#define XEN_ELFNOTE_PHYS32_ENTRY  18
> +
> +#define __ASM_FORM(x)	x
> +#define __ASM_FORM_RAW(x)     x
> +#define __ASM_FORM_COMMA(x) x,
> +#define __ASM_SEL(a,b)           __ASM_FORM(b)
> +#define __ASM_SEL_RAW(a,b)      __ASM_FORM_RAW(b)
> +#define _ASM_PTR	__ASM_SEL(.long, .quad)
> +
> +	ELFNOTE(Xen, XEN_ELFNOTE_VIRT_BASE,      _ASM_PTR 0x100000)
> +	ELFNOTE(Xen, XEN_ELFNOTE_ENTRY,          _ASM_PTR _start)
> +	ELFNOTE(Xen, XEN_ELFNOTE_PHYS32_ENTRY,   _ASM_PTR _start)    /* entry == virtbase */
> +	ELFNOTE(Xen, XEN_ELFNOTE_PADDR_OFFSET,   _ASM_PTR 0)
> +
> +       /*
> +	* Entry point for PVH guests.
> +	*
> +	* Xen ABI specifies the following register state when we come here:
> +	*
> +	* - `ebx`: contains the physical memory address where the loader has placed
> +	*          the boot start info structure.
> +	* - `cr0`: bit 0 (PE) must be set. All the other writeable bits are cleared.
> +	* - `cr4`: all bits are cleared.
> +	* - `cs `: must be a 32-bit read/execute code segment with a base of ‘0’
> +	*          and a limit of ‘0xFFFFFFFF’. The selector value is unspecified.
> +	* - `ds`, `es`: must be a 32-bit read/write data segment with a base of
> +	*               ‘0’ and a limit of ‘0xFFFFFFFF’. The selector values are all
> +	*               unspecified.
> +	* - `tr`: must be a 32-bit TSS (active) with a base of '0' and a limit
> +	*         of '0x67'.
> +	* - `eflags`: bit 17 (VM) must be cleared. Bit 9 (IF) must be cleared.
> +	*             Bit 8 (TF) must be cleared. Other bits are all unspecified.
> +	*
> +	* All other processor registers and flag bits are unspecified. The OS is in
> +	* charge of setting up it's own stack, GDT and IDT.
> +	*/
> +        .code32
> +        .section .text
> +
> +.global _start
> +_start:
> +	cld
> +        lgdt gdtr
> +
> +        ljmp $0x8,$.Lloadcs
> +.Lloadcs:
> +        mov $0x10,%eax
> +        mov %eax,%ds
> +        mov %eax,%es
> +        mov %eax,%fs
> +        mov %eax,%gs
> +        mov %eax,%ss
> +
> +	/* Enable PAE mode (bit 5). */
> +	mov %cr4, %eax
> +	btsl $5, %eax
> +	mov %eax, %cr4
> +
> +#define MSR_EFER		0xc0000080 /* extended feature register */
> +
> +	/* Enable Long mode. */
> +	mov $MSR_EFER, %ecx
> +	rdmsr
> +	btsl $8, %eax
> +	wrmsr
> +
> +	/* Enable paging */
> +	mov $.Lpml4, %ecx
> +	mov %ecx, %cr3
> +
> +	mov %cr0, %eax
> +	btsl $31, %eax
> +	mov %eax, %cr0
> +
> +	/* Jump to 64-bit mode. */
> +        lgdt gdtr64
> +        ljmp $0x8,$.Lenter64
> +
> +        .code64
> +        .section .text
> +.Lenter64:
> +
> +
> +	// Setup stack ASAP
> +	movq $stack_end,%rsp
> +
> +        /* don't worry about stack frame, assume everthing is garbage when we return */
> +	call main
> +
> +        /* output any non-zero result in eax to isa-debug-exit device */
> +        test %al, %al
> +        jz 1f
> +        out %ax, $0xf4
> +
> +1:      /* QEMU ACPI poweroff */
> +	mov $0x604,%edx
> +	mov $0x2000,%eax
> +	out %ax,%dx
> +	hlt
> +	jmp 1b
> +
> +        /*
> +         * Helper Functions
> +         *
> +         * x86_64 calling convention is rdi, rsi, rdx, rcx, r8, r9
> +         */
> +
> +        /* Output a single character to serial port */
> +        .global __sys_outc
> +__sys_outc:
> +        pushq %rax
> +        mov %rax, %rdx
> +	out %al,$0xE9
> +        popq %rax
> +        ret
> +
> +	/* Interrupt Descriptor Table */
> +
> +        .section .data
> +        .align 16
> +
> +idt_00: .int 0, 0
> +idt_01: .int 0, 0
> +idt_02: .int 0, 0
> +idt_03: .int 0, 0
> +idt_04: .int 0, 0
> +idt_05: .int 0, 0
> +idt_06: .int 0, 0 /* intr_6_opcode, Invalid Opcode */
> +idt_07: .int 0, 0
> +idt_08: .int 0, 0
> +idt_09: .int 0, 0
> +idt_0A: .int 0, 0
> +idt_0B: .int 0, 0
> +idt_0C: .int 0, 0
> +idt_0D: .int 0, 0
> +idt_0E: .int 0, 0
> +idt_0F: .int 0, 0
> +idt_10: .int 0, 0
> +idt_11: .int 0, 0
> +idt_12: .int 0, 0
> +idt_13: .int 0, 0
> +idt_14: .int 0, 0
> +idt_15: .int 0, 0
> +idt_16: .int 0, 0
> +idt_17: .int 0, 0
> +idt_18: .int 0, 0
> +idt_19: .int 0, 0
> +idt_1A: .int 0, 0
> +idt_1B: .int 0, 0
> +idt_1C: .int 0, 0
> +idt_1D: .int 0, 0
> +idt_1E: .int 0, 0
> +idt_1F: .int 0, 0
> +
> +
> +	/*
> +	 * Global Descriptor Table (GDT)
> +	 *
> +	 * This describes various memory areas (segments) through
> +	 * segment descriptors. In 32 bit mode each segment each
> +	 * segement is associated with segment registers which are
> +	 * implicitly (or explicitly) referenced depending on the
> +	 * instruction. However in 64 bit mode selectors are flat and
> +	 * segmented addressing isn't used.
> +	 */
> +gdt:
> +        .short 0
> +gdtr:
> +        .short gdt_en - gdt - 1
> +        .int gdt
> +
> +        // Code cs:
> +        .short 0xFFFF
> +        .short 0
> +        .byte 0
> +        .byte 0x9b
> +        .byte 0xCF
> +        .byte 0
> +
> +        // Data  ds:, ss:, es:, fs:, and gs:
> +        .short 0xFFFF
> +        .short 0
> +        .byte 0
> +        .byte 0x93
> +        .byte 0xCF
> +        .byte 0
> +gdt_en:
> +
> +gdt64:
> +        .short 0
> +gdtr64:
> +        .short gdt64_en - gdt64 - 1
> +        .int gdt64
> +
> +        // Code
> +        .short 0xFFFF
> +        .short 0
> +        .byte 0
> +        .byte 0x9b
> +        .byte 0xAF
> +        .byte 0
> +
> +        // Data
> +        .short 0xFFFF
> +        .short 0
> +        .byte 0
> +        .byte 0x93
> +        .byte 0xCF
> +        .byte 0
> +gdt64_en:
> +
> +	.section .bss
> +        .align 16
> +
> +stack: .space 65536
> +stack_end:
> +
> +	.section .data
> +
> +.align 4096
> +.Lpd:
> +i = 0
> +        .rept 512 * 4
> +        .quad 0x1e7 | (i << 21)
> +        i = i + 1
> +        .endr
> +
> +.align 4096
> +.Lpdp:
> +        .quad .Lpd + 7 + 0 * 4096 /* 0-1 GB */
> +        .quad .Lpd + 7 + 1 * 4096 /* 1-2 GB */
> +        .quad .Lpd + 7 + 2 * 4096 /* 2-3 GB */
> +        .quad .Lpd + 7 + 3 * 4096 /* 3-4 GB */
> +
> +.align 4096
> +.Lpml4:
> +        .quad .Lpdp + 7 /* 0-512 GB */
> diff --git a/tests/tcg/x86_64/system/kernel.ld b/tests/tcg/x86_64/system/kernel.ld
> new file mode 100644
> index 0000000000..49c12b04ae
> --- /dev/null
> +++ b/tests/tcg/x86_64/system/kernel.ld
> @@ -0,0 +1,33 @@
> +PHDRS {
> +	text PT_LOAD FLAGS(5);          /* R_E */
> +	note PT_NOTE FLAGS(0);          /* ___ */
> +}
> +
> +SECTIONS {
> +	. = 0x100000;
> +
> +	.text : {
> +		__load_st = .;
> +		*(.head)
> +		*(.text)
> +	} :text
> +
> +	.rodata : {
> +		*(.rodata)
> +	} :text
> +
> +        /* Keep build ID and PVH notes in same section */
> +        .notes :  {
> +               *(.note.*)
> +        } :note
> +
> +        .data : {
> +		*(.data)
> +		__load_en = .;
> +	} :text
> +
> +	.bss : {
> +		*(.bss)
> +		__bss_en = .;
> +	}
> +}
> 


