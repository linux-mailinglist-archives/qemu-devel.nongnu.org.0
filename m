Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC4CC10DE52
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Nov 2019 17:59:46 +0100 (CET)
Received: from localhost ([::1]:41728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ib65o-0005rd-Bk
	for lists+qemu-devel@lfdr.de; Sat, 30 Nov 2019 11:59:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60328)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mrolnik@gmail.com>) id 1ib64w-0005RU-29
 for qemu-devel@nongnu.org; Sat, 30 Nov 2019 11:58:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mrolnik@gmail.com>) id 1ib64s-0007Mx-IQ
 for qemu-devel@nongnu.org; Sat, 30 Nov 2019 11:58:41 -0500
Received: from mail-qt1-x843.google.com ([2607:f8b0:4864:20::843]:33204)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <mrolnik@gmail.com>) id 1ib64s-0007IW-9M
 for qemu-devel@nongnu.org; Sat, 30 Nov 2019 11:58:38 -0500
Received: by mail-qt1-x843.google.com with SMTP id d5so6934972qto.0
 for <qemu-devel@nongnu.org>; Sat, 30 Nov 2019 08:58:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zzlHgji3o/7wGpyVFTGGvIGJ6vjigMr7vtqH9A/bdYs=;
 b=fE7VubzBSWBHVogMC1Togvsy1acp88dfGoOX77aVi+K6VGT/t54UQkp3jjbogHPGqK
 hkVGK+j1PKjm0u3Ut8zddBAyOb6KM7LLUblEs3A7ubN1MtciJwxEOT3d449CUh/J0wrX
 nVRjqmLG3LZnK+oaX6CsHzR4P9vUupoiTUp8UqmCI9EArUUdBS3BHnZkJIOGDuoHsr5V
 TqKHcHyK/juv90SqG4twCFHsBNIIThN7+vc85pTdVG42yrU6zyzpnTFOw3MJIBWr0/4H
 T3xfj5cfVsJi6fx4YBsyfLsSb2jpW4yV0unXHVH7DAJvYYW+ohQKwWTbitC4/Ax7T0pC
 mleA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zzlHgji3o/7wGpyVFTGGvIGJ6vjigMr7vtqH9A/bdYs=;
 b=fdR3OCOiE65xJrFxxYxM4N2F1U4AjzQaJahrmtkGom+/XnBbBAdRzh+99NTQOkBhtA
 XubW/iNVSYeglU8yFIeYTc7coi5jMIiPVwCVbNPRiQURa9bbVHyDkd4mIw1pSnoS0xik
 sjPJvB68DeCt9GE2NnmHM0x9WB4kwy9DVtJYHbp6wNnUCoIwsXBImoxvD2C+GhQxihYq
 NdoqewLN7ZIPIvcZdsuBVpCvEzs6Gq5H/fKhaE/Id/5CQecshE+X/wVZ466vfW1nvMA+
 U2Il0eh/eHdFpN254kLRELxlGO+9KLqDaQ08bH9qdpxl1SPNzsdOWXkhpUKeELlnCGFB
 LlhQ==
X-Gm-Message-State: APjAAAVkXY5hkjiS4gvZmLyRUvjNlDP2ymGN9dStB2DtVHCYZXKea7Q/
 59Lw43kb9Gt23vnuROFdDR9N7Tl1V9Pg1X8lzUI=
X-Google-Smtp-Source: APXvYqw5e1Uj4fCb6HB01deitecOJl4EE5Nq9RzFm1Fu8lGk3LY+KguvMdQLp0ab+SH5e8xchNUCUxbM4FeBUQBKitY=
X-Received: by 2002:ac8:5516:: with SMTP id j22mr24386433qtq.160.1575133116441; 
 Sat, 30 Nov 2019 08:58:36 -0800 (PST)
MIME-Version: 1.0
References: <20191127175257.23480-1-mrolnik@gmail.com>
 <20191127175257.23480-13-mrolnik@gmail.com>
 <CAL1e-=iZ1641hbhhKzSOd+v82S+EN53kGtQ8GC1rfBaxH1Pzvg@mail.gmail.com>
In-Reply-To: <CAL1e-=iZ1641hbhhKzSOd+v82S+EN53kGtQ8GC1rfBaxH1Pzvg@mail.gmail.com>
From: Michael Rolnik <mrolnik@gmail.com>
Date: Sat, 30 Nov 2019 18:57:27 +0200
Message-ID: <CAK4993jpkD8WBzdjjL=kteGw0Gm=YYRuFm9c21s34Dn7QUcX=g@mail.gmail.com>
Subject: Re: [PATCH v37 12/17] target/avr: Add example board configuration
To: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000e128f40598934149"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::843
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
Cc: "thuth@redhat.com" <thuth@redhat.com>,
 "me@xcancerberox.com.ar" <me@xcancerberox.com.ar>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "dovgaluk@ispras.ru" <dovgaluk@ispras.ru>,
 "imammedo@redhat.com" <imammedo@redhat.com>,
 "philmd@redhat.com" <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000e128f40598934149
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Aleksandar.

I guess no testing would be possible.

My previous series of patches (about 2 years ago, before Sarah joined) did
not contain any peripherals, there were only the CPU and the sample board,
I used it to test instructions.
Somebody complained that there are no peripherals and that was where I
stopped to care as I did (and still don't) want to model devices.
I believed that others would join and add devices. then two years passed
by, Sarah implemented the timer and the UART devices.
And here we are.

Regards,
Michael Rolnik

On Sat, Nov 30, 2019 at 12:49 PM Aleksandar Markovic <
aleksandar.m.mail@gmail.com> wrote:

>
>
> On Wednesday, November 27, 2019, Michael Rolnik <mrolnik@gmail.com> wrote=
:
>
>> A simple board setup that configures an AVR CPU to run a given firmware
>> image.
>> This is all that's useful to implement without peripheral emulation as
>> AVR CPUs include a lot of on-board peripherals.
>>
>> NOTE: this is not a real board !!!!
>> NOTE: it's used for CPU testing!!!!
>>
>> Signed-off-by: Michael Rolnik <mrolnik@gmail.com>
>> Reviewed-by: Aleksandar Markovic <amarkovic@wavecomp.com>
>> Nacked-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>> ---
>>  hw/avr/sample.c      | 282 +++++++++++++++++++++++++++++++++++++++++++
>>  hw/Kconfig           |   1 +
>>  hw/avr/Kconfig       |   6 +
>>  hw/avr/Makefile.objs |   1 +
>>  4 files changed, 290 insertions(+)
>>  create mode 100644 hw/avr/sample.c
>>  create mode 100644 hw/avr/Kconfig
>>  create mode 100644 hw/avr/Makefile.objs
>>
>
> Michael, hi.
>
> I just need a clarification here:
>
> - What will happen if this patch is removed? Would boot and Avocado tests
> work? What else in general wouldn't work or be available? What was, in
> fact, the ultimate motivation for you to insert this patch?
>
> Thanks,
> Aleksandar
>
>
>
>> diff --git a/hw/avr/sample.c b/hw/avr/sample.c
>> new file mode 100644
>> index 0000000000..2295ec1b79
>> --- /dev/null
>> +++ b/hw/avr/sample.c
>> @@ -0,0 +1,282 @@
>> +/*
>> + * QEMU AVR CPU
>> + *
>> + * Copyright (c) 2019 Michael Rolnik
>> + *
>> + * This library is free software; you can redistribute it and/or
>> + * modify it under the terms of the GNU Lesser General Public
>> + * License as published by the Free Software Foundation; either
>> + * version 2.1 of the License, or (at your option) any later version.
>> + *
>> + * This library is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
>> + * Lesser General Public License for more details.
>> + *
>> + * You should have received a copy of the GNU Lesser General Public
>> + * License along with this library; if not, see
>> + * <http://www.gnu.org/licenses/lgpl-2.1.html>
>> + */
>> +
>> +/*
>> + *  NOTE:
>> + *      This is not a real AVR board, this is an example!
>> + *      The CPU is an approximation of an ATmega2560, but is missing
>> various
>> + *      built-in peripherals.
>> + *
>> + *      This example board loads provided binary file into flash memory
>> and
>> + *      executes it from 0x00000000 address in the code memory space.
>> + *
>> + *      Currently used for AVR CPU validation
>> + *
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +#include "qapi/error.h"
>> +#include "qemu-common.h"
>> +#include "cpu.h"
>> +#include "hw/hw.h"
>> +#include "sysemu/sysemu.h"
>> +#include "sysemu/qtest.h"
>> +#include "ui/console.h"
>> +#include "hw/boards.h"
>> +#include "hw/loader.h"
>> +#include "qemu/error-report.h"
>> +#include "exec/address-spaces.h"
>> +#include "include/hw/sysbus.h"
>> +#include "include/hw/char/avr_usart.h"
>> +#include "include/hw/timer/avr_timer16.h"
>> +#include "include/hw/misc/avr_mask.h"
>> +#include "elf.h"
>> +#include "hw/misc/unimp.h"
>> +
>> +#define SIZE_FLASH 0x00040000
>> +#define SIZE_SRAM 0x00002000
>> +/*
>> + * Size of additional "external" memory, as if the AVR were configured
>> to use
>> + * an external RAM chip.
>> + * Note that the configuration registers that normally enable this
>> feature are
>> + * unimplemented.
>> + */
>> +#define SIZE_EXMEM 0x00000000
>> +
>> +/* Offsets of peripherals in emulated memory space (i.e. not host
>> addresses)  */
>> +#define PRR0_BASE 0x64
>> +#define PRR1_BASE 0x65
>> +#define USART_BASE 0xc0
>> +#define TIMER1_BASE 0x80
>> +#define TIMER1_IMSK_BASE 0x6f
>> +#define TIMER1_IFR_BASE 0x36
>> +
>> +/* Interrupt numbers used by peripherals */
>> +#define USART_RXC_IRQ 24
>> +#define USART_DRE_IRQ 25
>> +#define USART_TXC_IRQ 26
>> +
>> +#define TIMER1_CAPT_IRQ 15
>> +#define TIMER1_COMPA_IRQ 16
>> +#define TIMER1_COMPB_IRQ 17
>> +#define TIMER1_COMPC_IRQ 18
>> +#define TIMER1_OVF_IRQ 19
>> +
>> +/*  Power reduction     */
>> +#define PRR1_BIT_PRTIM5     0x05    /*  Timer/Counter5  */
>> +#define PRR1_BIT_PRTIM4     0x04    /*  Timer/Counter4  */
>> +#define PRR1_BIT_PRTIM3     0x03    /*  Timer/Counter3  */
>> +#define PRR1_BIT_PRUSART3   0x02    /*  USART3  */
>> +#define PRR1_BIT_PRUSART2   0x01    /*  USART2  */
>> +#define PRR1_BIT_PRUSART1   0x00    /*  USART1  */
>> +
>> +#define PRR0_BIT_PRTWI      0x06    /*  TWI */
>> +#define PRR0_BIT_PRTIM2     0x05    /*  Timer/Counter2  */
>> +#define PRR0_BIT_PRTIM0     0x04    /*  Timer/Counter0  */
>> +#define PRR0_BIT_PRTIM1     0x03    /*  Timer/Counter1  */
>> +#define PRR0_BIT_PRSPI      0x02    /*  Serial Peripheral Interface */
>> +#define PRR0_BIT_PRUSART0   0x01    /*  USART0  */
>> +#define PRR0_BIT_PRADC      0x00    /*  ADC */
>> +
>> +typedef struct {
>> +    MachineClass parent;
>> +} SampleMachineClass;
>> +
>> +typedef struct {
>> +    MachineState parent;
>> +    MemoryRegion *ram;
>> +    MemoryRegion *flash;
>> +    AVRUsartState *usart0;
>> +    AVRTimer16State *timer1;
>> +    AVRMaskState *prr[2];
>> +} SampleMachineState;
>> +
>> +#define TYPE_SAMPLE_MACHINE MACHINE_TYPE_NAME("sample")
>> +
>> +#define SAMPLE_MACHINE(obj) \
>> +    OBJECT_CHECK(SampleMachineState, obj, TYPE_SAMPLE_MACHINE)
>> +#define SAMPLE_MACHINE_GET_CLASS(obj) \
>> +    OBJECT_GET_CLASS(SampleMachineClass, obj, TYPE_SAMPLE_MACHINE)
>> +#define SAMPLE_MACHINE_CLASS(klass) \
>> +    OBJECT_CLASS_CHECK(SampleMachineClass, klass, TYPE_SAMPLE_MACHINE)
>> +
>> +static void sample_init(MachineState *machine)
>> +{
>> +    SampleMachineState *sms =3D SAMPLE_MACHINE(machine);
>> +    MemoryRegion *system_memory =3D get_system_memory();
>> +    AVRCPU *cpu;
>> +    const char *firmware =3D NULL;
>> +    const char *filename;
>> +    int bytes_loaded;
>> +    SysBusDevice *busdev;
>> +    DeviceState *cpudev;
>> +
>> +    system_memory =3D get_system_memory();
>> +    sms->ram =3D g_new(MemoryRegion, 1);
>> +    sms->flash =3D g_new(MemoryRegion, 1);
>> +
>> +    cpu =3D AVR_CPU(cpu_create(machine->cpu_type));
>> +    cpudev =3D DEVICE(cpu);
>> +
>> +
>> +    memory_region_init_rom(sms->flash, NULL, "avr.flash", SIZE_FLASH,
>> +            &error_fatal);
>> +    memory_region_add_subregion(system_memory, OFFSET_CODE, sms->flash)=
;
>> +
>> +    /* following are atmel2560 device */
>> +    create_unimplemented_device("usart 3", OFFSET_DATA + 0x0130, 0x0007=
);
>> +    create_unimplemented_device("timer-counter-16bit 5",
>> +            OFFSET_DATA + 0x0120, 0x000e);
>> +    create_unimplemented_device("gpio L", OFFSET_DATA + 0x0109, 0x0003)=
;
>> +    create_unimplemented_device("gpio K", OFFSET_DATA + 0x0106, 0x0003)=
;
>> +    create_unimplemented_device("gpio J", OFFSET_DATA + 0x0103, 0x0003)=
;
>> +    create_unimplemented_device("gpio H", OFFSET_DATA + 0x0100, 0x0003)=
;
>> +    create_unimplemented_device("usart 2", OFFSET_DATA + 0x00d0, 0x0007=
);
>> +    create_unimplemented_device("usart 1", OFFSET_DATA + 0x00c8, 0x0007=
);
>> +    create_unimplemented_device("usart 0", OFFSET_DATA + 0x00c0, 0x0007=
);
>> +    create_unimplemented_device("twi", OFFSET_DATA + 0x00b8, 0x0006);
>> +    create_unimplemented_device("timer-counter-async-8bit 2",
>> +            OFFSET_DATA + 0x00b0, 0x0007);
>> +    create_unimplemented_device("timer-counter-16bit 4",
>> +            OFFSET_DATA + 0x00a0, 0x000e);
>> +    create_unimplemented_device("timer-counter-16bit 3",
>> +            OFFSET_DATA + 0x0090, 0x000e);
>> +    create_unimplemented_device("timer-counter-16bit 1",
>> +            OFFSET_DATA + 0x0080, 0x000e);
>> +    create_unimplemented_device("ac / adc",
>> +            OFFSET_DATA + 0x0078, 0x0008);
>> +    create_unimplemented_device("ext-mem-iface",
>> +            OFFSET_DATA + 0x0074, 0x0002);
>> +    create_unimplemented_device("int-controller",
>> +            OFFSET_DATA + 0x0068, 0x000c);
>> +    create_unimplemented_device("sys",
>> +            OFFSET_DATA + 0x0060, 0x0007);
>> +    create_unimplemented_device("spi",
>> +            OFFSET_DATA + 0x004c, 0x0003);
>> +    create_unimplemented_device("ext-mem-iface",
>> +            OFFSET_DATA + 0x004a, 0x0002);
>> +    create_unimplemented_device("timer-counter-pwm-8bit 0",
>> +            OFFSET_DATA + 0x0043, 0x0006);
>> +    create_unimplemented_device("ext-mem-iface",
>> +            OFFSET_DATA + 0x003e, 0x0005);
>> +    create_unimplemented_device("int-controller",
>> +            OFFSET_DATA + 0x0035, 0x0009);
>> +    create_unimplemented_device("gpio G", OFFSET_DATA + 0x0032, 0x0003)=
;
>> +    create_unimplemented_device("gpio F", OFFSET_DATA + 0x002f, 0x0003)=
;
>> +    create_unimplemented_device("gpio E", OFFSET_DATA + 0x002c, 0x0003)=
;
>> +    create_unimplemented_device("gpio D", OFFSET_DATA + 0x0029, 0x0003)=
;
>> +    create_unimplemented_device("gpio C", OFFSET_DATA + 0x0026, 0x0003)=
;
>> +    create_unimplemented_device("gpio B", OFFSET_DATA + 0x0023, 0x0003)=
;
>> +    create_unimplemented_device("gpio A", OFFSET_DATA + 0x0020, 0x0003)=
;
>> +
>> +    memory_region_allocate_system_memory(
>> +        sms->ram, NULL, "avr.ram", SIZE_SRAM + SIZE_EXMEM);
>> +    memory_region_add_subregion(system_memory, OFFSET_DATA + 0x200,
>> sms->ram);
>> +
>> +    /* Power Reduction built-in peripheral */
>> +    sms->prr[0] =3D AVR_MASK(sysbus_create_simple(TYPE_AVR_MASK,
>> +                    OFFSET_DATA + PRR0_BASE, NULL));
>> +    sms->prr[1] =3D AVR_MASK(sysbus_create_simple(TYPE_AVR_MASK,
>> +                    OFFSET_DATA + PRR1_BASE, NULL));
>> +
>> +    /* USART 0 built-in peripheral */
>> +    sms->usart0 =3D AVR_USART(object_new(TYPE_AVR_USART));
>> +    busdev =3D SYS_BUS_DEVICE(sms->usart0);
>> +    qdev_prop_set_chr(DEVICE(sms->usart0), "chardev", serial_hd(0));
>> +    object_property_set_bool(OBJECT(sms->usart0), true, "realized",
>> +            &error_fatal);
>> +    sysbus_mmio_map(busdev, 0, OFFSET_DATA + USART_BASE);
>> +    /*
>> +     * These IRQ numbers don't match the datasheet because we're
>> counting from
>> +     * zero and not including reset.
>> +     */
>> +    sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(cpudev,
>> USART_RXC_IRQ));
>> +    sysbus_connect_irq(busdev, 1, qdev_get_gpio_in(cpudev,
>> USART_DRE_IRQ));
>> +    sysbus_connect_irq(busdev, 2, qdev_get_gpio_in(cpudev,
>> USART_TXC_IRQ));
>> +    sysbus_connect_irq(SYS_BUS_DEVICE(sms->prr[1]), PRR1_BIT_PRUSART1,
>> +            qdev_get_gpio_in(DEVICE(sms->usart0), 0));
>> +
>> +    /* Timer 1 built-in periphal */
>> +    sms->timer1 =3D AVR_TIMER16(object_new(TYPE_AVR_TIMER16));
>> +    object_property_set_bool(OBJECT(sms->timer1), true, "realized",
>> +            &error_fatal);
>> +    busdev =3D SYS_BUS_DEVICE(sms->timer1);
>> +    sysbus_mmio_map(busdev, 0, OFFSET_DATA + TIMER1_BASE);
>> +    sysbus_mmio_map(busdev, 1, OFFSET_DATA + TIMER1_IMSK_BASE);
>> +    sysbus_mmio_map(busdev, 2, OFFSET_DATA + TIMER1_IFR_BASE);
>> +    sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(cpudev,
>> TIMER1_CAPT_IRQ));
>> +    sysbus_connect_irq(busdev, 1, qdev_get_gpio_in(cpudev,
>> TIMER1_COMPA_IRQ));
>> +    sysbus_connect_irq(busdev, 2, qdev_get_gpio_in(cpudev,
>> TIMER1_COMPB_IRQ));
>> +    sysbus_connect_irq(busdev, 3, qdev_get_gpio_in(cpudev,
>> TIMER1_COMPC_IRQ));
>> +    sysbus_connect_irq(busdev, 4, qdev_get_gpio_in(cpudev,
>> TIMER1_OVF_IRQ));
>> +    sysbus_connect_irq(SYS_BUS_DEVICE(sms->prr[0]), PRR0_BIT_PRTIM1,
>> +            qdev_get_gpio_in(DEVICE(sms->timer1), 0));
>> +
>> +    /* Load firmware (contents of flash) trying to auto-detect format *=
/
>> +    firmware =3D machine->firmware;
>> +    if (firmware !=3D NULL) {
>> +        filename =3D qemu_find_file(QEMU_FILE_TYPE_BIOS, firmware);
>> +        if (filename =3D=3D NULL) {
>> +            error_report("Unable to find %s", firmware);
>> +            exit(1);
>> +        }
>> +
>> +        bytes_loaded =3D load_elf(
>> +            filename, NULL, NULL, NULL, NULL, NULL, NULL, 0, EM_NONE, 0=
,
>> 0);
>> +        if (bytes_loaded < 0) {
>> +            bytes_loaded =3D load_image_targphys(
>> +                filename, OFFSET_CODE, SIZE_FLASH);
>> +        }
>> +        if (bytes_loaded < 0) {
>> +            error_report(
>> +                "Unable to load firmware image %s as ELF or raw binary"=
,
>> +                firmware);
>> +            exit(1);
>> +        }
>> +    }
>> +}
>> +
>> +static void sample_class_init(ObjectClass *oc, void *data)
>> +{
>> +    MachineClass *mc =3D MACHINE_CLASS(oc);
>> +
>> +    mc->desc =3D "AVR sample/example board (ATmega2560)";
>> +    mc->init =3D sample_init;
>> +    mc->default_cpus =3D 1;
>> +    mc->min_cpus =3D mc->default_cpus;
>> +    mc->max_cpus =3D mc->default_cpus;
>> +    mc->default_cpu_type =3D "avr6-avr-cpu"; /* ATmega2560. */
>> +    mc->is_default =3D 1;
>> +}
>> +
>> +static const TypeInfo sample_info =3D {
>> +    .name =3D TYPE_SAMPLE_MACHINE,
>> +    .parent =3D TYPE_MACHINE,
>> +    .instance_size =3D sizeof(SampleMachineState),
>> +    .class_size =3D sizeof(SampleMachineClass),
>> +    .class_init =3D sample_class_init,
>> +};
>> +
>> +static void sample_machine_init(void)
>> +{
>> +    type_register_static(&sample_info);
>> +}
>> +
>> +type_init(sample_machine_init);
>> diff --git a/hw/Kconfig b/hw/Kconfig
>> index b9685b3944..07b8abb342 100644
>> --- a/hw/Kconfig
>> +++ b/hw/Kconfig
>> @@ -44,6 +44,7 @@ source watchdog/Kconfig
>>  # arch Kconfig
>>  source arm/Kconfig
>>  source alpha/Kconfig
>> +source avr/Kconfig
>>  source cris/Kconfig
>>  source hppa/Kconfig
>>  source i386/Kconfig
>> diff --git a/hw/avr/Kconfig b/hw/avr/Kconfig
>> new file mode 100644
>> index 0000000000..92aa1e6afb
>> --- /dev/null
>> +++ b/hw/avr/Kconfig
>> @@ -0,0 +1,6 @@
>> +config AVR_SAMPLE
>> +    bool
>> +    select AVR_TIMER16
>> +    select AVR_USART
>> +    select AVR_MASK
>> +    select UNIMP
>> diff --git a/hw/avr/Makefile.objs b/hw/avr/Makefile.objs
>> new file mode 100644
>> index 0000000000..626b7064b3
>> --- /dev/null
>> +++ b/hw/avr/Makefile.objs
>> @@ -0,0 +1 @@
>> +obj-y +=3D sample.o
>> --
>> 2.17.2 (Apple Git-113)
>>
>>

--=20
Best Regards,
Michael Rolnik

--000000000000e128f40598934149
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Aleksandar.<div><br></div><div>I guess no testing would=
 be possible.</div><div><br></div><div>My previous series of patches (about=
 2 years ago, before Sarah joined) did not contain any peripherals, there w=
ere only the CPU and the sample board, I used it to test instructions.=C2=
=A0=C2=A0</div><div>Somebody complained that there are no peripherals=C2=A0=
and that was where I stopped to care as I did (and still don&#39;t) want to=
 model devices.</div><div>I believed that others would join and add devices=
. then two years passed by, Sarah implemented the timer and the UART device=
s.=C2=A0</div><div>And here we are.</div><div><br></div><div>Regards,</div>=
<div>Michael Rolnik</div></div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">On Sat, Nov 30, 2019 at 12:49 PM Aleksandar Markov=
ic &lt;<a href=3D"mailto:aleksandar.m.mail@gmail.com">aleksandar.m.mail@gma=
il.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex"><br><br>On Wednesday, November 27, 2019, Michael Rolnik &lt;<a href=
=3D"mailto:mrolnik@gmail.com" target=3D"_blank">mrolnik@gmail.com</a>&gt; w=
rote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">A simple board s=
etup that configures an AVR CPU to run a given firmware image.<br>
This is all that&#39;s useful to implement without peripheral emulation as =
AVR CPUs include a lot of on-board peripherals.<br>
<br>
NOTE: this is not a real board !!!!<br>
NOTE: it&#39;s used for CPU testing!!!!<br>
<br>
Signed-off-by: Michael Rolnik &lt;<a href=3D"mailto:mrolnik@gmail.com" targ=
et=3D"_blank">mrolnik@gmail.com</a>&gt;<br>
Reviewed-by: Aleksandar Markovic &lt;<a href=3D"mailto:amarkovic@wavecomp.c=
om" target=3D"_blank">amarkovic@wavecomp.com</a>&gt;<br>
Nacked-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@redhat.=
com" target=3D"_blank">philmd@redhat.com</a>&gt;<br>
---<br>
=C2=A0hw/avr/sample.c=C2=A0 =C2=A0 =C2=A0 | 282 +++++++++++++++++++++++++++=
++++++++++++++++<br>
=C2=A0hw/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<=
br>
=C2=A0hw/avr/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A06 +<br>
=C2=A0hw/avr/Makefile.objs |=C2=A0 =C2=A01 +<br>
=C2=A04 files changed, 290 insertions(+)<br>
=C2=A0create mode 100644 hw/avr/sample.c<br>
=C2=A0create mode 100644 hw/avr/Kconfig<br>
=C2=A0create mode 100644 hw/avr/Makefile.objs<br></blockquote><div><br></di=
v><div>Michael, hi.=C2=A0</div><div><br></div><div>I just need a clarificat=
ion here:</div><div><br></div><div>- What will happen if this patch is remo=
ved? Would boot and Avocado tests work? What else in general wouldn&#39;t w=
ork or be available? What was, in fact, the ultimate motivation for you to =
insert this patch?</div><div><br></div><div>Thanks,</div><div>Aleksandar</d=
iv><div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
diff --git a/hw/avr/sample.c b/hw/avr/sample.c<br>
new file mode 100644<br>
index 0000000000..2295ec1b79<br>
--- /dev/null<br>
+++ b/hw/avr/sample.c<br>
@@ -0,0 +1,282 @@<br>
+/*<br>
+ * QEMU AVR CPU<br>
+ *<br>
+ * Copyright (c) 2019 Michael Rolnik<br>
+ *<br>
+ * This library is free software; you can redistribute it and/or<br>
+ * modify it under the terms of the GNU Lesser General Public<br>
+ * License as published by the Free Software Foundation; either<br>
+ * version 2.1 of the License, or (at your option) any later version.<br>
+ *<br>
+ * This library is distributed in the hope that it will be useful,<br>
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of<br>
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See the GNU<=
br>
+ * Lesser General Public License for more details.<br>
+ *<br>
+ * You should have received a copy of the GNU Lesser General Public<br>
+ * License along with this library; if not, see<br>
+ * &lt;<a href=3D"http://www.gnu.org/licenses/lgpl-2.1.html" target=3D"_bl=
ank">http://www.gnu.org/licenses/lgpl-2.1.html</a>&gt;<br>
+ */<br>
+<br>
+/*<br>
+ *=C2=A0 NOTE:<br>
+ *=C2=A0 =C2=A0 =C2=A0 This is not a real AVR board, this is an example!<b=
r>
+ *=C2=A0 =C2=A0 =C2=A0 The CPU is an approximation of an ATmega2560, but i=
s missing various<br>
+ *=C2=A0 =C2=A0 =C2=A0 built-in peripherals.<br>
+ *<br>
+ *=C2=A0 =C2=A0 =C2=A0 This example board loads provided binary file into =
flash memory and<br>
+ *=C2=A0 =C2=A0 =C2=A0 executes it from 0x00000000 address in the code mem=
ory space.<br>
+ *<br>
+ *=C2=A0 =C2=A0 =C2=A0 Currently used for AVR CPU validation<br>
+ *<br>
+ */<br>
+<br>
+#include &quot;qemu/osdep.h&quot;<br>
+#include &quot;qapi/error.h&quot;<br>
+#include &quot;qemu-common.h&quot;<br>
+#include &quot;cpu.h&quot;<br>
+#include &quot;hw/hw.h&quot;<br>
+#include &quot;sysemu/sysemu.h&quot;<br>
+#include &quot;sysemu/qtest.h&quot;<br>
+#include &quot;ui/console.h&quot;<br>
+#include &quot;hw/boards.h&quot;<br>
+#include &quot;hw/loader.h&quot;<br>
+#include &quot;qemu/error-report.h&quot;<br>
+#include &quot;exec/address-spaces.h&quot;<br>
+#include &quot;include/hw/sysbus.h&quot;<br>
+#include &quot;include/hw/char/avr_usart.h&quot;<br>
+#include &quot;include/hw/timer/avr_timer16.h&quot;<br>
+#include &quot;include/hw/misc/avr_mask.h&quot;<br>
+#include &quot;elf.h&quot;<br>
+#include &quot;hw/misc/unimp.h&quot;<br>
+<br>
+#define SIZE_FLASH 0x00040000<br>
+#define SIZE_SRAM 0x00002000<br>
+/*<br>
+ * Size of additional &quot;external&quot; memory, as if the AVR were conf=
igured to use<br>
+ * an external RAM chip.<br>
+ * Note that the configuration registers that normally enable this feature=
 are<br>
+ * unimplemented.<br>
+ */<br>
+#define SIZE_EXMEM 0x00000000<br>
+<br>
+/* Offsets of peripherals in emulated memory space (i.e. not host addresse=
s)=C2=A0 */<br>
+#define PRR0_BASE 0x64<br>
+#define PRR1_BASE 0x65<br>
+#define USART_BASE 0xc0<br>
+#define TIMER1_BASE 0x80<br>
+#define TIMER1_IMSK_BASE 0x6f<br>
+#define TIMER1_IFR_BASE 0x36<br>
+<br>
+/* Interrupt numbers used by peripherals */<br>
+#define USART_RXC_IRQ 24<br>
+#define USART_DRE_IRQ 25<br>
+#define USART_TXC_IRQ 26<br>
+<br>
+#define TIMER1_CAPT_IRQ 15<br>
+#define TIMER1_COMPA_IRQ 16<br>
+#define TIMER1_COMPB_IRQ 17<br>
+#define TIMER1_COMPC_IRQ 18<br>
+#define TIMER1_OVF_IRQ 19<br>
+<br>
+/*=C2=A0 Power reduction=C2=A0 =C2=A0 =C2=A0*/<br>
+#define PRR1_BIT_PRTIM5=C2=A0 =C2=A0 =C2=A00x05=C2=A0 =C2=A0 /*=C2=A0 Time=
r/Counter5=C2=A0 */<br>
+#define PRR1_BIT_PRTIM4=C2=A0 =C2=A0 =C2=A00x04=C2=A0 =C2=A0 /*=C2=A0 Time=
r/Counter4=C2=A0 */<br>
+#define PRR1_BIT_PRTIM3=C2=A0 =C2=A0 =C2=A00x03=C2=A0 =C2=A0 /*=C2=A0 Time=
r/Counter3=C2=A0 */<br>
+#define PRR1_BIT_PRUSART3=C2=A0 =C2=A00x02=C2=A0 =C2=A0 /*=C2=A0 USART3=C2=
=A0 */<br>
+#define PRR1_BIT_PRUSART2=C2=A0 =C2=A00x01=C2=A0 =C2=A0 /*=C2=A0 USART2=C2=
=A0 */<br>
+#define PRR1_BIT_PRUSART1=C2=A0 =C2=A00x00=C2=A0 =C2=A0 /*=C2=A0 USART1=C2=
=A0 */<br>
+<br>
+#define PRR0_BIT_PRTWI=C2=A0 =C2=A0 =C2=A0 0x06=C2=A0 =C2=A0 /*=C2=A0 TWI =
*/<br>
+#define PRR0_BIT_PRTIM2=C2=A0 =C2=A0 =C2=A00x05=C2=A0 =C2=A0 /*=C2=A0 Time=
r/Counter2=C2=A0 */<br>
+#define PRR0_BIT_PRTIM0=C2=A0 =C2=A0 =C2=A00x04=C2=A0 =C2=A0 /*=C2=A0 Time=
r/Counter0=C2=A0 */<br>
+#define PRR0_BIT_PRTIM1=C2=A0 =C2=A0 =C2=A00x03=C2=A0 =C2=A0 /*=C2=A0 Time=
r/Counter1=C2=A0 */<br>
+#define PRR0_BIT_PRSPI=C2=A0 =C2=A0 =C2=A0 0x02=C2=A0 =C2=A0 /*=C2=A0 Seri=
al Peripheral Interface */<br>
+#define PRR0_BIT_PRUSART0=C2=A0 =C2=A00x01=C2=A0 =C2=A0 /*=C2=A0 USART0=C2=
=A0 */<br>
+#define PRR0_BIT_PRADC=C2=A0 =C2=A0 =C2=A0 0x00=C2=A0 =C2=A0 /*=C2=A0 ADC =
*/<br>
+<br>
+typedef struct {<br>
+=C2=A0 =C2=A0 MachineClass parent;<br>
+} SampleMachineClass;<br>
+<br>
+typedef struct {<br>
+=C2=A0 =C2=A0 MachineState parent;<br>
+=C2=A0 =C2=A0 MemoryRegion *ram;<br>
+=C2=A0 =C2=A0 MemoryRegion *flash;<br>
+=C2=A0 =C2=A0 AVRUsartState *usart0;<br>
+=C2=A0 =C2=A0 AVRTimer16State *timer1;<br>
+=C2=A0 =C2=A0 AVRMaskState *prr[2];<br>
+} SampleMachineState;<br>
+<br>
+#define TYPE_SAMPLE_MACHINE MACHINE_TYPE_NAME(&quot;sample&quot;)<br>
+<br>
+#define SAMPLE_MACHINE(obj) \<br>
+=C2=A0 =C2=A0 OBJECT_CHECK(SampleMachineState, obj, TYPE_SAMPLE_MACHINE)<b=
r>
+#define SAMPLE_MACHINE_GET_CLASS(obj) \<br>
+=C2=A0 =C2=A0 OBJECT_GET_CLASS(SampleMachineClass, obj, TYPE_SAMPLE_MACHIN=
E)<br>
+#define SAMPLE_MACHINE_CLASS(klass) \<br>
+=C2=A0 =C2=A0 OBJECT_CLASS_CHECK(SampleMachineClass, klass, TYPE_SAMPLE_MA=
CHINE)<br>
+<br>
+static void sample_init(MachineState *machine)<br>
+{<br>
+=C2=A0 =C2=A0 SampleMachineState *sms =3D SAMPLE_MACHINE(machine);<br>
+=C2=A0 =C2=A0 MemoryRegion *system_memory =3D get_system_memory();<br>
+=C2=A0 =C2=A0 AVRCPU *cpu;<br>
+=C2=A0 =C2=A0 const char *firmware =3D NULL;<br>
+=C2=A0 =C2=A0 const char *filename;<br>
+=C2=A0 =C2=A0 int bytes_loaded;<br>
+=C2=A0 =C2=A0 SysBusDevice *busdev;<br>
+=C2=A0 =C2=A0 DeviceState *cpudev;<br>
+<br>
+=C2=A0 =C2=A0 system_memory =3D get_system_memory();<br>
+=C2=A0 =C2=A0 sms-&gt;ram =3D g_new(MemoryRegion, 1);<br>
+=C2=A0 =C2=A0 sms-&gt;flash =3D g_new(MemoryRegion, 1);<br>
+<br>
+=C2=A0 =C2=A0 cpu =3D AVR_CPU(cpu_create(machine-&gt;cpu_type));<br>
+=C2=A0 =C2=A0 cpudev =3D DEVICE(cpu);<br>
+<br>
+<br>
+=C2=A0 =C2=A0 memory_region_init_rom(sms-&gt;flash, NULL, &quot;avr.flash&=
quot;, SIZE_FLASH,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;error_fatal);<br>
+=C2=A0 =C2=A0 memory_region_add_subregion(system_memory, OFFSET_CODE, sms-=
&gt;flash);<br>
+<br>
+=C2=A0 =C2=A0 /* following are atmel2560 device */<br>
+=C2=A0 =C2=A0 create_unimplemented_device(&quot;usart 3&quot;, OFFSET_DATA=
 + 0x0130, 0x0007);<br>
+=C2=A0 =C2=A0 create_unimplemented_device(&quot;timer-counter-16bit 5&quot=
;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 OFFSET_DATA + 0x0120, 0x000e);<b=
r>
+=C2=A0 =C2=A0 create_unimplemented_device(&quot;gpio L&quot;, OFFSET_DATA =
+ 0x0109, 0x0003);<br>
+=C2=A0 =C2=A0 create_unimplemented_device(&quot;gpio K&quot;, OFFSET_DATA =
+ 0x0106, 0x0003);<br>
+=C2=A0 =C2=A0 create_unimplemented_device(&quot;gpio J&quot;, OFFSET_DATA =
+ 0x0103, 0x0003);<br>
+=C2=A0 =C2=A0 create_unimplemented_device(&quot;gpio H&quot;, OFFSET_DATA =
+ 0x0100, 0x0003);<br>
+=C2=A0 =C2=A0 create_unimplemented_device(&quot;usart 2&quot;, OFFSET_DATA=
 + 0x00d0, 0x0007);<br>
+=C2=A0 =C2=A0 create_unimplemented_device(&quot;usart 1&quot;, OFFSET_DATA=
 + 0x00c8, 0x0007);<br>
+=C2=A0 =C2=A0 create_unimplemented_device(&quot;usart 0&quot;, OFFSET_DATA=
 + 0x00c0, 0x0007);<br>
+=C2=A0 =C2=A0 create_unimplemented_device(&quot;twi&quot;, OFFSET_DATA + 0=
x00b8, 0x0006);<br>
+=C2=A0 =C2=A0 create_unimplemented_device(&quot;timer-counter-async-8bit 2=
&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 OFFSET_DATA + 0x00b0, 0x0007);<b=
r>
+=C2=A0 =C2=A0 create_unimplemented_device(&quot;timer-counter-16bit 4&quot=
;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 OFFSET_DATA + 0x00a0, 0x000e);<b=
r>
+=C2=A0 =C2=A0 create_unimplemented_device(&quot;timer-counter-16bit 3&quot=
;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 OFFSET_DATA + 0x0090, 0x000e);<b=
r>
+=C2=A0 =C2=A0 create_unimplemented_device(&quot;timer-counter-16bit 1&quot=
;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 OFFSET_DATA + 0x0080, 0x000e);<b=
r>
+=C2=A0 =C2=A0 create_unimplemented_device(&quot;ac / adc&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 OFFSET_DATA + 0x0078, 0x0008);<b=
r>
+=C2=A0 =C2=A0 create_unimplemented_device(&quot;ext-mem-iface&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 OFFSET_DATA + 0x0074, 0x0002);<b=
r>
+=C2=A0 =C2=A0 create_unimplemented_device(&quot;int-controller&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 OFFSET_DATA + 0x0068, 0x000c);<b=
r>
+=C2=A0 =C2=A0 create_unimplemented_device(&quot;sys&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 OFFSET_DATA + 0x0060, 0x0007);<b=
r>
+=C2=A0 =C2=A0 create_unimplemented_device(&quot;spi&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 OFFSET_DATA + 0x004c, 0x0003);<b=
r>
+=C2=A0 =C2=A0 create_unimplemented_device(&quot;ext-mem-iface&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 OFFSET_DATA + 0x004a, 0x0002);<b=
r>
+=C2=A0 =C2=A0 create_unimplemented_device(&quot;timer-counter-pwm-8bit 0&q=
uot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 OFFSET_DATA + 0x0043, 0x0006);<b=
r>
+=C2=A0 =C2=A0 create_unimplemented_device(&quot;ext-mem-iface&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 OFFSET_DATA + 0x003e, 0x0005);<b=
r>
+=C2=A0 =C2=A0 create_unimplemented_device(&quot;int-controller&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 OFFSET_DATA + 0x0035, 0x0009);<b=
r>
+=C2=A0 =C2=A0 create_unimplemented_device(&quot;gpio G&quot;, OFFSET_DATA =
+ 0x0032, 0x0003);<br>
+=C2=A0 =C2=A0 create_unimplemented_device(&quot;gpio F&quot;, OFFSET_DATA =
+ 0x002f, 0x0003);<br>
+=C2=A0 =C2=A0 create_unimplemented_device(&quot;gpio E&quot;, OFFSET_DATA =
+ 0x002c, 0x0003);<br>
+=C2=A0 =C2=A0 create_unimplemented_device(&quot;gpio D&quot;, OFFSET_DATA =
+ 0x0029, 0x0003);<br>
+=C2=A0 =C2=A0 create_unimplemented_device(&quot;gpio C&quot;, OFFSET_DATA =
+ 0x0026, 0x0003);<br>
+=C2=A0 =C2=A0 create_unimplemented_device(&quot;gpio B&quot;, OFFSET_DATA =
+ 0x0023, 0x0003);<br>
+=C2=A0 =C2=A0 create_unimplemented_device(&quot;gpio A&quot;, OFFSET_DATA =
+ 0x0020, 0x0003);<br>
+<br>
+=C2=A0 =C2=A0 memory_region_allocate_system_memory(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sms-&gt;ram, NULL, &quot;avr.ram&quot;, SIZE_S=
RAM + SIZE_EXMEM);<br>
+=C2=A0 =C2=A0 memory_region_add_subregion(system_memory, OFFSET_DATA + 0x2=
00, sms-&gt;ram);<br>
+<br>
+=C2=A0 =C2=A0 /* Power Reduction built-in peripheral */<br>
+=C2=A0 =C2=A0 sms-&gt;prr[0] =3D AVR_MASK(sysbus_create_simple(TYPE_AVR_MA=
SK,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 OFFS=
ET_DATA + PRR0_BASE, NULL));<br>
+=C2=A0 =C2=A0 sms-&gt;prr[1] =3D AVR_MASK(sysbus_create_simple(TYPE_AVR_MA=
SK,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 OFFS=
ET_DATA + PRR1_BASE, NULL));<br>
+<br>
+=C2=A0 =C2=A0 /* USART 0 built-in peripheral */<br>
+=C2=A0 =C2=A0 sms-&gt;usart0 =3D AVR_USART(object_new(TYPE_AVR_USART));<br=
>
+=C2=A0 =C2=A0 busdev =3D SYS_BUS_DEVICE(sms-&gt;usart0);<br>
+=C2=A0 =C2=A0 qdev_prop_set_chr(DEVICE(sms-&gt;usart0), &quot;chardev&quot=
;, serial_hd(0));<br>
+=C2=A0 =C2=A0 object_property_set_bool(OBJECT(sms-&gt;usart0), true, &quot=
;realized&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;error_fatal);<br>
+=C2=A0 =C2=A0 sysbus_mmio_map(busdev, 0, OFFSET_DATA + USART_BASE);<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* These IRQ numbers don&#39;t match the datasheet beca=
use we&#39;re counting from<br>
+=C2=A0 =C2=A0 =C2=A0* zero and not including reset.<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(cpudev, USART=
_RXC_IRQ));<br>
+=C2=A0 =C2=A0 sysbus_connect_irq(busdev, 1, qdev_get_gpio_in(cpudev, USART=
_DRE_IRQ));<br>
+=C2=A0 =C2=A0 sysbus_connect_irq(busdev, 2, qdev_get_gpio_in(cpudev, USART=
_TXC_IRQ));<br>
+=C2=A0 =C2=A0 sysbus_connect_irq(SYS_BUS_DEVICE(sms-&gt;prr[1]), PRR1_BIT_=
PRUSART1,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qdev_get_gpio_in(DEVICE(sms-&gt;=
usart0), 0));<br>
+<br>
+=C2=A0 =C2=A0 /* Timer 1 built-in periphal */<br>
+=C2=A0 =C2=A0 sms-&gt;timer1 =3D AVR_TIMER16(object_new(TYPE_AVR_TIMER16))=
;<br>
+=C2=A0 =C2=A0 object_property_set_bool(OBJECT(sms-&gt;timer1), true, &quot=
;realized&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;error_fatal);<br>
+=C2=A0 =C2=A0 busdev =3D SYS_BUS_DEVICE(sms-&gt;timer1);<br>
+=C2=A0 =C2=A0 sysbus_mmio_map(busdev, 0, OFFSET_DATA + TIMER1_BASE);<br>
+=C2=A0 =C2=A0 sysbus_mmio_map(busdev, 1, OFFSET_DATA + TIMER1_IMSK_BASE);<=
br>
+=C2=A0 =C2=A0 sysbus_mmio_map(busdev, 2, OFFSET_DATA + TIMER1_IFR_BASE);<b=
r>
+=C2=A0 =C2=A0 sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(cpudev, TIMER=
1_CAPT_IRQ));<br>
+=C2=A0 =C2=A0 sysbus_connect_irq(busdev, 1, qdev_get_gpio_in(cpudev, TIMER=
1_COMPA_IRQ));<br>
+=C2=A0 =C2=A0 sysbus_connect_irq(busdev, 2, qdev_get_gpio_in(cpudev, TIMER=
1_COMPB_IRQ));<br>
+=C2=A0 =C2=A0 sysbus_connect_irq(busdev, 3, qdev_get_gpio_in(cpudev, TIMER=
1_COMPC_IRQ));<br>
+=C2=A0 =C2=A0 sysbus_connect_irq(busdev, 4, qdev_get_gpio_in(cpudev, TIMER=
1_OVF_IRQ));<br>
+=C2=A0 =C2=A0 sysbus_connect_irq(SYS_BUS_DEVICE(sms-&gt;prr[0]), PRR0_BIT_=
PRTIM1,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qdev_get_gpio_in(DEVICE(sms-&gt;=
timer1), 0));<br>
+<br>
+=C2=A0 =C2=A0 /* Load firmware (contents of flash) trying to auto-detect f=
ormat */<br>
+=C2=A0 =C2=A0 firmware =3D machine-&gt;firmware;<br>
+=C2=A0 =C2=A0 if (firmware !=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 filename =3D qemu_find_file(QEMU_FILE_TYPE_BIO=
S, firmware);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (filename =3D=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;Unable to fin=
d %s&quot;, firmware);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bytes_loaded =3D load_elf(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 filename, NULL, NULL, NULL, NULL=
, NULL, NULL, 0, EM_NONE, 0, 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (bytes_loaded &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bytes_loaded =3D load_image_targ=
phys(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 filename, OFFSET_C=
ODE, SIZE_FLASH);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (bytes_loaded &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Unable to lo=
ad firmware image %s as ELF or raw binary&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 firmware);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static void sample_class_init(ObjectClass *oc, void *data)<br>
+{<br>
+=C2=A0 =C2=A0 MachineClass *mc =3D MACHINE_CLASS(oc);<br>
+<br>
+=C2=A0 =C2=A0 mc-&gt;desc =3D &quot;AVR sample/example board (ATmega2560)&=
quot;;<br>
+=C2=A0 =C2=A0 mc-&gt;init =3D sample_init;<br>
+=C2=A0 =C2=A0 mc-&gt;default_cpus =3D 1;<br>
+=C2=A0 =C2=A0 mc-&gt;min_cpus =3D mc-&gt;default_cpus;<br>
+=C2=A0 =C2=A0 mc-&gt;max_cpus =3D mc-&gt;default_cpus;<br>
+=C2=A0 =C2=A0 mc-&gt;default_cpu_type =3D &quot;avr6-avr-cpu&quot;; /* ATm=
ega2560. */<br>
+=C2=A0 =C2=A0 mc-&gt;is_default =3D 1;<br>
+}<br>
+<br>
+static const TypeInfo sample_info =3D {<br>
+=C2=A0 =C2=A0 .name =3D TYPE_SAMPLE_MACHINE,<br>
+=C2=A0 =C2=A0 .parent =3D TYPE_MACHINE,<br>
+=C2=A0 =C2=A0 .instance_size =3D sizeof(SampleMachineState),<br>
+=C2=A0 =C2=A0 .class_size =3D sizeof(SampleMachineClass),<br>
+=C2=A0 =C2=A0 .class_init =3D sample_class_init,<br>
+};<br>
+<br>
+static void sample_machine_init(void)<br>
+{<br>
+=C2=A0 =C2=A0 type_register_static(&amp;sample_info);<br>
+}<br>
+<br>
+type_init(sample_machine_init);<br>
diff --git a/hw/Kconfig b/hw/Kconfig<br>
index b9685b3944..07b8abb342 100644<br>
--- a/hw/Kconfig<br>
+++ b/hw/Kconfig<br>
@@ -44,6 +44,7 @@ source watchdog/Kconfig<br>
=C2=A0# arch Kconfig<br>
=C2=A0source arm/Kconfig<br>
=C2=A0source alpha/Kconfig<br>
+source avr/Kconfig<br>
=C2=A0source cris/Kconfig<br>
=C2=A0source hppa/Kconfig<br>
=C2=A0source i386/Kconfig<br>
diff --git a/hw/avr/Kconfig b/hw/avr/Kconfig<br>
new file mode 100644<br>
index 0000000000..92aa1e6afb<br>
--- /dev/null<br>
+++ b/hw/avr/Kconfig<br>
@@ -0,0 +1,6 @@<br>
+config AVR_SAMPLE<br>
+=C2=A0 =C2=A0 bool<br>
+=C2=A0 =C2=A0 select AVR_TIMER16<br>
+=C2=A0 =C2=A0 select AVR_USART<br>
+=C2=A0 =C2=A0 select AVR_MASK<br>
+=C2=A0 =C2=A0 select UNIMP<br>
diff --git a/hw/avr/Makefile.objs b/hw/avr/Makefile.objs<br>
new file mode 100644<br>
index 0000000000..626b7064b3<br>
--- /dev/null<br>
+++ b/hw/avr/Makefile.objs<br>
@@ -0,0 +1 @@<br>
+obj-y +=3D sample.o<br>
-- <br>
2.17.2 (Apple Git-113)<br>
<br>
</blockquote>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">Best Regards,<br>Michael Rolnik</div>

--000000000000e128f40598934149--

