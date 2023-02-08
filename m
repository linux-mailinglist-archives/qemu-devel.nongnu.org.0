Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6BD68FA56
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 23:41:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPt7x-0005Oe-Cc; Wed, 08 Feb 2023 17:41:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1pPt7u-0005IV-Ql
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 17:41:18 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1pPt7s-000206-0g
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 17:41:18 -0500
Received: by mail-wr1-x436.google.com with SMTP id j23so108683wra.0
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 14:41:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vWEvXnkPGlw0dGLntUuojQjGIhS4JtNX3dOq3D7NjVg=;
 b=LgyGwdr6201vxZY0e/CbEeAnuWu5e8ShZpwl4Iuv41E1vDbcKCCULzsTWZ0Fzct91Q
 zPXnGCw6tBewGdUVFbGJHzWh28obq+ktdVVnWA8snWumndR7qW7NcF2246XF68JVilWa
 SSIZTe2pd/msNeFDZ0UdtFIbvpAAxBhob02uAgeaO0n1EtS80sXDnP7rl14rAP7aspK2
 odiiq/75vMb2dPf8PzXgvk9/+vj/xRPtv5ni10/hYzpX84DhOGNE6Kmec4x0JHGY8ipw
 BlE44NVZT84Bl+baRRwCNRV67OxnKjFjGSwt0fkUthgKG7OzVlYr0XxI24uy+EKrXV7n
 U7yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vWEvXnkPGlw0dGLntUuojQjGIhS4JtNX3dOq3D7NjVg=;
 b=fsNELNmxOag8ewHEqLPcR3ewjiDXp3cGxlDPHKRHOVm/Xz5hTvHWCD7xNmEbjugRFu
 ghHhBa2fQEVetjcu1MXAn0qVaDIpN3lyC+hPxHJv4Zq9X6VxI4pE+0/ry9DgLoKpuB4H
 xIFIQbqNY26GUTyAS1drTRQ4/DK6PtSiC3UIMxdM2s/1YnGBY4xgCd+MwztFt276Tn/Z
 1LHnzLBh7WyO15hzzsOkliOhM1ysgpTNkknlU3GXb0Fvhq0KbukjixR6w/ftrdF4o+H8
 /ES4iMo7+8PIXjc9GuYkUGNmpZoUNJanejGHHVK3MZfY8o6aiaIp09pRhYaUa1RDKsfB
 lqTw==
X-Gm-Message-State: AO0yUKVsF+YRnQ4n1ktJFMCRNN9UNBIC8GmY1+0lYQjsJ+cZjtItlAqG
 mOPAQ3yxUadqSOQBl7xVyPdQTc41xASr+SNO/1eGjQ==
X-Google-Smtp-Source: AK7set9p1hsrN+r67ArgUN/2qpGxR0CYHBREt4jgeSxahFS+vfu1t5pTP5YGpbBoZ09cRNBbVcFdhYSHa5KTWuDjMxc=
X-Received: by 2002:a5d:5943:0:b0:2c3:fb97:acc with SMTP id
 e3-20020a5d5943000000b002c3fb970accmr102142wri.126.1675896074399; Wed, 08 Feb
 2023 14:41:14 -0800 (PST)
MIME-Version: 1.0
References: <20230206194936.168843-1-titusr@google.com>
 <20230206194936.168843-2-titusr@google.com>
 <BL0PR11MB304243FE15655303D4540F9B8ADB9@BL0PR11MB3042.namprd11.prod.outlook.com>
In-Reply-To: <BL0PR11MB304243FE15655303D4540F9B8ADB9@BL0PR11MB3042.namprd11.prod.outlook.com>
From: Titus Rwantare <titusr@google.com>
Date: Wed, 8 Feb 2023 14:40:00 -0800
Message-ID: <CAMvPwGrCMHhBfBtyWLQ=+Gb3Dn8Nx089k-2-9fvNkLxCC+XCbA@mail.gmail.com>
Subject: Re: [PATCH 1/3] hw/gpio: add PCA6414 i2c GPIO expander
To: "Dong, Eddie" <eddie.dong@intel.com>
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, 
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=titusr@google.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 6 Feb 2023 at 17:29, Dong, Eddie <eddie.dong@intel.com> wrote:
> > -----Original Message-----
> > From: qemu-devel-bounces+eddie.dong=intel.com@nongnu.org <qemu-
> > devel-bounces+eddie.dong=intel.com@nongnu.org> On Behalf Of Titus
> > Rwantare
> > Sent: Monday, February 6, 2023 11:50 AM
> > To: peter.maydell@linaro.org
> > Cc: qemu-arm@nongnu.org; qemu-devel@nongnu.org; Titus Rwantare
> > <titusr@google.com>; Hao Wu <wuhaotsh@google.com>
> > Subject: [PATCH 1/3] hw/gpio: add PCA6414 i2c GPIO expander
> >
> > This is a simple i2c device that allows i2c capable devices to have GPIOs.
>
> This patch is to implement a device model of I2C to GPIO for PCA_xxx, right?
> Or do you implement a general/common I2C to GPIO device?
> I think it is for the former one. In this case, the commit message is not clear.

I've redone the commit message.

>
> >
> > Reviewed-by: Hao Wu <wuhaotsh@google.com>
> > Signed-off-by: Titus Rwantare <titusr@google.com>
> > ---
> >  hw/arm/Kconfig                  |   1 +
> >  hw/gpio/meson.build             |   1 +
> >  hw/gpio/pca_i2c_gpio.c          | 362 ++++++++++++++++++++++++++++++++
> >  hw/gpio/trace-events            |   5 +
> >  hw/i2c/Kconfig                  |   4 +
> >  include/hw/gpio/pca_i2c_gpio.h  |  72 +++++++
> >  tests/qtest/meson.build         |   1 +
> >  tests/qtest/pca_i2c_gpio-test.c | 169 +++++++++++++++
> >  8 files changed, 615 insertions(+)
> >  create mode 100644 hw/gpio/pca_i2c_gpio.c  create mode 100644
> > include/hw/gpio/pca_i2c_gpio.h  create mode 100644
> > tests/qtest/pca_i2c_gpio-test.c
> >
> > diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig index
> > 2d157de9b8..1b533ddd76 100644
> > --- a/hw/arm/Kconfig
> > +++ b/hw/arm/Kconfig
> > @@ -418,6 +418,7 @@ config NPCM7XX
> >      select SSI
> >      select UNIMP
> >      select PCA954X
> > +    select PCA_I2C_GPIO
> >
> >  config FSL_IMX25
> >      bool
> > diff --git a/hw/gpio/meson.build b/hw/gpio/meson.build index
> > b726e6d27a..1e5b602002 100644
> > --- a/hw/gpio/meson.build
> > +++ b/hw/gpio/meson.build
> > @@ -12,3 +12,4 @@ softmmu_ss.add(when: 'CONFIG_OMAP', if_true:
> > files('omap_gpio.c'))
> >  softmmu_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_gpio.c'))
> >  softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true:
> > files('aspeed_gpio.c'))
> >  softmmu_ss.add(when: 'CONFIG_SIFIVE_GPIO', if_true: files('sifive_gpio.c'))
> > +softmmu_ss.add(when: 'CONFIG_PCA_I2C_GPIO', if_true:
> > +files('pca_i2c_gpio.c'))
> > diff --git a/hw/gpio/pca_i2c_gpio.c b/hw/gpio/pca_i2c_gpio.c new file
> > mode 100644 index 0000000000..afae497a22
> > --- /dev/null
> > +++ b/hw/gpio/pca_i2c_gpio.c
>
> Should this file be located under hw/i2c ?

I think there's a case to be made for either location. However, there
already exists an i2c device in hw/gpio.

> > @@ -0,0 +1,362 @@
> > +/*
> > + * NXP PCA I2C GPIO Expanders
> > + *
> > + * Low-voltage translating 16-bit I2C/SMBus GPIO expander with
> > +interrupt output,
> > + * reset, and configuration registers
> > + *
> > + * Datasheet: https://www.nxp.com/docs/en/data-sheet/PCA6416A.pdf
> > + *
> > + * Copyright 2023 Google LLC
> > + *
> > + * SPDX-License-Identifier: GPL-2.0-or-later
> > + *
> > + * These devices, by default, are configured to input only. The
> > +configuration is
> > + * settable through qom/qmp, or i2c.To set some pins as inputs before
> > +boot, use
> > + * the following in the board file of the machine:
> > + *      object_property_set_uint(Object *obj, const char *name,
> > + *                               uint64_t value, Error **errp);
> > + * specifying name as "gpio_config" and the value as a bitfield of the
> > +inputs
> > + * e.g. for the pca6416, a value of 0xFFF0, sets pins 0-3 as outputs
> > +and
> > + * 4-15 as inputs.
> > + * This value can also be set at runtime through qmp externally, or by
> > + * writing to the config register using i2c.
> > + *
> > + */
> > +
> > +#include "qemu/osdep.h"
> > +#include "hw/gpio/pca_i2c_gpio.h"
> > +#include "hw/irq.h"
> > +#include "hw/qdev-properties.h"
> > +#include "migration/vmstate.h"
> > +#include "qapi/visitor.h"
> > +#include "qemu/log.h"
> > +#include "qemu/module.h"
> > +#include "trace.h"
> > +
> > +/*
> > + * compare new_output to curr_output and update irq to match
> > new_output
> > + *
> > + * The Input port registers (registers 0 and 1) reflect the incoming
> > +logic
> > + * levels of the pins, regardless of whether the pin is defined as an
> > +input or
> > + * an output by the Configuration register.
> > + */
> > +static void pca_i2c_update_irqs(PCAGPIOState *ps) {
> > +    PCAGPIOClass *pc = PCA_I2C_GPIO_GET_CLASS(ps);
> > +    uint16_t out_diff = ps->new_output ^ ps->curr_output;
> > +    uint16_t in_diff = ps->new_input ^ ps->curr_input;
> > +    uint16_t mask, pin_i;
> > +
> > +    if (in_diff || out_diff) {
> The spec says " A pin configured as an output cannot cause an interrupt".
> Do we need to check out_diff here?

This is confusing, as I understand it, qemu_set_irq doesn't
necessarily send an interrupt to the guest. A qemu_irq can be
connected to another device expecting them as inputs like GPIO
devices, or connect to an interrupt controller that passes them to the
guest.
Someone with a better understanding of QEMU's irq structures than I
have, can give a better explanation.

> > +        for (int i = 0; i < pc->num_pins; i++) {
> At least for PCA_6416A, the state of pins are described in UINT16. We can check
> all together rather than bit scan/pin scan.
>
This seems possible, but I tried and broke it. I'd still need a per
pin loop to call qemu_set_irq.

> > +            mask = BIT(i);
> > +            /* pin must be configured as an output to be set here */
> > +            if (out_diff & ~ps->config & mask) {
> > +                pin_i = mask & ps->new_output;
> > +                qemu_set_irq(ps->output[i], pin_i > 0);
> > +                ps->curr_output &= ~mask;
> > +                ps->curr_output |= pin_i;
> > +            }
> > +
> > +            if (in_diff & mask) {
> > +                ps->curr_input &= ~mask;
> > +                ps->curr_input |= mask & ps->new_input;
> > +            }
> > +        }
> > +        /* make diff = 0 */
> > +        ps->new_input = ps->curr_input;
> > +    }
> > +}
> > +
> > +static void pca_i2c_irq_handler(void *opaque, int n, int level) {
> > +    PCAGPIOState *ps = opaque;
> > +    PCAGPIOClass *pc = PCA_I2C_GPIO_GET_CLASS(opaque);
> > +    uint16_t mask = BIT(n);
> > +
> > +    g_assert(n < pc->num_pins);
> > +    g_assert(n >= 0);
> > +
> > +    ps->new_input &= ~mask;
> > +
> > +    if (level > 0) {
> > +        ps->new_input |= BIT(n);
> > +    }
> > +
> > +    pca_i2c_update_irqs(ps);
> > +}
> > +
> > +/* slave to master */
> > +static uint8_t pca6416_recv(I2CSlave *i2c) {
> > +    PCAGPIOState *ps = PCA_I2C_GPIO(i2c);
> > +    uint8_t data;
> > +
> > +    switch (ps->command) {
> If we use an array to define the state (or union with an array access),
> we can avoid the duplicated code below.
>

Ack, the trade off with using the array is difficulty reasoning about what the
code is doing at a glance with the different devices.

Thanks for the review,
-Titus

