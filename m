Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0FA2D8543
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Dec 2020 09:19:23 +0100 (CET)
Received: from localhost ([::1]:39592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ko07d-0005rq-S7
	for lists+qemu-devel@lfdr.de; Sat, 12 Dec 2020 03:19:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ko05b-0004jF-KT; Sat, 12 Dec 2020 03:17:15 -0500
Received: from mail-yb1-xb42.google.com ([2607:f8b0:4864:20::b42]:44599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ko05Z-00064X-Dj; Sat, 12 Dec 2020 03:17:15 -0500
Received: by mail-yb1-xb42.google.com with SMTP id x2so10337080ybt.11;
 Sat, 12 Dec 2020 00:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uWS06IQBJH9sGI6vTVFDkgRY9QaUcKlREHrV18Z7EJk=;
 b=Ns/aXWerKmcYU2k/BNjGd3F727nJGjsZs/Q0el1hWz9jjSxYMDR0Y1LMxf+QdT1Duw
 9U9gys6l/BVDtzCqrg4otWtO99ylF9TiswNL71u6CWzWmVL2pV6aqbbzyFe2UMium7mo
 UVpGorKvKqsSyZxV+eZwG/M9sQY8mmrHxpFxSwlvH/kCK4yLY3OCjWt21q9SPilm1art
 PE6d2r9ULBB9d4vlhK8B1xY/yptmzT9XRQRMxg9HfE13SZPDS1xmlSvptcpdtdnMqP5l
 D8MtuK9FyQ7zvaL3e9JjrYlCNDts4zCYiFFCnnyhYEZbpLGqcztGeukqR6twEZuBJyzZ
 JX+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uWS06IQBJH9sGI6vTVFDkgRY9QaUcKlREHrV18Z7EJk=;
 b=cpEYVmpp4snm3b+dSQAkGxaj/9ezZvNvALsV57rf3WxXVA4CiaeE0NZTi+qMcw8RP7
 rKMiNCmhiA2UX7MMSGraD5WePA1aZl6NVAQT45B1zeUg15ElFpJC1IrcJoItW1/cGCbN
 USPuv2oJjIBz1Na8gClTUZMJtY499xEpSToQhGik0QGsTcJ1hYz7eKV84LxyzoOCvQd+
 LWUTZmo/f8kdIbB1H1HopUyLMaCGvf7Zn9zRxLFMEdubTXrJw2SWHOuFkc+OqI+jzd3q
 iDf38vdX3vQGmRBffMlnABhTy79K8OEJijpVtkZT9n2/g1ftGtWNbAaipQjYmZU04gfk
 0GTA==
X-Gm-Message-State: AOAM531A1x0wqi5h5D0YaQufd1YFzG2DFapB/JQmL7ggecpw4ROsLMBo
 3plNYDKiVVSCjisBhyy869wj2UWmw+sBC9PRH8o=
X-Google-Smtp-Source: ABdhPJzGiqN2gMPDj0FpVOQv1LK543KXt8Oo+sm/ZP4sKdvQKGPZmahI8XQ/TKfXHeCMIJTwH/j8/71rXT7DUV4vWck=
X-Received: by 2002:a25:be87:: with SMTP id i7mr23504286ybk.332.1607761031490; 
 Sat, 12 Dec 2020 00:17:11 -0800 (PST)
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
 <CAEUhbmXMfETY2LOkDn3x8a9ia74+hQgkEh4jbC8yKamP+qBFJw@mail.gmail.com>
 <20201211161146.GB12361@fralle-msi>
In-Reply-To: <20201211161146.GB12361@fralle-msi>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sat, 12 Dec 2020 16:16:59 +0800
Message-ID: <CAEUhbmXsZtGnMrw5gNJM=Gvqg3GQFejsfsggbTOpY+6eYLiBAg@mail.gmail.com>
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

On Sat, Dec 12, 2020 at 12:11 AM Francisco Iglesias
<frasse.iglesias@gmail.com> wrote:
>
> Hello Bin,
>
> On [2020 Dec 11] Fri 23:29:16, Bin Meng wrote:
> > Hi Francisco,
> >
> > On Fri, Dec 11, 2020 at 11:16 PM Francisco Iglesias
> > <frasse.iglesias@gmail.com> wrote:
> > >
> > > Hello Bin,
> > >
> > > On [2020 Dec 11] Fri 14:07:21, Bin Meng wrote:
> > > > Hi Francisco,
> > > >
> > > > On Fri, Dec 4, 2020 at 7:28 PM Francisco Iglesias
> > > > <frasse.iglesias@gmail.com> wrote:
> > > > >
> > > > > Hello Bin,
> > > > >
> > > > > On [2020 Dec 04] Fri 18:52:50, Bin Meng wrote:
> > > > > > Hi Francisco,
> > > > > >
> > > > > > On Fri, Dec 4, 2020 at 6:46 PM Francisco Iglesias
> > > > > > <frasse.iglesias@gmail.com> wrote:
> > > > > > >
> > > > > > > Hello Bin,
> > > > > > >
> > > > > > > On [2020 Dec 04] Fri 15:52:12, Bin Meng wrote:
> > > > > > > > Hi Francisco,
> > > > > > > >
> > > > > > > > On Thu, Dec 3, 2020 at 4:38 PM Francisco Iglesias
> > > > > > > > <frasse.iglesias@gmail.com> wrote:
> > > > > > > > >
> > > > > > > > > Hi Bin and Alistair,
> > > > > > > > >
> > > > > > > > > On [2020 Dec 02] Wed 11:40:11, Alistair Francis wrote:
> > > > > > > > > > On Sun, Nov 29, 2020 at 6:55 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> > > > > > > > > > >
> > > > > > > > > > > From: Bin Meng <bin.meng@windriver.com>
> > > > > > > > > > >
> > > > > > > > > > > SST flashes require a dummy byte after the address bits.
> > > > > > > > > > >
> > > > > > > > > > > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > > > > > > > > >
> > > > > > > > > > I couldn't find a datasheet that says this... But the actual code
> > > > > > > > > > change looks fine, so:
> > > > > > > > > >
> > > > > > > > > > Acked-by: Alistair Francis <alistair.francis@wdc.com>
> > > > > > > > > >
> > > > > > > > > > Alistair
> > > > > > > > > >
> > > > > > > > > > > ---
> > > > > > > > > > >
> > > > > > > > > > >  hw/block/m25p80.c | 3 +++
> > > > > > > > > > >  1 file changed, 3 insertions(+)
> > > > > > > > > > >
> > > > > > > > > > > diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> > > > > > > > > > > index 483925f..9b36762 100644
> > > > > > > > > > > --- a/hw/block/m25p80.c
> > > > > > > > > > > +++ b/hw/block/m25p80.c
> > > > > > > > > > > @@ -825,6 +825,9 @@ static void decode_fast_read_cmd(Flash *s)
> > > > > > > > > > >      s->needed_bytes = get_addr_length(s);
> > > > > > > > > > >      switch (get_man(s)) {
> > > > > > > > > > >      /* Dummy cycles - modeled with bytes writes instead of bits */
> > > > > > > > > > > +    case MAN_SST:
> > > > > > > > > > > +        s->needed_bytes += 1;
> > > > > > > > >
> > > > > > > > > 1 dummy clk cycle is modelled as 1 byte write (see the comment above), so 1
> > > > > > > > > dummy byte (8 dummy clk cycles) will need +8 above.
> > > > > > > >
> > > > > > > > I think you were confused by the WINBOND codes. The comments are
> > > > > > > > correct. It is modeled with bytes instead of bits, so we should +=1.
> > > > > > >
> > > > > > > What the comment says is (perhaps not superclear) that 1 dummy clock cycle
> > > > > > > is modeled as one 1 byte write into the flash (meaining that 8 byte writes
> > > > > > > are needed for 1 dummy byte). Perhaps it is easier to understand
> > > > > > > looking into how the controllers issue the command towards the flash model
> > > > > > > (for example the xilinx_spips), the start of the FAST_READ cmd is issued
> > > > > > > as writing the following into the flash: 1 byte (cmd), 3 bytes (address),
> > > > > > > 8 bytes (8 dummy cycles -> 1 dummy byte).
> > > > > > >
> > > > > >
> > > > > > My interpretation of the comments are opposite: one cycle is a bit,
> > > > > > but we are not using bits, instead we are using bytes.
> > > > >
> > > > > Yes, the mentioning of 'bits' in the comment makes it not very clear at first read.
> > > > > Maybe just bellow would have been better:
> > > > >
> > > > > /* Dummy clock cycles - modeled with bytes writes */
> > > > >
> > > > > >
> > > > > > Testing shows that +=1 is the correct way with the imx_spi controller,
> > > > > > and with my SiFive SPI model in my local tree (not upstreamed yet)
> > > > >
> > > > > Perhaps an option could be to look into how the aspeed_smc, xilinx_spips or the
> > > > > npcm7xx_fiu generate dummy clock cycles and see if a similar solution to one of
> > > > > those could work aswell for the imx_spi?
> > > > >
> > > >
> > > > Thanks for pointing this out. So there is some inconsistency among
> > > > different SPI controller modeling.
> > >
> > > I'm not sure I understand you correctly but the controllers supporting
> > > commands with dummy clock cycles can only do it following the modeled
> > > approach, so I would rather say it is pretty consistent across the
> > > controllers (not all controllers support these commands though).
> >
> > I mean there are 2 approaches to emulate the dummy cycles for
>
> There is currently only 1 way of modeling dummy clock cycles. All commands that
> require / support them in m25p80 goes with that approach. An the controllers
> that support dummy clock cycles uses that approach.

No, there are 2 ways. One way is how aspeed_smc, xilinx_spips and
npcm7xx do for dummy cycles. For these controllers, there are hardware
registers for dummy cycles, and software does not need to write
anything into the tx fifo. These models emulate one dummy cycle by
transferring one byte one the SPI line so we see there are actually a
number of (bit * 8) bytes needed in decode_fast_read_cmd(). The other
way is how imx_spi, mss-spi, pl022, stm32f2xx_spi and xilinx_spi. For
these controllers, they just transfer whatever is written by guest
software to tx fifo without any special awareness of dummy cycles.

>
> > different SPI controller models, yet we only have one m25p80 flash
> > model to work with both of them. Some controllers may choose 1 byte to
> > emulate 1 dummy clock cycle, but some others choose 1 bit to emulate 1
> > dummy cycle. This is inconsistent.
> >
> > >
> > > >
> > > > Or maybe fixing aspeed_smc, xilinx_spips and npcm7xx_fiu to work like
> > > > imx_spi?
> > >
> > > For me I would say no to above (it makes more sense to let new controllers
> > > implement the currently modeled approach).
> >
> > Yes, we can certainly make them consistent. But the question is which
> > one is the correct one? I tried to search in the doc but in vain.
>
> I think it is better to look into the code instead of doc/comments since it
> might be outdated/misinterpreted.
>

But the codes have 2 different approaches and I don't know which one
was the original intended behavior.

> >
> > >
> > > > Which one is the expected behavior for dummy cycles?
> > >
> > > Dummy clock cycles are modeled as 1 byte written to the flash per dummy clock
> > > cycle (expected behavior).
> > >
> >
> > Like I mentioned before, 8 bytes to emulate 8 dummy clock cycles does
> > not work with current imx_spi model.
>
> I've understood this and that is why I'm trying to explain that it needs to
> convert the dummy byte to 8 writes (1 for each clock cycle). At the moment the
> imx_spi does not support dummy clock cycle generation as far as I can see.
>
> This patch works for the imx_xpi with the SST flash connected because it's
> hardcoding the flash to use 1 dummy clock cycle (speaking m25p80.c language)
> and then issues 1 byte write (for the dummy byte) from the model (matching it).

Please see above, the imx_spi does not hard coding 1 dummy clock cycle
to be used.

> If you switch to another flash, for example Windbond, the FAST_READ command
> won't work for the imx_spi anymore. And if you use an SST flash (using this
> patch) with another controller that has implemented dummy cycle generation
> the FAST_READ command won't work.

Dividing the Winbound dummy cycles by 8 should work with imx_spi. But
like I mentioned, we should firstly take a consistent approach to
handle dummy cycles in the SPI models.

Regards,
Bin

