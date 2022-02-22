Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B212D4BF6EE
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 12:07:24 +0100 (CET)
Received: from localhost ([::1]:37796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMT0t-0008IJ-R3
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 06:07:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nMSyG-0007Sw-7v
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 06:04:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nMSyD-0003Vt-4z
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 06:04:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645527875;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Dm61wVChzmqodDKzKz0HLiSsSmvML3+lDZI7JIlABH4=;
 b=gDOpl/+C5Gg7e2VTsg4KOgVGIIE7pLNFcnZ2V1gQ+A1B2C3aO13eBoJl/8TzAgE8/YUvNO
 PBnAgV3SyxamJZyLv90V2kGprbMp9Kv3ASi0yaQmYrhwrezXFKmeJoA7iBrdTe6NLIm1nV
 uJAIdEwsRI86eRle81oUXQuB2TpjA+s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-615-L1wjhCHzPGmBPrzYctAyLg-1; Tue, 22 Feb 2022 06:04:32 -0500
X-MC-Unique: L1wjhCHzPGmBPrzYctAyLg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E36CC1091DA0;
 Tue, 22 Feb 2022 11:04:30 +0000 (UTC)
Received: from localhost (unknown [10.39.195.202])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0DA4E76651;
 Tue, 22 Feb 2022 11:04:03 +0000 (UTC)
Date: Tue, 22 Feb 2022 11:04:02 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v6 14/19] vfio-user: handle PCI BAR accesses
Message-ID: <YhTDIhIctQ89qmYq@stefanha-x1.localdomain>
References: <cover.1645079934.git.jag.raman@oracle.com>
 <711d01b9e52be0260f26a72feb286f6b32cbe332.1645079934.git.jag.raman@oracle.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="XxKlpwY+ujfl+MAo"
Content-Disposition: inline
In-Reply-To: <711d01b9e52be0260f26a72feb286f6b32cbe332.1645079934.git.jag.raman@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 thanos.makatos@nutanix.com, pbonzini@redhat.com,
 Jagannathan Raman <jag.raman@oracle.com>, eblake@redhat.com,
 dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--XxKlpwY+ujfl+MAo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 17, 2022 at 02:49:01AM -0500, Jagannathan Raman wrote:
> Determine the BARs used by the PCI device and register handlers to
> manage the access to the same.

Hi Paolo,
Please review this from the memory API perspective. vfu_object_bar_rw()
reimplements MemoryRegion read/write because we're dispatching to a
MemoryRegion without going through an AddressSpace/FlatView.

>=20
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> ---
>  include/exec/memory.h           |   3 +
>  hw/remote/vfio-user-obj.c       | 166 ++++++++++++++++++++++++++++++++
>  softmmu/physmem.c               |   4 +-
>  tests/qtest/fuzz/generic_fuzz.c |   9 +-
>  hw/remote/trace-events          |   3 +
>  5 files changed, 179 insertions(+), 6 deletions(-)
>=20
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index 4d5997e6bb..4b061e62d5 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -2810,6 +2810,9 @@ MemTxResult address_space_write_cached_slow(MemoryR=
egionCache *cache,
>                                              hwaddr addr, const void *buf,
>                                              hwaddr len);
> =20
> +int memory_access_size(MemoryRegion *mr, unsigned l, hwaddr addr);
> +bool prepare_mmio_access(MemoryRegion *mr);
> +
>  static inline bool memory_access_is_direct(MemoryRegion *mr, bool is_wri=
te)
>  {
>      if (is_write) {
> diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
> index 971f6ca28e..2feabd06a4 100644
> --- a/hw/remote/vfio-user-obj.c
> +++ b/hw/remote/vfio-user-obj.c
> @@ -53,6 +53,7 @@
>  #include "hw/qdev-core.h"
>  #include "hw/pci/pci.h"
>  #include "qemu/timer.h"
> +#include "exec/memory.h"
> =20
>  #define TYPE_VFU_OBJECT "x-vfio-user-server"
>  OBJECT_DECLARE_TYPE(VfuObject, VfuObjectClass, VFU_OBJECT)
> @@ -299,6 +300,169 @@ static void dma_unregister(vfu_ctx_t *vfu_ctx, vfu_=
dma_info_t *info)
>      trace_vfu_dma_unregister((uint64_t)info->iova.iov_base);
>  }
> =20
> +static size_t vfu_object_bar_rw(PCIDevice *pci_dev, int pci_bar,
> +                                hwaddr offset, char * const buf,
> +                                hwaddr len, const bool is_write)
> +{
> +    uint8_t *ptr =3D (uint8_t *)buf;
> +    uint8_t *ram_ptr =3D NULL;
> +    bool release_lock =3D false;
> +    MemoryRegionSection section =3D { 0 };
> +    MemoryRegion *mr =3D NULL;
> +    int access_size;
> +    hwaddr size =3D 0;
> +    MemTxResult result;
> +    uint64_t val;
> +
> +    section =3D memory_region_find(pci_dev->io_regions[pci_bar].memory,
> +                                 offset, len);
> +
> +    if (!section.mr) {
> +        return 0;
> +    }
> +
> +    mr =3D section.mr;
> +
> +    if (is_write && mr->readonly) {
> +        warn_report("vfu: attempting to write to readonly region in "
> +                    "bar %d - [0x%"PRIx64" - 0x%"PRIx64"]",
> +                    pci_bar, offset, (offset + len));
> +        return 0;
> +    }
> +
> +    if (memory_access_is_direct(mr, is_write)) {
> +        /**
> +         * Some devices expose a PCI expansion ROM, which could be buffer
> +         * based as compared to other regions which are primarily based =
on
> +         * MemoryRegionOps. memory_region_find() would already check
> +         * for buffer overflow, we don't need to repeat it here.
> +         */
> +        ram_ptr =3D memory_region_get_ram_ptr(mr);
> +
> +        size =3D len;
> +
> +        if (is_write) {
> +            memcpy(ram_ptr, buf, size);
> +        } else {
> +            memcpy(buf, ram_ptr, size);
> +        }
> +
> +        goto exit;
> +    }
> +
> +    while (len > 0) {
> +        /**
> +         * The read/write logic used below is similar to the ones in
> +         * flatview_read/write_continue()
> +         */
> +        release_lock =3D prepare_mmio_access(mr);
> +
> +        access_size =3D memory_access_size(mr, len, offset);
> +
> +        if (is_write) {
> +            val =3D ldn_he_p(ptr, access_size);
> +
> +            result =3D memory_region_dispatch_write(mr, offset, val,
> +                                                  size_memop(access_size=
),
> +                                                  MEMTXATTRS_UNSPECIFIED=
);
> +        } else {
> +            result =3D memory_region_dispatch_read(mr, offset, &val,
> +                                                 size_memop(access_size),
> +                                                 MEMTXATTRS_UNSPECIFIED);
> +
> +            stn_he_p(ptr, access_size, val);
> +        }
> +
> +        if (release_lock) {
> +            qemu_mutex_unlock_iothread();
> +            release_lock =3D false;
> +        }
> +
> +        if (result !=3D MEMTX_OK) {
> +            warn_report("vfu: failed to %s 0x%"PRIx64"",
> +                        is_write ? "write to" : "read from",
> +                        (offset - size));
> +
> +            goto exit;
> +        }
> +
> +        len -=3D access_size;
> +        size +=3D access_size;
> +        ptr +=3D access_size;
> +        offset +=3D access_size;
> +    }
> +
> +exit:
> +    memory_region_unref(mr);
> +
> +    return size;
> +}
> +
> +/**
> + * VFU_OBJECT_BAR_HANDLER - macro for defining handlers for PCI BARs.
> + *
> + * To create handler for BAR number 2, VFU_OBJECT_BAR_HANDLER(2) would
> + * define vfu_object_bar2_handler
> + */
> +#define VFU_OBJECT_BAR_HANDLER(BAR_NO)                                  =
       \
> +    static ssize_t vfu_object_bar##BAR_NO##_handler(vfu_ctx_t *vfu_ctx, =
       \
> +                                        char * const buf, size_t count, =
       \
> +                                        loff_t offset, const bool is_wri=
te)    \
> +    {                                                                   =
       \
> +        VfuObject *o =3D vfu_get_private(vfu_ctx);                      =
         \
> +        PCIDevice *pci_dev =3D o->pci_dev;                              =
         \
> +                                                                        =
       \
> +        return vfu_object_bar_rw(pci_dev, BAR_NO, offset,               =
       \
> +                                 buf, count, is_write);                 =
       \
> +    }                                                                   =
       \
> +
> +VFU_OBJECT_BAR_HANDLER(0)
> +VFU_OBJECT_BAR_HANDLER(1)
> +VFU_OBJECT_BAR_HANDLER(2)
> +VFU_OBJECT_BAR_HANDLER(3)
> +VFU_OBJECT_BAR_HANDLER(4)
> +VFU_OBJECT_BAR_HANDLER(5)
> +VFU_OBJECT_BAR_HANDLER(6)
> +
> +static vfu_region_access_cb_t *vfu_object_bar_handlers[PCI_NUM_REGIONS] =
=3D {
> +    &vfu_object_bar0_handler,
> +    &vfu_object_bar1_handler,
> +    &vfu_object_bar2_handler,
> +    &vfu_object_bar3_handler,
> +    &vfu_object_bar4_handler,
> +    &vfu_object_bar5_handler,
> +    &vfu_object_bar6_handler,
> +};
> +
> +/**
> + * vfu_object_register_bars - Identify active BAR regions of pdev and se=
tup
> + *                            callbacks to handle read/write accesses
> + */
> +static void vfu_object_register_bars(vfu_ctx_t *vfu_ctx, PCIDevice *pdev)
> +{
> +    int flags =3D VFU_REGION_FLAG_RW;
> +    int i;
> +
> +    for (i =3D 0; i < PCI_NUM_REGIONS; i++) {
> +        if (!pdev->io_regions[i].size) {
> +            continue;
> +        }
> +
> +        if ((i =3D=3D VFU_PCI_DEV_ROM_REGION_IDX) ||
> +            pdev->io_regions[i].memory->readonly) {
> +            flags &=3D ~VFU_REGION_FLAG_WRITE;
> +        }
> +
> +        vfu_setup_region(vfu_ctx, VFU_PCI_DEV_BAR0_REGION_IDX + i,
> +                         (size_t)pdev->io_regions[i].size,
> +                         vfu_object_bar_handlers[i],
> +                         flags, NULL, 0, -1, 0);
> +
> +        trace_vfu_bar_register(i, pdev->io_regions[i].addr,
> +                               pdev->io_regions[i].size);
> +    }
> +}
> +
>  /*
>   * TYPE_VFU_OBJECT depends on the availability of the 'socket' and 'devi=
ce'
>   * properties. It also depends on devices instantiated in QEMU. These
> @@ -393,6 +557,8 @@ static void vfu_object_init_ctx(VfuObject *o, Error *=
*errp)
>          goto fail;
>      }
> =20
> +    vfu_object_register_bars(o->vfu_ctx, o->pci_dev);
> +
>      ret =3D vfu_realize_ctx(o->vfu_ctx);
>      if (ret < 0) {
>          error_setg(errp, "vfu: Failed to realize device %s- %s",
> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> index dddf70edf5..3188d4e143 100644
> --- a/softmmu/physmem.c
> +++ b/softmmu/physmem.c
> @@ -2717,7 +2717,7 @@ void memory_region_flush_rom_device(MemoryRegion *m=
r, hwaddr addr, hwaddr size)
>      invalidate_and_set_dirty(mr, addr, size);
>  }
> =20
> -static int memory_access_size(MemoryRegion *mr, unsigned l, hwaddr addr)
> +int memory_access_size(MemoryRegion *mr, unsigned l, hwaddr addr)
>  {
>      unsigned access_size_max =3D mr->ops->valid.max_access_size;
> =20
> @@ -2744,7 +2744,7 @@ static int memory_access_size(MemoryRegion *mr, uns=
igned l, hwaddr addr)
>      return l;
>  }
> =20
> -static bool prepare_mmio_access(MemoryRegion *mr)
> +bool prepare_mmio_access(MemoryRegion *mr)
>  {
>      bool release_lock =3D false;
> =20
> diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_f=
uzz.c
> index dd7e25851c..77547fc1d8 100644
> --- a/tests/qtest/fuzz/generic_fuzz.c
> +++ b/tests/qtest/fuzz/generic_fuzz.c
> @@ -144,7 +144,7 @@ static void *pattern_alloc(pattern p, size_t len)
>      return buf;
>  }
> =20
> -static int memory_access_size(MemoryRegion *mr, unsigned l, hwaddr addr)
> +static int fuzz_memory_access_size(MemoryRegion *mr, unsigned l, hwaddr =
addr)
>  {
>      unsigned access_size_max =3D mr->ops->valid.max_access_size;
> =20
> @@ -242,11 +242,12 @@ void fuzz_dma_read_cb(size_t addr, size_t len, Memo=
ryRegion *mr)
> =20
>          /*
>           *  If mr1 isn't RAM, address_space_translate doesn't update l. =
Use
> -         *  memory_access_size to identify the number of bytes that it i=
s safe
> -         *  to write without accidentally writing to another MemoryRegio=
n.
> +         *  fuzz_memory_access_size to identify the number of bytes that=
 it
> +         *  is safe to write without accidentally writing to another
> +         *  MemoryRegion.
>           */
>          if (!memory_region_is_ram(mr1)) {
> -            l =3D memory_access_size(mr1, l, addr1);
> +            l =3D fuzz_memory_access_size(mr1, l, addr1);
>          }
>          if (memory_region_is_ram(mr1) ||
>              memory_region_is_romd(mr1) ||
> diff --git a/hw/remote/trace-events b/hw/remote/trace-events
> index f945c7e33b..847d50d88f 100644
> --- a/hw/remote/trace-events
> +++ b/hw/remote/trace-events
> @@ -9,3 +9,6 @@ vfu_cfg_read(uint32_t offset, uint32_t val) "vfu: cfg: 0x=
%u -> 0x%x"
>  vfu_cfg_write(uint32_t offset, uint32_t val) "vfu: cfg: 0x%u <- 0x%x"
>  vfu_dma_register(uint64_t gpa, size_t len) "vfu: registering GPA 0x%"PRI=
x64", %zu bytes"
>  vfu_dma_unregister(uint64_t gpa) "vfu: unregistering GPA 0x%"PRIx64""
> +vfu_bar_register(int i, uint64_t addr, uint64_t size) "vfu: BAR %d: addr=
 0x%"PRIx64" size 0x%"PRIx64""
> +vfu_bar_rw_enter(const char *op, uint64_t addr) "vfu: %s request for BAR=
 address 0x%"PRIx64""
> +vfu_bar_rw_exit(const char *op, uint64_t addr) "vfu: Finished %s of BAR =
address 0x%"PRIx64""
> --=20
> 2.20.1
>=20

--XxKlpwY+ujfl+MAo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIUwyIACgkQnKSrs4Gr
c8hEVQgAr6rzbTXOESz3iW9W2jaOQhcnxIKRpG4mDk7tMztxBArM6k0UXiY9mxBL
sJTaryQOj+ddKiT2ZlzCEqs9DocVaJSzQsj8x0bR5I6ASWElfg6qZuXxfxTQ+cGl
DqNSndSBJlmOC8+22YqhV28ZnuGUqHZ4ElpVFe0pynN0KVz8qm05XCwN1K/wP6+3
cGjmMk4Klr5jkTzcBi6hxF1HQipBMtwNIVXpOdgYLl9Dc/NfrBBuOnKyrMwqQ3cW
nBQ7SvBS0y3BFEnWl6BP0dqJZA+VPshkM28VWmq+GnI4E0q9oxJdzooPy0YA8t88
mKNc2x0Z0l2WMHfZv4wGN/cO4/96Uw==
=wPcn
-----END PGP SIGNATURE-----

--XxKlpwY+ujfl+MAo--


