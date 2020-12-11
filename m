Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 292D52D7998
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 16:43:47 +0100 (CET)
Received: from localhost ([::1]:58564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knka9-0006gC-Tv
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 10:43:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1knkMO-00023v-6w; Fri, 11 Dec 2020 10:29:32 -0500
Received: from mail-yb1-xb42.google.com ([2607:f8b0:4864:20::b42]:38083)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1knkMM-0007Y0-6m; Fri, 11 Dec 2020 10:29:31 -0500
Received: by mail-yb1-xb42.google.com with SMTP id a16so8374112ybh.5;
 Fri, 11 Dec 2020 07:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BWIOJyZiuRL6AYOeLOFf8I3ru4bHMbvDaXF9S1vpHBo=;
 b=X0uYjjLqq+dhGB1/04RtWIufDtGFOOGJR/JK7I4xJR4O5UEJGfyaQS+YhxGi6vy8Wi
 Ax3Xhasztb9I090e/ppWhnoOGaBPG92UOczhG7OX5GYQTNp+HPo5mWHiFnWpaifU0ywA
 ud9ygsAlxYRdtJ7Lc4lrG7AN8qL+ehtodiqTnwK6qr+lHwmu1MtjqMJgZXKFkx3GK8h+
 ijlCvCQ3gnIWE8N03ZRXeryw1YriD3nbnhz/ma1BijEiWCuECVr3bwta5TXGGv8mMyeY
 iChGkBOSoKKqrlYnGmuUZttR6Nln1XmSrSsXJXdDlBn3SnZqknjzv9vHPBHI1khMZmHM
 a7ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BWIOJyZiuRL6AYOeLOFf8I3ru4bHMbvDaXF9S1vpHBo=;
 b=k/VWpfdo34MD+AgjIMy6YiGEzX8HemgQHywN8DIuRP5FvXA8D41XYqGcYb+bCcEP8R
 ZtOUwSukOxJpc1UPLnMfux9MQMH0+UV+CHMvRwjEKqgbEZXQzCw0nbmhG2M97yqtvanY
 /tRxSAnY9wXBmvfEy3KX3SX2A5qU6DUIYiTYj2TBRiutb1NBfGsTSVK+JiRozj58VRRs
 F+vXAnZ3hp4BbLhlo0uL77WWD0nPYqPK7yAqNyMATN4U84UFRRKqgFTkXup++UcZRTue
 HKUYJYlcijEijuUidYaauvob8q3F8G7YHQwDHD2Ng0pBhYMmULZBLV96HvQoS8U/smyw
 ilNQ==
X-Gm-Message-State: AOAM530bx8bFUavDH4qQIRn5ZdLd1/VwI2McSw84kz+Qvzctz2Mx5OC3
 qItHEtyJctTz4yxvk7OTAnYO7OEJlBAKy7B4Cis=
X-Google-Smtp-Source: ABdhPJy8/5XfrhJQvAt87mrOAgFiV7NAlVL35lNUN3qaXC/GRpWzl/yS17hhH0yMXYjNWSaUw+gqY6GbnQ84fgni9tY=
X-Received: by 2002:a5b:2c6:: with SMTP id h6mr19344366ybp.306.1607700567609; 
 Fri, 11 Dec 2020 07:29:27 -0800 (PST)
MIME-Version: 1.0
References: <1606704602-59435-1-git-send-email-bmeng.cn@gmail.com>
 <CAKmqyKOWRENRYr0iz-bX7gGmksQdtTc_uMy_iY1YNvvRFr-PLg@mail.gmail.com>
 <20201203083759.GA2661@fralle-msi>
 <CAEUhbmVkF9W12o04JnYofLLWwTfnNBJDnC+_8iZvdgnyonMYag@mail.gmail.com>
 <20201204104652.GA16865@fralle-dell>
 <CAEUhbmWAFf2sJLfb4i5JxhQgT88cVf54AzREuGrn+0C17ShxoQ@mail.gmail.com>
 <20201204112847.GA16964@fralle-dell>
 <CAEUhbmVo268ks+t1tLBcNLFYs4DAM6hexhYzXx=2B+YU31kR3w@mail.gmail.com>
 <20201211151641.GA12361@fralle-msi>
In-Reply-To: <20201211151641.GA12361@fralle-msi>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 11 Dec 2020 23:29:16 +0800
Message-ID: <CAEUhbmXMfETY2LOkDn3x8a9ia74+hQgkEh4jbC8yKamP+qBFJw@mail.gmail.com>
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

On Fri, Dec 11, 2020 at 11:16 PM Francisco Iglesias
<frasse.iglesias@gmail.com> wrote:
>
> Hello Bin,
>
> On [2020 Dec 11] Fri 14:07:21, Bin Meng wrote:
> > Hi Francisco,
> >
> > On Fri, Dec 4, 2020 at 7:28 PM Francisco Iglesias
> > <frasse.iglesias@gmail.com> wrote:
> > >
> > > Hello Bin,
> > >
> > > On [2020 Dec 04] Fri 18:52:50, Bin Meng wrote:
> > > > Hi Francisco,
> > > >
> > > > On Fri, Dec 4, 2020 at 6:46 PM Francisco Iglesias
> > > > <frasse.iglesias@gmail.com> wrote:
> > > > >
> > > > > Hello Bin,
> > > > >
> > > > > On [2020 Dec 04] Fri 15:52:12, Bin Meng wrote:
> > > > > > Hi Francisco,
> > > > > >
> > > > > > On Thu, Dec 3, 2020 at 4:38 PM Francisco Iglesias
> > > > > > <frasse.iglesias@gmail.com> wrote:
> > > > > > >
> > > > > > > Hi Bin and Alistair,
> > > > > > >
> > > > > > > On [2020 Dec 02] Wed 11:40:11, Alistair Francis wrote:
> > > > > > > > On Sun, Nov 29, 2020 at 6:55 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> > > > > > > > >
> > > > > > > > > From: Bin Meng <bin.meng@windriver.com>
> > > > > > > > >
> > > > > > > > > SST flashes require a dummy byte after the address bits.
> > > > > > > > >
> > > > > > > > > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > > > > > > >
> > > > > > > > I couldn't find a datasheet that says this... But the actual code
> > > > > > > > change looks fine, so:
> > > > > > > >
> > > > > > > > Acked-by: Alistair Francis <alistair.francis@wdc.com>
> > > > > > > >
> > > > > > > > Alistair
> > > > > > > >
> > > > > > > > > ---
> > > > > > > > >
> > > > > > > > >  hw/block/m25p80.c | 3 +++
> > > > > > > > >  1 file changed, 3 insertions(+)
> > > > > > > > >
> > > > > > > > > diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> > > > > > > > > index 483925f..9b36762 100644
> > > > > > > > > --- a/hw/block/m25p80.c
> > > > > > > > > +++ b/hw/block/m25p80.c
> > > > > > > > > @@ -825,6 +825,9 @@ static void decode_fast_read_cmd(Flash *s)
> > > > > > > > >      s->needed_bytes = get_addr_length(s);
> > > > > > > > >      switch (get_man(s)) {
> > > > > > > > >      /* Dummy cycles - modeled with bytes writes instead of bits */
> > > > > > > > > +    case MAN_SST:
> > > > > > > > > +        s->needed_bytes += 1;
> > > > > > >
> > > > > > > 1 dummy clk cycle is modelled as 1 byte write (see the comment above), so 1
> > > > > > > dummy byte (8 dummy clk cycles) will need +8 above.
> > > > > >
> > > > > > I think you were confused by the WINBOND codes. The comments are
> > > > > > correct. It is modeled with bytes instead of bits, so we should +=1.
> > > > >
> > > > > What the comment says is (perhaps not superclear) that 1 dummy clock cycle
> > > > > is modeled as one 1 byte write into the flash (meaining that 8 byte writes
> > > > > are needed for 1 dummy byte). Perhaps it is easier to understand
> > > > > looking into how the controllers issue the command towards the flash model
> > > > > (for example the xilinx_spips), the start of the FAST_READ cmd is issued
> > > > > as writing the following into the flash: 1 byte (cmd), 3 bytes (address),
> > > > > 8 bytes (8 dummy cycles -> 1 dummy byte).
> > > > >
> > > >
> > > > My interpretation of the comments are opposite: one cycle is a bit,
> > > > but we are not using bits, instead we are using bytes.
> > >
> > > Yes, the mentioning of 'bits' in the comment makes it not very clear at first read.
> > > Maybe just bellow would have been better:
> > >
> > > /* Dummy clock cycles - modeled with bytes writes */
> > >
> > > >
> > > > Testing shows that +=1 is the correct way with the imx_spi controller,
> > > > and with my SiFive SPI model in my local tree (not upstreamed yet)
> > >
> > > Perhaps an option could be to look into how the aspeed_smc, xilinx_spips or the
> > > npcm7xx_fiu generate dummy clock cycles and see if a similar solution to one of
> > > those could work aswell for the imx_spi?
> > >
> >
> > Thanks for pointing this out. So there is some inconsistency among
> > different SPI controller modeling.
>
> I'm not sure I understand you correctly but the controllers supporting
> commands with dummy clock cycles can only do it following the modeled
> approach, so I would rather say it is pretty consistent across the
> controllers (not all controllers support these commands though).

I mean there are 2 approaches to emulate the dummy cycles for
different SPI controller models, yet we only have one m25p80 flash
model to work with both of them. Some controllers may choose 1 byte to
emulate 1 dummy clock cycle, but some others choose 1 bit to emulate 1
dummy cycle. This is inconsistent.

>
> >
> > Or maybe fixing aspeed_smc, xilinx_spips and npcm7xx_fiu to work like
> > imx_spi?
>
> For me I would say no to above (it makes more sense to let new controllers
> implement the currently modeled approach).

Yes, we can certainly make them consistent. But the question is which
one is the correct one? I tried to search in the doc but in vain.

>
> > Which one is the expected behavior for dummy cycles?
>
> Dummy clock cycles are modeled as 1 byte written to the flash per dummy clock
> cycle (expected behavior).
>

Like I mentioned before, 8 bytes to emulate 8 dummy clock cycles does
not work with current imx_spi model.

Regards,
Bin

