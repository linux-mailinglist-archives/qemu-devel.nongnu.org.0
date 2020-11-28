Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF832C6F31
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Nov 2020 07:20:38 +0100 (CET)
Received: from localhost ([::1]:41640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kitb2-00028x-PB
	for lists+qemu-devel@lfdr.de; Sat, 28 Nov 2020 01:20:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenhuacai@gmail.com>)
 id 1kitaB-0001hb-3f
 for qemu-devel@nongnu.org; Sat, 28 Nov 2020 01:19:43 -0500
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141]:34738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chenhuacai@gmail.com>)
 id 1kita8-0000hR-TP
 for qemu-devel@nongnu.org; Sat, 28 Nov 2020 01:19:42 -0500
Received: by mail-il1-x141.google.com with SMTP id x15so6462850ilq.1
 for <qemu-devel@nongnu.org>; Fri, 27 Nov 2020 22:19:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8SjmXoCdPiIeO3z4Zqt/Xv4VHERWTH2BZJjm/XXYDg4=;
 b=jT9Monorf6eHjc377ASSXUhJIXzYqIK3D07V3oYzW44dDYctgGdh1aA4lR4QpchfvB
 5in+kD3ppv7e5TOnhdccGPsfdDUYe7OUBhChWwVvGxCgMghqtiUHghmDYjD2Q5Xeuq45
 6GGElyDskPRmiRMc1awbhNUavNgAG1935H5bTZaf6HTGi8zI3Ug71B+s1a3UoUk/EY1d
 o+aWbKIipqlda+3sjc5nTipSnjyogd8N/A1CwG/Gt+UIT1fluyTJVKxhQCr2xHpx4IkB
 b8Hm3NHUVTLr5mPqSWU8kl/Eqr/jxS+gBIjV0U+2ieQ6qMYiaKnbhN7PwjqPKq+mYylc
 OCzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8SjmXoCdPiIeO3z4Zqt/Xv4VHERWTH2BZJjm/XXYDg4=;
 b=b2hvBKiXG7AlG9FoGUiFeLvK1+hmq2vrzjlzX0magDn8mUKOq00zVZA9j//+AINALn
 AJDBZOYev8GFVcwnzmOPYS7FYCnoAx77u7pHZn14sR2eY3WVujF2LbcX0sUsP6sEUkOe
 pSYR8zrwDZlBzgyKV5uMXzUPBqciLtvXOFgw0F5gl52iKqUMbBZNmk6/ug6whNzGVyyw
 rmPThRSDIqCTPUTh1LVxCNyYDyUK7bGNfoLPp/6HFK+P2IFygpSjka3/8DyIH0KOHvlK
 /9cqKJVnZlmEmGNXWci8CUOpfmqM/y4VTg0wZMMeqoMoVqPCQJdBo4DmMheReiJrHj25
 BTaA==
X-Gm-Message-State: AOAM53283MEHpuvJBb65kuimK8ji+PCe75Bi8BY4+t8yukOQFXeZHXT+
 n9uFeYLJKiTIpOXTawPFa2HxjpJfLqBbHpiWBEc=
X-Google-Smtp-Source: ABdhPJyOQqVK/ok8hLKZVRQFdALrG37dImjQ1M3CfPiqgQkADBE06RTP/F/TIpuozYD6RyFfRW9Zk//o0zVRSB/woGA=
X-Received: by 2002:a92:85c5:: with SMTP id
 f188mr10475600ilh.173.1606544379133; 
 Fri, 27 Nov 2020 22:19:39 -0800 (PST)
MIME-Version: 1.0
References: <1604636510-8347-1-git-send-email-chenhc@lemote.com>
 <1604636510-8347-3-git-send-email-chenhc@lemote.com>
 <a70dae49-2a47-12bc-f580-640f032b78fd@amsat.org>
In-Reply-To: <a70dae49-2a47-12bc-f580-640f032b78fd@amsat.org>
From: Huacai Chen <chenhuacai@gmail.com>
Date: Sat, 28 Nov 2020 14:19:27 +0800
Message-ID: <CAAhV-H7dTd0qgeV==je1PcAmJ4ZJNFkx1X_LDH2VqtZ+u6bvmQ@mail.gmail.com>
Subject: Re: [PATCH V17 2/6] hw/intc: Rework Loongson LIOINTC
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::141;
 envelope-from=chenhuacai@gmail.com; helo=mail-il1-x141.google.com
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
Cc: Huacai Chen <zltjiangshi@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Philippe,

On Tue, Nov 24, 2020 at 4:52 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> On 11/6/20 5:21 AM, Huacai Chen wrote:
> > As suggested by Philippe Mathieu-Daud=C3=A9, rework Loongson's liointc:
> > 1, Move macro definitions to loongson_liointc.h;
> > 2, Remove magic values and use macros instead;
> > 3, Replace dead D() code by trace events.
> >
> > Suggested-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> > Signed-off-by: Huacai Chen <chenhc@lemote.com>
> > ---
> >  hw/intc/loongson_liointc.c         | 49 +++++++++++-------------------=
--------
> >  include/hw/intc/loongson_liointc.h | 39 ++++++++++++++++++++++++++++++
> >  2 files changed, 53 insertions(+), 35 deletions(-)
> >  create mode 100644 include/hw/intc/loongson_liointc.h
> >
> > diff --git a/hw/intc/loongson_liointc.c b/hw/intc/loongson_liointc.c
> > index fbbfb57..be29e2f 100644
> > --- a/hw/intc/loongson_liointc.c
> > +++ b/hw/intc/loongson_liointc.c
> > @@ -1,6 +1,7 @@
> >  /*
> >   * QEMU Loongson Local I/O interrupt controler.
> >   *
> > + * Copyright (c) 2020 Huacai Chen <chenhc@lemote.com>
> >   * Copyright (c) 2020 Jiaxun Yang <jiaxun.yang@flygoat.com>
> >   *
> >   * This program is free software: you can redistribute it and/or modif=
y
> > @@ -19,33 +20,11 @@
> >   */
> >
> >  #include "qemu/osdep.h"
> > -#include "hw/sysbus.h"
> >  #include "qemu/module.h"
> > +#include "qemu/log.h"
> >  #include "hw/irq.h"
> >  #include "hw/qdev-properties.h"
> > -#include "qom/object.h"
> > -
> > -#define D(x)
> > -
> > -#define NUM_IRQS                32
> > -
> > -#define NUM_CORES               4
> > -#define NUM_IPS                 4
> > -#define NUM_PARENTS             (NUM_CORES * NUM_IPS)
> > -#define PARENT_COREx_IPy(x, y)  (NUM_IPS * x + y)
> > -
> > -#define R_MAPPER_START          0x0
> > -#define R_MAPPER_END            0x20
> > -#define R_ISR                   R_MAPPER_END
> > -#define R_IEN                   0x24
> > -#define R_IEN_SET               0x28
> > -#define R_IEN_CLR               0x2c
> > -#define R_PERCORE_ISR(x)        (0x40 + 0x8 * x)
> > -#define R_END                   0x64
> > -
> > -#define TYPE_LOONGSON_LIOINTC "loongson.liointc"
> > -DECLARE_INSTANCE_CHECKER(struct loongson_liointc, LOONGSON_LIOINTC,
> > -                         TYPE_LOONGSON_LIOINTC)
> > +#include "hw/intc/loongson_liointc.h"
> >
> >  struct loongson_liointc {
> >      SysBusDevice parent_obj;
> > @@ -123,14 +102,13 @@ liointc_read(void *opaque, hwaddr addr, unsigned =
int size)
> >          goto out;
> >      }
> >
> > -    /* Rest is 4 byte */
> > +    /* Rest are 4 bytes */
> >      if (size !=3D 4 || (addr % 4)) {
> >          goto out;
> >      }
> >
> > -    if (addr >=3D R_PERCORE_ISR(0) &&
> > -        addr < R_PERCORE_ISR(NUM_CORES)) {
> > -        int core =3D (addr - R_PERCORE_ISR(0)) / 8;
> > +    if (addr >=3D R_START && addr < R_END) {
> > +        int core =3D (addr - R_START) / R_ISR_SIZE;
> >          r =3D p->per_core_isr[core];
> >          goto out;
> >      }
> > @@ -147,7 +125,8 @@ liointc_read(void *opaque, hwaddr addr, unsigned in=
t size)
> >      }
> >
> >  out:
> > -    D(qemu_log("%s: size=3D%d addr=3D%lx val=3D%x\n", __func__, size, =
addr, r));
> > +    qemu_log_mask(CPU_LOG_INT, "%s: size=3D%d addr=3D%lx val=3D%x\n",
> > +                  __func__, size, addr, r);
> >      return r;
> >  }
> >
> > @@ -158,7 +137,8 @@ liointc_write(void *opaque, hwaddr addr,
> >      struct loongson_liointc *p =3D opaque;
> >      uint32_t value =3D val64;
> >
> > -    D(qemu_log("%s: size=3D%d, addr=3D%lx val=3D%x\n", __func__, size,=
 addr, value));
> > +    qemu_log_mask(CPU_LOG_INT, "%s: size=3D%d, addr=3D%lx val=3D%x\n",
> > +                  __func__, size, addr, value);
> >
> >      /* Mapper is 1 byte */
> >      if (size =3D=3D 1 && addr < R_MAPPER_END) {
> > @@ -166,14 +146,13 @@ liointc_write(void *opaque, hwaddr addr,
> >          goto out;
> >      }
> >
> > -    /* Rest is 4 byte */
> > +    /* Rest are 4 bytes */
> >      if (size !=3D 4 || (addr % 4)) {
> >          goto out;
> >      }
> >
> > -    if (addr >=3D R_PERCORE_ISR(0) &&
> > -        addr < R_PERCORE_ISR(NUM_CORES)) {
> > -        int core =3D (addr - R_PERCORE_ISR(0)) / 8;
> > +    if (addr >=3D R_START && addr < R_END) {
> > +        int core =3D (addr - R_START) / R_ISR_SIZE;
> >          p->per_core_isr[core] =3D value;
> >          goto out;
> >      }
> > @@ -224,7 +203,7 @@ static void loongson_liointc_init(Object *obj)
> >      }
> >
> >      memory_region_init_io(&p->mmio, obj, &pic_ops, p,
> > -                         "loongson.liointc", R_END);
> > +                         TYPE_LOONGSON_LIOINTC, R_END);
> >      sysbus_init_mmio(SYS_BUS_DEVICE(obj), &p->mmio);
> >  }
> >
> > diff --git a/include/hw/intc/loongson_liointc.h b/include/hw/intc/loong=
son_liointc.h
> > new file mode 100644
> > index 0000000..e11f482
> > --- /dev/null
> > +++ b/include/hw/intc/loongson_liointc.h
> > @@ -0,0 +1,39 @@
> > +/*
> > + * This file is subject to the terms and conditions of the GNU General=
 Public
> > + * License.  See the file "COPYING" in the main directory of this arch=
ive
> > + * for more details.
> > + *
> > + * Copyright (c) 2020 Huacai Chen <chenhc@lemote.com>
> > + * Copyright (c) 2020 Jiaxun Yang <jiaxun.yang@flygoat.com>
> > + *
> > + */
> > +
> > +#ifndef LOONSGON_LIOINTC_H
> > +#define LOONGSON_LIOINTC_H
> > +
> > +#include "qemu/units.h"
> > +#include "hw/sysbus.h"
> > +#include "qom/object.h"
> > +
> > +#define NUM_IRQS                32
> > +
> > +#define NUM_CORES               4
> > +#define NUM_IPS                 4
> > +#define NUM_PARENTS             (NUM_CORES * NUM_IPS)
> > +#define PARENT_COREx_IPy(x, y)  (NUM_IPS * x + y)
> > +
> > +#define R_MAPPER_START          0x0
> > +#define R_MAPPER_END            0x20
> > +#define R_ISR                   R_MAPPER_END
> > +#define R_IEN                   0x24
> > +#define R_IEN_SET               0x28
> > +#define R_IEN_CLR               0x2c
> > +#define R_ISR_SIZE              0x8
> > +#define R_START                 0x40
> > +#define R_END                   0x64
>
> Can we keep the R_* definitions local in the .c?
> (if you agree I can amend that when applying).
If put them in .c, then .h is to small.., but TYPE_LOONGSON_LIOINTC
should be defined in .h since it will be used in other place.

Huacai
>
> Thanks for cleaning!
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
> > +
> > +#define TYPE_LOONGSON_LIOINTC "loongson.liointc"
> > +DECLARE_INSTANCE_CHECKER(struct loongson_liointc, LOONGSON_LIOINTC,
> > +                         TYPE_LOONGSON_LIOINTC)
> > +
> > +#endif /* LOONGSON_LIOINTC_H */
> >

