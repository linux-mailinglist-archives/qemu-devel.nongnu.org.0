Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D266E3DE7
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Apr 2023 05:16:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poFKE-0006NN-TB; Sun, 16 Apr 2023 23:14:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1poFKD-0006NF-3i
 for qemu-devel@nongnu.org; Sun, 16 Apr 2023 23:14:41 -0400
Received: from mail-vs1-xe2e.google.com ([2607:f8b0:4864:20::e2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1poFKA-00016D-Bn
 for qemu-devel@nongnu.org; Sun, 16 Apr 2023 23:14:40 -0400
Received: by mail-vs1-xe2e.google.com with SMTP id e19so7178702vsa.12
 for <qemu-devel@nongnu.org>; Sun, 16 Apr 2023 20:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681701277; x=1684293277;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dpXRGKjUneCocQQbF0x9Zs5sfHky0q8lR79DDBWU0wY=;
 b=NdSCMRE9pIIYTgvZwsEIoDC0TdCyFtDBWuiuFpYkpPNYe2EfaDH9b0km4vpFMhVoRV
 8FEPa0eb9qz1YFUyd+4vKF1hi45jmONZ5eFiVV3PJ2sfKtDWli54fqqKPROcjYnLCnEa
 ZRku/YcI1ifo+tWCcegYAMQJ3ZgCaKuIo7o+m4uX45HVoFOC5UnOH/Tl4aAgGKcSyYTf
 KCCfFENniFumZQI8eN2XjK0iWG3bRmDe0dZGoDg1K4S9S3c1o8I+1fbj74Z9F0njshrc
 Mw1ynJS26toTEbhtJS6cYiVHd/zwzt4vfXQEE0GcDbNNRgu34RyBCrza8cpY/nSlCndg
 7zcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681701277; x=1684293277;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dpXRGKjUneCocQQbF0x9Zs5sfHky0q8lR79DDBWU0wY=;
 b=UQ3K9BvBTillC8KxMcgCeBIR0Xb3PGCg3fn7GgMIxQueTrVyrL3WDQNZcv9cl+Xbwa
 Vy3+W1O8E4IVZPuSPe+TajKVztJ+s4jZcZLCtd1OB3s4IiZbtCwZsKCfeIxDV6Gw/0m+
 Z8mbzseXTxYh+l0myyCRpPyK8loRi++EuHIFRqyeo1vxY/VX5Cxt1ICpg0oiqNogm7cx
 TTRD+RVdrg5wXf6YZSSrjH6PtyyB5HQMSZuoPjm3rEq3f8atnmpfy9ZAxoRCrDl33l6F
 mhqDrxkoZjelAwFC92bvxIfc3UFUv0cy9JSf0u0+8tdBMPW4ETQJ90TW87hD+cyeahdb
 Hpdw==
X-Gm-Message-State: AAQBX9fjNw3mrZghb0ugazWUjIe9E+mp0gSAgegKu4udU9gZAdMvoKC/
 AxYbod/LQ+16MtU9OPO/JsePoxQlTn7ni6c3iX8=
X-Google-Smtp-Source: AKy350YJV/DIjn4LH4ZdPcIU4vvySk5Si9ox53tGTHtbtH9UI51qtk+Od0qSvWtD20s2deMYKUu2PLrqyielo2P5wwA=
X-Received: by 2002:a67:d795:0:b0:42e:547a:94d5 with SMTP id
 q21-20020a67d795000000b0042e547a94d5mr3406410vsj.3.1681701277033; Sun, 16 Apr
 2023 20:14:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230410174910.4806-1-jth@kernel.org>
 <20230410174910.4806-3-jth@kernel.org>
In-Reply-To: <20230410174910.4806-3-jth@kernel.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 17 Apr 2023 13:14:10 +1000
Message-ID: <CAKmqyKOoHLF7gxfJ7gE1wRhbS1GcxDBKGEBeiheyVz49QPvs9w@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] Add MEN Chameleon Bus via PCI carrier
To: Johannes Thumshirn <jth@kernel.org>
Cc: qemu-devel@nongnu.org, Alistair Francis <alistair@alistair23.me>, 
 Javier Rodriguez <josejavier.rodriguez@duagon.com>, 
 =?UTF-8?Q?Jorge_Sanjuan_Garc=C3=ADa?= <Jorge.SanjuanGarcia@duagon.com>, 
 Peter Maydell <peter.maydell@linaro.org>,
 Dmitry Fomichev <dmitry.fomichev@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2e;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue, Apr 11, 2023 at 3:51=E2=80=AFAM Johannes Thumshirn <jth@kernel.org>=
 wrote:
>
> Add PCI based MEN Chameleon Bus carrier emulation.
>
> Signed-off-by: Johannes Thumshirn <jth@kernel.org>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/mcb/Kconfig      |   6 +
>  hw/mcb/mcb-pci.c    | 297 ++++++++++++++++++++++++++++++++++++++++++++
>  hw/mcb/meson.build  |   1 +
>  hw/mcb/trace-events |   3 +
>  hw/mcb/trace.h      |   1 +
>  meson.build         |   1 +
>  6 files changed, 309 insertions(+)
>  create mode 100644 hw/mcb/mcb-pci.c
>  create mode 100644 hw/mcb/trace-events
>  create mode 100644 hw/mcb/trace.h
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
> index 0000000000..516f133c2e
> --- /dev/null
> +++ b/hw/mcb/mcb-pci.c
> @@ -0,0 +1,297 @@
> +/*
> + * QEMU MEN Chameleon Bus emulation
> + *
> + * Copyright (C) 2023 Johannes Thumshirn <jth@kernel.org>
> + *
> + * This code is licensed under the GPL version 2 or later. See the
> + * COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qapi/error.h"
> +#include "hw/mcb/mcb.h"
> +#include "hw/pci/pci.h"
> +#include "hw/pci/pci_device.h"
> +#include "hw/qdev-properties.h"
> +#include "migration/vmstate.h"
> +#include "trace.h"
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
> +
> +    trace_mpci_chamtbl_read(addr, size);
> +
> +    if (addr < sizeof(ChameleonFPGAHeader)) {
> +        return le32_to_cpu(read_header(s, addr));
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
> +                return ~0U;
> +            }
> +        }
> +        qdev =3D kid->child;
> +        mdev =3D MCB_DEVICE(qdev);
> +        offset -=3D slot * 16;
> +
> +        return le32_to_cpu(read_gdd(mdev, offset / 4));
> +    }
> +
> +    return 0;
> +}
> +
> +static void mpci_chamtbl_write(void *opaque, hwaddr addr, uint64_t val,
> +                               unsigned size)
> +{
> +
> +    if (addr < CHAMELEON_TABLE_SIZE) {
> +        trace_mpci_chamtbl_write(addr, val);
> +    }
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
> +    mcb_bus_init(bus, sizeof(MCBus), DEVICE(pci_dev), N_MODULES,
> +                 mcb_pci_set_irq);
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
> diff --git a/hw/mcb/trace-events b/hw/mcb/trace-events
> new file mode 100644
> index 0000000000..e1adf9c8e3
> --- /dev/null
> +++ b/hw/mcb/trace-events
> @@ -0,0 +1,3 @@
> +# mcb-pci.c
> +mpci_chamtbl_read(unsigned long addr, unsigned int size) "read from addr=
ess 0x%lx size %d"
> +mpci_chamtbl_write(unsigned long addr, uint64_t val) "invalid write to 0=
x%lx: 0x%" PRIx64
> diff --git a/hw/mcb/trace.h b/hw/mcb/trace.h
> new file mode 100644
> index 0000000000..35653b3381
> --- /dev/null
> +++ b/hw/mcb/trace.h
> @@ -0,0 +1 @@
> +#include "trace/trace-hw_mcb.h"
> diff --git a/meson.build b/meson.build
> index 29f8644d6d..ff8305440b 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -2986,6 +2986,7 @@ if have_system
>      'hw/input',
>      'hw/intc',
>      'hw/isa',
> +    'hw/mcb',
>      'hw/mem',
>      'hw/mips',
>      'hw/misc',
> --
> 2.39.2
>
>

