Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC5A2D8563
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Dec 2020 10:45:48 +0100 (CET)
Received: from localhost ([::1]:38062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ko1TH-0005gR-7N
	for lists+qemu-devel@lfdr.de; Sat, 12 Dec 2020 04:45:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ko1SF-00059k-9H; Sat, 12 Dec 2020 04:44:43 -0500
Received: from mail-yb1-xb44.google.com ([2607:f8b0:4864:20::b44]:42279)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ko1SB-0003IR-Qs; Sat, 12 Dec 2020 04:44:43 -0500
Received: by mail-yb1-xb44.google.com with SMTP id j17so10470189ybt.9;
 Sat, 12 Dec 2020 01:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3LN2g76IlxxraC/o5Y5GaYTwgor2F34SVExWbbQ0+cg=;
 b=uCrYrI1Sb5g7RnRmSqw6ZlXOUFzJBZZP8N0iLm2uLUphYTDUPeJFkcItbh+xZcQKlI
 +nLx4rOgDXoLU+Yfmk+Vuq41rWbr7mrkisP0opQ4gkG0DYxOJ7wNW2pb7MMX1GWdCSvK
 S4cvzLyC/gOvQBZVgvC2yTU9hJ+Ax/yerx51N0VNhzz4wI+5O1U6q6sHWoW8Rq6LJg4P
 +0mxhTSKwJCM+zgcL/cUbajNJRuMBKtdxicGbCEY8EAUj+Zb407HwU48RF4WDvJgIHfI
 c0KLE2zN8BKpoJ7c9PL+LH8nFfn19JTDYLrmyCqdO788pzwgoiJDekCPZTyUcdFTB6ao
 SfEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3LN2g76IlxxraC/o5Y5GaYTwgor2F34SVExWbbQ0+cg=;
 b=roAsSx8qB4xXFkL4o/tHsUWAfxfSwq7XMrvrfiV03Wje4CwR2iyO1EJjjsHAUighA1
 zyAOJbIcqoXRPZcw7zfKcDoe9zD3KkSiomaF0+Roax8SsNKH2xdi6f6des466E2bjFt/
 65SU/K5pNIEaD3buEk9t04Zb/muuwz9HNAgrFKT9ESbYzQquLMu2m8ZrO/D1tVQipu/E
 SWEincKsjX2mZllcuFNyPGSd6KJVduaElHQ38RfLLowB3OX0rlExJO35KbyKDXqd88cS
 PMVeZjA0iclPnz/TjSc5TA2dFh7p9i6yFC342YLJsBozDAxD8+itV7wkD80H2x2/Y/0d
 W29A==
X-Gm-Message-State: AOAM530sYAcuHq5vnkLujfSAsI5p7TBRXjpA/HviSjDj9WE2lVj7RAYb
 8rfQdB26jAoUTeem9IQ/t7gRIqbX3WcoNV+xho4=
X-Google-Smtp-Source: ABdhPJzsRsPBCm0G4mTFqjEf93GMlU+qQzmNgq4FZJ1J+6OupgGgU+rhdi9pNTzdkA6UdRyFOnNNmMy2p/rlAVhKi6s=
X-Received: by 2002:a25:690b:: with SMTP id e11mr23601875ybc.314.1607766278365; 
 Sat, 12 Dec 2020 01:44:38 -0800 (PST)
MIME-Version: 1.0
References: <20201203083759.GA2661@fralle-msi>
 <CAEUhbmVkF9W12o04JnYofLLWwTfnNBJDnC+_8iZvdgnyonMYag@mail.gmail.com>
 <20201204104652.GA16865@fralle-dell>
 <CAEUhbmWAFf2sJLfb4i5JxhQgT88cVf54AzREuGrn+0C17ShxoQ@mail.gmail.com>
 <20201204112847.GA16964@fralle-dell>
 <CAEUhbmVo268ks+t1tLBcNLFYs4DAM6hexhYzXx=2B+YU31kR3w@mail.gmail.com>
 <20201211151641.GA12361@fralle-msi>
 <CAEUhbmXMfETY2LOkDn3x8a9ia74+hQgkEh4jbC8yKamP+qBFJw@mail.gmail.com>
 <20201211161146.GB12361@fralle-msi>
 <CAEUhbmXsZtGnMrw5gNJM=Gvqg3GQFejsfsggbTOpY+6eYLiBAg@mail.gmail.com>
 <20201212092406.GA32260@fralle-msi>
In-Reply-To: <20201212092406.GA32260@fralle-msi>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sat, 12 Dec 2020 17:44:27 +0800
Message-ID: <CAEUhbmUNZ5gctB+MEVfbrfmiZBOzm8unCEn+DZJjsMjcY_YGxg@mail.gmail.com>
Subject: Re: [PATCH] hw/block: m25p80: Fix fast read for SST flashes
To: Francisco Iglesias <frasse.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b44;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb44.google.com
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

On Sat, Dec 12, 2020 at 5:24 PM Francisco Iglesias
<frasse.iglesias@gmail.com> wrote:
>
> Hi bin,
>
> On [2020 Dec 12] Sat 16:16:59, Bin Meng wrote:
> > Hi Francisco,
> >
> > On Sat, Dec 12, 2020 at 12:11 AM Francisco Iglesias
> > <frasse.iglesias@gmail.com> wrote:
> > >
> > > Hello Bin,
> > >
> > > On [2020 Dec 11] Fri 23:29:16, Bin Meng wrote:
> > > > Hi Francisco,
> > > >
> > > > On Fri, Dec 11, 2020 at 11:16 PM Francisco Iglesias
> > > > <frasse.iglesias@gmail.com> wrote:
> > > > >
> > > > > Hello Bin,
> > > > >
> > > > > On [2020 Dec 11] Fri 14:07:21, Bin Meng wrote:
> > > > > > Hi Francisco,
> > > > > >
> > > > > > On Fri, Dec 4, 2020 at 7:28 PM Francisco Iglesias
> > > > > > <frasse.iglesias@gmail.com> wrote:
> > > > > > >
> > > > > > > Hello Bin,
> > > > > > >
> > > > > > > On [2020 Dec 04] Fri 18:52:50, Bin Meng wrote:
> > > > > > > > Hi Francisco,
> > > > > > > >
> > > > > > > > On Fri, Dec 4, 2020 at 6:46 PM Francisco Iglesias
> > > > > > > > <frasse.iglesias@gmail.com> wrote:
> > > > > > > > >
> > > > > > > > > Hello Bin,
> > > > > > > > >
> > > > > > > > > On [2020 Dec 04] Fri 15:52:12, Bin Meng wrote:
> > > > > > > > > > Hi Francisco,
> > > > > > > > > >
> > > > > > > > > > On Thu, Dec 3, 2020 at 4:38 PM Francisco Iglesias
> > > > > > > > > > <frasse.iglesias@gmail.com> wrote:
> > > > > > > > > > >
> > > > > > > > > > > Hi Bin and Alistair,
> > > > > > > > > > >
> > > > > > > > > > > On [2020 Dec 02] Wed 11:40:11, Alistair Francis wrote:
> > > > > > > > > > > > On Sun, Nov 29, 2020 at 6:55 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> > > > > > > > > > > > >
> > > > > > > > > > > > > From: Bin Meng <bin.meng@windriver.com>
> > > > > > > > > > > > >
> > > > > > > > > > > > > SST flashes require a dummy byte after the address bits.
> > > > > > > > > > > > >
> > > > > > > > > > > > > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > > > > > > > > > > >
> > > > > > > > > > > > I couldn't find a datasheet that says this... But the actual code
> > > > > > > > > > > > change looks fine, so:
> > > > > > > > > > > >
> > > > > > > > > > > > Acked-by: Alistair Francis <alistair.francis@wdc.com>
> > > > > > > > > > > >
> > > > > > > > > > > > Alistair
> > > > > > > > > > > >
> > > > > > > > > > > > > ---
> > > > > > > > > > > > >
> > > > > > > > > > > > >  hw/block/m25p80.c | 3 +++
> > > > > > > > > > > > >  1 file changed, 3 insertions(+)
> > > > > > > > > > > > >
> > > > > > > > > > > > > diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> > > > > > > > > > > > > index 483925f..9b36762 100644
> > > > > > > > > > > > > --- a/hw/block/m25p80.c
> > > > > > > > > > > > > +++ b/hw/block/m25p80.c
> > > > > > > > > > > > > @@ -825,6 +825,9 @@ static void decode_fast_read_cmd(Flash *s)
> > > > > > > > > > > > >      s->needed_bytes = get_addr_length(s);
> > > > > > > > > > > > >      switch (get_man(s)) {
> > > > > > > > > > > > >      /* Dummy cycles - modeled with bytes writes instead of bits */
> > > > > > > > > > > > > +    case MAN_SST:
> > > > > > > > > > > > > +        s->needed_bytes += 1;
> > > > > > > > > > >
> > > > > > > > > > > 1 dummy clk cycle is modelled as 1 byte write (see the comment above), so 1
> > > > > > > > > > > dummy byte (8 dummy clk cycles) will need +8 above.
> > > > > > > > > >
> > > > > > > > > > I think you were confused by the WINBOND codes. The comments are
> > > > > > > > > > correct. It is modeled with bytes instead of bits, so we should +=1.
> > > > > > > > >
> > > > > > > > > What the comment says is (perhaps not superclear) that 1 dummy clock cycle
> > > > > > > > > is modeled as one 1 byte write into the flash (meaining that 8 byte writes
> > > > > > > > > are needed for 1 dummy byte). Perhaps it is easier to understand
> > > > > > > > > looking into how the controllers issue the command towards the flash model
> > > > > > > > > (for example the xilinx_spips), the start of the FAST_READ cmd is issued
> > > > > > > > > as writing the following into the flash: 1 byte (cmd), 3 bytes (address),
> > > > > > > > > 8 bytes (8 dummy cycles -> 1 dummy byte).
> > > > > > > > >
> > > > > > > >
> > > > > > > > My interpretation of the comments are opposite: one cycle is a bit,
> > > > > > > > but we are not using bits, instead we are using bytes.
> > > > > > >
> > > > > > > Yes, the mentioning of 'bits' in the comment makes it not very clear at first read.
> > > > > > > Maybe just bellow would have been better:
> > > > > > >
> > > > > > > /* Dummy clock cycles - modeled with bytes writes */
> > > > > > >
> > > > > > > >
> > > > > > > > Testing shows that +=1 is the correct way with the imx_spi controller,
> > > > > > > > and with my SiFive SPI model in my local tree (not upstreamed yet)
> > > > > > >
> > > > > > > Perhaps an option could be to look into how the aspeed_smc, xilinx_spips or the
> > > > > > > npcm7xx_fiu generate dummy clock cycles and see if a similar solution to one of
> > > > > > > those could work aswell for the imx_spi?
> > > > > > >
> > > > > >
> > > > > > Thanks for pointing this out. So there is some inconsistency among
> > > > > > different SPI controller modeling.
> > > > >
> > > > > I'm not sure I understand you correctly but the controllers supporting
> > > > > commands with dummy clock cycles can only do it following the modeled
> > > > > approach, so I would rather say it is pretty consistent across the
> > > > > controllers (not all controllers support these commands though).
> > > >
> > > > I mean there are 2 approaches to emulate the dummy cycles for
> > >
> > > There is currently only 1 way of modeling dummy clock cycles. All commands that
> > > require / support them in m25p80 goes with that approach. An the controllers
> > > that support dummy clock cycles uses that approach.
> >
> > No, there are 2 ways. One way is how aspeed_smc, xilinx_spips and
> > npcm7xx do for dummy cycles. For these controllers, there are hardware
> > registers for dummy cycles, and software does not need to write
> > anything into the tx fifo. These models emulate one dummy cycle by
> > transferring one byte one the SPI line so we see there are actually a
> > number of (bit * 8) bytes needed in decode_fast_read_cmd(). The other
> > way is how imx_spi, mss-spi, pl022, stm32f2xx_spi and xilinx_spi. For
> > these controllers, they just transfer whatever is written by guest
> > software to tx fifo without any special awareness of dummy cycles.
>
>
> The xilinx_spips supports above way of transferring a command so you can look
> into that one for an example of how to handle a command pushed into a txfifo
> with regards to the dummy clock cycles. Not all controllers support generating
> dummy clock cycles, meaning that not all do the dummy byte -> dummy clock cycle
> conversion. The controllers that do not do this currently does not support
> issuing commands requiring them towards m25p80 (as FAST_READ, DOR, QOR etc..).

No, I don't think inspecting tx fifo to decode the SPI command, and to
insert dummy cycles when seeing FAST_READ is the correct way for these
SPI controllers like imx_spi. The real hardware does not do this and
we should not make them behave like xilinx_spips.

Regards,
Bin

