Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5CDE25E3C7
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Sep 2020 00:39:50 +0200 (CEST)
Received: from localhost ([::1]:54294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kEKN2-0007oT-Tu
	for lists+qemu-devel@lfdr.de; Fri, 04 Sep 2020 18:39:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hskinnemoen@google.com>)
 id 1kEKMB-0007AI-3J
 for qemu-devel@nongnu.org; Fri, 04 Sep 2020 18:38:55 -0400
Received: from mail-vs1-xe41.google.com ([2607:f8b0:4864:20::e41]:39602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hskinnemoen@google.com>)
 id 1kEKM7-0000u8-Vz
 for qemu-devel@nongnu.org; Fri, 04 Sep 2020 18:38:54 -0400
Received: by mail-vs1-xe41.google.com with SMTP id b16so4479150vsl.6
 for <qemu-devel@nongnu.org>; Fri, 04 Sep 2020 15:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=C9EBW7Qk6eIT8P8VIatP89AM80w5sELgLZQ8MqkTGHs=;
 b=XIIW3b0WSmjJEqr/IXZqTryUq5ABZmUC31EkrHihuEihgaHVsvirmxJZAei8TqR/ww
 RQh5UaU7oLfpHCFNe4R1/8Ej3lRFrOJaXdtdN6ajNXLp85bmcRvZfJ0ng5KgKTq/9e7M
 2P7TX6CJWNbeq9jv1nbFPGshfYyhHzc97e1qY3JBVuTIGekuxBRIUlncxi3CbJRnz6gY
 cE9BNmaW7z6qBsn7iiYBJK0xWV05V+nptjaozy1OQ6/pA8GAAlbsMFUuwL/jd9uQsUrQ
 53eGUPfv+wy++nxGBbC4IAg+/YZgsUEqx4rs8I3e71Jrz4cOS/DXbJtfVHeSYmRA8Ibu
 whwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=C9EBW7Qk6eIT8P8VIatP89AM80w5sELgLZQ8MqkTGHs=;
 b=Mwpy+dX8KUgLavkHRAfhHeEtIEbvqbshjuY8WIlyb+12oiU7XBQupn5XIZNL5yFwSW
 Bw2D5e1nC2l2pXNX3Un/wX5xIcOgmWVlWH/FgBhRuRKoCVSzIaZCJ0TS7Xj0vvYhk5vV
 SJFklSlx3qdWOoQlqprrWadF8ZDoF+QEvUezIXdwBrYQo8jgp6mSktG6BiaKVbqBEukz
 0s3JAsudGWHWKkhIvdajUyTqGDSyRfNQuSAld1PF8SSD2KoFV1eofs+YiwJYWXshqpRh
 E92EclD65FhRnz1MC2m8pzh/exZ6VyHUds2Q+VOe/Ei9GMS9puGX+KASbG5Eh7T6bXtg
 pfPw==
X-Gm-Message-State: AOAM530X7VaNIzV+LfZ7R/0EmZLk8of2kRDDkZGyoNgoiBvg/5i6gZOR
 qyixN8kwth6NBHjOQZpoWOQxRWZx6VSx11cMoJyMtA==
X-Google-Smtp-Source: ABdhPJzkWobzjIJwWgugqjO2MZIivo+uuHnF90E8/j7J3TMWbGKf03UxH0CZTy4prPhT+mWIKv1fD8xyI1Bm06O+RZk=
X-Received: by 2002:a05:6102:20da:: with SMTP id
 i26mr7763596vsr.192.1599259130033; 
 Fri, 04 Sep 2020 15:38:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200825001711.1340443-1-hskinnemoen@google.com>
 <20200825001711.1340443-3-hskinnemoen@google.com>
 <e6187a7b-afc0-425a-de91-ea4818f7f876@amsat.org>
 <CAFQmdRbirDn4ao-B0UHHn-QFKfdeRzBR1dXTmUx_WZikfSB1tg@mail.gmail.com>
In-Reply-To: <CAFQmdRbirDn4ao-B0UHHn-QFKfdeRzBR1dXTmUx_WZikfSB1tg@mail.gmail.com>
From: Havard Skinnemoen <hskinnemoen@google.com>
Date: Fri, 4 Sep 2020 15:38:38 -0700
Message-ID: <CAFQmdRbSgVTGgN2MV98wfxWSicrtokUCKKBU2knvVrimn2FWxA@mail.gmail.com>
Subject: Re: [PATCH v8 02/14] hw/misc: Add NPCM7xx Clock Controller device
 model
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>, 
 QEMU Developers <qemu-devel@nongnu.org>,
 IS20 Avi Fishman <Avi.Fishman@nuvoton.com>, 
 CS20 KFTing <kfting@nuvoton.com>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e41;
 envelope-from=hskinnemoen@google.com; helo=mail-vs1-xe41.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -180
X-Spam_score: -18.1
X-Spam_bar: ------------------
X-Spam_report: (-18.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.5,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 4, 2020 at 3:02 PM Havard Skinnemoen <hskinnemoen@google.com> w=
rote:
>
> On Fri, Sep 4, 2020 at 2:32 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
> >
> > On 8/25/20 2:16 AM, Havard Skinnemoen via wrote:
> > > Enough functionality to boot the Linux kernel has been implemented. T=
his
> > > includes:
> > >
> > >   - Correct power-on reset values so the various clock rates can be
> > >     accurately calculated.
> > >   - Clock enables stick around when written.
> > >
> > > In addition, a best effort attempt to implement SECCNT and CNTR25M wa=
s
> > > made even though I don't think the kernel needs them.
> > >
> > > Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
> > > Reviewed-by: Joel Stanley <joel@jms.id.au>
> > > Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
> > > Signed-off-by: Havard Skinnemoen <hskinnemoen@google.com>
> > > ---
> > >  include/hw/misc/npcm7xx_clk.h |  48 ++++++
> > >  hw/misc/npcm7xx_clk.c         | 266 ++++++++++++++++++++++++++++++++=
++
> > >  hw/misc/meson.build           |   1 +
> > >  hw/misc/trace-events          |   4 +
> > >  4 files changed, 319 insertions(+)
> > >  create mode 100644 include/hw/misc/npcm7xx_clk.h
> > >  create mode 100644 hw/misc/npcm7xx_clk.c
> > >
> > > diff --git a/include/hw/misc/npcm7xx_clk.h b/include/hw/misc/npcm7xx_=
clk.h
> > > new file mode 100644
> > > index 0000000000..cdcc9e8534
> > > --- /dev/null
> > > +++ b/include/hw/misc/npcm7xx_clk.h
> > > @@ -0,0 +1,48 @@
> > > +/*
> > > + * Nuvoton NPCM7xx Clock Control Registers.
> > > + *
> > > + * Copyright 2020 Google LLC
> > > + *
> > > + * This program is free software; you can redistribute it and/or mod=
ify it
> > > + * under the terms of the GNU General Public License as published by=
 the
> > > + * Free Software Foundation; either version 2 of the License, or
> > > + * (at your option) any later version.
> > > + *
> > > + * This program is distributed in the hope that it will be useful, b=
ut WITHOUT
> > > + * ANY WARRANTY; without even the implied warranty of MERCHANTABILIT=
Y or
> > > + * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public Lice=
nse
> > > + * for more details.
> > > + */
> > > +#ifndef NPCM7XX_CLK_H
> > > +#define NPCM7XX_CLK_H
> > > +
> > > +#include "exec/memory.h"
> > > +#include "hw/sysbus.h"
> > > +
> > > +/*
> > > + * The reference clock frequency for the timer modules, and the SECC=
NT and
> > > + * CNTR25M registers in this module, is always 25 MHz.
> > > + */
> > > +#define NPCM7XX_TIMER_REF_HZ            (25000000)
> > > +
> > > +/*
> > > + * Number of registers in our device state structure. Don't change t=
his without
> > > + * incrementing the version_id in the vmstate.
> > > + */
> > > +#define NPCM7XX_CLK_NR_REGS             (0x70 / sizeof(uint32_t))
> > > +
> > > +typedef struct NPCM7xxCLKState {
> > > +    SysBusDevice parent;
> > > +
> > > +    MemoryRegion iomem;
> > > +
> > > +    uint32_t regs[NPCM7XX_CLK_NR_REGS];
> > > +
> > > +    /* Time reference for SECCNT and CNTR25M, initialized by power o=
n reset */
> > > +    int64_t ref_ns;
> > > +} NPCM7xxCLKState;
> > > +
> > > +#define TYPE_NPCM7XX_CLK "npcm7xx-clk"
> > > +#define NPCM7XX_CLK(obj) OBJECT_CHECK(NPCM7xxCLKState, (obj), TYPE_N=
PCM7XX_CLK)
> > > +
> > > +#endif /* NPCM7XX_CLK_H */
> > > diff --git a/hw/misc/npcm7xx_clk.c b/hw/misc/npcm7xx_clk.c
> > > new file mode 100644
> > > index 0000000000..21ab4200d1
> > > --- /dev/null
> > > +++ b/hw/misc/npcm7xx_clk.c
> > > @@ -0,0 +1,266 @@
> > > +/*
> > > + * Nuvoton NPCM7xx Clock Control Registers.
> > > + *
> > > + * Copyright 2020 Google LLC
> > > + *
> > > + * This program is free software; you can redistribute it and/or mod=
ify it
> > > + * under the terms of the GNU General Public License as published by=
 the
> > > + * Free Software Foundation; either version 2 of the License, or
> > > + * (at your option) any later version.
> > > + *
> > > + * This program is distributed in the hope that it will be useful, b=
ut WITHOUT
> > > + * ANY WARRANTY; without even the implied warranty of MERCHANTABILIT=
Y or
> > > + * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public Lice=
nse
> > > + * for more details.
> > > + */
> > > +
> > > +#include "qemu/osdep.h"
> > > +
> > > +#include "hw/misc/npcm7xx_clk.h"
> > > +#include "migration/vmstate.h"
> > > +#include "qemu/error-report.h"
> > > +#include "qemu/log.h"
> > > +#include "qemu/module.h"
> > > +#include "qemu/timer.h"
> > > +#include "qemu/units.h"
> > > +#include "trace.h"
> > > +
> > > +#define PLLCON_LOKI     BIT(31)
> > > +#define PLLCON_LOKS     BIT(30)
> > > +#define PLLCON_PWDEN    BIT(12)
> > > +
> > > +enum NPCM7xxCLKRegisters {
> > > +    NPCM7XX_CLK_CLKEN1,
> > > +    NPCM7XX_CLK_CLKSEL,
> > > +    NPCM7XX_CLK_CLKDIV1,
> > > +    NPCM7XX_CLK_PLLCON0,
> > > +    NPCM7XX_CLK_PLLCON1,
> > > +    NPCM7XX_CLK_SWRSTR,
> > > +    NPCM7XX_CLK_IPSRST1         =3D 0x20 / sizeof(uint32_t),
> > > +    NPCM7XX_CLK_IPSRST2,
> > > +    NPCM7XX_CLK_CLKEN2,
> > > +    NPCM7XX_CLK_CLKDIV2,
> > > +    NPCM7XX_CLK_CLKEN3,
> > > +    NPCM7XX_CLK_IPSRST3,
> > > +    NPCM7XX_CLK_WD0RCR,
> > > +    NPCM7XX_CLK_WD1RCR,
> > > +    NPCM7XX_CLK_WD2RCR,
> > > +    NPCM7XX_CLK_SWRSTC1,
> > > +    NPCM7XX_CLK_SWRSTC2,
> > > +    NPCM7XX_CLK_SWRSTC3,
> > > +    NPCM7XX_CLK_SWRSTC4,
> > > +    NPCM7XX_CLK_PLLCON2,
> > > +    NPCM7XX_CLK_CLKDIV3,
> > > +    NPCM7XX_CLK_CORSTC,
> > > +    NPCM7XX_CLK_PLLCONG,
> > > +    NPCM7XX_CLK_AHBCKFI,
> > > +    NPCM7XX_CLK_SECCNT,
> > > +    NPCM7XX_CLK_CNTR25M,
> > > +    NPCM7XX_CLK_REGS_END,
> > > +};
> > > +
> > > +/*
> > > + * These reset values were taken from version 0.91 of the NPCM750R d=
ata sheet.
> > > + *
> > > + * All are loaded on power-up reset. CLKENx and SWRSTR should also b=
e loaded on
> > > + * core domain reset, but this reset type is not yet supported by QE=
MU.
> > > + */
> > > +static const uint32_t cold_reset_values[NPCM7XX_CLK_NR_REGS] =3D {
> > > +    [NPCM7XX_CLK_CLKEN1]        =3D 0xffffffff,
> > > +    [NPCM7XX_CLK_CLKSEL]        =3D 0x004aaaaa,
> > > +    [NPCM7XX_CLK_CLKDIV1]       =3D 0x5413f855,
> > > +    [NPCM7XX_CLK_PLLCON0]       =3D 0x00222101 | PLLCON_LOKI,
> > > +    [NPCM7XX_CLK_PLLCON1]       =3D 0x00202101 | PLLCON_LOKI,
> > > +    [NPCM7XX_CLK_IPSRST1]       =3D 0x00001000,
> > > +    [NPCM7XX_CLK_IPSRST2]       =3D 0x80000000,
> > > +    [NPCM7XX_CLK_CLKEN2]        =3D 0xffffffff,
> > > +    [NPCM7XX_CLK_CLKDIV2]       =3D 0xaa4f8f9f,
> > > +    [NPCM7XX_CLK_CLKEN3]        =3D 0xffffffff,
> > > +    [NPCM7XX_CLK_IPSRST3]       =3D 0x03000000,
> > > +    [NPCM7XX_CLK_WD0RCR]        =3D 0xffffffff,
> > > +    [NPCM7XX_CLK_WD1RCR]        =3D 0xffffffff,
> > > +    [NPCM7XX_CLK_WD2RCR]        =3D 0xffffffff,
> > > +    [NPCM7XX_CLK_SWRSTC1]       =3D 0x00000003,
> > > +    [NPCM7XX_CLK_PLLCON2]       =3D 0x00c02105 | PLLCON_LOKI,
> > > +    [NPCM7XX_CLK_CORSTC]        =3D 0x04000003,
> > > +    [NPCM7XX_CLK_PLLCONG]       =3D 0x01228606 | PLLCON_LOKI,
> > > +    [NPCM7XX_CLK_AHBCKFI]       =3D 0x000000c8,
> > > +};
> > > +
> > > +static uint64_t npcm7xx_clk_read(void *opaque, hwaddr offset, unsign=
ed size)
> > > +{
> > > +    uint32_t reg =3D offset / sizeof(uint32_t);
> > > +    NPCM7xxCLKState *s =3D opaque;
> > > +    int64_t now_ns;
> > > +    uint32_t value =3D 0;
> > > +
> > > +    if (reg >=3D NPCM7XX_CLK_NR_REGS) {
> > > +        qemu_log_mask(LOG_GUEST_ERROR,
> > > +                      "%s: offset 0x%04" HWADDR_PRIx " out of range\=
n",
> >
> > I find "out of range" not clear, but this might be the correct
> > terminology.
> >
> > > +                      __func__, offset);
> > > +        return 0;
> > > +    }
> > > +
> > > +    switch (reg) {
> > > +    case NPCM7XX_CLK_SWRSTR:
> > > +        qemu_log_mask(LOG_GUEST_ERROR,
> > > +                      "%s: register @ 0x%04" HWADDR_PRIx " is write-=
only\n",
> > > +                      __func__, offset);
> > > +        break;
> > > +
> > > +    case NPCM7XX_CLK_SECCNT:
> > > +        now_ns =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> > > +        value =3D (now_ns - s->ref_ns) / NANOSECONDS_PER_SECOND;
> > > +        break;
> > > +
> > > +    case NPCM7XX_CLK_CNTR25M:
> > > +        now_ns =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> > > +        /*
> > > +         * This register counts 25 MHz cycles, updating every 640 ns=
. It rolls
> > > +         * over to zero every second.
> > > +         *
> > > +         * The 4 LSBs are always zero: (1e9 / 640) << 4 =3D 25000000=
.
> > > +         */
> > > +        value =3D (((now_ns - s->ref_ns) / 640) << 4) % NPCM7XX_TIME=
R_REF_HZ;
> > > +        break;
> > > +
> > > +    default:
> > > +        value =3D s->regs[reg];
> > > +        break;
> > > +    };
> > > +
> > > +    trace_npcm7xx_clk_read(offset, value);
> > > +
> > > +    return value;
> > > +}
> > > +
> > > +static void npcm7xx_clk_write(void *opaque, hwaddr offset,
> > > +                              uint64_t v, unsigned size)
> > > +{
> > > +    uint32_t reg =3D offset / sizeof(uint32_t);
> > > +    NPCM7xxCLKState *s =3D opaque;
> > > +    uint32_t value =3D v;
> > > +
> > > +    trace_npcm7xx_clk_write(offset, value);
> > > +
> > > +    if (reg >=3D NPCM7XX_CLK_NR_REGS) {
> > > +        qemu_log_mask(LOG_GUEST_ERROR,
> > > +                      "%s: offset 0x%04" HWADDR_PRIx " out of range\=
n",
> > > +                      __func__, offset);
> > > +        return;
> > > +    }
> > > +
> > > +    switch (reg) {
> > > +    case NPCM7XX_CLK_SWRSTR:
> > > +        qemu_log_mask(LOG_UNIMP, "%s: SW reset not implemented: 0x%0=
2x\n",
> > > +                      __func__, value);
> >
> > Isn't this sufficient?
> >
> >            qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
>
> It's not quite that easy; this register holds 4 bits, each of which
> maps to a separate register which defines the modules to reset. It's
> not that hard, but a little more than I'd like to add to the series at
> this point. I'll send a followup patch once the initial series is in.

Actually, I'm not sure if this would have any effect on being able to
reboot. Running with -d unimp shows:

reboot: Restarting system
npcm7xx_timer_write: WTCR write not implemented: 0x00000083
Reboot failed -- System halted

So we need to implement watchdog support, which is something we were
planning to do fairly soon.

> >
> > > +        value =3D 0;
> > > +        break;
> > > +
> > > +    case NPCM7XX_CLK_PLLCON0:
> > > +    case NPCM7XX_CLK_PLLCON1:
> > > +    case NPCM7XX_CLK_PLLCON2:
> > > +    case NPCM7XX_CLK_PLLCONG:
> > > +        if (value & PLLCON_PWDEN) {
> > > +            /* Power down -- clear lock and indicate loss of lock */
> > > +            value &=3D ~PLLCON_LOKI;
> > > +            value |=3D PLLCON_LOKS;
> > > +        } else {
> > > +            /* Normal mode -- assume always locked */
> > > +            value |=3D PLLCON_LOKI;
> > > +            /* Keep LOKS unchanged unless cleared by writing 1 */
> > > +            if (value & PLLCON_LOKS) {
> > > +                value &=3D ~PLLCON_LOKS;
> > > +            } else {
> > > +                value |=3D (value & PLLCON_LOKS);
> > > +            }
> > > +        }
> > > +        break;
> > > +
> > > +    case NPCM7XX_CLK_CNTR25M:
> > > +        qemu_log_mask(LOG_GUEST_ERROR,
> > > +                      "%s: register @ 0x%04" HWADDR_PRIx " is read-o=
nly\n",
> > > +                      __func__, offset);
> > > +        return;
> > > +    }
> > > +
> > > +    s->regs[reg] =3D value;
> > > +}
> > > +
> > > +static const struct MemoryRegionOps npcm7xx_clk_ops =3D {
> > > +    .read       =3D npcm7xx_clk_read,
> > > +    .write      =3D npcm7xx_clk_write,
> > > +    .endianness =3D DEVICE_LITTLE_ENDIAN,
> > > +    .valid      =3D {
> > > +        .min_access_size        =3D 4,
> > > +        .max_access_size        =3D 4,
> > > +        .unaligned              =3D false,
> > > +    },
> > > +};
> > > +
> > > +static void npcm7xx_clk_enter_reset(Object *obj, ResetType type)
> > > +{
> > > +    NPCM7xxCLKState *s =3D NPCM7XX_CLK(obj);
> > > +
> > > +    QEMU_BUILD_BUG_ON(sizeof(s->regs) !=3D sizeof(cold_reset_values)=
);
> > > +
> > > +    switch (type) {
> > > +    case RESET_TYPE_COLD:
> > > +        memcpy(s->regs, cold_reset_values, sizeof(cold_reset_values)=
);
> > > +        s->ref_ns =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> > > +        return;
> > > +    }
> > > +
> > > +    /*
> > > +     * A small number of registers need to be reset on a core domain=
 reset,
> > > +     * but no such reset type exists yet.
> > > +     */
> > > +    qemu_log_mask(LOG_UNIMP, "%s: reset type %d not implemented.",
> > > +                  __func__, type);
> >
> > Clean :)
> >
> > > +}
> > > +
> > > +static void npcm7xx_clk_init(Object *obj)
> > > +{
> > > +    NPCM7xxCLKState *s =3D NPCM7XX_CLK(obj);
> > > +
> > > +    memory_region_init_io(&s->iomem, obj, &npcm7xx_clk_ops, s,
> > > +                          TYPE_NPCM7XX_CLK, 4 * KiB);
> > > +    sysbus_init_mmio(&s->parent, &s->iomem);
> > > +}
> > > +
> > > +static const VMStateDescription vmstate_npcm7xx_clk =3D {
> > > +    .name =3D "npcm7xx-clk",
> > > +    .version_id =3D 0,
> > > +    .minimum_version_id =3D 0,
> > > +    .fields =3D (VMStateField[]) {
> > > +        VMSTATE_UINT32_ARRAY(regs, NPCM7xxCLKState, NPCM7XX_CLK_NR_R=
EGS),
> >
> > Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> > Tested-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
> Thank you!
>
> > > +        VMSTATE_INT64(ref_ns, NPCM7xxCLKState),
> > > +        VMSTATE_END_OF_LIST(),
> > > +    },
> > > +};
> > > +
> > > +static void npcm7xx_clk_class_init(ObjectClass *klass, void *data)
> > > +{
> > > +    ResettableClass *rc =3D RESETTABLE_CLASS(klass);
> > > +    DeviceClass *dc =3D DEVICE_CLASS(klass);
> > > +
> > > +    QEMU_BUILD_BUG_ON(NPCM7XX_CLK_REGS_END > NPCM7XX_CLK_NR_REGS);
> > > +
> > > +    dc->desc =3D "NPCM7xx Clock Control Registers";
> > > +    dc->vmsd =3D &vmstate_npcm7xx_clk;
> > > +    rc->phases.enter =3D npcm7xx_clk_enter_reset;
> > > +}
> > > +
> > > +static const TypeInfo npcm7xx_clk_info =3D {
> > > +    .name               =3D TYPE_NPCM7XX_CLK,
> > > +    .parent             =3D TYPE_SYS_BUS_DEVICE,
> > > +    .instance_size      =3D sizeof(NPCM7xxCLKState),
> > > +    .instance_init      =3D npcm7xx_clk_init,
> > > +    .class_init         =3D npcm7xx_clk_class_init,
> > > +};
> > > +
> > > +static void npcm7xx_clk_register_type(void)
> > > +{
> > > +    type_register_static(&npcm7xx_clk_info);
> > > +}
> > > +type_init(npcm7xx_clk_register_type);
> > > diff --git a/hw/misc/meson.build b/hw/misc/meson.build
> > > index 99ffb9f9e8..531cc31dcc 100644
> > > --- a/hw/misc/meson.build
> > > +++ b/hw/misc/meson.build
> > > @@ -51,6 +51,7 @@ softmmu_ss.add(when: 'CONFIG_IMX', if_true: files(
> > >  softmmu_ss.add(when: 'CONFIG_MILKYMIST', if_true: files('milkymist-h=
pdmc.c', 'milkymist-pfpu.c'))
> > >  softmmu_ss.add(when: 'CONFIG_MAINSTONE', if_true: files('mst_fpga.c'=
))
> > >  softmmu_ss.add(when: 'CONFIG_NPCM7XX', if_true: files(
> > > +  'npcm7xx_clk.c',
> > >    'npcm7xx_gcr.c',
> > >  ))
> > >  softmmu_ss.add(when: 'CONFIG_OMAP', if_true: files(
> > > diff --git a/hw/misc/trace-events b/hw/misc/trace-events
> > > index dbf90db8ed..a010699b4f 100644
> > > --- a/hw/misc/trace-events
> > > +++ b/hw/misc/trace-events
> > > @@ -111,6 +111,10 @@ mos6522_set_sr_int(void) "set sr_int"
> > >  mos6522_write(uint64_t addr, uint64_t val) "reg=3D0x%"PRIx64 " val=
=3D0x%"PRIx64
> > >  mos6522_read(uint64_t addr, unsigned val) "reg=3D0x%"PRIx64 " val=3D=
0x%x"
> > >
> > > +# npcm7xx_clk.c
> > > +npcm7xx_clk_read(uint64_t offset, uint32_t value) " offset: 0x%04" P=
RIx64 " value: 0x%08" PRIx32
> > > +npcm7xx_clk_write(uint64_t offset, uint32_t value) "offset: 0x%04" P=
RIx64 " value: 0x%08" PRIx32
> > > +
> > >  # npcm7xx_gcr.c
> > >  npcm7xx_gcr_read(uint64_t offset, uint32_t value) " offset: 0x%04" P=
RIx64 " value: 0x%08" PRIx32
> > >  npcm7xx_gcr_write(uint64_t offset, uint32_t value) "offset: 0x%04" P=
RIx64 " value: 0x%08" PRIx32
> > >

