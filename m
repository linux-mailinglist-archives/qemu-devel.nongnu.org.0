Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3825193242
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Mar 2020 22:01:34 +0100 (CET)
Received: from localhost ([::1]:43306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jHD9Y-0003dc-Cn
	for lists+qemu-devel@lfdr.de; Wed, 25 Mar 2020 17:01:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42889)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1jHD7f-0002oS-4L
 for qemu-devel@nongnu.org; Wed, 25 Mar 2020 16:59:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1jHD7d-0007hW-51
 for qemu-devel@nongnu.org; Wed, 25 Mar 2020 16:59:35 -0400
Received: from mail-vs1-xe41.google.com ([2607:f8b0:4864:20::e41]:40693)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1jHD7d-0007hD-0E; Wed, 25 Mar 2020 16:59:33 -0400
Received: by mail-vs1-xe41.google.com with SMTP id d18so2479923vso.7;
 Wed, 25 Mar 2020 13:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=PBnh+M8BEw3gDqG8Q3pF47i072cZdCncdPjj1t8/Ang=;
 b=prbW1f8KWjnrpeodreo4PMTIPaSmTHKvF42ZKeBXbKw1kXxGafv6/j/BtiDRBA+FUe
 BIotceWGInUnEyNYIckV4qrPqILA9HWNEMKKiJaOMtSXkWc9PnhJl6oX1YfxOH+pRRa0
 srfam5jDiI6kOnYPv2fhBzKAHH5KfvQuZDXhil3ShrehO5nJhDCMccThiSLIml4mVXEr
 WbTup0XURGzEeU9xZygMJv8UZrwYed9fHHiHfYuWPiDB4jj6bkzY1gb8Gr/1/z6tT2Ox
 p138/5eYUNhdAuzE4oZC9tvFgA2MlzblYmoOIU0om/HgIWqXteDrvq9GYToCyWlwxuET
 ypTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=PBnh+M8BEw3gDqG8Q3pF47i072cZdCncdPjj1t8/Ang=;
 b=EaNL+OfHz383rGzyAGBQ0sqdBzmnm++3Dhh+pbttvO8IbJeye96VXq1n6WnkKHgUFa
 0WLIEm0ZRWu77hvuBqgizhAkXI+06pgoIjxUdrh8RmaOi0r4vOnhRm2NO/82bWPtR+Dz
 KPXvF8AkuNQrnnH/0qd8VAjFh7WRUskEpAtuywq+6lQ+cDC5s3jy0JMumcajdnJpUAIq
 Ej9Zdo11S73biBO97ztW3QjimrA44lhB2BN2ZVYR1bPZesRBPWtoyr3fhD8XAFQc5cty
 x6G7uxR6W8IQ2wNsHGSg3uo1XX6qAljWqP1vPpvViP/KvXFg/O7cGTotpSgXBTU7gIfz
 i/Dw==
X-Gm-Message-State: ANhLgQ35uHIkSw94Sbdz3hap7DIagcrw5mQtQEEhyHVoXPWfpoPURT7C
 KtSXjM3MRwOgpbknv1eGidqucmfgXvThXwjBGyQ=
X-Google-Smtp-Source: ADFU+vu+qwoNWCwp4WcgaKiR+qTdj0VaosKwCbMSGp4AM8QJynBKLjxwBJPsEjcFhGRds3JJ4thZ40wjrKHKWuTpyGk=
X-Received: by 2002:a67:ffd0:: with SMTP id w16mr4131468vsq.151.1585169972097; 
 Wed, 25 Mar 2020 13:59:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200325191830.16553-1-f4bug@amsat.org>
 <20200325191830.16553-5-f4bug@amsat.org>
In-Reply-To: <20200325191830.16553-5-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 25 Mar 2020 13:51:32 -0700
Message-ID: <CAKmqyKOj4oRQbrD2Wt080zAxggkx6KCC2uh410QZJgw+BF1UYg@mail.gmail.com>
Subject: Re: [PATCH-for-5.0 04/12] hw/arm/stm32fx05_soc: Add missing
 error-propagation code
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::e41
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
Cc: Paul Burton <pburton@wavecomp.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 "open list:New World" <qemu-ppc@nongnu.org>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm <qemu-arm@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 25, 2020 at 12:22 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
>
> Patch created mechanically by running:
>
>   $ spatch \
>     --macro-file scripts/cocci-macro-file.h --include-headers \
>     --sp-file scripts/coccinelle/object_property_missing_error_propagate.=
cocci \
>     --keep-comments --smpl-spacing --in-place --dir hw
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/arm/stm32f205_soc.c | 4 ++++
>  hw/arm/stm32f405_soc.c | 4 ++++
>  2 files changed, 8 insertions(+)
>
> diff --git a/hw/arm/stm32f205_soc.c b/hw/arm/stm32f205_soc.c
> index 118c342559..1d80f91dd7 100644
> --- a/hw/arm/stm32f205_soc.c
> +++ b/hw/arm/stm32f205_soc.c
> @@ -83,113 +83,117 @@ static void stm32f205_soc_initfn(Object *obj)
>  static void stm32f205_soc_realize(DeviceState *dev_soc, Error **errp)
>  {
>      STM32F205State *s =3D STM32F205_SOC(dev_soc);
>      DeviceState *dev, *armv7m;
>      SysBusDevice *busdev;
>      Error *err =3D NULL;
>      int i;
>
>      MemoryRegion *system_memory =3D get_system_memory();
>      MemoryRegion *sram =3D g_new(MemoryRegion, 1);
>      MemoryRegion *flash =3D g_new(MemoryRegion, 1);
>      MemoryRegion *flash_alias =3D g_new(MemoryRegion, 1);
>
>      memory_region_init_rom(flash, OBJECT(dev_soc), "STM32F205.flash",
>                             FLASH_SIZE, &error_fatal);
>      memory_region_init_alias(flash_alias, OBJECT(dev_soc),
>                               "STM32F205.flash.alias", flash, 0, FLASH_SI=
ZE);
>
>      memory_region_add_subregion(system_memory, FLASH_BASE_ADDRESS, flash=
);
>      memory_region_add_subregion(system_memory, 0, flash_alias);
>
>      memory_region_init_ram(sram, NULL, "STM32F205.sram", SRAM_SIZE,
>                             &error_fatal);
>      memory_region_add_subregion(system_memory, SRAM_BASE_ADDRESS, sram);
>
>      armv7m =3D DEVICE(&s->armv7m);
>      qdev_prop_set_uint32(armv7m, "num-irq", 96);
>      qdev_prop_set_string(armv7m, "cpu-type", s->cpu_type);
>      qdev_prop_set_bit(armv7m, "enable-bitband", true);
>      object_property_set_link(OBJECT(&s->armv7m), OBJECT(get_system_memor=
y()),
>                                       "memory", &error_abort);
>      object_property_set_bool(OBJECT(&s->armv7m), true, "realized", &err)=
;
>      if (err !=3D NULL) {
>          error_propagate(errp, err);
>          return;
>      }
>
>      /* System configuration controller */
>      dev =3D DEVICE(&s->syscfg);
>      object_property_set_bool(OBJECT(&s->syscfg), true, "realized", &err)=
;
>      if (err !=3D NULL) {
>          error_propagate(errp, err);
>          return;
>      }
>      busdev =3D SYS_BUS_DEVICE(dev);
>      sysbus_mmio_map(busdev, 0, 0x40013800);
>      sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(armv7m, 71));
>
>      /* Attach UART (uses USART registers) and USART controllers */
>      for (i =3D 0; i < STM_NUM_USARTS; i++) {
>          dev =3D DEVICE(&(s->usart[i]));
>          qdev_prop_set_chr(dev, "chardev", serial_hd(i));
>          object_property_set_bool(OBJECT(&s->usart[i]), true, "realized",=
 &err);
>          if (err !=3D NULL) {
>              error_propagate(errp, err);
>              return;
>          }
>          busdev =3D SYS_BUS_DEVICE(dev);
>          sysbus_mmio_map(busdev, 0, usart_addr[i]);
>          sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(armv7m, usart_irq=
[i]));
>      }
>
>      /* Timer 2 to 5 */
>      for (i =3D 0; i < STM_NUM_TIMERS; i++) {
>          dev =3D DEVICE(&(s->timer[i]));
>          qdev_prop_set_uint64(dev, "clock-frequency", 1000000000);
>          object_property_set_bool(OBJECT(&s->timer[i]), true, "realized",=
 &err);
>          if (err !=3D NULL) {
>              error_propagate(errp, err);
>              return;
>          }
>          busdev =3D SYS_BUS_DEVICE(dev);
>          sysbus_mmio_map(busdev, 0, timer_addr[i]);
>          sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(armv7m, timer_irq=
[i]));
>      }
>
>      /* ADC 1 to 3 */
>      object_property_set_int(OBJECT(s->adc_irqs), STM_NUM_ADCS,
>                              "num-lines", &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
>      object_property_set_bool(OBJECT(s->adc_irqs), true, "realized", &err=
);
>      if (err !=3D NULL) {
>          error_propagate(errp, err);
>          return;
>      }
>      qdev_connect_gpio_out(DEVICE(s->adc_irqs), 0,
>                            qdev_get_gpio_in(armv7m, ADC_IRQ));
>
>      for (i =3D 0; i < STM_NUM_ADCS; i++) {
>          dev =3D DEVICE(&(s->adc[i]));
>          object_property_set_bool(OBJECT(&s->adc[i]), true, "realized", &=
err);
>          if (err !=3D NULL) {
>              error_propagate(errp, err);
>              return;
>          }
>          busdev =3D SYS_BUS_DEVICE(dev);
>          sysbus_mmio_map(busdev, 0, adc_addr[i]);
>          sysbus_connect_irq(busdev, 0,
>                             qdev_get_gpio_in(DEVICE(s->adc_irqs), i));
>      }
>
>      /* SPI 1 and 2 */
>      for (i =3D 0; i < STM_NUM_SPIS; i++) {
>          dev =3D DEVICE(&(s->spi[i]));
>          object_property_set_bool(OBJECT(&s->spi[i]), true, "realized", &=
err);
>          if (err !=3D NULL) {
>              error_propagate(errp, err);
>              return;
>          }
>          busdev =3D SYS_BUS_DEVICE(dev);
>          sysbus_mmio_map(busdev, 0, spi_addr[i]);
>          sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(armv7m, spi_irq[i=
]));
>      }
>  }
> diff --git a/hw/arm/stm32f405_soc.c b/hw/arm/stm32f405_soc.c
> index 4f10ce6176..398a3b5b4f 100644
> --- a/hw/arm/stm32f405_soc.c
> +++ b/hw/arm/stm32f405_soc.c
> @@ -89,183 +89,187 @@ static void stm32f405_soc_initfn(Object *obj)
>  static void stm32f405_soc_realize(DeviceState *dev_soc, Error **errp)
>  {
>      STM32F405State *s =3D STM32F405_SOC(dev_soc);
>      MemoryRegion *system_memory =3D get_system_memory();
>      DeviceState *dev, *armv7m;
>      SysBusDevice *busdev;
>      Error *err =3D NULL;
>      int i;
>
>      memory_region_init_rom(&s->flash, OBJECT(dev_soc), "STM32F405.flash"=
,
>                             FLASH_SIZE, &err);
>      if (err !=3D NULL) {
>          error_propagate(errp, err);
>          return;
>      }
>      memory_region_init_alias(&s->flash_alias, OBJECT(dev_soc),
>                               "STM32F405.flash.alias", &s->flash, 0,
>                               FLASH_SIZE);
>
>      memory_region_add_subregion(system_memory, FLASH_BASE_ADDRESS, &s->f=
lash);
>      memory_region_add_subregion(system_memory, 0, &s->flash_alias);
>
>      memory_region_init_ram(&s->sram, NULL, "STM32F405.sram", SRAM_SIZE,
>                             &err);
>      if (err !=3D NULL) {
>          error_propagate(errp, err);
>          return;
>      }
>      memory_region_add_subregion(system_memory, SRAM_BASE_ADDRESS, &s->sr=
am);
>
>      armv7m =3D DEVICE(&s->armv7m);
>      qdev_prop_set_uint32(armv7m, "num-irq", 96);
>      qdev_prop_set_string(armv7m, "cpu-type", s->cpu_type);
>      qdev_prop_set_bit(armv7m, "enable-bitband", true);
>      object_property_set_link(OBJECT(&s->armv7m), OBJECT(system_memory),
>                                       "memory", &error_abort);
>      object_property_set_bool(OBJECT(&s->armv7m), true, "realized", &err)=
;
>      if (err !=3D NULL) {
>          error_propagate(errp, err);
>          return;
>      }
>
>      /* System configuration controller */
>      dev =3D DEVICE(&s->syscfg);
>      object_property_set_bool(OBJECT(&s->syscfg), true, "realized", &err)=
;
>      if (err !=3D NULL) {
>          error_propagate(errp, err);
>          return;
>      }
>      busdev =3D SYS_BUS_DEVICE(dev);
>      sysbus_mmio_map(busdev, 0, SYSCFG_ADD);
>      sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(armv7m, SYSCFG_IRQ));
>
>      /* Attach UART (uses USART registers) and USART controllers */
>      for (i =3D 0; i < STM_NUM_USARTS; i++) {
>          dev =3D DEVICE(&(s->usart[i]));
>          qdev_prop_set_chr(dev, "chardev", serial_hd(i));
>          object_property_set_bool(OBJECT(&s->usart[i]), true, "realized",=
 &err);
>          if (err !=3D NULL) {
>              error_propagate(errp, err);
>              return;
>          }
>          busdev =3D SYS_BUS_DEVICE(dev);
>          sysbus_mmio_map(busdev, 0, usart_addr[i]);
>          sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(armv7m, usart_irq=
[i]));
>      }
>
>      /* Timer 2 to 5 */
>      for (i =3D 0; i < STM_NUM_TIMERS; i++) {
>          dev =3D DEVICE(&(s->timer[i]));
>          qdev_prop_set_uint64(dev, "clock-frequency", 1000000000);
>          object_property_set_bool(OBJECT(&s->timer[i]), true, "realized",=
 &err);
>          if (err !=3D NULL) {
>              error_propagate(errp, err);
>              return;
>          }
>          busdev =3D SYS_BUS_DEVICE(dev);
>          sysbus_mmio_map(busdev, 0, timer_addr[i]);
>          sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(armv7m, timer_irq=
[i]));
>      }
>
>      /* ADC device, the IRQs are ORed together */
>      object_initialize_child(OBJECT(s), "adc-orirq", &s->adc_irqs,
>                              sizeof(s->adc_irqs), TYPE_OR_IRQ,
>                              &err, NULL);
>      if (err !=3D NULL) {
>          error_propagate(errp, err);
>          return;
>      }
>      object_property_set_int(OBJECT(&s->adc_irqs), STM_NUM_ADCS,
>                              "num-lines", &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
>      object_property_set_bool(OBJECT(&s->adc_irqs), true, "realized", &er=
r);
>      if (err !=3D NULL) {
>          error_propagate(errp, err);
>          return;
>      }
>      qdev_connect_gpio_out(DEVICE(&s->adc_irqs), 0,
>                            qdev_get_gpio_in(armv7m, ADC_IRQ));
>
>      dev =3D DEVICE(&(s->adc[i]));
>      object_property_set_bool(OBJECT(&s->adc[i]), true, "realized", &err)=
;
>      if (err !=3D NULL) {
>          error_propagate(errp, err);
>          return;
>      }
>      busdev =3D SYS_BUS_DEVICE(dev);
>      sysbus_mmio_map(busdev, 0, ADC_ADDR);
>      sysbus_connect_irq(busdev, 0,
>                         qdev_get_gpio_in(DEVICE(&s->adc_irqs), i));
>
>      /* SPI devices */
>      for (i =3D 0; i < STM_NUM_SPIS; i++) {
>          dev =3D DEVICE(&(s->spi[i]));
>          object_property_set_bool(OBJECT(&s->spi[i]), true, "realized", &=
err);
>          if (err !=3D NULL) {
>              error_propagate(errp, err);
>              return;
>          }
>          busdev =3D SYS_BUS_DEVICE(dev);
>          sysbus_mmio_map(busdev, 0, spi_addr[i]);
>          sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(armv7m, spi_irq[i=
]));
>      }
>
>      /* EXTI device */
>      dev =3D DEVICE(&s->exti);
>      object_property_set_bool(OBJECT(&s->exti), true, "realized", &err);
>      if (err !=3D NULL) {
>          error_propagate(errp, err);
>          return;
>      }
>      busdev =3D SYS_BUS_DEVICE(dev);
>      sysbus_mmio_map(busdev, 0, EXTI_ADDR);
>      for (i =3D 0; i < 16; i++) {
>          sysbus_connect_irq(busdev, i, qdev_get_gpio_in(armv7m, exti_irq[=
i]));
>      }
>      for (i =3D 0; i < 16; i++) {
>          qdev_connect_gpio_out(DEVICE(&s->syscfg), i, qdev_get_gpio_in(de=
v, i));
>      }
>
>      create_unimplemented_device("timer[7]",    0x40001400, 0x400);
>      create_unimplemented_device("timer[12]",   0x40001800, 0x400);
>      create_unimplemented_device("timer[6]",    0x40001000, 0x400);
>      create_unimplemented_device("timer[13]",   0x40001C00, 0x400);
>      create_unimplemented_device("timer[14]",   0x40002000, 0x400);
>      create_unimplemented_device("RTC and BKP", 0x40002800, 0x400);
>      create_unimplemented_device("WWDG",        0x40002C00, 0x400);
>      create_unimplemented_device("IWDG",        0x40003000, 0x400);
>      create_unimplemented_device("I2S2ext",     0x40003000, 0x400);
>      create_unimplemented_device("I2S3ext",     0x40004000, 0x400);
>      create_unimplemented_device("I2C1",        0x40005400, 0x400);
>      create_unimplemented_device("I2C2",        0x40005800, 0x400);
>      create_unimplemented_device("I2C3",        0x40005C00, 0x400);
>      create_unimplemented_device("CAN1",        0x40006400, 0x400);
>      create_unimplemented_device("CAN2",        0x40006800, 0x400);
>      create_unimplemented_device("PWR",         0x40007000, 0x400);
>      create_unimplemented_device("DAC",         0x40007400, 0x400);
>      create_unimplemented_device("timer[1]",    0x40010000, 0x400);
>      create_unimplemented_device("timer[8]",    0x40010400, 0x400);
>      create_unimplemented_device("SDIO",        0x40012C00, 0x400);
>      create_unimplemented_device("timer[9]",    0x40014000, 0x400);
>      create_unimplemented_device("timer[10]",   0x40014400, 0x400);
>      create_unimplemented_device("timer[11]",   0x40014800, 0x400);
>      create_unimplemented_device("GPIOA",       0x40020000, 0x400);
>      create_unimplemented_device("GPIOB",       0x40020400, 0x400);
>      create_unimplemented_device("GPIOC",       0x40020800, 0x400);
>      create_unimplemented_device("GPIOD",       0x40020C00, 0x400);
>      create_unimplemented_device("GPIOE",       0x40021000, 0x400);
>      create_unimplemented_device("GPIOF",       0x40021400, 0x400);
>      create_unimplemented_device("GPIOG",       0x40021800, 0x400);
>      create_unimplemented_device("GPIOH",       0x40021C00, 0x400);
>      create_unimplemented_device("GPIOI",       0x40022000, 0x400);
>      create_unimplemented_device("CRC",         0x40023000, 0x400);
>      create_unimplemented_device("RCC",         0x40023800, 0x400);
>      create_unimplemented_device("Flash Int",   0x40023C00, 0x400);
>      create_unimplemented_device("BKPSRAM",     0x40024000, 0x400);
>      create_unimplemented_device("DMA1",        0x40026000, 0x400);
>      create_unimplemented_device("DMA2",        0x40026400, 0x400);
>      create_unimplemented_device("Ethernet",    0x40028000, 0x1400);
>      create_unimplemented_device("USB OTG HS",  0x40040000, 0x30000);
>      create_unimplemented_device("USB OTG FS",  0x50000000, 0x31000);
>      create_unimplemented_device("DCMI",        0x50050000, 0x400);
>      create_unimplemented_device("RNG",         0x50060800, 0x400);
>  }
> --
> 2.21.1
>
>

