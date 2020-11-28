Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 318192C6F32
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Nov 2020 07:22:00 +0100 (CET)
Received: from localhost ([::1]:43778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kitcN-00032M-9y
	for lists+qemu-devel@lfdr.de; Sat, 28 Nov 2020 01:21:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenhuacai@gmail.com>)
 id 1kitb4-0002T0-6t
 for qemu-devel@nongnu.org; Sat, 28 Nov 2020 01:20:38 -0500
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141]:35455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chenhuacai@gmail.com>)
 id 1kitb2-0000zP-AD
 for qemu-devel@nongnu.org; Sat, 28 Nov 2020 01:20:37 -0500
Received: by mail-il1-x141.google.com with SMTP id t13so6457213ilp.2
 for <qemu-devel@nongnu.org>; Fri, 27 Nov 2020 22:20:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5Vf8O8jGO2BQbFkttwxJYvQmtoC4FuuN4mO+i3UunNo=;
 b=Gn+Xh3hatY9pdeyXEx1dXACi2cPcIHPRFn/3ajIeuH2ohZ/ibu9Lsewg75FYmE/Qug
 W+xO/Y31d/v+dL40h41BE6v3KbFzcGYeG9AhD7sV6uX5DBVwa13LN7ZLELXsy7Zntdcu
 8plzrssVBJdYW0mxfcCloRHyQ4PCiKZdWKxPK/Os0j/+9tN7Tdeacl//vwIGu+2nvi2M
 oypr6SnZA83BAkAL3sW+g+TukXnhigbwBC0QLb0NjzhYTP0F9VWhCV85A38qo92sFyra
 bnWgZ8ZcRj23GYqxiBSgI/ZA6Jj8yweYx6Q//XvEXOJ5XasrLo9Lnci1lHRABnr+igSD
 oH5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5Vf8O8jGO2BQbFkttwxJYvQmtoC4FuuN4mO+i3UunNo=;
 b=jT3oNn80xM68l/lE0M1U74cgYoPDf+NI0I0cLszydcmvlYl9NzG/1eKZXdqHZuLgnl
 WuFQ0IFavTuLhtWrtyxpAe1yXMiIqvu+KxL5w27A83NQQ7vUpeH20rp1zuz/DwnR5SDj
 y/6ACSascXpl1QkLFrLmLjNUpfYoONeATQmnjM7Bso2Yb0Xe9ubjOsgmTgB/GjhdNakK
 ghtUmX/Ev+Hrqf/OArCOMngUCQqJuCdEbdKozXy9KCXhIhVhn79kZ2qwKLt9iKYFO9Vs
 8LsWqLXtt9WWFLrJYqlsfm+U2bFq839BWNLK/PLN/jnWl+aqhaL2bW/36NlniNOrAWRq
 3UQA==
X-Gm-Message-State: AOAM531Delx1Im5ximcIKkDAqF6XoBoFzaM4d3qXkxcV+bmxSQ3zggSI
 9yyPp81BPEfXCsMqLmKSwsIDv51yX7YwPT7ZfdDjkxaChXE=
X-Google-Smtp-Source: ABdhPJy7oBC3vuPtZgmuBjgdSaeTTss8gtRZqq67eYct4dBdhWkYdLJOSK8wvZrdK2FMkkeaY9qGZfu8Q9mVDT1EBO4=
X-Received: by 2002:a05:6e02:be9:: with SMTP id
 d9mr10479651ilu.134.1606544435492; 
 Fri, 27 Nov 2020 22:20:35 -0800 (PST)
MIME-Version: 1.0
References: <1604636510-8347-1-git-send-email-chenhc@lemote.com>
 <1604636510-8347-3-git-send-email-chenhc@lemote.com>
 <a70dae49-2a47-12bc-f580-640f032b78fd@amsat.org>
 <a60e002b-b102-a7b9-3de7-bb355319f8e1@amsat.org>
In-Reply-To: <a60e002b-b102-a7b9-3de7-bb355319f8e1@amsat.org>
From: Huacai Chen <chenhuacai@gmail.com>
Date: Sat, 28 Nov 2020 14:20:24 +0800
Message-ID: <CAAhV-H7NpzqfCh+tEDkYUf63WqvymmPHewZccRuL3p7cMhN_ow@mail.gmail.com>
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

On Tue, Nov 24, 2020 at 6:24 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> On 11/23/20 9:52 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> > On 11/6/20 5:21 AM, Huacai Chen wrote:
> >> As suggested by Philippe Mathieu-Daud=C3=A9, rework Loongson's liointc=
:
> >> 1, Move macro definitions to loongson_liointc.h;
> >> 2, Remove magic values and use macros instead;
> >> 3, Replace dead D() code by trace events.
> >>
> >> Suggested-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> >> Signed-off-by: Huacai Chen <chenhc@lemote.com>
> >> ---
> >>  hw/intc/loongson_liointc.c         | 49 +++++++++++------------------=
---------
> >>  include/hw/intc/loongson_liointc.h | 39 +++++++++++++++++++++++++++++=
+
> >>  2 files changed, 53 insertions(+), 35 deletions(-)
> >>  create mode 100644 include/hw/intc/loongson_liointc.h
> >>
> >> diff --git a/hw/intc/loongson_liointc.c b/hw/intc/loongson_liointc.c
> >> index fbbfb57..be29e2f 100644
> >> --- a/hw/intc/loongson_liointc.c
> >> +++ b/hw/intc/loongson_liointc.c
> >> @@ -1,6 +1,7 @@
> >>  /*
> >>   * QEMU Loongson Local I/O interrupt controler.
> >>   *
> >> + * Copyright (c) 2020 Huacai Chen <chenhc@lemote.com>
> >>   * Copyright (c) 2020 Jiaxun Yang <jiaxun.yang@flygoat.com>
> >>   *
> >>   * This program is free software: you can redistribute it and/or modi=
fy
> >> @@ -19,33 +20,11 @@
> >>   */
> >>
> >>  #include "qemu/osdep.h"
> >> -#include "hw/sysbus.h"
> >>  #include "qemu/module.h"
> >> +#include "qemu/log.h"
> >>  #include "hw/irq.h"
> >>  #include "hw/qdev-properties.h"
> >> -#include "qom/object.h"
> >> -
> >> -#define D(x)
> >> -
> >> -#define NUM_IRQS                32
> >> -
> >> -#define NUM_CORES               4
> >> -#define NUM_IPS                 4
> >> -#define NUM_PARENTS             (NUM_CORES * NUM_IPS)
> >> -#define PARENT_COREx_IPy(x, y)  (NUM_IPS * x + y)
> >> -
> >> -#define R_MAPPER_START          0x0
> >> -#define R_MAPPER_END            0x20
> >> -#define R_ISR                   R_MAPPER_END
> >> -#define R_IEN                   0x24
> >> -#define R_IEN_SET               0x28
> >> -#define R_IEN_CLR               0x2c
> >> -#define R_PERCORE_ISR(x)        (0x40 + 0x8 * x)
> >> -#define R_END                   0x64
> >> -
> >> -#define TYPE_LOONGSON_LIOINTC "loongson.liointc"
> >> -DECLARE_INSTANCE_CHECKER(struct loongson_liointc, LOONGSON_LIOINTC,
> >> -                         TYPE_LOONGSON_LIOINTC)
> >> +#include "hw/intc/loongson_liointc.h"
> >>
> >>  struct loongson_liointc {
> >>      SysBusDevice parent_obj;
> >> @@ -123,14 +102,13 @@ liointc_read(void *opaque, hwaddr addr, unsigned=
 int size)
> >>          goto out;
> >>      }
> >>
> >> -    /* Rest is 4 byte */
> >> +    /* Rest are 4 bytes */
> >>      if (size !=3D 4 || (addr % 4)) {
> >>          goto out;
> >>      }
> >>
> >> -    if (addr >=3D R_PERCORE_ISR(0) &&
> >> -        addr < R_PERCORE_ISR(NUM_CORES)) {
> >> -        int core =3D (addr - R_PERCORE_ISR(0)) / 8;
> >> +    if (addr >=3D R_START && addr < R_END) {
> >> +        int core =3D (addr - R_START) / R_ISR_SIZE;
> >>          r =3D p->per_core_isr[core];
> >>          goto out;
> >>      }
> >> @@ -147,7 +125,8 @@ liointc_read(void *opaque, hwaddr addr, unsigned i=
nt size)
> >>      }
> >>
> >>  out:
> >> -    D(qemu_log("%s: size=3D%d addr=3D%lx val=3D%x\n", __func__, size,=
 addr, r));
> >> +    qemu_log_mask(CPU_LOG_INT, "%s: size=3D%d addr=3D%lx val=3D%x\n",
> >> +                  __func__, size, addr, r);
> >>      return r;
> >>  }
> >>
> >> @@ -158,7 +137,8 @@ liointc_write(void *opaque, hwaddr addr,
> >>      struct loongson_liointc *p =3D opaque;
> >>      uint32_t value =3D val64;
> >>
> >> -    D(qemu_log("%s: size=3D%d, addr=3D%lx val=3D%x\n", __func__, size=
, addr, value));
> >> +    qemu_log_mask(CPU_LOG_INT, "%s: size=3D%d, addr=3D%lx val=3D%x\n"=
,
> >> +                  __func__, size, addr, value);
> >>
> >>      /* Mapper is 1 byte */
> >>      if (size =3D=3D 1 && addr < R_MAPPER_END) {
> >> @@ -166,14 +146,13 @@ liointc_write(void *opaque, hwaddr addr,
> >>          goto out;
> >>      }
> >>
> >> -    /* Rest is 4 byte */
> >> +    /* Rest are 4 bytes */
> >>      if (size !=3D 4 || (addr % 4)) {
> >>          goto out;
> >>      }
> >>
> >> -    if (addr >=3D R_PERCORE_ISR(0) &&
> >> -        addr < R_PERCORE_ISR(NUM_CORES)) {
> >> -        int core =3D (addr - R_PERCORE_ISR(0)) / 8;
> >> +    if (addr >=3D R_START && addr < R_END) {
> >> +        int core =3D (addr - R_START) / R_ISR_SIZE;
> >>          p->per_core_isr[core] =3D value;
> >>          goto out;
> >>      }
> >> @@ -224,7 +203,7 @@ static void loongson_liointc_init(Object *obj)
> >>      }
> >>
> >>      memory_region_init_io(&p->mmio, obj, &pic_ops, p,
> >> -                         "loongson.liointc", R_END);
> >> +                         TYPE_LOONGSON_LIOINTC, R_END);
> >>      sysbus_init_mmio(SYS_BUS_DEVICE(obj), &p->mmio);
> >>  }
> >>
> >> diff --git a/include/hw/intc/loongson_liointc.h b/include/hw/intc/loon=
gson_liointc.h
> >> new file mode 100644
> >> index 0000000..e11f482
> >> --- /dev/null
> >> +++ b/include/hw/intc/loongson_liointc.h
> >> @@ -0,0 +1,39 @@
> >> +/*
> >> + * This file is subject to the terms and conditions of the GNU Genera=
l Public
> >> + * License.  See the file "COPYING" in the main directory of this arc=
hive
> >> + * for more details.
> >> + *
> >> + * Copyright (c) 2020 Huacai Chen <chenhc@lemote.com>
> >> + * Copyright (c) 2020 Jiaxun Yang <jiaxun.yang@flygoat.com>
> >> + *
> >> + */
> >> +
> >> +#ifndef LOONSGON_LIOINTC_H
> >> +#define LOONGSON_LIOINTC_H
>
> Clang is smart:
>
> hw/intc/loongson_liointc.h:11:9: error: 'LOONSGON_LIOINTC_H' is used as
> a header guard here, followed by #define of a different macro
> [-Werror,-Wheader-guard]
> #ifndef LOONSGON_LIOINTC_H
>         ^~~~~~~~~~~~~~~~~~
> include/hw/intc/loongson_liointc.h:12:9: note: 'LOONGSON_LIOINTC_H' is
> defined here; did you mean 'LOONSGON_LIOINTC_H'?
> #define LOONGSON_LIOINTC_H
>         ^~~~~~~~~~~~~~~~~~
>         LOONSGON_LIOINTC_H
> 1 error generated.
>
> Once fixed:
> Tested-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
OK, will be fixed in the next version.

>
> >> +
> >> +#include "qemu/units.h"
> >> +#include "hw/sysbus.h"
> >> +#include "qom/object.h"
> >> +
> >> +#define NUM_IRQS                32
> >> +
> >> +#define NUM_CORES               4
> >> +#define NUM_IPS                 4
> >> +#define NUM_PARENTS             (NUM_CORES * NUM_IPS)
> >> +#define PARENT_COREx_IPy(x, y)  (NUM_IPS * x + y)
> >> +
> >> +#define R_MAPPER_START          0x0
> >> +#define R_MAPPER_END            0x20
> >> +#define R_ISR                   R_MAPPER_END
> >> +#define R_IEN                   0x24
> >> +#define R_IEN_SET               0x28
> >> +#define R_IEN_CLR               0x2c
> >> +#define R_ISR_SIZE              0x8
> >> +#define R_START                 0x40
> >> +#define R_END                   0x64
> >
> > Can we keep the R_* definitions local in the .c?
> > (if you agree I can amend that when applying).
> >
> > Thanks for cleaning!
> >
> > Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> >
> >> +
> >> +#define TYPE_LOONGSON_LIOINTC "loongson.liointc"
> >> +DECLARE_INSTANCE_CHECKER(struct loongson_liointc, LOONGSON_LIOINTC,
> >> +                         TYPE_LOONGSON_LIOINTC)
> >> +
> >> +#endif /* LOONGSON_LIOINTC_H */
> >>
> >

