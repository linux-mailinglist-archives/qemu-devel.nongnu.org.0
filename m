Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A153E307781
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 14:56:54 +0100 (CET)
Received: from localhost ([::1]:49050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l57n3-00079g-Ms
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 08:56:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l57kg-00069t-SM
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 08:54:27 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:39860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l57kZ-00087K-NU
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 08:54:26 -0500
Received: by mail-ed1-x535.google.com with SMTP id b21so6690373edy.6
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 05:54:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=J9bT+1htkfWngb5GTCiyd2mns4sFH1yUFJ/HiJJTGYE=;
 b=BpvcHLSiMfCOzRe1m7j3Ji4YBY8bpsUxLDiKAoVl9KGC3JurCIAxMdDmG4D9PGP3vr
 RF5/PMzOJmg+QhjGA53cZtysB5wMdqDXx/U9CUJ4qPOpDT1Ps/X9sLpQJO+5AxeS/Q7V
 dY1rj0XPzua/NYvnHtwXvjFjOqFQANpjXXCbhH6Nalbsu9tupg9MSkMFzjMcVtqCNAD9
 WcjCc2xgDbmlj5H9B7UdEb120Yr++9M1g16fymzMA/iTrQ75pVkDbSBeAN72/3r6DHNc
 LNV1zWMhg/bVOiFc4tjQ1BORNmb5fsj0O9OnyX5zxLRCvwSRqWFmrUxPlpkNRj4NlRla
 agNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=J9bT+1htkfWngb5GTCiyd2mns4sFH1yUFJ/HiJJTGYE=;
 b=EJuZwA1o7GKMnBkZp5qCn8o5dBSCK1KbpRng6TDWt5Y9HQvfq5w6ljyG9fNTP2IbjJ
 hBrfYmO632YXGuPtTZsvv2vfp1Kw+F1T7WTqAvx1RE0bVnZMF2NPLIiEE5rlrDN9z1Dx
 mTWn4N70xmhnAC03fTcMtiN55dvMImErWu0B6GP0CVjWa7K90JQxp/CuTgmRYKb78bbf
 S4k/OWuk2Dj5VkrE0jcRYO7CJNIK5VRFk9mchB4NX79AAe5JTR36J2LIWOMpuDNLZZSk
 2RrSudPpFoMqVVTYnTJ1RhC/qvHL9uMlmxdKpfAMCrlmLm3IzLYC2LmdHK2/wO35wPtb
 DPaw==
X-Gm-Message-State: AOAM530FCjho9wdoiYdudrEeX+Ugj17rrACJsbDJmHYvJEepOMIYxG33
 Hgy2jKhC2UNRXHfdKlEQNUWX9nmftH8fR3WYE1jDig==
X-Google-Smtp-Source: ABdhPJwDt24ZrL5tVRNaJ84cXbgBN0kteCzLi3wd1cyVfzGrhdVT+6MAxajpxhx5xqLSci8c3iNqKzBM19+ZdbgRhbM=
X-Received: by 2002:a05:6402:5107:: with SMTP id
 m7mr14017698edd.52.1611842056944; 
 Thu, 28 Jan 2021 05:54:16 -0800 (PST)
MIME-Version: 1.0
References: <1611063546-20278-1-git-send-email-bmeng.cn@gmail.com>
 <1611063546-20278-5-git-send-email-bmeng.cn@gmail.com>
 <CAFEAcA-SG1nJ3g1dDSvZ99Wgduz+Wd0p483keCvd-oQNb0DO0A@mail.gmail.com>
 <CAEUhbmVTPnPBO-8qY1UoZ_4HR4d-GcMLcwCf-Hm20rhD9pSi5w@mail.gmail.com>
In-Reply-To: <CAEUhbmVTPnPBO-8qY1UoZ_4HR4d-GcMLcwCf-Hm20rhD9pSi5w@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jan 2021 13:54:05 +0000
Message-ID: <CAFEAcA_cE=fHmegAjs0Sefk4p1Fhi34ohjFcuxYFQUviBtRszQ@mail.gmail.com>
Subject: Re: [PATCH v8 04/10] hw/ssi: imx_spi: Rework imx_spi_reset() to keep
 CONREG register value
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Thu, 28 Jan 2021 at 13:47, Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Thu, Jan 28, 2021 at 9:43 PM Peter Maydell <peter.maydell@linaro.org> =
wrote:
> >
> > On Tue, 19 Jan 2021 at 13:40, Bin Meng <bmeng.cn@gmail.com> wrote:
> > >
> > > From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> > >
> > > When the block is disabled, all registers are reset with the
> > > exception of the ECSPI_CONREG. It is initialized to zero
> > > when the instance is created.
> > >
> > > Ref: i.MX 6DQ Applications Processor Reference Manual (IMX6DQRM),
> > >      chapter 21.7.3: Control Register (ECSPIx_CONREG)
> >
> > > diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
> > > index 8fb3c9b..c952a3d 100644
> > > --- a/hw/ssi/imx_spi.c
> > > +++ b/hw/ssi/imx_spi.c
> > > @@ -231,12 +231,23 @@ static void imx_spi_flush_txfifo(IMXSPIState *s=
)
> > >  static void imx_spi_reset(DeviceState *dev)
> > >  {
> > >      IMXSPIState *s =3D IMX_SPI(dev);
> > > +    int i;
> > >
> > >      DPRINTF("\n");
> > >
> > > -    memset(s->regs, 0, sizeof(s->regs));
> > > -
> > > -    s->regs[ECSPI_STATREG] =3D 0x00000003;
> > > +    for (i =3D 0; i < ARRAY_SIZE(s->regs); i++) {
> > > +        switch (i) {
> > > +        case ECSPI_CONREG:
> > > +            /* CONREG is not updated on reset */
> > > +            break;
> > > +        case ECSPI_STATREG:
> > > +            s->regs[i] =3D 0x00000003;
> > > +            break;
> > > +        default:
> > > +            s->regs[i] =3D 0;
> > > +            break;
> > > +        }
> > > +    }
> >
> > This retains the CONREG register value for both:
> >  * 'soft' reset caused by write to device register to disable
> >    the block
> >    -- this is corrcet as per the datasheet quote
> >  * 'power on' reset via TYPE_DEVICE's reset method
> >    -- but in this case we should reset CONREG, because the Device
> >    reset method is like a complete device powercycle and should
> >    return the device state to what it was when QEMU was first
> >    started.
>
> The POR value of CONREG is zero, which should be the default value, no?

But you're not setting it to zero here, you're leaving it with
whatever value it had before. (That's correct for soft reset,
but wrong for power-on.)

thanks
-- PMM

