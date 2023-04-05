Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 332666D7700
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 10:33:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjyZ4-0001fx-Br; Wed, 05 Apr 2023 04:32:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pjyZ1-0001fk-Lc
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 04:32:19 -0400
Received: from mail-ua1-x92e.google.com ([2607:f8b0:4864:20::92e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pjyYz-0000Bo-Pp
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 04:32:19 -0400
Received: by mail-ua1-x92e.google.com with SMTP id ay14so25028160uab.13
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 01:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680683536;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sxChsz6QRVjl1Q0Rpe+G8xtVtKmXDaYXhQ9S0HAfbS4=;
 b=pgLdPn5yekogsGXcZIYEjvx/jkKXqh7q0OnbFCJDYGzvh3NT26IivbxCh3UAcQc7+M
 5Zc1pYEMm1sQ/X03lR5vrz1nYSnuhsK+htEOZoqthhyKNndq/yKPR59PSAjX4QaZZLsU
 1554GYsp4PeRVUW06EWM9QyKPmvyh8NmGmcE7rTgAk/mL4+1PqRgAg8zEcjWveX3gczN
 1ZmtayY3glmgUzFtrNWbbAtw5yvwsN6XK/JNxCDfGSuuljwIkGTQ0YOaj5CmKmooolNf
 Ki84hejf8pvuFiznockq8YuveY5x341Ji9oLKh4+J4zIKDW85ZGkRTNNt/zbMtpc+HL9
 owUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680683536;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sxChsz6QRVjl1Q0Rpe+G8xtVtKmXDaYXhQ9S0HAfbS4=;
 b=NalWDMBLnnbjsgRXph4lv7die0P+N/A3SvYVQOwlSMrolnpccUAGWSn5MkpgcbdZ12
 zwRax2nSoUUWeUSi2bXkbe2sqYaV70azRcRTeocorDD7I/KOb7lOdMcejjXHIc0vk/lP
 XVE12S+0sDEMTRvb34h8DYKfhVQ95eFQ22ePqN3Yekqej/RPB9YmG1QvgHIbJI310Cuj
 X/mVgyloP13XFrjrBqqBZ15S+Le8bGmOIGdjO3xmnvUbqxGGXi5hy3C4rrkwRd+oNkiU
 H9dv9mXq7vdytvYd/2iM+L2GR9LJEIDHpqRqo7x+0saCJp6gsIVRnys8MJLAi4XfxGgi
 LLiA==
X-Gm-Message-State: AAQBX9ce3t3ebR/q2HYQ7aln6+ZtrCkgnLsQjb5Ht3tXXMqXT/lbTt+f
 I59qBBkrPDHmxLntWQcJVFj8MevmcM6Za8n9vgk=
X-Google-Smtp-Source: AKy350bSrhbMKHDktrFY2JMMx5Je6NQdHXJ1pPQRI1mqBCsPYeesg54Q2zjXYy+sH02zi9u0exqMu1hQMtc/VqNaZ98=
X-Received: by 2002:a1f:ad0b:0:b0:43c:6481:2b50 with SMTP id
 w11-20020a1fad0b000000b0043c64812b50mr4165664vke.0.1680683536593; Wed, 05 Apr
 2023 01:32:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230329084513.7835-1-jth@kernel.org>
 <20230329084513.7835-4-jth@kernel.org>
In-Reply-To: <20230329084513.7835-4-jth@kernel.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 5 Apr 2023 18:32:00 +1000
Message-ID: <CAKmqyKOKZBZfa_7UhLz4=J=OPpmQideEmxD65i_-7guQPhtekA@mail.gmail.com>
Subject: Re: [PATCH 3/4] serial-mcb: Add serial via MEN chameleon bus
To: Johannes Thumshirn <jth@kernel.org>
Cc: qemu-devel@nongnu.org, Alistair Francis <alistair@alistair23.me>, 
 Javier Rodriguez <josejavier.rodriguez@duagon.com>,
 Dmitry Fomichev <dmitry.fomichev@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92e;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92e.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Mar 29, 2023 at 11:09=E2=80=AFPM Johannes Thumshirn <jth@kernel.org=
> wrote:
>
> Add MEN z125 UART over MEN Chameleon Bus emulation.
>
> Signed-off-by: Johannes Thumshirn <jth@kernel.org>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/char/Kconfig      |   6 +++
>  hw/char/meson.build  |   1 +
>  hw/char/serial-mcb.c | 115 +++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 122 insertions(+)
>  create mode 100644 hw/char/serial-mcb.c
>
> diff --git a/hw/char/Kconfig b/hw/char/Kconfig
> index 6b6cf2fc1d..9e8ebf1d3d 100644
> --- a/hw/char/Kconfig
> +++ b/hw/char/Kconfig
> @@ -71,3 +71,9 @@ config GOLDFISH_TTY
>
>  config SHAKTI_UART
>      bool
> +
> +config SERIAL_MCB
> +    bool
> +    default y if MCB
> +    depends on MCB
> +    select SERIAL
> diff --git a/hw/char/meson.build b/hw/char/meson.build
> index e02c60dd54..d5893a142d 100644
> --- a/hw/char/meson.build
> +++ b/hw/char/meson.build
> @@ -20,6 +20,7 @@ softmmu_ss.add(when: 'CONFIG_SHAKTI_UART', if_true: fil=
es('shakti_uart.c'))
>  softmmu_ss.add(when: 'CONFIG_VIRTIO_SERIAL', if_true: files('virtio-cons=
ole.c'))
>  softmmu_ss.add(when: 'CONFIG_XEN_BUS', if_true: files('xen_console.c'))
>  softmmu_ss.add(when: 'CONFIG_XILINX', if_true: files('xilinx_uartlite.c'=
))
> +softmmu_ss.add(when: 'CONFIG_SERIAL_MCB', if_true: files('serial-mcb.c')=
)
>
>  softmmu_ss.add(when: 'CONFIG_AVR_USART', if_true: files('avr_usart.c'))
>  softmmu_ss.add(when: 'CONFIG_COLDFIRE', if_true: files('mcf_uart.c'))
> diff --git a/hw/char/serial-mcb.c b/hw/char/serial-mcb.c
> new file mode 100644
> index 0000000000..7ca8a248ac
> --- /dev/null
> +++ b/hw/char/serial-mcb.c
> @@ -0,0 +1,115 @@
> +/*
> + * QEMU MEN 16z125 UART over MCB emulation
> + *
> + * Copyright (C) 2023 Johannes Thumshirn <jth@kernel.org>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2.  See
> + * the COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qapi/error.h"
> +#include "qemu/module.h"
> +#include "hw/char/serial.h"
> +#include "hw/mcb/mcb.h"
> +#include "hw/irq.h"
> +#include "hw/qdev-properties.h"
> +#include "hw/qdev-properties-system.h"
> +#include "migration/vmstate.h"
> +
> +struct MCBSerialState {
> +    MCBDevice dev;
> +    SerialState state;
> +};
> +
> +#define TYPE_MCB_SERIAL "mcb-serial"
> +OBJECT_DECLARE_SIMPLE_TYPE(MCBSerialState, MCB_SERIAL)
> +
> +static void serial_mcb_realize(DeviceState *dev, Error **errp)
> +{
> +    MCBDevice *mdev =3D MCB_DEVICE(dev);
> +    MCBSerialState *mss =3D DO_UPCAST(MCBSerialState, dev, mdev);
> +    MCBus *bus =3D MCB_BUS(qdev_get_parent_bus(DEVICE(dev)));
> +    SerialState *s =3D &mss->state;
> +
> +    mdev->gdd =3D mcb_new_chameleon_descriptor(bus, 125, mdev->rev,
> +                                             mdev->var, 0x10);
> +    if (!mdev->gdd) {
> +        return;
> +    }
> +
> +    s->baudbase =3D 115200;
> +    if (!qdev_realize(DEVICE(s), NULL, errp)) {
> +        return;
> +    }
> +
> +    s->irq =3D mcb_allocate_irq(&mss->dev);
> +    memory_region_init_io(&s->io, OBJECT(mss), &serial_io_ops, s, "seria=
l", 8);
> +    memory_region_add_subregion(&bus->mmio_region, mdev->gdd->offset, &s=
->io);
> +}
> +
> +static void serial_mcb_unrealize(DeviceState *dev)
> +{
> +    MCBDevice *mdev =3D MCB_DEVICE(dev);
> +    MCBSerialState *mss =3D DO_UPCAST(MCBSerialState, dev, mdev);
> +    SerialState *s =3D &mss->state;
> +
> +    qdev_unrealize(DEVICE(s));
> +    qemu_free_irq(s->irq);
> +    g_free(&mdev->gdd);
> +}
> +
> +static const VMStateDescription vmstate_mcb_serial =3D {
> +    .name =3D "mcb-serial",
> +    .version_id =3D 1,
> +    .minimum_version_id =3D 1,
> +    .fields =3D (VMStateField[]) {
> +        VMSTATE_MCB_DEVICE(dev, MCBSerialState),
> +        VMSTATE_STRUCT(state, MCBSerialState, 0, vmstate_serial, SerialS=
tate),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static Property serial_mcb_properties[] =3D {
> +    DEFINE_PROP_UINT8("rev", MCBSerialState, dev.rev, 0),
> +    DEFINE_PROP_UINT8("var", MCBSerialState, dev.var, 0),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void serial_mcb_class_initfn(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc =3D DEVICE_CLASS(klass);
> +    MCBDeviceClass *mc =3D MCB_DEVICE_CLASS(klass);
> +
> +    mc->realize =3D serial_mcb_realize;
> +    mc->unrealize =3D serial_mcb_unrealize;
> +
> +    set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
> +    dc->desc =3D "MEN 16z125 UART over MCB";
> +    dc->vmsd =3D &vmstate_mcb_serial;
> +    device_class_set_props(dc, serial_mcb_properties);
> +}
> +
> +static void serial_mcb_init(Object *o)
> +{
> +    MCBSerialState *mss =3D MCB_SERIAL(o);
> +
> +    object_initialize_child(o, "serial", &mss->state, TYPE_SERIAL);
> +
> +    qdev_alias_all_properties(DEVICE(&mss->state), o);
> +}
> +
> +static const TypeInfo serial_mcb_info =3D {
> +    .name =3D "mcb-serial",
> +    .parent =3D TYPE_MCB_DEVICE,
> +    .instance_size =3D sizeof(MCBSerialState),
> +    .instance_init =3D serial_mcb_init,
> +    .class_init =3D serial_mcb_class_initfn,
> +};
> +
> +static void serial_mcb_register_types(void)
> +{
> +    type_register_static(&serial_mcb_info);
> +}
> +
> +type_init(serial_mcb_register_types);
> --
> 2.39.2
>
>

