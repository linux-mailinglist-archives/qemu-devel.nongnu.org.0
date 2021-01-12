Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD7C2F3132
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 14:24:12 +0100 (CET)
Received: from localhost ([::1]:46540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzJed-0002Z0-7R
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 08:24:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzJa7-0000or-Kn
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 08:19:31 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:44305)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzJa5-0005Tg-PR
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 08:19:31 -0500
Received: by mail-ed1-x52f.google.com with SMTP id p22so2239444edu.11
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 05:19:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JV0fYik8m6jI9UqV5DS+cgAM+658ePS9bQ6bTpjmVVk=;
 b=Ie6Lmt2YuGNX+ETk6gYroLX6H1tguMKwi3DPMpA/mSVbPcfjL/cA7bgQeYfttTe6On
 86f8KvTTXaSVv5SOjjkH4RLEuprlQ9Hm5wg1SwI14v2utWcFc3ph/8CAYSw+xd/FtHxy
 awIBKjT3u/KEhG45bOV3qVaTq8NgjEU79sDl72/ZFm6v2oBBxt0FXLuxPtWLWTzDQDXI
 M4NRfmp7y13UoYZ1gDic+uBORBcjOlF2+SMtawFtKdun3ZtOx0/1e8OFF329q03JT5+z
 PTzp8CWLjiL3Q//DrhIODDlCSXeWiNHBTBUMthL38cxcEp+S2ib4q/TcLa6cW/q4p11j
 dV+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JV0fYik8m6jI9UqV5DS+cgAM+658ePS9bQ6bTpjmVVk=;
 b=EzXq8K6dI45ufN8twaXjyxFrfonOOIthX6k2J3zjeLIpQ7tGp9uvP2vzg2suPxC10L
 g7++STJhQ09f+7duKlAZRTuDtedtR4b4VlkFXrw9NPdTigNcMOX5qpJkZVFxX3X8HUIy
 W08S8+ap2tyDhnqeukMQ8aN18j2q5t+rTg6K/h/1QnXoNDxmUv0Ii8GYArFimvYB21UY
 VcHrun5DfOonT64WkOsuTU5LFULZhLFZkIxgn3mdILgq9c33j5yV9WUVaZcMEPPAvotd
 wpimiJWjHOBUoJ3ajBrgN0hl9+Zf/QzLZXXh43l89w21VU53eaFWJbxyFifKCrhcMSJC
 +wUw==
X-Gm-Message-State: AOAM532+0HTihJa9HM/GjvVLnEG/zLcohRO6f3M3OdLsYuUHUm5WU8dY
 nWqbKS5k7b2vlu4DNWd3i9sqiUfOtCY53Pr3xRCj/w==
X-Google-Smtp-Source: ABdhPJyqlmo5jP8hw1bvoYxNrog3vjWz6wwcCcYCUb9DW8z01YJBMMoMHITLzPv289j5Xu68UmnAA+tu7x/wmddie1c=
X-Received: by 2002:a50:fd18:: with SMTP id i24mr3514339eds.146.1610457567807; 
 Tue, 12 Jan 2021 05:19:27 -0800 (PST)
MIME-Version: 1.0
References: <20210110081429.10126-1-bmeng.cn@gmail.com>
 <20210110081429.10126-3-bmeng.cn@gmail.com>
 <CAFEAcA8W8vxA8AJY-Ka+--drv_asw5soaFNO90VzVENApMMH0w@mail.gmail.com>
 <CAEUhbmW2NaTNusZ123D7FPAK6uJZtCuak=UOtEE6Nc5fNfnsHQ@mail.gmail.com>
In-Reply-To: <CAEUhbmW2NaTNusZ123D7FPAK6uJZtCuak=UOtEE6Nc5fNfnsHQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 12 Jan 2021 13:19:16 +0000
Message-ID: <CAFEAcA8Yc9d5d0R3_m5FQE6NE6Gk3_RnDrX45eg0D0nCgaW4WA@mail.gmail.com>
Subject: Re: [PATCH v4 2/6] hw/ssi: imx_spi: Remove imx_spi_update_irq() in
 imx_spi_reset()
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>, QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm <qemu-arm@nongnu.org>, Alistair Francis <alistair.francis@wdc.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 12 Jan 2021 at 12:54, Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Tue, Jan 12, 2021 at 6:49 PM Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > On Sun, 10 Jan 2021 at 08:15, Bin Meng <bmeng.cn@gmail.com> wrote:
> > >
> > > From: Bin Meng <bin.meng@windriver.com>
> > >
> > > Usually the approach is that the device on the other end of the line
> > > is going to reset its state anyway, so there's no need to actively
> > > signal an irq line change during the reset hook.
> > >
> > > Move imx_spi_update_irq() out of imx_spi_reset(), to a new function
> > > imx_spi_hard_reset() that is called when the controller is disabled.
> > >
> > > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > >
> > > ---
> > >
> > > Changes in v4:
> > > - adujst the patch 2,3 order
> > > - rename imx_spi_soft_reset() to imx_spi_hard_reset() to avoid confusion
> > >
> > > Changes in v3:
> > > - new patch: remove imx_spi_update_irq() in imx_spi_reset()
> > >
> > >  hw/ssi/imx_spi.c | 14 ++++++++++----
> > >  1 file changed, 10 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
> > > index e605049a21..2c4c5ec1b8 100644
> > > --- a/hw/ssi/imx_spi.c
> > > +++ b/hw/ssi/imx_spi.c
> > > @@ -241,11 +241,16 @@ static void imx_spi_reset(DeviceState *dev)
> > >      imx_spi_rxfifo_reset(s);
> > >      imx_spi_txfifo_reset(s);
> > >
> > > -    imx_spi_update_irq(s);
> > > -
> > >      s->burst_length = 0;
> > >  }
> > >
> > > +static void imx_spi_hard_reset(IMXSPIState *s)
> > > +{
> > > +    imx_spi_reset(DEVICE(s));
> > > +
> > > +    imx_spi_update_irq(s);
> > > +}
> > > +
> > >  static uint64_t imx_spi_read(void *opaque, hwaddr offset, unsigned size)
> > >  {
> > >      uint32_t value = 0;
> > > @@ -351,8 +356,9 @@ static void imx_spi_write(void *opaque, hwaddr offset, uint64_t value,
> > >          s->regs[ECSPI_CONREG] = value;
> > >
> > >          if (!imx_spi_is_enabled(s)) {
> > > -            /* device is disabled, so this is a reset */
> > > -            imx_spi_reset(DEVICE(s));
> > > +            /* device is disabled, so this is a hard reset */
> > > +            imx_spi_hard_reset(s);
> > > +
> > >              return;
> > >          }
> >
> > The function of the code is correct, but you seem to have the function
> > naming backwards here. Generally:
> >  * soft reset == the reset triggered by the register write
> >  * hard reset == power-on reset == the dc->reset function
> >
> > I think this is what Philippe was trying to say.
>
> Philippe said: "Hmm usually hard reset include soft reset."

True in hardware, but for QEMU there are some things we don't
want to do in what we would call a hard or power-on reset.

> Since we are moving imx_spi_update_irq() out of imx_spi_reset() to a
> new function called imx_spi_soft_reset() (what I did in v3), that
> confused him (and I felt the same thing), so I renamed
> imx_spi_soft_reset() to imx_spi_hard_reset() in v4..

thanks
-- PMM

