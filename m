Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD8B339C7E
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 08:04:06 +0100 (CET)
Received: from localhost ([::1]:37148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKyJg-00035L-T9
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 02:04:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noring@nocrew.org>) id 1lKyII-0002O2-6O
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 02:02:38 -0500
Received: from pio-pvt-msa1.bahnhof.se ([79.136.2.40]:44414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noring@nocrew.org>) id 1lKyIG-0001C6-Em
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 02:02:37 -0500
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTP id A533D3F5D8;
 Sat, 13 Mar 2021 08:02:33 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Score: -1.901
Received: from pio-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IFVv9fOT7evE; Sat, 13 Mar 2021 08:02:32 +0100 (CET)
Received: by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 8CD3C3F59D;
 Sat, 13 Mar 2021 08:02:30 +0100 (CET)
Date: Sat, 13 Mar 2021 08:02:30 +0100
From: Fredrik Noring <noring@nocrew.org>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Subject: Re: [RFC PATCH 32/42] docker: Add gentoo-mipsr5900el-cross image
Message-ID: <YExjhs0IHOElecsj@sx9>
References: <20210214175912.732946-1-f4bug@amsat.org>
 <20210214175912.732946-33-f4bug@amsat.org>
 <20210215115957.GG1542881@redhat.com> <YCp7Ce6ELbLFvRXZ@sx9>
 <ebbdecd9-e599-1a4b-60e8-3464afa4a20e@amsat.org>
 <21217ef4-91d8-6877-5d78-bb78e00773d8@amsat.org>
 <alpine.DEB.2.21.2103121741460.33195@angie.orcam.me.uk>
 <d0401476-0b3c-d7ce-8d0f-aa9b348da4fe@amsat.org>
 <alpine.DEB.2.21.2103122053200.33195@angie.orcam.me.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alpine.DEB.2.21.2103122053200.33195@angie.orcam.me.uk>
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
> > > but your two options to 
> > > choose from are:
> > > 
> > > 1. Build for the soft-float ABI (`-msoft-float') where any FP calculations 
> > >    are compiled such as to be made by the CPU using integer arithmetic.
> > 
> > With the Debian toolchain I get:
> > 
> > /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No
> > such file or directory
> >  #include <bits/libc-header-start.h>
> >           ^~~~~~~~~~~~~~~~~~~~~~~~~~
> 
>  You need to have a soft-float multilib available.  You can use:
> 
> $ gcc -print-multi-lib
> 
> to see what multilibs are available.  You'd have to have one that includes 
> `-msoft-float' and `-mabi=n32' both at a time.  If there's no such one, 
> then you'll have to build your own cross-compiler (including soft-float 
> libc).

Perhaps, for the purpose of this test, if Debian doesn't have soft-float
and can't be recompiled, the -march=r5900 option could be omitted to
instead have objcopy (or even xxd) fix up the ELF to have it appear as
an R5900 program afterwards?

DMULT within an R5900 ELF would still be tested, as intended, even if
there might be some additional non-R5900 instructions in it as well (which
R5900/QEMU is supposed to accept anyway, no?).

On Friday, 12 March 2021, Philippe Mathieu-Daudé wrote:
> On 3/12/21 7:24 PM, Fredrik Noring wrote:
> > So qemu/tests/tcg/mips/Makefile.target is patched with
> > 
> > # r5900 is only 64 bit little-endian
> > ifneq ($(findstring 64el,$(TARGET_NAME)),)
> > MIPS_TESTS += test-r5900-dmult
> > test-r5900-dmult: CFLAGS += -mabi=n32 -march=r5900
> > endif
> > 
> > I didn't have issues with the -mhard-float -mdouble-float flags at the time,
> > and I didn't use mips64el-linux-gnuabi64-gcc for Debian.
> 
> Yes, this works with Gentoo. But building the Gentoo's r5900 toolchain
> container is too expensive for our CI, so I was trying with Debian, but
> with no luck so far.

Why rebuild the Gentoo toolchain so often, then? :) A couple of times per
year, and on special occasions (such as security updates or wanted feature
extensions), would be enough, I think. Gentoo has rolling releases, as
opposed to major releases, and old stuff (GCC in particular) can coexist
with modern counterparts via package slots, or in overlays, etc.

Of course, one might find it practical to use Debian for everything anyhow.

Fredrik

