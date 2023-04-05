Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 101EC6D77D6
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 11:11:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjz9f-0007Am-Gg; Wed, 05 Apr 2023 05:10:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pjz9c-00075b-U8
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 05:10:09 -0400
Received: from mail-ua1-x92c.google.com ([2607:f8b0:4864:20::92c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pjz9Y-00077d-SH
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 05:10:07 -0400
Received: by mail-ua1-x92c.google.com with SMTP id p91so7933174uap.1
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 02:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680685803;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xWzATY0XPHMMgRmrUwFBz3FxroV4vUsjfoX3L7k9x6I=;
 b=I6V95Vrf3p28jBwBKl+ScLz68Rk3Swng4MpwB1rXwfDev7Uk1h2hoOQVHZY4Z14nhJ
 KOY/xjSgSuM78Viufw8pjm0GFi115ZJBpUJWesgw9L8AOQu9L1OvACPSmiJpy8qDGax+
 y0VDCWsgS8pLs7VUmOBecqs6O8eJGxpkc1j9WgilJ0vsu0el7gFoQbq2jufqVk61l6zW
 ZSL6+/66Y5/RxM3CrFCjPzD7dMq/oKzi1BtT4hd6XTdqBhNueECoBPNZEmmdJmVLhgph
 oM9tGGaRRpNYnqQrzn7Bd5hpiMBmVi2VPTsIEZE2yYNoNwyDIj45iH8cenZysjaLiEep
 TVtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680685803;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xWzATY0XPHMMgRmrUwFBz3FxroV4vUsjfoX3L7k9x6I=;
 b=JRF4FY1SaxxK2hNva4rxOxViQCVkVgog585g/ryBFcTvn/4F1xHqRTu+mDCW8lZefk
 nmoXAilI+4v3DVcEdNE4lgzWnsp2tWv9eQGUh4Iegw81sTkg8Lz9vYcReS2KhcuYDvzm
 mixqEKlFtLUaVMRjBNoQDonr32Y7f1TORb7MimY0D6JMOV40kV2pV1Km3dlWGe2WyqH+
 pBj3lPy8P7p2YFjMeGIz8hGVDcU7sOshYTrvP212bV5yyMPlba45cV/HN7qS1FDKfkRn
 OXpAIkkohWOSFd6gxLdlkYOgCONktvT8NZaMOCN1i9OyHcwsPblDYZ3VcfxeulOxmtsI
 FWLA==
X-Gm-Message-State: AAQBX9eTBYTUgoTkRbgp/RTV/jv/Y8E2u/JFr67TPCWiKbFucyFlMK2m
 zqxVhseHUYH4jIMeREeKEwmLyj7An54PwNq2O1k6rDpQbpLQbw==
X-Google-Smtp-Source: AKy350ZMrFnpAtejBKley//HTwUw6zZRrE6v4BGOShXhWnYPb0zLQaVO5CfLBDCiy37pd3V95hmARrSvm5iFZUncX5Q=
X-Received: by 2002:a9f:37cd:0:b0:764:64c1:9142 with SMTP id
 q71-20020a9f37cd000000b0076464c19142mr1851817uaq.0.1680685803471; Wed, 05 Apr
 2023 02:10:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230329084513.7835-1-jth@kernel.org>
 <20230329084513.7835-2-jth@kernel.org>
In-Reply-To: <20230329084513.7835-2-jth@kernel.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 5 Apr 2023 19:09:00 +1000
Message-ID: <CAKmqyKPYQ8QWb4eb2cLm8-MFY1Q6zk9F3EsE0uy1Pea1SfVpfA@mail.gmail.com>
Subject: Re: [PATCH 1/4] Add MEN Chameleon Bus emulation
To: Johannes Thumshirn <jth@kernel.org>
Cc: qemu-devel@nongnu.org, Alistair Francis <alistair@alistair23.me>, 
 Javier Rodriguez <josejavier.rodriguez@duagon.com>,
 Dmitry Fomichev <dmitry.fomichev@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92c;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92c.google.com
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

On Wed, Mar 29, 2023 at 11:08=E2=80=AFPM Johannes Thumshirn <jth@kernel.org=
> wrote:
>
> The MEN Chameleon Bus (MCB) is an on-chip bus system exposing IP Cores of=
 an
> FPGA to a outside bus system like PCIe.
>
> Signed-off-by: Johannes Thumshirn <jth@kernel.org>

I don't know a lot about MEN Chameleon Bus, but this looks fine to me

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  MAINTAINERS          |   6 ++
>  hw/Kconfig           |   1 +
>  hw/mcb/Kconfig       |   2 +
>  hw/mcb/mcb.c         | 182 +++++++++++++++++++++++++++++++++++++++++++
>  hw/mcb/meson.build   |   1 +
>  hw/meson.build       |   1 +
>  include/hw/mcb/mcb.h | 106 +++++++++++++++++++++++++
>  7 files changed, 299 insertions(+)
>  create mode 100644 hw/mcb/Kconfig
>  create mode 100644 hw/mcb/mcb.c
>  create mode 100644 hw/mcb/meson.build
>  create mode 100644 include/hw/mcb/mcb.h
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 98cb2d64cf..badec8abdd 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1947,6 +1947,12 @@ R: Paolo Bonzini <pbonzini@redhat.com>
>  S: Odd Fixes
>  F: hw/char/
>
> +MEN Chameleon Bus
> +M: Johannes Thumshirn <jth@kernel.org>
> +S: Maintained
> +F: hw/mcb/
> +F: include/hw/mcb/
> +
>  Network devices
>  M: Jason Wang <jasowang@redhat.com>
>  S: Odd Fixes
> diff --git a/hw/Kconfig b/hw/Kconfig
> index ba62ff6417..f5ef84b10b 100644
> --- a/hw/Kconfig
> +++ b/hw/Kconfig
> @@ -18,6 +18,7 @@ source intc/Kconfig
>  source ipack/Kconfig
>  source ipmi/Kconfig
>  source isa/Kconfig
> +source mcb/Kconfig
>  source mem/Kconfig
>  source misc/Kconfig
>  source net/Kconfig
> diff --git a/hw/mcb/Kconfig b/hw/mcb/Kconfig
> new file mode 100644
> index 0000000000..36a7a583a8
> --- /dev/null
> +++ b/hw/mcb/Kconfig
> @@ -0,0 +1,2 @@
> +config MCB
> +    bool
> diff --git a/hw/mcb/mcb.c b/hw/mcb/mcb.c
> new file mode 100644
> index 0000000000..f2bf722de5
> --- /dev/null
> +++ b/hw/mcb/mcb.c
> @@ -0,0 +1,182 @@
> +/*
> + * QEMU MEN Chameleon Bus emulation
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
> +#include "hw/mcb/mcb.h"
> +#include "hw/irq.h"
> +#include "hw/qdev-properties.h"
> +#include "migration/vmstate.h"
> +
> +ChameleonDeviceDescriptor *mcb_new_chameleon_descriptor(MCBus *bus, uint=
8_t id,
> +                                                        uint8_t rev,
> +                                                        uint8_t var,
> +                                                        uint32_t size)
> +{
> +    BusChild *kid;
> +    ChameleonDeviceDescriptor *gdd;
> +    uint32_t reg1 =3D 0;
> +    uint32_t offset =3D 0x200;
> +    uint32_t end =3D 0;
> +
> +    gdd =3D  g_new0(ChameleonDeviceDescriptor, 1);
> +    if (!gdd) {
> +        return NULL;
> +    }
> +
> +    reg1 |=3D GDD_DEV(id);
> +    reg1 |=3D GDD_DTY(CHAMELEON_DTYPE_GENERAL);
> +    reg1 |=3D GDD_REV(rev);
> +    reg1 |=3D GDD_VAR(var);
> +    gdd->reg1 =3D cpu_to_le32(reg1);
> +
> +    QTAILQ_FOREACH(kid, &BUS(bus)->children, sibling) {
> +        DeviceState *qdev =3D kid->child;
> +        MCBDevice *mdev =3D MCB_DEVICE(qdev);
> +
> +        if (mdev->gdd) {
> +            offset =3D mdev->gdd->offset;
> +            end =3D offset + mdev->gdd->size;
> +        }
> +    }
> +
> +    gdd->offset =3D offset + end;
> +    gdd->size =3D size;
> +
> +    return gdd;
> +}
> +
> +static void mcb_irq_handler(void *opaque, int irq_num, int level)
> +{
> +    MCBDevice *dev =3D opaque;
> +    MCBus *bus =3D MCB_BUS(qdev_get_parent_bus(DEVICE(dev)));
> +
> +    if (bus->set_irq) {
> +        bus->set_irq(dev, irq_num, level);
> +    }
> +}
> +
> +qemu_irq mcb_allocate_irq(MCBDevice *dev)
> +{
> +    int irq =3D 0;
> +    return qemu_allocate_irq(mcb_irq_handler, dev, irq);
> +}
> +
> +MCBDevice *mcb_device_find(MCBus *bus, hwaddr addr)
> +{
> +    BusChild *kid;
> +    uint32_t start;
> +    uint32_t end;
> +
> +    QTAILQ_FOREACH(kid, &BUS(bus)->children, sibling) {
> +        DeviceState *qdev =3D kid->child;
> +        MCBDevice *mdev =3D MCB_DEVICE(qdev);
> +
> +        start =3D mdev->gdd->offset;
> +        end =3D start + mdev->gdd->size;
> +
> +        if (addr >=3D start && addr <=3D end) {
> +            return mdev;
> +        }
> +    }
> +    return NULL;
> +}
> +
> +void mcb_bus_init(MCBus *bus, size_t bus_size,
> +                  DeviceState *parent,
> +                  uint8_t n_slots,
> +                  qemu_irq_handler handler)
> +{
> +    qbus_init(bus, bus_size, TYPE_MCB_BUS, parent, NULL);
> +    bus->n_slots =3D n_slots;
> +    bus->set_irq =3D handler;
> +}
> +
> +static void mcb_device_realize(DeviceState *dev, Error **errp)
> +{
> +    MCBDevice *mdev =3D MCB_DEVICE(dev);
> +    MCBus *bus =3D MCB_BUS(qdev_get_parent_bus(dev));
> +    MCBDeviceClass *k =3D MCB_DEVICE_GET_CLASS(dev);
> +
> +    if (mdev->slot < 0) {
> +        mdev->slot =3D bus->free_slot;
> +    }
> +
> +    if (mdev->slot >=3D bus->n_slots) {
> +        error_setg(errp, "Only %" PRIu8 " slots available.", bus->n_slot=
s);
> +        return;
> +    }
> +    bus->free_slot =3D mdev->slot + 1;
> +
> +    mdev->irq =3D qemu_allocate_irqs(bus->set_irq, mdev, 1);
> +
> +    k->realize(dev, errp);
> +}
> +
> +static void mcb_device_unrealize(DeviceState *dev)
> +{
> +    MCBDevice *mdev =3D MCB_DEVICE(dev);
> +    MCBDeviceClass *k =3D MCB_DEVICE_GET_CLASS(dev);
> +
> +    if (k->unrealize) {
> +        k->unrealize(dev);
> +        return;
> +    }
> +
> +    qemu_free_irqs(mdev->irq, 1);
> +}
> +
> +static Property mcb_device_props[] =3D {
> +    DEFINE_PROP_INT32("slot", MCBDevice, slot, -1),
> +    DEFINE_PROP_END_OF_LIST()
> +};
> +
> +static void mcb_device_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *k =3D DEVICE_CLASS(klass);
> +
> +    set_bit(DEVICE_CATEGORY_INPUT, k->categories);
> +    k->bus_type =3D TYPE_MCB_BUS;
> +    k->realize =3D mcb_device_realize;
> +    k->unrealize =3D mcb_device_unrealize;
> +    device_class_set_props(k, mcb_device_props);
> +}
> +
> +const VMStateDescription vmstate_mcb_device =3D {
> +    .name =3D "mcb_device",
> +    .version_id =3D 1,
> +    .fields =3D (VMStateField[]) {
> +        VMSTATE_INT32(slot, MCBDevice),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static const TypeInfo mcb_device_info =3D {
> +    .name =3D TYPE_MCB_DEVICE,
> +    .parent =3D TYPE_DEVICE,
> +    .instance_size =3D sizeof(MCBDevice),
> +    .class_size =3D sizeof(MCBDeviceClass),
> +    .class_init =3D mcb_device_class_init,
> +    .abstract =3D true,
> +};
> +
> +static const TypeInfo mcb_bus_info =3D {
> +    .name =3D TYPE_MCB_BUS,
> +    .parent =3D TYPE_BUS,
> +    .instance_size =3D sizeof(MCBus),
> +};
> +
> +static void mcb_register_types(void)
> +{
> +    type_register_static(&mcb_device_info);
> +    type_register_static(&mcb_bus_info);
> +}
> +
> +type_init(mcb_register_types);
> diff --git a/hw/mcb/meson.build b/hw/mcb/meson.build
> new file mode 100644
> index 0000000000..a385edc07c
> --- /dev/null
> +++ b/hw/mcb/meson.build
> @@ -0,0 +1 @@
> +softmmu_ss.add(when: 'CONFIG_MCB', if_true: files('mcb.c'))
> diff --git a/hw/meson.build b/hw/meson.build
> index c7ac7d3d75..3d1462ad8b 100644
> --- a/hw/meson.build
> +++ b/hw/meson.build
> @@ -18,6 +18,7 @@ subdir('intc')
>  subdir('ipack')
>  subdir('ipmi')
>  subdir('isa')
> +subdir('mcb')
>  subdir('mem')
>  subdir('misc')
>  subdir('net')
> diff --git a/include/hw/mcb/mcb.h b/include/hw/mcb/mcb.h
> new file mode 100644
> index 0000000000..ff120073e1
> --- /dev/null
> +++ b/include/hw/mcb/mcb.h
> @@ -0,0 +1,106 @@
> +/*
> + * QEMU MEN Chameleon Bus emulation
> + *
> + * Copyright (C) 2023 Johannes Thumshirn <jth@kernel.org>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2.  See
> + * the COPYING file in the top-level directory.
> + */
> +
> +#ifndef QEMU_MCB_H
> +#define QEMU_MCB_H
> +
> +#include "hw/qdev-core.h"
> +#include "qom/object.h"
> +#include "exec/memory.h"
> +
> +#define CHAMELEON_DTYPE_GENERAL  0x0
> +#define CHAMELEON_DTYPE_END 0xf
> +
> +typedef struct {
> +    uint32_t reg1;
> +    uint32_t reg2;
> +    uint32_t offset;
> +    uint32_t size;
> +} ChameleonDeviceDescriptor;
> +
> +#define GDD_DEV(x) (((x) & 0x3ff) << 18)
> +#define GDD_DTY(x) (((x) & 0xf) << 28)
> +#define GDD_REV(x) (((x) & 0x3f) << 5)
> +#define GDD_VAR(x) (((x) & 0x3f) << 11)
> +
> +/* GDD Register 1 fields */
> +#define GDD_IRQ(x) ((x) & 0x1f)
> +
> +/* GDD Register 2 fields */
> +#define GDD_BAR(x) ((x) & 0x7)
> +#define GDD_INS(x) (((x) >> 3) & 0x3f)
> +#define GDD_GRP(x) (((x) >> 9) & 0x3f)
> +
> +typedef struct MCBus MCBus;
> +
> +#define TYPE_MCB_BUS "MEN Chameleon Bus"
> +OBJECT_DECLARE_SIMPLE_TYPE(MCBus, MCB_BUS)
> +
> +struct MCBus {
> +    /*< private >*/
> +    BusState parent_obj;
> +
> +    uint8_t n_slots;
> +    uint8_t free_slot;
> +    qemu_irq_handler set_irq;
> +    MemoryRegion mmio_region;
> +};
> +
> +typedef struct MCBDevice MCBDevice;
> +typedef struct MCBDeviceClass MCBDeviceClass;
> +
> +#define TYPE_MCB_DEVICE "mcb-device"
> +#define MCB_DEVICE(obj) \
> +    OBJECT_CHECK(MCBDevice, (obj), TYPE_MCB_DEVICE)
> +#define MCB_DEVICE_CLASS(klass) \
> +    OBJECT_CLASS_CHECK(MCBDeviceClass, (klass), TYPE_MCB_DEVICE)
> +#define MCB_DEVICE_GET_CLASS(obj) \
> +     OBJECT_GET_CLASS(MCBDeviceClass, (obj), TYPE_MCB_DEVICE)
> +
> +struct MCBDeviceClass {
> +    /*< private >*/
> +    DeviceClass parent_class;
> +    /*< public >*/
> +
> +
> +    DeviceRealize realize;
> +    DeviceUnrealize unrealize;
> +};
> +
> +struct MCBDevice {
> +    /*< private >*/
> +    DeviceState parent_obj;
> +    /*< public >*/
> +
> +    qemu_irq *irq;
> +    ChameleonDeviceDescriptor *gdd;
> +    int slot;
> +
> +    uint8_t rev;
> +    uint8_t var;
> +};
> +
> +extern const VMStateDescription vmstate_mcb_device;
> +
> +ChameleonDeviceDescriptor *mcb_new_chameleon_descriptor(MCBus *bus, uint=
8_t id,
> +                                                        uint8_t rev,
> +                                                        uint8_t var,
> +                                                        uint32_t size);
> +
> +#define VMSTATE_MCB_DEVICE(_field, _state)      \
> +    VMSTATE_STRUCT(_field, _state, 1, vmstate_mcb_device, MCBDevice)
> +
> +MCBDevice *mcb_device_find(MCBus *bus, hwaddr addr);
> +void mcb_bus_init(MCBus *bus, size_t bus_size,
> +                  DeviceState *parent,
> +                  uint8_t n_slots,
> +                  qemu_irq_handler handler);
> +
> +qemu_irq mcb_allocate_irq(MCBDevice *dev);
> +#endif
> --
> 2.39.2
>
>

