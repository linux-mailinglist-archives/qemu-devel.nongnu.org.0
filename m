Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 828E42CB23D
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 02:23:35 +0100 (CET)
Received: from localhost ([::1]:44172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkGrm-0003Mq-Ap
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 20:23:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenhuacai@gmail.com>)
 id 1kkGkn-0000ji-78
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 20:16:23 -0500
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43]:43495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chenhuacai@gmail.com>)
 id 1kkGki-0004hL-1K
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 20:16:20 -0500
Received: by mail-io1-xd43.google.com with SMTP id n14so219347iom.10
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 17:16:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=QIhSwWq6FWD8FknGCcvaJeSeo+MNG3oHIkInBFrWpWg=;
 b=XJVU2oowRB4YtWAXl95gkeOjuGJfgsFeLmiAQA0wyZ+7ecsl+u0w1b/EpwdlhcTZGJ
 Da2HwsZ/YsEdXrHGC7ttzDZQkEwB2ckd+FBWmDOyNGR+1oOhYPtanSOFiwU6hJPmbgyY
 ZyL4j99gKUHiYz8jxIwqeAefHdp7v8CS5VKDI6jKO4IjH4TtrgLfi7wXH+oPzdnnKMvJ
 TYzEOZZml7df4eYOJWZ65vTSsWAJI07cmlmy0OO0Pia5dKOvkCY1Hf0RAMWCgUaIzF7l
 oTMGOWFtwoRcabIAj+AEEw/4qfwbVSPugRiMLNTkIp8mjzjhHGLyDMBvLjdjfa04v4Cb
 avdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=QIhSwWq6FWD8FknGCcvaJeSeo+MNG3oHIkInBFrWpWg=;
 b=nsLd5qG643g6asVjzp4XY5TBgYVl7sRSqdscOK+ai0nk2J/iEQfJYt5e5q5ItHLrd8
 gTNZfONptq6h14512lomGeP6ULsE4pX+kJH0rOxJWH9+I48JBaY2lKAu9Tnu34sxIYZr
 +d8fj5UEs4Zf4QPykD+bCyn0oKfa7n3C/fYfgHxlHhA/U+D+Zs868WS7Ji5O9XCqIsS4
 ezagskSGuOUQEisURJNq+EQP+X/Mfwn2WOP0djhtIWtVWQYgH6MTVIdOXrrP3o9Che4B
 WxIM4Umq3YuveVmvpLYcCduE/9wIHSE+tHQZX7IJjpMHqmc+5yWa2rn5wQH2BvCEYCyy
 ZEag==
X-Gm-Message-State: AOAM532pB/zZx7VtFZG1yNK+QffAECAhl/F58Hgr3ZZFcY1l+teal14p
 h2Ey0MKFa5q+hV488LhIUzpLSykXb/QZeJUPQEE=
X-Google-Smtp-Source: ABdhPJzJlV5zwu7/D9JyMwY19TRXTgiStfAGQhlLSwl5V5Ec37wMGgXqa+d+l3p/IetdXJHuTsiJJByW8y0ukHlZViQ=
X-Received: by 2002:a02:c042:: with SMTP id u2mr87360jam.32.1606871773767;
 Tue, 01 Dec 2020 17:16:13 -0800 (PST)
MIME-Version: 1.0
References: <1604636510-8347-1-git-send-email-chenhc@lemote.com>
 <1604636510-8347-3-git-send-email-chenhc@lemote.com>
 <a70dae49-2a47-12bc-f580-640f032b78fd@amsat.org>
 <CAAhV-H7dTd0qgeV==je1PcAmJ4ZJNFkx1X_LDH2VqtZ+u6bvmQ@mail.gmail.com>
 <ef92e5cd-d348-5a74-e110-74458fe9a12a@amsat.org>
In-Reply-To: <ef92e5cd-d348-5a74-e110-74458fe9a12a@amsat.org>
From: Huacai Chen <chenhuacai@gmail.com>
Date: Wed, 2 Dec 2020 09:16:02 +0800
Message-ID: <CAAhV-H6_zP0f-7hhz4=o6+tu0A9oqjhG88anu0qAOxnjH=cptw@mail.gmail.com>
Subject: Re: [PATCH V17 2/6] hw/intc: Rework Loongson LIOINTC
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d43;
 envelope-from=chenhuacai@gmail.com; helo=mail-io1-xd43.google.com
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

Hi, Phillippe,

On Mon, Nov 30, 2020 at 6:08 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> On 11/28/20 7:19 AM, Huacai Chen wrote:
> > On Tue, Nov 24, 2020 at 4:52 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsa=
t.org> wrote:
> >> On 11/6/20 5:21 AM, Huacai Chen wrote:
> >>> As suggested by Philippe Mathieu-Daud=C3=A9, rework Loongson's lioint=
c:
> >>> 1, Move macro definitions to loongson_liointc.h;
> >>> 2, Remove magic values and use macros instead;
> >>> 3, Replace dead D() code by trace events.
> >>>
> >>> Suggested-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> >>> Signed-off-by: Huacai Chen <chenhc@lemote.com>
> >>> ---
> >>>  hw/intc/loongson_liointc.c         | 49 +++++++++++-----------------=
----------
> >>>  include/hw/intc/loongson_liointc.h | 39 ++++++++++++++++++++++++++++=
++
> >>>  2 files changed, 53 insertions(+), 35 deletions(-)
> >>>  create mode 100644 include/hw/intc/loongson_liointc.h
> >>>
> >>> diff --git a/hw/intc/loongson_liointc.c b/hw/intc/loongson_liointc.c
> >>> index fbbfb57..be29e2f 100644
> >>> --- a/hw/intc/loongson_liointc.c
> >>> +++ b/hw/intc/loongson_liointc.c
> >>> @@ -1,6 +1,7 @@
> >>>  /*
> >>>   * QEMU Loongson Local I/O interrupt controler.
> >>>   *
> >>> + * Copyright (c) 2020 Huacai Chen <chenhc@lemote.com>
> >>>   * Copyright (c) 2020 Jiaxun Yang <jiaxun.yang@flygoat.com>
> >>>   *
> >>>   * This program is free software: you can redistribute it and/or mod=
ify
> >>> @@ -19,33 +20,11 @@
> >>>   */
> >>>
> >>>  #include "qemu/osdep.h"
> >>> -#include "hw/sysbus.h"
> >>>  #include "qemu/module.h"
> >>> +#include "qemu/log.h"
> >>>  #include "hw/irq.h"
> >>>  #include "hw/qdev-properties.h"
> >>> -#include "qom/object.h"
> >>> -
> >>> -#define D(x)
> >>> -
> >>> -#define NUM_IRQS                32
> >>> -
> >>> -#define NUM_CORES               4
> >>> -#define NUM_IPS                 4
> >>> -#define NUM_PARENTS             (NUM_CORES * NUM_IPS)
> >>> -#define PARENT_COREx_IPy(x, y)  (NUM_IPS * x + y)
> >>> -
> >>> -#define R_MAPPER_START          0x0
> >>> -#define R_MAPPER_END            0x20
> >>> -#define R_ISR                   R_MAPPER_END
> >>> -#define R_IEN                   0x24
> >>> -#define R_IEN_SET               0x28
> >>> -#define R_IEN_CLR               0x2c
> >>> -#define R_PERCORE_ISR(x)        (0x40 + 0x8 * x)
> >>> -#define R_END                   0x64
> >>> -
> >>> -#define TYPE_LOONGSON_LIOINTC "loongson.liointc"
> >>> -DECLARE_INSTANCE_CHECKER(struct loongson_liointc, LOONGSON_LIOINTC,
> >>> -                         TYPE_LOONGSON_LIOINTC)
> >>> +#include "hw/intc/loongson_liointc.h"
> >>>
> >>>  struct loongson_liointc {
> >>>      SysBusDevice parent_obj;
> >>> @@ -123,14 +102,13 @@ liointc_read(void *opaque, hwaddr addr, unsigne=
d int size)
> >>>          goto out;
> >>>      }
> >>>
> >>> -    /* Rest is 4 byte */
> >>> +    /* Rest are 4 bytes */
> >>>      if (size !=3D 4 || (addr % 4)) {
> >>>          goto out;
> >>>      }
> >>>
> >>> -    if (addr >=3D R_PERCORE_ISR(0) &&
> >>> -        addr < R_PERCORE_ISR(NUM_CORES)) {
> >>> -        int core =3D (addr - R_PERCORE_ISR(0)) / 8;
> >>> +    if (addr >=3D R_START && addr < R_END) {
> >>> +        int core =3D (addr - R_START) / R_ISR_SIZE;
> >>>          r =3D p->per_core_isr[core];
> >>>          goto out;
> >>>      }
> >>> @@ -147,7 +125,8 @@ liointc_read(void *opaque, hwaddr addr, unsigned =
int size)
> >>>      }
> >>>
> >>>  out:
> >>> -    D(qemu_log("%s: size=3D%d addr=3D%lx val=3D%x\n", __func__, size=
, addr, r));
> >>> +    qemu_log_mask(CPU_LOG_INT, "%s: size=3D%d addr=3D%lx val=3D%x\n"=
,
> >>> +                  __func__, size, addr, r);
> >>>      return r;
> >>>  }
> >>>
> >>> @@ -158,7 +137,8 @@ liointc_write(void *opaque, hwaddr addr,
> >>>      struct loongson_liointc *p =3D opaque;
> >>>      uint32_t value =3D val64;
> >>>
> >>> -    D(qemu_log("%s: size=3D%d, addr=3D%lx val=3D%x\n", __func__, siz=
e, addr, value));
> >>> +    qemu_log_mask(CPU_LOG_INT, "%s: size=3D%d, addr=3D%lx val=3D%x\n=
",
> >>> +                  __func__, size, addr, value);
> >>>
> >>>      /* Mapper is 1 byte */
> >>>      if (size =3D=3D 1 && addr < R_MAPPER_END) {
> >>> @@ -166,14 +146,13 @@ liointc_write(void *opaque, hwaddr addr,
> >>>          goto out;
> >>>      }
> >>>
> >>> -    /* Rest is 4 byte */
> >>> +    /* Rest are 4 bytes */
> >>>      if (size !=3D 4 || (addr % 4)) {
> >>>          goto out;
> >>>      }
> >>>
> >>> -    if (addr >=3D R_PERCORE_ISR(0) &&
> >>> -        addr < R_PERCORE_ISR(NUM_CORES)) {
> >>> -        int core =3D (addr - R_PERCORE_ISR(0)) / 8;
> >>> +    if (addr >=3D R_START && addr < R_END) {
> >>> +        int core =3D (addr - R_START) / R_ISR_SIZE;
> >>>          p->per_core_isr[core] =3D value;
> >>>          goto out;
> >>>      }
> >>> @@ -224,7 +203,7 @@ static void loongson_liointc_init(Object *obj)
> >>>      }
> >>>
> >>>      memory_region_init_io(&p->mmio, obj, &pic_ops, p,
> >>> -                         "loongson.liointc", R_END);
> >>> +                         TYPE_LOONGSON_LIOINTC, R_END);
> >>>      sysbus_init_mmio(SYS_BUS_DEVICE(obj), &p->mmio);
> >>>  }
> >>>
> >>> diff --git a/include/hw/intc/loongson_liointc.h b/include/hw/intc/loo=
ngson_liointc.h
> >>> new file mode 100644
> >>> index 0000000..e11f482
> >>> --- /dev/null
> >>> +++ b/include/hw/intc/loongson_liointc.h
> >>> @@ -0,0 +1,39 @@
> >>> +/*
> >>> + * This file is subject to the terms and conditions of the GNU Gener=
al Public
> >>> + * License.  See the file "COPYING" in the main directory of this ar=
chive
> >>> + * for more details.
> >>> + *
> >>> + * Copyright (c) 2020 Huacai Chen <chenhc@lemote.com>
> >>> + * Copyright (c) 2020 Jiaxun Yang <jiaxun.yang@flygoat.com>
> >>> + *
> >>> + */
> >>> +
> >>> +#ifndef LOONSGON_LIOINTC_H
> >>> +#define LOONGSON_LIOINTC_H
> >>> +
> >>> +#include "qemu/units.h"
> >>> +#include "hw/sysbus.h"
> >>> +#include "qom/object.h"
> >>> +
> >>> +#define NUM_IRQS                32
> >>> +
> >>> +#define NUM_CORES               4
> >>> +#define NUM_IPS                 4
> >>> +#define NUM_PARENTS             (NUM_CORES * NUM_IPS)
> >>> +#define PARENT_COREx_IPy(x, y)  (NUM_IPS * x + y)
> >>> +
> >>> +#define R_MAPPER_START          0x0
> >>> +#define R_MAPPER_END            0x20
> >>> +#define R_ISR                   R_MAPPER_END
> >>> +#define R_IEN                   0x24
> >>> +#define R_IEN_SET               0x28
> >>> +#define R_IEN_CLR               0x2c
> >>> +#define R_ISR_SIZE              0x8
> >>> +#define R_START                 0x40
> >>> +#define R_END                   0x64
> >>
> >> Can we keep the R_* definitions local in the .c?
> >> (if you agree I can amend that when applying).
> > If put them in .c, then .h is to small..,
>
> Not a problem:
>
> include/hw/ppc/openpic_kvm.h
> include/hw/display/ramfb.h
> include/hw/input/lasips2.h
> include/hw/usb/chipidea.h
> include/hw/s390x/ap-bridge.h
> include/hw/char/lm32_juart.h
> include/hw/isa/vt82c686.h
> include/hw/net/lan9118.h
> include/hw/intc/imx_gpcv2.h
> include/hw/usb/xhci.h
OK, I will put all these macros in .c file.

Huacai
>
> > but TYPE_LOONGSON_LIOINTC
> > should be defined in .h since it will be used in other place.
> >
> > Huacai
> >>
> >> Thanks for cleaning!
> >>
> >> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> >>
> >>> +
> >>> +#define TYPE_LOONGSON_LIOINTC "loongson.liointc"
> >>> +DECLARE_INSTANCE_CHECKER(struct loongson_liointc, LOONGSON_LIOINTC,
> >>> +                         TYPE_LOONGSON_LIOINTC)
> >>> +
> >>> +#endif /* LOONGSON_LIOINTC_H */
> >>>
> >

