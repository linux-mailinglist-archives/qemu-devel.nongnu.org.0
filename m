Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C1ADBA6A
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Oct 2019 02:06:24 +0200 (CEST)
Received: from localhost ([::1]:34254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iLFmh-0004jT-Ad
	for lists+qemu-devel@lfdr.de; Thu, 17 Oct 2019 20:06:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46031)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1iLFlT-000478-D8
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 20:05:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1iLFlO-0007ZB-4s
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 20:05:06 -0400
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241]:35465)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1iLFlN-0007Yc-N7; Thu, 17 Oct 2019 20:05:01 -0400
Received: by mail-lj1-x241.google.com with SMTP id m7so4363883lji.2;
 Thu, 17 Oct 2019 17:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=jfsReMyQtklLgqDiJUlJtwJEYrv42gE31qbx0Xhhz4Q=;
 b=agVF6TNrcN1AwHJ65Gz//fhlqgUu7RxMoFiLchi/pHh104XWbbbGzg8Gp6nclWfn1m
 yj37uoXdxGFVTrg8/exQLoiBHADsRXxPyvSYcMS9T0+hZqnk8mN/QkF5QW2VcyNF8wIJ
 gmMIZIqvkS/oweWZdfWqk77cPJlcFAjCwAjZySzdGSh+F/ZKq9FATMJThmyk0ydD0fJg
 GzfHW0CLCYUaL2+8wzKbaJMSTgfkQAE9JKNUdwiBiPFu0i8ah4Kku/NjEc9T6CxVSG4I
 lhrB2IjUYyk4D++nqR0+pYXNUzgQHXOopThJQYzXCIz295a2NjJgjtXuw3yq8yeYyzB5
 1jQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=jfsReMyQtklLgqDiJUlJtwJEYrv42gE31qbx0Xhhz4Q=;
 b=IobSLeCM9nMIkoFlRGvK3CO+h1HDo5kugG5uTf+6/TLK4DgxJplARI9CcbV45af7Aw
 aoMN8gF9Hg5pOtnXvzLcriZIP0kuzxE//atOs0vrYA6qA5pyfHPslk+VZvWhdcs/Ritz
 s5vR122C+dP5He3eGz50WHOPgu+4UdQ3FsINfH1uVOCPDh1kq3J9CeT05lKEc3vIDbef
 SQuaC+RWTvBaZ6vTbxLKqFfbkw30ErG0mVaLDuYnPaLwvxZbOQAMHRfnvwM31+tjzU6x
 skjvvyAeay7VkLILTEXC6HghSAXjQsGp1ZZn9acrUkWHdqs9wBkGpzhVztNF1PiusoEU
 JsVw==
X-Gm-Message-State: APjAAAXh1SpyJd/GqKn5BoS3Ipj7LLV6SiHiEC66X/6xjSGxDxIFY0IX
 uHjnfqZkjbeUuoLnNyZynjTzkIkZ6UmaLUxKGwI=
X-Google-Smtp-Source: APXvYqz/hkj+XzpDo41d9Op+OQVTB8j0kxDPUVTZRC5wS6vllQ3v0MCjtiiGiAvkcz19YxN9CIeq8s3ST4wwbald0Pk=
X-Received: by 2002:a2e:9890:: with SMTP id b16mr4274220ljj.4.1571357100012;
 Thu, 17 Oct 2019 17:05:00 -0700 (PDT)
MIME-Version: 1.0
References: <20191017225800.6946-1-f4bug@amsat.org>
 <20191017225800.6946-5-f4bug@amsat.org>
In-Reply-To: <20191017225800.6946-5-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 17 Oct 2019 16:59:50 -0700
Message-ID: <CAKmqyKM=W_9aT3=HRbxbX0rjrisc0bcTFKA1XVuJOX+b5ziBfw@mail.gmail.com>
Subject: Re: [PATCH v2 04/10] hw/arm/bcm2835_peripherals: Use the SYS_timer
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::241
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
Cc: Rob Herring <robh@kernel.org>, Peter Maydell <peter.maydell@linaro.org>,
 Clement Deschamps <clement.deschamps@antfield.fr>,
 Alistair Francis <alistair@alistair23.me>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Esteban Bosse <estebanbosse@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Pete Batard <pete@akeo.ie>, Cleber Rosa <crosa@redhat.com>,
 Laurent Bonnans <laurent.bonnans@here.com>,
 Cheng Xiang <ext-cheng.xiang@here.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Pekka Enberg <penberg@iki.fi>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 17, 2019 at 4:05 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> Connect the recently added SYS_timer.
> Now U-Boot does not hang anymore polling a free running counter
> stuck at 0.
> This timer is also used by the Linux kernel thermal subsystem.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> v2: Remove spurious error check (Alex)
> ---
>  hw/arm/bcm2835_peripherals.c         | 17 ++++++++++++++++-
>  include/hw/arm/bcm2835_peripherals.h |  3 ++-
>  2 files changed, 18 insertions(+), 2 deletions(-)
>
> diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
> index 70bf927a02..17207ae07e 100644
> --- a/hw/arm/bcm2835_peripherals.c
> +++ b/hw/arm/bcm2835_peripherals.c
> @@ -58,6 +58,10 @@ static void bcm2835_peripherals_init(Object *obj)
>      /* Interrupt Controller */
>      sysbus_init_child_obj(obj, "ic", &s->ic, sizeof(s->ic), TYPE_BCM2835=
_IC);
>
> +    /* SYS Timer */
> +    sysbus_init_child_obj(obj, "systimer", &s->systmr, sizeof(s->systmr)=
,
> +                          TYPE_BCM2835_SYSTIMER);
> +
>      /* UART0 */
>      sysbus_init_child_obj(obj, "uart0", &s->uart0, sizeof(s->uart0),
>                            TYPE_PL011);
> @@ -171,6 +175,18 @@ static void bcm2835_peripherals_realize(DeviceState =
*dev, Error **errp)
>                  sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->ic), 0));
>      sysbus_pass_irq(SYS_BUS_DEVICE(s), SYS_BUS_DEVICE(&s->ic));
>
> +    /* Sys Timer */
> +    object_property_set_bool(OBJECT(&s->systmr), true, "realized", &err)=
;
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +    memory_region_add_subregion(&s->peri_mr, ST_OFFSET,
> +                sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->systmr), 0));
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->systmr), 0,
> +        qdev_get_gpio_in_named(DEVICE(&s->ic), BCM2835_IC_ARM_IRQ,
> +                               INTERRUPT_ARM_TIMER));
> +
>      /* UART0 */
>      qdev_prop_set_chr(DEVICE(&s->uart0), "chardev", serial_hd(0));
>      object_property_set_bool(OBJECT(&s->uart0), true, "realized", &err);
> @@ -352,7 +368,6 @@ static void bcm2835_peripherals_realize(DeviceState *=
dev, Error **errp)
>      }
>
>      create_unimp(s, &s->armtmr, "bcm2835-sp804", ARMCTRL_TIMER0_1_OFFSET=
, 0x40);
> -    create_unimp(s, &s->systmr, "bcm2835-systimer", ST_OFFSET, 0x20);
>      create_unimp(s, &s->cprman, "bcm2835-cprman", CPRMAN_OFFSET, 0x1000)=
;
>      create_unimp(s, &s->a2w, "bcm2835-a2w", A2W_OFFSET, 0x1000);
>      create_unimp(s, &s->i2s, "bcm2835-i2s", I2S_OFFSET, 0x100);
> diff --git a/include/hw/arm/bcm2835_peripherals.h b/include/hw/arm/bcm283=
5_peripherals.h
> index be7ad9b499..7859281e11 100644
> --- a/include/hw/arm/bcm2835_peripherals.h
> +++ b/include/hw/arm/bcm2835_peripherals.h
> @@ -24,6 +24,7 @@
>  #include "hw/sd/sdhci.h"
>  #include "hw/sd/bcm2835_sdhost.h"
>  #include "hw/gpio/bcm2835_gpio.h"
> +#include "hw/timer/bcm2835_systmr.h"
>  #include "hw/misc/unimp.h"
>
>  #define TYPE_BCM2835_PERIPHERALS "bcm2835-peripherals"
> @@ -39,7 +40,7 @@ typedef struct BCM2835PeripheralState {
>      MemoryRegion ram_alias[4];
>      qemu_irq irq, fiq;
>
> -    UnimplementedDeviceState systmr;
> +    BCM2835SystemTimerState systmr;
>      UnimplementedDeviceState armtmr;
>      UnimplementedDeviceState cprman;
>      UnimplementedDeviceState a2w;
> --
> 2.21.0
>
>

