Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC12F65E044
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 23:54:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDCAI-0000z3-2V; Wed, 04 Jan 2023 17:23:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pDC9m-0000lX-Iu; Wed, 04 Jan 2023 17:23:00 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pDC9i-0005hJ-TX; Wed, 04 Jan 2023 17:22:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MJPk5XDtzv4Xqvw+abvxSdKle1diDJRNEr3X10u2/o0=; b=1bj2jzMDUELY9JcKVMRByzmd2e
 SJdawhdLapPgMDP+rfFKJC6pNH1HY+/+ohuBPkmOfVZ4mp87dfVgC2uSKVO1GwcEDovi6O0bkbWh+
 m+WFG9JfGZvs6dBmI67SAA7T4yIw0Vezb0er8lTyIqQxipzUP0MR/U316FGQhRKeagYKrpU9Y4Im2
 mzNOk5VPopd3WpZ88q91qAV7i1Bm69vlfxHe4d/ndlDWkFHwPnefBv5qmR6bmESQT+biqCS+VPVPu
 6hfFO7TNl9kd0fdWk9ytaEPpv5vCg025uHZtMV0/pMwsxg3DaflJYc0au2iHX/Yw5xnovighb1Cnt
 qhDb0kJ9gOVsT+jc/zAdYyiqREvOkZ31VvjQt9hstsKyLXJUJ4RBeP8Cc4qQ3E/LANh+L2y2tWXQt
 4RhvEEdPTrwT+4Aj4FyQs9yz9o2XB/ci1UtxisbC0cxnJD+aaLeHQ1WOi5p18IJNzghG6XNZhehpv
 lh0w8DL0Nk8nLt8HSUALUmcCjYUNDEL6017hNsrtSZZgyPxt0G3PUfgNvSxdxpf3OtS4xNIBYLp7v
 hRAiE9V+o3qAeqwPNqT+XJOv7zOpepj8lJXgf6zOgiCWMDqkP3Y6fbLm7+ZNZYoJ3P/DAjL28Y+Ev
 MRWxUenAh4o0blhZn7aYDIuymCA6uwQ/JkOndz05A=;
Received: from [2a00:23c4:8baa:1d00:e655:fde:753f:696a]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pDC8l-00009k-Js; Wed, 04 Jan 2023 22:21:47 +0000
Message-ID: <7a340802-bc5a-037b-78bf-1cb6c66e2987@ilande.co.uk>
Date: Wed, 4 Jan 2023 22:22:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>
Cc: ani@anisinha.ca, aurelien@aurel32.net, eduardo@habkost.net,
 f4bug@amsat.org, hpoussin@reactos.org, imammedo@redhat.com,
 jiaxun.yang@flygoat.com, jsnow@redhat.com, kraxel@redhat.com,
 marcel.apfelbaum@gmail.com, mst@redhat.com, pbonzini@redhat.com,
 philmd@linaro.org, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 richard.henderson@linaro.org
References: <20221221170003.2929-13-shentey@gmail.com>
 <20230104195351.3418-1-shentey@gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20230104195351.3418-1-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8baa:1d00:e655:fde:753f:696a
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH] hw/core: Introduce proxy-pic
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.708,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 04/01/2023 19:53, Bernhard Beschow wrote:

> Having a proxy PIC allows for ISA PICs to be created and wired up in
> southbridges. This is especially useful for PIIX3 for two reasons:
> First, the southbridge doesn't need to care about the virtualization
> technology used (KVM, TCG, Xen) due to in-IRQs (where devices get
> attached) and out-IRQs (which will trigger the IRQs of the respective
> virtualization technology) are separated. Second, since the in-IRQs are
> populated with fully initialized qemu_irq's, they can already be wired
> up inside PIIX3.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> Message-Id: <20221022150508.26830-15-shentey@gmail.com>
> ---
> Changes since v4:
> * Change license to GPL-2.0-or-later and use SPDX-License-Identifier
> * Fix typo in commit message
> ---
>   include/hw/core/proxy-pic.h | 38 ++++++++++++++++++++++++++
>   hw/core/proxy-pic.c         | 54 +++++++++++++++++++++++++++++++++++++
>   MAINTAINERS                 |  2 ++
>   hw/core/Kconfig             |  3 +++
>   hw/core/meson.build         |  1 +
>   5 files changed, 98 insertions(+)
>   create mode 100644 include/hw/core/proxy-pic.h
>   create mode 100644 hw/core/proxy-pic.c
> 
> diff --git a/include/hw/core/proxy-pic.h b/include/hw/core/proxy-pic.h
> new file mode 100644
> index 0000000000..32bc7936bd
> --- /dev/null
> +++ b/include/hw/core/proxy-pic.h
> @@ -0,0 +1,38 @@
> +/*
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + *
> + * Proxy interrupt controller device.
> + *
> + * Copyright (c) 2022 Bernhard Beschow <shentey@gmail.com>
> + */
> +
> +#ifndef HW_PROXY_PIC_H
> +#define HW_PROXY_PIC_H
> +
> +#include "hw/qdev-core.h"
> +#include "qom/object.h"
> +#include "hw/irq.h"
> +
> +#define TYPE_PROXY_PIC "proxy-pic"
> +OBJECT_DECLARE_SIMPLE_TYPE(ProxyPICState, PROXY_PIC)
> +
> +#define MAX_PROXY_PIC_LINES 16
> +
> +/**
> + * This is a simple device which has 16 pairs of GPIO input and output lines.
> + * Any change on an input line is forwarded to the respective output.
> + *
> + * QEMU interface:
> + *  + 16 unnamed GPIO inputs: the input lines
> + *  + 16 unnamed GPIO outputs: the output lines
> + */

Re-reading this as a standalone patch, I can understand now why Phil was asking about 
device properties etc. because aside from the commit message, it isn't particularly 
clear that this is a workaround for QEMU's PIC devices and accelerator 
implementations not (yet) supporting direct wiring with qdev gpios. I would 
definitely argue that it is a special purpose and not a generic device.

I apologise that this is quite late in the review process, however given that this 
wasn't immediately clear I do think it is worth making a few minor changes. Perhaps 
something like:

- Update the comment above in proxy_pic.h clarifying that this is only for wiring up
   ISA PICs (similar to the commit message) until gpios can be used

- Move the .c and .h files from hw/core/proxy-pic.c and include/hw/core/proxy_pic.h
   to hw/i386/proxy-pic.c and include/hw/i386/proxy_pic.h to provide a strong hint
   that the device is restricted to x86-only

I think this makes it more obvious what the device is doing, and also prevent its 
usage leaking into other places in the codebase. In fact in its current form there is 
no need for device properties to configure the PIC lines, since legacy x86 PICs 
always have 16 (ISA) IRQ lines.

> +struct ProxyPICState {
> +    /*< private >*/
> +    struct DeviceState parent_obj;
> +    /*< public >*/
> +
> +    qemu_irq in_irqs[MAX_PROXY_PIC_LINES];
> +    qemu_irq out_irqs[MAX_PROXY_PIC_LINES];
> +};
> +
> +#endif /* HW_PROXY_PIC_H */
> diff --git a/hw/core/proxy-pic.c b/hw/core/proxy-pic.c
> new file mode 100644
> index 0000000000..40fd70b9e2
> --- /dev/null
> +++ b/hw/core/proxy-pic.c
> @@ -0,0 +1,54 @@
> +/*
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + *
> + * Proxy interrupt controller device.
> + *
> + * Copyright (c) 2022 Bernhard Beschow <shentey@gmail.com>
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/core/proxy-pic.h"
> +
> +static void proxy_pic_set_irq(void *opaque, int irq, int level)
> +{
> +    ProxyPICState *s = opaque;
> +
> +    qemu_set_irq(s->out_irqs[irq], level);
> +}
> +
> +static void proxy_pic_realize(DeviceState *dev, Error **errp)
> +{
> +    ProxyPICState *s = PROXY_PIC(dev);
> +
> +    qdev_init_gpio_in(DEVICE(s), proxy_pic_set_irq, MAX_PROXY_PIC_LINES);
> +    qdev_init_gpio_out(DEVICE(s), s->out_irqs, MAX_PROXY_PIC_LINES);
> +
> +    for (int i = 0; i < MAX_PROXY_PIC_LINES; ++i) {
> +        s->in_irqs[i] = qdev_get_gpio_in(DEVICE(s), i);
> +    }
> +}
> +
> +static void proxy_pic_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    /* No state to reset or migrate */
> +    dc->realize = proxy_pic_realize;
> +
> +    /* Reason: Needs to be wired up to work */
> +    dc->user_creatable = false;
> +}
> +
> +static const TypeInfo proxy_pic_info = {
> +    .name          = TYPE_PROXY_PIC,
> +    .parent        = TYPE_DEVICE,
> +    .instance_size = sizeof(ProxyPICState),
> +    .class_init = proxy_pic_class_init,
> +};
> +
> +static void split_irq_register_types(void)
> +{
> +    type_register_static(&proxy_pic_info);
> +}
> +
> +type_init(split_irq_register_types)
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7a40d4d865..295a76bfbd 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1674,6 +1674,7 @@ S: Supported
>   F: hw/char/debugcon.c
>   F: hw/char/parallel*
>   F: hw/char/serial*
> +F: hw/core/proxy-pic.c
>   F: hw/dma/i8257*
>   F: hw/i2c/pm_smbus.c
>   F: hw/input/pckbd.c
> @@ -1690,6 +1691,7 @@ F: hw/watchdog/wdt_ib700.c
>   F: hw/watchdog/wdt_i6300esb.c
>   F: include/hw/display/vga.h
>   F: include/hw/char/parallel.h
> +F: include/hw/core/proxy-pic.h
>   F: include/hw/dma/i8257.h
>   F: include/hw/i2c/pm_smbus.h
>   F: include/hw/input/i8042.h
> diff --git a/hw/core/Kconfig b/hw/core/Kconfig
> index 9397503656..a7224f4ca0 100644
> --- a/hw/core/Kconfig
> +++ b/hw/core/Kconfig
> @@ -22,6 +22,9 @@ config OR_IRQ
>   config PLATFORM_BUS
>       bool
>   
> +config PROXY_PIC
> +    bool
> +
>   config REGISTER
>       bool
>   
> diff --git a/hw/core/meson.build b/hw/core/meson.build
> index 7a4d02b6c0..e86aef6ec3 100644
> --- a/hw/core/meson.build
> +++ b/hw/core/meson.build
> @@ -30,6 +30,7 @@ softmmu_ss.add(when: ['CONFIG_GUEST_LOADER', fdt], if_true: files('guest-loader.
>   softmmu_ss.add(when: 'CONFIG_OR_IRQ', if_true: files('or-irq.c'))
>   softmmu_ss.add(when: 'CONFIG_PLATFORM_BUS', if_true: files('platform-bus.c'))
>   softmmu_ss.add(when: 'CONFIG_PTIMER', if_true: files('ptimer.c'))
> +softmmu_ss.add(when: 'CONFIG_PROXY_PIC', if_true: files('proxy-pic.c'))
>   softmmu_ss.add(when: 'CONFIG_REGISTER', if_true: files('register.c'))
>   softmmu_ss.add(when: 'CONFIG_SPLIT_IRQ', if_true: files('split-irq.c'))
>   softmmu_ss.add(when: 'CONFIG_XILINX_AXI', if_true: files('stream.c'))


ATB,

Mark.

