Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 232D5FF81
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Apr 2019 20:13:03 +0200 (CEST)
Received: from localhost ([127.0.0.1]:51400 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hLXFW-0000aL-8a
	for lists+qemu-devel@lfdr.de; Tue, 30 Apr 2019 14:13:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57000)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <frederic.konrad@adacore.com>) id 1hLXDR-0007qU-Ru
	for qemu-devel@nongnu.org; Tue, 30 Apr 2019 14:10:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <frederic.konrad@adacore.com>) id 1hLXDM-0005Ge-Pi
	for qemu-devel@nongnu.org; Tue, 30 Apr 2019 14:10:51 -0400
Received: from mel.act-europe.fr ([194.98.77.210]:56658
	helo=smtp.eu.adacore.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <frederic.konrad@adacore.com>)
	id 1hLXDL-0005Ef-Lu
	for qemu-devel@nongnu.org; Tue, 30 Apr 2019 14:10:48 -0400
Received: from localhost (localhost [127.0.0.1])
	by filtered-smtp.eu.adacore.com (Postfix) with ESMTP id A74C381369;
	Tue, 30 Apr 2019 20:10:42 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at eu.adacore.com
Received: from smtp.eu.adacore.com ([127.0.0.1])
	by localhost (smtp.eu.adacore.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Nvg4_AI9kIfd; Tue, 30 Apr 2019 20:10:42 +0200 (CEST)
Received: from localhost.localdomain
	(apoitiers-155-1-191-106.w109-220.abo.wanadoo.fr [109.220.154.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.eu.adacore.com (Postfix) with ESMTPSA id 4E64481368;
	Tue, 30 Apr 2019 20:10:42 +0200 (CEST)
To: Alistair Francis <alistair23@gmail.com>
References: <cover.1556515687.git.alistair@alistair23.me>
	<PSXP216MB027793B449E7DAAB995E0F33DD390@PSXP216MB0277.KORP216.PROD.OUTLOOK.COM>
	<4bf5ee43-a3c3-58c3-e2e1-06242a2f3a59@adacore.com>
	<CAKmqyKOinHAaNaTdRjGkFY-rbNhOsTeB-ryRzco9XcGCRNpPyw@mail.gmail.com>
From: KONRAD Frederic <frederic.konrad@adacore.com>
Message-ID: <2d7fd3c6-86a7-7f3f-f59e-74d54492bb09@adacore.com>
Date: Tue, 30 Apr 2019 20:10:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAKmqyKOinHAaNaTdRjGkFY-rbNhOsTeB-ryRzco9XcGCRNpPyw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 194.98.77.210
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



Le 4/29/19 =C3=A0 7:00 PM, Alistair Francis a =C3=A9crit=C2=A0:
>   On Mon, Apr 29, 2019 at 5:38 AM KONRAD Frederic
> <frederic.konrad@adacore.com> wrote:
>>
>> Hi Alistair,
>>
>> Le 4/29/19 =C3=A0 7:33 AM, Alistair Francis a =C3=A9crit :
>>> Signed-off-by: Alistair Francis <alistair@alistair23.me>
>>> ---
>>>    MAINTAINERS                     |   8 +
>>>    default-configs/arm-softmmu.mak |   1 +
>>>    hw/arm/Kconfig                  |   3 +
>>>    hw/arm/Makefile.objs            |   1 +
>>>    hw/arm/stm32f405_soc.c          | 292 ++++++++++++++++++++++++++++=
++++
>>>    include/hw/arm/stm32f405_soc.h  |  70 ++++++++
>>>    6 files changed, 375 insertions(+)
>>>    create mode 100644 hw/arm/stm32f405_soc.c
>>>    create mode 100644 include/hw/arm/stm32f405_soc.h
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index dabbfccf9c..c9772735cf 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -803,6 +803,14 @@ F: hw/adc/*
>>>    F: hw/ssi/stm32f2xx_spi.c
>>>    F: include/hw/*/stm32*.h
>>>
>>> +STM32F405
>>> +M: Alistair Francis <alistair@alistair23.me>
>>> +M: Peter Maydell <peter.maydell@linaro.org>
>>> +S: Maintained
>>> +F: hw/arm/stm32f405_soc.c
>>> +F: hw/misc/stm32f4xx_syscfg.c
>>> +F: hw/misc/stm32f4xx_exti.c
>>> +
>>>    Netduino 2
>>>    M: Alistair Francis <alistair@alistair23.me>
>>>    M: Peter Maydell <peter.maydell@linaro.org>
>>> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-so=
ftmmu.mak
>>> index 8eb57de211..e079f10624 100644
>>> --- a/default-configs/arm-softmmu.mak
>>> +++ b/default-configs/arm-softmmu.mak
>>> @@ -98,6 +98,7 @@ CONFIG_STM32F2XX_SPI=3Dy
>>>    CONFIG_STM32F205_SOC=3Dy
>>>    CONFIG_STM32F4XX_SYSCFG=3Dy
>>>    CONFIG_STM32F4XX_EXTI=3Dy
>>> +CONFIG_STM32F405_SOC=3Dy
>>
>> Why not using 4xx instead of 405 in this patch as well?
>=20
> I'm not sure if all the SoC variants are generic like that. Looking at
> the datasheet https://www.st.com/content/ccc/resource/technical/documen=
t/datasheet/ef/92/76/6d/bb/c2/4f/f7/DM00037051.pdf/files/DM00037051.pdf/j=
cr:content/translations/en.DM00037051.pdf
> it only specified the 405 and 407 variants. This is mostly a way just
> to say that I have tested it as a 405, it might work with others but I
> don't know. I think it's harder to make the SoC generic without having
> tested the other optinos (or knowing they are all interchangable).

Ok makes sense.

I was wondering because you pass a cpu_type property and your commit mess=
age
mention "STM32F4xx".

>=20
> Alistair
>=20
>>
>>>    CONFIG_NRF51_SOC=3Dy
>>>
>>>    CONFIG_CMSDK_APB_TIMER=3Dy
>>> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
>>> index d298fbdc89..3a98bce15a 100644
>>> --- a/hw/arm/Kconfig
>>> +++ b/hw/arm/Kconfig
>>> @@ -62,6 +62,9 @@ config RASPI
>>>    config STM32F205_SOC
>>>        bool
>>>
>>> +config STM32F405_SOC
>>> +    bool
>>> +
>>>    config XLNX_ZYNQMP_ARM
>>>        bool
>>>
>>> diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
>>> index fa57c7c770..36c3ff54c3 100644
>>> --- a/hw/arm/Makefile.objs
>>> +++ b/hw/arm/Makefile.objs
>>> @@ -26,6 +26,7 @@ obj-$(CONFIG_STRONGARM) +=3D strongarm.o
>>>    obj-$(CONFIG_ALLWINNER_A10) +=3D allwinner-a10.o cubieboard.o
>>>    obj-$(CONFIG_RASPI) +=3D bcm2835_peripherals.o bcm2836.o raspi.o
>>>    obj-$(CONFIG_STM32F205_SOC) +=3D stm32f205_soc.o
>>> +obj-$(CONFIG_STM32F405_SOC) +=3D stm32f405_soc.o
>>>    obj-$(CONFIG_XLNX_ZYNQMP_ARM) +=3D xlnx-zynqmp.o xlnx-zcu102.o
>>>    obj-$(CONFIG_XLNX_VERSAL) +=3D xlnx-versal.o xlnx-versal-virt.o
>>>    obj-$(CONFIG_FSL_IMX25) +=3D fsl-imx25.o imx25_pdk.o
>>> diff --git a/hw/arm/stm32f405_soc.c b/hw/arm/stm32f405_soc.c
>>> new file mode 100644
>>> index 0000000000..83adec51a2
>>> --- /dev/null
>>> +++ b/hw/arm/stm32f405_soc.c
>>> @@ -0,0 +1,292 @@
>>> +/*
>>> + * STM32F405 SoC
>>> + *
>>> + * Copyright (c) 2014 Alistair Francis <alistair@alistair23.me>
>>> + *
>>> + * Permission is hereby granted, free of charge, to any person obtai=
ning a copy
>>> + * of this software and associated documentation files (the "Softwar=
e"), to deal
>>> + * in the Software without restriction, including without limitation=
 the rights
>>> + * to use, copy, modify, merge, publish, distribute, sublicense, and=
/or sell
>>> + * copies of the Software, and to permit persons to whom the Softwar=
e is
>>> + * furnished to do so, subject to the following conditions:
>>> + *
>>> + * The above copyright notice and this permission notice shall be in=
cluded in
>>> + * all copies or substantial portions of the Software.
>>> + *
>>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, E=
XPRESS OR
>>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTA=
BILITY,
>>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT=
 SHALL
>>> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES=
 OR OTHER
>>> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, A=
RISING FROM,
>>> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEA=
LINGS IN
>>> + * THE SOFTWARE.
>>> + */
>>> +
>>> +#include "qemu/osdep.h"
>>> +#include "qapi/error.h"
>>> +#include "qemu-common.h"
>>> +#include "hw/arm/arm.h"
>>> +#include "exec/address-spaces.h"
>>> +#include "hw/arm/stm32f405_soc.h"
>>> +#include "hw/misc/unimp.h"
>>> +
>>> +#define SYSCFG_ADD                     0x40013800
>>> +static const uint32_t usart_addr[] =3D { 0x40011000, 0x40004400, 0x4=
0004800,
>>> +                                       0x40004C00, 0x40005000, 0x400=
11400,
>>> +                                       0x40007800, 0x40007C00 };
>>> +/* At the moment only Timer 2 to 5 are modelled */
>>> +static const uint32_t timer_addr[] =3D { 0x40000000, 0x40000400,
>>> +                                       0x40000800, 0x40000C00 };
>>> +#define ADC_ADDR                       0x40012000
>>> +static const uint32_t spi_addr[] =3D   { 0x40013000, 0x40003800, 0x4=
0003C00,
>>> +                                       0x40013400, 0x40015000, 0x400=
15400 };
>>> +#define EXTI_ADDR                      0x40013C00
>>> +
>>> +#define SYSCFG_IRQ               71
>>> +static const int usart_irq[] =3D { 37, 38, 39, 52, 53, 71, 82, 83 };
>>> +static const int timer_irq[] =3D { 28, 29, 30, 50 };
>>> +#define ADC_IRQ 18
>>> +static const int spi_irq[] =3D   { 35, 36, 51, 0, 0, 0 };
>>> +static const int exti_irq[] =3D  { 6, 7, 8, 9, 10, 23, 23, 23, 23, 2=
3, 40,
>>> +                                 40, 40, 40, 40, 40} ;
>>> +
>>> +
>>> +static void stm32f405_soc_initfn(Object *obj)
>>> +{
>>> +    STM32F405State *s =3D STM32F405_SOC(obj);
>>> +    int i;
>>> +
>>> +    sysbus_init_child_obj(obj, "armv7m", &s->armv7m, sizeof(s->armv7=
m),
>>> +                          TYPE_ARMV7M);
>>> +
>>> +    sysbus_init_child_obj(obj, "syscfg", &s->syscfg, sizeof(s->syscf=
g),
>>> +                          TYPE_STM32F4XX_SYSCFG);
>>> +
>>> +    for (i =3D 0; i < STM_NUM_USARTS; i++) {
>>> +        sysbus_init_child_obj(obj, "usart[*]", &s->usart[i],
>>> +                              sizeof(s->usart[i]), TYPE_STM32F2XX_US=
ART);
>>> +    }
>>> +
>>> +    for (i =3D 0; i < STM_NUM_TIMERS; i++) {
>>> +        sysbus_init_child_obj(obj, "timer[*]", &s->timer[i],
>>> +                              sizeof(s->timer[i]), TYPE_STM32F2XX_TI=
MER);
>>> +    }
>>> +
>>> +    s->adc_irqs =3D OR_IRQ(object_new(TYPE_OR_IRQ));
>>> +
>>> +    for (i =3D 0; i < STM_NUM_ADCS; i++) {
>>> +        sysbus_init_child_obj(obj, "adc[*]", &s->adc[i], sizeof(s->a=
dc[i]),
>>> +                              TYPE_STM32F2XX_ADC);
>>> +    }
>>> +
>>> +    for (i =3D 0; i < STM_NUM_SPIS; i++) {
>>> +        sysbus_init_child_obj(obj, "spi[*]", &s->spi[i], sizeof(s->s=
pi[i]),
>>> +                              TYPE_STM32F2XX_SPI);
>>> +    }
>>> +
>>> +    sysbus_init_child_obj(obj, "exti", &s->exti, sizeof(s->exti),
>>> +                          TYPE_STM32F4XX_EXTI);
>>> +}
>>> +
>>> +static void stm32f405_soc_realize(DeviceState *dev_soc, Error **errp=
)
>>> +{
>>> +    STM32F405State *s =3D STM32F405_SOC(dev_soc);
>>> +    DeviceState *dev, *armv7m;
>>> +    SysBusDevice *busdev;
>>> +    Error *err =3D NULL;
>>> +    int i;
>>> +
>>> +    MemoryRegion *system_memory =3D get_system_memory();
>>> +    MemoryRegion *sram =3D g_new(MemoryRegion, 1);
>>> +    MemoryRegion *flash =3D g_new(MemoryRegion, 1);
>>> +    MemoryRegion *flash_alias =3D g_new(MemoryRegion, 1);
>>> +
>>> +    memory_region_init_ram(flash, NULL, "STM32F405.flash", FLASH_SIZ=
E,
>>> +                           &error_fatal);
>>> +    memory_region_init_alias(flash_alias, NULL, "STM32F405.flash.ali=
as",
>>> +                             flash, 0, FLASH_SIZE);
>>> +
>>> +    memory_region_set_readonly(flash, true);
>>> +    memory_region_set_readonly(flash_alias, true);
>>> +
>>> +    memory_region_add_subregion(system_memory, FLASH_BASE_ADDRESS, f=
lash);
>>> +    memory_region_add_subregion(system_memory, 0, flash_alias);
>>> +
>>> +    memory_region_init_ram(sram, NULL, "STM32F405.sram", SRAM_SIZE,
>>> +                           &error_fatal);
>>> +    memory_region_add_subregion(system_memory, SRAM_BASE_ADDRESS, sr=
am);
>>> +
>>> +    armv7m =3D DEVICE(&s->armv7m);
>>> +    qdev_prop_set_uint32(armv7m, "num-irq", 96);
>>> +    qdev_prop_set_string(armv7m, "cpu-type", s->cpu_type);
>>> +    qdev_prop_set_bit(armv7m, "enable-bitband", true);
>>> +    object_property_set_link(OBJECT(&s->armv7m), OBJECT(get_system_m=
emory()),
>>> +                                     "memory", &error_abort);
>>> +    object_property_set_bool(OBJECT(&s->armv7m), true, "realized", &=
err);
>>> +    if (err !=3D NULL) {
>>> +        error_propagate(errp, err);
>>> +        return;
>>> +    }
>>> +
>>> +    /* System configuration controller */
>>> +    dev =3D DEVICE(&s->syscfg);
>>> +    object_property_set_bool(OBJECT(&s->syscfg), true, "realized", &=
err);
>>> +    if (err !=3D NULL) {
>>> +        error_propagate(errp, err);
>>> +        return;
>>> +    }
>>> +    busdev =3D SYS_BUS_DEVICE(dev);
>>> +    sysbus_mmio_map(busdev, 0, SYSCFG_ADD);
>>> +    sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(armv7m, SYSCFG_IR=
Q));
>>> +
>>> +    /* Attach UART (uses USART registers) and USART controllers */
>>> +    for (i =3D 0; i < STM_NUM_USARTS; i++) {
>>> +        dev =3D DEVICE(&(s->usart[i]));
>>> +        qdev_prop_set_chr(dev, "chardev", serial_hd(i));
>>> +        object_property_set_bool(OBJECT(&s->usart[i]), true, "realiz=
ed", &err);
>>> +        if (err !=3D NULL) {
>>> +            error_propagate(errp, err);
>>> +            return;
>>> +        }
>>> +        busdev =3D SYS_BUS_DEVICE(dev);
>>> +        sysbus_mmio_map(busdev, 0, usart_addr[i]);
>>> +        sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(armv7m, usart=
_irq[i]));
>>> +    }
>>> +
>>> +    /* Timer 2 to 5 */
>>> +    for (i =3D 0; i < STM_NUM_TIMERS; i++) {
>>> +        dev =3D DEVICE(&(s->timer[i]));
>>> +        qdev_prop_set_uint64(dev, "clock-frequency", 1000000000);
>>> +        object_property_set_bool(OBJECT(&s->timer[i]), true, "realiz=
ed", &err);
>>> +        if (err !=3D NULL) {
>>> +            error_propagate(errp, err);
>>> +            return;
>>> +        }
>>> +        busdev =3D SYS_BUS_DEVICE(dev);
>>> +        sysbus_mmio_map(busdev, 0, timer_addr[i]);
>>> +        sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(armv7m, timer=
_irq[i]));
>>> +    }
>>> +
>>> +    /* ADC device, the IRQs are ORed together */
>>> +    object_property_set_int(OBJECT(s->adc_irqs), STM_NUM_ADCS,
>>> +                            "num-lines", &err);
>>> +    object_property_set_bool(OBJECT(s->adc_irqs), true, "realized", =
&err);
>>> +    if (err !=3D NULL) {
>>> +        error_propagate(errp, err);
>>> +        return;
>>> +    }
>>> +    qdev_connect_gpio_out(DEVICE(s->adc_irqs), 0,
>>> +                          qdev_get_gpio_in(armv7m, ADC_IRQ));
>>> +
>>> +    dev =3D DEVICE(&(s->adc[i]));
>>> +    object_property_set_bool(OBJECT(&s->adc[i]), true, "realized", &=
err);
>>> +    if (err !=3D NULL) {
>>> +        error_propagate(errp, err);
>>> +        return;
>>> +    }
>>> +    busdev =3D SYS_BUS_DEVICE(dev);
>>> +    sysbus_mmio_map(busdev, 0, ADC_ADDR);
>>> +    sysbus_connect_irq(busdev, 0,
>>> +                       qdev_get_gpio_in(DEVICE(s->adc_irqs), i));
>>> +
>>> +    /* SPI devices */
>>> +    for (i =3D 0; i < STM_NUM_SPIS; i++) {
>>> +        dev =3D DEVICE(&(s->spi[i]));
>>> +        object_property_set_bool(OBJECT(&s->spi[i]), true, "realized=
", &err);
>>> +        if (err !=3D NULL) {
>>> +            error_propagate(errp, err);
>>> +            return;
>>> +        }
>>> +        busdev =3D SYS_BUS_DEVICE(dev);
>>> +        sysbus_mmio_map(busdev, 0, spi_addr[i]);
>>> +        sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(armv7m, spi_i=
rq[i]));
>>> +    }
>>> +
>>> +    /* EXTI device */
>>> +    dev =3D DEVICE(&s->exti);
>>> +    object_property_set_bool(OBJECT(&s->exti), true, "realized", &er=
r);
>>> +    if (err !=3D NULL) {
>>> +        error_propagate(errp, err);
>>> +        return;
>>> +    }
>>> +    busdev =3D SYS_BUS_DEVICE(dev);
>>> +    sysbus_mmio_map(busdev, 0, EXTI_ADDR);
>>> +    for (i =3D 0; i < 16; i++) {
>>> +        sysbus_connect_irq(busdev, i, qdev_get_gpio_in(armv7m, exti_=
irq[i]));
>>> +    }
>>> +    for (i =3D 0; i < 16; i++) {
>>> +        qdev_connect_gpio_out(DEVICE(&s->syscfg), i, qdev_get_gpio_i=
n(dev, i));
>>> +    }
>>> +
>>> +    create_unimplemented_device("timer[6]",    0x40001000, 0x400 - 1=
);
>>> +    create_unimplemented_device("timer[7]",    0x40001400, 0x400 - 1=
);
>>> +    create_unimplemented_device("timer[12]",   0x40001800, 0x400 - 1=
);
>>> +    create_unimplemented_device("timer[13]",   0x40001C00, 0x400 - 1=
);
>>> +    create_unimplemented_device("timer[14]",   0x40002000, 0x400 - 1=
);
>>> +    create_unimplemented_device("RTC and BKP", 0x40002800, 0x400 - 1=
);
>>> +    create_unimplemented_device("WWDG",        0x40002C00, 0x400 - 1=
);
>>> +    create_unimplemented_device("IWDG",        0x40003000, 0x400 - 1=
);
>>> +    create_unimplemented_device("I2S2ext",     0x40003000, 0x400 - 1=
);
>>> +    create_unimplemented_device("I2S3ext",     0x40004000, 0x400 - 1=
);
>>> +    create_unimplemented_device("I2C1",        0x40005400, 0x400 - 1=
);
>>> +    create_unimplemented_device("I2C2",        0x40005800, 0x400 - 1=
);
>>> +    create_unimplemented_device("I2C3",        0x40005C00, 0x400 - 1=
);
>>> +    create_unimplemented_device("CAN1",        0x40006400, 0x400 - 1=
);
>>> +    create_unimplemented_device("CAN2",        0x40006800, 0x400 - 1=
);
>>> +    create_unimplemented_device("PWR",         0x40007000, 0x400 - 1=
);
>>> +    create_unimplemented_device("DAC",         0x40007400, 0x400 - 1=
);
>>> +    create_unimplemented_device("timer[1]",    0x40010000, 0x400 - 1=
);
>>> +    create_unimplemented_device("timer[8]",    0x40010400, 0x400 - 1=
);
>>> +    create_unimplemented_device("SDIO",        0x40012C00, 0x400 - 1=
);
>>> +    create_unimplemented_device("timer[9]",    0x40014000, 0x400 - 1=
);
>>> +    create_unimplemented_device("timer[10]",   0x40014400, 0x400 - 1=
);
>>> +    create_unimplemented_device("timer[11]",   0x40014800, 0x400 - 1=
);
>>> +    create_unimplemented_device("GPIOA",       0x40020000, 0x400 - 1=
);
>>> +    create_unimplemented_device("GPIOB",       0x40020400, 0x400 - 1=
);
>>> +    create_unimplemented_device("GPIOC",       0x40020800, 0x400 - 1=
);
>>> +    create_unimplemented_device("GPIOD",       0x40020C00, 0x400 - 1=
);
>>> +    create_unimplemented_device("GPIOE",       0x40021000, 0x400 - 1=
);
>>> +    create_unimplemented_device("GPIOF",       0x40021400, 0x400 - 1=
);
>>> +    create_unimplemented_device("GPIOG",       0x40021800, 0x400 - 1=
);
>>> +    create_unimplemented_device("GPIOH",       0x40021C00, 0x400 - 1=
);
>>> +    create_unimplemented_device("GPIOI",       0x40022000, 0x400 - 1=
);
>>> +    create_unimplemented_device("CRC",         0x40023000, 0x400 - 1=
);
>>> +    create_unimplemented_device("RCC",         0x40023800, 0x400 - 1=
);
>>> +    create_unimplemented_device("Flash Int",   0x40023C00, 0x400 - 1=
);
>>> +    create_unimplemented_device("BKPSRAM",     0x40024000, 0x400 - 1=
);
>>> +    create_unimplemented_device("DMA1",        0x40026000, 0x400 - 1=
);
>>> +    create_unimplemented_device("DMA2",        0x40026400, 0x400 - 1=
);
>>> +    create_unimplemented_device("Ethernet",    0x40028000, 0x1400 - =
1);
>>> +    create_unimplemented_device("USB OTG HS",  0x40040000, 0x30000 -=
 1);
>>> +    create_unimplemented_device("USB OTG FS",  0x50000000, 0x31000 -=
 1);
>>> +    create_unimplemented_device("DCMI",        0x50050000, 0x400 - 1=
);
>>> +    create_unimplemented_device("RNG",         0x50060800, 0x400 - 1=
);
>>> +}
>>> +
>>> +static Property stm32f405_soc_properties[] =3D {
>>> +    DEFINE_PROP_STRING("cpu-type", STM32F405State, cpu_type),
>>> +    DEFINE_PROP_END_OF_LIST(),
>>> +};
>>> +
>>> +static void stm32f405_soc_class_init(ObjectClass *klass, void *data)
>>> +{
>>> +    DeviceClass *dc =3D DEVICE_CLASS(klass);
>>> +
>>> +    dc->realize =3D stm32f405_soc_realize;
>>> +    dc->props =3D stm32f405_soc_properties;
>>> +}
>>> +
>>> +static const TypeInfo stm32f405_soc_info =3D {
>>> +    .name          =3D TYPE_STM32F405_SOC,
>>> +    .parent        =3D TYPE_SYS_BUS_DEVICE,
>>> +    .instance_size =3D sizeof(STM32F405State),
>>> +    .instance_init =3D stm32f405_soc_initfn,
>>> +    .class_init    =3D stm32f405_soc_class_init,
>>> +};
>>> +
>>> +static void stm32f405_soc_types(void)
>>> +{
>>> +    type_register_static(&stm32f405_soc_info);
>>> +}
>>> +
>>> +type_init(stm32f405_soc_types)
>>> diff --git a/include/hw/arm/stm32f405_soc.h b/include/hw/arm/stm32f40=
5_soc.h
>>> new file mode 100644
>>> index 0000000000..f0aec53d32
>>> --- /dev/null
>>> +++ b/include/hw/arm/stm32f405_soc.h
>>> @@ -0,0 +1,70 @@
>>> +/*
>>> + * STM32F405 SoC
>>> + *
>>> + * Copyright (c) 2014 Alistair Francis <alistair@alistair23.me>
>>> + *
>>> + * Permission is hereby granted, free of charge, to any person obtai=
ning a copy
>>> + * of this software and associated documentation files (the "Softwar=
e"), to deal
>>> + * in the Software without restriction, including without limitation=
 the rights
>>> + * to use, copy, modify, merge, publish, distribute, sublicense, and=
/or sell
>>> + * copies of the Software, and to permit persons to whom the Softwar=
e is
>>> + * furnished to do so, subject to the following conditions:
>>> + *
>>> + * The above copyright notice and this permission notice shall be in=
cluded in
>>> + * all copies or substantial portions of the Software.
>>> + *
>>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, E=
XPRESS OR
>>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTA=
BILITY,
>>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT=
 SHALL
>>> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES=
 OR OTHER
>>> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, A=
RISING FROM,
>>> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEA=
LINGS IN
>>> + * THE SOFTWARE.
>>> + */
>>> +
>>> +#ifndef HW_ARM_STM32F405_SOC_H
>>> +#define HW_ARM_STM32F405_SOC_H
>>> +
>>> +#include "hw/misc/stm32f4xx_syscfg.h"
>>> +#include "hw/timer/stm32f2xx_timer.h"
>>> +#include "hw/char/stm32f2xx_usart.h"
>>> +#include "hw/adc/stm32f2xx_adc.h"
>>> +#include "hw/misc/stm32f4xx_exti.h"
>>> +#include "hw/or-irq.h"
>>> +#include "hw/ssi/stm32f2xx_spi.h"
>>> +#include "hw/arm/armv7m.h"
>>> +
>>> +#define TYPE_STM32F405_SOC "stm32f405-soc"
>>> +#define STM32F405_SOC(obj) \
>>> +    OBJECT_CHECK(STM32F405State, (obj), TYPE_STM32F405_SOC)
>>> +
>>> +#define STM_NUM_USARTS 7
>>> +#define STM_NUM_TIMERS 4
>>> +#define STM_NUM_ADCS 6
>>> +#define STM_NUM_SPIS 6
>>> +
>>> +#define FLASH_BASE_ADDRESS 0x08000000
>>> +#define FLASH_SIZE (1024 * 1024)
>>> +#define SRAM_BASE_ADDRESS 0x20000000
>>> +#define SRAM_SIZE (192 * 1024)
>>> +
>>> +typedef struct STM32F405State {
>>> +    /*< private >*/
>>> +    SysBusDevice parent_obj;
>>> +    /*< public >*/
>>> +
>>> +    char *cpu_type;
>>> +
>>> +    ARMv7MState armv7m;
>>> +
>>> +    STM32F4xxSyscfgState syscfg;
>>> +    STM32F4xxExtiState exti;
>>> +    STM32F2XXUsartState usart[STM_NUM_USARTS];
>>> +    STM32F2XXTimerState timer[STM_NUM_TIMERS];
>>> +    STM32F2XXADCState adc[STM_NUM_ADCS];
>>> +    STM32F2XXSPIState spi[STM_NUM_SPIS];
>>> +
>>> +    qemu_or_irq *adc_irqs;
>>> +} STM32F405State;
>>> +
>>> +#endif
>>>

