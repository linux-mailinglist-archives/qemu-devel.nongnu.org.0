Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5693B7327
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 15:25:16 +0200 (CEST)
Received: from localhost ([::1]:50410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyDjn-0002i2-Jy
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 09:25:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lyDiJ-000134-5n
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 09:23:43 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:46041)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lyDiG-0002Cl-Q6
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 09:23:42 -0400
Received: by mail-ed1-x531.google.com with SMTP id t3so9744874edt.12
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 06:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Q3yGFca07Tv8cwQ++E5DMHd7Vw+rvKlsvxS5TOV3rmE=;
 b=P/3Zk6k+XAfV78h4c6tXseXbr87XVZ0aAKK3BcAOCs51IyYYFdHX23RgE+Pca8jQWJ
 OvR/x+7R6XgbKAWFxf7u34MqccQ60xYc1fceV96D2QiCduAsgh/EaRxJYuEer4xyj9dA
 XANmwVJDpGVdVQOVxgbvyvxv3H0p7MA8RV8ao1nDp+BeJnqPDj5jyL58cPlimr+n9paR
 BdiOn2D+sWNugiNIL0S4CMCRHvTP+AmoAnkGuBo2LYluVYB66k1VUJdswC5oinmv3CLm
 z8P4blbr1oLlj5akDgyJuLyqMDge7zVTpieXGGGKrEh6skvLOP6J9OLbbd6QdHn0qa8B
 S9Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q3yGFca07Tv8cwQ++E5DMHd7Vw+rvKlsvxS5TOV3rmE=;
 b=rjm1dS5nl6hjvacWAmDJdg7jcpb9P0VXlCd07KDLo5q+QvE0eymek48QwS6waAg07j
 Inu3Da8cvd+h1Mv8cc5g9fO96bkZLD/E10OEBJWWlJPZmgdF3mWJTw1VF9O+4Vy/dLHZ
 28yxQkt6w6J6Gfd3/eQj2rNnpEb1V4Y5pO11YSKBa3TM/rHBBzcYSbuFeWzR80+w/aja
 Ae7p0xae1JG0orFV9gYY641Qt7Q9So95ZVlnIvHH+2WfnpJj3hr2tH68E+jORNq+kc6x
 v0C7TWZEI8KT2ysejv3ZrfKVxBaT3jgRUDiS45KgBgJagvbdmj6j0QFk0iL6mID7CAJV
 g7sQ==
X-Gm-Message-State: AOAM530UlJaRLOM9JA/p+dZYRSUYWUE6pYqY+aV56DQv2ZQz9wbt/p9+
 9MVcYlowebu0JHjxhnKNGRDwdTeOK7xf/emG9U0Zkg==
X-Google-Smtp-Source: ABdhPJwEhl51SL/S8KB9ybRd7ZhgW7tH/wBeSNWZNb9iOcIt7Jo+AQHM0jWuYJ37WwODVge6Gc5hpfDSdw14HpxLY8s=
X-Received: by 2002:aa7:c644:: with SMTP id z4mr39792171edr.204.1624973019064; 
 Tue, 29 Jun 2021 06:23:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210616091244.33049-1-ysato@users.sourceforge.jp>
 <20210616091244.33049-4-ysato@users.sourceforge.jp>
In-Reply-To: <20210616091244.33049-4-ysato@users.sourceforge.jp>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Jun 2021 14:23:01 +0100
Message-ID: <CAFEAcA9n8D0GbMv9B_k=Z_B6x1wyseSAGhTEoTxAd0RW51MX2Q@mail.gmail.com>
Subject: Re: [PATCH 3/3] hw/sh4: sh7750 using renesas_sci.
To: Yoshinori Sato <ysato@users.sourceforge.jp>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 16 Jun 2021 at 10:14, Yoshinori Sato <ysato@users.sourceforge.jp> wrote:
>
> Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
> ---
>  include/hw/sh4/sh.h |  8 --------
>  hw/sh4/sh7750.c     | 41 +++++++++++++++++++++++++++++++++++++++++
>  hw/sh4/Kconfig      |  2 +-
>  3 files changed, 42 insertions(+), 9 deletions(-)
>
> diff --git a/include/hw/sh4/sh.h b/include/hw/sh4/sh.h
> index becb596979..74e1ba59a8 100644
> --- a/include/hw/sh4/sh.h
> +++ b/include/hw/sh4/sh.h
> @@ -55,14 +55,6 @@ int sh7750_register_io_device(struct SH7750State *s,
>
>  /* sh_serial.c */
>  #define SH_SERIAL_FEAT_SCIF (1 << 0)
> -void sh_serial_init(MemoryRegion *sysmem,
> -                    hwaddr base, int feat,
> -                    uint32_t freq, Chardev *chr,
> -                    qemu_irq eri_source,
> -                    qemu_irq rxi_source,
> -                    qemu_irq txi_source,
> -                    qemu_irq tei_source,
> -                    qemu_irq bri_source);

This change means that the code in sh_serial.c will no longer compile,
because it has a non-static function with no previous prototype.
The patch as a whole compiles because the change to hw/sh4/Kconfig
file removes the selection of SH_SCI and so we never try to
compile sh_serial.c. But we shouldn't leave dead code around in
the tree.

Option A:
I guess the idea is to avoid having to rename sh_serial_init(),
which makes sense. If you want to take this route, then
in this patch we should mention that in the commit message,
something like:

===begin===
hw/sh4: Switch sh7750 to new renesas-sci devices

Switch the sh7750 away from the old serial device implementation
in sh_serial.c to use the new renesas-sci devices.

Note that deleting the prototype for sh_serial_init() means that
sh_serial.c will no longer be able to compile (it would hit a
warning about having a non-static function without a previous
prototype). This is OK because we remove the only place that
was selecting the SH_SCI Kconfig feature, so we won't attempt
to compile that source file. In the following commit, we will
delete the file entirely.

===end===

Then in a new patch to go after this one, remove:
 * the file sh_serial.c itself
 * the "config SH_SCI" section in hw/char/Kconfig
 * the line for sh_serial.c in hw/char/meson.build


Option B: would be to give your new sh7750.c function a different
name than sh_serial_init() (eg sci_init()) and change the two
callsites in this patch. Then you could keep the old sh_serial_init()
prototype in this patch and delete it as part of the new "remove
sh_serial.c" patch (which is where removal of the prototype more
logically belongs.)

I don't mind which of the two you go for.

>  /* sh7750.c */
>  qemu_irq sh7750_irl(struct SH7750State *s);
> diff --git a/hw/sh4/sh7750.c b/hw/sh4/sh7750.c
> index d53a436d8c..1ef8b73c65 100644
> --- a/hw/sh4/sh7750.c
> +++ b/hw/sh4/sh7750.c
> @@ -24,6 +24,7 @@
>   */
>
>  #include "qemu/osdep.h"
> +#include "qapi/error.h"
>  #include "hw/irq.h"
>  #include "hw/sh4/sh.h"
>  #include "sysemu/sysemu.h"
> @@ -32,6 +33,8 @@
>  #include "hw/sh4/sh_intc.h"
>  #include "hw/timer/tmu012.h"
>  #include "exec/exec-all.h"
> +#include "hw/char/renesas_sci.h"
> +#include "hw/qdev-properties.h"
>
>  #define NB_DEVICES 4
>
> @@ -752,6 +755,44 @@ static const MemoryRegionOps sh7750_mmct_ops = {
>      .endianness = DEVICE_NATIVE_ENDIAN,
>  };
>
> +static void sh_serial_init(MemoryRegion *sysmem,
> +                           hwaddr base, int feat,
> +                           uint32_t freq, Chardev *chr,
> +                           qemu_irq eri_source,
> +                           qemu_irq rxi_source,
> +                           qemu_irq txi_source,
> +                           qemu_irq tei_source,
> +                           qemu_irq bri_source)
> +{
> +    RenesasSCIBaseState *sci;
> +    char ckname[16];
> +
> +    switch(feat) {
> +    case 0: /* SCI */
> +        sci = RENESAS_SCI_BASE(qdev_new(TYPE_RENESAS_SCI));
> +        snprintf(ckname, sizeof(ckname), "pck_sci");
> +        break;
> +    case SH_SERIAL_FEAT_SCIF:
> +        sci = RENESAS_SCI_BASE(qdev_new(TYPE_RENESAS_SCIF));
> +        snprintf(ckname, sizeof(ckname), "pck_scif");
> +        break;
> +    }

The ckname[] array seems to be set but never used ?

Since you never use 'sci' as a RenesasSCIBaseState, you could
instead declare

   Device *sci;

and then
   sci = qdev_new(TYPE_RENESAS_whatever);

and avoid some of the DEVICE() casts below.

You might also prefer to have a SysBusDevice *sbd which you
can then set with
   sbd = SYS_BUS_DEVICE(sci);
and use sbd instead of casting every time you need it.

> +    qdev_prop_set_chr(DEVICE(sci), "chardev", chr);
> +    qdev_prop_set_uint32(DEVICE(sci), "register-size", SCI_REGWIDTH_32);
> +    qdev_prop_set_uint64(DEVICE(sci), "input-freq", freq);
> +    sysbus_connect_irq(SYS_BUS_DEVICE(sci), 0, eri_source);
> +    sysbus_connect_irq(SYS_BUS_DEVICE(sci), 1, rxi_source);
> +    sysbus_connect_irq(SYS_BUS_DEVICE(sci), 2, txi_source);
> +    if (tei_source)
> +        sysbus_connect_irq(SYS_BUS_DEVICE(sci), 3, tei_source);
> +    if (bri_source)
> +        sysbus_connect_irq(SYS_BUS_DEVICE(sci), 3, bri_source);

QEMU coding style requires braces for all if statements, even when
they're only one line.

> +    sysbus_realize(SYS_BUS_DEVICE(sci), &error_abort);
> +    sysbus_mmio_map(SYS_BUS_DEVICE(sci), 0, base);
> +    sysbus_mmio_map(SYS_BUS_DEVICE(sci), 1, P4ADDR(base));
> +    sysbus_mmio_map(SYS_BUS_DEVICE(sci), 2, A7ADDR(base));
> +}

thanks
-- PMM

