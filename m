Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F473142695
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jan 2020 10:06:12 +0100 (CET)
Received: from localhost ([::1]:60392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1itT0d-0003x8-7Y
	for lists+qemu-devel@lfdr.de; Mon, 20 Jan 2020 04:06:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52989)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1itSyL-0002cZ-Lr
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 04:03:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1itSyH-0008LQ-OC
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 04:03:49 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:27641
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1itSyH-0008Kp-IP
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 04:03:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579511023;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uciPn72MwEgI063A+6nCPRNHimc0XTqn7Hjp9zwUVk4=;
 b=Y+VKUG7N6cGxxyjwIe7sfBDLktf/PRzvx4wkj5Kc3hQZNx6VuiMO+yBpCcsQ9HkyusqtAm
 N05v6HIyTOp5+iljdTKbf0cSAwCnCPNTR1GFw4/vSWUw9EDhIPJ2334RpmFFgIMlNI1z8W
 ypP9LCBHmWU5t+tMRf7tPg79EU5UvkQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-152--f8uHZlXPUqk1mSwa2o0bw-1; Mon, 20 Jan 2020 04:03:42 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2FDF0800EBF;
 Mon, 20 Jan 2020 09:03:41 +0000 (UTC)
Received: from localhost (unknown [10.43.2.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BA7095C21A;
 Mon, 20 Jan 2020 09:03:36 +0000 (UTC)
Date: Mon, 20 Jan 2020 10:03:35 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Subject: Re: [PATCH v3 4/8] hw/avr: Add some Arduino boards
Message-ID: <20200120100335.58f1b7d2@redhat.com>
In-Reply-To: <20191229224505.24466-5-f4bug@amsat.org>
References: <20191229224505.24466-1-f4bug@amsat.org>
 <20191229224505.24466-5-f4bug@amsat.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: -f8uHZlXPUqk1mSwa2o0bw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
 Sarah Harris <S.E.Harris@kent.ac.uk>, qemu-devel@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>,
 Phillip Stevens <phillip.stevens@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 29 Dec 2019 23:45:01 +0100
Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:

> Arduino boards are build with AVR chipsets.
> Add some of the popular boards:
>=20
> - Arduino Duemilanove
> - Arduino Uno
> - Arduino Mega
>=20
> For more information:
>   https://www.arduino.cc/en/Main/Products
>   https://store.arduino.cc/arduino-genuino/most-popular
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> v2:
> - Reword description adding more information (Aleksandar)
> - Use DEFINE_TYPES (Igor)
>=20
> Cc: Phillip Stevens <phillip.stevens@gmail.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> ---
>  hw/avr/arduino.c     | 177 +++++++++++++++++++++++++++++++++++++++++++
>  hw/avr/Makefile.objs |   1 +
>  2 files changed, 178 insertions(+)
>  create mode 100644 hw/avr/arduino.c
>=20
> diff --git a/hw/avr/arduino.c b/hw/avr/arduino.c
> new file mode 100644
> index 0000000000..ecaaa295d8
> --- /dev/null
> +++ b/hw/avr/arduino.c
> @@ -0,0 +1,177 @@
> +/*
> + * QEMU Arduino boards
> + *
> + * Copyright (c) 2019 Philippe Mathieu-Daud=C3=A9
> + *
> + * This work is licensed under the terms of the GNU GPLv2 or later.
> + * See the COPYING file in the top-level directory.
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +/* TODO: Implement the use of EXTRAM */
> +
> +#include "qemu/osdep.h"
> +#include "qemu-common.h"
> +#include "qapi/error.h"
> +#include "hw/boards.h"
> +#include "hw/loader.h"
> +#include "elf.h"
> +#include "atmega.h"
> +
> +typedef struct ArduinoMachineState {
[...]
> +    MemoryRegion extram;
> +} ArduinoMachineState;
> +
> +typedef struct ArduinoMachineClass {
[...]
> +    size_t extram_size;

extfoo doesn't seem to be used in this patch

> +} ArduinoMachineClass;
> +
> +#define TYPE_ARDUINO_MACHINE \
> +        MACHINE_TYPE_NAME("arduino")
> +#define ARDUINO_MACHINE(obj) \
> +        OBJECT_CHECK(ArduinoMachineState, (obj), TYPE_ARDUINO_MACHINE)
> +#define ARDUINO_MACHINE_CLASS(klass) \
> +        OBJECT_CLASS_CHECK(ArduinoMachineClass, (klass), TYPE_ARDUINO_MA=
CHINE)
> +#define ARDUINO_MACHINE_GET_CLASS(obj) \
> +        OBJECT_GET_CLASS(ArduinoMachineClass, (obj), TYPE_ARDUINO_MACHIN=
E)
> +
> +static void load_firmware(const char *firmware, uint64_t flash_size)
> +{
> +    const char *filename;
> +    int bytes_loaded;
> +
> +    /* Load firmware (contents of flash) trying to auto-detect format */
> +    filename =3D qemu_find_file(QEMU_FILE_TYPE_BIOS, firmware);
> +    if (filename =3D=3D NULL) {
> +        error_report("Unable to find %s", firmware);
> +        exit(1);
> +    }
> +
> +    bytes_loaded =3D load_elf(filename, NULL, NULL, NULL, NULL, NULL, NU=
LL,
> +                            0, EM_NONE, 0, 0);
> +    if (bytes_loaded < 0) {
> +        bytes_loaded =3D load_image_targphys(filename, OFFSET_CODE, flas=
h_size);
> +    }
> +    if (bytes_loaded < 0) {
> +        error_report("Unable to load firmware image %s as ELF or raw bin=
ary",
> +                     firmware);
> +        exit(1);
> +    }
> +}
> +
> +static void arduino_machine_init(MachineState *machine)
> +{
> +    ArduinoMachineClass *amc =3D ARDUINO_MACHINE_GET_CLASS(machine);
> +    ArduinoMachineState *ams =3D ARDUINO_MACHINE(machine);
> +
> +    sysbus_init_child_obj(OBJECT(machine), "mcu", &ams->mcu, sizeof(ams-=
>mcu),
> +                          amc->mcu_type);
> +    object_property_set_uint(OBJECT(&ams->mcu), amc->xtal_hz,
> +                             "xtal-frequency-hz", &error_abort);
> +    object_property_set_bool(OBJECT(&ams->mcu), true, "realized",
> +                             &error_abort);
> +
> +    if (machine->firmware) {
> +        load_firmware(machine->firmware, memory_region_size(&ams->mcu.fl=
ash));
> +    }
> +}
> +
> +static void arduino_machine_class_init(ObjectClass *oc, void *data)
> +{
> +    MachineClass *mc =3D MACHINE_CLASS(oc);
> +
> +    mc->init =3D arduino_machine_init;
> +    mc->default_cpus =3D 1;
> +    mc->min_cpus =3D mc->default_cpus;
> +    mc->max_cpus =3D mc->default_cpus;
> +    mc->no_floppy =3D 1;
> +    mc->no_cdrom =3D 1;
> +    mc->no_parallel =3D 1;
> +}
> +
> +static void arduino_duemilanove_class_init(ObjectClass *oc, void *data)
> +{
> +    MachineClass *mc =3D MACHINE_CLASS(oc);
> +    ArduinoMachineClass *amc =3D ARDUINO_MACHINE_CLASS(oc);
> +
> +    /* https://www.arduino.cc/en/Main/ArduinoBoardDuemilanove */
> +    mc->desc        =3D "Arduino Duemilanove (ATmega168)",
> +    mc->alias       =3D "2009";
> +    amc->mcu_type   =3D TYPE_ATMEGA168_MCU;
> +    amc->xtal_hz    =3D 16 * 1000 * 1000;
> +};
> +
> +static void arduino_uno_class_init(ObjectClass *oc, void *data)
> +{
> +    MachineClass *mc =3D MACHINE_CLASS(oc);
> +    ArduinoMachineClass *amc =3D ARDUINO_MACHINE_CLASS(oc);
> +
> +    /* https://store.arduino.cc/arduino-uno-rev3 */
> +    mc->desc        =3D "Arduino UNO (ATmega328P)";
> +    mc->alias       =3D "uno";
> +    amc->mcu_type   =3D TYPE_ATMEGA328_MCU;
> +    amc->xtal_hz    =3D 16 * 1000 * 1000;
> +};
> +
> +static void arduino_mega_class_init(ObjectClass *oc, void *data)
> +{
> +    MachineClass *mc =3D MACHINE_CLASS(oc);
> +    ArduinoMachineClass *amc =3D ARDUINO_MACHINE_CLASS(oc);
> +
> +    /* https://www.arduino.cc/en/Main/ArduinoBoardMega */
> +    mc->desc        =3D "Arduino Mega (ATmega1280)";
> +    mc->alias       =3D "mega";
> +    amc->mcu_type   =3D TYPE_ATMEGA1280_MCU;
> +    amc->xtal_hz    =3D 16 * 1000 * 1000;
> +};
> +
> +static void arduino_mega2560_class_init(ObjectClass *oc, void *data)
> +{
> +    MachineClass *mc =3D MACHINE_CLASS(oc);
> +    ArduinoMachineClass *amc =3D ARDUINO_MACHINE_CLASS(oc);
> +
> +    /* https://store.arduino.cc/arduino-mega-2560-rev3 */
> +    mc->desc        =3D "Arduino Mega 2560 (ATmega2560)";
> +    mc->alias       =3D "mega2560";
> +    mc->is_default  =3D true;
> +    amc->mcu_type   =3D TYPE_ATMEGA2560_MCU;
> +    amc->xtal_hz    =3D 16 * 1000 * 1000; /* CSTCE16M0V53-R0 */
> +};
> +
> +static const TypeInfo arduino_machine_types[] =3D {
> +    {
> +        .name          =3D MACHINE_TYPE_NAME("arduino-duemilanove"),
> +        .parent        =3D TYPE_ARDUINO_MACHINE,
> +        .class_init    =3D arduino_duemilanove_class_init,
> +    }, {
> +        .name          =3D MACHINE_TYPE_NAME("arduino-uno"),
> +        .parent        =3D TYPE_ARDUINO_MACHINE,
> +        .class_init    =3D arduino_uno_class_init,
> +    }, {
> +        .name          =3D MACHINE_TYPE_NAME("arduino-mega"),
> +        .parent        =3D TYPE_ARDUINO_MACHINE,
> +        .class_init    =3D arduino_mega_class_init,
> +    }, {
> +        .name          =3D MACHINE_TYPE_NAME("arduino-mega-2560-v3"),
> +        .parent        =3D TYPE_ARDUINO_MACHINE,
> +        .class_init    =3D arduino_mega2560_class_init,
> +    }, {
> +        .name           =3D TYPE_ARDUINO_MACHINE,
> +        .parent         =3D TYPE_MACHINE,
> +        .instance_size  =3D sizeof(ArduinoMachineState),
> +        .class_size     =3D sizeof(ArduinoMachineClass),
> +        .class_init     =3D arduino_machine_class_init,
> +        .abstract       =3D true,
> +    }
> +};
> +
> +DEFINE_TYPES(arduino_machine_types)
> diff --git a/hw/avr/Makefile.objs b/hw/avr/Makefile.objs
> index 4b6b911820..39ee3c32b2 100644
> --- a/hw/avr/Makefile.objs
> +++ b/hw/avr/Makefile.objs
> @@ -1,2 +1,3 @@
>  obj-y +=3D sample.o
>  obj-y +=3D atmega.o
> +obj-y +=3D arduino.o


