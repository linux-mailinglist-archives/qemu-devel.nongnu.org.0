Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB391E910
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Apr 2019 19:31:09 +0200 (CEST)
Received: from localhost ([127.0.0.1]:32781 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hLA7R-00054n-0h
	for lists+qemu-devel@lfdr.de; Mon, 29 Apr 2019 13:31:09 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34835)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1hL9fc-0005oJ-QS
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 13:02:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1hL9fa-0007DL-Eg
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 13:02:24 -0400
Received: from mail-it1-x141.google.com ([2607:f8b0:4864:20::141]:40922)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1hL9fa-0007Cd-7j
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 13:02:22 -0400
Received: by mail-it1-x141.google.com with SMTP id k64so118320itb.5
	for <qemu-devel@nongnu.org>; Mon, 29 Apr 2019 10:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=f5MvEg1Ze6+L9gO4ypD4rBqvfJ/CaDg1+zmowPizjWI=;
	b=YLMb16eY+o+hveeLc1nAshGGzym5fxrfqOR71prlzohxfQfRea+e1RRbxWjkXHrAfs
	FHqky7YO6JtSuGd1H1HOgEJJwiyz+u/h6+F+DDF0Bwu5WkGj6EtyU8yAbnQYP3GdOn4l
	kArTSgPUNCy6UjwU1JBS3Iimj9qK8OI1lABYCxu4f1CHkg7KVe3q0rX4zCyWCJM6jdry
	jQk26vVwXJY3ievj+VeqGaijs0bFcdPhYE9erYHX964UYhqyLeVeaFsimT9Fu1vWlS4p
	49zO136MPRmhBhqiuI1eKBqMZcWT2rtZKnHGHLjYkgrhe/NDEAnThE1TM4pUTfGUxQyZ
	sDZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=f5MvEg1Ze6+L9gO4ypD4rBqvfJ/CaDg1+zmowPizjWI=;
	b=ds7ZyQq4x+85+edEZPQSQqsK6uRoVbLu7Wd5g/shtLghjyPk19yYlT8y8Rp3vhHQlZ
	HBBf52XLlercFJ3+41wQ8bglHlSBHFyz+hDpu1id2nQgB93XHGgzMtb1Lqmi0k14GqH6
	XqbfdhVZJK7RpNUJnoXTD7gDlN/nXEU1CygC/xY7uB3YZBeJMH0OxquEsWzlfUEOqvkR
	+lQUBHoUXIrlIpJaw3GPRir2PEISPq3ido/fECOMDG88EmEJEJvVbES4cpq1rMaT9ytr
	4lRBYc+M1h/TImqohXqUEVTyjOMgii6/1X8NuyXZmdx6IBrqwr9RR9Ki7nYwkFLGX3vL
	AZaQ==
X-Gm-Message-State: APjAAAWGwYtzHcHgY7HUCl8erk06F130gnDUpXITSN/dxv8SSRefIzIk
	JvlJOY5mbLA2ntGmJaE/T37wWlNs2lbaadtUI3o=
X-Google-Smtp-Source: APXvYqxOMvsjaGNcgp8XUuofCQFcUruN6d4C5x/rvw8NDk0seD6aqSHYPF5Qu6X9FdBvUyWAMa2vAI6O2JX1zwvKUEo=
X-Received: by 2002:a05:660c:4c2:: with SMTP id v2mr43945itk.71.1556557341226; 
	Mon, 29 Apr 2019 10:02:21 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1556515687.git.alistair@alistair23.me>
	<PSXP216MB027793B449E7DAAB995E0F33DD390@PSXP216MB0277.KORP216.PROD.OUTLOOK.COM>
	<1c2303a0-62bf-53ce-e91c-b45a95a91376@redhat.com>
In-Reply-To: <1c2303a0-62bf-53ce-e91c-b45a95a91376@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 29 Apr 2019 10:01:51 -0700
Message-ID: <CAKmqyKMWHot3UaRkN4gnwtcj7kje-Yx3ZJa7-9NGbgfg6vMJdQ@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::141
Subject: Re: [Qemu-devel] [PATCH v1 4/5] hw/arm: Add the STM32F4xx SoC
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Alistair Francis <alistair@alistair23.me>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Apr 29, 2019 at 5:43 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> On 4/29/19 7:33 AM, Alistair Francis wrote:
> > Signed-off-by: Alistair Francis <alistair@alistair23.me>
> > ---
> >  MAINTAINERS                     |   8 +
> >  default-configs/arm-softmmu.mak |   1 +
> >  hw/arm/Kconfig                  |   3 +
> >  hw/arm/Makefile.objs            |   1 +
> >  hw/arm/stm32f405_soc.c          | 292 ++++++++++++++++++++++++++++++++
> >  include/hw/arm/stm32f405_soc.h  |  70 ++++++++
> >  6 files changed, 375 insertions(+)
> >  create mode 100644 hw/arm/stm32f405_soc.c
> >  create mode 100644 include/hw/arm/stm32f405_soc.h
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index dabbfccf9c..c9772735cf 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -803,6 +803,14 @@ F: hw/adc/*
> >  F: hw/ssi/stm32f2xx_spi.c
> >  F: include/hw/*/stm32*.h
> >
> > +STM32F405
> > +M: Alistair Francis <alistair@alistair23.me>
> > +M: Peter Maydell <peter.maydell@linaro.org>
> > +S: Maintained
> > +F: hw/arm/stm32f405_soc.c
> > +F: hw/misc/stm32f4xx_syscfg.c
> > +F: hw/misc/stm32f4xx_exti.c
> > +
> >  Netduino 2
> >  M: Alistair Francis <alistair@alistair23.me>
> >  M: Peter Maydell <peter.maydell@linaro.org>
> > diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-soft=
mmu.mak
> > index 8eb57de211..e079f10624 100644
> > --- a/default-configs/arm-softmmu.mak
> > +++ b/default-configs/arm-softmmu.mak
> > @@ -98,6 +98,7 @@ CONFIG_STM32F2XX_SPI=3Dy
> >  CONFIG_STM32F205_SOC=3Dy
> >  CONFIG_STM32F4XX_SYSCFG=3Dy
> >  CONFIG_STM32F4XX_EXTI=3Dy
> > +CONFIG_STM32F405_SOC=3Dy
> >  CONFIG_NRF51_SOC=3Dy
> >
> >  CONFIG_CMSDK_APB_TIMER=3Dy
> > diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> > index d298fbdc89..3a98bce15a 100644
> > --- a/hw/arm/Kconfig
> > +++ b/hw/arm/Kconfig
> > @@ -62,6 +62,9 @@ config RASPI
> >  config STM32F205_SOC
> >      bool
> >
> > +config STM32F405_SOC
> > +    bool
> > +
> >  config XLNX_ZYNQMP_ARM
> >      bool
> >
> > diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
> > index fa57c7c770..36c3ff54c3 100644
> > --- a/hw/arm/Makefile.objs
> > +++ b/hw/arm/Makefile.objs
> > @@ -26,6 +26,7 @@ obj-$(CONFIG_STRONGARM) +=3D strongarm.o
> >  obj-$(CONFIG_ALLWINNER_A10) +=3D allwinner-a10.o cubieboard.o
> >  obj-$(CONFIG_RASPI) +=3D bcm2835_peripherals.o bcm2836.o raspi.o
> >  obj-$(CONFIG_STM32F205_SOC) +=3D stm32f205_soc.o
> > +obj-$(CONFIG_STM32F405_SOC) +=3D stm32f405_soc.o
> >  obj-$(CONFIG_XLNX_ZYNQMP_ARM) +=3D xlnx-zynqmp.o xlnx-zcu102.o
> >  obj-$(CONFIG_XLNX_VERSAL) +=3D xlnx-versal.o xlnx-versal-virt.o
> >  obj-$(CONFIG_FSL_IMX25) +=3D fsl-imx25.o imx25_pdk.o
> > diff --git a/hw/arm/stm32f405_soc.c b/hw/arm/stm32f405_soc.c
> > new file mode 100644
> > index 0000000000..83adec51a2
> > --- /dev/null
> > +++ b/hw/arm/stm32f405_soc.c
> > @@ -0,0 +1,292 @@
> > +/*
> > + * STM32F405 SoC
> > + *
> > + * Copyright (c) 2014 Alistair Francis <alistair@alistair23.me>
>
> 2019?

I never know how this works. It was originally written in 2014, do I
update the year based on the upstream submission?

>
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
> > +#include "qemu/osdep.h"
> > +#include "qapi/error.h"
> > +#include "qemu-common.h"
> > +#include "hw/arm/arm.h"
> > +#include "exec/address-spaces.h"
> > +#include "hw/arm/stm32f405_soc.h"
> > +#include "hw/misc/unimp.h"
> > +
> > +#define SYSCFG_ADD                     0x40013800
> > +static const uint32_t usart_addr[] =3D { 0x40011000, 0x40004400, 0x400=
04800,
> > +                                       0x40004C00, 0x40005000, 0x40011=
400,
> > +                                       0x40007800, 0x40007C00 };
> > +/* At the moment only Timer 2 to 5 are modelled */
> > +static const uint32_t timer_addr[] =3D { 0x40000000, 0x40000400,
> > +                                       0x40000800, 0x40000C00 };
> > +#define ADC_ADDR                       0x40012000
> > +static const uint32_t spi_addr[] =3D   { 0x40013000, 0x40003800, 0x400=
03C00,
> > +                                       0x40013400, 0x40015000, 0x40015=
400 };
> > +#define EXTI_ADDR                      0x40013C00
> > +
> > +#define SYSCFG_IRQ               71
> > +static const int usart_irq[] =3D { 37, 38, 39, 52, 53, 71, 82, 83 };
> > +static const int timer_irq[] =3D { 28, 29, 30, 50 };
> > +#define ADC_IRQ 18
> > +static const int spi_irq[] =3D   { 35, 36, 51, 0, 0, 0 };
> > +static const int exti_irq[] =3D  { 6, 7, 8, 9, 10, 23, 23, 23, 23, 23,=
 40,
> > +                                 40, 40, 40, 40, 40} ;
> > +
> > +
> > +static void stm32f405_soc_initfn(Object *obj)
> > +{
> > +    STM32F405State *s =3D STM32F405_SOC(obj);
> > +    int i;
> > +
> > +    sysbus_init_child_obj(obj, "armv7m", &s->armv7m, sizeof(s->armv7m)=
,
> > +                          TYPE_ARMV7M);
> > +
> > +    sysbus_init_child_obj(obj, "syscfg", &s->syscfg, sizeof(s->syscfg)=
,
> > +                          TYPE_STM32F4XX_SYSCFG);
> > +
> > +    for (i =3D 0; i < STM_NUM_USARTS; i++) {
> > +        sysbus_init_child_obj(obj, "usart[*]", &s->usart[i],
> > +                              sizeof(s->usart[i]), TYPE_STM32F2XX_USAR=
T);
> > +    }
> > +
> > +    for (i =3D 0; i < STM_NUM_TIMERS; i++) {
> > +        sysbus_init_child_obj(obj, "timer[*]", &s->timer[i],
> > +                              sizeof(s->timer[i]), TYPE_STM32F2XX_TIME=
R);
> > +    }
> > +
> > +    s->adc_irqs =3D OR_IRQ(object_new(TYPE_OR_IRQ));
> > +
> > +    for (i =3D 0; i < STM_NUM_ADCS; i++) {
> > +        sysbus_init_child_obj(obj, "adc[*]", &s->adc[i], sizeof(s->adc=
[i]),
> > +                              TYPE_STM32F2XX_ADC);
> > +    }
> > +
> > +    for (i =3D 0; i < STM_NUM_SPIS; i++) {
> > +        sysbus_init_child_obj(obj, "spi[*]", &s->spi[i], sizeof(s->spi=
[i]),
> > +                              TYPE_STM32F2XX_SPI);
> > +    }
> > +
> > +    sysbus_init_child_obj(obj, "exti", &s->exti, sizeof(s->exti),
> > +                          TYPE_STM32F4XX_EXTI);
> > +}
> > +
> > +static void stm32f405_soc_realize(DeviceState *dev_soc, Error **errp)
> > +{
> > +    STM32F405State *s =3D STM32F405_SOC(dev_soc);
> > +    DeviceState *dev, *armv7m;
> > +    SysBusDevice *busdev;
> > +    Error *err =3D NULL;
> > +    int i;
> > +
> > +    MemoryRegion *system_memory =3D get_system_memory();
> > +    MemoryRegion *sram =3D g_new(MemoryRegion, 1);
> > +    MemoryRegion *flash =3D g_new(MemoryRegion, 1);
> > +    MemoryRegion *flash_alias =3D g_new(MemoryRegion, 1);
> > +
> > +    memory_region_init_ram(flash, NULL, "STM32F405.flash", FLASH_SIZE,
> > +                           &error_fatal);
> > +    memory_region_init_alias(flash_alias, NULL, "STM32F405.flash.alias=
",
> > +                             flash, 0, FLASH_SIZE);
> > +
> > +    memory_region_set_readonly(flash, true);
> > +    memory_region_set_readonly(flash_alias, true);
> > +
> > +    memory_region_add_subregion(system_memory, FLASH_BASE_ADDRESS, fla=
sh);
> > +    memory_region_add_subregion(system_memory, 0, flash_alias);
> > +
> > +    memory_region_init_ram(sram, NULL, "STM32F405.sram", SRAM_SIZE,
> > +                           &error_fatal);
> > +    memory_region_add_subregion(system_memory, SRAM_BASE_ADDRESS, sram=
);
> > +
> > +    armv7m =3D DEVICE(&s->armv7m);
> > +    qdev_prop_set_uint32(armv7m, "num-irq", 96);
> > +    qdev_prop_set_string(armv7m, "cpu-type", s->cpu_type);
> > +    qdev_prop_set_bit(armv7m, "enable-bitband", true);
> > +    object_property_set_link(OBJECT(&s->armv7m), OBJECT(get_system_mem=
ory()),
> > +                                     "memory", &error_abort);
> > +    object_property_set_bool(OBJECT(&s->armv7m), true, "realized", &er=
r);
> > +    if (err !=3D NULL) {
> > +        error_propagate(errp, err);
> > +        return;
> > +    }
> > +
> > +    /* System configuration controller */
> > +    dev =3D DEVICE(&s->syscfg);
> > +    object_property_set_bool(OBJECT(&s->syscfg), true, "realized", &er=
r);
> > +    if (err !=3D NULL) {
> > +        error_propagate(errp, err);
> > +        return;
> > +    }
> > +    busdev =3D SYS_BUS_DEVICE(dev);
> > +    sysbus_mmio_map(busdev, 0, SYSCFG_ADD);
> > +    sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(armv7m, SYSCFG_IRQ)=
);
> > +
> > +    /* Attach UART (uses USART registers) and USART controllers */
> > +    for (i =3D 0; i < STM_NUM_USARTS; i++) {
> > +        dev =3D DEVICE(&(s->usart[i]));
> > +        qdev_prop_set_chr(dev, "chardev", serial_hd(i));
> > +        object_property_set_bool(OBJECT(&s->usart[i]), true, "realized=
", &err);
> > +        if (err !=3D NULL) {
> > +            error_propagate(errp, err);
> > +            return;
> > +        }
> > +        busdev =3D SYS_BUS_DEVICE(dev);
> > +        sysbus_mmio_map(busdev, 0, usart_addr[i]);
> > +        sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(armv7m, usart_i=
rq[i]));
> > +    }
> > +
> > +    /* Timer 2 to 5 */
> > +    for (i =3D 0; i < STM_NUM_TIMERS; i++) {
> > +        dev =3D DEVICE(&(s->timer[i]));
> > +        qdev_prop_set_uint64(dev, "clock-frequency", 1000000000);
> > +        object_property_set_bool(OBJECT(&s->timer[i]), true, "realized=
", &err);
> > +        if (err !=3D NULL) {
> > +            error_propagate(errp, err);
> > +            return;
> > +        }
> > +        busdev =3D SYS_BUS_DEVICE(dev);
> > +        sysbus_mmio_map(busdev, 0, timer_addr[i]);
> > +        sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(armv7m, timer_i=
rq[i]));
> > +    }
> > +
> > +    /* ADC device, the IRQs are ORed together */
> > +    object_property_set_int(OBJECT(s->adc_irqs), STM_NUM_ADCS,
> > +                            "num-lines", &err);
> > +    object_property_set_bool(OBJECT(s->adc_irqs), true, "realized", &e=
rr);
> > +    if (err !=3D NULL) {
> > +        error_propagate(errp, err);
> > +        return;
> > +    }
> > +    qdev_connect_gpio_out(DEVICE(s->adc_irqs), 0,
> > +                          qdev_get_gpio_in(armv7m, ADC_IRQ));
> > +
> > +    dev =3D DEVICE(&(s->adc[i]));
> > +    object_property_set_bool(OBJECT(&s->adc[i]), true, "realized", &er=
r);
> > +    if (err !=3D NULL) {
> > +        error_propagate(errp, err);
> > +        return;
> > +    }
> > +    busdev =3D SYS_BUS_DEVICE(dev);
> > +    sysbus_mmio_map(busdev, 0, ADC_ADDR);
> > +    sysbus_connect_irq(busdev, 0,
> > +                       qdev_get_gpio_in(DEVICE(s->adc_irqs), i));
> > +
> > +    /* SPI devices */
> > +    for (i =3D 0; i < STM_NUM_SPIS; i++) {
> > +        dev =3D DEVICE(&(s->spi[i]));
> > +        object_property_set_bool(OBJECT(&s->spi[i]), true, "realized",=
 &err);
> > +        if (err !=3D NULL) {
> > +            error_propagate(errp, err);
> > +            return;
> > +        }
> > +        busdev =3D SYS_BUS_DEVICE(dev);
> > +        sysbus_mmio_map(busdev, 0, spi_addr[i]);
> > +        sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(armv7m, spi_irq=
[i]));
> > +    }
> > +
> > +    /* EXTI device */
> > +    dev =3D DEVICE(&s->exti);
> > +    object_property_set_bool(OBJECT(&s->exti), true, "realized", &err)=
;
> > +    if (err !=3D NULL) {
> > +        error_propagate(errp, err);
> > +        return;
> > +    }
> > +    busdev =3D SYS_BUS_DEVICE(dev);
> > +    sysbus_mmio_map(busdev, 0, EXTI_ADDR);
> > +    for (i =3D 0; i < 16; i++) {
> > +        sysbus_connect_irq(busdev, i, qdev_get_gpio_in(armv7m, exti_ir=
q[i]));
> > +    }
> > +    for (i =3D 0; i < 16; i++) {
> > +        qdev_connect_gpio_out(DEVICE(&s->syscfg), i, qdev_get_gpio_in(=
dev, i));
> > +    }
> > +
> > +    create_unimplemented_device("timer[6]",    0x40001000, 0x400 - 1);
>
> You shouldn't need to remove the last byte...

Good point, I'll fix that.

Alistair

>
> > +    create_unimplemented_device("timer[7]",    0x40001400, 0x400 - 1);
> > +    create_unimplemented_device("timer[12]",   0x40001800, 0x400 - 1);
> > +    create_unimplemented_device("timer[13]",   0x40001C00, 0x400 - 1);
> > +    create_unimplemented_device("timer[14]",   0x40002000, 0x400 - 1);
> > +    create_unimplemented_device("RTC and BKP", 0x40002800, 0x400 - 1);
> > +    create_unimplemented_device("WWDG",        0x40002C00, 0x400 - 1);
> > +    create_unimplemented_device("IWDG",        0x40003000, 0x400 - 1);
> > +    create_unimplemented_device("I2S2ext",     0x40003000, 0x400 - 1);
> > +    create_unimplemented_device("I2S3ext",     0x40004000, 0x400 - 1);
> > +    create_unimplemented_device("I2C1",        0x40005400, 0x400 - 1);
> > +    create_unimplemented_device("I2C2",        0x40005800, 0x400 - 1);
> > +    create_unimplemented_device("I2C3",        0x40005C00, 0x400 - 1);
> > +    create_unimplemented_device("CAN1",        0x40006400, 0x400 - 1);
> > +    create_unimplemented_device("CAN2",        0x40006800, 0x400 - 1);
> > +    create_unimplemented_device("PWR",         0x40007000, 0x400 - 1);
> > +    create_unimplemented_device("DAC",         0x40007400, 0x400 - 1);
> > +    create_unimplemented_device("timer[1]",    0x40010000, 0x400 - 1);
> > +    create_unimplemented_device("timer[8]",    0x40010400, 0x400 - 1);
> > +    create_unimplemented_device("SDIO",        0x40012C00, 0x400 - 1);
> > +    create_unimplemented_device("timer[9]",    0x40014000, 0x400 - 1);
> > +    create_unimplemented_device("timer[10]",   0x40014400, 0x400 - 1);
> > +    create_unimplemented_device("timer[11]",   0x40014800, 0x400 - 1);
> > +    create_unimplemented_device("GPIOA",       0x40020000, 0x400 - 1);
> > +    create_unimplemented_device("GPIOB",       0x40020400, 0x400 - 1);
> > +    create_unimplemented_device("GPIOC",       0x40020800, 0x400 - 1);
> > +    create_unimplemented_device("GPIOD",       0x40020C00, 0x400 - 1);
> > +    create_unimplemented_device("GPIOE",       0x40021000, 0x400 - 1);
> > +    create_unimplemented_device("GPIOF",       0x40021400, 0x400 - 1);
> > +    create_unimplemented_device("GPIOG",       0x40021800, 0x400 - 1);
> > +    create_unimplemented_device("GPIOH",       0x40021C00, 0x400 - 1);
> > +    create_unimplemented_device("GPIOI",       0x40022000, 0x400 - 1);
> > +    create_unimplemented_device("CRC",         0x40023000, 0x400 - 1);
> > +    create_unimplemented_device("RCC",         0x40023800, 0x400 - 1);
> > +    create_unimplemented_device("Flash Int",   0x40023C00, 0x400 - 1);
> > +    create_unimplemented_device("BKPSRAM",     0x40024000, 0x400 - 1);
> > +    create_unimplemented_device("DMA1",        0x40026000, 0x400 - 1);
> > +    create_unimplemented_device("DMA2",        0x40026400, 0x400 - 1);
> > +    create_unimplemented_device("Ethernet",    0x40028000, 0x1400 - 1)=
;
> > +    create_unimplemented_device("USB OTG HS",  0x40040000, 0x30000 - 1=
);
> > +    create_unimplemented_device("USB OTG FS",  0x50000000, 0x31000 - 1=
);
> > +    create_unimplemented_device("DCMI",        0x50050000, 0x400 - 1);
> > +    create_unimplemented_device("RNG",         0x50060800, 0x400 - 1);
> > +}
> > +
> > +static Property stm32f405_soc_properties[] =3D {
> > +    DEFINE_PROP_STRING("cpu-type", STM32F405State, cpu_type),
> > +    DEFINE_PROP_END_OF_LIST(),
> > +};
> > +
> > +static void stm32f405_soc_class_init(ObjectClass *klass, void *data)
> > +{
> > +    DeviceClass *dc =3D DEVICE_CLASS(klass);
> > +
> > +    dc->realize =3D stm32f405_soc_realize;
> > +    dc->props =3D stm32f405_soc_properties;
> > +}
> > +
> > +static const TypeInfo stm32f405_soc_info =3D {
> > +    .name          =3D TYPE_STM32F405_SOC,
> > +    .parent        =3D TYPE_SYS_BUS_DEVICE,
> > +    .instance_size =3D sizeof(STM32F405State),
> > +    .instance_init =3D stm32f405_soc_initfn,
> > +    .class_init    =3D stm32f405_soc_class_init,
> > +};
> > +
> > +static void stm32f405_soc_types(void)
> > +{
> > +    type_register_static(&stm32f405_soc_info);
> > +}
> > +
> > +type_init(stm32f405_soc_types)
> > diff --git a/include/hw/arm/stm32f405_soc.h b/include/hw/arm/stm32f405_=
soc.h
> > new file mode 100644
> > index 0000000000..f0aec53d32
> > --- /dev/null
> > +++ b/include/hw/arm/stm32f405_soc.h
> > @@ -0,0 +1,70 @@
> > +/*
> > + * STM32F405 SoC
> > + *
> > + * Copyright (c) 2014 Alistair Francis <alistair@alistair23.me>
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
> > +#ifndef HW_ARM_STM32F405_SOC_H
> > +#define HW_ARM_STM32F405_SOC_H
> > +
> > +#include "hw/misc/stm32f4xx_syscfg.h"
> > +#include "hw/timer/stm32f2xx_timer.h"
> > +#include "hw/char/stm32f2xx_usart.h"
> > +#include "hw/adc/stm32f2xx_adc.h"
> > +#include "hw/misc/stm32f4xx_exti.h"
> > +#include "hw/or-irq.h"
> > +#include "hw/ssi/stm32f2xx_spi.h"
> > +#include "hw/arm/armv7m.h"
> > +
> > +#define TYPE_STM32F405_SOC "stm32f405-soc"
> > +#define STM32F405_SOC(obj) \
> > +    OBJECT_CHECK(STM32F405State, (obj), TYPE_STM32F405_SOC)
> > +
> > +#define STM_NUM_USARTS 7
> > +#define STM_NUM_TIMERS 4
> > +#define STM_NUM_ADCS 6
> > +#define STM_NUM_SPIS 6
> > +
> > +#define FLASH_BASE_ADDRESS 0x08000000
> > +#define FLASH_SIZE (1024 * 1024)
> > +#define SRAM_BASE_ADDRESS 0x20000000
> > +#define SRAM_SIZE (192 * 1024)
> > +
> > +typedef struct STM32F405State {
> > +    /*< private >*/
> > +    SysBusDevice parent_obj;
> > +    /*< public >*/
> > +
> > +    char *cpu_type;
> > +
> > +    ARMv7MState armv7m;
> > +
> > +    STM32F4xxSyscfgState syscfg;
> > +    STM32F4xxExtiState exti;
> > +    STM32F2XXUsartState usart[STM_NUM_USARTS];
> > +    STM32F2XXTimerState timer[STM_NUM_TIMERS];
> > +    STM32F2XXADCState adc[STM_NUM_ADCS];
> > +    STM32F2XXSPIState spi[STM_NUM_SPIS];
> > +
> > +    qemu_or_irq *adc_irqs;
> > +} STM32F405State;
> > +
> > +#endif
> >

