Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 465583F040A
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 14:55:55 +0200 (CEST)
Received: from localhost ([::1]:45156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGL6o-0001Ie-3N
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 08:55:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGL5k-0000IX-9q
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 08:54:48 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:36586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGL5h-0007em-Pn
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 08:54:47 -0400
Received: by mail-ej1-x636.google.com with SMTP id bt14so4863857ejb.3
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 05:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jq5ybZD0i+/isF+Gs7b1oVCJMwgUOgDDx289/3lzC7U=;
 b=idVMcNDIt275GkS5rFlseSz+0GNuADsDskMGlXEsPcSgrk8jruuoIIsh789RoWAR8P
 0lnxanV7iCY+yaka1TFBMVIUza/NqnzrxLf4zlxKASIxdEXcDD5yLuEnvuCiKPTBpi8L
 FgfbUI6lQDXyaNn0wNW+DV0u6ANA16raaXQdpCIDRM7o1VkS2piek9XQBHi5EOT+wALO
 YbIVfnqun/mk0VfeLgfAggLhZ/vjsUVubGY3P8ZC4yfL+Weg+Ip2VWzVTX+MTgWDbcCT
 +B+gqPFKKdAHC/rRH+BAsbOyOwLVVDw5NjjQUVDEHpUJR+/piQ9wOOA0PJXhVYi2SFSB
 oFfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jq5ybZD0i+/isF+Gs7b1oVCJMwgUOgDDx289/3lzC7U=;
 b=ERDyGi//ySAKVGEXGv9YvoIb86fmEERnX5AI079cIb2iEsSDqmw3FDzr1HvI07srxI
 iHItiphC2klQx6sYwEG8gzmjWYM7nBb/q4kBMMIYg0P95e0IjEuyxOD5UAsLENe1ydSu
 GHePUKF+44igoafiZ//Q9IvC9l3XsE7+HE5Ao0v0HRsNAbJkWuSBXN6/9KU2raT6YOq0
 wGOVyYIY2BFB3Env4Eh4Nvl+kwoqNPIxrd2QRHR0ejipGzHiK5YSrZUoxcSmscU88e5o
 UiJ293yu16WJa2ta3LuJTytZl9t5Jo5m4mY3PRzSdy1+PlLX7OhKstLCeSpkfaaEfkrG
 t/kg==
X-Gm-Message-State: AOAM530DXzR9YrtK7P+E9OGz5Z7OijLUa0HlRwaTxos1qhfkZZgD3A0M
 yBit7BSMvmlwLBU73t9XZwdHpL2E0y74bR3O1/QDHA==
X-Google-Smtp-Source: ABdhPJylwV5tk5Tn+t5Qu2eMnjI8GuHGCFJ8JnaW7thXwZjqOXexHjFHNZlKBZArLerYSi/enltecgIHO5NH6BuzMjc=
X-Received: by 2002:a17:906:3bc3:: with SMTP id
 v3mr9660656ejf.482.1629291282992; 
 Wed, 18 Aug 2021 05:54:42 -0700 (PDT)
MIME-Version: 1.0
References: <162928715931.357603.15628842472925815718.stgit@pc-System-Product-Name>
 <162928727089.357603.8471789223247950118.stgit@pc-System-Product-Name>
 <CAEUhbmXwr0wvabJ8e2=VBbf6OgFehuOGH78XZGBaukDgOfPiQA@mail.gmail.com>
In-Reply-To: <CAEUhbmXwr0wvabJ8e2=VBbf6OgFehuOGH78XZGBaukDgOfPiQA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 18 Aug 2021 13:53:57 +0100
Message-ID: <CAFEAcA9xucqeJK5t-He8p8sMGA4dStCHy_y+ZxNtuF1EcHx50Q@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] arm/monitor: Add support for 'info tlb' command
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Wed, 18 Aug 2021 at 13:00, Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Wed, Aug 18, 2021 at 7:48 PM NDNF <arkaisp2021@gmail.com> wrote:
> >
> > This adds hmp 'info tlb' command support for the arm platform.
> > The limitation is that this only implements a page walker for
> > ARMv8-A AArch64 Long Descriptor format, 32bit addressing is
> > not supported yet.
> >
> > Signed-off-by: Changbin Du <changbin.du@gmail.com>
> > Signed-off-by: Ivanov Arkady <arkaisp2021@gmail.com>
> > ---
> >  hmp-commands-info.hx |    3 +
> >  target/arm/monitor.c |  170 ++++++++++++++++++++++++++++++++++++++++++++++++++
> >  2 files changed, 172 insertions(+), 1 deletion(-)
> >
>
> I believe this is not TLB on ARM, but PTE?
>
> RISC-V implemented a "info mem" for page table walk.

We call our "give page table walk" monitor command "info tlb"
for some reason (probably historical). From the docs:
https://qemu-project.gitlab.io/qemu/system/monitor.html
  info tlb
      Show virtual to physical memory mappings
  info mem
      Show the active virtual memory mappings.

Looking at x86's output, "info tlb" gives lines like this:

ffffffffc04f6000: 00000000b2576000 -G-DA----
ffffffffc04f7000: 00000000b2579000 -G-DA----
ffffffffc04f8000: 00000000bac74000 XG-DA----
ffffffffc04f9000: 00000000b258b000 XG-DA----
ffffffffc04fa000: 00000000b248b000 XG-DA---W
ffffffffc04fb000: 00000000b2431000 XG-DA---W
ffffffffc0502000: 00000000bb69c000 -G-DA----
ffffffffc0503000: 00000000b27d3000 XG-DA----

which is a dump of the page table, with one line per page,
giving the vaddr, the physaddr and associated flag information.

"info mem" gives lines like this:

ffffffffc04f6000-ffffffffc04fa000 0000000000004000 -r-
ffffffffc04fa000-ffffffffc04fc000 0000000000002000 -rw
ffffffffc0502000-ffffffffc0504000 0000000000002000 -r-

which just give "this range of virtual addresses of this
length have these permissions". You can see that it
coalesces multiple adjacent pages with the same permissions
into a single line.

The only architectures which implement "info mem"
are i386 and riscv. If riscv has given the command
different semantics to i386 that would be unfortunate.

"info tlb" is implemented by i386, m68k, nios2, ppc, sh4,
sparc, xtensa.

It's not clear to me that "info mem" is all that useful -- you
can figure out the same info from "info tlb".

-- PMM

