Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C519A339760
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 20:26:53 +0100 (CET)
Received: from localhost ([::1]:40338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKnQy-0005qm-KL
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 14:26:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noring@nocrew.org>) id 1lKmSP-0006cb-6O
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 13:24:17 -0500
Received: from pio-pvt-msa1.bahnhof.se ([79.136.2.40]:60226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noring@nocrew.org>) id 1lKmSM-00028w-MV
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 13:24:16 -0500
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 9D0CC3F969;
 Fri, 12 Mar 2021 19:24:11 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Score: -1.9
Received: from pio-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NFOSDUQj2EDf; Fri, 12 Mar 2021 19:24:10 +0100 (CET)
Received: by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 0744C3F88C;
 Fri, 12 Mar 2021 19:24:08 +0100 (CET)
Date: Fri, 12 Mar 2021 19:24:08 +0100
From: Fredrik Noring <noring@nocrew.org>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Subject: Re: [RFC PATCH 32/42] docker: Add gentoo-mipsr5900el-cross image
Message-ID: <YEuxyF9l1LfBLptS@sx9>
References: <20210214175912.732946-1-f4bug@amsat.org>
 <20210214175912.732946-33-f4bug@amsat.org>
 <20210215115957.GG1542881@redhat.com> <YCp7Ce6ELbLFvRXZ@sx9>
 <ebbdecd9-e599-1a4b-60e8-3464afa4a20e@amsat.org>
 <21217ef4-91d8-6877-5d78-bb78e00773d8@amsat.org>
 <alpine.DEB.2.21.2103121741460.33195@angie.orcam.me.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alpine.DEB.2.21.2103121741460.33195@angie.orcam.me.uk>
Received-SPF: softfail client-ip=79.136.2.40; envelope-from=noring@nocrew.org;
 helo=pio-pvt-msa1.bahnhof.se
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Friday, 12 March 2021, Maciej W. Rozycki wrote:
> On Fri, 12 Mar 2021, Philippe Mathieu-Daudé wrote:
> 
> > >>> Is there any way we can do this with a distro that isn't Gentoo
> > >>> so that we can get a container build that is fast enough to be
> > >>> useful for CI ?
> > 
> > Using the Debian cross image I get:
> > 
> > /home/phil/source/qemu/tests/docker/docker.py --engine auto cc --cc
> > mips64el-linux-gnuabi64-gcc -i qemu/debian-mips64el-cross -s
> > /home/phil/source/qemu --   -Wall -Werror -O0 -g -fno-strict-aliasing
> > -mabi=n32 -march=r5900
> > /home/phil/source/qemu/tests/tcg/mips/test-r5900-dmult.c -o
> > test-r5900-dmult  -static
> > cc1: error: unsupported combination: -march=r5900 -mhard-float
> > -mdouble-float
> > 
> > No clue what is setting '-mhard-float -mdouble-float' yet.
> 
>  The R5900 has an FPU that only supports the single floating-point format.  
> It's also not an IEEE 754 format.  The Linux kernel ABI does support the 
> double and also the single floating-point format, both compliant with IEEE 
> 754.
> 
>  In the absence of a suitable FPU emulation code included with the kernel 
> will handle the missing instructions (you can use the `nofpu' kernel 
> parameter to force that in the presence of an FPU too).  Beware however 
> that a recent change to the Linux kernel made FPU emulation code optional 
> to suit some deeply embedded applications known never to use FPU machine 
> instructions.
> 
>  NB the presence of emulation is always required for MIPS ISA compliance 
> if FPU machine instructions are ever to be used in a given application, 
> because operations are allowed to trap regardless and rely on emulation.
> 
>  I don't know what you are trying to achieve,

I believe Philippe is trying to compile

https://lists.gnu.org/archive/html/qemu-devel/2021-03/msg04565.html

testing this:

	The R5900 reports itself as MIPS III but does not implement DMULT.
	Verify that DMULT is emulated properly in user mode by multiplying
	two 64-bit numbers to produce a 128-bit number.

with this piece of code (notice the mips3 ISA directive for DMULT):

/*
 * Test DMULT.
 */

#include <stdio.h>
#include <inttypes.h>
#include <assert.h>

struct hi_lo { int64_t hi; uint64_t lo; };

static struct hi_lo dmult(int64_t rs, int64_t rt)
{
    int64_t hi;
    uint64_t lo;

    /*
     * The R5900 reports itself as MIPS III but does not implement DMULT.
     * Verify that DMULT is emulated properly in user mode.
     */
    __asm__ __volatile__ (
            "    .set  mips3\n"
            "    dmult %2, %3\n"
            "    mfhi  %0\n"
            "    mflo  %1\n"
            : "=r" (hi), "=r" (lo)
            : "r" (rs), "r" (rt));

    return (struct hi_lo) { .hi = hi, .lo = lo };
}

int main()
{
    /* Verify that multiplying two 64-bit numbers yields a 128-bit number. */
    struct hi_lo r = dmult(2760727302517, 5665449960167);

    assert(r.hi == 847887);
    assert(r.lo == 7893651516417804947);

    return 0;
}

> but your two options to choose from are:
> 
> 1. Build for the soft-float ABI (`-msoft-float') where any FP calculations 
>    are compiled such as to be made by the CPU using integer arithmetic.
> 
> 2. Build for a generic MIPS ISA, for the R5900/n32 that would be MIPS III
>    (`-march=mips3'), and rely on the kernel FPU emulation.  Note that some 
>    integer MIPS III operations are missing too from the R5900 and have to 
>    be emulated by the kernel for MIPS/Linux n32 psABI compliance (an 
>    implementation can be pinched from an old libgcc version that was still 
>    under GNU GPLv2 or another algorithm reused, e.g. my `__div64_32' piece
>    easily adapted).

So qemu/tests/tcg/mips/Makefile.target is patched with

# r5900 is only 64 bit little-endian
ifneq ($(findstring 64el,$(TARGET_NAME)),)
MIPS_TESTS += test-r5900-dmult
test-r5900-dmult: CFLAGS += -mabi=n32 -march=r5900
endif

I didn't have issues with the -mhard-float -mdouble-float flags at the time,
and I didn't use mips64el-linux-gnuabi64-gcc for Debian.

Fredrik

