Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC0C2EF58B
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 17:10:16 +0100 (CET)
Received: from localhost ([::1]:41216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxuL8-0003TC-Vo
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 11:10:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kxu7O-0000NC-TN; Fri, 08 Jan 2021 10:56:02 -0500
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d]:39092)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kxu7N-0001M8-3D; Fri, 08 Jan 2021 10:56:02 -0500
Received: by mail-yb1-xb2d.google.com with SMTP id k4so9772455ybp.6;
 Fri, 08 Jan 2021 07:55:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cPlGlNWylJYTvtemAWcMNWUM9KMJdiKsaH7b/Hd0vb0=;
 b=PesK2pAMEmlNEJmDhEOf6gBYeD7gcJ57FRK/+cz/5ety+HGtd3BKViEPUcy8BgQgbi
 t8iWRmmHX+CsaVTtiNrjdFmSRJziE2Yymwu1KxeMFo3nYr30/QztHzLnJ36u06gdgfZ5
 8HG7ZMEFzBwIQCQqPDChx3WzGOZZWDu/LsEWFAlTu11ghm9gbfxBCPjjJ38upUh2VkNd
 06bLSJXA43hjp58kbdw+U84/AdcYgnBJxjD9k+FBbxrKVwQn9YYUNhy90REP986DEWn5
 GOTATbRYtlYGjhlwRtwtmffBgNTo/vVr2RUuuM6GXoxYB9AHQf0sF8vIA9nxwJwJuYTQ
 LAww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cPlGlNWylJYTvtemAWcMNWUM9KMJdiKsaH7b/Hd0vb0=;
 b=fiFT1FoHEL30n16zrPVQlV539dXXn8jSNXHRhZG/D3UT0qCvU7Z5TY6D8eItRaPsz7
 9Uh7L3CFBKA9jFCbTCJIQvNN4+jGP7D/GLcr8otZwxLTVTQj/FeJG8dI1UxkZpT4uuS9
 N5yY9Q7fMQe8ZRDIwuFtRYuEGNVoSDWOk6XhYodkfcx2tclxeh+CZSX47tOrr52eRsXN
 JuN0tyakTiLJU0ZMi4Jqu5W1lFDjvgqmYvCj89HqApcI51g1+FUnmT21UdgBU02RtIgZ
 oVYFd/Axb1cyXmJiAFd8qMsWuGkKluynKE1DSzGSFRDm5NH74fKFewZyl5ARkcokMLLW
 T6fQ==
X-Gm-Message-State: AOAM533gl02HasijdlYVG0nRfwhoj+xjobX0IwvGyfdy6XcKJ/ty8HZd
 D4iGzdpKem3QmitWCEEuCjFKgwUwBXbnhsotgKw=
X-Google-Smtp-Source: ABdhPJxg4TBCboQtVKvJGNRHHAehKpS2wSstfyM+WQ2fVy7JEtBTJOK8AeONAb0wZCRmx4CD/p3xs9VY5WfnQgnCU3A=
X-Received: by 2002:a25:aaee:: with SMTP id t101mr5925612ybi.517.1610121359293; 
 Fri, 08 Jan 2021 07:55:59 -0800 (PST)
MIME-Version: 1.0
References: <20201202144523.24526-1-bmeng.cn@gmail.com>
 <20201202144523.24526-2-bmeng.cn@gmail.com>
 <CAFEAcA9weaHgHTZBmEeveOxaakpeQTAvqrKGG6pZAprr=DcpWQ@mail.gmail.com>
In-Reply-To: <CAFEAcA9weaHgHTZBmEeveOxaakpeQTAvqrKGG6pZAprr=DcpWQ@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 8 Jan 2021 23:55:48 +0800
Message-ID: <CAEUhbmVsjNAm+arSskKJx5LCCKbcpHyRJr+SO6wY_8mE-P37Og@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] hw/ssi: imx_spi: Disable chip selects in
 imx_spi_reset()
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2d.google.com
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
Cc: Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Bin Meng <bin.meng@windriver.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm <qemu-arm@nongnu.org>,
 Peter Chubb <peter.chubb@nicta.com.au>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 8, 2021 at 10:40 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Wed, 2 Dec 2020 at 14:45, Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > From: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> >
> > When a write to ECSPI_CONREG register to disable the SPI controller,
> > imx_spi_reset() is called to reset the controller, during which CS
> > lines should have been disabled, otherwise the state machine of any
> > devices (e.g.: SPI flashes) connected to the SPI master is stuck to
> > its last state and responds incorrectly to any follow-up commands.
> >
> > Fixes: c906a3a01582 ("i.MX: Add the Freescale SPI Controller")
> > Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > Acked-by: Alistair Francis <alistair.francis@wdc.com>
> >
> > ---
> >
> > Changes in v2:
> > - Fix the "Fixes" tag in the commit message
> >
> >  hw/ssi/imx_spi.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
> > index e605049a21..85c172e815 100644
> > --- a/hw/ssi/imx_spi.c
> > +++ b/hw/ssi/imx_spi.c
> > @@ -231,6 +231,7 @@ static void imx_spi_flush_txfifo(IMXSPIState *s)
> >  static void imx_spi_reset(DeviceState *dev)
> >  {
> >      IMXSPIState *s = IMX_SPI(dev);
> > +    int i;
> >
> >      DPRINTF("\n");
> >
> > @@ -243,6 +244,10 @@ static void imx_spi_reset(DeviceState *dev)
> >
> >      imx_spi_update_irq(s);
> >
> > +    for (i = 0; i < ECSPI_NUM_CS; i++) {
> > +        qemu_set_irq(s->cs_lines[i], 1);
> > +    }
>
> Calling qemu_set_irq() in a device reset function is a bad
> idea, because you don't know whether the thing on the other
> end of the IRQ line (a) has already reset before you or
> (b) is going to reset after you. If you need to do this then
> I think you need to convert this device (and perhaps whatever
> it's connected to) to the 3-phase-reset API. (But you probably
> don't, see below.)
>

Thanks for the review. What about the imx_spi_update_irq() in the
imx_spi_reset()? Should we remove that from the imx_spi_reset() as
well?

> Usually the approach is that the device on the other end
> of the line is going to reset its state anyway, so there's
> no need to actively signal an irq line change.
>
> If this is required only for the case of "guest requested
> a controller reset via the ECSPI_CONREG register" and not
> for full system reset, then you can handle that by having
> an imx_spi_soft_reset() which calls imx_spi_reset() and then
> does the qemu_set_irq() calls, so full system (power-cycle)
> reset still goes to imx_spi_reset() but guest-commanded
> reset via the register interface calls imx_spi_soft_reset().
>

Regards,
Bin

