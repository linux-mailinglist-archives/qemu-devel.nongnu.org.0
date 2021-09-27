Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 418834190D3
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 10:28:47 +0200 (CEST)
Received: from localhost ([::1]:34146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUm0E-0001cZ-AP
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 04:28:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mUlz4-0000pV-3A
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 04:27:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35348)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mUlz1-0000P6-Cc
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 04:27:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632731250;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YWTgnTAqBDmFDG0YVbI4sCXsb0lzUTcZwUzocx3a3jQ=;
 b=gIojAFjKHTTp6PNtrwVcAMQUYhDkVNSoKTxL4mAyxP15j6kGwzki2mViAfJLjokdtDOiLS
 FnGeRGgAGrTYuGwo6InigdvJ6a5DoTNcc7MHPbYNWiun67ym8q8So/F8mLddg3DL2BQ6O3
 yz32un613r8m3dUtol7751Q6EcXERJc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-153-QWQU6AZxP_mCutD6Vj3JOw-1; Mon, 27 Sep 2021 04:27:26 -0400
X-MC-Unique: QWQU6AZxP_mCutD6Vj3JOw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6158D1030C21;
 Mon, 27 Sep 2021 08:27:24 +0000 (UTC)
Received: from localhost (unknown [10.39.192.180])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B9E8460936;
 Mon, 27 Sep 2021 08:27:07 +0000 (UTC)
Date: Mon, 27 Sep 2021 10:27:06 +0200
From: Stefan Hajnoczi <stefanha@redhat.com>
To: David Dai <david.dai@montage-tech.com>
Subject: Re: [PATCH] hw/misc: Add a virtual pci device to dynamically attach
 memory to QEMU
Message-ID: <YVGAWh7e96f8yed0@stefanha-x1.localdomain>
References: <20210926021614.76933-1-david.dai@montage-tech.com>
MIME-Version: 1.0
In-Reply-To: <20210926021614.76933-1-david.dai@montage-tech.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="jEtqSYKNtQwQ9cAJ"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: peter.maydell@linaro.org, vsementsov@virtuozzo.com,
 David Hildenbrand <david@redhat.com>, eajames@linux.ibm.com,
 qemu-devel@nongnu.org, changguo.du@montage-tech.com,
 Igor Mammedov <imammedo@redhat.com>, kuhn.chenqun@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--jEtqSYKNtQwQ9cAJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 26, 2021 at 10:16:14AM +0800, David Dai wrote:
> Add a virtual pci to QEMU, the pci device is used to dynamically attach m=
emory
> to VM, so driver in guest can apply host memory in fly without virtualiza=
tion
> management software's help, such as libvirt/manager. The attached memory =
is
> isolated from System RAM, it can be used in heterogeneous memory manageme=
nt for
> virtualization. Multiple VMs dynamically share same computing device memo=
ry
> without memory overcommit.
>=20
> Signed-off-by: David Dai <david.dai@montage-tech.com>

CCing David Hildenbrand (virtio-balloon and virtio-mem) and Igor
Mammedov (host memory backend).

> ---
>  docs/devel/dynamic_mdev.rst | 122 ++++++++++
>  hw/misc/Kconfig             |   5 +
>  hw/misc/dynamic_mdev.c      | 456 ++++++++++++++++++++++++++++++++++++
>  hw/misc/meson.build         |   1 +
>  4 files changed, 584 insertions(+)
>  create mode 100644 docs/devel/dynamic_mdev.rst
>  create mode 100644 hw/misc/dynamic_mdev.c
>=20
> diff --git a/docs/devel/dynamic_mdev.rst b/docs/devel/dynamic_mdev.rst
> new file mode 100644
> index 0000000000..8e2edb6600
> --- /dev/null
> +++ b/docs/devel/dynamic_mdev.rst
> @@ -0,0 +1,122 @@
> +Motivation:
> +In heterogeneous computing system, accelorator generally exposes its dev=
ice

s/accelorator/accelerator/

(There are missing articles and small grammar tweaks that could be made,
but I'm skipping the English language stuff for now.)

> +memory to host via PCIe and CXL.mem(Compute Express Link) to share memor=
y
> +between host and device, and these memory generally are uniformly manage=
d by
> +host, they are called HDM (host managed device memory), further SVA (sha=
re
> +virtual address) can be achieved on this base. One computing device may =
be used

Is this Shared Virtual Addressing (SVA) (also known as Shared Virtual
Memory)? If yes, please use the exact name ("Shared Virtual Addressing",
not "share virtual address") so that's clear and the reader can easily
find out more information through a web search.

> +by multiple virtual machines if it supports SRIOV, to efficiently use de=
vice
> +memory in virtualization, each VM allocates device memory on-demand with=
out
> +overcommit, but how to dynamically attach host memory resource to VM. A =
virtual

I cannot parse this sentence. Can you rephrase it and/or split it into
multiple sentences?

> +PCI device, dynamic_mdev, is introduced to achieve this target. dynamic_=
mdev

I suggest calling it "memdev" instead of "mdev" to prevent confusion
with VFIO mdev.

> +has a big bar space which size can be assigned by user when creating VM,=
 the
> +bar doesn't have backend memory at initialization stage, later driver in=
 guest
> +triggers QEMU to map host memory to the bar space. how much memory, when=
 and
> +where memory will be mapped to are determined by guest driver, after dev=
ice
> +memory has been attached to the virtual PCI bar, application in guest ca=
n
> +access device memory by the virtual PCI bar. Memory allocation and negot=
iation
> +are left to guest driver and memory backend implementation. dynamic_mdev=
 is a
> +mechanism which provides significant benefits to heterogeneous memory
> +virtualization.

David and Igor: please review this design. I'm not familiar enough with
the various memory hotplug and ballooning mechanisms to give feedback on
this.

> +Implementation:
> +dynamic_mdev device has two bars, bar0 and bar2. bar0 is a 32-bit regist=
er bar
> +which used to host control register for control and message communicatio=
n, Bar2
> +is a 64-bit mmio bar, which is used to attach host memory to, the bar si=
ze can
> +be assigned via parameter when creating VM. Host memory is attached to t=
his bar
> +via mmap API.
> +
> +
> +          VM1                           VM2
> + -----------------------        ----------------------
> +|      application      |      |     application      |
> +|                       |      |                      |
> +|-----------------------|      |----------------------|
> +|     guest driver      |      |     guest driver     |
> +|   |--------------|    |      |   | -------------|   |
> +|   | pci mem bar  |    |      |   | pci mem bar  |   |
> + ---|--------------|-----       ---|--------------|---
> +     ----   ---                     --   ------
> +    |    | |   |                   |  | |      |
> +     ----   ---                     --   ------
> +            \                      /
> +             \                    /
> +              \                  /
> +               \                /
> +                |              |
> +                V              V
> + --------------- /dev/mdev.mmap ------------------------
> +|     --   --   --   --   --   --                       |
> +|    |  | |  | |  | |  | |  | |  |  <-----free_mem_list |
> +|     --   --   --   --   --   --                       |
> +|                                                       |
> +|                       HDM(host managed device memory )|
> + -------------------------------------------------------
> +
> +1. Create device:
> +-device dyanmic-mdevice,size=3D0x200000000,align=3D0x40000000,mem-path=
=3D/dev/mdev
> +
> +size: bar space size
> +aglin: alignment of dynamical attached memory
> +mem-path: host backend memory device
> +
> +
> +2. Registers to control dynamical memory attach
> +All register is placed in bar0
> +
> +        INT_MASK     =3D     0, /* RW */
> +        INT_STATUS   =3D     4, /* RW: write 1 clear */
> +        DOOR_BELL    =3D     8, /*
> +                               * RW: trigger device to act
> +                               *  31        15        0
> +                               *  --------------------
> +                               * |en|xxxxxxxx|  cmd   |
> +                               *  --------------------
> +                               */
> +
> +        /* RO: 4k, 2M, 1G aglign for memory size */
> +        MEM_ALIGN   =3D      12,
> +
> +        /* RO: offset in memory bar shows bar space has had ram map */
> +        HW_OFFSET    =3D     16,
> +
> +        /* RW: size of dynamical attached memory */
> +        MEM_SIZE     =3D     24,
> +
> +        /* RW: offset in host mdev, which dynamical attached memory from=
  */
> +        MEM_OFFSET   =3D     32,
> +
> +3. To trigger QEMU to attach a memory, guest driver makes following oper=
ation:
> +
> +        /* memory size */
> +        writeq(size, reg_base + 0x18);
> +
> +        /* backend file offset */
> +        writeq(offset, reg_base + 0x20);
> +
> +        /* trigger device to map memory from host */
> +        writel(0x80000001, reg_base + 0x8);
> +
> +        /* wait for reply from backend */
> +        wait_for_completion(&attach_cmp);
> +
> +4. QEMU implementation
> +dynamic_mdev utilizes QEMU's memory model to dynamically add memory regi=
on to
> +memory container, the model is described at qemu/docs/devel/memory.rst
> +The below steps will describe the whole flow:
> +   1> create a virtual PCI device
> +   2> pci register bar with memory region container, which only define b=
ar size
> +   3> guest driver requests memory via register interaction, and it tell=
s QEMU
> +      about memory size, backend memory offset, and so on
> +   4> QEMU receives request from guest driver, then apply host memory fr=
om
> +      backend file via mmap(), QEMU use the allocated RAM to create a me=
mory
> +      region through memory_region_init_ram(), and attach this memory re=
gion to
> +      bar container through calling memory_region_add_subregion_overlap(=
). After
> +      that KVM build gap->hpa mapping
> +   5> QEMU sends MSI to guest driver that dynamical memory attach comple=
ted
> +You could refer to source code for more detail.
> +
> +
> +Backend memory device
> +Backend device can be a stardard share memory file with standard mmap() =
support
> +It also may be a specific char device with mmap() implementation.
> +In a word, how to implement this device is user responsibility.
> diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
> index 507058d8bf..f03263cc1e 100644
> --- a/hw/misc/Kconfig
> +++ b/hw/misc/Kconfig
> @@ -67,6 +67,11 @@ config IVSHMEM_DEVICE
>      default y if PCI_DEVICES
>      depends on PCI && LINUX && IVSHMEM && MSI_NONBROKEN
>=20
> +config DYNAMIC_MDEV
> +    bool
> +    default y if PCI_DEVICES
> +    depends on PCI && LINUX && MSI_NONBROKEN
> +
>  config ECCMEMCTL
>      bool
>      select ECC
> diff --git a/hw/misc/dynamic_mdev.c b/hw/misc/dynamic_mdev.c
> new file mode 100644
> index 0000000000..8a56a6157b
> --- /dev/null
> +++ b/hw/misc/dynamic_mdev.c
> @@ -0,0 +1,456 @@
> +/*
> + * Dynamical memory attached PCI device
> + *
> + * Copyright Montage, Corp. 2014
> + *
> + * Authors:
> + *  David Dai <david.dai@montage-tech.com>
> + *  Changguo Du <changguo.du@montage-tech.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
> + * See the COPYING file in the top-level directory.
> + *
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/units.h"
> +#include "hw/pci/pci.h"
> +#include "hw/hw.h"
> +#include "hw/qdev-properties.h"
> +#include "hw/qdev-properties-system.h"
> +#include "hw/pci/msi.h"
> +#include "qemu/module.h"
> +#include "qom/object_interfaces.h"
> +#include "qapi/visitor.h"
> +#include "qom/object.h"
> +#include "qemu/error-report.h"
> +
> +#define PCI_VENDOR_ID_DMDEV   0x1b00
> +#define PCI_DEVICE_ID_DMDEV   0x1110
> +#define DYNAMIC_MDEV_BAR_SIZE 0x1000
> +
> +#define INTERRUPT_MEMORY_ATTACH_SUCCESS           (1 << 0)
> +#define INTERRUPT_MEMORY_DEATTACH_SUCCESS         (1 << 1)
> +#define INTERRUPT_MEMORY_ATTACH_NOMEM             (1 << 2)
> +#define INTERRUPT_MEMORY_ATTACH_ALIGN_ERR         (1 << 3)
> +#define INTERRUPT_ACCESS_NOT_MAPPED_ADDR          (1 << 4)
> +
> +#define DYNAMIC_CMD_ENABLE               (0x80000000)
> +#define DYNAMIC_CMD_MASK                 (0xffff)
> +#define DYNAMIC_CMD_MEM_ATTACH           (0x1)
> +#define DYNAMIC_CMD_MEM_DEATTACH         (0x2)
> +
> +#define DYNAMIC_MDEV_DEBUG               1
> +
> +#define DYNAMIC_MDEV_DPRINTF(fmt, ...)                          \
> +    do {                                                        \
> +        if (DYNAMIC_MDEV_DEBUG) {                               \
> +            printf("QEMU: " fmt, ## __VA_ARGS__);               \
> +        }                                                       \
> +    } while (0)
> +
> +#define TYPE_DYNAMIC_MDEV "dyanmic-mdevice"
> +
> +typedef struct DmdevState DmdevState;
> +DECLARE_INSTANCE_CHECKER(DmdevState, DYNAMIC_MDEV,
> +                         TYPE_DYNAMIC_MDEV)
> +
> +struct DmdevState {
> +    /*< private >*/
> +    PCIDevice parent_obj;
> +    /*< public >*/
> +
> +    /* registers */
> +    uint32_t mask;
> +    uint32_t status;
> +    uint32_t align;
> +    uint64_t size;
> +    uint64_t hw_offset;
> +    uint64_t mem_offset;
> +
> +    /* mdev name */
> +    char *devname;
> +    int fd;
> +
> +    /* memory bar size */
> +    uint64_t bsize;
> +
> +    /* BAR 0 (registers) */
> +    MemoryRegion dmdev_mmio;
> +
> +    /* BAR 2 (memory bar for daynamical memory attach) */
> +    MemoryRegion dmdev_mem;
> +};
> +
> +/* registers for the dynamical memory device */
> +enum dmdev_registers {
> +    INT_MASK     =3D     0, /* RW */
> +    INT_STATUS   =3D     4, /* RW: write 1 clear */
> +    DOOR_BELL    =3D     8, /*
> +                           * RW: trigger device to act
> +                           *  31        15        0
> +                           *  --------------------
> +                           * |en|xxxxxxxx|  cmd   |
> +                           *  --------------------
> +                           */
> +
> +    /* RO: 4k, 2M, 1G aglign for memory size */
> +    MEM_ALIGN   =3D     12,
> +
> +    /* RO: offset in memory bar shows bar space has had ram map */
> +    HW_OFFSET    =3D    16,
> +
> +    /* RW: size of dynamical attached memory */
> +    MEM_SIZE     =3D    24,
> +
> +    /* RW: offset in host mdev, where dynamical attached memory from  */
> +    MEM_OFFSET   =3D    32,
> +
> +};
> +
> +static void dmdev_mem_attach(DmdevState *s)
> +{
> +    void *ptr;
> +    struct MemoryRegion *mr;
> +    uint64_t size =3D s->size;
> +    uint64_t align =3D s->align;
> +    uint64_t hwaddr =3D s->hw_offset;
> +    uint64_t offset =3D s->mem_offset;
> +    PCIDevice *pdev =3D PCI_DEVICE(s);
> +
> +    DYNAMIC_MDEV_DPRINTF("%s:size =3D0x%lx,align=3D0x%lx,hwaddr=3D0x%lx,=
\
> +        offset=3D0x%lx\n", __func__, size, align, hwaddr, offset);
> +
> +    if (size % align || hwaddr % align) {
> +        error_report("%s size doesn't align, size =3D0x%lx, \
> +                align=3D0x%lx, hwaddr=3D0x%lx\n", __func__, size, align,=
 hwaddr);
> +        s->status |=3D INTERRUPT_MEMORY_ATTACH_ALIGN_ERR;
> +        msi_notify(pdev, 0);
> +        return;
> +    }
> +
> +    ptr =3D mmap(0, size, PROT_READ | PROT_WRITE, MAP_SHARED, s->fd, off=
set);
> +    if (ptr =3D=3D MAP_FAILED) {
> +        error_report("Can't map memory err(%d)", errno);
> +        s->status |=3D INTERRUPT_MEMORY_ATTACH_ALIGN_ERR;
> +        msi_notify(pdev, 0);
> +        return;
> +    }
> +
> +    mr =3D g_new0(MemoryRegion, 1);
> +    memory_region_init_ram_ptr(mr, OBJECT(PCI_DEVICE(s)),
> +                            "dynamic_mdev", size, ptr);
> +    memory_region_add_subregion_overlap(&s->dmdev_mem, hwaddr, mr, 1);
> +
> +    s->hw_offset +=3D size;
> +
> +    s->status |=3D INTERRUPT_MEMORY_ATTACH_SUCCESS;
> +    msi_notify(pdev, 0);
> +
> +    DYNAMIC_MDEV_DPRINTF("%s msi_notify success ptr=3D%p\n", __func__, p=
tr);
> +    return;
> +}
> +
> +static void dmdev_mem_deattach(DmdevState *s)
> +{
> +    struct MemoryRegion *mr =3D &s->dmdev_mem;
> +    struct MemoryRegion *subregion;
> +    void *host;
> +    PCIDevice *pdev =3D PCI_DEVICE(s);
> +
> +    memory_region_transaction_begin();
> +    while (!QTAILQ_EMPTY(&mr->subregions)) {
> +        subregion =3D QTAILQ_FIRST(&mr->subregions);
> +        memory_region_del_subregion(mr, subregion);
> +        host =3D memory_region_get_ram_ptr(subregion);
> +        munmap(host, memory_region_size(subregion));
> +        DYNAMIC_MDEV_DPRINTF("%s:host=3D%p,size=3D0x%lx\n",
> +                    __func__, host,  memory_region_size(subregion));
> +    }
> +
> +    memory_region_transaction_commit();
> +
> +    s->hw_offset =3D 0;
> +
> +    s->status |=3D INTERRUPT_MEMORY_DEATTACH_SUCCESS;
> +    msi_notify(pdev, 0);
> +
> +    return;
> +}
> +
> +static void dmdev_doorbell_handle(DmdevState *s,  uint64_t val)
> +{
> +    if (!(val & DYNAMIC_CMD_ENABLE)) {
> +        return;
> +    }
> +
> +    switch (val & DYNAMIC_CMD_MASK) {
> +
> +    case DYNAMIC_CMD_MEM_ATTACH:
> +        dmdev_mem_attach(s);
> +        break;
> +
> +    case DYNAMIC_CMD_MEM_DEATTACH:
> +        dmdev_mem_deattach(s);
> +        break;
> +
> +    default:
> +        break;
> +    }
> +
> +    return;
> +}
> +
> +static void dmdev_mmio_write(void *opaque, hwaddr addr,
> +                        uint64_t val, unsigned size)
> +{
> +    DmdevState *s =3D opaque;
> +
> +    DYNAMIC_MDEV_DPRINTF("%s write addr=3D0x%lx, val=3D0x%lx, size=3D0x%=
x\n",
> +                __func__, addr, val, size);
> +
> +    switch (addr) {
> +    case INT_MASK:
> +        s->mask =3D val;
> +        return;
> +
> +    case INT_STATUS:
> +        return;
> +
> +    case DOOR_BELL:
> +        dmdev_doorbell_handle(s, val);
> +        return;
> +
> +    case MEM_ALIGN:
> +        return;
> +
> +    case HW_OFFSET:
> +        /* read only */
> +        return;
> +
> +    case HW_OFFSET + 4:
> +        /* read only */
> +        return;
> +
> +    case MEM_SIZE:
> +        if (size =3D=3D 4) {
> +            s->size &=3D ~(0xffffffff);
> +            val &=3D 0xffffffff;
> +            s->size |=3D val;
> +        } else { /* 64-bit */
> +            s->size =3D val;
> +        }
> +        return;
> +
> +    case MEM_SIZE + 4:
> +        s->size &=3D 0xffffffff;
> +
> +        s->size |=3D val << 32;
> +        return;
> +
> +    case MEM_OFFSET:
> +        if (size =3D=3D 4) {
> +            s->mem_offset &=3D ~(0xffffffff);
> +            val &=3D 0xffffffff;
> +            s->mem_offset |=3D val;
> +        } else { /* 64-bit */
> +            s->mem_offset =3D val;
> +        }
> +        return;
> +
> +    case MEM_OFFSET + 4:
> +        s->mem_offset &=3D 0xffffffff;
> +
> +        s->mem_offset |=3D val << 32;
> +        return;
> +
> +    default:
> +        DYNAMIC_MDEV_DPRINTF("default 0x%lx\n", val);
> +    }
> +
> +    return;
> +}
> +
> +static uint64_t dmdev_mmio_read(void *opaque, hwaddr addr,
> +                        unsigned size)
> +{
> +    DmdevState *s =3D opaque;
> +    unsigned int value;
> +
> +    DYNAMIC_MDEV_DPRINTF("%s read addr=3D0x%lx, size=3D0x%x\n",
> +                         __func__, addr, size);
> +    switch (addr) {
> +    case INT_MASK:
> +        /* mask: read-write */
> +        return s->mask;
> +
> +    case INT_STATUS:
> +        /* status: read-clear */
> +        value =3D s->status;
> +        s->status =3D 0;
> +        return value;
> +
> +    case DOOR_BELL:
> +        /* doorbell: write-only */
> +        return 0;
> +
> +    case MEM_ALIGN:
> +        /* align: read-only */
> +        return s->align;
> +
> +    case HW_OFFSET:
> +        if (size =3D=3D 4) {
> +            return s->hw_offset & 0xffffffff;
> +        } else { /* 64-bit */
> +            return s->hw_offset;
> +        }
> +
> +    case HW_OFFSET + 4:
> +        return s->hw_offset >> 32;
> +
> +    case MEM_SIZE:
> +        if (size =3D=3D 4) {
> +            return s->size & 0xffffffff;
> +        } else { /* 64-bit */
> +            return s->size;
> +        }
> +
> +    case MEM_SIZE + 4:
> +        return s->size >> 32;
> +
> +    case MEM_OFFSET:
> +        if (size =3D=3D 4) {
> +            return s->mem_offset & 0xffffffff;
> +        } else { /* 64-bit */
> +            return s->mem_offset;
> +        }
> +
> +    case MEM_OFFSET + 4:
> +        return s->mem_offset >> 32;
> +
> +    default:
> +        DYNAMIC_MDEV_DPRINTF("default read err address 0x%lx\n", addr);
> +
> +    }
> +
> +    return 0;
> +}
> +
> +static const MemoryRegionOps dmdev_mmio_ops =3D {
> +    .read =3D dmdev_mmio_read,
> +    .write =3D dmdev_mmio_write,
> +    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .impl =3D {
> +        .min_access_size =3D 4,
> +        .max_access_size =3D 8,
> +    },
> +};
> +
> +static void dmdev_reset(DeviceState *d)
> +{
> +    DmdevState *s =3D DYNAMIC_MDEV(d);
> +
> +    s->status =3D 0;
> +    s->mask =3D 0;
> +    s->hw_offset =3D 0;
> +    dmdev_mem_deattach(s);
> +}
> +
> +static void dmdev_realize(PCIDevice *dev, Error **errp)
> +{
> +    DmdevState *s =3D DYNAMIC_MDEV(dev);
> +    int status;
> +
> +    Error *err =3D NULL;
> +    uint8_t *pci_conf;
> +
> +    pci_conf =3D dev->config;
> +    pci_conf[PCI_COMMAND] =3D PCI_COMMAND_IO | PCI_COMMAND_MEMORY;
> +
> +    /* init msi */
> +    status =3D msi_init(dev, 0, 1, true, false, &err);
> +    if (status) {
> +        error_report("msi_init %d failed", status);
> +        return;
> +    }
> +
> +    memory_region_init_io(&s->dmdev_mmio, OBJECT(s), &dmdev_mmio_ops, s,
> +                          "dmdev-mmio", DYNAMIC_MDEV_BAR_SIZE);
> +
> +    /* region for registers*/
> +    pci_register_bar(dev, 0, PCI_BASE_ADDRESS_SPACE_MEMORY,
> +                     &s->dmdev_mmio);
> +
> +    /* initialize a memory region container */
> +    memory_region_init(&s->dmdev_mem, OBJECT(s),
> +                       "dmdev-mem", s->bsize);
> +
> +    pci_register_bar(PCI_DEVICE(s), 2,
> +                    PCI_BASE_ADDRESS_SPACE_MEMORY |
> +                    PCI_BASE_ADDRESS_MEM_PREFETCH |
> +                    PCI_BASE_ADDRESS_MEM_TYPE_64,
> +                    &s->dmdev_mem);
> +
> +    if (s->devname) {
> +        s->fd =3D open(s->devname, O_RDWR, 0x0777);
> +    } else {
> +        s->fd =3D -1;
> +    }
> +
> +    s->hw_offset =3D 0;
> +
> +    DYNAMIC_MDEV_DPRINTF("open file %s %s\n",
> +            s->devname, s->fd < 0 ? "failed" : "success");
> +}
> +
> +static void dmdev_exit(PCIDevice *dev)
> +{
> +    DmdevState *s =3D DYNAMIC_MDEV(dev);
> +
> +    msi_uninit(dev);
> +    dmdev_mem_deattach(s);
> +    DYNAMIC_MDEV_DPRINTF("%s\n", __func__);
> +
> +}
> +
> +static Property dmdev_properties[] =3D {
> +    DEFINE_PROP_UINT64("size", DmdevState, bsize, 0x40000000),
> +    DEFINE_PROP_UINT32("align", DmdevState, align, 0x40000000),
> +    DEFINE_PROP_STRING("mem-path", DmdevState, devname),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void dmdev_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc =3D DEVICE_CLASS(klass);
> +    PCIDeviceClass *k =3D PCI_DEVICE_CLASS(klass);
> +
> +    k->realize =3D dmdev_realize;
> +    k->exit =3D dmdev_exit;
> +    k->vendor_id =3D PCI_VENDOR_ID_DMDEV;
> +    k->device_id =3D PCI_DEVICE_ID_DMDEV;
> +    k->class_id =3D PCI_CLASS_MEMORY_RAM;
> +    k->revision =3D 1;
> +    dc->reset =3D dmdev_reset;
> +    device_class_set_props(dc, dmdev_properties);
> +    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
> +    dc->desc =3D "pci device to dynamically attach memory";
> +}
> +
> +static const TypeInfo dmdev_info =3D {
> +    .name          =3D TYPE_DYNAMIC_MDEV,
> +    .parent        =3D TYPE_PCI_DEVICE,
> +    .instance_size =3D sizeof(DmdevState),
> +    .class_init    =3D dmdev_class_init,
> +    .interfaces    =3D (InterfaceInfo[]) {
> +        { INTERFACE_PCIE_DEVICE },
> +        { },
> +    },
> +};
> +
> +static void dmdev_register_types(void)
> +{
> +    type_register_static(&dmdev_info);
> +}
> +
> +type_init(dmdev_register_types)
> diff --git a/hw/misc/meson.build b/hw/misc/meson.build
> index a53b849a5a..38f6701a4b 100644
> --- a/hw/misc/meson.build
> +++ b/hw/misc/meson.build
> @@ -124,3 +124,4 @@ specific_ss.add(when: 'CONFIG_MIPS_CPS', if_true: fil=
es('mips_cmgcr.c', 'mips_cp
>  specific_ss.add(when: 'CONFIG_MIPS_ITU', if_true: files('mips_itu.c'))
>=20
>  specific_ss.add(when: 'CONFIG_SBSA_REF', if_true: files('sbsa_ec.c'))
> +specific_ss.add(when: 'CONFIG_DYNAMIC_MDEV', if_true: files('dynamic_mde=
v.c'))
> --
> 2.27.0
>=20
>=20

--jEtqSYKNtQwQ9cAJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmFRgFoACgkQnKSrs4Gr
c8iMRQgArDAoCtOqQsBg0fWR+FUemlV++r/tUr+Ztxyb1cm8NNMT3K+NDg7cwR2A
4Y8+M899aOobj8wiLWp0mIqhhxISN8s2mBPtkYPD47AXIB2OtUdDbuT9aNbBRIZV
p08drTuUfNIjKIjHC3U+a9l8CoS2P7Ra52lbjDvZ1eTz9nRE96Yc9qJPzMT3zd8v
EVmGwwIRA3sWQq2m1iKIaH/4+UBfSVzjtIhG3JFHhG2+HlCOrB7ko9bads5Jjbfl
nL0AlUQgKOk5DPLqnOLCMW1CJbDvTPje0KjQEdrz0LCbF1suTxHZgNbI5IXIkHUc
GScER50CCgtNkZwaypZvBG0t71CkSA==
=BK9Y
-----END PGP SIGNATURE-----

--jEtqSYKNtQwQ9cAJ--


