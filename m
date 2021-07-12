Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F0B3C60B8
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 18:38:15 +0200 (CEST)
Received: from localhost ([::1]:46300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2ywg-0005PR-AV
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 12:38:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.baluta@gmail.com>)
 id 1m2wRn-00018R-1H; Mon, 12 Jul 2021 09:58:11 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:50863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <daniel.baluta@gmail.com>)
 id 1m2wRk-0003fS-M7; Mon, 12 Jul 2021 09:58:10 -0400
Received: by mail-wm1-x32d.google.com with SMTP id l6so3195113wmq.0;
 Mon, 12 Jul 2021 06:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=wj/cUzJkdOIt4LmqdlFU45SJTSn3DdUvFL0Abm2lGrg=;
 b=HDuzWnhI9PSB/HPzQBtMSM5wuCTkSyYnm1qjfIUsRSOFDWaUCbI9OoYLngAr0FFc0Y
 8awWYvkmG/k7b+bOzFFekaGsFo+3ln2WIx1Pyd9TXQPFtArR9EKeU2gO6ykejunjxODo
 TMzoCEMWZF/6QIZQ4C+OyHjbeGlS+aViChpZ0xgKaF1a1bwR9qiMJklDAA0jr3JSYfDW
 yrg81mGy4Ta9FlQBbPkHc35bNlT55qSivyeCuEtAWDQdViEnuEKh8DlhHoYbrEKmLUMl
 2PwPHXFznz2+Th7gxAPaiuG38LDlZycizZxSA/XHvFHNi6A4eDcRSvDlQNhXJsUsIa3h
 MnLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wj/cUzJkdOIt4LmqdlFU45SJTSn3DdUvFL0Abm2lGrg=;
 b=HmC82oHXA5aRC4V8p5yalQsITIX031HgHs7yATsvuycaDcSBoOVlf/dI9KNFoFdDyf
 i07HP4eePNcdRU2Ms9ZTgO8/ouwdYEKl3fu/OML1gjUDPHkRqBAWLd+351UoadQV0xa4
 tZkhWfGhEHGNL8uqZkdn0NGJS+uyQgamISGGu2H9UDTD6/l5euBRp590utX5D8J4QuY3
 MI0g+dkBJtHfG09gv30KRJpuBw5ESgAuCWBZAQwNIzdYb41rGVPOPaH1wtrqw5qiuRWR
 kXpaLwenl4mIAlNjLV72oJIXAhjSzjC1uV4EC05ru5QCA98rCEQYmqCCKOFTLWaNGl36
 drhg==
X-Gm-Message-State: AOAM5332ZHJ01cYqsUm4VLTgfm+dqDP+iha7R6JcW7pp+/VMkfEAYcsb
 qRhpmygjO7fiqo+Ir0Lhdm9ziSlycP9EnDMj/xA=
X-Google-Smtp-Source: ABdhPJy8RIPfX4I/e5nPQVhuEsvExdgWrdUOt1qhtxnqV0ePwoDCVF/4uawKCY14G4AnwOXewcFk1fu6Qw/1w+MAgRI=
X-Received: by 2002:a7b:c002:: with SMTP id c2mr55468786wmb.118.1626098284293; 
 Mon, 12 Jul 2021 06:58:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210707113937.72602-1-daniel.baluta@oss.nxp.com>
 <CAFEAcA_L7nrw4zBV7pKYcV+H+4qJT60PFkJYA_w-8FSwOqNmXw@mail.gmail.com>
In-Reply-To: <CAFEAcA_L7nrw4zBV7pKYcV+H+4qJT60PFkJYA_w-8FSwOqNmXw@mail.gmail.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 12 Jul 2021 16:57:50 +0300
Message-ID: <CAEnQRZCJC4WmrGy6NnMmwUkscjn-HcOQmvni580t58b4s7pFKQ@mail.gmail.com>
Subject: Re: [PATCH] hw: timer: Add i.MX sysctr timer implementation
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=daniel.baluta@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 12 Jul 2021 12:37:15 -0400
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
Cc: Mancas Viorica <vioricamancas@yahoo.com>,
 Daniel Baluta <daniel.baluta@oss.nxp.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 7, 2021 at 10:21 PM Peter Maydell <peter.maydell@linaro.org> wr=
ote:
>
> On Wed, 7 Jul 2021 at 12:39, Daniel Baluta <daniel.baluta@oss.nxp.com> wr=
ote:
> >
> > From: Viorica Mancas <vioricamancas@yahoo.com>
> >
> > The System Counter (SYS_CTR) is a programmable system counter, which pr=
ovides a
> > shared time base to multiple processors. It is intended for application=
s where the counter
> > is always powered on, and supports multiple unrelated clocks.
> >
> > This system counter can be found on NXP i.MX8MN.
> >
> > Signed-off-by: Viorica Mancas <vioricamancas@yahoo.com>
> > Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
>
> Is there a board model or an update to an existing board that
> would use this device? We don't usually take device models that
> are completely unused upstream.

Hi Peter,

This can be found in i.MX8MN board. Should we add this patch together
with the upcoming patches for i.MX8?

We tried first to upstream the low hanging fruits. :)

Thanks for review. Will address them in the next versions.

>
> In the meantime, some high-level review notes below.
>
> > +#ifndef DEBUG_IMX_SYSCTR
> > +#define DEBUG_IMX_SYSCTR 0
> > +#endif
> > +
> > +#define DPRINTF(fmt, args...) \
> > +    do { \
> > +        if (DEBUG_IMX_SYSCTR) { \
> > +            fprintf(stderr, "[%s]%s: " fmt , TYPE_IMX_SYSCTR_TIMER, \
> > +                                             __func__, ##args); \
> > +        } \
> > +    } while (0)
>
> Avoid DPRINTF in new code, please; prefer tracepoints.
>
> > +#define low(x) (x & 0xFFFFFFFFLL)
> > +#define high(x) (x >> 32)
> > +
> > +#define CLEAR_LOW_MASK (0xFFFFFFFFUL << 32)
> > +#define CLEAR_HIGH_MASK (0xFFFFFFFF)
>
> Don't define your own access/masking stuff like this -- prefer
> eg extract64(), deposit64(), or the FIELD macros from
> registerfields.h.
>
> > +static void imx_sysctr_timer_init(Object *obj)
> > +{
> > +    IMXSysctrState *t =3D IMX_SYSCTR_TIMER(obj);
> > +
> > +    sysbus_init_irq(SYS_BUS_DEVICE(obj), &t->irq);
>
> You might as well put this in realize with the mmio
> init call, and avoid having to have an init method.
>
> > +static void imx_sysctr_timer_realize(DeviceState *dev, Error **errp)
> > +{
> > +    IMXSysctrState *s =3D IMX_SYSCTR_TIMER(dev);
> > +
> > +    memory_region_init_io(&s->iomem,
> > +                            OBJECT(s),
> > +                            &timer_ops,
> > +                            s,
> > +                            TYPE_IMX_SYSCTR_TIMER,
> > +                            0x20000);
> > +    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->iomem);
> > +
> > +    s->timer =3D ptimer_init(imx_sysctr_timeout, s, PTIMER_POLICY_DEFA=
ULT);
>
> Almost no device wants the default policy -- it is
> defined as "the somewhat broken thing that ptimer has
> traditionally done, to avoid changing behaviour of
> existing device models". Have a look at the policy flags
> to see which ones you want -- there's a comment in ptimer.h
> explaining them.
>
> > +
> > +    /* the default freq is 24Mhz and divided by 3*/
> > +    ptimer_transaction_begin(s->timer);
> > +    ptimer_set_freq(s->timer, 24000000 / 3);
> > +    ptimer_transaction_commit(s->timer);
> > +}
> > +
> > +static void imx_sysctr_timer_reset(DeviceState *dev)
> > +{
> > +    IMXSysctrState *s =3D IMX_SYSCTR_TIMER(dev);
> > +
> > +    ptimer_transaction_begin(s->timer);
> > +    /* stop timer */
> > +    ptimer_stop(s->timer);
> > +    s->cmpcr =3D 0;
> > +    s->cmpcv =3D 0;
> > +    s->cnt =3D 0;
> > +
> > +    s->next_timeout =3D SYSCTR_TIMER_MAX;
> > +
> > +    ptimer_set_limit(s->timer, SYSCTR_TIMER_MAX, 1);
> > +
> > +    /* if the timer is still enabled, restart it */
> > +    if ((s->cmpcr & SYSCTR_CMPCR_EN)) {
> > +        ptimer_run(s->timer, 1);
>
> You just zeroed cmpcr, this can never happen.
>
> > +    }
> > +    ptimer_transaction_commit(s->timer);
> > +
> > +    DPRINTF("System counter was reset\n");
> > +
> > +}
> > +
> > +static void imx_sysctr_timer_class_init(ObjectClass *klass, void *data=
)
> > +{
> > +    DeviceClass *dc =3D DEVICE_CLASS(klass);
> > +
> > +    dc->realize =3D imx_sysctr_timer_realize;
> > +    dc->reset =3D imx_sysctr_timer_reset;
>
> All new devices should have a vmstate struct so that snapshot
> and migration work.
>
> > +}
> > +
> > +static const TypeInfo imx_sysctr_timer_info =3D {
> > +    .name          =3D TYPE_IMX_SYSCTR_TIMER,
> > +    .parent        =3D TYPE_SYS_BUS_DEVICE,
> > +    .instance_size =3D sizeof(IMXSysctrState),
> > +    .instance_init =3D imx_sysctr_timer_init,
> > +    .class_init    =3D imx_sysctr_timer_class_init,
> > +};
> > +
> > +static void imx_sysctr_timer_register_types(void)
> > +{
> > +    type_register_static(&imx_sysctr_timer_info);
> > +}
> > +
> > +type_init(imx_sysctr_timer_register_types)
> > +
> > +static const char *imx_sysctr_timer_reg_name(uint32_t reg)
>
> I would move this function further up -- the usual convention is
> that the type_init stuff is the last thing in the file. If
> you put it near the top of the file you won't need the
> separate prototype for it that you currently have.
>
> > +{
> > +    switch (reg) {
> > +    case CMPCR:
> > +        return "CMPCR";
> > +    case CMPCV_LO:
> > +        return "CMPCV_LO";
> > +    case CMPCV_HI:
> > +        return "CMPCV_HI";
> > +    case CNTCV_HI:
> > +        return "CNTCV_HI";
> > +    case CNTCV_LO:
> > +        return "CNTCV_LO";
> > +    default:
> > +        return "[?]";
> > +    }
> > +}
> > \ No newline at end of file
>
> Fix the missing newline :-)
>
> > diff --git a/hw/timer/meson.build b/hw/timer/meson.build
> > index 598d058506..b6cd52a0b1 100644
> > --- a/hw/timer/meson.build
> > +++ b/hw/timer/meson.build
> > @@ -19,6 +19,7 @@ softmmu_ss.add(when: 'CONFIG_HPET', if_true: files('h=
pet.c'))
> >  softmmu_ss.add(when: 'CONFIG_I8254', if_true: files('i8254_common.c', =
'i8254.c'))
> >  softmmu_ss.add(when: 'CONFIG_IMX', if_true: files('imx_epit.c'))
> >  softmmu_ss.add(when: 'CONFIG_IMX', if_true: files('imx_gpt.c'))
> > +softmmu_ss.add(when: 'CONFIG_IMX', if_true: files('imx_sysctr_timer.c'=
))
> >  softmmu_ss.add(when: 'CONFIG_LM32_DEVICES', if_true: files('lm32_timer=
.c'))
> >  softmmu_ss.add(when: 'CONFIG_MILKYMIST', if_true: files('milkymist-sys=
ctl.c'))
> >  softmmu_ss.add(when: 'CONFIG_MIPS_CPS', if_true: files('mips_gictimer.=
c'))
> > diff --git a/include/hw/timer/imx_sysctr_timer.h b/include/hw/timer/imx=
_sysctr_timer.h
> > new file mode 100644
> > index 0000000000..c36ae9b393
> > --- /dev/null
> > +++ b/include/hw/timer/imx_sysctr_timer.h
> > @@ -0,0 +1,84 @@
> > +/*
> > + * QEMU NXP Sysctr Timer
> > + *
> > + * Author: Viorica Mancas <vioricamancas@yahoo.com>
> > + *
> > + * Permission is hereby granted, free of charge, to any person obtaini=
ng a copy
> > + * of this software and associated documentation files (the "Software"=
), to deal
> > + * in the Software without restriction, including without limitation t=
he rights
> > + * to use, copy, modify, merge, publish, distribute, sublicense, and/o=
r sell
> > + * copies of the Software, and to permit persons to whom the Software =
is
> > + * furnished to do so, subject to the following conditions:
> > + *
> > + * The above copyright notice and this permission notice shall be incl=
uded in
> > + * all copies or substantial portions of the Software.
> > + *
> > + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXP=
RESS OR
> > + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABI=
LITY,
> > + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT S=
HALL
> > + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES O=
R OTHER
> > + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARI=
SING FROM,
> > + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALI=
NGS IN
> > + * THE SOFTWARE.
> > + */
> > +
> > +#ifndef IMX_SYSCTR_H
> > +#define IMX_SYSCTR_H
> > +
> > +#include "hw/sysbus.h"
> > +#include "hw/ptimer.h"
> > +#include "hw/misc/imx_ccm.h"
> > +#include "qom/object.h"
> > +
> > +/*
> > + * sysctr : System counter
> > + *
> > + * The System Counter inputs two counter clock sources and outputs a c=
ounter
> > + * value and interrupt signals (one per compare frame) to the platform=
=E2=80=99s
> > + * interrupt controller.
> > + */
> > +
> > +/* The counter in the timer is 56 bits (first 8 are 0) */
> > +#define SYSCTR_TIMER_MAX  0X00FFFFFFFFFFFFFFUL
>
> defining this as MAKE_64BIT_MASK(0, 56) would save
> people counting all those 'F's :-)
>
> > +
> > +/* addresses */
> > +#define CMP_OFFSET     0x10000
> > +
> > +#define CNTCV_LO       0x8
> > +#define CNTCV_HI       0xc
> > +#define CMPCV_LO       (CMP_OFFSET + 0x20)
> > +#define CMPCV_HI       (CMP_OFFSET + 0x24)
> > +#define CMPCR          (CMP_OFFSET + 0x2c)
>
> Not obligatory, but you might consider using the REG32() macro
> from registerfields.h for defining register offset values.
>
> Do these defines really need to be public, or could they be put
> in the .c file ? Generally the .h file has the stuff that users
> of the device need, and anything that's purely internal to the
> implementation goes in the .c file.
>
> > +
> > +/* Control register.  Not all of these bits have any effect (yet) */
> > +#define SYSCTR_CMPCR_EN        (1 << 0)  /*  Enable */
> > +#define SYSCTR_CMPCR_IMASK     (1 << 1)  /*  Enable */
> > +#define SYSCTR_CMPCR_ISTAT     (1 << 2)  /*  Compare (interrupt) statu=
s (read only) */
> > +/* interupt condition: ISTAT =3D (CNTCV >=3D CMPCV) */
> > +
> > +#define CMPCR_WRITE (SYSCTR_CMPCR_IMASK | SYSCTR_CMPCR_EN)
> > +
> > +#define TYPE_IMX_SYSCTR_TIMER "imx.sysctr-timer"
> > +
> > +typedef struct IMXSysctrState IMXSysctrState;
> > +DECLARE_INSTANCE_CHECKER(IMXSysctrState, IMX_SYSCTR_TIMER,
> > +                         TYPE_IMX_SYSCTR_TIMER)
>
> Prefer OBJECT_DECLARE_SIMPLE_TYPE, which will do the typedef
> for you.
>
> > +
> > +struct IMXSysctrState {
> > +    /*< private >*/
> > +    SysBusDevice parent_obj;
> > +
> > +    /*< public >*/
> > +    ptimer_state *timer;
> > +    MemoryRegion  iomem;
> > +
> > +    qemu_irq irq;
> > +
> > +    uint32_t cmpcr; /* Compare Control Register */
> > +    uint64_t cnt;   /* Counter on 56 bits */
> > +    uint64_t cmpcv; /* Compare Count Value */
> > +
> > +    uint64_t next_timeout;
> > +};
> > +
> > +#endif /* IMX_SYSCTR_H */
>
> thanks
> -- PMM

