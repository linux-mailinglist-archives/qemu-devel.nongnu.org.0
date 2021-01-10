Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F058A2F04B9
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Jan 2021 02:42:38 +0100 (CET)
Received: from localhost ([::1]:39236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyPkb-0005GL-Kv
	for lists+qemu-devel@lfdr.de; Sat, 09 Jan 2021 20:42:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kyPjf-0004hB-EK; Sat, 09 Jan 2021 20:41:39 -0500
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30]:43880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kyPjd-0004pC-BQ; Sat, 09 Jan 2021 20:41:39 -0500
Received: by mail-yb1-xb30.google.com with SMTP id y128so13351385ybf.10;
 Sat, 09 Jan 2021 17:41:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=gIjULYWuqJ1F49GLhY2vgT82AIUwduomrfCmJVdsDwk=;
 b=t2fxiP7XfkaBv7tUSVql5HnMX1NcPEQ+d2JVrp27r7931ruUQPzeP20Bk0VOUDitio
 ENquTruoG2URu37Yg7hyHCPHR2DwlXAUcLGwyzRWNYS4SqBpm50oBZ8x+iUIY0Zjn6N1
 ZddTKM/p8v/xtpEsnsGQ/41Rg69piA1IJty9268M5+S+70FnrWKNlDXWHR0g3jJ3lAgO
 w8qTaUILXXga+6BMSqdO/dO60+2AzZsybc0iTrodRm/13TrHPJ4ECcpqkx8JZF9Sd556
 ljlkgBNue5EZf9CWsnyhetvKC1OMQxLdWueCUN3+gh+pRGW7TA+0X9QjKQPo3+PzrB58
 yc7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=gIjULYWuqJ1F49GLhY2vgT82AIUwduomrfCmJVdsDwk=;
 b=QqoXjxg/ylFX/ZTCpXPD3YNBKIAsUpvfc+xeZAzu920UM8AfsmmJ3/Cgxo48EgE1Zy
 l+mq/B47JSAxdulAnXv4iE+MSoQFL8i58GsNNoXJ7/xZs7qq5s+3WIVoIsHZC7eu6O0a
 nhO2lUIMHXTg9IYh+fpWEtDDY1F8umQMkk1Ww9xYN8tPX2EbYMECYaHrtf4fauRXrAHZ
 65CSIubc8qsbgzAQoFAjbubrqYmCBn44QY8sjk0+Ho+Qln+nv8MyFwNnXVegRPNnyUk0
 PVCYipop5j3UpKoA/wjH9NtTxKWqPJSd7cEXab8dXrJzt0ga5g7WtCnjduYlk0jMQMRS
 I8JQ==
X-Gm-Message-State: AOAM533a2ywe3+mzecNXhDgjYopAmPM0wXOZM9ybAl/fKL6in1b27AXv
 8jZcPwVCSKpsfzgUHAgnngB+AB+bWdTASdyCkHI=
X-Google-Smtp-Source: ABdhPJx6J4hTMdhlbv2voj8NXY0L6f+kbkIb9oFjHH9ULsXRYpbH1PKy1T0RB6jhY/tFLG9+7l3A7B1aVwYrBnzH8Ko=
X-Received: by 2002:a25:aaee:: with SMTP id
 t101mr14666001ybi.517.1610242895594; 
 Sat, 09 Jan 2021 17:41:35 -0800 (PST)
MIME-Version: 1.0
References: <20210109123545.12001-1-bmeng.cn@gmail.com>
 <20210109123545.12001-4-bmeng.cn@gmail.com>
 <ca66c21a-c3f8-8e96-033e-56548280b4b1@amsat.org>
In-Reply-To: <ca66c21a-c3f8-8e96-033e-56548280b4b1@amsat.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 10 Jan 2021 09:41:24 +0800
Message-ID: <CAEUhbmU-MC7ue_G551ezkiQdcQi5JxwCsJMsT_NOpsMdmGegYQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] hw/ssi: imx_spi: Remove imx_spi_update_irq() in
 imx_spi_reset()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb30.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm <qemu-arm@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Philippe,

On Sun, Jan 10, 2021 at 7:53 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> On 1/9/21 1:35 PM, Bin Meng wrote:
> > From: Bin Meng <bin.meng@windriver.com>
> >
> > Usually the approach is that the device on the other end of the line
> > is going to reset its state anyway, so there's no need to actively
> > signal an irq line change during the reset hook.
> >
> > Move imx_spi_update_irq() out of imx_spi_reset(), along with the
> > disabling of chip selects, to a new function imx_spi_soft_reset()
> > that is called when the controller is disabled.
>
> Now I read this patch, forget my comment on previous patch.
>
> >
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> >
> > ---
> >
> > Changes in v3:
> > - new patch: remove imx_spi_update_irq() in imx_spi_reset()
> >
> >  hw/ssi/imx_spi.c | 21 ++++++++++++++-------
> >  1 file changed, 14 insertions(+), 7 deletions(-)
> >
> > diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
> > index 8d429e703f..880939f595 100644
> > --- a/hw/ssi/imx_spi.c
> > +++ b/hw/ssi/imx_spi.c
> > @@ -241,9 +241,20 @@ static void imx_spi_reset(DeviceState *dev)
> >      imx_spi_rxfifo_reset(s);
> >      imx_spi_txfifo_reset(s);
> >
> > +    s->burst_length =3D 0;
> > +}
> > +
> > +static void imx_spi_soft_reset(IMXSPIState *s)
> > +{
> > +    int i;
> > +
> > +    imx_spi_reset(DEVICE(s));
>
> Hmm usually hard reset include soft reset.

That's my understanding as well.

>
> > +
> >      imx_spi_update_irq(s);
> >
> > -    s->burst_length =3D 0;
> > +    for (i =3D 0; i < ECSPI_NUM_CS; i++) {
> > +        qemu_set_irq(s->cs_lines[i], 1);
>
> Isn't this part of the hard reset?
>

I think we can rename the name to imx_spi_hard_reset() to avoid such confus=
ion.

> > +    }
> >  }
> >
> >  static uint64_t imx_spi_read(void *opaque, hwaddr offset, unsigned siz=
e)
> > @@ -351,12 +362,8 @@ static void imx_spi_write(void *opaque, hwaddr off=
set, uint64_t value,
> >          s->regs[ECSPI_CONREG] =3D value;
> >
> >          if (!imx_spi_is_enabled(s)) {
> > -            /* device is disabled, so this is a reset */
> > -            imx_spi_reset(DEVICE(s));
> > -
> > -            for (int i =3D 0; i < ECSPI_NUM_CS; i++) {
> > -                qemu_set_irq(s->cs_lines[i], 1);
> > -            }
> > +            /* device is disabled, so this is a soft reset */
> > +            imx_spi_soft_reset(s);
>
> Maybe you can restructure patches 2/3, first introduce
> imx_spi_soft_reset() - this patch - then fix ECSPI_CONREG
> - the previous patch -.

Sure.

Regards,
Bin

