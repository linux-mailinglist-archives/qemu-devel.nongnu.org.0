Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6470A1427F2
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jan 2020 11:13:09 +0100 (CET)
Received: from localhost ([::1]:33150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1itU3Q-0007mg-4m
	for lists+qemu-devel@lfdr.de; Mon, 20 Jan 2020 05:13:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33859)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1itU0a-0004e2-PH
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 05:10:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1itU0V-0002py-2L
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 05:10:12 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:50581
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1itU0U-0002pi-Ug
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 05:10:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579515006;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Grl8R7yq20kC8/YLglzMS9AwR5F07qQpc1jM5+u6gs8=;
 b=BDOlQ7NrplF9deXG8RtxfP7qW3BTuYPQlfPiA3awCwz1X0s39iBJoBSADobkhtZyP4oDmb
 HX90nZIMZk8ruL8XRHkUuZpRA1Qg9u/OZjjeWKH0NibEVd8dmXzDoUXIy4ilwRh6S/293u
 4FKaghy4gBvR65Cb05jGX2xMfEJ8oFI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-0lQWwhY_OUiv-0vfuYPhSQ-1; Mon, 20 Jan 2020 05:10:05 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C78CB107ACC7;
 Mon, 20 Jan 2020 10:10:03 +0000 (UTC)
Received: from localhost (unknown [10.43.2.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AB9B560BF7;
 Mon, 20 Jan 2020 10:09:55 +0000 (UTC)
Date: Mon, 20 Jan 2020 11:09:54 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Subject: Re: [PATCH v3 4/8] hw/avr: Add some Arduino boards
Message-ID: <20200120110954.5b1dc3ce@redhat.com>
In-Reply-To: <b8a453a4-0aaa-8f85-6073-62abd3f70393@redhat.com>
References: <20191229224505.24466-1-f4bug@amsat.org>
 <20191229224505.24466-5-f4bug@amsat.org>
 <20200120100335.58f1b7d2@redhat.com>
 <b8a453a4-0aaa-8f85-6073-62abd3f70393@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: 0lQWwhY_OUiv-0vfuYPhSQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Sarah Harris <S.E.Harris@kent.ac.uk>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 =?UTF-8?B?TWFy?= =?UTF-8?B?Yy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Phillip Stevens <phillip.stevens@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 20 Jan 2020 10:21:52 +0100
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> On 1/20/20 10:03 AM, Igor Mammedov wrote:
> > On Sun, 29 Dec 2019 23:45:01 +0100
> > Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:
> >  =20
> >> Arduino boards are build with AVR chipsets.
> >> Add some of the popular boards:
> >>
> >> - Arduino Duemilanove
> >> - Arduino Uno
> >> - Arduino Mega
> >>
> >> For more information:
> >>    https://www.arduino.cc/en/Main/Products
> >>    https://store.arduino.cc/arduino-genuino/most-popular
> >>
> >> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> >> ---
> >> v2:
> >> - Reword description adding more information (Aleksandar)
> >> - Use DEFINE_TYPES (Igor)
> >>
> >> Cc: Phillip Stevens <phillip.stevens@gmail.com>
> >> Cc: Igor Mammedov <imammedo@redhat.com>
> >> ---
> >>   hw/avr/arduino.c     | 177 +++++++++++++++++++++++++++++++++++++++++=
++
> >>   hw/avr/Makefile.objs |   1 +
> >>   2 files changed, 178 insertions(+)
> >>   create mode 100644 hw/avr/arduino.c
> >>
> >> diff --git a/hw/avr/arduino.c b/hw/avr/arduino.c
> >> new file mode 100644
> >> index 0000000000..ecaaa295d8
> >> --- /dev/null
> >> +++ b/hw/avr/arduino.c
> >> @@ -0,0 +1,177 @@
> >> +/*
> >> + * QEMU Arduino boards
> >> + *
> >> + * Copyright (c) 2019 Philippe Mathieu-Daud=C3=A9
> >> + *
> >> + * This work is licensed under the terms of the GNU GPLv2 or later.
> >> + * See the COPYING file in the top-level directory.
> >> + * SPDX-License-Identifier: GPL-2.0-or-later
> >> + */
> >> +
> >> +/* TODO: Implement the use of EXTRAM */
> >> +
> >> +#include "qemu/osdep.h"
> >> +#include "qemu-common.h"
> >> +#include "qapi/error.h"
> >> +#include "hw/boards.h"
> >> +#include "hw/loader.h"
> >> +#include "elf.h"
> >> +#include "atmega.h"
> >> +
> >> +typedef struct ArduinoMachineState { =20
> > [...] =20
> >> +    MemoryRegion extram;
> >> +} ArduinoMachineState;
> >> +
> >> +typedef struct ArduinoMachineClass { =20
> > [...] =20
> >> +    size_t extram_size; =20
> >=20
> > extfoo doesn't seem to be used in this patch =20
>=20
> Ah leftover from adapting from the 'sample' board which has SIZE_EXMEM=3D=
0=20
> so I ended removing a chunk and forgot this field.
>=20
> Can I add your R-b tag when respining this patch without the field?
sure

later on we need to make up some generic way for machine to say that
-m is not supported to avoid useless/confusing option where board
doesn't care about it.
=20
> >> +} ArduinoMachineClass;
> >> +
> >> +#define TYPE_ARDUINO_MACHINE \
> >> +        MACHINE_TYPE_NAME("arduino")
> >> +#define ARDUINO_MACHINE(obj) \
> >> +        OBJECT_CHECK(ArduinoMachineState, (obj), TYPE_ARDUINO_MACHINE=
)
> >> +#define ARDUINO_MACHINE_CLASS(klass) \
> >> +        OBJECT_CLASS_CHECK(ArduinoMachineClass, (klass), TYPE_ARDUINO=
_MACHINE)
> >> +#define ARDUINO_MACHINE_GET_CLASS(obj) \
> >> +        OBJECT_GET_CLASS(ArduinoMachineClass, (obj), TYPE_ARDUINO_MAC=
HINE)
> >> +
> >> +static void load_firmware(const char *firmware, uint64_t flash_size)
> >> +{
> >> +    const char *filename;
> >> +    int bytes_loaded;
> >> +
> >> +    /* Load firmware (contents of flash) trying to auto-detect format=
 */
> >> +    filename =3D qemu_find_file(QEMU_FILE_TYPE_BIOS, firmware);
> >> +    if (filename =3D=3D NULL) {
> >> +        error_report("Unable to find %s", firmware);
> >> +        exit(1);
> >> +    }
> >> +
> >> +    bytes_loaded =3D load_elf(filename, NULL, NULL, NULL, NULL, NULL,=
 NULL,
> >> +                            0, EM_NONE, 0, 0);
> >> +    if (bytes_loaded < 0) {
> >> +        bytes_loaded =3D load_image_targphys(filename, OFFSET_CODE, f=
lash_size);
> >> +    }
> >> +    if (bytes_loaded < 0) {
> >> +        error_report("Unable to load firmware image %s as ELF or raw =
binary",
> >> +                     firmware);
> >> +        exit(1);
> >> +    }
> >> +}
> >> +
> >> +static void arduino_machine_init(MachineState *machine)
> >> +{
> >> +    ArduinoMachineClass *amc =3D ARDUINO_MACHINE_GET_CLASS(machine);
> >> +    ArduinoMachineState *ams =3D ARDUINO_MACHINE(machine);
> >> +
> >> +    sysbus_init_child_obj(OBJECT(machine), "mcu", &ams->mcu, sizeof(a=
ms->mcu),
> >> +                          amc->mcu_type);
> >> +    object_property_set_uint(OBJECT(&ams->mcu), amc->xtal_hz,
> >> +                             "xtal-frequency-hz", &error_abort);
> >> +    object_property_set_bool(OBJECT(&ams->mcu), true, "realized",
> >> +                             &error_abort);
> >> +
> >> +    if (machine->firmware) {
> >> +        load_firmware(machine->firmware, memory_region_size(&ams->mcu=
.flash));
> >> +    }
> >> +}
> >> +
> >> +static void arduino_machine_class_init(ObjectClass *oc, void *data)
> >> +{
> >> +    MachineClass *mc =3D MACHINE_CLASS(oc);
> >> +
> >> +    mc->init =3D arduino_machine_init;
> >> +    mc->default_cpus =3D 1;
> >> +    mc->min_cpus =3D mc->default_cpus;
> >> +    mc->max_cpus =3D mc->default_cpus;
> >> +    mc->no_floppy =3D 1;
> >> +    mc->no_cdrom =3D 1;
> >> +    mc->no_parallel =3D 1;
> >> +}
> >> +
> >> +static void arduino_duemilanove_class_init(ObjectClass *oc, void *dat=
a)
> >> +{
> >> +    MachineClass *mc =3D MACHINE_CLASS(oc);
> >> +    ArduinoMachineClass *amc =3D ARDUINO_MACHINE_CLASS(oc);
> >> +
> >> +    /* https://www.arduino.cc/en/Main/ArduinoBoardDuemilanove */
> >> +    mc->desc        =3D "Arduino Duemilanove (ATmega168)",
> >> +    mc->alias       =3D "2009";
> >> +    amc->mcu_type   =3D TYPE_ATMEGA168_MCU;
> >> +    amc->xtal_hz    =3D 16 * 1000 * 1000;
> >> +};
> >> +
> >> +static void arduino_uno_class_init(ObjectClass *oc, void *data)
> >> +{
> >> +    MachineClass *mc =3D MACHINE_CLASS(oc);
> >> +    ArduinoMachineClass *amc =3D ARDUINO_MACHINE_CLASS(oc);
> >> +
> >> +    /* https://store.arduino.cc/arduino-uno-rev3 */
> >> +    mc->desc        =3D "Arduino UNO (ATmega328P)";
> >> +    mc->alias       =3D "uno";
> >> +    amc->mcu_type   =3D TYPE_ATMEGA328_MCU;
> >> +    amc->xtal_hz    =3D 16 * 1000 * 1000;
> >> +};
> >> +
> >> +static void arduino_mega_class_init(ObjectClass *oc, void *data)
> >> +{
> >> +    MachineClass *mc =3D MACHINE_CLASS(oc);
> >> +    ArduinoMachineClass *amc =3D ARDUINO_MACHINE_CLASS(oc);
> >> +
> >> +    /* https://www.arduino.cc/en/Main/ArduinoBoardMega */
> >> +    mc->desc        =3D "Arduino Mega (ATmega1280)";
> >> +    mc->alias       =3D "mega";
> >> +    amc->mcu_type   =3D TYPE_ATMEGA1280_MCU;
> >> +    amc->xtal_hz    =3D 16 * 1000 * 1000;
> >> +};
> >> +
> >> +static void arduino_mega2560_class_init(ObjectClass *oc, void *data)
> >> +{
> >> +    MachineClass *mc =3D MACHINE_CLASS(oc);
> >> +    ArduinoMachineClass *amc =3D ARDUINO_MACHINE_CLASS(oc);
> >> +
> >> +    /* https://store.arduino.cc/arduino-mega-2560-rev3 */
> >> +    mc->desc        =3D "Arduino Mega 2560 (ATmega2560)";
> >> +    mc->alias       =3D "mega2560";
> >> +    mc->is_default  =3D true;
> >> +    amc->mcu_type   =3D TYPE_ATMEGA2560_MCU;
> >> +    amc->xtal_hz    =3D 16 * 1000 * 1000; /* CSTCE16M0V53-R0 */
> >> +};
> >> +
> >> +static const TypeInfo arduino_machine_types[] =3D {
> >> +    {
> >> +        .name          =3D MACHINE_TYPE_NAME("arduino-duemilanove"),
> >> +        .parent        =3D TYPE_ARDUINO_MACHINE,
> >> +        .class_init    =3D arduino_duemilanove_class_init,
> >> +    }, {
> >> +        .name          =3D MACHINE_TYPE_NAME("arduino-uno"),
> >> +        .parent        =3D TYPE_ARDUINO_MACHINE,
> >> +        .class_init    =3D arduino_uno_class_init,
> >> +    }, {
> >> +        .name          =3D MACHINE_TYPE_NAME("arduino-mega"),
> >> +        .parent        =3D TYPE_ARDUINO_MACHINE,
> >> +        .class_init    =3D arduino_mega_class_init,
> >> +    }, {
> >> +        .name          =3D MACHINE_TYPE_NAME("arduino-mega-2560-v3"),
> >> +        .parent        =3D TYPE_ARDUINO_MACHINE,
> >> +        .class_init    =3D arduino_mega2560_class_init,
> >> +    }, {
> >> +        .name           =3D TYPE_ARDUINO_MACHINE,
> >> +        .parent         =3D TYPE_MACHINE,
> >> +        .instance_size  =3D sizeof(ArduinoMachineState),
> >> +        .class_size     =3D sizeof(ArduinoMachineClass),
> >> +        .class_init     =3D arduino_machine_class_init,
> >> +        .abstract       =3D true,
> >> +    }
> >> +};
> >> +
> >> +DEFINE_TYPES(arduino_machine_types)
> >> diff --git a/hw/avr/Makefile.objs b/hw/avr/Makefile.objs
> >> index 4b6b911820..39ee3c32b2 100644
> >> --- a/hw/avr/Makefile.objs
> >> +++ b/hw/avr/Makefile.objs
> >> @@ -1,2 +1,3 @@
> >>   obj-y +=3D sample.o
> >>   obj-y +=3D atmega.o
> >> +obj-y +=3D arduino.o =20
> >=20
> >  =20
>=20


