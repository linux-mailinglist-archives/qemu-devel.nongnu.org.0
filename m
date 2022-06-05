Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BCEB53D922
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Jun 2022 03:59:29 +0200 (CEST)
Received: from localhost ([::1]:60552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nxfY7-0005Ba-Tm
	for lists+qemu-devel@lfdr.de; Sat, 04 Jun 2022 21:59:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nxfX2-0004De-EB
 for qemu-devel@nongnu.org; Sat, 04 Jun 2022 21:58:20 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:45816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nxfX0-0000u1-Fm
 for qemu-devel@nongnu.org; Sat, 04 Jun 2022 21:58:20 -0400
Received: by mail-pg1-x52f.google.com with SMTP id 7so9398909pga.12
 for <qemu-devel@nongnu.org>; Sat, 04 Jun 2022 18:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=FH7hgVFGKN1ueArYEdTBjcnxNno+hsrovt2TJHN6hd0=;
 b=G0lqqX2IsH32MAQCUdcPSDhj1/u/MI2nPmeuN5WOj4X/RhGtIgOr2k4Dcl8vih0475
 yuMyc/gbJUi63zCDHG8j3GgsXUlpiYBRUoJjYuBSVA5CHRAgMdb+wdal6P9/7/yvK3d/
 6PKGASjgEiIB+8yC9HGYMwZW8ckPFg2zHPHX9rhwP0xwBqZQcFqCdiihP8oP2OGyfqP5
 xg/0LhS9AAPQrQ5ZF746ejsdUJOUNhCqvvjkKlXvUCr88VGOx/v1FYVEfLYr/a9fTJgw
 dlCTYGxyVL/DLkYLH2mvZD6Vk1mWgyGLYEKj3ks2Y1M284LYsQV5lcWa1CSr7JdbCNWW
 0gTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FH7hgVFGKN1ueArYEdTBjcnxNno+hsrovt2TJHN6hd0=;
 b=PmNa38VzczTcYcV3rYrAkkCpDc9EsglsfkLMGt0ePAyhyLsnKsxjJUJKmcZrjBMuKV
 k4hkZq3Blgbkep8rE6SgqHtwPT4lSLy6YWcmZcuji1OuKNp30UC9sTsA3wOvqg1VF+Vx
 tKfNeeOmLJ+ebul6s6B78X/6q3B4zf93JTQV1fsmSYO+Ac3ndU5UbVPYcw17jXEatSqc
 s4Ycn/YLgplR5AoTU2Rehq4jZZY/85dK5swZm6z65u1mLaN7wbPx94F9E2RQuL88vaog
 bb5PirQ/cgYiJWGrCEZwZkJP5glDGt7LXtRyeWAnUyIGjzTG/80n32IyF0OHwCkdLf7m
 v86g==
X-Gm-Message-State: AOAM532SApB2hgnSNwDzV9LGArWG1XBQ1irLi1EeKrt60koM2nCgAVpr
 LTxYtMgAUdwlOBOqcKNO1oM=
X-Google-Smtp-Source: ABdhPJwCcdMFlABqCFWWAa53DQNUv52jnefGm+EgZEADisGj8Li1ABFaPnaJbAYLu6TJ66DwazXS0g==
X-Received: by 2002:a63:e905:0:b0:3fa:ec8c:9013 with SMTP id
 i5-20020a63e905000000b003faec8c9013mr14923577pgh.599.1654394296856; 
 Sat, 04 Jun 2022 18:58:16 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id
 q68-20020a632a47000000b003fcc510d789sm6671095pgq.29.2022.06.04.18.58.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jun 2022 18:58:15 -0700 (PDT)
Date: Sun, 5 Jun 2022 10:58:14 +0900
From: Stafford Horne <shorne@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Joel Stanley <joel@jms.id.au>, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Openrisc <openrisc@lists.librecores.org>,
 QEMU Development <qemu-devel@nongnu.org>
Subject: Re: [RFC PATCH 3/3] hw/openrisc: Add the OpenRISC virtual machine
Message-ID: <YpwNtowUTxRbh2Uq@antec>
References: <20220527172731.1742837-1-shorne@gmail.com>
 <20220527172731.1742837-4-shorne@gmail.com>
 <CACPK8XexaTREY3Y-jp8urTAE+UmQWgygFx1MAss9KcJw5tGMtw@mail.gmail.com>
 <CAMuHMdWF_OwTMZZ=joRsnOAuB5UuKjACt3Ku4-o0--fR6xqQbQ@mail.gmail.com>
 <YpkWllpTFzb2HHY5@antec>
 <CAMuHMdXBtihLpdOYn7nj_fH2g08nDUiUd-_zCZ_EdEyvw1UxWA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXBtihLpdOYn7nj_fH2g08nDUiUd-_zCZ_EdEyvw1UxWA@mail.gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=shorne@gmail.com; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Fri, Jun 03, 2022 at 09:05:09AM +0200, Geert Uytterhoeven wrote:
> Hi Stafford,
> 
> On Thu, Jun 2, 2022 at 9:59 PM Stafford Horne <shorne@gmail.com> wrote:
> > On Thu, Jun 02, 2022 at 09:08:52PM +0200, Geert Uytterhoeven wrote:
> > > On Thu, Jun 2, 2022 at 1:42 PM Joel Stanley <joel@jms.id.au> wrote:
> > > > On Fri, 27 May 2022 at 17:27, Stafford Horne <shorne@gmail.com> wrote:
> > > > > This patch add the OpenRISC virtual machine 'virt' for OpenRISC.  This
> > > > > platform allows for a convenient CI platform for toolchain, software
> > > > > ports and the OpenRISC linux kernel port.
> > > > >
> > > > > Much of this has been sourced from the m68k and riscv virt platforms.
> > >
> > > > I enabled the options:
> > > >
> > > > CONFIG_RTC_CLASS=y
> > > > # CONFIG_RTC_SYSTOHC is not set
> > > > # CONFIG_RTC_NVMEM is not set
> > > > CONFIG_RTC_DRV_GOLDFISH=y
> > > >
> > > > But it didn't work. It seems the goldfish rtc model doesn't handle a
> > > > big endian guest running on my little endian host.
> > > >
> > > > Doing this fixes it:
> > > >
> > > > -    .endianness = DEVICE_NATIVE_ENDIAN,
> > > > +    .endianness = DEVICE_HOST_ENDIAN,
> > > >
> > > > [    0.190000] goldfish_rtc 96005000.rtc: registered as rtc0
> > > > [    0.190000] goldfish_rtc 96005000.rtc: setting system clock to
> > > > 2022-06-02T11:16:04 UTC (1654168564)
> > > >
> > > > But literally no other model in the tree does this, so I suspect it's
> > > > not the right fix.
> > >
> > > Goldfish devices are supposed to be little endian.
> > > Unfortunately m68k got this wrong, cfr.
> > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=2e2ac4a3327479f7e2744cdd88a5c823f2057bad
> > > Please don't duplicate this bad behavior for new architectures
> >
> > Thanks for the pointer, I just wired in the goldfish RTC because I wanted to
> > play with it.  I was not attached to it. I can either remove it our find another
> > RTC.
> 
> Sorry for being too unclear: the mistake was not to use the Goldfish
> RTC, but to make its register accesses big-endian.
> Using Goldfish devices as little-endian devices should be fine.

OK, then I would think this patch would be needed on Goldfish.  I tested this
out and it seems to work:

Patch:

diff --git a/hw/rtc/goldfish_rtc.c b/hw/rtc/goldfish_rtc.c
index 35e493be31..f1dc5af297 100644
--- a/hw/rtc/goldfish_rtc.c
+++ b/hw/rtc/goldfish_rtc.c
@@ -219,7 +219,7 @@ static int goldfish_rtc_post_load(void *opaque, int
version_id)
 static const MemoryRegionOps goldfish_rtc_ops = {
     .read = goldfish_rtc_read,
     .write = goldfish_rtc_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_LITTLE_ENDIAN,
     .valid = {
         .min_access_size = 4,
         .max_access_size = 4

Boot Log:

    io scheduler mq-deadline registered
    io scheduler kyber registered
    Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
    90000000.serial: ttyS0 at MMIO 0x90000000 (irq = 2, base_baud = 1250000) is a 16550A
    printk: console [ttyS0] enabled
    loop: module loaded
    virtio_blk virtio1: [vda] 32768 512-byte logical blocks (16.8 MB/16.0 MiB)
    Freeing initrd memory: 1696K
   *goldfish_rtc 96005000.rtc: registered as rtc0
   *goldfish_rtc 96005000.rtc: setting system clock to 2022-06-05T01:49:57 UTC (1654393797)
    NET: Registered PF_PACKET protocol family
    random: fast init done

-Stafford

