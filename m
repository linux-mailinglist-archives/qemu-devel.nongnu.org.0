Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1D22CEC86
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 11:55:08 +0100 (CET)
Received: from localhost ([::1]:59460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kl8jz-0003We-63
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 05:55:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kl8i4-0002m5-A0; Fri, 04 Dec 2020 05:53:08 -0500
Received: from mail-yb1-xb42.google.com ([2607:f8b0:4864:20::b42]:36214)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kl8i2-0005Yj-My; Fri, 04 Dec 2020 05:53:08 -0500
Received: by mail-yb1-xb42.google.com with SMTP id l14so4999842ybq.3;
 Fri, 04 Dec 2020 02:53:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fDo+S6W/5Dmtf1ttisve7aeQ8ymSs6WjU7ZvmnH+JHE=;
 b=aLGMHJice2YtutsfP7nV9JEww7r2Kh6yZ6A4ekGCBxpRAG7vNg04dsrER8U6jXrlrw
 S6v9qCqQwoknBlswQae4OG6xiQgI2TRZ5g5B6Mi66PZQwwCezVFfOgTit/FLuXqih/Zs
 Q2K+aIbSGU0S73benTdJdEPqa692/Xh49HJcWxkZNegXrgwsAPIwerPtPXd/1hpYSHc4
 UkAHUfU3xeBZIBc0gOqeSo19tri8szZxGYPjeSur630+cA0A2hs9Hp5EBvRMGUebvtRC
 7Pq5o/WuJeW++7/Nkwf0N6+/v4MSMM/CyJC9fv/LK94qWeLo72Lf1rCb0RffVfv5Or33
 jvKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fDo+S6W/5Dmtf1ttisve7aeQ8ymSs6WjU7ZvmnH+JHE=;
 b=fTk8f5R/UZBGxfeMlOd6SdlyV8B37+m3+LVGU139u40U2BQjqZOq20DF9pBc5+F37o
 O71TZ4FTi8tjZZ+MNCPPGu/sFuOCxHI48Bv++vaR1mLxXvjSmPs/XKUcn/vHCLnsyiqA
 JWYjAnJoaXbGJW2KM1AN1RdbVYyXzpOUyFEm9LOQTGP+6plR39SX+10r139oLrRYS10v
 hdjeEeDwmyBEfC1niw8QLvuF2GYLl+ySiPQ5aJTIo7ciTYGkILqOs0s9cDyP9d3fLD4Y
 9gVZ532dM81GGDmKqALVTHpafqUgQGn+ZqplmDx0DLy1GA2KonMgKKF3Tdq1z071Tmha
 058g==
X-Gm-Message-State: AOAM5315j60B5KkBWfkB+FAh7g9vPzXzhPhRYkyWEUmhjVoJyvw85lla
 unZODR+gglDL1QrnXguLTFIZ2lio0iGCg37geuM=
X-Google-Smtp-Source: ABdhPJxqf6wUcu/8+T+/J/1scthb3Com9P0MxM4n16sVNzGKBPuOpIaZYDoqATyWogAzz8SK2wxpAGc20iMkSJ/aZS4=
X-Received: by 2002:a25:bc91:: with SMTP id e17mr4729493ybk.332.1607079181626; 
 Fri, 04 Dec 2020 02:53:01 -0800 (PST)
MIME-Version: 1.0
References: <1606704602-59435-1-git-send-email-bmeng.cn@gmail.com>
 <CAKmqyKOWRENRYr0iz-bX7gGmksQdtTc_uMy_iY1YNvvRFr-PLg@mail.gmail.com>
 <20201203083759.GA2661@fralle-msi>
 <CAEUhbmVkF9W12o04JnYofLLWwTfnNBJDnC+_8iZvdgnyonMYag@mail.gmail.com>
 <20201204104652.GA16865@fralle-dell>
In-Reply-To: <20201204104652.GA16865@fralle-dell>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 4 Dec 2020 18:52:50 +0800
Message-ID: <CAEUhbmWAFf2sJLfb4i5JxhQgT88cVf54AzREuGrn+0C17ShxoQ@mail.gmail.com>
Subject: Re: [PATCH] hw/block: m25p80: Fix fast read for SST flashes
To: Francisco Iglesias <frasse.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b42;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb42.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 Qemu-block <qemu-block@nongnu.org>, Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Alistair Francis <alistair23@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Francisco,

On Fri, Dec 4, 2020 at 6:46 PM Francisco Iglesias
<frasse.iglesias@gmail.com> wrote:
>
> Hello Bin,
>
> On [2020 Dec 04] Fri 15:52:12, Bin Meng wrote:
> > Hi Francisco,
> >
> > On Thu, Dec 3, 2020 at 4:38 PM Francisco Iglesias
> > <frasse.iglesias@gmail.com> wrote:
> > >
> > > Hi Bin and Alistair,
> > >
> > > On [2020 Dec 02] Wed 11:40:11, Alistair Francis wrote:
> > > > On Sun, Nov 29, 2020 at 6:55 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> > > > >
> > > > > From: Bin Meng <bin.meng@windriver.com>
> > > > >
> > > > > SST flashes require a dummy byte after the address bits.
> > > > >
> > > > > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > > >
> > > > I couldn't find a datasheet that says this... But the actual code
> > > > change looks fine, so:
> > > >
> > > > Acked-by: Alistair Francis <alistair.francis@wdc.com>
> > > >
> > > > Alistair
> > > >
> > > > > ---
> > > > >
> > > > >  hw/block/m25p80.c | 3 +++
> > > > >  1 file changed, 3 insertions(+)
> > > > >
> > > > > diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> > > > > index 483925f..9b36762 100644
> > > > > --- a/hw/block/m25p80.c
> > > > > +++ b/hw/block/m25p80.c
> > > > > @@ -825,6 +825,9 @@ static void decode_fast_read_cmd(Flash *s)
> > > > >      s->needed_bytes = get_addr_length(s);
> > > > >      switch (get_man(s)) {
> > > > >      /* Dummy cycles - modeled with bytes writes instead of bits */
> > > > > +    case MAN_SST:
> > > > > +        s->needed_bytes += 1;
> > >
> > > 1 dummy clk cycle is modelled as 1 byte write (see the comment above), so 1
> > > dummy byte (8 dummy clk cycles) will need +8 above.
> >
> > I think you were confused by the WINBOND codes. The comments are
> > correct. It is modeled with bytes instead of bits, so we should +=1.
>
> What the comment says is (perhaps not superclear) that 1 dummy clock cycle
> is modeled as one 1 byte write into the flash (meaining that 8 byte writes
> are needed for 1 dummy byte). Perhaps it is easier to understand
> looking into how the controllers issue the command towards the flash model
> (for example the xilinx_spips), the start of the FAST_READ cmd is issued
> as writing the following into the flash: 1 byte (cmd), 3 bytes (address),
> 8 bytes (8 dummy cycles -> 1 dummy byte).
>

My interpretation of the comments are opposite: one cycle is a bit,
but we are not using bits, instead we are using bytes.

Testing shows that +=1 is the correct way with the imx_spi controller,
and with my SiFive SPI model in my local tree (not upstreamed yet)

Regards,
Bin

