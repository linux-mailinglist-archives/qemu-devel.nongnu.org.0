Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC564807B3
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Dec 2021 10:18:11 +0100 (CET)
Received: from localhost ([::1]:60914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n28cU-0004uk-CV
	for lists+qemu-devel@lfdr.de; Tue, 28 Dec 2021 04:18:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leetroy@gmail.com>)
 id 1n28ar-0003Kt-4D; Tue, 28 Dec 2021 04:16:29 -0500
Received: from [2607:f8b0:4864:20::32e] (port=42540
 helo=mail-ot1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leetroy@gmail.com>)
 id 1n28ap-0006Bx-Ba; Tue, 28 Dec 2021 04:16:28 -0500
Received: by mail-ot1-x32e.google.com with SMTP id
 a26-20020a9d6e9a000000b0058f37eeb861so21134906otr.9; 
 Tue, 28 Dec 2021 01:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=iXn4BfRtMYWAm1Q/nwNGe3lMfKYcPSKtLvfiCQ/KKU4=;
 b=gME9jCezNa75fYUBtMpekJR2/GISRwuWGzc4zSPUP0Q/kdgFwfKqMRPzLiInvg718A
 kJaBftJSSnr0XtKrJ6CmWVgENaYgFJoBtN0snJsYWXPBitxTC8ErQXNI/CFBoOuyku9E
 38Lsv4xCms3zNcqW6VwWRvMKvlsuFtB010YZbAEVWmyMW6DbcDzW9eOgRpg9z6nC2hF7
 qRHohuuSKSP+z1ircBcR/c8+jOECQESuPBW4x5zwUwu2zy6KYroKTaBQfj2JDfuBoUYS
 H10rTrXfUm6wU3nHnujUjDv8VApmD9/+NQr5sz4l7pJf7ldomgNT1V5BPhmAfsPP3saC
 AOTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=iXn4BfRtMYWAm1Q/nwNGe3lMfKYcPSKtLvfiCQ/KKU4=;
 b=IivQjec5wRpUImoPz8Cg0HrfDcBXs7pi6BKpLBemxJtdOJ/lC5pwOV56d4rT3J8/p0
 cJ7rjmv6t2LoXODWZEQw6APIWuR0Zu6ugX4LC/X2OMyfDz0pj62uQaW6mhGwvXPtLhnS
 VVKZwdNI5QIfZAa4wbvMPoQCLenGvziGnVakbTpSyX+TieXfzQmyB7pBF+agtL1vyatf
 U9ODpvvl6wgd+m9lPxqOgJzp9RPFsCpHJcnkfjJATFUiWGnCqxELzpU16sF71o1JJKX1
 fNc1D5Z8b/usUJO0N9SRTEXLiI7hX5wg+C5eeFOmay9doXAfireOql43ZJDYh7KhVRwC
 ++Kw==
X-Gm-Message-State: AOAM533jwCUf0uH2Wp4DLpiDwJm3Z55MQCHMDvewugihfZBCpVjWA7kx
 jAUWrzTmoodsZM63GAQnvhDvThCuQErNF7hIbG8=
X-Google-Smtp-Source: ABdhPJzKv8WZor62tlDXxoQHVbJYca5vcfCRFVW+qF6LHDk+fFWnVGHwWoRskJ55EOuS9xbogQEbpY+xFDh0zlKe0Gc=
X-Received: by 2002:a05:6830:1445:: with SMTP id
 w5mr14718627otp.112.1640682985831; 
 Tue, 28 Dec 2021 01:16:25 -0800 (PST)
MIME-Version: 1.0
References: <20211222092319.2988568-1-troy_lee@aspeedtech.com>
 <20211222092319.2988568-3-troy_lee@aspeedtech.com>
 <bcf4643c-6c62-c2c4-76db-7649e9e95225@kaod.org>
In-Reply-To: <bcf4643c-6c62-c2c4-76db-7649e9e95225@kaod.org>
From: Troy Lee <leetroy@gmail.com>
Date: Tue, 28 Dec 2021 17:16:19 +0800
Message-ID: <CAN9Jwz1pqwv4ATH-qX9fxqVYYwDd2BcRve+p_rCDo=pNbavwcg@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] hw/arm/aspeed_ast2600: create i3c instance
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::32e;
 envelope-from=leetroy@gmail.com; helo=mail-ot1-x32e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Troy Lee <troy_lee@aspeedtech.com>, qemu-devel@nongnu.org,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 23, 2021 at 9:54 PM C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> On 12/22/21 10:23, Troy Lee wrote:
> > This patch includes i3c instance in ast2600 soc.
> >
> > Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
>
> Looks good but it is based on the QEMU aspeed branch for OpenBMC.
> You should rebase on upstream.
>
> Thanks,
>
> C.
>
Will do.

Thanks,
Troy Lee

> > ---
> >   hw/arm/aspeed_ast2600.c     | 12 ++++++++++++
> >   include/hw/arm/aspeed_soc.h |  3 +++
> >   2 files changed, 15 insertions(+)
> >
> > diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
> > index f2fef9d706..219b025bc2 100644
> > --- a/hw/arm/aspeed_ast2600.c
> > +++ b/hw/arm/aspeed_ast2600.c
> > @@ -63,6 +63,7 @@ static const hwaddr aspeed_soc_ast2600_memmap[] =3D {
> >       [ASPEED_DEV_VUART]     =3D 0x1E787000,
> >       [ASPEED_DEV_FSI1]      =3D 0x1E79B000,
> >       [ASPEED_DEV_FSI2]      =3D 0x1E79B100,
> > +    [ASPEED_DEV_I3C]       =3D 0x1E7A0000,
> >       [ASPEED_DEV_SDRAM]     =3D 0x80000000,
> >   };
> >
> > @@ -112,6 +113,7 @@ static const int aspeed_soc_ast2600_irqmap[] =3D {
> >       [ASPEED_DEV_FSI1]      =3D 100,
> >       [ASPEED_DEV_FSI2]      =3D 101,
> >       [ASPEED_DEV_DP]        =3D 62,
> > +    [ASPEED_DEV_I3C]       =3D 102,   /* 102 -> 107 */
> >   };
> >
> >   static qemu_irq aspeed_soc_get_irq(AspeedSoCState *s, int ctrl)
> > @@ -230,6 +232,8 @@ static void aspeed_soc_ast2600_init(Object *obj)
> >
> >       object_initialize_child(obj, "pwm", &s->pwm, TYPE_ASPEED_PWM);
> >
> > +    object_initialize_child(obj, "i3c", &s->i3c, TYPE_ASPEED_I3C);
> > +
> >       object_initialize_child(obj, "fsi[*]", &s->fsi[0], TYPE_ASPEED_AP=
B2OPB);
> >   }
> >
> > @@ -542,6 +546,14 @@ static void aspeed_soc_ast2600_realize(DeviceState=
 *dev, Error **errp)
> >       sysbus_connect_irq(SYS_BUS_DEVICE(&s->pwm), 0,
> >                          aspeed_soc_get_irq(s, ASPEED_DEV_PWM));
> >
> > +    /* I3C */
> > +    if (!sysbus_realize(SYS_BUS_DEVICE(&s->i3c), errp)) {
> > +        return;
> > +    }
> > +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->i3c), 0, sc->memmap[ASPEED_DEV_=
I3C]);
> > +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->i3c), 0,
> > +                       aspeed_soc_get_irq(s, ASPEED_DEV_I3C));
> > +
> >       /* FSI */
> >       if (!sysbus_realize(SYS_BUS_DEVICE(&s->fsi[0]), errp)) {
> >           return;
> > diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
> > index 0db200d813..0c950fab3c 100644
> > --- a/include/hw/arm/aspeed_soc.h
> > +++ b/include/hw/arm/aspeed_soc.h
> > @@ -21,6 +21,7 @@
> >   #include "hw/timer/aspeed_timer.h"
> >   #include "hw/rtc/aspeed_rtc.h"
> >   #include "hw/i2c/aspeed_i2c.h"
> > +#include "hw/misc/aspeed_i3c.h"
> >   #include "hw/ssi/aspeed_smc.h"
> >   #include "hw/misc/aspeed_hace.h"
> >   #include "hw/watchdog/wdt_aspeed.h"
> > @@ -53,6 +54,7 @@ struct AspeedSoCState {
> >       AspeedRtcState rtc;
> >       AspeedTimerCtrlState timerctrl;
> >       AspeedI2CState i2c;
> > +    AspeedI3CState i3c;
> >       AspeedSCUState scu;
> >       AspeedHACEState hace;
> >       AspeedXDMAState xdma;
> > @@ -148,6 +150,7 @@ enum {
> >       ASPEED_DEV_FSI2,
> >       ASPEED_DEV_DPMCU,
> >       ASPEED_DEV_DP,
> > +    ASPEED_DEV_I3C,
> >   };
> >
> >   #endif /* ASPEED_SOC_H */
> >
>

