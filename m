Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB66132E5
	for <lists+qemu-devel@lfdr.de>; Fri,  3 May 2019 19:09:32 +0200 (CEST)
Received: from localhost ([127.0.0.1]:44795 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hMbgh-0001lq-NH
	for lists+qemu-devel@lfdr.de; Fri, 03 May 2019 13:09:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60439)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1hMber-0000z2-EB
	for qemu-devel@nongnu.org; Fri, 03 May 2019 13:07:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1hMbep-00025E-Gx
	for qemu-devel@nongnu.org; Fri, 03 May 2019 13:07:37 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:44799)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
	id 1hMbem-0001rs-1I
	for qemu-devel@nongnu.org; Fri, 03 May 2019 13:07:35 -0400
Received: by mail-wr1-x442.google.com with SMTP id c5so8717058wrs.11
	for <qemu-devel@nongnu.org>; Fri, 03 May 2019 10:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=references:user-agent:from:to:cc:subject:in-reply-to:date
	:message-id:mime-version:content-transfer-encoding;
	bh=640yTpQyTJ6A1WlzMu+USjKWpz1WZMKR4+VA0ZzvUEY=;
	b=Zj4nHm98F6vMDope8x8LtCJaIb1nKfjRAisxQ040bhIu4Ei4LeUku/AGaWJTZQO3/W
	t/bYctjwsC09mJNOj2LGqqAo+wCtC39Eq17tudS3EYXSyk3IchPVe6Nz5/USDFSlc9tq
	U7i0MXkxKb6QyatjDW4sZN1Z3UbD+0EY8ruMcSJOWUicDZfH7MdnZnaD63KJr4FXWEbB
	U1St3r4h7Tfo6t9jr5/yU4yDOxxALGQzYDxMonAlcX4Gf+PDkIVh9uYzowbHHsAmfHdd
	qqDoHsnwhtMoKaT+Sa/ecWVokTsrO6FymHeON0akilwPaLoJWpACukxkweS5nDXZj92r
	uftw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:references:user-agent:from:to:cc:subject
	:in-reply-to:date:message-id:mime-version:content-transfer-encoding;
	bh=640yTpQyTJ6A1WlzMu+USjKWpz1WZMKR4+VA0ZzvUEY=;
	b=ilrQ7qSpEvNhkTgkTHD5rCcUPqy/fFqcmc2qCOXlUgZwI4sIYAinaCRoZNa6ifRdN4
	0IFNpYswg9Gg8vCgnL21ten+y5D9IhJfR/RC1xLZBERt9rH6131tmT4FOEBcjCRBJTLU
	2E5OAOiHKjL9uYXkwUp+4OIzTprtG1EZOfsle6kYGcHI7aa+owqu0BGDCNsR+qh8EIVq
	Wb0Xh+Vi7GiCY1oojS0hdBi8qQTPYeV9laCYipnmdjQWTCRNFUjM7lUbBiciGl67uz6H
	lFuMWxQjhRXRAIAmXMG26JysgaDAJVUcG/bibxWavSILZqvw+2XVXpoLt84cROHCuFwa
	Tk8g==
X-Gm-Message-State: APjAAAVNBjdcvl1WWswAJVx3kV3sReROAp1J5FxOudICzinXmbOECR83
	wBpzndtk/XbjAGaoTyeLFmK1nA==
X-Google-Smtp-Source: APXvYqzUTRFOnY3lVx4eQ393BZuuhhXJrkBDfX1QsGEFT349a8iYGZpPxdgozptaALIay+QnVonRMg==
X-Received: by 2002:adf:e88b:: with SMTP id d11mr7983316wrm.327.1556903245863; 
	Fri, 03 May 2019 10:07:25 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id
	l127sm3473296wml.40.2019.05.03.10.07.25
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 03 May 2019 10:07:25 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id C6EE91FF87;
	Fri,  3 May 2019 18:07:24 +0100 (BST)
References: <20190501184306.15208-1-richard.henderson@linaro.org>
User-agent: mu4e 1.3.1; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
In-reply-to: <20190501184306.15208-1-richard.henderson@linaro.org>
Date: Fri, 03 May 2019 18:07:24 +0100
Message-ID: <877eb74gc3.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::442
Subject: Re: [Qemu-devel] [PATCH] tests/tcg/alpha: add system boot.S
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> This provides the bootstrap and low level helper functions for an
> alpha kernel.  We use direct access to the DP264 serial port for
> test output, and hard machine halt to exit the emulation.

Queued to testing/next, thanks.

I've also added tests/tcg/alpha/system/ to MAINTAINERS

>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tests/tcg/alpha/Makefile.softmmu-target |  32 ++
>  tests/tcg/alpha/system/boot.S           | 511 ++++++++++++++++++++++++
>  tests/tcg/alpha/system/kernel.ld        |  30 ++
>  3 files changed, 573 insertions(+)
>  create mode 100644 tests/tcg/alpha/Makefile.softmmu-target
>  create mode 100644 tests/tcg/alpha/system/boot.S
>  create mode 100644 tests/tcg/alpha/system/kernel.ld
>
> diff --git a/tests/tcg/alpha/Makefile.softmmu-target b/tests/tcg/alpha/Ma=
kefile.softmmu-target
> new file mode 100644
> index 0000000000..9f4b199258
> --- /dev/null
> +++ b/tests/tcg/alpha/Makefile.softmmu-target
> @@ -0,0 +1,32 @@
> +#
> +# Alpha system tests
> +#
> +
> +ALPHA_SYSTEM_SRC=3D$(SRC_PATH)/tests/tcg/alpha/system
> +VPATH+=3D$(ALPHA_SYSTEM_SRC)
> +
> +# These objects provide the basic boot code and helper functions for all=
 tests
> +CRT_OBJS=3Dboot.o
> +
> +ALPHA_TEST_SRCS=3D$(wildcard $(ALPHA_SYSTEM_SRC)/*.c)
> +ALPHA_TESTS =3D $(patsubst $(ALPHA_SYSTEM_SRC)/%.c, %, $(ALPHA_TEST_SRCS=
))
> +
> +CRT_PATH=3D$(ALPHA_SYSTEM_SRC)
> +LINK_SCRIPT=3D$(ALPHA_SYSTEM_SRC)/kernel.ld
> +LDFLAGS=3D-Wl,-T$(LINK_SCRIPT)
> +TESTS+=3D$(ALPHA_TESTS) $(MULTIARCH_TESTS)
> +CFLAGS+=3D-nostdlib -g -O1 -mcpu=3Dev6 $(MINILIB_INC)
> +LDFLAGS+=3D-static -nostdlib $(CRT_OBJS) $(MINILIB_OBJS) -lgcc
> +
> +# building head blobs
> +.PRECIOUS: $(CRT_OBJS)
> +
> +%.o: $(CRT_PATH)/%.S
> +	$(CC) $(CFLAGS) -x assembler-with-cpp -c $< -o $@
> +
> +# Build and link the tests
> +%: %.c $(LINK_SCRIPT) $(CRT_OBJS) $(MINILIB_OBJS)
> +	$(CC) $(CFLAGS) $< -o $@ $(LDFLAGS)
> +
> +# Running
> +QEMU_OPTS+=3D-serial chardev:output -kernel
> diff --git a/tests/tcg/alpha/system/boot.S b/tests/tcg/alpha/system/boot.S
> new file mode 100644
> index 0000000000..6d7fb36e17
> --- /dev/null
> +++ b/tests/tcg/alpha/system/boot.S
> @@ -0,0 +1,511 @@
> +/*
> + * Minimal Alpha system boot code.
> + *
> + * Copyright Linaro Ltd 2019
> + */
> +
> +	.set	noat
> +	.set	nomacro
> +	.arch	ev6
> +	.text
> +
> +.macro load_pci_io reg
> +	/* For typhoon, this is
> +	 *   0xfffffc0000000000  -- kseg identity map
> +	 * +      0x10000000000  -- typhoon pio base
> +	 * +        0x1fc000000  -- typhoon pchip0 pci base
> +	 * =3D 0xfffffd01fc000000
> +	 */
> +	ldah	\reg, -3		/* ff..fd0000 */
> +	lda	\reg, 0x1fc(\reg)	/* ff..fd01fc */
> +	sll	\reg, 24, \reg
> +.endm
> +
> +#define com1Rbr 0x3f8
> +#define com1Thr 0x3f8
> +#define com1Ier 0x3f9
> +#define com1Iir 0x3fa
> +#define com1Lcr 0x3fb
> +#define com1Mcr 0x3fc
> +#define com1Lsr 0x3fd
> +#define com1Msr 0x3fe
> +#define com1Scr 0x3ff
> +#define com1Dll 0x3f8
> +#define com1Dlm 0x3f9
> +
> +#define PAL_halt    0
> +#define PAL_wrent  52
> +#define PAL_wrkgp  55
> +
> +	.text
> +	.p2align 4
> +	.globl	_start
> +	.ent	_start
> +_start:
> +	br	$gp, .+4
> +	ldah	$gp, 0($gp)		!gpdisp!1
> +	lda	$gp, 0($gp)		!gpdisp!1
> +
> +	ldah	$sp, $stack_end($gp)	!gprelhigh
> +	lda	$sp, $stack_end($gp)	!gprellow
> +
> +	/* Install kernel gp for exception handlers.  */
> +	mov	$gp, $16
> +	call_pal PAL_wrkgp
> +
> +	/* Install exception handlers.  */
> +	ldah	$16, entInt($gp)	!gprelhigh
> +	lda	$16, entInt($16)	!gprellow
> +	lda	$17, 0
> +	call_pal PAL_wrent
> +
> +	ldah	$16, entArith($gp)	!gprelhigh
> +	lda	$16, entArith($16)	!gprellow
> +	lda	$17, 1
> +	call_pal PAL_wrent
> +
> +	ldah	$16, entMM($gp)		!gprelhigh
> +	lda	$16, entMM($16)		!gprellow
> +	lda	$17, 2
> +	call_pal PAL_wrent
> +
> +	ldah	$16, entIF($gp)		!gprelhigh
> +	lda	$16, entIF($16)		!gprellow
> +	lda	$17, 3
> +	call_pal PAL_wrent
> +
> +	ldah	$16, entUna($gp)	!gprelhigh
> +	lda	$16, entUna($16)	!gprellow
> +	lda	$17, 4
> +	call_pal PAL_wrent
> +
> +	ldah	$16, entSys($gp)	!gprelhigh
> +	lda	$16, entSys($16)	!gprellow
> +	lda	$17, 5
> +	call_pal PAL_wrent
> +
> +	/*
> +	 * Initialize COM1.
> +	 */
> +	load_pci_io $1
> +	lda	$2, 0x87		/* outb(0x87, com1Lcr); */
> +	stb	$2, com1Lcr($1)
> +	stb	$31, com1Dlm($1)	/* outb(0, com1Dlm); */
> +	lda	$2, 3			/* baudconst 3 =3D> 56000 */
> +	stb	$2, com1Dll($1)		/* outb(baudconst, com1Dll); */
> +	lda	$2, 0x07
> +	stb	$2, com1Lcr($1)		/* outb(0x07, com1Lcr) */
> +	lda	$2, 0x0f
> +	stb	$2, com1Mcr($1)		/* outb(0x0f, com1Mcr) */
> +
> +	bsr	$26, main		!samegp
> +
> +	/* fall through to _exit */
> +	.end	_start
> +
> +	.globl	_exit
> +	.ent	_exit
> +_exit:
> +	.frame	$sp, 0, $26, 0
> +	.prologue 0
> +
> +	/* We cannot return an error code.  */
> +	call_pal PAL_halt
> +	.end	_exit
> +
> +/*
> + * We have received an exception that we don't handle.  Log and exit.
> + */
> +	.ent	log_exit
> +log_exit:
> +entInt:
> +entArith:
> +entMM:
> +entIF:
> +entUna:
> +entSys:
> +	ldah	$16, $errormsg($gp)	!gprelhigh
> +	lda	$16, $errormsg($16)	!gprellow
> +	bsr	$26, __sys_outs		!samegp
> +	bsr	$26, _exit		!samegp
> +	.end	log_exit
> +
> +	.section .rodata
> +$errormsg:
> +	.string "Terminated by exception.\n"
> +	.previous
> +
> +	/*
> +	 * Helper Functions
> +	 */
> +
> +	/* Output a single character to serial port */
> +	.global __sys_outc
> +	.ent	__sys_outc
> +__sys_outc:
> +	.frame	$sp, 0, $26, 0
> +	.prologue 0
> +
> +	load_pci_io $1
> +
> +	/*
> +	 * while ((inb(com1Lsr) & 0x20) =3D=3D 0)
> +	 *       continue;
> +	 */
> +1:	ldbu	$0, com1Lsr($1)
> +	and	$0, 0x20, $0
> +	beq	$0, 1b
> +
> +	/* outb(c, com1Thr); */
> +	stb	$16, com1Thr($1)
> +	ret
> +	.end	__sys_outc
> +
> +	/* Output a nul-terminated string to serial port */
> +	.global	__sys_outs
> +	.ent	__sys_outs
> +__sys_outs:
> +	.frame	$sp, 0, $26, 0
> +	.prologue 0
> +
> +	load_pci_io $1
> +
> +	ldbu	$2, 0($16)
> +	beq	$2, 9f
> +
> +	/*
> +	 * while ((inb(com1Lsr) & 0x20) =3D=3D 0)
> +	 *       continue;
> +	 */
> +1:	ldbu	$0, com1Lsr($1)
> +	and	$0, 0x20, $0
> +	beq	$0, 1b
> +
> +	/* outb(c, com1Thr); */
> +	stb	$2, com1Thr($1)
> +
> +	addq	$16, 1, $16
> +	ldbu	$2, 0($16)
> +	bne	$2, 1b
> +
> +9:	ret
> +	.end	__sys_outs
> +
> +/*
> + * Division routines that are normally in libc.
> + *
> + * These do not follow the C calling convention.  Arguments are in $24+$=
25,
> + * the result is in $27.  Register $28 may be clobbered; everything else
> + * must be saved.
> + *
> + * We store the remainder in $28, so that we can share code.
> + *
> + * We do not signal divide by zero.
> + */
> +
> +/*
> + * Unsigned 64-bit division.
> + */
> +
> +	.globl	__divqu
> +	.ent	__divqu
> +__divqu:
> +	.frame	$sp, 48, $23
> +	subq	$sp, 48, $sp
> +	stq	$0, 0($sp)
> +	stq	$1, 8($sp)
> +	stq	$2, 16($sp)
> +	stq	$3, 24($sp)
> +	stq	$4, 32($sp)
> +	.prologue 0
> +
> +#define mask     $0
> +#define divisor  $1
> +#define compare  $2
> +#define tmp1     $3
> +#define tmp2     $4
> +#define quotient $27
> +#define modulus  $28
> +
> +	mov	$24, modulus
> +	mov	$25, divisor
> +	mov	$31, quotient
> +	mov	1, mask
> +	beq	$25, 9f
> +
> +	/* Shift left until divisor >=3D modulus.  */
> +1:	cmpult	divisor, modulus, compare
> +	blt	divisor, 2f
> +	addq	divisor, divisor, divisor
> +	addq	mask, mask, mask
> +	bne	compare, 1b
> +
> +2:	addq	quotient, mask, tmp2
> +	srl	mask, 1, mask
> +	cmpule	divisor, modulus, compare
> +	subq	modulus, divisor, tmp1
> +	cmovne	compare, tmp2, quotient
> +	srl	divisor, 1, divisor
> +	cmovne	compare, tmp1, modulus
> +	bne	mask, 2b
> +
> +9:	ldq	$0, 0($sp)
> +	ldq	$1, 8($sp)
> +	ldq	$2, 16($sp)
> +	ldq	$3, 24($sp)
> +	ldq	$4, 32($sp)
> +	addq	$sp, 48, $sp
> +	ret	$31, ($23), 1
> +
> +#undef mask
> +#undef divisor
> +#undef compare
> +#undef tmp1
> +#undef tmp2
> +#undef quotient
> +#undef modulus
> +
> +	.end	__divqu
> +
> +/*
> + * Unsigned 64-bit remainder.
> + * Note that __divqu above leaves the result in $28.
> + */
> +
> +	.globl	__remqu
> +	.ent	__remqu
> +__remqu:
> +	.frame	$sp, 16, $23
> +	subq	$sp, 16, $sp
> +	stq	$23, 0($sp)
> +	.prologue 0
> +
> +	bsr	$23, __divqu
> +
> +	ldq	$23, 0($sp)
> +	mov	$28, $27
> +	addq	$sp, 16, $sp
> +	ret	$31, ($23), 1
> +	.end	__remqu
> +
> +/*
> + * Signed 64-bit division.
> + */
> +
> +	.globl	__divqs
> +	.ent	__divqs
> +__divqs:
> +	.prologue 0
> +
> +	/* Common case: both arguments are positive.  */
> +	bis	$24, $25, $28
> +	bge	$28, __divqu
> +
> +	/* At least one argument is negative.  */
> +	subq	$sp, 32, $sp
> +	stq	$23, 0($sp)
> +	stq	$24, 8($sp)
> +	stq	$25, 16($sp)
> +
> +	/* Compute absolute values.  */
> +	subq	$31, $24, $28
> +	cmovlt	$24, $28, $24
> +	subq	$31, $25, $28
> +	cmovlt	$25, $28, $25
> +
> +	bsr	$23, __divqu
> +
> +	ldq	$24, 8($sp)
> +	ldq	$25, 16($sp)
> +
> +	/* -a / b =3D a / -b =3D -(a / b) */
> +	subq	$31, $27, $23
> +	xor	$24, $25, $28
> +	cmovlt	$28, $23, $27
> +
> +	ldq	$23, 0($sp)
> +	addq	$sp, 32, $sp
> +	ret	$31, ($23), 1
> +	.end	__divqs
> +
> +/*
> + * Signed 64-bit remainder.
> + */
> +
> +	.globl	__remqs
> +	.ent	__remqs
> +__remqs:
> +	.prologue 0
> +
> +	/* Common case: both arguments are positive.  */
> +	bis	$24, $25, $28
> +	bge	$28, __remqu
> +
> +	/* At least one argument is negative.  */
> +	subq	$sp, 32, $sp
> +	stq	$23, 0($sp)
> +	stq	$24, 8($sp)
> +	stq	$25, 16($sp)
> +
> +	/* Compute absolute values.  */
> +	subq	$31, $24, $28
> +	cmovlt	$24, $28, $24
> +	subq	$31, $25, $28
> +	cmovlt	$25, $28, $25
> +
> +	bsr	$23, __divqu
> +
> +	ldq	$23, 0($sp)
> +	ldq	$24, 8($sp)
> +	ldq	$25, 16($sp)
> +
> +	/* -a % b =3D -(a % b); a % -b =3D a % b.  */
> +	subq	$31, $28, $27
> +	cmovge	$24, $28, $27
> +
> +	addq	$sp, 32, $sp
> +	ret	$31, ($23), 1
> +	.end	__remqs
> +
> +/*
> + * Unsigned 32-bit division.
> + */
> +
> +	.globl	__divlu
> +	.ent	__divlu
> +__divlu:
> +	.frame	$sp, 32, $23
> +	subq	$sp, 32, $sp
> +	stq	$23, 0($sp)
> +	stq	$24, 8($sp)
> +	stq	$25, 16($sp)
> +	.prologue 0
> +
> +	/* Zero extend and use the 64-bit routine.  */
> +	zap	$24, 0xf0, $24
> +	zap	$25, 0xf0, $25
> +	bsr	$23, __divqu
> +
> +	addl	$27, 0, $27
> +	ldq	$23, 0($sp)
> +	ldq	$24, 8($sp)
> +	ldq	$25, 16($sp)
> +	addq	$sp, 32, $sp
> +	ret	$31, ($23), 1
> +	.end	__divlu
> +
> +/*
> + * Unsigned 32-bit remainder.
> + */
> +
> +	.globl	__remlu
> +	.ent	__remlu
> +__remlu:
> +	.frame	$sp, 32, $23
> +	subq	$sp, 32, $sp
> +	stq	$23, 0($sp)
> +	stq	$24, 8($sp)
> +	stq	$25, 16($sp)
> +	.prologue 0
> +
> +	/* Zero extend and use the 64-bit routine.  */
> +	zap	$24, 0xf0, $24
> +	zap	$25, 0xf0, $25
> +	bsr	$23, __divqu
> +
> +	/* Recall that the remainder is returned in $28.  */
> +	addl	$28, 0, $27
> +	ldq	$23, 0($sp)
> +	ldq	$24, 8($sp)
> +	ldq	$25, 16($sp)
> +	addq	$sp, 32, $sp
> +	ret	$31, ($23), 1
> +	.end	__remlu
> +
> +/*
> + * Signed 32-bit division.
> + */
> +
> +	.globl	__divls
> +	.ent	__divls
> +__divls:
> +	.frame	$sp, 32, $23
> +	subq	$sp, 32, $sp
> +	stq	$23, 0($sp)
> +	stq	$24, 8($sp)
> +	stq	$25, 16($sp)
> +	.prologue 0
> +
> +	/* Sign extend.  */
> +	addl	$24, 0, $24
> +	addl	$25, 0, $25
> +
> +	/* Compute absolute values.  */
> +	subq	$31, $24, $28
> +	cmovlt	$24, $28, $24
> +	subq	$31, $25, $28
> +	cmovlt	$25, $28, $25
> +
> +	bsr	$23, __divqu
> +
> +	ldq	$24, 8($sp)
> +	ldq	$25, 16($sp)
> +
> +	/* Negate the unsigned result, if necessary.  */
> +	xor	$24, $25, $28
> +	subl	$31, $27, $23
> +	addl	$27, 0, $27
> +	addl	$28, 0, $28
> +	cmovlt	$28, $23, $27
> +
> +	ldq	$23, 0($sp)
> +	addq	$sp, 32, $sp
> +	ret	$31, ($23), 1
> +	.end	__divls
> +
> +/*
> + * Signed 32-bit remainder.
> + */
> +
> +	.globl	__remls
> +	.ent	__remls
> +__remls:
> +	.frame	$sp, 32, $23
> +	subq	$sp, 32, $sp
> +	stq	$23, 0($sp)
> +	stq	$24, 8($sp)
> +	stq	$25, 16($sp)
> +	.prologue 0
> +
> +	/* Sign extend.  */
> +	addl	$24, 0, $24
> +	addl	$25, 0, $25
> +
> +	/* Compute absolute values.  */
> +	subq	$31, $24, $28
> +	cmovlt	$24, $28, $24
> +	subq	$31, $25, $28
> +	cmovlt	$25, $28, $25
> +
> +	bsr	$23, __divqu
> +
> +	ldq	$23, 0($sp)
> +	ldq	$24, 8($sp)
> +	ldq	$25, 16($sp)
> +
> +	/* Negate the unsigned result, if necessary.  */
> +	subl	$31, $28, $27
> +	addl	$28, 0, $28
> +	cmovge	$24, $28, $27
> +
> +	addq	$sp, 32, $sp
> +	ret	$31, ($23), 1
> +	.end	__remls
> +
> +	.data
> +	.p2align 4
> +stack:
> +	.skip	65536
> +$stack_end:
> +	.type	stack,@object
> +	.size	stack, . - stack
> diff --git a/tests/tcg/alpha/system/kernel.ld b/tests/tcg/alpha/system/ke=
rnel.ld
> new file mode 100644
> index 0000000000..d2ac6ecfeb
> --- /dev/null
> +++ b/tests/tcg/alpha/system/kernel.ld
> @@ -0,0 +1,30 @@
> +ENTRY(_start)
> +
> +SECTIONS
> +{
> +    /* Linux kernel legacy start address.  */
> +    . =3D 0xfffffc0000310000;
> +    _text =3D .;
> +    .text : {
> +        *(.text)
> +    }
> +    .rodata : {
> +        *(.rodata)
> +    }
> +    _etext =3D .;
> +
> +    . =3D ALIGN(8192);
> +    _data =3D .;
> +    .got : {
> +        *(.got)
> +    }
> +    .data : {
> +	*(.sdata)
> +        *(.data)
> +    }
> +    _edata =3D .;
> +    .bss : {
> +        *(.bss)
> +    }
> +    _end =3D .;
> +}


--
Alex Benn=C3=A9e

