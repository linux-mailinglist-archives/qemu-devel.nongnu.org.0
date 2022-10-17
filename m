Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 486166005DF
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 05:58:26 +0200 (CEST)
Received: from localhost ([::1]:36730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okHGi-0001ul-TQ
	for lists+qemu-devel@lfdr.de; Sun, 16 Oct 2022 23:58:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=kNOZ=2S=zx2c4.com=Jason@kernel.org>)
 id 1okHFN-0000TJ-Em
 for qemu-devel@nongnu.org; Sun, 16 Oct 2022 23:57:01 -0400
Received: from ams.source.kernel.org ([145.40.68.75]:60520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=kNOZ=2S=zx2c4.com=Jason@kernel.org>)
 id 1okHFK-0003Yp-VA
 for qemu-devel@nongnu.org; Sun, 16 Oct 2022 23:57:01 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 545E6B80E9F;
 Mon, 17 Oct 2022 03:56:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A9D8C433D7;
 Mon, 17 Oct 2022 03:56:44 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=fail reason="signature verification failed" (1024-bit key)
 header.d=zx2c4.com header.i=@zx2c4.com header.b="cecplFSn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1665979002;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JwALQTSCRBG9CM02FlmFUPwtLn0xaw8ce9OpLk6QDJY=;
 b=cecplFSnwCcMS1U0D0+w9taJPOarcEVWVSd+5z7b7GF+ZU7UFcFnQ1vdERTZyMOljynsyd
 4wknvHvopeWOh6HmtCrOHUl+rN2d7TwIhc67YjB2YeRIxAx16Lzq/8M/2RSy+FVFEKdQT6
 RJE7n+YWQqzgQIkFre/K0XedmgOHE2g=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 05d50589
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Mon, 17 Oct 2022 03:56:41 +0000 (UTC)
Date: Sun, 16 Oct 2022 21:56:35 -0600
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Subject: Re: [PULL 0/2] M68k for 7.2 patches
Message-ID: <Y0zScz9aaUulC78c@zx2c4.com>
References: <20221014072356.2075517-1-laurent@vivier.eu>
 <CAJSP0QWcxLFQnrsqJxVw4k1-bsnq1XVGFQj12FLpAi5ar397VQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAJSP0QWcxLFQnrsqJxVw4k1-bsnq1XVGFQj12FLpAi5ar397VQ@mail.gmail.com>
Received-SPF: pass client-ip=145.40.68.75;
 envelope-from=SRS0=kNOZ=2S=zx2c4.com=Jason@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -64
X-Spam_score: -6.5
X-Spam_bar: ------
X-Spam_report: (-6.5 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  "Jason A. Donenfeld" <Jason@zx2c4.com>
From:  "Jason A. Donenfeld" via <qemu-devel@nongnu.org>

On Sun, Oct 16, 2022 at 03:50:54PM -0400, Stefan Hajnoczi wrote:
> On Fri, 14 Oct 2022 at 03:26, Laurent Vivier <laurent@vivier.eu> wrote:
> >
> > The following changes since commit f1d33f55c47dfdaf8daacd618588ad3ae4c452d1:
> >
> >   Merge tag 'pull-testing-gdbstub-plugins-gitdm-061022-3' of https://github.com/stsquad/qemu into staging (2022-10-06 07:11:56 -0400)
> >
> > are available in the Git repository at:
> >
> >   https://github.com/vivier/qemu-m68k.git tags/m68k-for-7.2-pull-request
> >
> > for you to fetch changes up to fa327be58280f76d2565ff0bdb9b0010ac97c3b0:
> >
> >   m68k: write bootinfo as rom section and re-randomize on reboot (2022-10-11 23:02:46 +0200)
> >
> > ----------------------------------------------------------------
> > Pull request m68k branch 20221014
> >
> > Update rng seed boot parameter
> >
> > ----------------------------------------------------------------
> >
> > Jason A. Donenfeld (2):
> >   m68k: rework BI_VIRT_RNG_SEED as BI_RNG_SEED
> >   m68k: write bootinfo as rom section and re-randomize on reboot
> 
> This commit breaks mingw64 due to the Windows LLP64 data model where
> pointers don't fit into unsigned long
> (https://en.wikipedia.org/wiki/LP64#64-bit_data_models). Please use
> uintptr_t instead of unsigned long:

Holy smokes; I didn't realize that qemu was ever compiled this way.

Laurent - do you want me to send you a follow-up commit fixing that, a
new commit fixing that, or do you want to adjust the current commit
yourself? Any choice is fine with me.

Jason

> 
> x86_64-w64-mingw32-gcc -m64 -mcx16 -Ilibqemu-m68k-softmmu.fa.p -I.
> -I.. -Itarget/m68k -I../target/m68k -Iqapi -Itrace -Iui -Iui/shader
> -I/usr/x86_64-w64-mingw32/sys-root/mingw/include/pixman-1
> -I/usr/x86_64-w64-mingw32/sys-root/mingw/include/glib-2.0
> -I/usr/x86_64-w64-mingw32/sys-root/mingw/lib/glib-2.0/include
> -fdiagnostics-color=auto -Wall -Winvalid-pch -Werror -std=gnu11 -O2 -g
> -iquote . -iquote /builds/qemu-project/qemu -iquote
> /builds/qemu-project/qemu/include -iquote
> /builds/qemu-project/qemu/tcg/i386 -mms-bitfields -U_FORTIFY_SOURCE
> -D_FORTIFY_SOURCE=2 -fno-pie -no-pie -D_GNU_SOURCE
> -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -Wstrict-prototypes
> -Wredundant-decls -Wundef -Wwrite-strings -Wmissing-prototypes
> -fno-strict-aliasing -fno-common -fwrapv -Wold-style-declaration
> -Wold-style-definition -Wtype-limits -Wformat-security -Wformat-y2k
> -Winit-self -Wignored-qualifiers -Wempty-body -Wnested-externs
> -Wendif-labels -Wexpansion-to-defined -Wimplicit-fallthrough=2
> -Wno-missing-include-dirs -Wno-shift-negative-value -Wno-psabi
> -fstack-protector-strong -DNEED_CPU_H
> '-DCONFIG_TARGET="m68k-softmmu-config-target.h"'
> '-DCONFIG_DEVICES="m68k-softmmu-config-devices.h"' -MD -MQ
> libqemu-m68k-softmmu.fa.p/hw_m68k_virt.c.obj -MF
> libqemu-m68k-softmmu.fa.p/hw_m68k_virt.c.obj.d -o
> libqemu-m68k-softmmu.fa.p/hw_m68k_virt.c.obj -c ../hw/m68k/virt.c
> In file included from ../hw/m68k/virt.c:23:
> ../hw/m68k/virt.c: In function 'virt_init':
> ../hw/m68k/bootinfo.h:58:26: error: cast from pointer to integer of
> different size [-Werror=pointer-to-int-cast]
> 58 | base = (void *)(((unsigned long)base + 3) & ~3); \
> | ^
> ../hw/m68k/virt.c:261:13: note: in expansion of macro 'BOOTINFOSTR'
> 261 | BOOTINFOSTR(param_ptr, BI_COMMAND_LINE,
> | ^~~~~~~~~~~
> ../hw/m68k/bootinfo.h:58:16: error: cast to pointer from integer of
> different size [-Werror=int-to-pointer-cast]
> 58 | base = (void *)(((unsigned long)base + 3) & ~3); \
> | ^
> ../hw/m68k/virt.c:261:13: note: in expansion of macro 'BOOTINFOSTR'
> 261 | BOOTINFOSTR(param_ptr, BI_COMMAND_LINE,
> | ^~~~~~~~~~~
> ../hw/m68k/bootinfo.h:75:26: error: cast from pointer to integer of
> different size [-Werror=pointer-to-int-cast]
> 75 | base = (void *)(((unsigned long)base + 3) & ~3); \
> | ^
> ../hw/m68k/virt.c:268:9: note: in expansion of macro 'BOOTINFODATA'
> 268 | BOOTINFODATA(param_ptr, BI_RNG_SEED,
> | ^~~~~~~~~~~~
> ../hw/m68k/bootinfo.h:75:16: error: cast to pointer from integer of
> different size [-Werror=int-to-pointer-cast]
> 75 | base = (void *)(((unsigned long)base + 3) & ~3); \
> | ^
> ../hw/m68k/virt.c:268:9: note: in expansion of macro 'BOOTINFODATA'
> 268 | BOOTINFODATA(param_ptr, BI_RNG_SEED,
> | ^~~~~~~~~~~~
> cc1: all warnings being treated as errors
> 
> https://gitlab.com/qemu-project/qemu/-/jobs/3179717070
> 
> >
> >  hw/m68k/bootinfo.h                            | 48 ++++++------
> >  .../standard-headers/asm-m68k/bootinfo-virt.h |  4 +-
> >  include/standard-headers/asm-m68k/bootinfo.h  |  8 +-
> >  hw/m68k/q800.c                                | 76 ++++++++++++++-----
> >  hw/m68k/virt.c                                | 57 +++++++++-----
> >  5 files changed, 130 insertions(+), 63 deletions(-)
> >
> > --
> > 2.37.3
> >
> >
> 

