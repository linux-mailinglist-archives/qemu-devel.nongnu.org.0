Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7DF33A428
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 11:28:57 +0100 (CET)
Received: from localhost ([::1]:59836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLNzU-0003hf-MN
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 06:28:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lLNxI-00030q-4K
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 06:26:40 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:56586
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lLNxC-0006hd-Fs
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 06:26:39 -0400
Received: from host109-156-104-46.range109-156.btcentralplus.com
 ([109.156.104.46] helo=[192.168.1.110])
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lLNx4-0007zy-D3; Sun, 14 Mar 2021 10:26:30 +0000
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210313165445.2113938-1-f4bug@amsat.org>
 <20210313165445.2113938-4-f4bug@amsat.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <455aa753-fa80-df43-a374-10a9a7903eab@ilande.co.uk>
Date: Sun, 14 Mar 2021 10:26:19 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210313165445.2113938-4-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 109.156.104.46
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 03/11] hw/avr: Add limited support for avr gpio registers
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <huth@tuxfamily.org>, Sarah Harris <S.E.Harris@kent.ac.uk>,
 Michael Rolnik <mrolnik@gmail.com>, Heecheol Yang <heecheol.yang@outlook.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/03/2021 16:54, Philippe Mathieu-Daudé wrote:

> From: Heecheol Yang <heecheol.yang@outlook.com>
> 
> Add some of these features for AVR GPIO:
> 
>    - GPIO I/O : PORTx registers
>    - Data Direction : DDRx registers
>    - DDRx toggling : PINx registers
> 
> Following things are not supported yet:
>    - MCUR registers
> 
> Signed-off-by: Heecheol Yang <heecheol.yang@outlook.com>
> Reviewed-by: Michael Rolnik <mrolnik@gmail.com>
> Message-Id: <DM6PR16MB247368DBD3447ABECDD795D7E6090@DM6PR16MB2473.namprd16.prod.outlook.com>
> [PMD: Use AVR_GPIO_COUNT]
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   hw/avr/atmega.h            |   2 +
>   include/hw/gpio/avr_gpio.h |  53 ++++++++++++++
>   hw/avr/atmega.c            |   7 +-
>   hw/gpio/avr_gpio.c         | 138 +++++++++++++++++++++++++++++++++++++
>   hw/avr/Kconfig             |   1 +
>   hw/gpio/Kconfig            |   3 +
>   hw/gpio/meson.build        |   1 +
>   7 files changed, 203 insertions(+), 2 deletions(-)
>   create mode 100644 include/hw/gpio/avr_gpio.h
>   create mode 100644 hw/gpio/avr_gpio.c
> 
> diff --git a/hw/avr/atmega.h b/hw/avr/atmega.h
> index a99ee15c7e1..e2289d5744e 100644
> --- a/hw/avr/atmega.h
> +++ b/hw/avr/atmega.h
> @@ -13,6 +13,7 @@
>   
>   #include "hw/char/avr_usart.h"
>   #include "hw/timer/avr_timer16.h"
> +#include "hw/gpio/avr_gpio.h"
>   #include "hw/misc/avr_power.h"
>   #include "target/avr/cpu.h"
>   #include "qom/object.h"
> @@ -44,6 +45,7 @@ struct AtmegaMcuState {
>       DeviceState *io;
>       AVRMaskState pwr[POWER_MAX];
>       AVRUsartState usart[USART_MAX];
> +    AVRGPIOState gpio[GPIO_MAX];
>       AVRTimer16State timer[TIMER_MAX];
>       uint64_t xtal_freq_hz;
>   };
> diff --git a/include/hw/gpio/avr_gpio.h b/include/hw/gpio/avr_gpio.h
> new file mode 100644
> index 00000000000..498a7275f05
> --- /dev/null
> +++ b/include/hw/gpio/avr_gpio.h
> @@ -0,0 +1,53 @@
> +/*
> + * AVR processors GPIO registers definition.
> + *
> + * Copyright (C) 2020 Heecheol Yang <heecheol.yang@outlook.com>
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License as
> + * published by the Free Software Foundation; either version 2 or
> + * (at your option) version 3 of the License.

Minor nit: isn't the wording of the existing QEMU license "licensed under the terms 
of the GNU GPL, version 2 or later" rather than explicitly stating versions 2 and 3?

> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License along
> + * with this program; if not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#ifndef AVR_GPIO_H
> +#define AVR_GPIO_H
> +
> +#include "hw/sysbus.h"
> +#include "qom/object.h"
> +
> +/* Offsets of registers. */
> +#define GPIO_PIN   0x00
> +#define GPIO_DDR   0x01
> +#define GPIO_PORT  0x02
> +
> +#define TYPE_AVR_GPIO "avr-gpio"
> +OBJECT_DECLARE_SIMPLE_TYPE(AVRGPIOState, AVR_GPIO)
> +#define AVR_GPIO_COUNT 8
> +
> +struct AVRGPIOState {
> +    /*< private >*/
> +    SysBusDevice parent_obj;
> +
> +    /*< public >*/
> +    MemoryRegion mmio;
> +
> +    struct {
> +        uint8_t pin;
> +        uint8_t ddr;
> +        uint8_t port;
> +    } reg;
> +
> +    /* PORTx data changed IRQs */
> +    qemu_irq out[8u];
> +
> +};
> +
> +#endif /* AVR_GPIO_H */
> diff --git a/hw/avr/atmega.c b/hw/avr/atmega.c
> index 44c6afebbb6..19c3122189f 100644
> --- a/hw/avr/atmega.c
> +++ b/hw/avr/atmega.c
> @@ -283,8 +283,11 @@ static void atmega_realize(DeviceState *dev, Error **errp)
>               continue;
>           }
>           devname = g_strdup_printf("atmega-gpio-%c", 'a' + (char)i);
> -        create_unimplemented_device(devname,
> -                                    OFFSET_DATA + mc->dev[idx].addr, 3);
> +        object_initialize_child(OBJECT(dev), devname, &s->gpio[i],
> +                                TYPE_AVR_GPIO);
> +        sysbus_realize(SYS_BUS_DEVICE(&s->gpio[i]), &error_abort);
> +        sysbus_mmio_map(SYS_BUS_DEVICE(&s->gpio[i]), 0,
> +                        OFFSET_DATA + mc->dev[idx].addr);
>           g_free(devname);
>       }
>   
> diff --git a/hw/gpio/avr_gpio.c b/hw/gpio/avr_gpio.c
> new file mode 100644
> index 00000000000..cdb574ef0d8
> --- /dev/null
> +++ b/hw/gpio/avr_gpio.c
> @@ -0,0 +1,138 @@
> +/*
> + * AVR processors GPIO registers emulation.
> + *
> + * Copyright (C) 2020 Heecheol Yang <heecheol.yang@outlook.com>
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License as
> + * published by the Free Software Foundation; either version 2 or
> + * (at your option) version 3 of the License.

And here too.

> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License along
> + * with this program; if not, see <http://www.gnu.org/licenses/>.
> + */
> +#include "qemu/osdep.h"
> +#include "qemu/log.h"
> +#include "qemu/module.h"
> +#include "qemu/osdep.h"
> +#include "qapi/error.h"
> +#include "hw/sysbus.h"
> +#include "hw/irq.h"
> +#include "hw/gpio/avr_gpio.h"
> +#include "hw/qdev-properties.h"
> +
> +static void avr_gpio_reset(DeviceState *dev)
> +{
> +    AVRGPIOState *gpio = AVR_GPIO(dev);
> +
> +    gpio->reg.pin = 0u;
> +    gpio->reg.ddr = 0u;
> +    gpio->reg.port = 0u;
> +}
> +
> +static void avr_gpio_write_port(AVRGPIOState *s, uint64_t value)
> +{
> +    uint8_t pin;
> +    uint8_t cur_port_val = s->reg.port;
> +    uint8_t cur_ddr_val = s->reg.ddr;
> +
> +    for (pin = 0u; pin < AVR_GPIO_COUNT ; pin++) {
> +        uint8_t cur_port_pin_val = cur_port_val & 0x01u;
> +        uint8_t cur_ddr_pin_val = cur_ddr_val & 0x01u;
> +        uint8_t new_port_pin_val = value & 0x01u;
> +
> +        if (cur_ddr_pin_val && (cur_port_pin_val != new_port_pin_val)) {
> +            qemu_set_irq(s->out[pin], new_port_pin_val);
> +        }
> +        cur_port_val >>= 1u;
> +        cur_ddr_val >>= 1u;
> +        value >>= 1u;
> +    }
> +    s->reg.port = value & s->reg.ddr;
> +}
> +static uint64_t avr_gpio_read(void *opaque, hwaddr offset, unsigned int size)
> +{
> +    AVRGPIOState *s = (AVRGPIOState *)opaque;
> +    switch (offset) {
> +    case GPIO_PIN:
> +        return s->reg.pin;
> +    case GPIO_DDR:
> +        return s->reg.ddr;
> +    case GPIO_PORT:
> +        return s->reg.port;
> +    default:
> +        g_assert_not_reached();
> +        break;
> +    }
> +    return 0;
> +}
> +
> +static void avr_gpio_write(void *opaque, hwaddr offset, uint64_t value,
> +                                unsigned int size)
> +{
> +    AVRGPIOState *s = (AVRGPIOState *)opaque;
> +    value = value & 0xF;
> +    switch (offset) {
> +    case GPIO_PIN:
> +        s->reg.pin = value;
> +        s->reg.port ^= s->reg.pin;
> +        break;
> +    case GPIO_DDR:
> +        s->reg.ddr = value;
> +        break;
> +    case GPIO_PORT:
> +        avr_gpio_write_port(s, value);
> +        break;
> +    default:
> +        g_assert_not_reached();
> +        break;
> +    }
> +}
> +
> +static const MemoryRegionOps avr_gpio_ops = {
> +    .read = avr_gpio_read,
> +    .write = avr_gpio_write,
> +    .endianness = DEVICE_NATIVE_ENDIAN,
> +};
> +
> +static void avr_gpio_init(Object *obj)
> +{
> +    AVRGPIOState *s = AVR_GPIO(obj);
> +
> +    qdev_init_gpio_out(DEVICE(obj), s->out, ARRAY_SIZE(s->out));
> +    memory_region_init_io(&s->mmio, obj, &avr_gpio_ops, s, TYPE_AVR_GPIO, 3);
> +    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mmio);
> +}
> +static void avr_gpio_realize(DeviceState *dev, Error **errp)
> +{
> +    /* Do nothing currently */
> +}
> +
> +
> +static void avr_gpio_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->reset = avr_gpio_reset;
> +    dc->realize = avr_gpio_realize;
> +}
> +
> +static const TypeInfo avr_gpio_info = {
> +    .name          = TYPE_AVR_GPIO,
> +    .parent        = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(AVRGPIOState),
> +    .instance_init = avr_gpio_init,
> +    .class_init    = avr_gpio_class_init,
> +};
> +
> +static void avr_gpio_register_types(void)
> +{
> +    type_register_static(&avr_gpio_info);
> +}
> +
> +type_init(avr_gpio_register_types)
> diff --git a/hw/avr/Kconfig b/hw/avr/Kconfig
> index d31298c3cce..16a57ced11f 100644
> --- a/hw/avr/Kconfig
> +++ b/hw/avr/Kconfig
> @@ -3,6 +3,7 @@ config AVR_ATMEGA_MCU
>       select AVR_TIMER16
>       select AVR_USART
>       select AVR_POWER
> +    select AVR_GPIO
>   
>   config ARDUINO
>       select AVR_ATMEGA_MCU
> diff --git a/hw/gpio/Kconfig b/hw/gpio/Kconfig
> index f0e7405f6e6..fde7019b2ba 100644
> --- a/hw/gpio/Kconfig
> +++ b/hw/gpio/Kconfig
> @@ -13,3 +13,6 @@ config GPIO_PWR
>   
>   config SIFIVE_GPIO
>       bool
> +
> +config AVR_GPIO
> +    bool
> diff --git a/hw/gpio/meson.build b/hw/gpio/meson.build
> index 79568f00ce3..366aca52ca2 100644
> --- a/hw/gpio/meson.build
> +++ b/hw/gpio/meson.build
> @@ -13,3 +13,4 @@
>   softmmu_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_gpio.c'))
>   softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('aspeed_gpio.c'))
>   softmmu_ss.add(when: 'CONFIG_SIFIVE_GPIO', if_true: files('sifive_gpio.c'))
> +softmmu_ss.add(when: 'CONFIG_AVR_GPIO', if_true: files('avr_gpio.c'))

Not that I can see GPL 4 coming on the horizon, but given there was a large exercise 
a while back to clarify the licensing of all the files in the QEMU tree it is worth 
someone who knows more about licensing to check this.


ATB,

Mark.

