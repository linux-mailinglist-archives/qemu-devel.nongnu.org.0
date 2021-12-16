Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8323F4774DA
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 15:42:30 +0100 (CET)
Received: from localhost ([::1]:50824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxrxl-00071N-0j
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 09:42:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mxrwO-0006LQ-KV
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 09:41:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55273)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mxrwK-0004Zh-OR
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 09:41:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639665659;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CCeL2KIVHjV8wSKvB8ZSgKavNpvuPLou4vD8PgTlkmI=;
 b=dZLtPjxpWl1iiS+HTlVW5O/EN+bBhJhAjxabmH6WaH1MkbfMQotUEtMg5G4q2n8i5E+2Hz
 TtPcc3P+sEGiPR9mmBM8/k+Bon+O43MoWxMxy8XGRS08QmudKp9ba9KcdKwwCLo+Bf2ykR
 olbYEqBR1WZQfiFKKqGWG7e/+cu9tIw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-515-Xp-H3X4XOP6MxGlrMhCITQ-1; Thu, 16 Dec 2021 09:40:55 -0500
X-MC-Unique: Xp-H3X4XOP6MxGlrMhCITQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 774D8100D098;
 Thu, 16 Dec 2021 14:40:27 +0000 (UTC)
Received: from localhost (unknown [10.39.194.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 95BFB5C1A1;
 Thu, 16 Dec 2021 14:40:26 +0000 (UTC)
Date: Thu, 16 Dec 2021 14:40:25 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v4 11/14] vfio-user: IOMMU support for remote device
Message-ID: <YbtP2eaBnptogQDf@stefanha-x1.localdomain>
References: <cover.1639549843.git.jag.raman@oracle.com>
 <acae079dec4261d762311b86a0e699ba9ad79737.1639549843.git.jag.raman@oracle.com>
MIME-Version: 1.0
In-Reply-To: <acae079dec4261d762311b86a0e699ba9ad79737.1639549843.git.jag.raman@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="eeHkFQLvUpYzR3D+"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: elena.ufimtseva@oracle.com, john.g.johnson@oracle.com, thuth@redhat.com,
 bleal@redhat.com, swapnil.ingle@nutanix.com, john.levon@nutanix.com,
 philmd@redhat.com, qemu-devel@nongnu.org, wainersm@redhat.com,
 alex.williamson@redhat.com, thanos.makatos@nutanix.com,
 marcandre.lureau@gmail.com, crosa@redhat.com, pbonzini@redhat.com,
 alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--eeHkFQLvUpYzR3D+
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 15, 2021 at 10:35:35AM -0500, Jagannathan Raman wrote:
> Assign separate address space for each device in the remote processes.

If I understand correctly this isn't really an IOMMU. It's abusing the
IOMMU APIs to create isolated address spaces for each device. This way
memory regions added by the vfio-user client do not conflict when there
are multiple vfio-user servers.

Calling pci_root_bus_new() and keeping one PCI bus per VfuObject might
be a cleaner approach:
- Lets you isolate both PCI Memory Space and IO Space.
- Isolates the PCIDevices and their addresses on the bus.
- Isolates irqs.
- No more need to abuse the IOMMU API.

I might be missing something because I haven't investigated how to do
this myself.

> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> ---
>  include/hw/pci/pci.h      |   2 +
>  include/hw/remote/iommu.h |  24 ++++++++
>  hw/pci/pci.c              |   2 +-
>  hw/remote/iommu.c         | 117 ++++++++++++++++++++++++++++++++++++++
>  hw/remote/machine.c       |   5 ++
>  hw/remote/vfio-user-obj.c |  20 ++++++-
>  MAINTAINERS               |   2 +
>  hw/remote/meson.build     |   1 +
>  8 files changed, 169 insertions(+), 4 deletions(-)
>  create mode 100644 include/hw/remote/iommu.h
>  create mode 100644 hw/remote/iommu.c
>=20
> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> index 5c4016b995..f2fc2d5375 100644
> --- a/include/hw/pci/pci.h
> +++ b/include/hw/pci/pci.h
> @@ -734,6 +734,8 @@ void lsi53c8xx_handle_legacy_cmdline(DeviceState *lsi=
_dev);
>  qemu_irq pci_allocate_irq(PCIDevice *pci_dev);
>  void pci_set_irq(PCIDevice *pci_dev, int level);
> =20
> +void pci_init_bus_master(PCIDevice *pci_dev);

This function isn't used in this patch. Why make it public?

> +
>  static inline void pci_irq_assert(PCIDevice *pci_dev)
>  {
>      pci_set_irq(pci_dev, 1);
> diff --git a/include/hw/remote/iommu.h b/include/hw/remote/iommu.h
> new file mode 100644
> index 0000000000..42ce0ca383
> --- /dev/null
> +++ b/include/hw/remote/iommu.h
> @@ -0,0 +1,24 @@
> +/*
> + * IOMMU for remote device
> + *
> + * Copyright =A9 2021 Oracle and/or its affiliates.
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
> + * See the COPYING file in the top-level directory.
> + *
> + */
> +
> +#ifndef REMOTE_IOMMU_H
> +#define REMOTE_IOMMU_H
> +
> +#include "hw/pci/pci_bus.h"
> +
> +void remote_iommu_free(PCIDevice *pci_dev);
> +
> +void remote_iommu_init(void);
> +
> +void remote_iommu_set(PCIBus *bus);
> +
> +MemoryRegion *remote_iommu_get_ram(PCIDevice *pci_dev);
> +
> +#endif
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index 4a84e478ce..57d561cc03 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -95,7 +95,7 @@ static const VMStateDescription vmstate_pcibus =3D {
>      }
>  };
> =20
> -static void pci_init_bus_master(PCIDevice *pci_dev)
> +void pci_init_bus_master(PCIDevice *pci_dev)
>  {
>      AddressSpace *dma_as =3D pci_device_iommu_address_space(pci_dev);
> =20
> diff --git a/hw/remote/iommu.c b/hw/remote/iommu.c
> new file mode 100644
> index 0000000000..30c866badb
> --- /dev/null
> +++ b/hw/remote/iommu.c
> @@ -0,0 +1,117 @@
> +/*
> + * Remote IOMMU
> + *
> + * Copyright =A9 2021 Oracle and/or its affiliates.
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
> + * See the COPYING file in the top-level directory.
> + *
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu-common.h"
> +
> +#include "hw/remote/iommu.h"
> +#include "hw/pci/pci_bus.h"
> +#include "exec/memory.h"
> +#include "exec/address-spaces.h"
> +#include "trace.h"
> +
> +struct VFUIOMMU {
> +    AddressSpace  as;
> +    MemoryRegion  mr;

I guess this is the root MemoryRegion container? Calling it "root" or
"root_mr" instead of "mr" would make that clearer.

> +};
> +
> +typedef struct VFUPciBus {

There is no uppercase/lowercase consistency between VfuObject vs
VFUIOMMU vs VFUPciBus. Although the coding standard doesn't dictate ABC
vs Abc, please be consistent. I suggest following the VfuObject
convention started in the previous patches. The names would be VfuIommu
and VfuPciBus.

> +    PCIBus           *bus;
> +    struct VFUIOMMU  *iommu[];
> +} VFUPciBus;
> +
> +GHashTable *remote_as_table;
> +
> +static AddressSpace *remote_iommu_get_as(PCIBus *bus, void *opaque, int =
devfn)
> +{
> +    VFUPciBus *vfu_pci_bus =3D NULL;
> +    struct VFUIOMMU *iommu =3D NULL;
> +
> +    if (!remote_as_table) {
> +        return &address_space_memory;
> +    }
> +
> +    vfu_pci_bus =3D g_hash_table_lookup(remote_as_table, bus);
> +
> +    if (!vfu_pci_bus) {
> +        vfu_pci_bus =3D g_malloc0(sizeof(VFUPciBus));
> +        vfu_pci_bus->bus =3D bus;
> +        g_hash_table_insert(remote_as_table, bus, vfu_pci_bus);
> +    }
> +
> +    iommu =3D vfu_pci_bus->iommu[devfn];
> +
> +    if (!iommu) {
> +        g_autofree char *mr_name =3D g_strdup_printf("vfu-ram-%d", devfn=
);
> +        g_autofree char *as_name =3D g_strdup_printf("vfu-as-%d", devfn)=
;
> +
> +        iommu =3D g_malloc0(sizeof(struct VFUIOMMU));
> +
> +        memory_region_init(&iommu->mr, NULL, mr_name, UINT64_MAX);
> +        address_space_init(&iommu->as, &iommu->mr, as_name);
> +
> +        vfu_pci_bus->iommu[devfn] =3D iommu;
> +    }
> +
> +    return &iommu->as;
> +}
> +
> +void remote_iommu_free(PCIDevice *pci_dev)
> +{
> +    VFUPciBus *vfu_pci_bus =3D NULL;
> +    struct VFUIOMMU *iommu =3D NULL;
> +
> +    if (!remote_as_table) {
> +        return;
> +    }
> +
> +    vfu_pci_bus =3D g_hash_table_lookup(remote_as_table, pci_get_bus(pci=
_dev));
> +
> +    if (!vfu_pci_bus) {
> +        return;
> +    }
> +
> +    iommu =3D vfu_pci_bus->iommu[pci_dev->devfn];
> +
> +    vfu_pci_bus->iommu[pci_dev->devfn] =3D NULL;
> +
> +    if (iommu) {
> +        memory_region_unref(&iommu->mr);
> +        address_space_destroy(&iommu->as);
> +        g_free(iommu);
> +    }
> +}
> +
> +void remote_iommu_init(void)
> +{
> +    remote_as_table =3D g_hash_table_new_full(NULL, NULL, NULL, NULL);
> +}
> +
> +void remote_iommu_set(PCIBus *bus)
> +{
> +    pci_setup_iommu(bus, remote_iommu_get_as, NULL);
> +}
> +
> +MemoryRegion *remote_iommu_get_ram(PCIDevice *pci_dev)
> +{
> +    PCIBus *bus =3D pci_get_bus(pci_dev);
> +    VFUPciBus *vfu_pci_bus;
> +
> +    if (!remote_as_table) {
> +        return get_system_memory();
> +    }
> +
> +    vfu_pci_bus =3D g_hash_table_lookup(remote_as_table, bus);
> +    if (!vfu_pci_bus) {
> +        return get_system_memory();
> +    }
> +
> +    return &vfu_pci_bus->iommu[pci_dev->devfn]->mr;
> +}
> diff --git a/hw/remote/machine.c b/hw/remote/machine.c
> index 952105eab5..023be0491e 100644
> --- a/hw/remote/machine.c
> +++ b/hw/remote/machine.c
> @@ -21,6 +21,7 @@
>  #include "qapi/error.h"
>  #include "hw/pci/pci_host.h"
>  #include "hw/remote/iohub.h"
> +#include "hw/remote/iommu.h"
> =20
>  static void remote_machine_init(MachineState *machine)
>  {
> @@ -52,6 +53,10 @@ static void remote_machine_init(MachineState *machine)
> =20
>      remote_iohub_init(&s->iohub);
> =20
> +    remote_iommu_init();
> +
> +    remote_iommu_set(pci_host->bus);
> +
>      pci_bus_irqs(pci_host->bus, remote_iohub_set_irq, remote_iohub_map_i=
rq,
>                   &s->iohub, REMOTE_IOHUB_NB_PIRQS);
>  }
> diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
> index 9399e87cbe..ae375e69b9 100644
> --- a/hw/remote/vfio-user-obj.c
> +++ b/hw/remote/vfio-user-obj.c
> @@ -49,6 +49,7 @@
>  #include "hw/qdev-core.h"
>  #include "hw/pci/pci.h"
>  #include "qemu/timer.h"
> +#include "hw/remote/iommu.h"
> =20
>  #define TYPE_VFU_OBJECT "x-vfio-user-server"
>  OBJECT_DECLARE_TYPE(VfuObject, VfuObjectClass, VFU_OBJECT)
> @@ -210,6 +211,7 @@ static ssize_t vfu_object_cfg_access(vfu_ctx_t *vfu_c=
tx, char * const buf,
> =20
>  static void dma_register(vfu_ctx_t *vfu_ctx, vfu_dma_info_t *info)
>  {
> +    VfuObject *o =3D vfu_get_private(vfu_ctx);
>      MemoryRegion *subregion =3D NULL;
>      g_autofree char *name =3D NULL;
>      static unsigned int suffix;
> @@ -226,14 +228,15 @@ static void dma_register(vfu_ctx_t *vfu_ctx, vfu_dm=
a_info_t *info)
>      memory_region_init_ram_ptr(subregion, NULL, name,
>                                 iov->iov_len, info->vaddr);
> =20
> -    memory_region_add_subregion(get_system_memory(), (hwaddr)iov->iov_ba=
se,
> -                                subregion);
> +    memory_region_add_subregion(remote_iommu_get_ram(o->pci_dev),
> +                                (hwaddr)iov->iov_base, subregion);
> =20
>      trace_vfu_dma_register((uint64_t)iov->iov_base, iov->iov_len);
>  }
> =20
>  static void dma_unregister(vfu_ctx_t *vfu_ctx, vfu_dma_info_t *info)
>  {
> +    VfuObject *o =3D vfu_get_private(vfu_ctx);
>      MemoryRegion *mr =3D NULL;
>      ram_addr_t offset;
> =20
> @@ -242,7 +245,7 @@ static void dma_unregister(vfu_ctx_t *vfu_ctx, vfu_dm=
a_info_t *info)
>          return;
>      }
> =20
> -    memory_region_del_subregion(get_system_memory(), mr);
> +    memory_region_del_subregion(remote_iommu_get_ram(o->pci_dev), mr);
> =20
>      object_unparent((OBJECT(mr)));
> =20
> @@ -320,6 +323,7 @@ static vfu_region_access_cb_t *vfu_object_bar_handler=
s[PCI_NUM_REGIONS] =3D {
>   */
>  static void vfu_object_register_bars(vfu_ctx_t *vfu_ctx, PCIDevice *pdev=
)
>  {
> +    VfuObject *o =3D vfu_get_private(vfu_ctx);
>      int i;
> =20
>      for (i =3D 0; i < PCI_NUM_REGIONS; i++) {
> @@ -332,6 +336,12 @@ static void vfu_object_register_bars(vfu_ctx_t *vfu_=
ctx, PCIDevice *pdev)
>                           vfu_object_bar_handlers[i],
>                           VFU_REGION_FLAG_RW, NULL, 0, -1, 0);
> =20
> +        if ((o->pci_dev->io_regions[i].type & PCI_BASE_ADDRESS_SPACE) =
=3D=3D 0) {
> +            memory_region_unref(o->pci_dev->io_regions[i].address_space)=
;
> +            o->pci_dev->io_regions[i].address_space =3D
> +                remote_iommu_get_ram(o->pci_dev);
> +        }

This looks hacky. If you create a separate PCIHost for each device
instead then the BARs will be created in the MemoryRegion (confusingly
named "address_space" in the PCI code) of your choosing.

Also, why is PCI Memory Space isolated via VFUIOMMU but PCI IO Space is
not?

--eeHkFQLvUpYzR3D+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmG7T9kACgkQnKSrs4Gr
c8gClwf/Z+JJ+z8Nj2m0QBV5z5tRenzq2QbaG31oWsd8BdzwnxsMBsrW5az8/Fdd
SeWVk1ptlcLUdyk+ttgqNAI9Qf/4+RPPnf2a/hMlvbx+7MBCXgy8gavzkXm3vdbn
J12knj9nqtsO3DXZYo4kUKzdeB/1jt1x8EllXZVlcTb2Cyd4lGl4rE25LWAeAb5l
wx0u6k6+c0tuIWNbtWQYmb4IjiXmv7YPi67NefCe+NLeDMN41YrYz9gmlVnoE5nN
qxpA+Y7NiDbOS3vLuCL4edDBvkQ37zvl0cU4dAvM0iEV9BsclkqwVnHSspBBVbrR
2V2vlDamq2tvz2HPqQiiYQy5lCcrDQ==
=MwzH
-----END PGP SIGNATURE-----

--eeHkFQLvUpYzR3D+--


