Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F106E7E3
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Jul 2019 17:20:11 +0200 (CEST)
Received: from localhost ([::1]:46222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hoUg6-0008LE-Cv
	for lists+qemu-devel@lfdr.de; Fri, 19 Jul 2019 11:20:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58755)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mrolnik@gmail.com>) id 1hoUfk-0007wH-JA
 for qemu-devel@nongnu.org; Fri, 19 Jul 2019 11:19:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mrolnik@gmail.com>) id 1hoUfW-00006H-6y
 for qemu-devel@nongnu.org; Fri, 19 Jul 2019 11:19:40 -0400
Received: from mail-qk1-x742.google.com ([2607:f8b0:4864:20::742]:35736)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <mrolnik@gmail.com>) id 1hoUfR-0006PA-6c
 for qemu-devel@nongnu.org; Fri, 19 Jul 2019 11:19:30 -0400
Received: by mail-qk1-x742.google.com with SMTP id r21so23516493qke.2
 for <qemu-devel@nongnu.org>; Fri, 19 Jul 2019 08:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UeX8EIZ1/yHD/UJTDMk5zGkZRx8SIlJxvMNGSi+Wp5E=;
 b=mDsVAYfBQcR2HrzYR6hpzpmyFpxvoMBFCi/AbSJ37Ce83X0dTH9U2ibeLkFanMmWzg
 vH59vtaAzSn556p5QcolcMfS9kxxeFrYLbb1032IPaR6aO2O539CIxUXCXPymI6MGkh3
 W/+T/y12B1sc9fp1yb8aYt9Up81jYfmt3k4UB8ZS9PEE6ZK4RfXd3iHIuUGf0jno5Eh9
 Nh31o6jKB325zP3zg+Mqo/aKzkc6FiibWmjakWtNDngVTx6VjqAIRhYmzGsCMDcwlfyF
 HgmH5th3MMivToB257v5aDVSyHO3FE8dwv9BsSWz/qW3vroAKc78e8XIvEwP/beWEQih
 a/OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UeX8EIZ1/yHD/UJTDMk5zGkZRx8SIlJxvMNGSi+Wp5E=;
 b=LLj0otaaq65KwYjk5QR7Twvvw00AbBgbReU2e4oGqY7758bI7t/mvzA/jha9MYimJX
 x5yxro1YdSRQeB8AxT6NgObY/x/3BDYk0jmxZ67kl3Df+Rbb8uRwQkukFe8nBSJnXb62
 wVIKd36APaUDvI3GCiQCTqTdtccjayYxiZh4f+FtUie201bQFal9F+QwYUPVwhFHi0l3
 BoIEx0Ulnma0tv+I9sPg4WPbt310qquM1BkA0vy/SFTDqbzXjis863EyfOSK2rJ65ijO
 3A23cfi9OFGsN/WQu1I4ccfPakv9o7ptMU8CWShWn0aeGVTVKclr+U3QcAhqJudUle5A
 tyBQ==
X-Gm-Message-State: APjAAAV+t2kBG6r/E5F6XsDRzasOer2ikdTs7Y4ivPqB+aHzzIQUiNUM
 JBhMi6EYQYuy7npnm4kMfSNdMSLT3NZuUKjXnnM=
X-Google-Smtp-Source: APXvYqy86H667l+ddNVQ+TYMZzL4H7bHc9d2XCrkGKL3RKD0lQtAaXSEyfvxDPsVZ6Btpx6ufnWKo9i9U1SNNUJHdMY=
X-Received: by 2002:a37:72c5:: with SMTP id
 n188mr31911604qkc.181.1563549310394; 
 Fri, 19 Jul 2019 08:15:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190719082647.18113-1-mrolnik@gmail.com>
 <20190719082647.18113-7-mrolnik@gmail.com>
 <e2d6724c-2a5a-a1bf-9ab0-29a8a71c1a9c@redhat.com>
 <CAK4993jvKdsT-8mFs253=t1EqZCs12rdab1tYdid4SvBBdpFBw@mail.gmail.com>
In-Reply-To: <CAK4993jvKdsT-8mFs253=t1EqZCs12rdab1tYdid4SvBBdpFBw@mail.gmail.com>
From: Michael Rolnik <mrolnik@gmail.com>
Date: Fri, 19 Jul 2019 18:14:33 +0300
Message-ID: <CAK4993i_807dJ5Gi88mKSgXpz80sncWt_O6yOc6TmmD1O_S_tA@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::742
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.23
Subject: Re: [Qemu-devel] [PATCH v27 6/8] target/avr: Add example board
 configuration
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
Cc: Sarah Harris <S.E.Harris@kent.ac.uk>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I should have started the RAM at 0x200 (instead of 0) and make it of size
0x2000. right?

On Fri, Jul 19, 2019 at 6:04 PM Michael Rolnik <mrolnik@gmail.com> wrote:

>
>
> On Fri, Jul 19, 2019 at 5:02 PM Philippe Mathieu-Daud=C3=A9 <philmd@redha=
t.com>
> wrote:
>
>> Hi Michael,
>>
>> On 7/19/19 10:26 AM, Michael Rolnik wrote:
>> > From: Sarah Harris <S.E.Harris@kent.ac.uk>
>> >
>> > A simple board setup that configures an AVR CPU to run a given firmwar=
e
>> image.
>> > This is all that's useful to implement without peripheral emulation as
>> AVR CPUs include a lot of on-board peripherals.
>> >
>> > Signed-off-by: Michael Rolnik <mrolnik@gmail.com>
>> > ---
>> >  hw/Kconfig           |   1 +
>> >  hw/avr/Kconfig       |   5 +
>> >  hw/avr/Makefile.objs |   1 +
>> >  hw/avr/sample.c      | 237 ++++++++++++++++++++++++++++++++++++++++++=
+
>> >  4 files changed, 244 insertions(+)
>> >  create mode 100644 hw/avr/Kconfig
>> >  create mode 100644 hw/avr/Makefile.objs
>> >  create mode 100644 hw/avr/sample.c
>> >
>> > diff --git a/hw/Kconfig b/hw/Kconfig
>> > index 195f541e50..1f25636855 100644
>> > --- a/hw/Kconfig
>> > +++ b/hw/Kconfig
>> > @@ -42,6 +42,7 @@ source watchdog/Kconfig
>> >  # arch Kconfig
>> >  source arm/Kconfig
>> >  source alpha/Kconfig
>> > +source avr/Kconfig
>> >  source cris/Kconfig
>> >  source hppa/Kconfig
>> >  source i386/Kconfig
>> > diff --git a/hw/avr/Kconfig b/hw/avr/Kconfig
>> > new file mode 100644
>> > index 0000000000..dd02a4c37a
>> > --- /dev/null
>> > +++ b/hw/avr/Kconfig
>> > @@ -0,0 +1,5 @@
>> > +config AVR_SAMPLE
>> > +    bool
>> > +    select AVR_TIMER16
>> > +    select AVR_USART
>> > +    select AVR_MASK
>> > diff --git a/hw/avr/Makefile.objs b/hw/avr/Makefile.objs
>> > new file mode 100644
>> > index 0000000000..626b7064b3
>> > --- /dev/null
>> > +++ b/hw/avr/Makefile.objs
>> > @@ -0,0 +1 @@
>> > +obj-y +=3D sample.o
>> > diff --git a/hw/avr/sample.c b/hw/avr/sample.c
>> > new file mode 100644
>> > index 0000000000..563edbd417
>> > --- /dev/null
>> > +++ b/hw/avr/sample.c
>> > @@ -0,0 +1,237 @@
>> > +/*
>> > + * QEMU AVR CPU
>> > + *
>> > + * Copyright (c) 2019 Michael Rolnik
>> > + *
>> > + * This library is free software; you can redistribute it and/or
>> > + * modify it under the terms of the GNU Lesser General Public
>> > + * License as published by the Free Software Foundation; either
>> > + * version 2.1 of the License, or (at your option) any later version.
>> > + *
>> > + * This library is distributed in the hope that it will be useful,
>> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
>> > + * Lesser General Public License for more details.
>> > + *
>> > + * You should have received a copy of the GNU Lesser General Public
>> > + * License along with this library; if not, see
>> > + * <http://www.gnu.org/licenses/lgpl-2.1.html>
>> > + */
>> > +
>> > +/*
>> > + *  NOTE:
>> > + *      This is not a real AVR board, this is an example!
>> > + *      The CPU is an approximation of an ATmega2560, but is missing
>> various
>> > + *      built-in peripherals.
>> > + *
>> > + *      This example board loads provided binary file into flash
>> memory and
>> > + *      executes it from 0x00000000 address in the code memory space.
>> > + *
>> > + *      Currently used for AVR CPU validation
>> > + *
>> > + */
>> > +
>> > +#include "qemu/osdep.h"
>> > +#include "qapi/error.h"
>> > +#include "qemu-common.h"
>> > +#include "cpu.h"
>> > +#include "hw/hw.h"
>> > +#include "sysemu/sysemu.h"
>> > +#include "sysemu/qtest.h"
>> > +#include "ui/console.h"
>> > +#include "hw/boards.h"
>> > +#include "hw/loader.h"
>> > +#include "qemu/error-report.h"
>> > +#include "exec/address-spaces.h"
>> > +#include "include/hw/sysbus.h"
>> > +#include "include/hw/char/avr_usart.h"
>> > +#include "include/hw/timer/avr_timer16.h"
>> > +#include "include/hw/misc/avr_mask.h"
>> > +#include "elf.h"
>> > +
>> > +#define SIZE_FLASH 0x00040000
>> > +#define SIZE_SRAM 0x00002200
>> > +/*
>> > + * Size of additional "external" memory, as if the AVR were configure=
d
>> to use
>> > + * an external RAM chip.
>> > + * Note that the configuration registers that normally enable this
>> feature are
>> > + * unimplemented.
>> > + */
>> > +#define SIZE_EXMEM 0x00000000
>> > +
>> > +/* Offsets of periphals in emulated memory space (i.e. not host
>> addresses)  */
>> > +#define PRR0_BASE 0x64
>> > +#define PRR1_BASE 0x65
>> > +#define USART_BASE 0xc0
>> > +#define TIMER1_BASE 0x80
>> > +#define TIMER1_IMSK_BASE 0x6f
>> > +#define TIMER1_IFR_BASE 0x36
>> > +
>> > +/* Interrupt numbers used by peripherals */
>> > +#define USART_RXC_IRQ 24
>> > +#define USART_DRE_IRQ 25
>> > +#define USART_TXC_IRQ 26
>> > +
>> > +#define TIMER1_CAPT_IRQ 15
>> > +#define TIMER1_COMPA_IRQ 16
>> > +#define TIMER1_COMPB_IRQ 17
>> > +#define TIMER1_COMPC_IRQ 18
>> > +#define TIMER1_OVF_IRQ 19
>> > +
>> > +/*  Power reduction     */
>> > +#define PRR1_BIT_PRTIM5     0x05    /*  Timer/Counter5  */
>> > +#define PRR1_BIT_PRTIM4     0x04    /*  Timer/Counter4  */
>> > +#define PRR1_BIT_PRTIM3     0x03    /*  Timer/Counter3  */
>> > +#define PRR1_BIT_PRUSART3   0x02    /*  USART3  */
>> > +#define PRR1_BIT_PRUSART2   0x01    /*  USART2  */
>> > +#define PRR1_BIT_PRUSART1   0x00    /*  USART1  */
>> > +
>> > +#define PRR0_BIT_PRTWI      0x06    /*  TWI */
>> > +#define PRR0_BIT_PRTIM2     0x05    /*  Timer/Counter2  */
>> > +#define PRR0_BIT_PRTIM0     0x04    /*  Timer/Counter0  */
>> > +#define PRR0_BIT_PRTIM1     0x03    /*  Timer/Counter1  */
>> > +#define PRR0_BIT_PRSPI      0x02    /*  Serial Peripheral Interface *=
/
>> > +#define PRR0_BIT_PRUSART0   0x01    /*  USART0  */
>> > +#define PRR0_BIT_PRADC      0x00    /*  ADC */
>> > +
>> > +typedef struct {
>> > +    MachineClass parent;
>> > +} SampleMachineClass;
>> > +
>> > +typedef struct {
>> > +    MachineState parent;
>> > +    MemoryRegion *ram;
>> > +    MemoryRegion *flash;
>> > +    AVRUsartState *usart0;
>> > +    AVRTimer16State *timer1;
>> > +    AVRMaskState *prr[2];
>> > +} SampleMachineState;
>> > +
>> > +#define TYPE_SAMPLE_MACHINE MACHINE_TYPE_NAME("sample")
>> > +
>> > +#define SAMPLE_MACHINE(obj) \
>> > +    OBJECT_CHECK(SampleMachineState, obj, TYPE_SAMPLE_MACHINE)
>> > +#define SAMPLE_MACHINE_GET_CLASS(obj) \
>> > +    OBJECT_GET_CLASS(SampleMachineClass, obj, TYPE_SAMPLE_MACHINE)
>> > +#define SAMPLE_MACHINE_CLASS(klass) \
>> > +    OBJECT_CLASS_CHECK(SampleMachineClass, klass, TYPE_SAMPLE_MACHINE=
)
>> > +
>> > +static void sample_init(MachineState *machine)
>> > +{
>> > +    SampleMachineState *sms =3D SAMPLE_MACHINE(machine);
>> > +    MemoryRegion *system_memory =3D get_system_memory();
>> > +    AVRCPU *cpu;
>> > +    const char *firmware =3D NULL;
>> > +    const char *filename;
>> > +    int bytes_loaded;
>> > +    SysBusDevice *busdev;
>> > +    DeviceState *cpudev;
>> > +
>> > +    system_memory =3D get_system_memory();
>> > +    sms->ram =3D g_new(MemoryRegion, 1);
>> > +    sms->flash =3D g_new(MemoryRegion, 1);
>> > +
>> > +    cpu =3D AVR_CPU(cpu_create(machine->cpu_type));
>> > +    cpudev =3D DEVICE(cpu);
>> > +
>> > +    memory_region_allocate_system_memory(
>> > +        sms->ram, NULL, "avr.ram", SIZE_SRAM + SIZE_EXMEM);
>> > +    memory_region_add_subregion(system_memory, OFFSET_DATA, sms->ram)=
;
>>
>> Not sure this is correct, you are filling an area of 0x1e0 I/O registers
>> with RAM...
>>
> Please explain.
>
>
>>
>> So you use system_memory to model the first registers, I wonder if QEMU
>> supports a such small area. Well, I won't test it, I'll try a quicker
>> hack:
>>
>> -- >8 --
>> diff --git a/hw/avr/sample.c b/hw/avr/sample.c
>> index 563edbd417..cc60a6ca8d 100644
>> --- a/hw/avr/sample.c
>> +++ b/hw/avr/sample.c
>> @@ -48,6 +48,7 @@
>>  #include "include/hw/timer/avr_timer16.h"
>>  #include "include/hw/misc/avr_mask.h"
>>  #include "elf.h"
>> +#include "hw/misc/unimp.h"
>>
>>  #define SIZE_FLASH 0x00040000
>>  #define SIZE_SRAM 0x00002200
>> @@ -136,12 +137,29 @@ static void sample_init(MachineState *machine)
>>
>>      memory_region_allocate_system_memory(
>>          sms->ram, NULL, "avr.ram", SIZE_SRAM + SIZE_EXMEM);
>> -    memory_region_add_subregion(system_memory, OFFSET_DATA, sms->ram);
>> +    memory_region_add_subregion_overlap(system_memory, OFFSET_DATA,
>> sms->ram,
>> +                                        -2000);
>>
>>      memory_region_init_rom(sms->flash, NULL, "avr.flash", SIZE_FLASH,
>>              &error_fatal);
>>      memory_region_add_subregion(system_memory, OFFSET_CODE, sms->flash)=
;
>>
>> +    create_unimplemented_device("io", 0x800000 + 0x20, 0x40);
>> +    create_unimplemented_device("data", 0x800000 + 0x20 + 0x40, 0x1a0);
>> +
>> +    create_unimplemented_device("gpio", 0x800000 + 0x20 + 0, 0x14);
>> +    create_unimplemented_device("intc", 0x800000 + 0x20 + 0x1c, 0x2);
>> +    create_unimplemented_device("tmr0", 0x800000 + 0x20 + 0x26, 0x3);
>> +    create_unimplemented_device("adc", 0x800000 + 0x20 + 0x78, 0x8);
>> +    create_unimplemented_device("tmr2", 0x800000 + 0x20 + 0x84, 0xa);
>> +    create_unimplemented_device("tmr3", 0x800000 + 0x20 + 0x94, 0xa);
>> +    create_unimplemented_device("tmr4", 0x800000 + 0x20 + 0xa4, 0xa);
>> +    create_unimplemented_device("uart0", 0x800000 + 0x20 + 0xc0, 0x8);
>> +    create_unimplemented_device("uart1", 0x800000 + 0x20 + 0xc8, 0x8);
>> +    create_unimplemented_device("uart2", 0x800000 + 0x20 + 0xd0, 0x8);
>> +    create_unimplemented_device("tmr5", 0x800000 + 0x20 + 0x124, 0xa);
>> +    create_unimplemented_device("uart3", 0x800000 + 0x20 + 0x130, 0x8);
>> +
>>      /* Power Reduction built-in peripheral */
>>      sms->prr[0] =3D AVR_MASK(sysbus_create_simple(TYPE_AVR_MASK,
>>                      OFFSET_DATA + PRR0_BASE, NULL));
>> ---
>>
>> So instead of using a small RAM region for registers, I use the same
>> amount you used, but with lower priority (-2000). Then I create
>> 'UnimplementedDevice' for the most common blocks and map them (they'll
>> be mapped at prio -1000).
>>
>> Now we have this memory map:
>>
>> (qemu) info mtree
>> address-space: memory
>>   0000000000000000-ffffffffffffffff (prio 0, i/o): system
>>     0000000000000000-000000000003ffff (prio 0, rom): avr.flash
>>     0000000000800000-00000000008021ff (prio -2000, ram): avr.ram
>>     0000000000800020-0000000000800033 (prio -1000, i/o): gpio
>>     0000000000800020-000000000080005f (prio -1000, i/o): io
>>     0000000000800036-0000000000800036 (prio 0, i/o): avr-timer16
>>     000000000080003c-000000000080003d (prio -1000, i/o): intc
>>     0000000000800046-0000000000800048 (prio -1000, i/o): tmr0
>>     0000000000800060-00000000008001ff (prio -1000, i/o): data
>>     0000000000800064-0000000000800064 (prio 0, i/o): avr-mask
>>     0000000000800065-0000000000800065 (prio 0, i/o): avr-mask
>>     000000000080006f-000000000080006f (prio 0, i/o): avr-timer16
>>     0000000000800080-000000000080008d (prio 0, i/o): avr-timer16
>>     0000000000800098-000000000080009f (prio -1000, i/o): adc
>>     00000000008000a4-00000000008000ad (prio -1000, i/o): tmr2
>>     00000000008000b4-00000000008000bd (prio -1000, i/o): tmr3
>>     00000000008000c0-00000000008000c7 (prio 0, i/o): avr-usart
>>     00000000008000c4-00000000008000cd (prio -1000, i/o): tmr4
>>     00000000008000e0-00000000008000e7 (prio -1000, i/o): uart0
>>     00000000008000e8-00000000008000ef (prio -1000, i/o): uart1
>>     00000000008000f0-00000000008000f7 (prio -1000, i/o): uart2
>>     0000000000800144-000000000080014d (prio -1000, i/o): tmr5
>>     0000000000800150-0000000000800157 (prio -1000, i/o): uart3
>>
>> The UnimplementedDevice is useful to quickly trace accesses from
>> firmware, you can see:
>>
>> $ avr-softmmu/qemu-system-avr -bios demo.elf -d unimp
>> gpio: unimplemented device write (size 1, value 0xff, offset 0x1)
>> gpio: unimplemented device write (size 1, value 0xff, offset 0x2)
>> gpio: unimplemented device write (size 1, value 0xef, offset 0x2)
>> gpio: unimplemented device write (size 1, value 0xff, offset 0x2)
>> gpio: unimplemented device write (size 1, value 0xef, offset 0x2)
>> gpio: unimplemented device write (size 1, value 0xff, offset 0x2)
>> gpio: unimplemented device write (size 1, value 0xef, offset 0x2)
>> gpio: unimplemented device write (size 1, value 0xff, offset 0x2)
>> gpio: unimplemented device write (size 1, value 0xef, offset 0x2)
>> gpio: unimplemented device write (size 1, value 0xff, offset 0x2)
>>
>> So the Demo code first initialize the GPIO direction, then toggle it
>> (LED blink).
>>
>> > +
>> > +    memory_region_init_rom(sms->flash, NULL, "avr.flash", SIZE_FLASH,
>> > +            &error_fatal);
>> > +    memory_region_add_subregion(system_memory, OFFSET_CODE,
>> sms->flash);
>> > +
>> > +    /* Power Reduction built-in peripheral */
>> > +    sms->prr[0] =3D AVR_MASK(sysbus_create_simple(TYPE_AVR_MASK,
>> > +                    OFFSET_DATA + PRR0_BASE, NULL));
>> > +    sms->prr[1] =3D AVR_MASK(sysbus_create_simple(TYPE_AVR_MASK,
>> > +                    OFFSET_DATA + PRR1_BASE, NULL));
>> > +
>> > +    /* USART 0 built-in peripheral */
>> > +    sms->usart0 =3D AVR_USART(object_new(TYPE_AVR_USART));
>> > +    busdev =3D SYS_BUS_DEVICE(sms->usart0);
>> > +    qdev_prop_set_chr(DEVICE(sms->usart0), "chardev", serial_hd(0));
>> > +    object_property_set_bool(OBJECT(sms->usart0), true, "realized",
>> > +            &error_fatal);
>> > +    sysbus_mmio_map(busdev, 0, OFFSET_DATA + USART_BASE);
>>
>> This OFFSET_DATA makes me wonder... These are I/O devices, it would be
>> cleaner to map them on the I/O bus, and remap the I/O bus to OFFSET_DATA=
.
>>
> Please look here (https://www.avr-tutorials.com/general/avr-memory-map)
> some io registers are accessible as if they are memory.
>
>>
>> Something like this I guess:
>>
>> (qemu) info mtree
>> address-space: memory
>>   0000000000000000-ffffffffffffffff (prio 0, i/o): system
>>     0000000000000000-000000000003ffff (prio 0, rom): avr.flash
>>     0000000000800000-00000000008021ff (prio -2000, ram): avr.ram
>>     0000000000800020-00000000008001ff (prio -1000, i/o): avr.io
>>
>> address-space: I/O
>>   0000000000000000-00000000000001ff (prio 0, i/o): avr.io
>>     0000000000000000-0000000000000033 (prio -1000, i/o): gpio
>>     0000000000000016-0000000000000016 (prio 0, i/o): avr-timer16
>>     000000000000001c-000000000000001d (prio -1000, i/o): intc
>>     0000000000000026-0000000000000028 (prio -1000, i/o): tmr0
>>     0000000000000044-0000000000000044 (prio 0, i/o): avr-mask
>>     0000000000000045-0000000000000045 (prio 0, i/o): avr-mask
>>     000000000000004f-000000000000004f (prio 0, i/o): avr-timer16
>>     0000000000000060-000000000000006d (prio 0, i/o): avr-timer16
>>     0000000000000078-000000000000007f (prio -1000, i/o): adc
>>     0000000000000084-000000000000008d (prio -1000, i/o): tmr2
>>     0000000000000094-000000000000009d (prio -1000, i/o): tmr3
>>     00000000000000a0-00000000000000a7 (prio 0, i/o): avr-usart
>>     00000000000000a4-00000000000000ad (prio -1000, i/o): tmr4
>>     00000000000000c0-00000000000000c7 (prio -1000, i/o): uart0
>>     00000000000000c8-00000000000000cf (prio -1000, i/o): uart1
>>     00000000000000d0-00000000000000d7 (prio -1000, i/o): uart2
>>     0000000000000124-000000000000012d (prio -1000, i/o): tmr5
>>     0000000000000130-0000000000000127 (prio -1000, i/o): uart3
>>
>> > +    /*
>> > +     * These IRQ numbers don't match the datasheet because we're
>> counting from
>> > +     * zero and not including reset.
>> > +     */
>> > +    sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(cpudev,
>> USART_RXC_IRQ));
>> > +    sysbus_connect_irq(busdev, 1, qdev_get_gpio_in(cpudev,
>> USART_DRE_IRQ));
>> > +    sysbus_connect_irq(busdev, 2, qdev_get_gpio_in(cpudev,
>> USART_TXC_IRQ));
>> > +    sysbus_connect_irq(SYS_BUS_DEVICE(sms->prr[1]), PRR1_BIT_PRUSART1=
,
>> > +            qdev_get_gpio_in(DEVICE(sms->usart0), 0));
>> > +
>> > +    /* Timer 1 built-in periphal */
>> > +    sms->timer1 =3D AVR_TIMER16(object_new(TYPE_AVR_TIMER16));
>> > +    object_property_set_bool(OBJECT(sms->timer1), true, "realized",
>> > +            &error_fatal);
>> > +    busdev =3D SYS_BUS_DEVICE(sms->timer1);
>> > +    sysbus_mmio_map(busdev, 0, OFFSET_DATA + TIMER1_BASE);
>> > +    sysbus_mmio_map(busdev, 1, OFFSET_DATA + TIMER1_IMSK_BASE);
>> > +    sysbus_mmio_map(busdev, 2, OFFSET_DATA + TIMER1_IFR_BASE);
>> > +    sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(cpudev,
>> TIMER1_CAPT_IRQ));
>> > +    sysbus_connect_irq(busdev, 1, qdev_get_gpio_in(cpudev,
>> TIMER1_COMPA_IRQ));
>> > +    sysbus_connect_irq(busdev, 2, qdev_get_gpio_in(cpudev,
>> TIMER1_COMPB_IRQ));
>> > +    sysbus_connect_irq(busdev, 3, qdev_get_gpio_in(cpudev,
>> TIMER1_COMPC_IRQ));
>> > +    sysbus_connect_irq(busdev, 4, qdev_get_gpio_in(cpudev,
>> TIMER1_OVF_IRQ));
>> > +    sysbus_connect_irq(SYS_BUS_DEVICE(sms->prr[0]), PRR0_BIT_PRTIM1,
>> > +            qdev_get_gpio_in(DEVICE(sms->timer1), 0));
>> > +
>> > +    /* Load firmware (contents of flash) trying to auto-detect format
>> */
>> > +    firmware =3D machine->firmware;
>> > +    if (firmware !=3D NULL) {
>> > +        filename =3D qemu_find_file(QEMU_FILE_TYPE_BIOS, firmware);
>> > +        if (filename =3D=3D NULL) {
>> > +            error_report("Unable to find %s", firmware);
>> > +            exit(1);
>> > +        }
>> > +
>> > +        bytes_loaded =3D load_elf(
>> > +            filename, NULL, NULL, NULL, NULL, NULL, NULL, 0, EM_NONE,
>> 0, 0);
>> > +        if (bytes_loaded < 0) {
>> > +            error_report(
>> > +                "Unable to load %s as ELF, trying again as raw binary=
",
>> > +                firmware);
>> > +            bytes_loaded =3D load_image_targphys(
>> > +                filename, OFFSET_CODE, SIZE_FLASH);
>> > +        }
>> > +        if (bytes_loaded < 0) {
>> > +            error_report(
>> > +                "Unable to load firmware image %s as ELF or raw
>> binary",
>> > +                firmware);
>> > +            exit(1);
>> > +        }
>> > +    }
>> > +}
>> > +
>> > +static void sample_class_init(ObjectClass *oc, void *data)
>> > +{
>> > +    MachineClass *mc =3D MACHINE_CLASS(oc);
>> > +
>> > +    mc->desc =3D "AVR sample/example board (ATmega2560)";
>> > +    mc->init =3D sample_init;
>> > +    mc->default_cpus =3D 1;
>> > +    mc->min_cpus =3D mc->default_cpus;
>> > +    mc->max_cpus =3D mc->default_cpus;
>> > +    mc->default_cpu_type =3D "avr6-avr-cpu"; /* ATmega2560. */
>> > +    mc->is_default =3D 1;
>> > +}
>> > +
>> > +static const TypeInfo sample_info =3D {
>> > +    .name =3D TYPE_SAMPLE_MACHINE,
>> > +    .parent =3D TYPE_MACHINE,
>> > +    .instance_size =3D sizeof(SampleMachineState),
>> > +    .class_size =3D sizeof(SampleMachineClass),
>> > +    .class_init =3D sample_class_init,
>> > +};
>> > +
>> > +static void sample_machine_init(void)
>> > +{
>> > +    type_register_static(&sample_info);
>> > +}
>> > +
>> > +type_init(sample_machine_init);
>> >
>>
>
>
> --
> Best Regards,
> Michael Rolnik
>


--=20
Best Regards,
Michael Rolnik
