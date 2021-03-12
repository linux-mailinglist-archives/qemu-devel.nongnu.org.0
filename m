Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C643E339450
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 18:10:49 +0100 (CET)
Received: from localhost ([::1]:50936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKlJI-00058V-QL
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 12:10:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <macro@orcam.me.uk>) id 1lKlDt-000152-0n
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 12:05:13 -0500
Received: from angie.orcam.me.uk ([2001:4190:8020::4]:40414)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <macro@orcam.me.uk>) id 1lKlDq-0007yz-QN
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 12:05:12 -0500
Received: by angie.orcam.me.uk (Postfix, from userid 500)
 id ECDB892009C; Fri, 12 Mar 2021 18:05:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by angie.orcam.me.uk (Postfix) with ESMTP id E8A7192009B;
 Fri, 12 Mar 2021 18:05:01 +0100 (CET)
Date: Fri, 12 Mar 2021 18:05:01 +0100 (CET)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [RFC PATCH 32/42] docker: Add gentoo-mipsr5900el-cross image
In-Reply-To: <21217ef4-91d8-6877-5d78-bb78e00773d8@amsat.org>
Message-ID: <alpine.DEB.2.21.2103121741460.33195@angie.orcam.me.uk>
References: <20210214175912.732946-1-f4bug@amsat.org>
 <20210214175912.732946-33-f4bug@amsat.org>
 <20210215115957.GG1542881@redhat.com> <YCp7Ce6ELbLFvRXZ@sx9>
 <ebbdecd9-e599-1a4b-60e8-3464afa4a20e@amsat.org>
 <21217ef4-91d8-6877-5d78-bb78e00773d8@amsat.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Received-SPF: none client-ip=2001:4190:8020::4; envelope-from=macro@orcam.me.uk;
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

On Fri, 12 Mar 2021, Philippe Mathieu-Daudé wrote:

> >>> Is there any way we can do this with a distro that isn't Gentoo
> >>> so that we can get a container build that is fast enough to be
> >>> useful for CI ?
> 
> Using the Debian cross image I get:
> 
> /home/phil/source/qemu/tests/docker/docker.py --engine auto cc --cc
> mips64el-linux-gnuabi64-gcc -i qemu/debian-mips64el-cross -s
> /home/phil/source/qemu --   -Wall -Werror -O0 -g -fno-strict-aliasing
> -mabi=n32 -march=r5900
> /home/phil/source/qemu/tests/tcg/mips/test-r5900-dmult.c -o
> test-r5900-dmult  -static
> cc1: error: unsupported combination: -march=r5900 -mhard-float
> -mdouble-float
> 
> No clue what is setting '-mhard-float -mdouble-float' yet.

 The R5900 has an FPU that only supports the single floating-point format.  
It's also not an IEEE 754 format.  The Linux kernel ABI does support the 
double and also the single floating-point format, both compliant with IEEE 
754.

 In the absence of a suitable FPU emulation code included with the kernel 
will handle the missing instructions (you can use the `nofpu' kernel 
parameter to force that in the presence of an FPU too).  Beware however 
that a recent change to the Linux kernel made FPU emulation code optional 
to suit some deeply embedded applications known never to use FPU machine 
instructions.

 NB the presence of emulation is always required for MIPS ISA compliance 
if FPU machine instructions are ever to be used in a given application, 
because operations are allowed to trap regardless and rely on emulation.

 I don't know what you are trying to achieve, but your two options to 
choose from are:

1. Build for the soft-float ABI (`-msoft-float') where any FP calculations 
   are compiled such as to be made by the CPU using integer arithmetic.

2. Build for a generic MIPS ISA, for the R5900/n32 that would be MIPS III
   (`-march=mips3'), and rely on the kernel FPU emulation.  Note that some 
   integer MIPS III operations are missing too from the R5900 and have to 
   be emulated by the kernel for MIPS/Linux n32 psABI compliance (an 
   implementation can be pinched from an old libgcc version that was still 
   under GNU GPLv2 or another algorithm reused, e.g. my `__div64_32' piece
   easily adapted).

 HTH,

  Maciej

