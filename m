Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F83403447
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 08:32:26 +0200 (CEST)
Received: from localhost ([::1]:53036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNr8D-00009P-2o
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 02:32:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mNr5L-0007O7-5J; Wed, 08 Sep 2021 02:29:27 -0400
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a]:41718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mNr5J-0007u8-6N; Wed, 08 Sep 2021 02:29:26 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id z18so2060070ybg.8;
 Tue, 07 Sep 2021 23:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=WX5JPikt36irdC4NJow8yFV5XtpQhzkCYa60XbduWqE=;
 b=qDZwn/+kc7hb0xriQLJgyLjgzca4Fk/npKFMlMZxgfAbOhPFQYAJrBlb/lOlpxecoQ
 7O1PHdxMAxGcEJ591Uwt1A0Qg3cycz1OiFPSk4vhwJJQIOm8zVFzw3T9XyC5sOtrxj6X
 etNipZ/LQLw3DruLJHsmGDftxJiZqzwtncbgDy3P/zNAuKwjMq7XcrLj91z/Mf6RAB2h
 cRjchvCSU7taRZBUkXsjgri7mAA3C9DSlURtdf84L0LoQhdscJEqO4IXxyzNqtaP5D7p
 VnxRueJySAObDpRw1AvvlDYkjjq0n3j/N4oRhyvIUvcFOCBtxCuV/ekuDdjGtXmgOM/4
 gRzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WX5JPikt36irdC4NJow8yFV5XtpQhzkCYa60XbduWqE=;
 b=A+Zwz083R3Qijv04S96jgpwPk1AptYxth0aXcWnSXza4TQ/ckqbi1d4TuTfb7J581l
 NhzKWiZZtxUSDx+N7aU4EZuZfz/NkL0QX8nHMWINvU1pD3gZUvlfW6tQq/UGGF3kokmx
 FpOd4VV143PySPY3efpcfD0afA3Ln/dNroXNeSi5H8Wlggie+vEuVBb69xACc6tsRaMO
 b1Q98LzJ2WIxkU592hZKzNim/y4+SUL6ZY3uTfQoPuybHfJnyX1b+5YBXd7DE59BUnVU
 ZBZbNNRIExAF2XxhKWnmTBGCHXIvHzqH1n5FA7uqN/o4DBHr07psBj8vUI2kOhmmH05L
 7IZw==
X-Gm-Message-State: AOAM532mU4Mdj5R7Qixl/CIs+F2SWntxlVyyc1/T76k3r3o/6IkGFk7Z
 wztDWtDd6uYtXIu2e0+MGP1ffM4O9l47T8fRVdI=
X-Google-Smtp-Source: ABdhPJwNE7cp0/RIwq0vODycNwcT6mqKf3Z/dKh2k2ELY0KKxoC9K8e95JFz5SniseLF3u5OAouoycbOarEHFNg82wc=
X-Received: by 2002:a05:6902:120a:: with SMTP id
 s10mr2856056ybu.293.1631082563459; 
 Tue, 07 Sep 2021 23:29:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210808013406.223506-1-linux@roeck-us.net>
 <CAFEAcA8+o69ztRaaMvqh+zNaFs_6reSHX_ijknay6_0VePSE2w@mail.gmail.com>
 <a34c10d4-fc90-0186-3214-c3c5e77b4eea@roeck-us.net>
 <CAFEAcA_cAp6kWTE6Lpx6QF1zfTYfQXiOPgdfkztS3iuJkRB0xQ@mail.gmail.com>
 <b5e43e87-c1bd-3265-298e-346413a22a82@roeck-us.net>
 <CAEUhbmWN1=j=hPntg1j6aOv-AZNDm1UrDFB364Qqf0SAccyJew@mail.gmail.com>
 <c49b65a2-fa3e-c180-5fdf-a0a64cb91a32@amsat.org>
 <e08467c0-bd69-81d3-93d3-13b8fc812453@roeck-us.net>
In-Reply-To: <e08467c0-bd69-81d3-93d3-13b8fc812453@roeck-us.net>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 8 Sep 2021 14:29:11 +0800
Message-ID: <CAEUhbmX9JxE+VxSL8BWGd_XKD-WJ0r5d5MKsbdVgPiJkZd5Y3w@mail.gmail.com>
Subject: Re: [PATCH] hw/ssi: imx_spi: Improve chip select handling
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2a.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Sep 5, 2021 at 10:08 AM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 9/4/21 4:19 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> > On 9/5/21 1:06 AM, Bin Meng wrote:
> >> On Sun, Sep 5, 2021 at 1:13 AM Guenter Roeck <linux@roeck-us.net> wrot=
e:
> >>>
> >>> On 9/2/21 12:29 PM, Peter Maydell wrote:
> >>>> On Thu, 2 Sept 2021 at 17:09, Guenter Roeck <linux@roeck-us.net> wro=
te:
> >>>>>
> >>>>> On 9/2/21 8:58 AM, Peter Maydell wrote:
> >>>>>> On Sun, 8 Aug 2021 at 02:34, Guenter Roeck <linux@roeck-us.net> wr=
ote:
> >>>>>>>
> >>>>>>> The control register does not really have a means to deselect
> >>>>>>> all chip selects directly. As result, CS is effectively never
> >>>>>>> deselected, and connected flash chips fail to perform read
> >>>>>>> operations since they don't get the expected chip select signals
> >>>>>>> to reset their state machine.
> >>>>>>>
> >>>>>>> Normally and per controller documentation one would assume that
> >>>>>>> chip select should be set whenever a transfer starts (XCH is
> >>>>>>> set or the tx fifo is written into), and that it should be disabl=
ed
> >>>>>>> whenever a transfer is complete. However, that does not work in
> >>>>>>> practice: attempts to implement this approach resulted in failure=
s,
> >>>>>>> presumably because a single transaction can be split into multipl=
e
> >>>>>>> transfers.
> >>>>>>>
> >>>>>>> At the same time, there is no explicit signal from the host indic=
ating
> >>>>>>> if chip select should be active or not. In the absence of such a =
direct
> >>>>>>> signal, use the burst length written into the control register to
> >>>>>>> determine if an access is ongoing or not. Disable all chip select=
s
> >>>>>>> if the burst length field in the configuration register is set to=
 0,
> >>>>>>> and (re-)enable chip select if a transfer is started. This is pos=
sible
> >>>>>>> because the Linux driver clears the burst length field whenever i=
t
> >>>>>>> prepares the controller for the next transfer.
> >>>>>>> This solution  is less than perfect since it effectively only dis=
ables
> >>>>>>> chip select when initiating the next transfer, but it does work w=
ith
> >>>>>>> Linux and should otherwise do no harm.
> >>>>>>>
> >>>>>>> Stop complaining if the burst length field is set to a value of 0=
,
> >>>>>>> since that is done by Linux for every transfer.
> >>>>>>>
> >>>>>>> With this patch, a command line parameter such as "-drive
> >>>>>>> file=3Dflash.sabre,format=3Draw,if=3Dmtd" can be used to instanti=
ate the
> >>>>>>> flash chip in the sabrelite emulation. Without this patch, the
> >>>>>>> flash instantiates, but it only reads zeroes.
> >>>>>>>
> >>>>>>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> >>>>>>> ---
> >>>>>>> I am not entirely happy with this solution, but it is the best I =
was
> >>>>>>> able to come up with. If anyone has a better idea, I'll be happy
> >>>>>>> to give it a try.
> >>>>>>>
> >>>>>>>     hw/ssi/imx_spi.c | 17 +++++++----------
> >>>>>>>     1 file changed, 7 insertions(+), 10 deletions(-)
> >>>>>>>
> >>>>>>> diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
> >>>>>>> index 189423bb3a..7a093156bd 100644
> >>>>>>> --- a/hw/ssi/imx_spi.c
> >>>>>>> +++ b/hw/ssi/imx_spi.c
> >>>>>>> @@ -167,6 +167,8 @@ static void imx_spi_flush_txfifo(IMXSPIState =
*s)
> >>>>>>>         DPRINTF("Begin: TX Fifo Size =3D %d, RX Fifo Size =3D %d\=
n",
> >>>>>>>                 fifo32_num_used(&s->tx_fifo), fifo32_num_used(&s-=
>rx_fifo));
> >>>>>>>
> >>>>>>> +    qemu_set_irq(s->cs_lines[imx_spi_selected_channel(s)], 0);
> >>>>>>> +
> >>>>>>>         while (!fifo32_is_empty(&s->tx_fifo)) {
> >>>>>>>             int tx_burst =3D 0;
> >>>>>>>
> >>>>>>> @@ -385,13 +387,6 @@ static void imx_spi_write(void *opaque, hwad=
dr offset, uint64_t value,
> >>>>>>>         case ECSPI_CONREG:
> >>>>>>>             s->regs[ECSPI_CONREG] =3D value;
> >>>>>>>
> >>>>>>> -        burst =3D EXTRACT(s->regs[ECSPI_CONREG], ECSPI_CONREG_BU=
RST_LENGTH) + 1;
> >>>>>>> -        if (burst % 8) {
> >>>>>>> -            qemu_log_mask(LOG_UNIMP,
> >>>>>>> -                          "[%s]%s: burst length %d not supported=
: rounding up to next multiple of 8\n",
> >>>>>>> -                          TYPE_IMX_SPI, __func__, burst);
> >>>>>>> -        }
> >>>>>>
> >>>>>> Why has this log message been removed ?
> >>>>>
> >>>>> What I wanted to do is:
> >>>>>
> >>>>> "Stop complaining if the burst length field is set to a value of 0,
> >>>>>     since that is done by Linux for every transfer."
> >>>>>
> >>>>> What I did instead is to remove the message entirely.
> >>>>>
> >>>>> How about the rest of the patch ? Is it worth a resend with the mes=
sage
> >>>>> restored (except for burst size =3D=3D 0), or is it not acceptable =
anyway ?
> >>>>
> >>>> I did the easy bit of the code review because answering this
> >>>> question is probably a multiple-hour job...this is still on my
> >>>> todo list, but I'm hoping somebody who understands the MIX
> >>>> SPI device gets to it first.
> >>>>
> >>>
> >>> Makes sense. Of course, it would be even better if someone can explai=
n
> >>> how this works on real hardware.
> >>>
> >>
> >> I happened to notice this patch today. Better to cc people who once
> >> worked on this part from "git blame" or "git log".
> >
> > Even better if you add yourself as designated reviewer ;)
> >
> > $ ./scripts/get_maintainer.pl -f hw/ssi/imx_spi.c
> > Alistair Francis <alistair@alistair23.me> (maintainer:SSI)
> > Peter Maydell <peter.maydell@linaro.org> (odd fixer:i.MX31 (kzm))
> > Jean-Christophe Dubois <jcd@tribudubois.net> (reviewer:SABRELITE / i.MX=
6)
> >
> >>
> >>> In this context, it would be useful to know if real SPI flash chips
> >>> reset their state to idle under some conditions which are not covered
> >>> by the current code in hw/block/m25p80.c. Maybe the real problem is
> >>> as simple as that code setting data_read_loop when it should not,
> >>> or that it doesn't reset that flag when it should (unless I am missin=
g
> >>> something, the flag is currently only reset by disabling chip select)=
.
> >
> > Plausible hypothesis.
> >
>
> Possibly. Note that I did check the flash chip specification, but I don't
> see a notable difference to the qemu implementation. But then, again,
> I may be missing something.
>

+Xuzhou Cheng who once worked on imx_spi for some comments

Regards,
Bin

