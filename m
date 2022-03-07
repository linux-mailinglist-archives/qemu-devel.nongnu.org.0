Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E50CC4CFD48
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 12:46:09 +0100 (CET)
Received: from localhost ([::1]:35776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRBoW-00053G-Mc
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 06:46:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nRAY0-000241-PJ
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:25:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44893)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nRAXy-0006AH-Ef
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:25:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646648697;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7HOqwQ6vFwaeky0lXxhI3g6zWQV9gSkRR/Oflp40330=;
 b=HttpmnYYeULi0jmgflOTVnH15fuP/PB0XaKLElaKasiDu5NHoXlW8J+w9N+asgmPcO/ceX
 Yks22Ela1nWAZQK9srjjODdVb80cvtxG/gqEImFLEETs1Lsvbstj47uyEa9etW8qCVvVed
 E/89W8gjtZFyKuRvaTLnKBfg2h8w2Jc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-633-HjwB6ll8PNmmtChJHnvOJw-1; Mon, 07 Mar 2022 05:24:54 -0500
X-MC-Unique: HjwB6ll8PNmmtChJHnvOJw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DB9121800D50;
 Mon,  7 Mar 2022 10:24:52 +0000 (UTC)
Received: from localhost (unknown [10.39.193.253])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A14E5752D2;
 Mon,  7 Mar 2022 10:24:26 +0000 (UTC)
Date: Mon, 7 Mar 2022 10:24:17 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v6 15/19] vfio-user: handle device interrupts
Message-ID: <YiXdUbz3r1xORJKD@stefanha-x1.localdomain>
References: <cover.1645079934.git.jag.raman@oracle.com>
 <ba5a32f3def72ce66a894191747dcafd63e7a517.1645079934.git.jag.raman@oracle.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="6nWaSl7DOtwn9FRc"
Content-Disposition: inline
In-Reply-To: <ba5a32f3def72ce66a894191747dcafd63e7a517.1645079934.git.jag.raman@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: eduardo@habkost.net, elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 berrange@redhat.com, bleal@redhat.com, john.levon@nutanix.com, mst@redhat.com,
 armbru@redhat.com, quintela@redhat.com, f4bug@amsat.org, qemu-devel@nongnu.org,
 alex.williamson@redhat.com, kanth.ghatraju@oracle.com,
 thanos.makatos@nutanix.com, pbonzini@redhat.com, eblake@redhat.com,
 dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--6nWaSl7DOtwn9FRc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 17, 2022 at 02:49:02AM -0500, Jagannathan Raman wrote:
> Forward remote device's interrupts to the guest
>=20
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> ---
>  include/hw/pci/pci.h              |   6 ++
>  include/hw/remote/vfio-user-obj.h |   6 ++
>  hw/pci/msi.c                      |  13 +++-
>  hw/pci/msix.c                     |  12 +++-
>  hw/remote/machine.c               |  11 +--
>  hw/remote/vfio-user-obj.c         | 107 ++++++++++++++++++++++++++++++
>  stubs/vfio-user-obj.c             |   6 ++
>  MAINTAINERS                       |   1 +
>  hw/remote/trace-events            |   1 +
>  stubs/meson.build                 |   1 +
>  10 files changed, 158 insertions(+), 6 deletions(-)
>  create mode 100644 include/hw/remote/vfio-user-obj.h
>  create mode 100644 stubs/vfio-user-obj.c
>=20
> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> index c3f3c90473..d42d526a48 100644
> --- a/include/hw/pci/pci.h
> +++ b/include/hw/pci/pci.h
> @@ -129,6 +129,8 @@ typedef uint32_t PCIConfigReadFunc(PCIDevice *pci_dev,
>  typedef void PCIMapIORegionFunc(PCIDevice *pci_dev, int region_num,
>                                  pcibus_t addr, pcibus_t size, int type);
>  typedef void PCIUnregisterFunc(PCIDevice *pci_dev);
> +typedef void PCIMSINotify(PCIDevice *pci_dev, unsigned vector);
> +typedef void PCIMSIxNotify(PCIDevice *pci_dev, unsigned vector);
> =20
>  typedef struct PCIIORegion {
>      pcibus_t addr; /* current PCI mapping address. -1 means not mapped */
> @@ -323,6 +325,10 @@ struct PCIDevice {
>      /* Space to store MSIX table & pending bit array */
>      uint8_t *msix_table;
>      uint8_t *msix_pba;
> +
> +    PCIMSINotify *msi_notify;
> +    PCIMSIxNotify *msix_notify;
> +
>      /* MemoryRegion container for msix exclusive BAR setup */
>      MemoryRegion msix_exclusive_bar;
>      /* Memory Regions for MSIX table and pending bit entries. */
> diff --git a/include/hw/remote/vfio-user-obj.h b/include/hw/remote/vfio-u=
ser-obj.h
> new file mode 100644
> index 0000000000..87ab78b875
> --- /dev/null
> +++ b/include/hw/remote/vfio-user-obj.h
> @@ -0,0 +1,6 @@
> +#ifndef VFIO_USER_OBJ_H
> +#define VFIO_USER_OBJ_H
> +
> +void vfu_object_set_bus_irq(PCIBus *pci_bus);
> +
> +#endif
> diff --git a/hw/pci/msi.c b/hw/pci/msi.c
> index 47d2b0f33c..93f5e400cc 100644
> --- a/hw/pci/msi.c
> +++ b/hw/pci/msi.c
> @@ -51,6 +51,8 @@
>   */
>  bool msi_nonbroken;
> =20
> +static void pci_msi_notify(PCIDevice *dev, unsigned int vector);
> +
>  /* If we get rid of cap allocator, we won't need this. */
>  static inline uint8_t msi_cap_sizeof(uint16_t flags)
>  {
> @@ -225,6 +227,8 @@ int msi_init(struct PCIDevice *dev, uint8_t offset,
>      dev->msi_cap =3D config_offset;
>      dev->cap_present |=3D QEMU_PCI_CAP_MSI;
> =20
> +    dev->msi_notify =3D pci_msi_notify;

Are you sure it's correct to skip the msi_is_masked() logic? I think the
callback function should only override the behavior of
msi_send_message(), not the entire msi_notify() function.

The same applies to MSI-X.

> +
>      pci_set_word(dev->config + msi_flags_off(dev), flags);
>      pci_set_word(dev->wmask + msi_flags_off(dev),
>                   PCI_MSI_FLAGS_QSIZE | PCI_MSI_FLAGS_ENABLE);
> @@ -307,7 +311,7 @@ bool msi_is_masked(const PCIDevice *dev, unsigned int=
 vector)
>      return mask & (1U << vector);
>  }
> =20
> -void msi_notify(PCIDevice *dev, unsigned int vector)
> +static void pci_msi_notify(PCIDevice *dev, unsigned int vector)
>  {
>      uint16_t flags =3D pci_get_word(dev->config + msi_flags_off(dev));
>      bool msi64bit =3D flags & PCI_MSI_FLAGS_64BIT;
> @@ -332,6 +336,13 @@ void msi_notify(PCIDevice *dev, unsigned int vector)
>      msi_send_message(dev, msg);
>  }
> =20
> +void msi_notify(PCIDevice *dev, unsigned int vector)
> +{
> +    if (dev->msi_notify) {

Can this ever be NULL?

> +        dev->msi_notify(dev, vector);
> +    }
> +}
> +
>  void msi_send_message(PCIDevice *dev, MSIMessage msg)
>  {
>      MemTxAttrs attrs =3D {};
> diff --git a/hw/pci/msix.c b/hw/pci/msix.c
> index ae9331cd0b..1c71e67f53 100644
> --- a/hw/pci/msix.c
> +++ b/hw/pci/msix.c
> @@ -31,6 +31,8 @@
>  #define MSIX_ENABLE_MASK (PCI_MSIX_FLAGS_ENABLE >> 8)
>  #define MSIX_MASKALL_MASK (PCI_MSIX_FLAGS_MASKALL >> 8)
> =20
> +static void pci_msix_notify(PCIDevice *dev, unsigned vector);
> +
>  MSIMessage msix_get_message(PCIDevice *dev, unsigned vector)
>  {
>      uint8_t *table_entry =3D dev->msix_table + vector * PCI_MSIX_ENTRY_S=
IZE;
> @@ -334,6 +336,7 @@ int msix_init(struct PCIDevice *dev, unsigned short n=
entries,
>      dev->msix_table =3D g_malloc0(table_size);
>      dev->msix_pba =3D g_malloc0(pba_size);
>      dev->msix_entry_used =3D g_malloc0(nentries * sizeof *dev->msix_entr=
y_used);
> +    dev->msix_notify =3D pci_msix_notify;
> =20
>      msix_mask_all(dev, nentries);
> =20
> @@ -485,7 +488,7 @@ int msix_enabled(PCIDevice *dev)
>  }
> =20
>  /* Send an MSI-X message */
> -void msix_notify(PCIDevice *dev, unsigned vector)
> +static void pci_msix_notify(PCIDevice *dev, unsigned vector)
>  {
>      MSIMessage msg;
> =20
> @@ -503,6 +506,13 @@ void msix_notify(PCIDevice *dev, unsigned vector)
>      msi_send_message(dev, msg);
>  }
> =20
> +void msix_notify(PCIDevice *dev, unsigned vector)
> +{
> +    if (dev->msix_notify) {

Can this ever be NULL?

> +        dev->msix_notify(dev, vector);
> +    }
> +}
> +
>  void msix_reset(PCIDevice *dev)
>  {
>      if (!msix_present(dev)) {
> diff --git a/hw/remote/machine.c b/hw/remote/machine.c
> index db4ae30710..a8b4a3aef3 100644
> --- a/hw/remote/machine.c
> +++ b/hw/remote/machine.c
> @@ -23,6 +23,7 @@
>  #include "hw/remote/iohub.h"
>  #include "hw/qdev-core.h"
>  #include "hw/remote/iommu.h"
> +#include "hw/remote/vfio-user-obj.h"
> =20
>  static void remote_machine_init(MachineState *machine)
>  {
> @@ -54,12 +55,14 @@ static void remote_machine_init(MachineState *machine)
> =20
>      if (s->vfio_user) {
>          remote_configure_iommu(pci_host->bus);
> -    }
> =20
> -    remote_iohub_init(&s->iohub);
> +        vfu_object_set_bus_irq(pci_host->bus);
> +    } else {
> +        remote_iohub_init(&s->iohub);
> =20
> -    pci_bus_irqs(pci_host->bus, remote_iohub_set_irq, remote_iohub_map_i=
rq,
> -                 &s->iohub, REMOTE_IOHUB_NB_PIRQS);
> +        pci_bus_irqs(pci_host->bus, remote_iohub_set_irq, remote_iohub_m=
ap_irq,
> +                     &s->iohub, REMOTE_IOHUB_NB_PIRQS);
> +    }
> =20
>      qbus_set_hotplug_handler(BUS(pci_host->bus), OBJECT(s));
>  }
> diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
> index 2feabd06a4..d79bab87f1 100644
> --- a/hw/remote/vfio-user-obj.c
> +++ b/hw/remote/vfio-user-obj.c
> @@ -54,6 +54,9 @@
>  #include "hw/pci/pci.h"
>  #include "qemu/timer.h"
>  #include "exec/memory.h"
> +#include "hw/pci/msi.h"
> +#include "hw/pci/msix.h"
> +#include "hw/remote/vfio-user-obj.h"
> =20
>  #define TYPE_VFU_OBJECT "x-vfio-user-server"
>  OBJECT_DECLARE_TYPE(VfuObject, VfuObjectClass, VFU_OBJECT)
> @@ -107,6 +110,10 @@ struct VfuObject {
>      int vfu_poll_fd;
>  };
> =20
> +static GHashTable *vfu_object_bdf_to_ctx_table;

I suggest adding a void *msi_notify_opaque field to PCIDevice and
passing the value as an argument to ->msi_notify(). vfio-user-obj.c can
set the value to vfu_ctx and eliminate the vfu_object_bdf_to_ctx_table
hash table.

This simplifies the code, makes it faster, and solves race conditions
during hot plug/unplug if other instances are running in IOThreads.

> +
> +#define INT2VOIDP(i) (void *)(uintptr_t)(i)
> +
>  static void vfu_object_init_ctx(VfuObject *o, Error **errp);
> =20
>  static void vfu_object_set_socket(Object *obj, Visitor *v, const char *n=
ame,
> @@ -463,6 +470,86 @@ static void vfu_object_register_bars(vfu_ctx_t *vfu_=
ctx, PCIDevice *pdev)
>      }
>  }
> =20
> +static void vfu_object_irq_trigger(int pci_bdf, unsigned vector)
> +{
> +    vfu_ctx_t *vfu_ctx =3D NULL;
> +
> +    if (!vfu_object_bdf_to_ctx_table) {

Can this ever be NULL?

> +        return;
> +    }
> +
> +    vfu_ctx =3D g_hash_table_lookup(vfu_object_bdf_to_ctx_table,
> +                                  INT2VOIDP(pci_bdf));
> +
> +    if (vfu_ctx) {
> +        vfu_irq_trigger(vfu_ctx, vector);
> +    }
> +}
> +
> +static int vfu_object_map_irq(PCIDevice *pci_dev, int intx)
> +{
> +    int pci_bdf =3D PCI_BUILD_BDF(pci_bus_num(pci_get_bus(pci_dev)),
> +                                pci_dev->devfn);
> +
> +    return pci_bdf;
> +}
> +
> +static void vfu_object_set_irq(void *opaque, int pirq, int level)
> +{
> +    if (level) {
> +        vfu_object_irq_trigger(pirq, 0);
> +    }
> +}
> +
> +static void vfu_object_msi_notify(PCIDevice *pci_dev, unsigned vector)
> +{
> +    int pci_bdf;
> +
> +    pci_bdf =3D PCI_BUILD_BDF(pci_bus_num(pci_get_bus(pci_dev)), pci_dev=
->devfn);
> +
> +    vfu_object_irq_trigger(pci_bdf, vector);
> +}
> +
> +static int vfu_object_setup_irqs(VfuObject *o, PCIDevice *pci_dev)
> +{
> +    vfu_ctx_t *vfu_ctx =3D o->vfu_ctx;
> +    int ret, pci_bdf;
> +
> +    ret =3D vfu_setup_device_nr_irqs(vfu_ctx, VFU_DEV_INTX_IRQ, 1);
> +    if (ret < 0) {
> +        return ret;
> +    }
> +
> +    ret =3D 0;
> +    if (msix_nr_vectors_allocated(pci_dev)) {
> +        ret =3D vfu_setup_device_nr_irqs(vfu_ctx, VFU_DEV_MSIX_IRQ,
> +                                       msix_nr_vectors_allocated(pci_dev=
));
> +
> +        pci_dev->msix_notify =3D vfu_object_msi_notify;
> +    } else if (msi_nr_vectors_allocated(pci_dev)) {
> +        ret =3D vfu_setup_device_nr_irqs(vfu_ctx, VFU_DEV_MSI_IRQ,
> +                                       msi_nr_vectors_allocated(pci_dev)=
);
> +
> +        pci_dev->msi_notify =3D vfu_object_msi_notify;
> +    }
> +
> +    if (ret < 0) {
> +        return ret;
> +    }
> +
> +    pci_bdf =3D PCI_BUILD_BDF(pci_bus_num(pci_get_bus(pci_dev)), pci_dev=
->devfn);
> +
> +    g_hash_table_insert(vfu_object_bdf_to_ctx_table, INT2VOIDP(pci_bdf),
> +                        o->vfu_ctx);
> +
> +    return 0;
> +}
> +
> +void vfu_object_set_bus_irq(PCIBus *pci_bus)
> +{
> +    pci_bus_irqs(pci_bus, vfu_object_set_irq, vfu_object_map_irq, NULL, =
1);
> +}
> +
>  /*
>   * TYPE_VFU_OBJECT depends on the availability of the 'socket' and 'devi=
ce'
>   * properties. It also depends on devices instantiated in QEMU. These
> @@ -559,6 +646,13 @@ static void vfu_object_init_ctx(VfuObject *o, Error =
**errp)
> =20
>      vfu_object_register_bars(o->vfu_ctx, o->pci_dev);
> =20
> +    ret =3D vfu_object_setup_irqs(o, o->pci_dev);
> +    if (ret < 0) {
> +        error_setg(errp, "vfu: Failed to setup interrupts for %s",
> +                   o->device);
> +        goto fail;
> +    }
> +
>      ret =3D vfu_realize_ctx(o->vfu_ctx);
>      if (ret < 0) {
>          error_setg(errp, "vfu: Failed to realize device %s- %s",
> @@ -612,6 +706,7 @@ static void vfu_object_finalize(Object *obj)
>  {
>      VfuObjectClass *k =3D VFU_OBJECT_GET_CLASS(obj);
>      VfuObject *o =3D VFU_OBJECT(obj);
> +    int pci_bdf;
> =20
>      k->nr_devs--;
> =20
> @@ -638,9 +733,17 @@ static void vfu_object_finalize(Object *obj)
>          o->unplug_blocker =3D NULL;
>      }
> =20
> +    if (o->pci_dev) {
> +        pci_bdf =3D PCI_BUILD_BDF(pci_bus_num(pci_get_bus(o->pci_dev)),
> +                                o->pci_dev->devfn);
> +        g_hash_table_remove(vfu_object_bdf_to_ctx_table, INT2VOIDP(pci_b=
df));
> +    }
> +
>      o->pci_dev =3D NULL;
> =20
>      if (!k->nr_devs && k->auto_shutdown) {
> +        g_hash_table_destroy(vfu_object_bdf_to_ctx_table);
> +        vfu_object_bdf_to_ctx_table =3D NULL;
>          qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
>      }
> =20
> @@ -658,6 +761,10 @@ static void vfu_object_class_init(ObjectClass *klass=
, void *data)
> =20
>      k->auto_shutdown =3D true;
> =20
> +    msi_nonbroken =3D true;

This should go in hw/remote/machine.c. It's a global variable related to
the machine's interrupt controller capabilities. The value is not
related to vfu_object_class_init(), which will be called by any QEMU
binary that links hw/remote/vfio-user-obj.o regardless of which machine
type is instantiated.

> +
> +    vfu_object_bdf_to_ctx_table =3D g_hash_table_new_full(NULL, NULL, NU=
LL, NULL);
> +
>      object_class_property_add(klass, "socket", "SocketAddress", NULL,
>                                vfu_object_set_socket, NULL, NULL);
>      object_class_property_set_description(klass, "socket",
> diff --git a/stubs/vfio-user-obj.c b/stubs/vfio-user-obj.c
> new file mode 100644
> index 0000000000..79100d768e
> --- /dev/null
> +++ b/stubs/vfio-user-obj.c
> @@ -0,0 +1,6 @@
> +#include "qemu/osdep.h"
> +#include "hw/remote/vfio-user-obj.h"
> +
> +void vfu_object_set_bus_irq(PCIBus *pci_bus)
> +{
> +}
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f47232c78c..e274cb46af 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3569,6 +3569,7 @@ F: hw/remote/iohub.c
>  F: include/hw/remote/iohub.h
>  F: subprojects/libvfio-user
>  F: hw/remote/vfio-user-obj.c
> +F: include/hw/remote/vfio-user-obj.h
>  F: hw/remote/iommu.c
>  F: include/hw/remote/iommu.h
> =20
> diff --git a/hw/remote/trace-events b/hw/remote/trace-events
> index 847d50d88f..c167b3c7a5 100644
> --- a/hw/remote/trace-events
> +++ b/hw/remote/trace-events
> @@ -12,3 +12,4 @@ vfu_dma_unregister(uint64_t gpa) "vfu: unregistering GP=
A 0x%"PRIx64""
>  vfu_bar_register(int i, uint64_t addr, uint64_t size) "vfu: BAR %d: addr=
 0x%"PRIx64" size 0x%"PRIx64""
>  vfu_bar_rw_enter(const char *op, uint64_t addr) "vfu: %s request for BAR=
 address 0x%"PRIx64""
>  vfu_bar_rw_exit(const char *op, uint64_t addr) "vfu: Finished %s of BAR =
address 0x%"PRIx64""
> +vfu_interrupt(int pirq) "vfu: sending interrupt to device - PIRQ %d"
> diff --git a/stubs/meson.build b/stubs/meson.build
> index d359cbe1ad..c5ce979dc3 100644
> --- a/stubs/meson.build
> +++ b/stubs/meson.build
> @@ -57,3 +57,4 @@ if have_system
>  else
>    stub_ss.add(files('qdev.c'))
>  endif
> +stub_ss.add(when: 'CONFIG_VFIO_USER_SERVER', if_false: files('vfio-user-=
obj.c'))
> --=20
> 2.20.1
>=20

--6nWaSl7DOtwn9FRc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIl3VEACgkQnKSrs4Gr
c8hJSAgAvTs56OMu2rmE3/zAKBHy59Nbc8xBmfBjuFH3zVXw9X2eSqszFM7oZt/t
2eXSGJexDdzAXCxcCWUB11ppEpawkWnjKe74f6Nrry/WUyc0kfbNObciOv3zoNlr
U2wn3dtGfvFmHxrk2UJlVhXpUkjLWK1fkP4GlGkhMHWvxRM8TPIDjVTcAtYCKW9z
HMO+D4rLejOuGUGWH4/V+BOhg9HLP2kWnh+7+CAohl0pn9CvKgBP24Xcf0mJ6d8b
LpyMyUVkbag9Rt8PdfZFoiLeqyHmqNMYvBa0Ku5P9cR+X90ocs5+hnBTMW91UNhB
HA5dXc/POhlzh94rswd3nZZqNq2EJA==
=rLmm
-----END PGP SIGNATURE-----

--6nWaSl7DOtwn9FRc--


