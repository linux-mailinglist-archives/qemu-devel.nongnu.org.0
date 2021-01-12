Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D292F2F5E
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 13:51:28 +0100 (CET)
Received: from localhost ([::1]:38946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzJ8x-00035a-Qw
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 07:51:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kzJ6K-0001UG-1h; Tue, 12 Jan 2021 07:48:44 -0500
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36]:34514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kzJ6H-000388-OG; Tue, 12 Jan 2021 07:48:43 -0500
Received: by mail-yb1-xb36.google.com with SMTP id x6so1591042ybr.1;
 Tue, 12 Jan 2021 04:48:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9POOe9Uv0dP1f0gRGFIKg+L5i1Fh268DrexSVAThGAc=;
 b=R0HCgg5g0o7UXktJCq3bf8od7RrFGGfPfVrbszzg5smSi6au/Ln+YlWG/YOPmBnPbc
 7fAX35itlFUx9pMlmcREj7/p9ydry4sSfDUyq7wnfro0x0tChzNahgW/QYo/+n4LjTGj
 BhAqvufKWT+Dn4Bg/b0b/AA3oH7r7d0x1RHcEqNI4tznriPAl56/HgS/RaALrbwRNbii
 18DQw2ESdI0qKzxSpSPs0nycuPJuV0TxQ8fJy96E7ygjrh37OgdinSREgIBECTtSoeki
 57t8gInkvECtxdZPRqkIvwvOSfFbqKt84AV/TFoYTw/Rb8Vw8a3gWymZBLcCF9sCH9LJ
 9Zew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9POOe9Uv0dP1f0gRGFIKg+L5i1Fh268DrexSVAThGAc=;
 b=Bz0ZqBhSbwQ1mJrGgW0IaQnUMbj+8AVjF3rIiER4tHHYMitE4DS1RTDbbtwLibuo5C
 rTsJPE2G8LG8WcEoFqkf1SJ6/Xo6OiGOuBczU7t1CWa25CXU9g1CS8axVmuJfM+wQZBS
 o7Q9Zjrxji3G0EK+Y13ARU17XbClapCx7s8gk426i2aRIwyZHRug8QLWurMh7XlEFdut
 EVbFsHby73yfnORdLHe7/D1PileuxoT75zHJdE38+2ELiNwySYswvS6oBQuRswx6IOYZ
 1MiwJrbLVVTh/e/bd1Kh9uWWXfxxiG3c41HDkQDjuYjHisbNTe/Zq6McoAWA5+5MACfW
 MR7g==
X-Gm-Message-State: AOAM531h51cA9IqGFa9ABtLoYhnnogP5CXj0up9Y5+ISPQy57hz1zsU7
 pabIdb9w96ce20ho7iMXeCMH5/D2eeFW5DBkRA4=
X-Google-Smtp-Source: ABdhPJy7sytdeT5R+ROamT5uavKdjkg1ompZLPf3BRjMa+t21mwp1yeCqUzYbq7Y6V6CLFsrdhQIrMWMO5Fx8tdn1PE=
X-Received: by 2002:a25:3bc5:: with SMTP id i188mr3259533yba.332.1610455720151; 
 Tue, 12 Jan 2021 04:48:40 -0800 (PST)
MIME-Version: 1.0
References: <20210110081429.10126-1-bmeng.cn@gmail.com>
 <20210110081429.10126-7-bmeng.cn@gmail.com>
 <CAFEAcA-RPxLHSVuGDk=Wn-+2kGG6+L_VQfkiaGNEfJ8X1-Mkzg@mail.gmail.com>
In-Reply-To: <CAFEAcA-RPxLHSVuGDk=Wn-+2kGG6+L_VQfkiaGNEfJ8X1-Mkzg@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 12 Jan 2021 20:48:29 +0800
Message-ID: <CAEUhbmX-M5XJQsZ3J_tE27+pjjG+fhcUOkVX0efSAyMorZfWFw@mail.gmail.com>
Subject: Re: [PATCH v4 6/6] hw/ssi: imx_spi: Correct tx and rx fifo endianness
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb36.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>, QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm <qemu-arm@nongnu.org>, Alistair Francis <alistair.francis@wdc.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 12, 2021 at 6:46 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Sun, 10 Jan 2021 at 08:15, Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > From: Bin Meng <bin.meng@windriver.com>
> >
> > The endianness of data exchange between tx and rx fifo is incorrect.
> > Earlier bytes are supposed to show up on MSB and later bytes on LSB,
> > ie: in big endian. The manual does not explicitly say this, but the
> > U-Boot and Linux driver codes have a swap on the data transferred
> > to tx fifo and from rx fifo.
> >
> > With this change, U-Boot read from / write to SPI flash tests pass.
> >
> >   => sf test 1ff000 1000
> >   SPI flash test:
> >   0 erase: 0 ticks, 4096000 KiB/s 32768.000 Mbps
> >   1 check: 3 ticks, 1333 KiB/s 10.664 Mbps
> >   2 write: 235 ticks, 17 KiB/s 0.136 Mbps
> >   3 read: 2 ticks, 2000 KiB/s 16.000 Mbps
> >   Test passed
> >   0 erase: 0 ticks, 4096000 KiB/s 32768.000 Mbps
> >   1 check: 3 ticks, 1333 KiB/s 10.664 Mbps
> >   2 write: 235 ticks, 17 KiB/s 0.136 Mbps
> >   3 read: 2 ticks, 2000 KiB/s 16.000 Mbps
> >
> > Fixes: c906a3a01582 ("i.MX: Add the Freescale SPI Controller")
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> >
> > ---
> >
> > (no changes since v3)
> >
> > Changes in v3:
> > - Simplify the tx fifo endianness handling
> >
> >  hw/ssi/imx_spi.c | 7 ++-----
> >  1 file changed, 2 insertions(+), 5 deletions(-)
> >
> > diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
> > index 47c8a0f572..b5124a6426 100644
> > --- a/hw/ssi/imx_spi.c
> > +++ b/hw/ssi/imx_spi.c
> > @@ -171,7 +171,6 @@ static void imx_spi_flush_txfifo(IMXSPIState *s)
> >
> >      while (!fifo32_is_empty(&s->tx_fifo)) {
> >          int tx_burst = 0;
> > -        int index = 0;
> >
> >          if (s->burst_length <= 0) {
> >              s->burst_length = imx_spi_burst_length(s);
> > @@ -192,7 +191,7 @@ static void imx_spi_flush_txfifo(IMXSPIState *s)
> >          rx = 0;
> >
> >          while (tx_burst > 0) {
> > -            uint8_t byte = tx & 0xff;
> > +            uint8_t byte = tx >> (tx_burst - 8);
> >
> >              DPRINTF("writing 0x%02x\n", (uint32_t)byte);
> >
> > @@ -201,13 +200,11 @@ static void imx_spi_flush_txfifo(IMXSPIState *s)
> >
> >              DPRINTF("0x%02x read\n", (uint32_t)byte);
> >
> > -            tx = tx >> 8;
> > -            rx |= (byte << (index * 8));
> > +            rx = (rx << 8) | byte;
> >
> >              /* Remove 8 bits from the actual burst */
> >              tx_burst -= 8;
> >              s->burst_length -= 8;
> > -            index++;
> >          }
>
> This version of the loop definitely looks a lot neater. However,
> looking at the code I don't think there's anything that forces the
> guest to set a burst length that's a multiple of 8, so you need
> to handle that somehow. Otherwise on the last time through the
> loop (tx_burst - 8) can be negative, which is undefined behaviour
> when you try to shift by it.

Yes, that's why I added a patch to log the unimplemented behavior to
notify the user.

> I think just rounding tx_burst up to a multiple of 8 before
> the start of the loop would do the right thing ?

Probably. Given all flash transfers are normally multiple of 8-bits I
am not sure what the real hardware behavior is when it is not multiple
of 8, but I will try to add something in the next version.

Regards,
Bin

