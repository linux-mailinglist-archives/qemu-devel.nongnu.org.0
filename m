Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95823114750
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Dec 2019 19:50:06 +0100 (CET)
Received: from localhost ([::1]:59684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1icwCS-0007ep-Tp
	for lists+qemu-devel@lfdr.de; Thu, 05 Dec 2019 13:50:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42320)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1icw7m-0005pC-8N
 for qemu-devel@nongnu.org; Thu, 05 Dec 2019 13:45:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1icw7g-0008Tx-5I
 for qemu-devel@nongnu.org; Thu, 05 Dec 2019 13:45:13 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:42116)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <aleksandar.m.mail@gmail.com>)
 id 1icw7f-0008Mt-Lz
 for qemu-devel@nongnu.org; Thu, 05 Dec 2019 13:45:08 -0500
Received: by mail-oi1-x243.google.com with SMTP id j22so3689339oij.9
 for <qemu-devel@nongnu.org>; Thu, 05 Dec 2019 10:45:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=QmcgfafCUSThXMaipeNUPpuL7mIe0qO/FxRelecviAA=;
 b=vQ4MKqHnLQv6wKGx8WKBtVcSPSKDsnX+81JsamRvIif4Uz74OHXOAMKrVJdOhAlNg4
 Iu5jReIcF2HWCi7wsTe+8jb5N5x0AanyAu7AUJ+4lNvSPlZasTyuQU6H27u+oJQQPz1q
 Q4E7V/AlZgAQUoKnw7pMo4NL9fO5EPf47+o8JTBCoGoxZwnlQ9G4GgVmXgdftHWf2+Kt
 Deyh1Qs6z0YrZu6g0F1Ty7JogwRCFu7jI4nAZJDvXf+zLDhsMH86qrrYCgkrJZlCP06o
 /YRgI2WOln8t/IUw8F28eo63MHq+4Q4KW8jXvXq0fhvggTidbjs2Sden7pwSzW9MAhrI
 y+Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=QmcgfafCUSThXMaipeNUPpuL7mIe0qO/FxRelecviAA=;
 b=lkeADIueUa8aODLSyUktZMmXyh6LsOGP1eBqxMJ1RW5Ffmp6y5iab80B7v2WFFEruW
 OnIuqU9Ofnwb6UEAGwY47R5n7W8siRcP/C4wvv4HYCdTyJMGHgyuF9BC+FvWhx9KuZDd
 +Pb+uXd1YMmMz2Hh71SeGp4dO4fqLRIAcntces+dyqt+hwG8a3hzlZF8gFgtXzwSWeMg
 ZQGPsT60EZPN4jXjRf0lWpOc+7OJCLlpXdfkvdh5oYGEQ6qEqIhTToHPIORMyjCyhDsx
 MQNo9XBAZsO2nm/G4LvwP0/sUpAsTJAbYUFgiwgScyff/EIyxUUYn9rxmcumplDcPhlC
 iIgA==
X-Gm-Message-State: APjAAAWNWIyM5gdOLaDeoI1cbHRthGgRUyTzpvsCQcFkIVt6bZNHJXm+
 OnMKjr08JzMf83v1kBlgnQgwyzkWyRIsl9m/pmY=
X-Google-Smtp-Source: APXvYqyNgnlJw/4/8kwFx5DMPQGorCM58nDHudo/zVj+Amig91T+mfyDFlJO5fuijGH9HWC4mo/LnwZwi2YHsFhlpkk=
X-Received: by 2002:a05:6808:64e:: with SMTP id
 z14mr7833119oih.79.1575571506329; 
 Thu, 05 Dec 2019 10:45:06 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a9d:d21:0:0:0:0:0 with HTTP;
 Thu, 5 Dec 2019 10:45:05 -0800 (PST)
In-Reply-To: <20191029212430.20617-11-mrolnik@gmail.com>
References: <20191029212430.20617-1-mrolnik@gmail.com>
 <20191029212430.20617-11-mrolnik@gmail.com>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Thu, 5 Dec 2019 19:45:05 +0100
Message-ID: <CAL1e-=hDvBZyAGmzJA-f_b9N4PiObfeVVQkZWdhjiSxOWSFaTg@mail.gmail.com>
Subject: Re: [PATCH v35 10/13] target/avr: Add limited support for USART and
 16 bit timer peripherals
To: Michael Rolnik <mrolnik@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000f3fcd90598f9535b"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
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
Cc: "thuth@redhat.com" <thuth@redhat.com>, Sarah Harris <S.E.Harris@kent.ac.uk>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "dovgaluk@ispras.ru" <dovgaluk@ispras.ru>,
 "imammedo@redhat.com" <imammedo@redhat.com>,
 "philmd@redhat.com" <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000f3fcd90598f9535b
Content-Type: text/plain; charset="UTF-8"

On Tuesday, October 29, 2019, Michael Rolnik <mrolnik@gmail.com> wrote:

> From: Sarah Harris <S.E.Harris@kent.ac.uk>
>
> These were designed to facilitate testing but should provide enough
> function to be useful in other contexts.
> Only a subset of the functions of each peripheral is implemented, mainly
> due to the lack of a standard way to handle electrical connections (like
> GPIO pins).
>
> Signed-off-by: Sarah Harris <S.E.Harris@kent.ac.uk>
> ---


Apart from splitting this patch into three, Michael, please move "build"
patch before this patch (of course, a little modified, without bits and
pieces for USART and other devices, and then gradually update all Makefiles
etc., within each patch that follows, until the end of the series.

This is important in case of board/soc/device reworking, which is likely.

Thanks,
Aleksandar




>  hw/char/Kconfig                |   3 +
>  hw/char/Makefile.objs          |   1 +
>  hw/char/avr_usart.c            | 324 ++++++++++++++++++
>  hw/misc/Kconfig                |   3 +
>  hw/misc/Makefile.objs          |   2 +
>  hw/misc/avr_mask.c             | 112 ++++++
>  hw/timer/Kconfig               |   3 +
>  hw/timer/Makefile.objs         |   2 +
>  hw/timer/avr_timer16.c         | 605 +++++++++++++++++++++++++++++++++
>  include/hw/char/avr_usart.h    |  97 ++++++
>  include/hw/misc/avr_mask.h     |  47 +++
>  include/hw/timer/avr_timer16.h |  97 ++++++
>  12 files changed, 1296 insertions(+)
>  create mode 100644 hw/char/avr_usart.c
>  create mode 100644 hw/misc/avr_mask.c
>  create mode 100644 hw/timer/avr_timer16.c
>  create mode 100644 include/hw/char/avr_usart.h
>  create mode 100644 include/hw/misc/avr_mask.h
>  create mode 100644 include/hw/timer/avr_timer16.h
>
> diff --git a/hw/char/Kconfig b/hw/char/Kconfig
> index 40e7a8b8bb..331b20983f 100644
> --- a/hw/char/Kconfig
> +++ b/hw/char/Kconfig
> @@ -46,3 +46,6 @@ config SCLPCONSOLE
>
>  config TERMINAL3270
>      bool
> +
> +config AVR_USART
> +    bool
> diff --git a/hw/char/Makefile.objs b/hw/char/Makefile.objs
> index 02d8a66925..f05c1f5667 100644
> --- a/hw/char/Makefile.objs
> +++ b/hw/char/Makefile.objs
> @@ -21,6 +21,7 @@ obj-$(CONFIG_PSERIES) += spapr_vty.o
>  obj-$(CONFIG_DIGIC) += digic-uart.o
>  obj-$(CONFIG_STM32F2XX_USART) += stm32f2xx_usart.o
>  obj-$(CONFIG_RASPI) += bcm2835_aux.o
> +common-obj-$(CONFIG_AVR_USART) += avr_usart.o
>
>  common-obj-$(CONFIG_CMSDK_APB_UART) += cmsdk-apb-uart.o
>  common-obj-$(CONFIG_ETRAXFS) += etraxfs_ser.o
> diff --git a/hw/char/avr_usart.c b/hw/char/avr_usart.c
> new file mode 100644
> index 0000000000..9ca3c2a1cd
> --- /dev/null
> +++ b/hw/char/avr_usart.c
> @@ -0,0 +1,324 @@
> +/*
> + * AVR USART
> + *
> + * Copyright (c) 2018 University of Kent
> + * Author: Sarah Harris
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining
> a copy
> + * of this software and associated documentation files (the "Software"),
> to deal
> + * in the Software without restriction, including without limitation the
> rights
> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or
> sell
> + * copies of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be
> included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
> OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> ARISING FROM,
> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
> IN
> + * THE SOFTWARE.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/char/avr_usart.h"
> +#include "qemu/log.h"
> +#include "hw/irq.h"
> +#include "hw/qdev-properties.h"
> +
> +static int avr_usart_can_receive(void *opaque)
> +{
> +    AVRUsartState *usart = opaque;
> +
> +    if (usart->data_valid || !(usart->csrb & USART_CSRB_RXEN)) {
> +        return 0;
> +    }
> +    return 1;
> +}
> +
> +static void avr_usart_receive(void *opaque, const uint8_t *buffer, int
> size)
> +{
> +    AVRUsartState *usart = opaque;
> +    assert(size == 1);
> +    assert(!usart->data_valid);
> +    usart->data = buffer[0];
> +    usart->data_valid = true;
> +    usart->csra |= USART_CSRA_RXC;
> +    if (usart->csrb & USART_CSRB_RXCIE) {
> +        qemu_set_irq(usart->rxc_irq, 1);
> +    }
> +}
> +
> +static void update_char_mask(AVRUsartState *usart)
> +{
> +    uint8_t mode = ((usart->csrc & USART_CSRC_CSZ0) ? 1 : 0) |
> +        ((usart->csrc & USART_CSRC_CSZ1) ? 2 : 0) |
> +        ((usart->csrb & USART_CSRB_CSZ2) ? 4 : 0);
> +    switch (mode) {
> +    case 0:
> +        usart->char_mask = 0b11111;
> +        break;
> +    case 1:
> +        usart->char_mask = 0b111111;
> +        break;
> +    case 2:
> +        usart->char_mask = 0b1111111;
> +        break;
> +    case 3:
> +        usart->char_mask = 0b11111111;
> +        break;
> +    case 4:
> +        /* Fallthrough. */
> +    case 5:
> +        /* Fallthrough. */
> +    case 6:
> +        qemu_log_mask(
> +            LOG_GUEST_ERROR,
> +            "%s: Reserved character size 0x%x\n",
> +            __func__,
> +            mode);
> +        break;
> +    case 7:
> +        qemu_log_mask(
> +            LOG_GUEST_ERROR,
> +            "%s: Nine bit character size not supported (forcing eight)\n",
> +            __func__);
> +        usart->char_mask = 0b11111111;
> +        break;
> +    default:
> +        assert(0);
> +    }
> +}
> +
> +static void avr_usart_reset(DeviceState *dev)
> +{
> +    AVRUsartState *usart = AVR_USART(dev);
> +    usart->data_valid = false;
> +    usart->csra = 0b00100000;
> +    usart->csrb = 0b00000000;
> +    usart->csrc = 0b00000110;
> +    usart->brrl = 0;
> +    usart->brrh = 0;
> +    update_char_mask(usart);
> +    qemu_set_irq(usart->rxc_irq, 0);
> +    qemu_set_irq(usart->txc_irq, 0);
> +    qemu_set_irq(usart->dre_irq, 0);
> +}
> +
> +static uint64_t avr_usart_read(void *opaque, hwaddr addr, unsigned int
> size)
> +{
> +    AVRUsartState *usart = opaque;
> +    uint8_t data;
> +    assert(size == 1);
> +
> +    if (!usart->enabled) {
> +        return 0;
> +    }
> +
> +    switch (addr) {
> +    case USART_DR:
> +        if (!(usart->csrb & USART_CSRB_RXEN)) {
> +            /* Receiver disabled, ignore. */
> +            return 0;
> +        }
> +        if (usart->data_valid) {
> +            data = usart->data & usart->char_mask;
> +            usart->data_valid = false;
> +        } else {
> +            data = 0;
> +        }
> +        usart->csra &= 0xff ^ USART_CSRA_RXC;
> +        qemu_set_irq(usart->rxc_irq, 0);
> +        qemu_chr_fe_accept_input(&usart->chr);
> +        return data;
> +    case USART_CSRA:
> +        return usart->csra;
> +    case USART_CSRB:
> +        return usart->csrb;
> +    case USART_CSRC:
> +        return usart->csrc;
> +    case USART_BRRL:
> +        return usart->brrl;
> +    case USART_BRRH:
> +        return usart->brrh;
> +    default:
> +        qemu_log_mask(
> +            LOG_GUEST_ERROR,
> +            "%s: Bad offset 0x%"HWADDR_PRIx"\n",
> +            __func__,
> +            addr);
> +    }
> +    return 0;
> +}
> +
> +static void avr_usart_write(void *opaque, hwaddr addr, uint64_t value,
> +                                unsigned int size)
> +{
> +    AVRUsartState *usart = opaque;
> +    uint8_t mask;
> +    uint8_t data;
> +    assert((value & 0xff) == value);
> +    assert(size == 1);
> +
> +    if (!usart->enabled) {
> +        return;
> +    }
> +
> +    switch (addr) {
> +    case USART_DR:
> +        if (!(usart->csrb & USART_CSRB_TXEN)) {
> +            /* Transmitter disabled, ignore. */
> +            return;
> +        }
> +        usart->csra |= USART_CSRA_TXC;
> +        usart->csra |= USART_CSRA_DRE;
> +        if (usart->csrb & USART_CSRB_TXCIE) {
> +            qemu_set_irq(usart->txc_irq, 1);
> +            usart->csra &= 0xff ^ USART_CSRA_TXC;
> +        }
> +        if (usart->csrb & USART_CSRB_DREIE) {
> +            qemu_set_irq(usart->dre_irq, 1);
> +        }
> +        data = value;
> +        qemu_chr_fe_write_all(&usart->chr, &data, 1);
> +        break;
> +    case USART_CSRA:
> +        mask = 0b01000011;
> +        /* Mask read-only bits. */
> +        value = (value & mask) | (usart->csra & (0xff ^ mask));
> +        usart->csra = value;
> +        if (value & USART_CSRA_TXC) {
> +            usart->csra ^= USART_CSRA_TXC;
> +            qemu_set_irq(usart->txc_irq, 0);
> +        }
> +        if (value & USART_CSRA_MPCM) {
> +            qemu_log_mask(
> +                LOG_GUEST_ERROR,
> +                "%s: MPCM not supported by USART\n",
> +                __func__);
> +        }
> +        break;
> +    case USART_CSRB:
> +        mask = 0b11111101;
> +        /* Mask read-only bits. */
> +        value = (value & mask) | (usart->csrb & (0xff ^ mask));
> +        usart->csrb = value;
> +        if (!(value & USART_CSRB_RXEN)) {
> +            /* Receiver disabled, flush input buffer. */
> +            usart->data_valid = false;
> +        }
> +        qemu_set_irq(usart->rxc_irq,
> +            ((value & USART_CSRB_RXCIE) &&
> +            (usart->csra & USART_CSRA_RXC)) ? 1 : 0);
> +        qemu_set_irq(usart->txc_irq,
> +            ((value & USART_CSRB_TXCIE) &&
> +            (usart->csra & USART_CSRA_TXC)) ? 1 : 0);
> +        qemu_set_irq(usart->dre_irq,
> +            ((value & USART_CSRB_DREIE) &&
> +            (usart->csra & USART_CSRA_DRE)) ? 1 : 0);
> +        update_char_mask(usart);
> +        break;
> +    case USART_CSRC:
> +        usart->csrc = value;
> +        if ((value & USART_CSRC_MSEL1) && (value & USART_CSRC_MSEL0)) {
> +            qemu_log_mask(
> +                LOG_GUEST_ERROR,
> +                "%s: SPI mode not supported by USART\n",
> +                __func__);
> +        }
> +        if ((value & USART_CSRC_MSEL1) && !(value & USART_CSRC_MSEL0)) {
> +            qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad USART mode\n",
> __func__);
> +        }
> +        if (!(value & USART_CSRC_PM1) && (value & USART_CSRC_PM0)) {
> +            qemu_log_mask(
> +                LOG_GUEST_ERROR,
> +                "%s: Bad USART parity mode\n",
> +                __func__);
> +        }
> +        update_char_mask(usart);
> +        break;
> +    case USART_BRRL:
> +        usart->brrl = value;
> +        break;
> +    case USART_BRRH:
> +        usart->brrh = value & 0b00001111;
> +        break;
> +    default:
> +        qemu_log_mask(
> +            LOG_GUEST_ERROR,
> +            "%s: Bad offset 0x%"HWADDR_PRIx"\n",
> +            __func__,
> +            addr);
> +    }
> +}
> +
> +static const MemoryRegionOps avr_usart_ops = {
> +    .read = avr_usart_read,
> +    .write = avr_usart_write,
> +    .endianness = DEVICE_NATIVE_ENDIAN,
> +    .impl = {.min_access_size = 1, .max_access_size = 1}
> +};
> +
> +static Property avr_usart_properties[] = {
> +    DEFINE_PROP_CHR("chardev", AVRUsartState, chr),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void avr_usart_pr(void *opaque, int irq, int level)
> +{
> +    AVRUsartState *s = AVR_USART(opaque);
> +
> +    s->enabled = !level;
> +
> +    if (!s->enabled) {
> +        avr_usart_reset(DEVICE(s));
> +    }
> +}
> +
> +static void avr_usart_init(Object *obj)
> +{
> +    AVRUsartState *s = AVR_USART(obj);
> +    sysbus_init_irq(SYS_BUS_DEVICE(obj), &s->rxc_irq);
> +    sysbus_init_irq(SYS_BUS_DEVICE(obj), &s->dre_irq);
> +    sysbus_init_irq(SYS_BUS_DEVICE(obj), &s->txc_irq);
> +    memory_region_init_io(&s->mmio, obj, &avr_usart_ops, s,
> TYPE_AVR_USART, 8);
> +    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mmio);
> +    qdev_init_gpio_in(DEVICE(s), avr_usart_pr, 1);
> +    s->enabled = true;
> +}
> +
> +static void avr_usart_realize(DeviceState *dev, Error **errp)
> +{
> +    AVRUsartState *s = AVR_USART(dev);
> +    qemu_chr_fe_set_handlers(&s->chr, avr_usart_can_receive,
> +                             avr_usart_receive, NULL, NULL,
> +                             s, NULL, true);
> +    avr_usart_reset(dev);
> +}
> +
> +static void avr_usart_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->reset = avr_usart_reset;
> +    dc->props = avr_usart_properties;
> +    dc->realize = avr_usart_realize;
> +}
> +
> +static const TypeInfo avr_usart_info = {
> +    .name          = TYPE_AVR_USART,
> +    .parent        = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(AVRUsartState),
> +    .instance_init = avr_usart_init,
> +    .class_init    = avr_usart_class_init,
> +};
> +
> +static void avr_usart_register_types(void)
> +{
> +    type_register_static(&avr_usart_info);
> +}
> +
> +type_init(avr_usart_register_types)
> diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
> index 2164646553..e79841e3a4 100644
> --- a/hw/misc/Kconfig
> +++ b/hw/misc/Kconfig
> @@ -125,4 +125,7 @@ config MAC_VIA
>      select MOS6522
>      select ADB
>
> +config AVR_MASK
> +    bool
> +
>  source macio/Kconfig
> diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
> index ba898a5781..3a8093be6a 100644
> --- a/hw/misc/Makefile.objs
> +++ b/hw/misc/Makefile.objs
> @@ -82,3 +82,5 @@ common-obj-$(CONFIG_NRF51_SOC) += nrf51_rng.o
>  obj-$(CONFIG_MAC_VIA) += mac_via.o
>
>  common-obj-$(CONFIG_GRLIB) += grlib_ahb_apb_pnp.o
> +
> +obj-$(CONFIG_AVR_MASK) += avr_mask.o
> diff --git a/hw/misc/avr_mask.c b/hw/misc/avr_mask.c
> new file mode 100644
> index 0000000000..3af82ed9c1
> --- /dev/null
> +++ b/hw/misc/avr_mask.c
> @@ -0,0 +1,112 @@
> +/*
> + * AVR Power Reduction
> + *
> + * Copyright (c) 2019 Michael Rolnik
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining
> a copy
> + * of this software and associated documentation files (the "Software"),
> to deal
> + * in the Software without restriction, including without limitation the
> rights
> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or
> sell
> + * copies of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be
> included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
> OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> ARISING FROM,
> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
> IN
> + * THE SOFTWARE.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/misc/avr_mask.h"
> +#include "qemu/log.h"
> +#include "hw/qdev-properties.h"
> +#include "hw/irq.h"
> +
> +#define DB_PRINT(fmt, args...) /* Nothing */
> +/*#define DB_PRINT(fmt, args...) printf("%s: " fmt "\n", __func__, ##
> args)*/
> +
> +static void avr_mask_reset(DeviceState *dev)
> +{
> +    AVRMaskState *s = AVR_MASK(dev);
> +
> +    s->val = 0x00;
> +
> +    for (int i = 0; i < 8; i++) {
> +        qemu_set_irq(s->irq[i], 0);
> +    }
> +}
> +
> +static uint64_t avr_mask_read(void *opaque, hwaddr offset, unsigned size)
> +{
> +    assert(size == 1);
> +    assert(offset == 0);
> +    AVRMaskState *s = opaque;
> +
> +    return (uint64_t)s->val;
> +}
> +
> +static void avr_mask_write(void *opaque, hwaddr offset,
> +                              uint64_t val64, unsigned size)
> +{
> +    assert(size == 1);
> +    assert(offset == 0);
> +    AVRMaskState *s = opaque;
> +    uint8_t val8 = val64;
> +
> +    DB_PRINT("write %d to offset %d", val8, (uint8_t)offset);
> +
> +    s->val = val8;
> +    for (int i = 0; i < 8; i++) {
> +        qemu_set_irq(s->irq[i], (val8 & (1 << i)) != 0);
> +    }
> +}
> +
> +static const MemoryRegionOps avr_mask_ops = {
> +    .read = avr_mask_read,
> +    .write = avr_mask_write,
> +    .endianness = DEVICE_NATIVE_ENDIAN,
> +    .impl = {.max_access_size = 1}
> +};
> +
> +static void avr_mask_init(Object *dev)
> +{
> +    AVRMaskState *s = AVR_MASK(dev);
> +    SysBusDevice *busdev = SYS_BUS_DEVICE(dev);
> +
> +    memory_region_init_io(&s->iomem, dev, &avr_mask_ops, s,
> TYPE_AVR_MASK,
> +            0x01);
> +    sysbus_init_mmio(busdev, &s->iomem);
> +
> +    for (int i = 0; i < 8; i++) {
> +        sysbus_init_irq(busdev, &s->irq[i]);
> +    }
> +    s->val = 0x00;
> +}
> +
> +static void avr_mask_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->reset = avr_mask_reset;
> +}
> +
> +static const TypeInfo avr_mask_info = {
> +    .name          = TYPE_AVR_MASK,
> +    .parent        = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(AVRMaskState),
> +    .class_init    = avr_mask_class_init,
> +    .instance_init = avr_mask_init,
> +};
> +
> +static void avr_mask_register_types(void)
> +{
> +    type_register_static(&avr_mask_info);
> +}
> +
> +type_init(avr_mask_register_types)
> diff --git a/hw/timer/Kconfig b/hw/timer/Kconfig
> index a990f9fe35..4343bc23f3 100644
> --- a/hw/timer/Kconfig
> +++ b/hw/timer/Kconfig
> @@ -34,3 +34,6 @@ config CMSDK_APB_TIMER
>  config CMSDK_APB_DUALTIMER
>      bool
>      select PTIMER
> +
> +config AVR_TIMER16
> +    bool
> diff --git a/hw/timer/Makefile.objs b/hw/timer/Makefile.objs
> index dece235fd7..af0913ca3b 100644
> --- a/hw/timer/Makefile.objs
> +++ b/hw/timer/Makefile.objs
> @@ -35,3 +35,5 @@ common-obj-$(CONFIG_CMSDK_APB_TIMER) +=
> cmsdk-apb-timer.o
>  common-obj-$(CONFIG_CMSDK_APB_DUALTIMER) += cmsdk-apb-dualtimer.o
>  common-obj-$(CONFIG_MSF2) += mss-timer.o
>  common-obj-$(CONFIG_RASPI) += bcm2835_systmr.o
> +
> +obj-$(CONFIG_AVR_TIMER16) += avr_timer16.o
> diff --git a/hw/timer/avr_timer16.c b/hw/timer/avr_timer16.c
> new file mode 100644
> index 0000000000..ac6ef73e77
> --- /dev/null
> +++ b/hw/timer/avr_timer16.c
> @@ -0,0 +1,605 @@
> +/*
> + * AVR 16 bit timer
> + *
> + * Copyright (c) 2018 University of Kent
> + * Author: Ed Robbins
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining
> a copy
> + * of this software and associated documentation files (the "Software"),
> to deal
> + * in the Software without restriction, including without limitation the
> rights
> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or
> sell
> + * copies of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be
> included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
> OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> ARISING FROM,
> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
> IN
> + * THE SOFTWARE.
> + */
> +
> +/*
> + * Driver for 16 bit timers on 8 bit AVR devices.
> + * Note:
> + * ATmega640/V-1280/V-1281/V-2560/V-2561/V timers 1, 3, 4 and 5 are 16
> bit
> + */
> +
> +/*
> + * XXX TODO: Power Reduction Register support
> + *           prescaler pause support
> + *           PWM modes, GPIO, output capture pins, input compare pin
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/timer/avr_timer16.h"
> +#include "qemu/log.h"
> +#include "hw/irq.h"
> +#include "hw/qdev-properties.h"
> +
> +/* Register offsets */
> +#define T16_CRA     0x0
> +#define T16_CRB     0x1
> +#define T16_CRC     0x2
> +#define T16_CNTL    0x4
> +#define T16_CNTH    0x5
> +#define T16_ICRL    0x6
> +#define T16_ICRH    0x7
> +#define T16_OCRAL   0x8
> +#define T16_OCRAH   0x9
> +#define T16_OCRBL   0xa
> +#define T16_OCRBH   0xb
> +#define T16_OCRCL   0xc
> +#define T16_OCRCH   0xd
> +
> +/* Field masks */
> +#define T16_CRA_WGM01   0x3
> +#define T16_CRA_COMC    0xc
> +#define T16_CRA_COMB    0x30
> +#define T16_CRA_COMA    0xc0
> +#define T16_CRA_OC_CONF \
> +    (T16_CRA_COMA | T16_CRA_COMB | T16_CRA_COMC)
> +
> +#define T16_CRB_CS      0x7
> +#define T16_CRB_WGM23   0x18
> +#define T16_CRB_ICES    0x40
> +#define T16_CRB_ICNC    0x80
> +
> +#define T16_CRC_FOCC    0x20
> +#define T16_CRC_FOCB    0x40
> +#define T16_CRC_FOCA    0x80
> +
> +/* Fields masks both TIMSK and TIFR (interrupt mask/flag registers) */
> +#define T16_INT_TOV    0x1 /* Timer overflow */
> +#define T16_INT_OCA    0x2 /* Output compare A */
> +#define T16_INT_OCB    0x4 /* Output compare B */
> +#define T16_INT_OCC    0x8 /* Output compare C */
> +#define T16_INT_IC     0x20 /* Input capture */
> +
> +/* Clock source values */
> +#define T16_CLKSRC_STOPPED     0
> +#define T16_CLKSRC_DIV1        1
> +#define T16_CLKSRC_DIV8        2
> +#define T16_CLKSRC_DIV64       3
> +#define T16_CLKSRC_DIV256      4
> +#define T16_CLKSRC_DIV1024     5
> +#define T16_CLKSRC_EXT_FALLING 6
> +#define T16_CLKSRC_EXT_RISING  7
> +
> +/* Timer mode values (not including PWM modes) */
> +#define T16_MODE_NORMAL     0
> +#define T16_MODE_CTC_OCRA   4
> +#define T16_MODE_CTC_ICR    12
> +
> +/* Accessors */
> +#define CLKSRC(t16) (t16->crb & T16_CRB_CS)
> +#define MODE(t16)   (((t16->crb & T16_CRB_WGM23) >> 1) | \
> +                     (t16->cra & T16_CRA_WGM01))
> +#define CNT(t16)    VAL16(t16->cntl, t16->cnth)
> +#define OCRA(t16)   VAL16(t16->ocral, t16->ocrah)
> +#define OCRB(t16)   VAL16(t16->ocrbl, t16->ocrbh)
> +#define OCRC(t16)   VAL16(t16->ocrcl, t16->ocrch)
> +#define ICR(t16)    VAL16(t16->icrl, t16->icrh)
> +
> +/* Helper macros */
> +#define VAL16(l, h) ((h << 8) | l)
> +#define ERROR(fmt, args...) \
> +    qemu_log_mask(LOG_GUEST_ERROR, "%s: " fmt "\n", __func__, ## args)
> +#define DB_PRINT(fmt, args...) /* Nothing */
> +/*#define DB_PRINT(fmt, args...) printf("%s: " fmt "\n", __func__, ##
> args)*/
> +
> +static inline int64_t avr_timer16_ns_to_ticks(AVRTimer16State *t16,
> int64_t t)
> +{
> +    if (t16->period_ns == 0) {
> +        return 0;
> +    }
> +    return t / t16->period_ns;
> +}
> +
> +static void avr_timer16_update_cnt(AVRTimer16State *t16)
> +{
> +    uint16_t cnt;
> +    cnt = avr_timer16_ns_to_ticks(t16, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL)
> -
> +                                       t16->reset_time_ns);
> +    t16->cntl = (uint8_t)(cnt & 0xff);
> +    t16->cnth = (uint8_t)((cnt & 0xff00) >> 8);
> +}
> +
> +static inline void avr_timer16_recalc_reset_time(AVRTimer16State *t16)
> +{
> +    t16->reset_time_ns = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) -
> +                         CNT(t16) * t16->period_ns;
> +}
> +
> +static void avr_timer16_clock_reset(AVRTimer16State *t16)
> +{
> +    t16->cntl = 0;
> +    t16->cnth = 0;
> +    t16->reset_time_ns = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> +}
> +
> +static void avr_timer16_clksrc_update(AVRTimer16State *t16)
> +{
> +    uint16_t divider = 0;
> +    switch (CLKSRC(t16)) {
> +    case T16_CLKSRC_EXT_FALLING:
> +    case T16_CLKSRC_EXT_RISING:
> +        ERROR("external clock source unsupported");
> +        goto end;
> +    case T16_CLKSRC_STOPPED:
> +        goto end;
> +    case T16_CLKSRC_DIV1:
> +        divider = 1;
> +        break;
> +    case T16_CLKSRC_DIV8:
> +        divider = 8;
> +        break;
> +    case T16_CLKSRC_DIV64:
> +        divider = 64;
> +        break;
> +    case T16_CLKSRC_DIV256:
> +        divider = 256;
> +        break;
> +    case T16_CLKSRC_DIV1024:
> +        divider = 1024;
> +        break;
> +    default:
> +        goto end;
> +    }
> +    t16->freq_hz = t16->cpu_freq_hz / divider;
> +    t16->period_ns = 1000000000ULL / t16->freq_hz;
> +    DB_PRINT("Timer frequency %" PRIu64 " hz, period %" PRIu64 " ns (%f
> s)",
> +             t16->freq_hz, t16->period_ns, 1 / (double)t16->freq_hz);
> +end:
> +    return;
> +}
> +
> +static void avr_timer16_set_alarm(AVRTimer16State *t16)
> +{
> +    if (CLKSRC(t16) == T16_CLKSRC_EXT_FALLING ||
> +        CLKSRC(t16) == T16_CLKSRC_EXT_RISING ||
> +        CLKSRC(t16) == T16_CLKSRC_STOPPED) {
> +        /* Timer is disabled or set to external clock source
> (unsupported) */
> +        goto end;
> +    }
> +
> +    uint64_t alarm_offset = 0xffff;
> +    enum NextInterrupt next_interrupt = OVERFLOW;
> +
> +    switch (MODE(t16)) {
> +    case T16_MODE_NORMAL:
> +        /* Normal mode */
> +        if (OCRA(t16) < alarm_offset && OCRA(t16) > CNT(t16) &&
> +            (t16->imsk & T16_INT_OCA)) {
> +            alarm_offset = OCRA(t16);
> +            next_interrupt = COMPA;
> +        }
> +        break;
> +    case T16_MODE_CTC_OCRA:
> +        /* CTC mode, top = ocra */
> +        if (OCRA(t16) < alarm_offset && OCRA(t16) > CNT(t16)) {
> +            alarm_offset = OCRA(t16);
> +            next_interrupt = COMPA;
> +        }
> +       break;
> +    case T16_MODE_CTC_ICR:
> +        /* CTC mode, top = icr */
> +        if (ICR(t16) < alarm_offset && ICR(t16) > CNT(t16)) {
> +            alarm_offset = ICR(t16);
> +            next_interrupt = CAPT;
> +        }
> +        if (OCRA(t16) < alarm_offset && OCRA(t16) > CNT(t16) &&
> +            (t16->imsk & T16_INT_OCA)) {
> +            alarm_offset = OCRA(t16);
> +            next_interrupt = COMPA;
> +        }
> +        break;
> +    default:
> +        ERROR("pwm modes are unsupported");
> +        goto end;
> +    }
> +    if (OCRB(t16) < alarm_offset && OCRB(t16) > CNT(t16) &&
> +        (t16->imsk & T16_INT_OCB)) {
> +        alarm_offset = OCRB(t16);
> +        next_interrupt = COMPB;
> +    }
> +    if (OCRC(t16) < alarm_offset && OCRB(t16) > CNT(t16) &&
> +        (t16->imsk & T16_INT_OCC)) {
> +        alarm_offset = OCRB(t16);
> +        next_interrupt = COMPC;
> +    }
> +    alarm_offset -= CNT(t16);
> +
> +    t16->next_interrupt = next_interrupt;
> +    uint64_t alarm_ns =
> +        t16->reset_time_ns + ((CNT(t16) + alarm_offset) * t16->period_ns);
> +    timer_mod(t16->timer, alarm_ns);
> +
> +    DB_PRINT("next alarm %" PRIu64 " ns from now",
> +        alarm_offset * t16->period_ns);
> +
> +end:
> +    return;
> +}
> +
> +static void avr_timer16_interrupt(void *opaque)
> +{
> +    AVRTimer16State *t16 = opaque;
> +    uint8_t mode = MODE(t16);
> +
> +    avr_timer16_update_cnt(t16);
> +
> +    if (CLKSRC(t16) == T16_CLKSRC_EXT_FALLING ||
> +        CLKSRC(t16) == T16_CLKSRC_EXT_RISING ||
> +        CLKSRC(t16) == T16_CLKSRC_STOPPED) {
> +        /* Timer is disabled or set to external clock source
> (unsupported) */
> +        return;
> +    }
> +
> +    DB_PRINT("interrupt, cnt = %d", CNT(t16));
> +
> +    /* Counter overflow */
> +    if (t16->next_interrupt == OVERFLOW) {
> +        DB_PRINT("0xffff overflow");
> +        avr_timer16_clock_reset(t16);
> +        if (t16->imsk & T16_INT_TOV) {
> +            t16->ifr |= T16_INT_TOV;
> +            qemu_set_irq(t16->ovf_irq, 1);
> +        }
> +    }
> +    /* Check for ocra overflow in CTC mode */
> +    if (mode == T16_MODE_CTC_OCRA && t16->next_interrupt == COMPA) {
> +        DB_PRINT("CTC OCRA overflow");
> +        avr_timer16_clock_reset(t16);
> +    }
> +    /* Check for icr overflow in CTC mode */
> +    if (mode == T16_MODE_CTC_ICR && t16->next_interrupt == CAPT) {
> +        DB_PRINT("CTC ICR overflow");--
> 2.17.2 (Apple Git-113)
>
>

--000000000000f3fcd90598f9535b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br>On Tuesday, October 29, 2019, Michael Rolnik &lt;<a href=3D"mailto:=
mrolnik@gmail.com">mrolnik@gmail.com</a>&gt; wrote:<br><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex">From: Sarah Harris &lt;<a href=3D"mailto:S.E.Harris@kent.ac.uk" =
target=3D"_blank">S.E.Harris@kent.ac.uk</a>&gt;<br>
<br>
These were designed to facilitate testing but should provide enough functio=
n to be useful in other contexts.<br>
Only a subset of the functions of each peripheral is implemented, mainly du=
e to the lack of a standard way to handle electrical connections (like GPIO=
 pins).<br>
<br>
Signed-off-by: Sarah Harris &lt;<a href=3D"mailto:S.E.Harris@kent.ac.uk" ta=
rget=3D"_blank">S.E.Harris@kent.ac.uk</a>&gt;<br>
---</blockquote><div><br></div><div>Apart from splitting this patch into th=
ree, Michael, please move &quot;build&quot; patch before this patch (of cou=
rse, a little modified, without bits and pieces for USART and other devices=
, and then gradually update all Makefiles etc., within each patch that foll=
ows, until the end of the series.</div><div><br></div><div>This is importan=
t in case of board/soc/device reworking, which is likely.</div><div><br></d=
iv><div>Thanks,</div><div>Aleksandar</div><div><br></div><div><br></div><di=
v>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">
=C2=A0hw/char/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A03 +<br>
=C2=A0hw/char/Makefile.objs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A01 +<br>
=C2=A0hw/char/avr_usart.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 324 ++=
++++++++++++++++<br>
=C2=A0hw/misc/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A03 +<br>
=C2=A0hw/misc/Makefile.objs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A02 +<br>
=C2=A0hw/misc/avr_mask.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1=
12 ++++++<br>
=C2=A0hw/timer/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A03 +<br>
=C2=A0hw/timer/Makefile.objs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=
=A02 +<br>
=C2=A0hw/timer/avr_timer16.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 605 +++++++=
+++++++++++++++++++++++<wbr>+++<br>
=C2=A0include/hw/char/avr_usart.h=C2=A0 =C2=A0 |=C2=A0 97 ++++++<br>
=C2=A0include/hw/misc/avr_mask.h=C2=A0 =C2=A0 =C2=A0|=C2=A0 47 +++<br>
=C2=A0include/hw/timer/avr_timer16.<wbr>h |=C2=A0 97 ++++++<br>
=C2=A012 files changed, 1296 insertions(+)<br>
=C2=A0create mode 100644 hw/char/avr_usart.c<br>
=C2=A0create mode 100644 hw/misc/avr_mask.c<br>
=C2=A0create mode 100644 hw/timer/avr_timer16.c<br>
=C2=A0create mode 100644 include/hw/char/avr_usart.h<br>
=C2=A0create mode 100644 include/hw/misc/avr_mask.h<br>
=C2=A0create mode 100644 include/hw/timer/avr_timer16.h<br>
<br>
diff --git a/hw/char/Kconfig b/hw/char/Kconfig<br>
index 40e7a8b8bb..331b20983f 100644<br>
--- a/hw/char/Kconfig<br>
+++ b/hw/char/Kconfig<br>
@@ -46,3 +46,6 @@ config SCLPCONSOLE<br>
<br>
=C2=A0config TERMINAL3270<br>
=C2=A0 =C2=A0 =C2=A0bool<br>
+<br>
+config AVR_USART<br>
+=C2=A0 =C2=A0 bool<br>
diff --git a/hw/char/Makefile.objs b/hw/char/Makefile.objs<br>
index 02d8a66925..f05c1f5667 100644<br>
--- a/hw/char/Makefile.objs<br>
+++ b/hw/char/Makefile.objs<br>
@@ -21,6 +21,7 @@ obj-$(CONFIG_PSERIES) +=3D spapr_vty.o<br>
=C2=A0obj-$(CONFIG_DIGIC) +=3D digic-uart.o<br>
=C2=A0obj-$(CONFIG_STM32F2XX_USART) +=3D stm32f2xx_usart.o<br>
=C2=A0obj-$(CONFIG_RASPI) +=3D bcm2835_aux.o<br>
+common-obj-$(CONFIG_AVR_<wbr>USART) +=3D avr_usart.o<br>
<br>
=C2=A0common-obj-$(CONFIG_CMSDK_<wbr>APB_UART) +=3D cmsdk-apb-uart.o<br>
=C2=A0common-obj-$(CONFIG_ETRAXFS) +=3D etraxfs_ser.o<br>
diff --git a/hw/char/avr_usart.c b/hw/char/avr_usart.c<br>
new file mode 100644<br>
index 0000000000..9ca3c2a1cd<br>
--- /dev/null<br>
+++ b/hw/char/avr_usart.c<br>
@@ -0,0 +1,324 @@<br>
+/*<br>
+ * AVR USART<br>
+ *<br>
+ * Copyright (c) 2018 University of Kent<br>
+ * Author: Sarah Harris<br>
+ *<br>
+ * Permission is hereby granted, free of charge, to any person obtaining a=
 copy<br>
+ * of this software and associated documentation files (the &quot;Software=
&quot;), to deal<br>
+ * in the Software without restriction, including without limitation the r=
ights<br>
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or se=
ll<br>
+ * copies of the Software, and to permit persons to whom the Software is<b=
r>
+ * furnished to do so, subject to the following conditions:<br>
+ *<br>
+ * The above copyright notice and this permission notice shall be included=
 in<br>
+ * all copies or substantial portions of the Software.<br>
+ *<br>
+ * THE SOFTWARE IS PROVIDED &quot;AS IS&quot;, WITHOUT WARRANTY OF ANY KIN=
D, EXPRESS OR<br>
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY=
,<br>
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL=
<br>
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OT=
HER<br>
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING=
 FROM,<br>
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS =
IN<br>
+ * THE SOFTWARE.<br>
+ */<br>
+<br>
+#include &quot;qemu/osdep.h&quot;<br>
+#include &quot;hw/char/avr_usart.h&quot;<br>
+#include &quot;qemu/log.h&quot;<br>
+#include &quot;hw/irq.h&quot;<br>
+#include &quot;hw/qdev-properties.h&quot;<br>
+<br>
+static int avr_usart_can_receive(void *opaque)<br>
+{<br>
+=C2=A0 =C2=A0 AVRUsartState *usart =3D opaque;<br>
+<br>
+=C2=A0 =C2=A0 if (usart-&gt;data_valid || !(usart-&gt;csrb &amp; USART_CSR=
B_RXEN)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 return 1;<br>
+}<br>
+<br>
+static void avr_usart_receive(void *opaque, const uint8_t *buffer, int siz=
e)<br>
+{<br>
+=C2=A0 =C2=A0 AVRUsartState *usart =3D opaque;<br>
+=C2=A0 =C2=A0 assert(size =3D=3D 1);<br>
+=C2=A0 =C2=A0 assert(!usart-&gt;data_valid);<br>
+=C2=A0 =C2=A0 usart-&gt;data =3D buffer[0];<br>
+=C2=A0 =C2=A0 usart-&gt;data_valid =3D true;<br>
+=C2=A0 =C2=A0 usart-&gt;csra |=3D USART_CSRA_RXC;<br>
+=C2=A0 =C2=A0 if (usart-&gt;csrb &amp; USART_CSRB_RXCIE) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_set_irq(usart-&gt;rxc_irq, 1);<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static void update_char_mask(AVRUsartState *usart)<br>
+{<br>
+=C2=A0 =C2=A0 uint8_t mode =3D ((usart-&gt;csrc &amp; USART_CSRC_CSZ0) ? 1=
 : 0) |<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ((usart-&gt;csrc &amp; USART_CSRC_CSZ1) ? 2 : =
0) |<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ((usart-&gt;csrb &amp; USART_CSRB_CSZ2) ? 4 : =
0);<br>
+=C2=A0 =C2=A0 switch (mode) {<br>
+=C2=A0 =C2=A0 case 0:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 usart-&gt;char_mask =3D 0b11111;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case 1:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 usart-&gt;char_mask =3D 0b111111;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case 2:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 usart-&gt;char_mask =3D 0b1111111;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case 3:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 usart-&gt;char_mask =3D 0b11111111;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case 4:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Fallthrough. */<br>
+=C2=A0 =C2=A0 case 5:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Fallthrough. */<br>
+=C2=A0 =C2=A0 case 6:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 LOG_GUEST_ERROR,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;%s: Reserved character siz=
e 0x%x\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __func__,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mode);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case 7:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 LOG_GUEST_ERROR,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;%s: Nine bit character siz=
e not supported (forcing eight)\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __func__);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 usart-&gt;char_mask =3D 0b11111111;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(0);<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static void avr_usart_reset(DeviceState *dev)<br>
+{<br>
+=C2=A0 =C2=A0 AVRUsartState *usart =3D AVR_USART(dev);<br>
+=C2=A0 =C2=A0 usart-&gt;data_valid =3D false;<br>
+=C2=A0 =C2=A0 usart-&gt;csra =3D 0b00100000;<br>
+=C2=A0 =C2=A0 usart-&gt;csrb =3D 0b00000000;<br>
+=C2=A0 =C2=A0 usart-&gt;csrc =3D 0b00000110;<br>
+=C2=A0 =C2=A0 usart-&gt;brrl =3D 0;<br>
+=C2=A0 =C2=A0 usart-&gt;brrh =3D 0;<br>
+=C2=A0 =C2=A0 update_char_mask(usart);<br>
+=C2=A0 =C2=A0 qemu_set_irq(usart-&gt;rxc_irq, 0);<br>
+=C2=A0 =C2=A0 qemu_set_irq(usart-&gt;txc_irq, 0);<br>
+=C2=A0 =C2=A0 qemu_set_irq(usart-&gt;dre_irq, 0);<br>
+}<br>
+<br>
+static uint64_t avr_usart_read(void *opaque, hwaddr addr, unsigned int siz=
e)<br>
+{<br>
+=C2=A0 =C2=A0 AVRUsartState *usart =3D opaque;<br>
+=C2=A0 =C2=A0 uint8_t data;<br>
+=C2=A0 =C2=A0 assert(size =3D=3D 1);<br>
+<br>
+=C2=A0 =C2=A0 if (!usart-&gt;enabled) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 switch (addr) {<br>
+=C2=A0 =C2=A0 case USART_DR:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!(usart-&gt;csrb &amp; USART_CSRB_RXEN)) {=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Receiver disabled, ignore. */=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (usart-&gt;data_valid) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 data =3D usart-&gt;data &amp; us=
art-&gt;char_mask;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 usart-&gt;data_valid =3D false;<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 data =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 usart-&gt;csra &amp;=3D 0xff ^ USART_CSRA_RXC;=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_set_irq(usart-&gt;rxc_irq, 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_chr_fe_accept_input(&amp;<wbr>usart-&gt;c=
hr);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return data;<br>
+=C2=A0 =C2=A0 case USART_CSRA:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return usart-&gt;csra;<br>
+=C2=A0 =C2=A0 case USART_CSRB:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return usart-&gt;csrb;<br>
+=C2=A0 =C2=A0 case USART_CSRC:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return usart-&gt;csrc;<br>
+=C2=A0 =C2=A0 case USART_BRRL:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return usart-&gt;brrl;<br>
+=C2=A0 =C2=A0 case USART_BRRH:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return usart-&gt;brrh;<br>
+=C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 LOG_GUEST_ERROR,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;%s: Bad offset 0x%&quot;HW=
ADDR_PRIx&quot;\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __func__,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 addr);<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 return 0;<br>
+}<br>
+<br>
+static void avr_usart_write(void *opaque, hwaddr addr, uint64_t value,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int size)<br>
+{<br>
+=C2=A0 =C2=A0 AVRUsartState *usart =3D opaque;<br>
+=C2=A0 =C2=A0 uint8_t mask;<br>
+=C2=A0 =C2=A0 uint8_t data;<br>
+=C2=A0 =C2=A0 assert((value &amp; 0xff) =3D=3D value);<br>
+=C2=A0 =C2=A0 assert(size =3D=3D 1);<br>
+<br>
+=C2=A0 =C2=A0 if (!usart-&gt;enabled) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 switch (addr) {<br>
+=C2=A0 =C2=A0 case USART_DR:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!(usart-&gt;csrb &amp; USART_CSRB_TXEN)) {=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Transmitter disabled, ignore.=
 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 usart-&gt;csra |=3D USART_CSRA_TXC;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 usart-&gt;csra |=3D USART_CSRA_DRE;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (usart-&gt;csrb &amp; USART_CSRB_TXCIE) {<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_set_irq(usart-&gt;txc_irq, =
1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 usart-&gt;csra &amp;=3D 0xff ^ U=
SART_CSRA_TXC;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (usart-&gt;csrb &amp; USART_CSRB_DREIE) {<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_set_irq(usart-&gt;dre_irq, =
1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 data =3D value;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_chr_fe_write_all(&amp;usart-&gt;<wbr>chr,=
 &amp;data, 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case USART_CSRA:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 mask =3D 0b01000011;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Mask read-only bits. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 value =3D (value &amp; mask) | (usart-&gt;csra=
 &amp; (0xff ^ mask));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 usart-&gt;csra =3D value;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (value &amp; USART_CSRA_TXC) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 usart-&gt;csra ^=3D USART_CSRA_T=
XC;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_set_irq(usart-&gt;txc_irq, =
0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (value &amp; USART_CSRA_MPCM) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 LOG_GUEST_ERROR,<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;%s: MPCM not=
 supported by USART\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __func__);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case USART_CSRB:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 mask =3D 0b11111101;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Mask read-only bits. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 value =3D (value &amp; mask) | (usart-&gt;csrb=
 &amp; (0xff ^ mask));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 usart-&gt;csrb =3D value;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!(value &amp; USART_CSRB_RXEN)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Receiver disabled, flush inpu=
t buffer. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 usart-&gt;data_valid =3D false;<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_set_irq(usart-&gt;rxc_irq,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ((value &amp; USART_CSRB_RXCIE) =
&amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (usart-&gt;csra &amp; USART_CSRA=
_RXC)) ? 1 : 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_set_irq(usart-&gt;txc_irq,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ((value &amp; USART_CSRB_TXCIE) =
&amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (usart-&gt;csra &amp; USART_CSRA=
_TXC)) ? 1 : 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_set_irq(usart-&gt;dre_irq,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ((value &amp; USART_CSRB_DREIE) =
&amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (usart-&gt;csra &amp; USART_CSRA=
_DRE)) ? 1 : 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 update_char_mask(usart);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case USART_CSRC:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 usart-&gt;csrc =3D value;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((value &amp; USART_CSRC_MSEL1) &amp;&amp; =
(value &amp; USART_CSRC_MSEL0)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 LOG_GUEST_ERROR,<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;%s: SPI mode=
 not supported by USART\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __func__);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((value &amp; USART_CSRC_MSEL1) &amp;&amp; =
!(value &amp; USART_CSRC_MSEL0)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR, &=
quot;%s: Bad USART mode\n&quot;, __func__);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!(value &amp; USART_CSRC_PM1) &amp;&amp; (=
value &amp; USART_CSRC_PM0)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 LOG_GUEST_ERROR,<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;%s: Bad USAR=
T parity mode\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __func__);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 update_char_mask(usart);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case USART_BRRL:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 usart-&gt;brrl =3D value;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case USART_BRRH:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 usart-&gt;brrh =3D value &amp; 0b00001111;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 LOG_GUEST_ERROR,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;%s: Bad offset 0x%&quot;HW=
ADDR_PRIx&quot;\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __func__,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 addr);<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static const MemoryRegionOps avr_usart_ops =3D {<br>
+=C2=A0 =C2=A0 .read =3D avr_usart_read,<br>
+=C2=A0 =C2=A0 .write =3D avr_usart_write,<br>
+=C2=A0 =C2=A0 .endianness =3D DEVICE_NATIVE_ENDIAN,<br>
+=C2=A0 =C2=A0 .impl =3D {.min_access_size =3D 1, .max_access_size =3D 1}<b=
r>
+};<br>
+<br>
+static Property avr_usart_properties[] =3D {<br>
+=C2=A0 =C2=A0 DEFINE_PROP_CHR(&quot;chardev&quot;, AVRUsartState, chr),<br=
>
+=C2=A0 =C2=A0 DEFINE_PROP_END_OF_LIST(),<br>
+};<br>
+<br>
+static void avr_usart_pr(void *opaque, int irq, int level)<br>
+{<br>
+=C2=A0 =C2=A0 AVRUsartState *s =3D AVR_USART(opaque);<br>
+<br>
+=C2=A0 =C2=A0 s-&gt;enabled =3D !level;<br>
+<br>
+=C2=A0 =C2=A0 if (!s-&gt;enabled) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 avr_usart_reset(DEVICE(s));<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static void avr_usart_init(Object *obj)<br>
+{<br>
+=C2=A0 =C2=A0 AVRUsartState *s =3D AVR_USART(obj);<br>
+=C2=A0 =C2=A0 sysbus_init_irq(SYS_BUS_<wbr>DEVICE(obj), &amp;s-&gt;rxc_irq=
);<br>
+=C2=A0 =C2=A0 sysbus_init_irq(SYS_BUS_<wbr>DEVICE(obj), &amp;s-&gt;dre_irq=
);<br>
+=C2=A0 =C2=A0 sysbus_init_irq(SYS_BUS_<wbr>DEVICE(obj), &amp;s-&gt;txc_irq=
);<br>
+=C2=A0 =C2=A0 memory_region_init_io(&amp;s-&gt;<wbr>mmio, obj, &amp;avr_us=
art_ops, s, TYPE_AVR_USART, 8);<br>
+=C2=A0 =C2=A0 sysbus_init_mmio(SYS_BUS_<wbr>DEVICE(obj), &amp;s-&gt;mmio);=
<br>
+=C2=A0 =C2=A0 qdev_init_gpio_in(DEVICE(s), avr_usart_pr, 1);<br>
+=C2=A0 =C2=A0 s-&gt;enabled =3D true;<br>
+}<br>
+<br>
+static void avr_usart_realize(DeviceState *dev, Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 AVRUsartState *s =3D AVR_USART(dev);<br>
+=C2=A0 =C2=A0 qemu_chr_fe_set_handlers(&amp;s-&gt;<wbr>chr, avr_usart_can_=
receive,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0avr_usart_receive, NULL, NULL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s, NULL, true);<br>
+=C2=A0 =C2=A0 avr_usart_reset(dev);<br>
+}<br>
+<br>
+static void avr_usart_class_init(<wbr>ObjectClass *klass, void *data)<br>
+{<br>
+=C2=A0 =C2=A0 DeviceClass *dc =3D DEVICE_CLASS(klass);<br>
+<br>
+=C2=A0 =C2=A0 dc-&gt;reset =3D avr_usart_reset;<br>
+=C2=A0 =C2=A0 dc-&gt;props =3D avr_usart_properties;<br>
+=C2=A0 =C2=A0 dc-&gt;realize =3D avr_usart_realize;<br>
+}<br>
+<br>
+static const TypeInfo avr_usart_info =3D {<br>
+=C2=A0 =C2=A0 .name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_AVR_USART,<=
br>
+=C2=A0 =C2=A0 .parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_SYS_BUS_DEVICE,<=
br>
+=C2=A0 =C2=A0 .instance_size =3D sizeof(AVRUsartState),<br>
+=C2=A0 =C2=A0 .instance_init =3D avr_usart_init,<br>
+=C2=A0 =C2=A0 .class_init=C2=A0 =C2=A0 =3D avr_usart_class_init,<br>
+};<br>
+<br>
+static void avr_usart_register_types(void)<br>
+{<br>
+=C2=A0 =C2=A0 type_register_static(&amp;avr_<wbr>usart_info);<br>
+}<br>
+<br>
+type_init(avr_usart_register_<wbr>types)<br>
diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig<br>
index 2164646553..e79841e3a4 100644<br>
--- a/hw/misc/Kconfig<br>
+++ b/hw/misc/Kconfig<br>
@@ -125,4 +125,7 @@ config MAC_VIA<br>
=C2=A0 =C2=A0 =C2=A0select MOS6522<br>
=C2=A0 =C2=A0 =C2=A0select ADB<br>
<br>
+config AVR_MASK<br>
+=C2=A0 =C2=A0 bool<br>
+<br>
=C2=A0source macio/Kconfig<br>
diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs<br>
index ba898a5781..3a8093be6a 100644<br>
--- a/hw/misc/Makefile.objs<br>
+++ b/hw/misc/Makefile.objs<br>
@@ -82,3 +82,5 @@ common-obj-$(CONFIG_NRF51_SOC) +=3D nrf51_rng.o<br>
=C2=A0obj-$(CONFIG_MAC_VIA) +=3D mac_via.o<br>
<br>
=C2=A0common-obj-$(CONFIG_GRLIB) +=3D grlib_ahb_apb_pnp.o<br>
+<br>
+obj-$(CONFIG_AVR_MASK) +=3D avr_mask.o<br>
diff --git a/hw/misc/avr_mask.c b/hw/misc/avr_mask.c<br>
new file mode 100644<br>
index 0000000000..3af82ed9c1<br>
--- /dev/null<br>
+++ b/hw/misc/avr_mask.c<br>
@@ -0,0 +1,112 @@<br>
+/*<br>
+ * AVR Power Reduction<br>
+ *<br>
+ * Copyright (c) 2019 Michael Rolnik<br>
+ *<br>
+ * Permission is hereby granted, free of charge, to any person obtaining a=
 copy<br>
+ * of this software and associated documentation files (the &quot;Software=
&quot;), to deal<br>
+ * in the Software without restriction, including without limitation the r=
ights<br>
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or se=
ll<br>
+ * copies of the Software, and to permit persons to whom the Software is<b=
r>
+ * furnished to do so, subject to the following conditions:<br>
+ *<br>
+ * The above copyright notice and this permission notice shall be included=
 in<br>
+ * all copies or substantial portions of the Software.<br>
+ *<br>
+ * THE SOFTWARE IS PROVIDED &quot;AS IS&quot;, WITHOUT WARRANTY OF ANY KIN=
D, EXPRESS OR<br>
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY=
,<br>
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL=
<br>
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OT=
HER<br>
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING=
 FROM,<br>
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS =
IN<br>
+ * THE SOFTWARE.<br>
+ */<br>
+<br>
+#include &quot;qemu/osdep.h&quot;<br>
+#include &quot;hw/misc/avr_mask.h&quot;<br>
+#include &quot;qemu/log.h&quot;<br>
+#include &quot;hw/qdev-properties.h&quot;<br>
+#include &quot;hw/irq.h&quot;<br>
+<br>
+#define DB_PRINT(fmt, args...) /* Nothing */<br>
+/*#define DB_PRINT(fmt, args...) printf(&quot;%s: &quot; fmt &quot;\n&quot=
;, __func__, ## args)*/<br>
+<br>
+static void avr_mask_reset(DeviceState *dev)<br>
+{<br>
+=C2=A0 =C2=A0 AVRMaskState *s =3D AVR_MASK(dev);<br>
+<br>
+=C2=A0 =C2=A0 s-&gt;val =3D 0x00;<br>
+<br>
+=C2=A0 =C2=A0 for (int i =3D 0; i &lt; 8; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_set_irq(s-&gt;irq[i], 0);<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static uint64_t avr_mask_read(void *opaque, hwaddr offset, unsigned size)<=
br>
+{<br>
+=C2=A0 =C2=A0 assert(size =3D=3D 1);<br>
+=C2=A0 =C2=A0 assert(offset =3D=3D 0);<br>
+=C2=A0 =C2=A0 AVRMaskState *s =3D opaque;<br>
+<br>
+=C2=A0 =C2=A0 return (uint64_t)s-&gt;val;<br>
+}<br>
+<br>
+static void avr_mask_write(void *opaque, hwaddr offset,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t val64, unsigned size)<br>
+{<br>
+=C2=A0 =C2=A0 assert(size =3D=3D 1);<br>
+=C2=A0 =C2=A0 assert(offset =3D=3D 0);<br>
+=C2=A0 =C2=A0 AVRMaskState *s =3D opaque;<br>
+=C2=A0 =C2=A0 uint8_t val8 =3D val64;<br>
+<br>
+=C2=A0 =C2=A0 DB_PRINT(&quot;write %d to offset %d&quot;, val8, (uint8_t)o=
ffset);<br>
+<br>
+=C2=A0 =C2=A0 s-&gt;val =3D val8;<br>
+=C2=A0 =C2=A0 for (int i =3D 0; i &lt; 8; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_set_irq(s-&gt;irq[i], (val8 &amp; (1 &lt;=
&lt; i)) !=3D 0);<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static const MemoryRegionOps avr_mask_ops =3D {<br>
+=C2=A0 =C2=A0 .read =3D avr_mask_read,<br>
+=C2=A0 =C2=A0 .write =3D avr_mask_write,<br>
+=C2=A0 =C2=A0 .endianness =3D DEVICE_NATIVE_ENDIAN,<br>
+=C2=A0 =C2=A0 .impl =3D {.max_access_size =3D 1}<br>
+};<br>
+<br>
+static void avr_mask_init(Object *dev)<br>
+{<br>
+=C2=A0 =C2=A0 AVRMaskState *s =3D AVR_MASK(dev);<br>
+=C2=A0 =C2=A0 SysBusDevice *busdev =3D SYS_BUS_DEVICE(dev);<br>
+<br>
+=C2=A0 =C2=A0 memory_region_init_io(&amp;s-&gt;<wbr>iomem, dev, &amp;avr_m=
ask_ops, s, TYPE_AVR_MASK,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x01);<br>
+=C2=A0 =C2=A0 sysbus_init_mmio(busdev, &amp;s-&gt;iomem);<br>
+<br>
+=C2=A0 =C2=A0 for (int i =3D 0; i &lt; 8; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sysbus_init_irq(busdev, &amp;s-&gt;irq[i]);<br=
>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 s-&gt;val =3D 0x00;<br>
+}<br>
+<br>
+static void avr_mask_class_init(<wbr>ObjectClass *klass, void *data)<br>
+{<br>
+=C2=A0 =C2=A0 DeviceClass *dc =3D DEVICE_CLASS(klass);<br>
+<br>
+=C2=A0 =C2=A0 dc-&gt;reset =3D avr_mask_reset;<br>
+}<br>
+<br>
+static const TypeInfo avr_mask_info =3D {<br>
+=C2=A0 =C2=A0 .name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_AVR_MASK,<b=
r>
+=C2=A0 =C2=A0 .parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_SYS_BUS_DEVICE,<=
br>
+=C2=A0 =C2=A0 .instance_size =3D sizeof(AVRMaskState),<br>
+=C2=A0 =C2=A0 .class_init=C2=A0 =C2=A0 =3D avr_mask_class_init,<br>
+=C2=A0 =C2=A0 .instance_init =3D avr_mask_init,<br>
+};<br>
+<br>
+static void avr_mask_register_types(void)<br>
+{<br>
+=C2=A0 =C2=A0 type_register_static(&amp;avr_<wbr>mask_info);<br>
+}<br>
+<br>
+type_init(avr_mask_register_<wbr>types)<br>
diff --git a/hw/timer/Kconfig b/hw/timer/Kconfig<br>
index a990f9fe35..4343bc23f3 100644<br>
--- a/hw/timer/Kconfig<br>
+++ b/hw/timer/Kconfig<br>
@@ -34,3 +34,6 @@ config CMSDK_APB_TIMER<br>
=C2=A0config CMSDK_APB_DUALTIMER<br>
=C2=A0 =C2=A0 =C2=A0bool<br>
=C2=A0 =C2=A0 =C2=A0select PTIMER<br>
+<br>
+config AVR_TIMER16<br>
+=C2=A0 =C2=A0 bool<br>
diff --git a/hw/timer/Makefile.objs b/hw/timer/Makefile.objs<br>
index dece235fd7..af0913ca3b 100644<br>
--- a/hw/timer/Makefile.objs<br>
+++ b/hw/timer/Makefile.objs<br>
@@ -35,3 +35,5 @@ common-obj-$(CONFIG_CMSDK_APB_<wbr>TIMER) +=3D cmsdk-apb-=
timer.o<br>
=C2=A0common-obj-$(CONFIG_CMSDK_<wbr>APB_DUALTIMER) +=3D cmsdk-apb-dualtime=
r.o<br>
=C2=A0common-obj-$(CONFIG_MSF2) +=3D mss-timer.o<br>
=C2=A0common-obj-$(CONFIG_RASPI) +=3D bcm2835_systmr.o<br>
+<br>
+obj-$(CONFIG_AVR_TIMER16) +=3D avr_timer16.o<br>
diff --git a/hw/timer/avr_timer16.c b/hw/timer/avr_timer16.c<br>
new file mode 100644<br>
index 0000000000..ac6ef73e77<br>
--- /dev/null<br>
+++ b/hw/timer/avr_timer16.c<br>
@@ -0,0 +1,605 @@<br>
+/*<br>
+ * AVR 16 bit timer<br>
+ *<br>
+ * Copyright (c) 2018 University of Kent<br>
+ * Author: Ed Robbins<br>
+ *<br>
+ * Permission is hereby granted, free of charge, to any person obtaining a=
 copy<br>
+ * of this software and associated documentation files (the &quot;Software=
&quot;), to deal<br>
+ * in the Software without restriction, including without limitation the r=
ights<br>
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or se=
ll<br>
+ * copies of the Software, and to permit persons to whom the Software is<b=
r>
+ * furnished to do so, subject to the following conditions:<br>
+ *<br>
+ * The above copyright notice and this permission notice shall be included=
 in<br>
+ * all copies or substantial portions of the Software.<br>
+ *<br>
+ * THE SOFTWARE IS PROVIDED &quot;AS IS&quot;, WITHOUT WARRANTY OF ANY KIN=
D, EXPRESS OR<br>
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY=
,<br>
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL=
<br>
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OT=
HER<br>
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING=
 FROM,<br>
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS =
IN<br>
+ * THE SOFTWARE.<br>
+ */<br>
+<br>
+/*<br>
+ * Driver for 16 bit timers on 8 bit AVR devices.<br>
+ * Note:<br>
+ * ATmega640/V-1280/V-1281/V-<wbr>2560/V-2561/V timers 1, 3, 4 and 5 are 1=
6 bit<br>
+ */<br>
+<br>
+/*<br>
+ * XXX TODO: Power Reduction Register support<br>
+ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0prescaler pause support<br>
+ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PWM modes, GPIO, output capture=
 pins, input compare pin<br>
+ */<br>
+<br>
+#include &quot;qemu/osdep.h&quot;<br>
+#include &quot;hw/timer/avr_timer16.h&quot;<br>
+#include &quot;qemu/log.h&quot;<br>
+#include &quot;hw/irq.h&quot;<br>
+#include &quot;hw/qdev-properties.h&quot;<br>
+<br>
+/* Register offsets */<br>
+#define T16_CRA=C2=A0 =C2=A0 =C2=A00x0<br>
+#define T16_CRB=C2=A0 =C2=A0 =C2=A00x1<br>
+#define T16_CRC=C2=A0 =C2=A0 =C2=A00x2<br>
+#define T16_CNTL=C2=A0 =C2=A0 0x4<br>
+#define T16_CNTH=C2=A0 =C2=A0 0x5<br>
+#define T16_ICRL=C2=A0 =C2=A0 0x6<br>
+#define T16_ICRH=C2=A0 =C2=A0 0x7<br>
+#define T16_OCRAL=C2=A0 =C2=A00x8<br>
+#define T16_OCRAH=C2=A0 =C2=A00x9<br>
+#define T16_OCRBL=C2=A0 =C2=A00xa<br>
+#define T16_OCRBH=C2=A0 =C2=A00xb<br>
+#define T16_OCRCL=C2=A0 =C2=A00xc<br>
+#define T16_OCRCH=C2=A0 =C2=A00xd<br>
+<br>
+/* Field masks */<br>
+#define T16_CRA_WGM01=C2=A0 =C2=A00x3<br>
+#define T16_CRA_COMC=C2=A0 =C2=A0 0xc<br>
+#define T16_CRA_COMB=C2=A0 =C2=A0 0x30<br>
+#define T16_CRA_COMA=C2=A0 =C2=A0 0xc0<br>
+#define T16_CRA_OC_CONF \<br>
+=C2=A0 =C2=A0 (T16_CRA_COMA | T16_CRA_COMB | T16_CRA_COMC)<br>
+<br>
+#define T16_CRB_CS=C2=A0 =C2=A0 =C2=A0 0x7<br>
+#define T16_CRB_WGM23=C2=A0 =C2=A00x18<br>
+#define T16_CRB_ICES=C2=A0 =C2=A0 0x40<br>
+#define T16_CRB_ICNC=C2=A0 =C2=A0 0x80<br>
+<br>
+#define T16_CRC_FOCC=C2=A0 =C2=A0 0x20<br>
+#define T16_CRC_FOCB=C2=A0 =C2=A0 0x40<br>
+#define T16_CRC_FOCA=C2=A0 =C2=A0 0x80<br>
+<br>
+/* Fields masks both TIMSK and TIFR (interrupt mask/flag registers) */<br>
+#define T16_INT_TOV=C2=A0 =C2=A0 0x1 /* Timer overflow */<br>
+#define T16_INT_OCA=C2=A0 =C2=A0 0x2 /* Output compare A */<br>
+#define T16_INT_OCB=C2=A0 =C2=A0 0x4 /* Output compare B */<br>
+#define T16_INT_OCC=C2=A0 =C2=A0 0x8 /* Output compare C */<br>
+#define T16_INT_IC=C2=A0 =C2=A0 =C2=A00x20 /* Input capture */<br>
+<br>
+/* Clock source values */<br>
+#define T16_CLKSRC_STOPPED=C2=A0 =C2=A0 =C2=A00<br>
+#define T16_CLKSRC_DIV1=C2=A0 =C2=A0 =C2=A0 =C2=A0 1<br>
+#define T16_CLKSRC_DIV8=C2=A0 =C2=A0 =C2=A0 =C2=A0 2<br>
+#define T16_CLKSRC_DIV64=C2=A0 =C2=A0 =C2=A0 =C2=A03<br>
+#define T16_CLKSRC_DIV256=C2=A0 =C2=A0 =C2=A0 4<br>
+#define T16_CLKSRC_DIV1024=C2=A0 =C2=A0 =C2=A05<br>
+#define T16_CLKSRC_EXT_FALLING 6<br>
+#define T16_CLKSRC_EXT_RISING=C2=A0 7<br>
+<br>
+/* Timer mode values (not including PWM modes) */<br>
+#define T16_MODE_NORMAL=C2=A0 =C2=A0 =C2=A00<br>
+#define T16_MODE_CTC_OCRA=C2=A0 =C2=A04<br>
+#define T16_MODE_CTC_ICR=C2=A0 =C2=A0 12<br>
+<br>
+/* Accessors */<br>
+#define CLKSRC(t16) (t16-&gt;crb &amp; T16_CRB_CS)<br>
+#define MODE(t16)=C2=A0 =C2=A0(((t16-&gt;crb &amp; T16_CRB_WGM23) &gt;&gt;=
 1) | \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0(t16-&gt;cra &amp; T16_CRA_WGM01))<br>
+#define CNT(t16)=C2=A0 =C2=A0 VAL16(t16-&gt;cntl, t16-&gt;cnth)<br>
+#define OCRA(t16)=C2=A0 =C2=A0VAL16(t16-&gt;ocral, t16-&gt;ocrah)<br>
+#define OCRB(t16)=C2=A0 =C2=A0VAL16(t16-&gt;ocrbl, t16-&gt;ocrbh)<br>
+#define OCRC(t16)=C2=A0 =C2=A0VAL16(t16-&gt;ocrcl, t16-&gt;ocrch)<br>
+#define ICR(t16)=C2=A0 =C2=A0 VAL16(t16-&gt;icrl, t16-&gt;icrh)<br>
+<br>
+/* Helper macros */<br>
+#define VAL16(l, h) ((h &lt;&lt; 8) | l)<br>
+#define ERROR(fmt, args...) \<br>
+=C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR, &quot;%s: &quot; fmt &quot;\n=
&quot;, __func__, ## args)<br>
+#define DB_PRINT(fmt, args...) /* Nothing */<br>
+/*#define DB_PRINT(fmt, args...) printf(&quot;%s: &quot; fmt &quot;\n&quot=
;, __func__, ## args)*/<br>
+<br>
+static inline int64_t avr_timer16_ns_to_ticks(<wbr>AVRTimer16State *t16, i=
nt64_t t)<br>
+{<br>
+=C2=A0 =C2=A0 if (t16-&gt;period_ns =3D=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 return t / t16-&gt;period_ns;<br>
+}<br>
+<br>
+static void avr_timer16_update_cnt(<wbr>AVRTimer16State *t16)<br>
+{<br>
+=C2=A0 =C2=A0 uint16_t cnt;<br>
+=C2=A0 =C2=A0 cnt =3D avr_timer16_ns_to_ticks(t16, qemu_clock_get_ns(QEMU_=
CLOCK_<wbr>VIRTUAL) -<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0t16-&gt;r=
eset_time_ns);<br>
+=C2=A0 =C2=A0 t16-&gt;cntl =3D (uint8_t)(cnt &amp; 0xff);<br>
+=C2=A0 =C2=A0 t16-&gt;cnth =3D (uint8_t)((cnt &amp; 0xff00) &gt;&gt; 8);<b=
r>
+}<br>
+<br>
+static inline void avr_timer16_recalc_reset_time(<wbr>AVRTimer16State *t16=
)<br>
+{<br>
+=C2=A0 =C2=A0 t16-&gt;reset_time_ns =3D qemu_clock_get_ns(QEMU_CLOCK_<wbr>=
VIRTUAL) -<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0CNT(t16) * t16-&gt;period_ns;<br>
+}<br>
+<br>
+static void avr_timer16_clock_reset(<wbr>AVRTimer16State *t16)<br>
+{<br>
+=C2=A0 =C2=A0 t16-&gt;cntl =3D 0;<br>
+=C2=A0 =C2=A0 t16-&gt;cnth =3D 0;<br>
+=C2=A0 =C2=A0 t16-&gt;reset_time_ns =3D qemu_clock_get_ns(QEMU_CLOCK_<wbr>=
VIRTUAL);<br>
+}<br>
+<br>
+static void avr_timer16_clksrc_update(<wbr>AVRTimer16State *t16)<br>
+{<br>
+=C2=A0 =C2=A0 uint16_t divider =3D 0;<br>
+=C2=A0 =C2=A0 switch (CLKSRC(t16)) {<br>
+=C2=A0 =C2=A0 case T16_CLKSRC_EXT_FALLING:<br>
+=C2=A0 =C2=A0 case T16_CLKSRC_EXT_RISING:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ERROR(&quot;external clock source unsupported&=
quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto end;<br>
+=C2=A0 =C2=A0 case T16_CLKSRC_STOPPED:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto end;<br>
+=C2=A0 =C2=A0 case T16_CLKSRC_DIV1:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 divider =3D 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case T16_CLKSRC_DIV8:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 divider =3D 8;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case T16_CLKSRC_DIV64:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 divider =3D 64;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case T16_CLKSRC_DIV256:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 divider =3D 256;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case T16_CLKSRC_DIV1024:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 divider =3D 1024;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto end;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 t16-&gt;freq_hz =3D t16-&gt;cpu_freq_hz / divider;<br>
+=C2=A0 =C2=A0 t16-&gt;period_ns =3D 1000000000ULL / t16-&gt;freq_hz;<br>
+=C2=A0 =C2=A0 DB_PRINT(&quot;Timer frequency %&quot; PRIu64 &quot; hz, per=
iod %&quot; PRIu64 &quot; ns (%f s)&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0t16-&gt;freq_hz, t16-&gt;p=
eriod_ns, 1 / (double)t16-&gt;freq_hz);<br>
+end:<br>
+=C2=A0 =C2=A0 return;<br>
+}<br>
+<br>
+static void avr_timer16_set_alarm(<wbr>AVRTimer16State *t16)<br>
+{<br>
+=C2=A0 =C2=A0 if (CLKSRC(t16) =3D=3D T16_CLKSRC_EXT_FALLING ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 CLKSRC(t16) =3D=3D T16_CLKSRC_EXT_RISING ||<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 CLKSRC(t16) =3D=3D T16_CLKSRC_STOPPED) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Timer is disabled or set to external clock =
source (unsupported) */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto end;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 uint64_t alarm_offset =3D 0xffff;<br>
+=C2=A0 =C2=A0 enum NextInterrupt next_interrupt =3D OVERFLOW;<br>
+<br>
+=C2=A0 =C2=A0 switch (MODE(t16)) {<br>
+=C2=A0 =C2=A0 case T16_MODE_NORMAL:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Normal mode */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (OCRA(t16) &lt; alarm_offset &amp;&amp; OCR=
A(t16) &gt; CNT(t16) &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (t16-&gt;imsk &amp; T16_INT_OCA)=
) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 alarm_offset =3D OCRA(t16);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 next_interrupt =3D COMPA;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case T16_MODE_CTC_OCRA:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* CTC mode, top =3D ocra */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (OCRA(t16) &lt; alarm_offset &amp;&amp; OCR=
A(t16) &gt; CNT(t16)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 alarm_offset =3D OCRA(t16);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 next_interrupt =3D COMPA;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 case T16_MODE_CTC_ICR:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* CTC mode, top =3D icr */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ICR(t16) &lt; alarm_offset &amp;&amp; ICR(=
t16) &gt; CNT(t16)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 alarm_offset =3D ICR(t16);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 next_interrupt =3D CAPT;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (OCRA(t16) &lt; alarm_offset &amp;&amp; OCR=
A(t16) &gt; CNT(t16) &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (t16-&gt;imsk &amp; T16_INT_OCA)=
) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 alarm_offset =3D OCRA(t16);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 next_interrupt =3D COMPA;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ERROR(&quot;pwm modes are unsupported&quot;);<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto end;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 if (OCRB(t16) &lt; alarm_offset &amp;&amp; OCRB(t16) &gt; CN=
T(t16) &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (t16-&gt;imsk &amp; T16_INT_OCB)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 alarm_offset =3D OCRB(t16);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 next_interrupt =3D COMPB;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 if (OCRC(t16) &lt; alarm_offset &amp;&amp; OCRB(t16) &gt; CN=
T(t16) &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (t16-&gt;imsk &amp; T16_INT_OCC)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 alarm_offset =3D OCRB(t16);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 next_interrupt =3D COMPC;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 alarm_offset -=3D CNT(t16);<br>
+<br>
+=C2=A0 =C2=A0 t16-&gt;next_interrupt =3D next_interrupt;<br>
+=C2=A0 =C2=A0 uint64_t alarm_ns =3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 t16-&gt;reset_time_ns + ((CNT(t16) + alarm_off=
set) * t16-&gt;period_ns);<br>
+=C2=A0 =C2=A0 timer_mod(t16-&gt;timer, alarm_ns);<br>
+<br>
+=C2=A0 =C2=A0 DB_PRINT(&quot;next alarm %&quot; PRIu64 &quot; ns from now&=
quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 alarm_offset * t16-&gt;period_ns);<br>
+<br>
+end:<br>
+=C2=A0 =C2=A0 return;<br>
+}<br>
+<br>
+static void avr_timer16_interrupt(void *opaque)<br>
+{<br>
+=C2=A0 =C2=A0 AVRTimer16State *t16 =3D opaque;<br>
+=C2=A0 =C2=A0 uint8_t mode =3D MODE(t16);<br>
+<br>
+=C2=A0 =C2=A0 avr_timer16_update_cnt(t16);<br>
+<br>
+=C2=A0 =C2=A0 if (CLKSRC(t16) =3D=3D T16_CLKSRC_EXT_FALLING ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 CLKSRC(t16) =3D=3D T16_CLKSRC_EXT_RISING ||<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 CLKSRC(t16) =3D=3D T16_CLKSRC_STOPPED) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Timer is disabled or set to external clock =
source (unsupported) */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 DB_PRINT(&quot;interrupt, cnt =3D %d&quot;, CNT(t16));<br>
+<br>
+=C2=A0 =C2=A0 /* Counter overflow */<br>
+=C2=A0 =C2=A0 if (t16-&gt;next_interrupt =3D=3D OVERFLOW) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 DB_PRINT(&quot;0xffff overflow&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 avr_timer16_clock_reset(t16);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (t16-&gt;imsk &amp; T16_INT_TOV) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t16-&gt;ifr |=3D T16_INT_TOV;<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_set_irq(t16-&gt;ovf_irq, 1)=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 /* Check for ocra overflow in CTC mode */<br>
+=C2=A0 =C2=A0 if (mode =3D=3D T16_MODE_CTC_OCRA &amp;&amp; t16-&gt;next_in=
terrupt =3D=3D COMPA) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 DB_PRINT(&quot;CTC OCRA overflow&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 avr_timer16_clock_reset(t16);<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 /* Check for icr overflow in CTC mode */<br>
+=C2=A0 =C2=A0 if (mode =3D=3D T16_MODE_CTC_ICR &amp;&amp; t16-&gt;next_int=
errupt =3D=3D CAPT) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 DB_PRINT(&quot;CTC ICR overflow&quot;);-- <br>
2.17.2 (Apple Git-113)<br>
<br>
</blockquote>

--000000000000f3fcd90598f9535b--

