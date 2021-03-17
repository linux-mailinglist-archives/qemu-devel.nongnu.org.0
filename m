Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B1633FAF5
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 23:22:30 +0100 (CET)
Received: from localhost ([::1]:56478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMeYf-0007Et-R5
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 18:22:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <macro@orcam.me.uk>) id 1lMeXl-0006Zx-0M
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 18:21:33 -0400
Received: from angie.orcam.me.uk ([157.25.102.26]:34008)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <macro@orcam.me.uk>) id 1lMeXi-0001Y0-KP
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 18:21:32 -0400
Received: by angie.orcam.me.uk (Postfix, from userid 500)
 id 8BED892009C; Wed, 17 Mar 2021 23:21:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by angie.orcam.me.uk (Postfix) with ESMTP id 84B0A92009B;
 Wed, 17 Mar 2021 23:21:23 +0100 (CET)
Date: Wed, 17 Mar 2021 23:21:23 +0100 (CET)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [RFC PATCH 32/42] docker: Add gentoo-mipsr5900el-cross image
In-Reply-To: <4a79a00b-7be9-deec-89de-941a73454f77@amsat.org>
Message-ID: <alpine.DEB.2.21.2103172243160.21463@angie.orcam.me.uk>
References: <20210214175912.732946-1-f4bug@amsat.org>
 <20210214175912.732946-33-f4bug@amsat.org>
 <20210215115957.GG1542881@redhat.com> <YCp7Ce6ELbLFvRXZ@sx9>
 <ebbdecd9-e599-1a4b-60e8-3464afa4a20e@amsat.org>
 <21217ef4-91d8-6877-5d78-bb78e00773d8@amsat.org>
 <alpine.DEB.2.21.2103121741460.33195@angie.orcam.me.uk>
 <d0401476-0b3c-d7ce-8d0f-aa9b348da4fe@amsat.org>
 <alpine.DEB.2.21.2103122053200.33195@angie.orcam.me.uk>
 <4a79a00b-7be9-deec-89de-941a73454f77@amsat.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Received-SPF: none client-ip=157.25.102.26; envelope-from=macro@orcam.me.uk;
 helo=angie.orcam.me.uk
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>, Fredrik Noring <noring@nocrew.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-devel@nongnu.org,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 17 Mar 2021, Philippe Mathieu-Daudé wrote:

> Maciej, I tried your suggestion as follow:
> 
> $ mipsel-linux-gnu-gcc --version
> mipsel-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0
> Copyright (C) 2018 Free Software Foundation, Inc.
> This is free software; see the source for copying conditions.  There is NO
> warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
> 
> $ mipsel-linux-gnu-gcc -print-multi-lib
> .;
> n32;@mabi=n32
> 64;@mabi=64

 OK, so these are for the three ABIs Linux support, plain.  You'd have to 
bootstrap your own compiler and either reconfigure it at least for n32 
with a `-msoft-float' multilib, or build a non-multilib compiler for this 
ABI variant.  Either way including glibc which to the best of my knowledge 
does support soft-float MIPS configurations.

> soft-float is not listed, but:
> 
> $ touch a.c
> $ mipsel-linux-gnu-gcc -mabi=n32 -march=r5900 -msoft-float -c a.c
> $ file a.o
> a.o: ELF 32-bit LSB relocatable, MIPS, N32 MIPS-III version 1 (SYSV),
> not stripped
> $ readelf -h a.o
> ELF Header:
>   Magic:   7f 45 4c 46 01 01 01 00 00 00 00 00 00 00 00 00
>   Class:                             ELF32
>   Data:                              2's complement, little endian
>   Version:                           1 (current)
>   OS/ABI:                            UNIX - System V
>   ABI Version:                       0
>   Type:                              REL (Relocatable file)
>   Machine:                           MIPS R3000
>   Version:                           0x1
>   Entry point address:               0x0
>   Start of program headers:          0 (bytes into file)
>   Start of section headers:          456 (bytes into file)
>   Flags:                             0x20920026, pic, cpic, abi2, 5900,
> mips3
>   Size of this header:               52 (bytes)
>   Size of program headers:           0 (bytes)
>   Number of program headers:         0
>   Size of section headers:           40 (bytes)
>   Number of section headers:         13
>   Section header string table index: 12
> 
> So we can compile, but:

 Yes, all code models are always available for compilation (you can choose 
the default though).  We (ab)use this feature for instance to build the 
Linux kernel, which obviously uses the bare metal non-PIC model.

> $ mipsel-linux-gnu-gcc -mabi=n32 -march=r5900 -msoft-float -L
> /usr/lib/mipsel-linux-gnu tests/tcg/mips/test-r5900-dmult.c
> /usr/lib/gcc-cross/mipsel-linux-gnu/8/../../../../mipsel-linux-gnu/bin/ld:
> /usr/lib/../lib32/Scrt1.o: relocations in generic ELF (EM: 3)
> /usr/lib/gcc-cross/mipsel-linux-gnu/8/../../../../mipsel-linux-gnu/bin/ld:
> /usr/lib/../lib32/Scrt1.o: error adding symbols: file in wrong format
> collect2: error: ld returned 1 exit status

 Yes, the problem is in the missing runtime, and whatever GCC defaults to 
is not link-compatible.  The message from the linker indicates it couldn't 
have chosen a MIPS emulation at all even.

> $ mipsel-linux-gnu-readelf -h /usr/lib/mipsel-linux-gnu/Scrt1.o
> ELF Header:
>   Magic:   7f 45 4c 46 01 01 01 00 00 00 00 00 00 00 00 00
>   Class:                             ELF32
>   Data:                              2's complement, little endian
>   Version:                           1 (current)
>   OS/ABI:                            UNIX - System V
>   ABI Version:                       0
>   Type:                              REL (Relocatable file)
>   Machine:                           MIPS R3000
>   Version:                           0x1
>   Entry point address:               0x0
>   Start of program headers:          0 (bytes into file)
>   Start of section headers:          908 (bytes into file)
>   Flags:                             0x70001007, noreorder, pic, cpic,
> o32, mips32r2
>   Size of this header:               52 (bytes)
>   Size of program headers:           0 (bytes)
>   Number of program headers:         0
>   Size of section headers:           40 (bytes)
>   Number of section headers:         15
>   Section header string table index: 14

 That is a plain o32 ABI object.

> The multilib documentation is scarce :)

 Ask questions. :)

> Also I wondered if I could abuse the linker a bit, knowing the resulting
> binary would be crap due to ABI mismatch, and got:
> 
> $ mipsel-linux-gnu-gcc -march=r5900 -msoft-float -o test-r5900-dmult
> test-r5900-dmult.o
> collect2: fatal error: ld terminated with signal 11 [Segmentation
> fault], core dumped
> compilation terminated.
> /usr/lib/gcc-cross/mipsel-linux-gnu/8/../../../../mipsel-linux-gnu/bin/ld:
> test-r5900-dmult.o: ABI is incompatible with that of the selected emulation
> /usr/lib/gcc-cross/mipsel-linux-gnu/8/../../../../mipsel-linux-gnu/bin/ld:
> failed to merge target specific data of file test-r5900-dmult.o
> /usr/lib/gcc-cross/mipsel-linux-gnu/8/../../../../mipsel-linux-gnu/bin/ld:
> BFD (GNU Binutils for Debian) 2.31.1 assertion fail
> ../../bfd/elfxx-mips.c:3566

 This looks like a linker bug, it's not supposed to report assertion 
failures let alone crash even if fed with rubbish.  However version 2.31.1 
is very old for any kind of odd experiments.

 Would you be able to try the current trunk?  If that still shows the 
crash would you mind filing a bug with a full recipe to reproduce it at 
<https://sourceware.org/bugzilla/>?

 Regardless you can try fooling the linker by stripping the 
`.gnu.attributes' and `.MIPS.abiflags' sections from test-r5900-dmult.o 
with `objcopy'.  This will make the linker consider it a legacy object 
with no float mode annotation.

 This does not answer the question implied by the choice I have given as 
to whether you actually need to use `-march=r5900 -msoft-float' with these 
compilations or whether plain `-march=mips3' will suffice.

 I think it will do, as at this point we only have minimal R5900 support 
in the compiler and Linux is supposed to emulate the MIPS III instructions 
missing from the architecture, including full IEEE 754 FP.  So the use of 
`-march=r5900' does not appear to buy us anything.  And any R5900-specific 
assembly can be wrapped into an appropriate pseudo-op sequence involving 
`.set arch=r5900'.  I think this approach will enable forward progress.

  Maciej

