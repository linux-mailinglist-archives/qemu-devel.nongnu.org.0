Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4896D7463
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 08:31:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjweR-0000Rj-Sh; Wed, 05 Apr 2023 02:29:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pjweE-0000RF-5h
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 02:29:34 -0400
Received: from mail-ua1-x935.google.com ([2607:f8b0:4864:20::935])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pjweB-0007Gm-MN
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 02:29:33 -0400
Received: by mail-ua1-x935.google.com with SMTP id b4so377288uaw.9
 for <qemu-devel@nongnu.org>; Tue, 04 Apr 2023 23:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680676170;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6zNIu/f+RRwFVe+pzIy9f/UZWJpGWLUZGwNm2Zm9/Tc=;
 b=NN3nrdxyY5h1kebkIPSWPq0Git54oQXJpFDtKlzGZmQvzB5XR0J4jSqw+HYdlH7Tpb
 /uSaO/Z0HkCrTFLyfraIBSMB6ADqwo6t6/teQP+iVzIC+pRO4jazIG4xuoZ8U6IAC6ro
 KOU5pUlVAyUYVLKnkqWCkgp9JlVaScoisbGvEQORGnuLLJMXQoeummZEv7vuyGgD/hT7
 +wvS0zX74TToOfora8bai3aBY/maDt6poe7vebi0L0vE7TGyMQmRr6AQv+mT0124R3Rm
 EZRiW8qGMFkk+TZHMYIvrhUm8jnshZRjX+jpWQj7deb6yVWtbr3p6MWT2yHaR3pQ/Fra
 7MFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680676170;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6zNIu/f+RRwFVe+pzIy9f/UZWJpGWLUZGwNm2Zm9/Tc=;
 b=oYNwXkvEuxcziQJCm0IV8K/Kw84WoVaSqx718TvqeMKrjZy0plyc5nz9g7xTyEV5Sf
 b2GDB3FTo/v9YT9UT2jpG9p3qFtJ7kBdK4bxt5zPuP0bl1oEUPP0mxub+WYhAG3YmN9D
 q9YxrR6jrP6NxV+2TDndz2OdOGGlzE2+s/G9RJa7aDyNEzS3ms5J5h253kFqHNSGLbBF
 QJxMgm9idjfPZhDk59Z2cgoAadw6PXWWApBpO+cFNRKvg2ychGvu7VU2vJUfaCAUXI39
 4b+O/GdquAZyomke/eOBvsyLVzaJebSxGhwD8JgI8Y27nRjPyOa1t/buQNEZEW3vghfd
 8PYA==
X-Gm-Message-State: AAQBX9ffGrP5xOxPJ4en3Bh5dCgJs8gcF8uDWzVkirJNqPpn/jo/zeDE
 tQUnBolgo2YwaIazN7FhJERXL1cnFPvJI/ri4Eo=
X-Google-Smtp-Source: AKy350ahp/ilfxbDeA7lWCBHQLd4442ZFv0P622K1KzLfQHRIR5UuI5xc76SVs/xi+yUYtZjEUuBx0wcs+XKVCUJbzo=
X-Received: by 2002:a9f:37cd:0:b0:764:64c1:9142 with SMTP id
 q71-20020a9f37cd000000b0076464c19142mr1579993uaq.0.1680676170430; Tue, 04 Apr
 2023 23:29:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230329084513.7835-1-jth@kernel.org>
 <20230329084513.7835-3-jth@kernel.org>
In-Reply-To: <20230329084513.7835-3-jth@kernel.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 5 Apr 2023 16:29:04 +1000
Message-ID: <CAKmqyKNwTUWM20z9Lb-Ww+M0cxPwVoyeYJ5=KPCZMkOgRMJAKA@mail.gmail.com>
Subject: Re: [PATCH 2/4] Add MEN Chameleon Bus via PCI carrier
To: Johannes Thumshirn <jth@kernel.org>
Cc: qemu-devel@nongnu.org, Alistair Francis <alistair@alistair23.me>, 
 Javier Rodriguez <josejavier.rodriguez@duagon.com>,
 Dmitry Fomichev <dmitry.fomichev@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::935;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x935.google.com
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
> Add PCI based MEN Chameleon Bus carrier emulation.
>
> Signed-off-by: Johannes Thumshirn <jth@kernel.org>
> ---
>  hw/mcb/Kconfig     |   6 +
>  hw/mcb/mcb-pci.c   | 307 +++++++++++++++++++++++++++++++++++++++++++++
>  hw/mcb/meson.build |   1 +
>  3 files changed, 314 insertions(+)
>  create mode 100644 hw/mcb/mcb-pci.c
>
> diff --git a/hw/mcb/Kconfig b/hw/mcb/Kconfig
> index 36a7a583a8..7deb96c2fe 100644
> --- a/hw/mcb/Kconfig
> +++ b/hw/mcb/Kconfig
> @@ -1,2 +1,8 @@
>  config MCB
>      bool
> +
> +config MCB_PCI
> +    bool
> +    default y if PCI_DEVICES
> +    depends on PCI
> +    select MCB
> diff --git a/hw/mcb/mcb-pci.c b/hw/mcb/mcb-pci.c
> new file mode 100644
> index 0000000000..442e65e24c
> --- /dev/null
> +++ b/hw/mcb/mcb-pci.c
> @@ -0,0 +1,307 @@
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
> +#include "hw/mcb/mcb.h"
> +#include "hw/pci/pci.h"
> +#include "hw/pci/pci_device.h"
> +#include "hw/qdev-properties.h"
> +#include "migration/vmstate.h"
> +
> +/* #define DEBUG_MPCI 1 */
> +
> +#ifdef DEBUG_MPCI
> +#define DPRINTF(fmt, ...)                                               =
\
> +    do { fprintf(stderr, "mcb-pci: " fmt, ## __VA_ARGS__); } while (0)
> +#else
> +#define DPRINTF(fmt, ...) do { } while (0)
> +#endif

We don't use these #ifdefs for debug prints anymore in QEMU (at least
not in new code). It should be converted to the tracing architecture.
See https://qemu-project.gitlab.io/qemu/devel/tracing.html for user
documentation.

> +
> +typedef struct {
> +    uint8_t revision;
> +    char model;
> +    uint8_t minor;
> +    uint8_t bus_type;
> +    uint16_t magic;
> +    uint16_t reserved;
> +    /* This one has no '\0' at the end!!! */
> +    char filename[12];
> +} ChameleonFPGAHeader;
> +#define CHAMELEON_BUS_TYPE_WISHBONE 0
> +#define CHAMELEONV2_MAGIC 0xabce
> +
> +typedef struct {
> +    PCIDevice dev;
> +    MCBus bus;
> +    MemoryRegion ctbl;
> +    uint16_t status;
> +    uint8_t int_set;
> +    ChameleonFPGAHeader *header;
> +
> +    uint8_t minor;
> +    uint8_t rev;
> +    uint8_t model;
> +} MPCIState;
> +
> +#define TYPE_MCB_PCI "mcb-pci"
> +
> +#define MPCI(obj)                                       \
> +    OBJECT_CHECK(MPCIState, (obj), TYPE_MCB_PCI)
> +
> +#define CHAMELEON_TABLE_SIZE 0x200
> +#define N_MODULES 32
> +
> +#define PCI_VENDOR_ID_MEN 0x1a88
> +#define PCI_DEVICE_ID_MEN_MCBPCI 0x4d45
> +
> +static uint32_t read_header(MPCIState *s, hwaddr addr)
> +{
> +    uint32_t ret =3D 0;
> +    ChameleonFPGAHeader *header =3D s->header;
> +
> +    switch (addr >> 2) {
> +    case 0:
> +        ret |=3D header->revision;
> +        ret |=3D header->model << 8;
> +        ret |=3D header->minor << 16;
> +        ret |=3D header->bus_type << 24;
> +        break;
> +    case 1:
> +        ret |=3D header->magic;
> +        ret |=3D header->reserved << 16;
> +        break;
> +    case 2:
> +        memcpy(&ret, header->filename, sizeof(uint32_t));
> +        break;
> +    case 3:
> +        memcpy(&ret, header->filename + sizeof(uint32_t),
> +               sizeof(uint32_t));
> +        break;
> +    case 4:
> +        memcpy(&ret, header->filename + 2 * sizeof(uint32_t),
> +               sizeof(uint32_t));
> +    }
> +
> +    return ret;
> +}
> +
> +static uint32_t read_gdd(MCBDevice *mdev, int reg)
> +{
> +    ChameleonDeviceDescriptor *gdd;
> +    uint32_t ret =3D 0;
> +
> +    gdd =3D mdev->gdd;
> +
> +    switch (reg) {
> +    case 0:
> +        ret =3D gdd->reg1;
> +        break;
> +    case 1:
> +        ret =3D gdd->reg2;
> +        break;
> +    case 2:
> +        ret =3D gdd->offset;
> +        break;
> +    case 3:
> +        ret =3D gdd->size;
> +        break;
> +    }
> +
> +    return ret;
> +}
> +
> +static uint64_t mpci_chamtbl_read(void *opaque, hwaddr addr, unsigned si=
ze)
> +{
> +    MPCIState *s =3D opaque;
> +    MCBus *bus =3D &s->bus;
> +    MCBDevice *mdev;
> +    uint32_t ret =3D 0;
> +
> +    DPRINTF("Read from address 0x%lx size %d\n", addr, size);
> +
> +    if (addr < sizeof(ChameleonFPGAHeader)) {
> +        return le32_to_cpu(read_header(s, addr));

I always thought you don't need the le32_to_cpu() as the
DEVICE_LITTLE_ENDIAN should handle this.

I do see other PCI devices with it though, so maybe it's a PCI thing

> +    } else if (addr >=3D sizeof(ChameleonFPGAHeader) &&
> +               addr < CHAMELEON_TABLE_SIZE) {
> +        /* Handle read on chameleon table */
> +        BusChild *kid;
> +        DeviceState *qdev;
> +        int slot;
> +        int offset;
> +        int i;
> +
> +        offset =3D addr - sizeof(ChameleonFPGAHeader);
> +        slot =3D offset / sizeof(ChameleonDeviceDescriptor);
> +
> +        kid =3D QTAILQ_FIRST(&BUS(bus)->children);
> +        for (i =3D 0; i < slot; i++) {
> +            kid =3D QTAILQ_NEXT(kid, sibling);
> +            if (!kid) { /* Last element */
> +                DPRINTF("Last element: 0x%08x\n", ~0U);
> +                return ~0U;
> +            }
> +        }
> +        qdev =3D kid->child;
> +        mdev =3D MCB_DEVICE(qdev);
> +        offset -=3D slot * 16;
> +
> +        ret =3D read_gdd(mdev, offset / 4);
> +        return le32_to_cpu(ret);
> +    }
> +
> +    return ret;

ret isn't used here

> +}
> +
> +static void mpci_chamtbl_write(void *opaque, hwaddr addr, uint64_t val,
> +                               unsigned size)
> +{
> +
> +    if (addr < CHAMELEON_TABLE_SIZE)
> +        DPRINTF("Invalid write to 0x%x: 0x%x\n", (unsigned) addr,
> +                (unsigned) val);

This isn't Linux, brackets are required :)

You can run checkpatch to catch these types of style issues.

Alistair

> +
> +    return;
> +}
> +
> +static const MemoryRegionOps mpci_chamtbl_ops =3D {
> +    .read =3D mpci_chamtbl_read,
> +    .write =3D mpci_chamtbl_write,
> +    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .valid =3D {
> +        .min_access_size =3D 4,
> +        .max_access_size =3D 4
> +    },
> +    .impl =3D {
> +        .min_access_size =3D 4,
> +        .max_access_size =3D 4
> +    },
> +};
> +
> +static void mcb_pci_set_irq(void *opaque, int intno, int level)
> +{
> +    MCBDevice *mdev =3D opaque;
> +    MCBus *bus =3D MCB_BUS(qdev_get_parent_bus(DEVICE(mdev)));
> +    PCIDevice *pcidev =3D PCI_DEVICE(BUS(bus)->parent);
> +    MPCIState *dev =3D MPCI(pcidev);
> +
> +    if (level) {
> +        pci_set_irq(&dev->dev, !dev->int_set);
> +        pci_set_irq(&dev->dev,  dev->int_set);
> +    } else {
> +        uint16_t level_status =3D dev->status;
> +
> +        if (level_status && !dev->int_set) {
> +            pci_irq_assert(&dev->dev);
> +            dev->int_set =3D 1;
> +        } else if (!level_status && dev->int_set) {
> +            pci_irq_deassert(&dev->dev);
> +            dev->int_set =3D 0;
> +        }
> +    }
> +}
> +
> +static void mcb_pci_write_config(PCIDevice *pci_dev, uint32_t address,
> +                                 uint32_t val, int len)
> +{
> +    pci_default_write_config(pci_dev, address, val, len);
> +}
> +
> +static void mcb_pci_realize(PCIDevice *pci_dev, Error **errp)
> +{
> +    MPCIState *s =3D MPCI(pci_dev);
> +    uint8_t *pci_conf =3D s->dev.config;
> +    ChameleonFPGAHeader *header;
> +    MCBus *bus =3D &s->bus;
> +
> +    header =3D g_new0(ChameleonFPGAHeader, 1);
> +
> +    s->header =3D header;
> +
> +    header->revision =3D s->rev;
> +    header->model =3D (char) s->model;
> +    header->minor =3D s->minor;
> +    header->bus_type =3D CHAMELEON_BUS_TYPE_WISHBONE;
> +    header->magic =3D CHAMELEONV2_MAGIC;
> +    memcpy(&header->filename, "QEMU MCB PCI", 12);
> +
> +    pci_dev->config_write =3D mcb_pci_write_config;
> +    pci_set_byte(pci_conf + PCI_INTERRUPT_PIN, 0x01); /* Interrupt pin A=
 */
> +    pci_conf[PCI_COMMAND] =3D PCI_COMMAND_MEMORY;
> +
> +    mcb_bus_init(bus, sizeof(MCBus), DEVICE(pci_dev), N_MODULES, mcb_pci=
_set_irq);
> +
> +    memory_region_init(&bus->mmio_region, OBJECT(s), "mcb-pci.mmio",
> +                       2048 * 1024);
> +    memory_region_init_io(&s->ctbl, OBJECT(s), &mpci_chamtbl_ops,
> +                          s, "mpci_chamtbl_ops", CHAMELEON_TABLE_SIZE);
> +    memory_region_add_subregion(&bus->mmio_region, 0, &s->ctbl);
> +    pci_register_bar(&s->dev, 0, PCI_BASE_ADDRESS_SPACE_MEMORY,
> +                     &bus->mmio_region);
> +
> +}
> +
> +static void mcb_pci_unrealize(PCIDevice *pci_dev)
> +{
> +    MPCIState *s =3D MPCI(pci_dev);
> +
> +    g_free(s->header);
> +    s->header =3D NULL;
> +}
> +
> +static const VMStateDescription vmstate_mcb_pci =3D {
> +    .name =3D "mcb-pci",
> +    .version_id =3D 1,
> +    .minimum_version_id =3D 1,
> +    .fields =3D (VMStateField[]) {
> +        VMSTATE_PCI_DEVICE(dev, MPCIState),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static Property mcb_pci_props[] =3D {
> +    DEFINE_PROP_UINT8("revision", MPCIState, rev, 1),
> +    DEFINE_PROP_UINT8("minor", MPCIState, minor, 0),
> +    DEFINE_PROP_UINT8("model", MPCIState, model, 0x41),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void mcb_pci_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc =3D DEVICE_CLASS(klass);
> +    PCIDeviceClass *k =3D PCI_DEVICE_CLASS(klass);
> +
> +    k->realize =3D mcb_pci_realize;
> +    k->exit =3D mcb_pci_unrealize;
> +    k->vendor_id =3D PCI_VENDOR_ID_MEN;
> +    k->device_id =3D PCI_DEVICE_ID_MEN_MCBPCI;
> +    k->class_id =3D PCI_CLASS_BRIDGE_OTHER;
> +
> +    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
> +    dc->desc =3D "MEN Chameleon Bus over PCI";
> +    dc->vmsd =3D &vmstate_mcb_pci;
> +    device_class_set_props(dc, mcb_pci_props);
> +}
> +
> +static const TypeInfo mcb_pci_info =3D {
> +    .name =3D TYPE_MCB_PCI,
> +    .parent =3D TYPE_PCI_DEVICE,
> +    .instance_size =3D sizeof(MPCIState),
> +    .class_init =3D mcb_pci_class_init,
> +    .interfaces =3D (InterfaceInfo[]) {
> +        { INTERFACE_PCIE_DEVICE },
> +        { }
> +    },
> +};
> +
> +static void mcb_pci_register_types(void)
> +{
> +    type_register(&mcb_pci_info);
> +}
> +type_init(mcb_pci_register_types);
> diff --git a/hw/mcb/meson.build b/hw/mcb/meson.build
> index a385edc07c..4e1a0f0cdb 100644
> --- a/hw/mcb/meson.build
> +++ b/hw/mcb/meson.build
> @@ -1 +1,2 @@
>  softmmu_ss.add(when: 'CONFIG_MCB', if_true: files('mcb.c'))
> +softmmu_ss.add(when: 'CONFIG_MCB_PCI', if_true: files('mcb-pci.c'))
> --
> 2.39.2
>
>

