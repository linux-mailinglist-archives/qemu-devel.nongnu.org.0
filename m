Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3495ECBC2
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 19:56:20 +0200 (CEST)
Received: from localhost ([::1]:35062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odEod-0002HL-Ad
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 13:56:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mrolnik@gmail.com>) id 1odElt-0007nh-7X
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 13:53:29 -0400
Received: from mail-vs1-xe31.google.com ([2607:f8b0:4864:20::e31]:45838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mrolnik@gmail.com>) id 1odElq-0005Ee-7u
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 13:53:29 -0400
Received: by mail-vs1-xe31.google.com with SMTP id m66so10390116vsm.12
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 10:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=6mV8yXTFIfNVNPfq9w7otsGeHY7uzU8qCE8wm8HcEsQ=;
 b=HaMPSl+QAl6rAGwpjllbEdBHk2oiumLN9uAUff2YFoY+sxm0V0zrNegIanSK6PyEs2
 ytunTiwSHZeDUVeE7HemBrPtiKN+XO/3a3Z1nEtTjk6biPLm1brhW8zUUmnqIQVecIZp
 WOhuhNt1Sb6V/j6QJYXwSnfAM86xG2wpaNIxLgf0N1kYe0RuxGkcD2h475ve51vzgexb
 imCGpvwf3T2FOhRuWaZShVUwQUdYM+SAu8Ykfp7pKeFBBIY5ZseSFz7blHQjOWrEmwLI
 F9dmagZirkB+oHSLsHOJpP9/zUdaqJBT0wMDDow3/cY0KRalR8su+Lc8EcP7sNOmudPR
 eW6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=6mV8yXTFIfNVNPfq9w7otsGeHY7uzU8qCE8wm8HcEsQ=;
 b=yUrH7Aez95WM2jsbiMRNxq7O9xm8kvsS1ZT7TppqMREGO1F0xgiPvUB6aVznOHa5KW
 gQk05RLv9GC9LO4h8wxiRlJJxJteuVM7qm8vkTso8ZZkPcPWOnyTapyhRvRiRG6JJ/Xn
 UwNKUXCsPhId3x9qdXkZcMvzP+4dPLxMyiDTz1NvJHdRKwDpySaOo6AAquM4ySYAKvag
 YsqhtLCGvezXDsbmcD0lf/kmhOc2yYKj5M+H8WGWC4fvlj9EQd5g31JIKlY7vqO1NO8B
 qjO0H+jG0zwJdG9nOFhS1w4YR5xTvmnvq/4xqj3H22aqBHvUh5i7coriX3tCe4Cpnzli
 yB4A==
X-Gm-Message-State: ACrzQf3qGcnnR1pvMfd8s5ZblWKosyrkteHxnljyV/w+oBPdwsD49b+f
 JQOuT87S742ZwHCSCpprRWsUwhrwI0qyjNFN1nw=
X-Google-Smtp-Source: AMsMyM5QmrBtOVmrRKal5lrEgsalIOmUeTXDIjmUfcJ6jQyJ655zgKaLBQFdMCQPcAFS0uk7b3QJ+UxDTAeMpWDhcz8=
X-Received: by 2002:a67:a246:0:b0:398:a4f4:aed1 with SMTP id
 t6-20020a67a246000000b00398a4f4aed1mr11896292vsh.6.1664301204726; Tue, 27 Sep
 2022 10:53:24 -0700 (PDT)
MIME-Version: 1.0
References: <DM5PR06MB253775CC03F84F6A36F44370E6449@DM5PR06MB2537.namprd06.prod.outlook.com>
In-Reply-To: <DM5PR06MB253775CC03F84F6A36F44370E6449@DM5PR06MB2537.namprd06.prod.outlook.com>
From: Michael Rolnik <mrolnik@gmail.com>
Date: Tue, 27 Sep 2022 20:52:48 +0300
Message-ID: <CAK4993hVNwnC5fAroLYxhJ1HM5xhg3yRKQ1X3NyyGRwUnzxS9g@mail.gmail.com>
Subject: Re: [PATCH 1/8] hw/avr: Add limited support for avr gpio registers
To: Heecheol Yang <heecheol.yang@outlook.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="0000000000001b6a2805e9ac52ad"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e31;
 envelope-from=mrolnik@gmail.com; helo=mail-vs1-xe31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000001b6a2805e9ac52ad
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

Is there any kind of web UI where I can review it?
I don't find this patch in https://patchew.org/  (there is only 2 year old
version (https://patchew.org/search?q=3Dproject%3AQEMU+%22hw%2Favr%22))

Thank you,
Michael Rolnik

On Mon, Sep 12, 2022 at 2:21 PM Heecheol Yang <heecheol.yang@outlook.com>
wrote:

> Add some of these features for AVR GPIO:
>
>   - GPIO I/O : PORTx registers
>   - Data Direction : DDRx registers
>   - DDRx toggling : PINx registers
>
> Following things are not supported yet:
>   - MCUR registers
>
> Signed-off-by: Heecheol Yang <heecheol.yang@outlook.com>
> Reviewed-by: Michael Rolnik <mrolnik@gmail.com>
> Message-Id: <
> DM6PR16MB247368DBD3447ABECDD795D7E6090@DM6PR16MB2473.namprd16.prod.outloo=
k.com
> >
> [PMD: Use AVR_GPIO_COUNT]
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Message-Id: <20210313165445.2113938-4-f4bug@amsat.org>
> ---
>  hw/avr/Kconfig             |   1 +
>  hw/avr/atmega.c            |   7 +-
>  hw/avr/atmega.h            |   2 +
>  hw/gpio/Kconfig            |   3 +
>  hw/gpio/avr_gpio.c         | 138 +++++++++++++++++++++++++++++++++++++
>  hw/gpio/meson.build        |   1 +
>  include/hw/gpio/avr_gpio.h |  53 ++++++++++++++
>  7 files changed, 203 insertions(+), 2 deletions(-)
>  create mode 100644 hw/gpio/avr_gpio.c
>  create mode 100644 include/hw/gpio/avr_gpio.h
>
> diff --git a/hw/avr/Kconfig b/hw/avr/Kconfig
> index d31298c3cc..16a57ced11 100644
> --- a/hw/avr/Kconfig
> +++ b/hw/avr/Kconfig
> @@ -3,6 +3,7 @@ config AVR_ATMEGA_MCU
>      select AVR_TIMER16
>      select AVR_USART
>      select AVR_POWER
> +    select AVR_GPIO
>
>  config ARDUINO
>      select AVR_ATMEGA_MCU
> diff --git a/hw/avr/atmega.c b/hw/avr/atmega.c
> index a34803e642..f5fb3a5225 100644
> --- a/hw/avr/atmega.c
> +++ b/hw/avr/atmega.c
> @@ -282,8 +282,11 @@ static void atmega_realize(DeviceState *dev, Error
> **errp)
>              continue;
>          }
>          devname =3D g_strdup_printf("atmega-gpio-%c", 'a' + (char)i);
> -        create_unimplemented_device(devname,
> -                                    OFFSET_DATA + mc->dev[idx].addr, 3);
> +        object_initialize_child(OBJECT(dev), devname, &s->gpio[i],
> +                                TYPE_AVR_GPIO);
> +        sysbus_realize(SYS_BUS_DEVICE(&s->gpio[i]), &error_abort);
> +        sysbus_mmio_map(SYS_BUS_DEVICE(&s->gpio[i]), 0,
> +                        OFFSET_DATA + mc->dev[idx].addr);
>          g_free(devname);
>      }
>
> diff --git a/hw/avr/atmega.h b/hw/avr/atmega.h
> index a99ee15c7e..e2289d5744 100644
> --- a/hw/avr/atmega.h
> +++ b/hw/avr/atmega.h
> @@ -13,6 +13,7 @@
>
>  #include "hw/char/avr_usart.h"
>  #include "hw/timer/avr_timer16.h"
> +#include "hw/gpio/avr_gpio.h"
>  #include "hw/misc/avr_power.h"
>  #include "target/avr/cpu.h"
>  #include "qom/object.h"
> @@ -44,6 +45,7 @@ struct AtmegaMcuState {
>      DeviceState *io;
>      AVRMaskState pwr[POWER_MAX];
>      AVRUsartState usart[USART_MAX];
> +    AVRGPIOState gpio[GPIO_MAX];
>      AVRTimer16State timer[TIMER_MAX];
>      uint64_t xtal_freq_hz;
>  };
> diff --git a/hw/gpio/Kconfig b/hw/gpio/Kconfig
> index f0e7405f6e..fde7019b2b 100644
> --- a/hw/gpio/Kconfig
> +++ b/hw/gpio/Kconfig
> @@ -13,3 +13,6 @@ config GPIO_PWR
>
>  config SIFIVE_GPIO
>      bool
> +
> +config AVR_GPIO
> +    bool
> diff --git a/hw/gpio/avr_gpio.c b/hw/gpio/avr_gpio.c
> new file mode 100644
> index 0000000000..cdb574ef0d
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
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License alo=
ng
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
> +    AVRGPIOState *gpio =3D AVR_GPIO(dev);
> +
> +    gpio->reg.pin =3D 0u;
> +    gpio->reg.ddr =3D 0u;
> +    gpio->reg.port =3D 0u;
> +}
> +
> +static void avr_gpio_write_port(AVRGPIOState *s, uint64_t value)
> +{
> +    uint8_t pin;
> +    uint8_t cur_port_val =3D s->reg.port;
> +    uint8_t cur_ddr_val =3D s->reg.ddr;
> +
> +    for (pin =3D 0u; pin < AVR_GPIO_COUNT ; pin++) {
> +        uint8_t cur_port_pin_val =3D cur_port_val & 0x01u;
> +        uint8_t cur_ddr_pin_val =3D cur_ddr_val & 0x01u;
> +        uint8_t new_port_pin_val =3D value & 0x01u;
> +
> +        if (cur_ddr_pin_val && (cur_port_pin_val !=3D new_port_pin_val))=
 {
> +            qemu_set_irq(s->out[pin], new_port_pin_val);
> +        }
> +        cur_port_val >>=3D 1u;
> +        cur_ddr_val >>=3D 1u;
> +        value >>=3D 1u;
> +    }
> +    s->reg.port =3D value & s->reg.ddr;
> +}
> +static uint64_t avr_gpio_read(void *opaque, hwaddr offset, unsigned int
> size)
> +{
> +    AVRGPIOState *s =3D (AVRGPIOState *)opaque;
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
> +    AVRGPIOState *s =3D (AVRGPIOState *)opaque;
> +    value =3D value & 0xF;
> +    switch (offset) {
> +    case GPIO_PIN:
> +        s->reg.pin =3D value;
> +        s->reg.port ^=3D s->reg.pin;
> +        break;
> +    case GPIO_DDR:
> +        s->reg.ddr =3D value;
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
> +static const MemoryRegionOps avr_gpio_ops =3D {
> +    .read =3D avr_gpio_read,
> +    .write =3D avr_gpio_write,
> +    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +};
> +
> +static void avr_gpio_init(Object *obj)
> +{
> +    AVRGPIOState *s =3D AVR_GPIO(obj);
> +
> +    qdev_init_gpio_out(DEVICE(obj), s->out, ARRAY_SIZE(s->out));
> +    memory_region_init_io(&s->mmio, obj, &avr_gpio_ops, s, TYPE_AVR_GPIO=
,
> 3);
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
> +    DeviceClass *dc =3D DEVICE_CLASS(klass);
> +
> +    dc->reset =3D avr_gpio_reset;
> +    dc->realize =3D avr_gpio_realize;
> +}
> +
> +static const TypeInfo avr_gpio_info =3D {
> +    .name          =3D TYPE_AVR_GPIO,
> +    .parent        =3D TYPE_SYS_BUS_DEVICE,
> +    .instance_size =3D sizeof(AVRGPIOState),
> +    .instance_init =3D avr_gpio_init,
> +    .class_init    =3D avr_gpio_class_init,
> +};
> +
> +static void avr_gpio_register_types(void)
> +{
> +    type_register_static(&avr_gpio_info);
> +}
> +
> +type_init(avr_gpio_register_types)
> diff --git a/hw/gpio/meson.build b/hw/gpio/meson.build
> index 7bd6a57264..ef372bdd3b 100644
> --- a/hw/gpio/meson.build
> +++ b/hw/gpio/meson.build
> @@ -12,3 +12,4 @@ softmmu_ss.add(when: 'CONFIG_OMAP', if_true:
> files('omap_gpio.c'))
>  softmmu_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_gpio.c'))
>  softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('aspeed_gpio.c'=
))
>  softmmu_ss.add(when: 'CONFIG_SIFIVE_GPIO', if_true:
> files('sifive_gpio.c'))
> +softmmu_ss.add(when: 'CONFIG_AVR_GPIO', if_true: files('avr_gpio.c'))
> diff --git a/include/hw/gpio/avr_gpio.h b/include/hw/gpio/avr_gpio.h
> new file mode 100644
> index 0000000000..498a7275f0
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
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License alo=
ng
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
> --
> 2.34.1
>
>

--=20
Best Regards,
Michael Rolnik

--0000000000001b6a2805e9ac52ad
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,<div><br></div><div>Is there any kind of web UI whe=
re I can review it?</div><div>I don&#39;t find this patch in=C2=A0<a href=
=3D"https://patchew.org/">https://patchew.org/</a>=C2=A0 (there is only 2 y=
ear old version (<a href=3D"https://patchew.org/search?q=3Dproject%3AQEMU+%=
22hw%2Favr%22">https://patchew.org/search?q=3Dproject%3AQEMU+%22hw%2Favr%22=
</a>))</div><div><br></div><div>Thank you,</div><div>Michael Rolnik</div></=
div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On=
 Mon, Sep 12, 2022 at 2:21 PM Heecheol Yang &lt;<a href=3D"mailto:heecheol.=
yang@outlook.com">heecheol.yang@outlook.com</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">Add some of these features for A=
VR GPIO:<br>
<br>
=C2=A0 - GPIO I/O : PORTx registers<br>
=C2=A0 - Data Direction : DDRx registers<br>
=C2=A0 - DDRx toggling : PINx registers<br>
<br>
Following things are not supported yet:<br>
=C2=A0 - MCUR registers<br>
<br>
Signed-off-by: Heecheol Yang &lt;<a href=3D"mailto:heecheol.yang@outlook.co=
m" target=3D"_blank">heecheol.yang@outlook.com</a>&gt;<br>
Reviewed-by: Michael Rolnik &lt;<a href=3D"mailto:mrolnik@gmail.com" target=
=3D"_blank">mrolnik@gmail.com</a>&gt;<br>
Message-Id: &lt;<a href=3D"mailto:DM6PR16MB247368DBD3447ABECDD795D7E6090@DM=
6PR16MB2473.namprd16.prod.outlook.com" target=3D"_blank">DM6PR16MB247368DBD=
3447ABECDD795D7E6090@DM6PR16MB2473.namprd16.prod.outlook.com</a>&gt;<br>
[PMD: Use AVR_GPIO_COUNT]<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsa=
t.org" target=3D"_blank">f4bug@amsat.org</a>&gt;<br>
Message-Id: &lt;<a href=3D"mailto:20210313165445.2113938-4-f4bug@amsat.org"=
 target=3D"_blank">20210313165445.2113938-4-f4bug@amsat.org</a>&gt;<br>
---<br>
=C2=A0hw/avr/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0=
 =C2=A01 +<br>
=C2=A0hw/avr/atmega.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A07 +-<br>
=C2=A0hw/avr/atmega.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A02 +<br>
=C2=A0hw/gpio/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A03 +<br>
=C2=A0hw/gpio/avr_gpio.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 138 +++++++++++=
++++++++++++++++++++++++++<br>
=C2=A0hw/gpio/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0include/hw/gpio/avr_gpio.h |=C2=A0 53 ++++++++++++++<br>
=C2=A07 files changed, 203 insertions(+), 2 deletions(-)<br>
=C2=A0create mode 100644 hw/gpio/avr_gpio.c<br>
=C2=A0create mode 100644 include/hw/gpio/avr_gpio.h<br>
<br>
diff --git a/hw/avr/Kconfig b/hw/avr/Kconfig<br>
index d31298c3cc..16a57ced11 100644<br>
--- a/hw/avr/Kconfig<br>
+++ b/hw/avr/Kconfig<br>
@@ -3,6 +3,7 @@ config AVR_ATMEGA_MCU<br>
=C2=A0 =C2=A0 =C2=A0select AVR_TIMER16<br>
=C2=A0 =C2=A0 =C2=A0select AVR_USART<br>
=C2=A0 =C2=A0 =C2=A0select AVR_POWER<br>
+=C2=A0 =C2=A0 select AVR_GPIO<br>
<br>
=C2=A0config ARDUINO<br>
=C2=A0 =C2=A0 =C2=A0select AVR_ATMEGA_MCU<br>
diff --git a/hw/avr/atmega.c b/hw/avr/atmega.c<br>
index a34803e642..f5fb3a5225 100644<br>
--- a/hw/avr/atmega.c<br>
+++ b/hw/avr/atmega.c<br>
@@ -282,8 +282,11 @@ static void atmega_realize(DeviceState *dev, Error **e=
rrp)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0devname =3D g_strdup_printf(&quot;atmega-=
gpio-%c&quot;, &#39;a&#39; + (char)i);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 create_unimplemented_device(devname,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 OFFSET_DATA + mc-&gt;d=
ev[idx].addr, 3);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 object_initialize_child(OBJECT(dev), devname, =
&amp;s-&gt;gpio[i],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TYPE_AVR_GPIO);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sysbus_realize(SYS_BUS_DEVICE(&amp;s-&gt;gpio[=
i]), &amp;error_abort);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sysbus_mmio_map(SYS_BUS_DEVICE(&amp;s-&gt;gpio=
[i]), 0,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 OFFSET_DATA + mc-&gt;dev[idx].addr);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_free(devname);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
diff --git a/hw/avr/atmega.h b/hw/avr/atmega.h<br>
index a99ee15c7e..e2289d5744 100644<br>
--- a/hw/avr/atmega.h<br>
+++ b/hw/avr/atmega.h<br>
@@ -13,6 +13,7 @@<br>
<br>
=C2=A0#include &quot;hw/char/avr_usart.h&quot;<br>
=C2=A0#include &quot;hw/timer/avr_timer16.h&quot;<br>
+#include &quot;hw/gpio/avr_gpio.h&quot;<br>
=C2=A0#include &quot;hw/misc/avr_power.h&quot;<br>
=C2=A0#include &quot;target/avr/cpu.h&quot;<br>
=C2=A0#include &quot;qom/object.h&quot;<br>
@@ -44,6 +45,7 @@ struct AtmegaMcuState {<br>
=C2=A0 =C2=A0 =C2=A0DeviceState *io;<br>
=C2=A0 =C2=A0 =C2=A0AVRMaskState pwr[POWER_MAX];<br>
=C2=A0 =C2=A0 =C2=A0AVRUsartState usart[USART_MAX];<br>
+=C2=A0 =C2=A0 AVRGPIOState gpio[GPIO_MAX];<br>
=C2=A0 =C2=A0 =C2=A0AVRTimer16State timer[TIMER_MAX];<br>
=C2=A0 =C2=A0 =C2=A0uint64_t xtal_freq_hz;<br>
=C2=A0};<br>
diff --git a/hw/gpio/Kconfig b/hw/gpio/Kconfig<br>
index f0e7405f6e..fde7019b2b 100644<br>
--- a/hw/gpio/Kconfig<br>
+++ b/hw/gpio/Kconfig<br>
@@ -13,3 +13,6 @@ config GPIO_PWR<br>
<br>
=C2=A0config SIFIVE_GPIO<br>
=C2=A0 =C2=A0 =C2=A0bool<br>
+<br>
+config AVR_GPIO<br>
+=C2=A0 =C2=A0 bool<br>
diff --git a/hw/gpio/avr_gpio.c b/hw/gpio/avr_gpio.c<br>
new file mode 100644<br>
index 0000000000..cdb574ef0d<br>
--- /dev/null<br>
+++ b/hw/gpio/avr_gpio.c<br>
@@ -0,0 +1,138 @@<br>
+/*<br>
+ * AVR processors GPIO registers emulation.<br>
+ *<br>
+ * Copyright (C) 2020 Heecheol Yang &lt;<a href=3D"mailto:heecheol.yang@ou=
tlook.com" target=3D"_blank">heecheol.yang@outlook.com</a>&gt;<br>
+ *<br>
+ * This program is free software; you can redistribute it and/or<br>
+ * modify it under the terms of the GNU General Public License as<br>
+ * published by the Free Software Foundation; either version 2 or<br>
+ * (at your option) version 3 of the License.<br>
+ *<br>
+ * This program is distributed in the hope that it will be useful,<br>
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of<br>
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See the<br>
+ * GNU General Public License for more details.<br>
+ *<br>
+ * You should have received a copy of the GNU General Public License along=
<br>
+ * with this program; if not, see &lt;<a href=3D"http://www.gnu.org/licens=
es/" rel=3D"noreferrer" target=3D"_blank">http://www.gnu.org/licenses/</a>&=
gt;.<br>
+ */<br>
+#include &quot;qemu/osdep.h&quot;<br>
+#include &quot;qemu/log.h&quot;<br>
+#include &quot;qemu/module.h&quot;<br>
+#include &quot;qemu/osdep.h&quot;<br>
+#include &quot;qapi/error.h&quot;<br>
+#include &quot;hw/sysbus.h&quot;<br>
+#include &quot;hw/irq.h&quot;<br>
+#include &quot;hw/gpio/avr_gpio.h&quot;<br>
+#include &quot;hw/qdev-properties.h&quot;<br>
+<br>
+static void avr_gpio_reset(DeviceState *dev)<br>
+{<br>
+=C2=A0 =C2=A0 AVRGPIOState *gpio =3D AVR_GPIO(dev);<br>
+<br>
+=C2=A0 =C2=A0 gpio-&gt;reg.pin =3D 0u;<br>
+=C2=A0 =C2=A0 gpio-&gt;reg.ddr =3D 0u;<br>
+=C2=A0 =C2=A0 gpio-&gt;reg.port =3D 0u;<br>
+}<br>
+<br>
+static void avr_gpio_write_port(AVRGPIOState *s, uint64_t value)<br>
+{<br>
+=C2=A0 =C2=A0 uint8_t pin;<br>
+=C2=A0 =C2=A0 uint8_t cur_port_val =3D s-&gt;reg.port;<br>
+=C2=A0 =C2=A0 uint8_t cur_ddr_val =3D s-&gt;reg.ddr;<br>
+<br>
+=C2=A0 =C2=A0 for (pin =3D 0u; pin &lt; AVR_GPIO_COUNT ; pin++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint8_t cur_port_pin_val =3D cur_port_val &amp=
; 0x01u;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint8_t cur_ddr_pin_val =3D cur_ddr_val &amp; =
0x01u;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint8_t new_port_pin_val =3D value &amp; 0x01u=
;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (cur_ddr_pin_val &amp;&amp; (cur_port_pin_v=
al !=3D new_port_pin_val)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_set_irq(s-&gt;out[pin], new=
_port_pin_val);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cur_port_val &gt;&gt;=3D 1u;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cur_ddr_val &gt;&gt;=3D 1u;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 value &gt;&gt;=3D 1u;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 s-&gt;reg.port =3D value &amp; s-&gt;reg.ddr;<br>
+}<br>
+static uint64_t avr_gpio_read(void *opaque, hwaddr offset, unsigned int si=
ze)<br>
+{<br>
+=C2=A0 =C2=A0 AVRGPIOState *s =3D (AVRGPIOState *)opaque;<br>
+=C2=A0 =C2=A0 switch (offset) {<br>
+=C2=A0 =C2=A0 case GPIO_PIN:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return s-&gt;reg.pin;<br>
+=C2=A0 =C2=A0 case GPIO_DDR:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return s-&gt;reg.ddr;<br>
+=C2=A0 =C2=A0 case GPIO_PORT:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return s-&gt;reg.port;<br>
+=C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_assert_not_reached();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 return 0;<br>
+}<br>
+<br>
+static void avr_gpio_write(void *opaque, hwaddr offset, uint64_t value,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int size)<br>
+{<br>
+=C2=A0 =C2=A0 AVRGPIOState *s =3D (AVRGPIOState *)opaque;<br>
+=C2=A0 =C2=A0 value =3D value &amp; 0xF;<br>
+=C2=A0 =C2=A0 switch (offset) {<br>
+=C2=A0 =C2=A0 case GPIO_PIN:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;reg.pin =3D value;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;reg.port ^=3D s-&gt;reg.pin;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case GPIO_DDR:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;reg.ddr =3D value;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case GPIO_PORT:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 avr_gpio_write_port(s, value);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_assert_not_reached();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static const MemoryRegionOps avr_gpio_ops =3D {<br>
+=C2=A0 =C2=A0 .read =3D avr_gpio_read,<br>
+=C2=A0 =C2=A0 .write =3D avr_gpio_write,<br>
+=C2=A0 =C2=A0 .endianness =3D DEVICE_NATIVE_ENDIAN,<br>
+};<br>
+<br>
+static void avr_gpio_init(Object *obj)<br>
+{<br>
+=C2=A0 =C2=A0 AVRGPIOState *s =3D AVR_GPIO(obj);<br>
+<br>
+=C2=A0 =C2=A0 qdev_init_gpio_out(DEVICE(obj), s-&gt;out, ARRAY_SIZE(s-&gt;=
out));<br>
+=C2=A0 =C2=A0 memory_region_init_io(&amp;s-&gt;mmio, obj, &amp;avr_gpio_op=
s, s, TYPE_AVR_GPIO, 3);<br>
+=C2=A0 =C2=A0 sysbus_init_mmio(SYS_BUS_DEVICE(obj), &amp;s-&gt;mmio);<br>
+}<br>
+static void avr_gpio_realize(DeviceState *dev, Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 /* Do nothing currently */<br>
+}<br>
+<br>
+<br>
+static void avr_gpio_class_init(ObjectClass *klass, void *data)<br>
+{<br>
+=C2=A0 =C2=A0 DeviceClass *dc =3D DEVICE_CLASS(klass);<br>
+<br>
+=C2=A0 =C2=A0 dc-&gt;reset =3D avr_gpio_reset;<br>
+=C2=A0 =C2=A0 dc-&gt;realize =3D avr_gpio_realize;<br>
+}<br>
+<br>
+static const TypeInfo avr_gpio_info =3D {<br>
+=C2=A0 =C2=A0 .name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_AVR_GPIO,<b=
r>
+=C2=A0 =C2=A0 .parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_SYS_BUS_DEVICE,<=
br>
+=C2=A0 =C2=A0 .instance_size =3D sizeof(AVRGPIOState),<br>
+=C2=A0 =C2=A0 .instance_init =3D avr_gpio_init,<br>
+=C2=A0 =C2=A0 .class_init=C2=A0 =C2=A0 =3D avr_gpio_class_init,<br>
+};<br>
+<br>
+static void avr_gpio_register_types(void)<br>
+{<br>
+=C2=A0 =C2=A0 type_register_static(&amp;avr_gpio_info);<br>
+}<br>
+<br>
+type_init(avr_gpio_register_types)<br>
diff --git a/hw/gpio/meson.build b/hw/gpio/meson.build<br>
index 7bd6a57264..ef372bdd3b 100644<br>
--- a/hw/gpio/meson.build<br>
+++ b/hw/gpio/meson.build<br>
@@ -12,3 +12,4 @@ softmmu_ss.add(when: &#39;CONFIG_OMAP&#39;, if_true: file=
s(&#39;omap_gpio.c&#39;))<br>
=C2=A0softmmu_ss.add(when: &#39;CONFIG_RASPI&#39;, if_true: files(&#39;bcm2=
835_gpio.c&#39;))<br>
=C2=A0softmmu_ss.add(when: &#39;CONFIG_ASPEED_SOC&#39;, if_true: files(&#39=
;aspeed_gpio.c&#39;))<br>
=C2=A0softmmu_ss.add(when: &#39;CONFIG_SIFIVE_GPIO&#39;, if_true: files(&#3=
9;sifive_gpio.c&#39;))<br>
+softmmu_ss.add(when: &#39;CONFIG_AVR_GPIO&#39;, if_true: files(&#39;avr_gp=
io.c&#39;))<br>
diff --git a/include/hw/gpio/avr_gpio.h b/include/hw/gpio/avr_gpio.h<br>
new file mode 100644<br>
index 0000000000..498a7275f0<br>
--- /dev/null<br>
+++ b/include/hw/gpio/avr_gpio.h<br>
@@ -0,0 +1,53 @@<br>
+/*<br>
+ * AVR processors GPIO registers definition.<br>
+ *<br>
+ * Copyright (C) 2020 Heecheol Yang &lt;<a href=3D"mailto:heecheol.yang@ou=
tlook.com" target=3D"_blank">heecheol.yang@outlook.com</a>&gt;<br>
+ *<br>
+ * This program is free software; you can redistribute it and/or<br>
+ * modify it under the terms of the GNU General Public License as<br>
+ * published by the Free Software Foundation; either version 2 or<br>
+ * (at your option) version 3 of the License.<br>
+ *<br>
+ * This program is distributed in the hope that it will be useful,<br>
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of<br>
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See the<br>
+ * GNU General Public License for more details.<br>
+ *<br>
+ * You should have received a copy of the GNU General Public License along=
<br>
+ * with this program; if not, see &lt;<a href=3D"http://www.gnu.org/licens=
es/" rel=3D"noreferrer" target=3D"_blank">http://www.gnu.org/licenses/</a>&=
gt;.<br>
+ */<br>
+<br>
+#ifndef AVR_GPIO_H<br>
+#define AVR_GPIO_H<br>
+<br>
+#include &quot;hw/sysbus.h&quot;<br>
+#include &quot;qom/object.h&quot;<br>
+<br>
+/* Offsets of registers. */<br>
+#define GPIO_PIN=C2=A0 =C2=A00x00<br>
+#define GPIO_DDR=C2=A0 =C2=A00x01<br>
+#define GPIO_PORT=C2=A0 0x02<br>
+<br>
+#define TYPE_AVR_GPIO &quot;avr-gpio&quot;<br>
+OBJECT_DECLARE_SIMPLE_TYPE(AVRGPIOState, AVR_GPIO)<br>
+#define AVR_GPIO_COUNT 8<br>
+<br>
+struct AVRGPIOState {<br>
+=C2=A0 =C2=A0 /*&lt; private &gt;*/<br>
+=C2=A0 =C2=A0 SysBusDevice parent_obj;<br>
+<br>
+=C2=A0 =C2=A0 /*&lt; public &gt;*/<br>
+=C2=A0 =C2=A0 MemoryRegion mmio;<br>
+<br>
+=C2=A0 =C2=A0 struct {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint8_t pin;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint8_t ddr;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint8_t port;<br>
+=C2=A0 =C2=A0 } reg;<br>
+<br>
+=C2=A0 =C2=A0 /* PORTx data changed IRQs */<br>
+=C2=A0 =C2=A0 qemu_irq out[8u];<br>
+<br>
+};<br>
+<br>
+#endif /* AVR_GPIO_H */<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">Best Regards,<br>Michael Rolnik</div>

--0000000000001b6a2805e9ac52ad--

