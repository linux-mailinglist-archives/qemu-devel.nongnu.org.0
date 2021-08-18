Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 208343F04EE
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 15:37:15 +0200 (CEST)
Received: from localhost ([::1]:48884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGLkn-0000ZU-Tl
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 09:37:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mGLjh-0008HR-S5
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 09:36:05 -0400
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d]:47000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mGLjg-00036j-8G
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 09:36:05 -0400
Received: by mail-yb1-xb2d.google.com with SMTP id k65so5244154yba.13
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 06:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/sBLUueQQF3HmFxioJ+hiOxSZIVhgAU2Yu4hBlsFcyk=;
 b=fsOB+NtF+DAb3Pz3q4ojTJXJBCNq8hyoe8l9/O8kzO4Iv9ymqSpHrbycEkN1+QnCeh
 CW8n6PmM+ZQzUfLQ2SdTDC8TzvufnTMuUoe7u8FUmTavsovUhm/60nhFNRR4+bScLjpV
 RPJA7vFOMUDNlQ7RzQjCMEpQqAazXFpntCoolA6MZBEKDn6rVmd53AB2sLEurDh4bwsK
 6JU3JFyoAahx1v6slZno+SQNtN540ugRqVUa6J2fqu8/oSyBrSSENHLc30uBz+8va8BY
 STr7gfwguS9r7T3//AM+WKXz/uIaAtRobvUXqhysYAMauH8hNaPDNJUg0Od4SUcB93KS
 8AXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/sBLUueQQF3HmFxioJ+hiOxSZIVhgAU2Yu4hBlsFcyk=;
 b=MPMYf7l/XcItth0TW19BSS6NFx+gPkl9cJWBqn+CuCt+r0JXeVfZ7UgJu96t0qCbPH
 fxJF1DdIr7TdlpanxritXKFNPjUB4Z4VfaaThzT9T0wzyDu/LIbJWmqeD1eIcJitB/0a
 H2C2y5xtU20WUbtoWBi4LVoQy2a9xK2/vuvwlw5bhxZs4XidAxzTz2RrYNyTA+6w6406
 E0d9yjrJuua9DZCigKrAOPKBHAIUfR3Bgtbo74KSK7uUxtt37VU5zvtTXTx8Ae7tDppJ
 FAUGnIahQKMxi/Lw9+EaFRFXl/JBfGgTXAfiFlh5mExqb2ZPZnlltRhn+hAuOp0OFEVl
 EwYg==
X-Gm-Message-State: AOAM530mx6hT0OIop/DhY9InnmwH0Tv6KjW9C0uFBK6IU3Gc8leMkuE+
 l+rZZ1GZIr011sewzypYpVAWBp91XvcYvy7Ysr8=
X-Google-Smtp-Source: ABdhPJwu67GCz33sHTHOjy8vbmEhhswC3qafSoMFQ0BT7qamiUr6nOYbg8Gxav81ZXGwBpLFhi9nStkabrmLutjYri8=
X-Received: by 2002:a25:2646:: with SMTP id m67mr11231195ybm.122.1629293763150; 
 Wed, 18 Aug 2021 06:36:03 -0700 (PDT)
MIME-Version: 1.0
References: <162928715931.357603.15628842472925815718.stgit@pc-System-Product-Name>
 <162928727089.357603.8471789223247950118.stgit@pc-System-Product-Name>
 <CAEUhbmXwr0wvabJ8e2=VBbf6OgFehuOGH78XZGBaukDgOfPiQA@mail.gmail.com>
 <CAFEAcA9xucqeJK5t-He8p8sMGA4dStCHy_y+ZxNtuF1EcHx50Q@mail.gmail.com>
In-Reply-To: <CAFEAcA9xucqeJK5t-He8p8sMGA4dStCHy_y+ZxNtuF1EcHx50Q@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 18 Aug 2021 21:35:51 +0800
Message-ID: <CAEUhbmU2LohqBOPTjEP0iRBxn5pgpjHLVSoZp76G4jQrp_COPA@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] arm/monitor: Add support for 'info tlb' command
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2d.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: NDNF <arkaisp2021@gmail.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Pavel Dovgaluk <pavel.dovgaluk@ispras.ru>, Changbin Du <changbin.du@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Aug 18, 2021 at 8:54 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Wed, 18 Aug 2021 at 13:00, Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > On Wed, Aug 18, 2021 at 7:48 PM NDNF <arkaisp2021@gmail.com> wrote:
> > >
> > > This adds hmp 'info tlb' command support for the arm platform.
> > > The limitation is that this only implements a page walker for
> > > ARMv8-A AArch64 Long Descriptor format, 32bit addressing is
> > > not supported yet.
> > >
> > > Signed-off-by: Changbin Du <changbin.du@gmail.com>
> > > Signed-off-by: Ivanov Arkady <arkaisp2021@gmail.com>
> > > ---
> > >  hmp-commands-info.hx |    3 +
> > >  target/arm/monitor.c |  170 ++++++++++++++++++++++++++++++++++++++++++++++++++
> > >  2 files changed, 172 insertions(+), 1 deletion(-)
> > >
> >
> > I believe this is not TLB on ARM, but PTE?
> >
> > RISC-V implemented a "info mem" for page table walk.
>
> We call our "give page table walk" monitor command "info tlb"
> for some reason (probably historical). From the docs:
> https://qemu-project.gitlab.io/qemu/system/monitor.html
>   info tlb
>       Show virtual to physical memory mappings
>   info mem
>       Show the active virtual memory mappings.
>
> Looking at x86's output, "info tlb" gives lines like this:

I don't know why x86 provides 2 almost the same things.

>
> ffffffffc04f6000: 00000000b2576000 -G-DA----
> ffffffffc04f7000: 00000000b2579000 -G-DA----
> ffffffffc04f8000: 00000000bac74000 XG-DA----
> ffffffffc04f9000: 00000000b258b000 XG-DA----
> ffffffffc04fa000: 00000000b248b000 XG-DA---W
> ffffffffc04fb000: 00000000b2431000 XG-DA---W
> ffffffffc0502000: 00000000bb69c000 -G-DA----
> ffffffffc0503000: 00000000b27d3000 XG-DA----
>

Naming it to "tlb" really confuses people. On ppce500, "info tlb"
gives the real processor TLBs, not the PTEs.

(qemu) info tlb

TLB0:
Effective          Physical           Size TID   TS SRWX URWX WIMGE U0123

TLB1:
Effective          Physical           Size TID   TS SRWX URWX WIMGE U0123
0x00000000e0000000 0x0000000fe0000000   1M 0     0  SRW-U--- -I-G- U----
0x0000000000000000 0x0000000000000000  64M 0     0  SRWXU--- --M-- U----
0x0000000004000000 0x0000000004000000  64M 0     0  SRWXU--- --M-- U----
0x00000000f0000000 0x0000000f00000000  64M 0     0  SRW-U--- -I-G- U----
0x0000000080000000 0x0000000c00000000 256M 0     0  SRW-U--- -I-G- U----
0x0000000090000000 0x0000000c10000000 256M 0     0  SRW-U--- -I-G- U----
0x00000000a0000000 0x0000000fe1000000  64K 0     0  SRW-U--- -I-G- U----
0x00000000f4000000 0x0000000f04000000  64M 0     0  SRW-U--- -I-G- U----

So we are unfortunately inconsistent among these arches that support "info tlb".

> which is a dump of the page table, with one line per page,
> giving the vaddr, the physaddr and associated flag information.
>
> "info mem" gives lines like this:
>
> ffffffffc04f6000-ffffffffc04fa000 0000000000004000 -r-
> ffffffffc04fa000-ffffffffc04fc000 0000000000002000 -rw
> ffffffffc0502000-ffffffffc0504000 0000000000002000 -r-
>
> which just give "this range of virtual addresses of this
> length have these permissions". You can see that it
> coalesces multiple adjacent pages with the same permissions
> into a single line.
>
> The only architectures which implement "info mem"
> are i386 and riscv. If riscv has given the command
> different semantics to i386 that would be unfortunate.
>
> "info tlb" is implemented by i386, m68k, nios2, ppc, sh4,
> sparc, xtensa.
>
> It's not clear to me that "info mem" is all that useful -- you
> can figure out the same info from "info tlb".

Yes. But I feel "info mem" is more a suitable name than "info tlb"
unless we are really printing the TLB.

Regards,
Bin

