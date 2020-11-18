Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDAAC2B75EE
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 06:31:00 +0100 (CET)
Received: from localhost ([::1]:37688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfG3X-0005pX-S3
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 00:30:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kfG0h-0004HL-9p; Wed, 18 Nov 2020 00:28:03 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:37001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kfG0d-0004m3-Is; Wed, 18 Nov 2020 00:28:02 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4CbWXv5csFz9sSn; Wed, 18 Nov 2020 16:27:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1605677263;
 bh=yC1FLYNcw8cmS6XYvpZFW3/4np1mifgmhKBE99npYCU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EPD0sObTNaQn4+aF9Jzq161tT+DhVBSgh7Als1O2KWKdSqst/KuOEU+dblqDYPtGw
 FuCtZZmBA1Qimaj0MZuYg9HYLsyTtgSlmWRH7uhRYjGy7tuarvE0AcmdxDbtu4Ik2C
 9B7ivHnocI5AJQNIg9mc7Op4e2xgx5zKmQHnfUHQ=
Date: Wed, 18 Nov 2020 16:22:35 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>
Subject: Re: [PATCH v3 2/5] memory: Add IOMMUTLBEvent
Message-ID: <20201118052235.GB411463@yekko.fritz.box>
References: <20201116165506.31315-1-eperezma@redhat.com>
 <20201116165506.31315-3-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="K8nIJk4ghYZn606h"
Content-Disposition: inline
In-Reply-To: <20201116165506.31315-3-eperezma@redhat.com>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Matthew Rosato <mjrosato@linux.ibm.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Juan Quintela <quintela@redhat.com>,
 David Hildenbrand <david@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
 Avi Kivity <avi@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Yan Zhao <yan.y.zhao@intel.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Auger <eric.auger@redhat.com>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Richard Henderson <rth@twiddle.net>, Cornelia Huck <cohuck@redhat.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--K8nIJk4ghYZn606h
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2020 at 05:55:03PM +0100, Eugenio P=E9rez wrote:
> This way we can tell between regular IOMMUTLBEntry (entry of IOMMU
> hardware) and notifications.
>=20
> In the notifications, we set explicitly if it is a MAPs or an UNMAP,
> instead of trusting in entry permissions to differentiate them.
>=20
> Signed-off-by: Eugenio P=E9rez <eperezma@redhat.com>
> Reviewed-by: Peter Xu <peterx@redhat.com>
> Reviewed-by: Juan Quintela <quintela@redhat.com>
> Acked-by: Jason Wang <jasowang@redhat.com>

ppc parts
Acked-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  include/exec/memory.h    | 27 ++++++------
>  hw/arm/smmu-common.c     | 13 +++---
>  hw/arm/smmuv3.c          | 13 +++---
>  hw/i386/intel_iommu.c    | 88 ++++++++++++++++++++++------------------
>  hw/misc/tz-mpc.c         | 32 ++++++++-------
>  hw/ppc/spapr_iommu.c     | 15 +++----
>  hw/s390x/s390-pci-inst.c | 27 +++++++-----
>  hw/virtio/virtio-iommu.c | 30 +++++++-------
>  softmmu/memory.c         | 20 ++++-----
>  9 files changed, 143 insertions(+), 122 deletions(-)
>=20
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index d8456ccf52..e86b5e92da 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -116,6 +116,11 @@ struct IOMMUNotifier {
>  };
>  typedef struct IOMMUNotifier IOMMUNotifier;
> =20
> +typedef struct IOMMUTLBEvent {
> +    IOMMUNotifierFlag type;
> +    IOMMUTLBEntry entry;
> +} IOMMUTLBEvent;
> +
>  /* RAM is pre-allocated and passed into qemu_ram_alloc_from_ptr */
>  #define RAM_PREALLOC   (1 << 0)
> =20
> @@ -1326,24 +1331,18 @@ uint64_t memory_region_iommu_get_min_page_size(IO=
MMUMemoryRegion *iommu_mr);
>  /**
>   * memory_region_notify_iommu: notify a change in an IOMMU translation e=
ntry.
>   *
> - * The notification type will be decided by entry.perm bits:
> - *
> - * - For UNMAP (cache invalidation) notifies: set entry.perm to IOMMU_NO=
NE.
> - * - For MAP (newly added entry) notifies: set entry.perm to the
> - *   permission of the page (which is definitely !IOMMU_NONE).
> - *
>   * Note: for any IOMMU implementation, an in-place mapping change
>   * should be notified with an UNMAP followed by a MAP.
>   *
>   * @iommu_mr: the memory region that was changed
>   * @iommu_idx: the IOMMU index for the translation table which has chang=
ed
> - * @entry: the new entry in the IOMMU translation table.  The entry
> - *         replaces all old entries for the same virtual I/O address ran=
ge.
> - *         Deleted entries have .@perm =3D=3D 0.
> + * @event: TLB event with the new entry in the IOMMU translation table.
> + *         The entry replaces all old entries for the same virtual I/O a=
ddress
> + *         range.
>   */
>  void memory_region_notify_iommu(IOMMUMemoryRegion *iommu_mr,
>                                  int iommu_idx,
> -                                IOMMUTLBEntry entry);
> +                                IOMMUTLBEvent event);
> =20
>  /**
>   * memory_region_notify_iommu_one: notify a change in an IOMMU translati=
on
> @@ -1353,12 +1352,12 @@ void memory_region_notify_iommu(IOMMUMemoryRegion=
 *iommu_mr,
>   * notifies a specific notifier, not all of them.
>   *
>   * @notifier: the notifier to be notified
> - * @entry: the new entry in the IOMMU translation table.  The entry
> - *         replaces all old entries for the same virtual I/O address ran=
ge.
> - *         Deleted entries have .@perm =3D=3D 0.
> + * @event: TLB event with the new entry in the IOMMU translation table.
> + *         The entry replaces all old entries for the same virtual I/O a=
ddress
> + *         range.
>   */
>  void memory_region_notify_iommu_one(IOMMUNotifier *notifier,
> -                              IOMMUTLBEntry *entry);
> +                                    IOMMUTLBEvent *event);
> =20
>  /**
>   * memory_region_register_iommu_notifier: register a notifier for change=
s to
> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> index 88d2c454f0..405d5c5325 100644
> --- a/hw/arm/smmu-common.c
> +++ b/hw/arm/smmu-common.c
> @@ -465,14 +465,15 @@ IOMMUMemoryRegion *smmu_iommu_mr(SMMUState *s, uint=
32_t sid)
>  /* Unmap the whole notifier's range */
>  static void smmu_unmap_notifier_range(IOMMUNotifier *n)
>  {
> -    IOMMUTLBEntry entry;
> +    IOMMUTLBEvent event;
> =20
> -    entry.target_as =3D &address_space_memory;
> -    entry.iova =3D n->start;
> -    entry.perm =3D IOMMU_NONE;
> -    entry.addr_mask =3D n->end - n->start;
> +    event.type =3D IOMMU_NOTIFIER_UNMAP;
> +    event.entry.target_as =3D &address_space_memory;
> +    event.entry.iova =3D n->start;
> +    event.entry.perm =3D IOMMU_NONE;
> +    event.entry.addr_mask =3D n->end - n->start;
> =20
> -    memory_region_notify_iommu_one(n, &entry);
> +    memory_region_notify_iommu_one(n, &event);
>  }
> =20
>  /* Unmap all notifiers attached to @mr */
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 273f5f7dce..bbca0e9f20 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -800,7 +800,7 @@ static void smmuv3_notify_iova(IOMMUMemoryRegion *mr,
>                                 uint8_t tg, uint64_t num_pages)
>  {
>      SMMUDevice *sdev =3D container_of(mr, SMMUDevice, iommu);
> -    IOMMUTLBEntry entry;
> +    IOMMUTLBEvent event;
>      uint8_t granule =3D tg;
> =20
>      if (!tg) {
> @@ -823,12 +823,13 @@ static void smmuv3_notify_iova(IOMMUMemoryRegion *m=
r,
>          granule =3D tt->granule_sz;
>      }
> =20
> -    entry.target_as =3D &address_space_memory;
> -    entry.iova =3D iova;
> -    entry.addr_mask =3D num_pages * (1 << granule) - 1;
> -    entry.perm =3D IOMMU_NONE;
> +    event.type =3D IOMMU_NOTIFIER_UNMAP;
> +    event.entry.target_as =3D &address_space_memory;
> +    event.entry.iova =3D iova;
> +    event.entry.addr_mask =3D num_pages * (1 << granule) - 1;
> +    event.entry.perm =3D IOMMU_NONE;
> =20
> -    memory_region_notify_iommu_one(n, &entry);
> +    memory_region_notify_iommu_one(n, &event);
>  }
> =20
>  /* invalidate an asid/iova range tuple in all mr's */
> diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
> index 067593b9e4..56180b1c43 100644
> --- a/hw/i386/intel_iommu.c
> +++ b/hw/i386/intel_iommu.c
> @@ -1073,7 +1073,7 @@ static int vtd_iova_to_slpte(IntelIOMMUState *s, VT=
DContextEntry *ce,
>      }
>  }
> =20
> -typedef int (*vtd_page_walk_hook)(IOMMUTLBEntry *entry, void *private);
> +typedef int (*vtd_page_walk_hook)(IOMMUTLBEvent *event, void *private);
> =20
>  /**
>   * Constant information used during page walking
> @@ -1094,11 +1094,12 @@ typedef struct {
>      uint16_t domain_id;
>  } vtd_page_walk_info;
> =20
> -static int vtd_page_walk_one(IOMMUTLBEntry *entry, vtd_page_walk_info *i=
nfo)
> +static int vtd_page_walk_one(IOMMUTLBEvent *event, vtd_page_walk_info *i=
nfo)
>  {
>      VTDAddressSpace *as =3D info->as;
>      vtd_page_walk_hook hook_fn =3D info->hook_fn;
>      void *private =3D info->private;
> +    IOMMUTLBEntry *entry =3D &event->entry;
>      DMAMap target =3D {
>          .iova =3D entry->iova,
>          .size =3D entry->addr_mask,
> @@ -1107,7 +1108,7 @@ static int vtd_page_walk_one(IOMMUTLBEntry *entry, =
vtd_page_walk_info *info)
>      };
>      DMAMap *mapped =3D iova_tree_find(as->iova_tree, &target);
> =20
> -    if (entry->perm =3D=3D IOMMU_NONE && !info->notify_unmap) {
> +    if (event->type =3D=3D IOMMU_NOTIFIER_UNMAP && !info->notify_unmap) {
>          trace_vtd_page_walk_one_skip_unmap(entry->iova, entry->addr_mask=
);
>          return 0;
>      }
> @@ -1115,7 +1116,7 @@ static int vtd_page_walk_one(IOMMUTLBEntry *entry, =
vtd_page_walk_info *info)
>      assert(hook_fn);
> =20
>      /* Update local IOVA mapped ranges */
> -    if (entry->perm) {
> +    if (event->type =3D=3D IOMMU_NOTIFIER_MAP) {
>          if (mapped) {
>              /* If it's exactly the same translation, skip */
>              if (!memcmp(mapped, &target, sizeof(target))) {
> @@ -1141,19 +1142,21 @@ static int vtd_page_walk_one(IOMMUTLBEntry *entry=
, vtd_page_walk_info *info)
>                  int ret;
> =20
>                  /* Emulate an UNMAP */
> +                event->type =3D IOMMU_NOTIFIER_UNMAP;
>                  entry->perm =3D IOMMU_NONE;
>                  trace_vtd_page_walk_one(info->domain_id,
>                                          entry->iova,
>                                          entry->translated_addr,
>                                          entry->addr_mask,
>                                          entry->perm);
> -                ret =3D hook_fn(entry, private);
> +                ret =3D hook_fn(event, private);
>                  if (ret) {
>                      return ret;
>                  }
>                  /* Drop any existing mapping */
>                  iova_tree_remove(as->iova_tree, &target);
> -                /* Recover the correct permission */
> +                /* Recover the correct type */
> +                event->type =3D IOMMU_NOTIFIER_MAP;
>                  entry->perm =3D cache_perm;
>              }
>          }
> @@ -1170,7 +1173,7 @@ static int vtd_page_walk_one(IOMMUTLBEntry *entry, =
vtd_page_walk_info *info)
>      trace_vtd_page_walk_one(info->domain_id, entry->iova,
>                              entry->translated_addr, entry->addr_mask,
>                              entry->perm);
> -    return hook_fn(entry, private);
> +    return hook_fn(event, private);
>  }
> =20
>  /**
> @@ -1191,7 +1194,7 @@ static int vtd_page_walk_level(dma_addr_t addr, uin=
t64_t start,
>      uint32_t offset;
>      uint64_t slpte;
>      uint64_t subpage_size, subpage_mask;
> -    IOMMUTLBEntry entry;
> +    IOMMUTLBEvent event;
>      uint64_t iova =3D start;
>      uint64_t iova_next;
>      int ret =3D 0;
> @@ -1245,13 +1248,15 @@ static int vtd_page_walk_level(dma_addr_t addr, u=
int64_t start,
>               *
>               * In either case, we send an IOTLB notification down.
>               */
> -            entry.target_as =3D &address_space_memory;
> -            entry.iova =3D iova & subpage_mask;
> -            entry.perm =3D IOMMU_ACCESS_FLAG(read_cur, write_cur);
> -            entry.addr_mask =3D ~subpage_mask;
> +            event.entry.target_as =3D &address_space_memory;
> +            event.entry.iova =3D iova & subpage_mask;
> +            event.entry.perm =3D IOMMU_ACCESS_FLAG(read_cur, write_cur);
> +            event.entry.addr_mask =3D ~subpage_mask;
>              /* NOTE: this is only meaningful if entry_valid =3D=3D true =
*/
> -            entry.translated_addr =3D vtd_get_slpte_addr(slpte, info->aw=
);
> -            ret =3D vtd_page_walk_one(&entry, info);
> +            event.entry.translated_addr =3D vtd_get_slpte_addr(slpte, in=
fo->aw);
> +            event.type =3D event.entry.perm ? IOMMU_NOTIFIER_MAP :
> +                                            IOMMU_NOTIFIER_UNMAP;
> +            ret =3D vtd_page_walk_one(&event, info);
>          }
> =20
>          if (ret < 0) {
> @@ -1430,10 +1435,10 @@ static int vtd_dev_to_context_entry(IntelIOMMUSta=
te *s, uint8_t bus_num,
>      return 0;
>  }
> =20
> -static int vtd_sync_shadow_page_hook(IOMMUTLBEntry *entry,
> +static int vtd_sync_shadow_page_hook(IOMMUTLBEvent *event,
>                                       void *private)
>  {
> -    memory_region_notify_iommu((IOMMUMemoryRegion *)private, 0, *entry);
> +    memory_region_notify_iommu(private, 0, *event);
>      return 0;
>  }
> =20
> @@ -1993,14 +1998,17 @@ static void vtd_iotlb_page_invalidate_notify(Inte=
lIOMMUState *s,
>                   * page tables.  We just deliver the PSI down to
>                   * invalidate caches.
>                   */
> -                IOMMUTLBEntry entry =3D {
> -                    .target_as =3D &address_space_memory,
> -                    .iova =3D addr,
> -                    .translated_addr =3D 0,
> -                    .addr_mask =3D size - 1,
> -                    .perm =3D IOMMU_NONE,
> +                IOMMUTLBEvent event =3D {
> +                    .type =3D IOMMU_NOTIFIER_UNMAP,
> +                    .entry =3D {
> +                        .target_as =3D &address_space_memory,
> +                        .iova =3D addr,
> +                        .translated_addr =3D 0,
> +                        .addr_mask =3D size - 1,
> +                        .perm =3D IOMMU_NONE,
> +                    },
>                  };
> -                memory_region_notify_iommu(&vtd_as->iommu, 0, entry);
> +                memory_region_notify_iommu(&vtd_as->iommu, 0, event);
>              }
>          }
>      }
> @@ -2412,7 +2420,7 @@ static bool vtd_process_device_iotlb_desc(IntelIOMM=
UState *s,
>                                            VTDInvDesc *inv_desc)
>  {
>      VTDAddressSpace *vtd_dev_as;
> -    IOMMUTLBEntry entry;
> +    IOMMUTLBEvent event;
>      struct VTDBus *vtd_bus;
>      hwaddr addr;
>      uint64_t sz;
> @@ -2460,12 +2468,13 @@ static bool vtd_process_device_iotlb_desc(IntelIO=
MMUState *s,
>          sz =3D VTD_PAGE_SIZE;
>      }
> =20
> -    entry.target_as =3D &vtd_dev_as->as;
> -    entry.addr_mask =3D sz - 1;
> -    entry.iova =3D addr;
> -    entry.perm =3D IOMMU_NONE;
> -    entry.translated_addr =3D 0;
> -    memory_region_notify_iommu(&vtd_dev_as->iommu, 0, entry);
> +    event.type =3D IOMMU_NOTIFIER_UNMAP;
> +    event.entry.target_as =3D &vtd_dev_as->as;
> +    event.entry.addr_mask =3D sz - 1;
> +    event.entry.iova =3D addr;
> +    event.entry.perm =3D IOMMU_NONE;
> +    event.entry.translated_addr =3D 0;
> +    memory_region_notify_iommu(&vtd_dev_as->iommu, 0, event);
> =20
>  done:
>      return true;
> @@ -3485,19 +3494,20 @@ static void vtd_address_space_unmap(VTDAddressSpa=
ce *as, IOMMUNotifier *n)
>      size =3D remain =3D end - start + 1;
> =20
>      while (remain >=3D VTD_PAGE_SIZE) {
> -        IOMMUTLBEntry entry;
> +        IOMMUTLBEvent event;
>          uint64_t mask =3D get_naturally_aligned_size(start, remain, s->a=
w_bits);
> =20
>          assert(mask);
> =20
> -        entry.iova =3D start;
> -        entry.addr_mask =3D mask - 1;
> -        entry.target_as =3D &address_space_memory;
> -        entry.perm =3D IOMMU_NONE;
> +        event.type =3D IOMMU_NOTIFIER_UNMAP;
> +        event.entry.iova =3D start;
> +        event.entry.addr_mask =3D mask - 1;
> +        event.entry.target_as =3D &address_space_memory;
> +        event.entry.perm =3D IOMMU_NONE;
>          /* This field is meaningless for unmap */
> -        entry.translated_addr =3D 0;
> +        event.entry.translated_addr =3D 0;
> =20
> -        memory_region_notify_iommu_one(n, &entry);
> +        memory_region_notify_iommu_one(n, &event);
> =20
>          start +=3D mask;
>          remain -=3D mask;
> @@ -3533,9 +3543,9 @@ static void vtd_address_space_refresh_all(IntelIOMM=
UState *s)
>      vtd_switch_address_space_all(s);
>  }
> =20
> -static int vtd_replay_hook(IOMMUTLBEntry *entry, void *private)
> +static int vtd_replay_hook(IOMMUTLBEvent *event, void *private)
>  {
> -    memory_region_notify_iommu_one((IOMMUNotifier *)private, entry);
> +    memory_region_notify_iommu_one(private, event);
>      return 0;
>  }
> =20
> diff --git a/hw/misc/tz-mpc.c b/hw/misc/tz-mpc.c
> index 98f151237f..30481e1c90 100644
> --- a/hw/misc/tz-mpc.c
> +++ b/hw/misc/tz-mpc.c
> @@ -82,8 +82,10 @@ static void tz_mpc_iommu_notify(TZMPC *s, uint32_t lut=
idx,
>      /* Called when the LUT word at lutidx has changed from oldlut to new=
lut;
>       * must call the IOMMU notifiers for the changed blocks.
>       */
> -    IOMMUTLBEntry entry =3D {
> -        .addr_mask =3D s->blocksize - 1,
> +    IOMMUTLBEvent event =3D {
> +        .entry =3D {
> +            .addr_mask =3D s->blocksize - 1,
> +        }
>      };
>      hwaddr addr =3D lutidx * s->blocksize * 32;
>      int i;
> @@ -100,26 +102,28 @@ static void tz_mpc_iommu_notify(TZMPC *s, uint32_t =
lutidx,
>          block_is_ns =3D newlut & (1 << i);
> =20
>          trace_tz_mpc_iommu_notify(addr);
> -        entry.iova =3D addr;
> -        entry.translated_addr =3D addr;
> +        event.entry.iova =3D addr;
> +        event.entry.translated_addr =3D addr;
> =20
> -        entry.perm =3D IOMMU_NONE;
> -        memory_region_notify_iommu(&s->upstream, IOMMU_IDX_S, entry);
> -        memory_region_notify_iommu(&s->upstream, IOMMU_IDX_NS, entry);
> +        event.type =3D IOMMU_NOTIFIER_UNMAP;
> +        event.entry.perm =3D IOMMU_NONE;
> +        memory_region_notify_iommu(&s->upstream, IOMMU_IDX_S, event);
> +        memory_region_notify_iommu(&s->upstream, IOMMU_IDX_NS, event);
> =20
> -        entry.perm =3D IOMMU_RW;
> +        event.type =3D IOMMU_NOTIFIER_MAP;
> +        event.entry.perm =3D IOMMU_RW;
>          if (block_is_ns) {
> -            entry.target_as =3D &s->blocked_io_as;
> +            event.entry.target_as =3D &s->blocked_io_as;
>          } else {
> -            entry.target_as =3D &s->downstream_as;
> +            event.entry.target_as =3D &s->downstream_as;
>          }
> -        memory_region_notify_iommu(&s->upstream, IOMMU_IDX_S, entry);
> +        memory_region_notify_iommu(&s->upstream, IOMMU_IDX_S, event);
>          if (block_is_ns) {
> -            entry.target_as =3D &s->downstream_as;
> +            event.entry.target_as =3D &s->downstream_as;
>          } else {
> -            entry.target_as =3D &s->blocked_io_as;
> +            event.entry.target_as =3D &s->blocked_io_as;
>          }
> -        memory_region_notify_iommu(&s->upstream, IOMMU_IDX_NS, entry);
> +        memory_region_notify_iommu(&s->upstream, IOMMU_IDX_NS, event);
>      }
>  }
> =20
> diff --git a/hw/ppc/spapr_iommu.c b/hw/ppc/spapr_iommu.c
> index 0fecabc135..8e237d0397 100644
> --- a/hw/ppc/spapr_iommu.c
> +++ b/hw/ppc/spapr_iommu.c
> @@ -445,7 +445,7 @@ static void spapr_tce_reset(DeviceState *dev)
>  static target_ulong put_tce_emu(SpaprTceTable *tcet, target_ulong ioba,
>                                  target_ulong tce)
>  {
> -    IOMMUTLBEntry entry;
> +    IOMMUTLBEvent event;
>      hwaddr page_mask =3D IOMMU_PAGE_MASK(tcet->page_shift);
>      unsigned long index =3D (ioba - tcet->bus_offset) >> tcet->page_shif=
t;
> =20
> @@ -457,12 +457,13 @@ static target_ulong put_tce_emu(SpaprTceTable *tcet=
, target_ulong ioba,
> =20
>      tcet->table[index] =3D tce;
> =20
> -    entry.target_as =3D &address_space_memory,
> -    entry.iova =3D (ioba - tcet->bus_offset) & page_mask;
> -    entry.translated_addr =3D tce & page_mask;
> -    entry.addr_mask =3D ~page_mask;
> -    entry.perm =3D spapr_tce_iommu_access_flags(tce);
> -    memory_region_notify_iommu(&tcet->iommu, 0, entry);
> +    event.entry.target_as =3D &address_space_memory,
> +    event.entry.iova =3D (ioba - tcet->bus_offset) & page_mask;
> +    event.entry.translated_addr =3D tce & page_mask;
> +    event.entry.addr_mask =3D ~page_mask;
> +    event.entry.perm =3D spapr_tce_iommu_access_flags(tce);
> +    event.type =3D event.entry.perm ? IOMMU_NOTIFIER_MAP : IOMMU_NOTIFIE=
R_UNMAP;
> +    memory_region_notify_iommu(&tcet->iommu, 0, event);
> =20
>      return H_SUCCESS;
>  }
> diff --git a/hw/s390x/s390-pci-inst.c b/hw/s390x/s390-pci-inst.c
> index 58cd041d17..d7caeeea0e 100644
> --- a/hw/s390x/s390-pci-inst.c
> +++ b/hw/s390x/s390-pci-inst.c
> @@ -590,15 +590,18 @@ static uint32_t s390_pci_update_iotlb(S390PCIIOMMU =
*iommu,
>                                        S390IOTLBEntry *entry)
>  {
>      S390IOTLBEntry *cache =3D g_hash_table_lookup(iommu->iotlb, &entry->=
iova);
> -    IOMMUTLBEntry notify =3D {
> -        .target_as =3D &address_space_memory,
> -        .iova =3D entry->iova,
> -        .translated_addr =3D entry->translated_addr,
> -        .perm =3D entry->perm,
> -        .addr_mask =3D ~PAGE_MASK,
> +    IOMMUTLBEvent event =3D {
> +        .type =3D entry->perm ? IOMMU_NOTIFIER_MAP : IOMMU_NOTIFIER_UNMA=
P,
> +        .entry =3D {
> +            .target_as =3D &address_space_memory,
> +            .iova =3D entry->iova,
> +            .translated_addr =3D entry->translated_addr,
> +            .perm =3D entry->perm,
> +            .addr_mask =3D ~PAGE_MASK,
> +        },
>      };
> =20
> -    if (entry->perm =3D=3D IOMMU_NONE) {
> +    if (event.type =3D=3D IOMMU_NOTIFIER_UNMAP) {
>          if (!cache) {
>              goto out;
>          }
> @@ -611,9 +614,11 @@ static uint32_t s390_pci_update_iotlb(S390PCIIOMMU *=
iommu,
>                  goto out;
>              }
> =20
> -            notify.perm =3D IOMMU_NONE;
> -            memory_region_notify_iommu(&iommu->iommu_mr, 0, notify);
> -            notify.perm =3D entry->perm;
> +            event.type =3D IOMMU_NOTIFIER_UNMAP;
> +            event.entry.perm =3D IOMMU_NONE;
> +            memory_region_notify_iommu(&iommu->iommu_mr, 0, event);
> +            event.type =3D IOMMU_NOTIFIER_MAP;
> +            event.entry.perm =3D entry->perm;
>          }
> =20
>          cache =3D g_new(S390IOTLBEntry, 1);
> @@ -625,7 +630,7 @@ static uint32_t s390_pci_update_iotlb(S390PCIIOMMU *i=
ommu,
>          dec_dma_avail(iommu);
>      }
> =20
> -    memory_region_notify_iommu(&iommu->iommu_mr, 0, notify);
> +    memory_region_notify_iommu(&iommu->iommu_mr, 0, event);
> =20
>  out:
>      return iommu->dma_limit ? iommu->dma_limit->avail : 1;
> diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
> index fc5c75d693..cea8811295 100644
> --- a/hw/virtio/virtio-iommu.c
> +++ b/hw/virtio/virtio-iommu.c
> @@ -129,7 +129,7 @@ static void virtio_iommu_notify_map(IOMMUMemoryRegion=
 *mr, hwaddr virt_start,
>                                      hwaddr virt_end, hwaddr paddr,
>                                      uint32_t flags)
>  {
> -    IOMMUTLBEntry entry;
> +    IOMMUTLBEvent event;
>      IOMMUAccessFlags perm =3D IOMMU_ACCESS_FLAG(flags & VIRTIO_IOMMU_MAP=
_F_READ,
>                                                flags & VIRTIO_IOMMU_MAP_F=
_WRITE);
> =20
> @@ -141,19 +141,20 @@ static void virtio_iommu_notify_map(IOMMUMemoryRegi=
on *mr, hwaddr virt_start,
>      trace_virtio_iommu_notify_map(mr->parent_obj.name, virt_start, virt_=
end,
>                                    paddr, perm);
> =20
> -    entry.target_as =3D &address_space_memory;
> -    entry.addr_mask =3D virt_end - virt_start;
> -    entry.iova =3D virt_start;
> -    entry.perm =3D perm;
> -    entry.translated_addr =3D paddr;
> +    event.type =3D IOMMU_NOTIFIER_MAP;
> +    event.entry.target_as =3D &address_space_memory;
> +    event.entry.addr_mask =3D virt_end - virt_start;
> +    event.entry.iova =3D virt_start;
> +    event.entry.perm =3D perm;
> +    event.entry.translated_addr =3D paddr;
> =20
> -    memory_region_notify_iommu(mr, 0, entry);
> +    memory_region_notify_iommu(mr, 0, event);
>  }
> =20
>  static void virtio_iommu_notify_unmap(IOMMUMemoryRegion *mr, hwaddr virt=
_start,
>                                        hwaddr virt_end)
>  {
> -    IOMMUTLBEntry entry;
> +    IOMMUTLBEvent event;
> =20
>      if (!(mr->iommu_notify_flags & IOMMU_NOTIFIER_UNMAP)) {
>          return;
> @@ -161,13 +162,14 @@ static void virtio_iommu_notify_unmap(IOMMUMemoryRe=
gion *mr, hwaddr virt_start,
> =20
>      trace_virtio_iommu_notify_unmap(mr->parent_obj.name, virt_start, vir=
t_end);
> =20
> -    entry.target_as =3D &address_space_memory;
> -    entry.addr_mask =3D virt_end - virt_start;
> -    entry.iova =3D virt_start;
> -    entry.perm =3D IOMMU_NONE;
> -    entry.translated_addr =3D 0;
> +    event.type =3D IOMMU_NOTIFIER_UNMAP;
> +    event.entry.target_as =3D &address_space_memory;
> +    event.entry.addr_mask =3D virt_end - virt_start;
> +    event.entry.iova =3D virt_start;
> +    event.entry.perm =3D IOMMU_NONE;
> +    event.entry.translated_addr =3D 0;
> =20
> -    memory_region_notify_iommu(mr, 0, entry);
> +    memory_region_notify_iommu(mr, 0, event);
>  }
> =20
>  static gboolean virtio_iommu_notify_unmap_cb(gpointer key, gpointer valu=
e,
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index 2b11ac5238..ca281edaea 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -1933,11 +1933,15 @@ void memory_region_unregister_iommu_notifier(Memo=
ryRegion *mr,
>  }
> =20
>  void memory_region_notify_iommu_one(IOMMUNotifier *notifier,
> -                                    IOMMUTLBEntry *entry)
> +                                    IOMMUTLBEvent *event)
>  {
> -    IOMMUNotifierFlag request_flags;
> +    IOMMUTLBEntry *entry =3D &event->entry;
>      hwaddr entry_end =3D entry->iova + entry->addr_mask;
> =20
> +    if (event->type =3D=3D IOMMU_NOTIFIER_UNMAP) {
> +        assert(entry->perm =3D=3D IOMMU_NONE);
> +    }
> +
>      /*
>       * Skip the notification if the notification does not overlap
>       * with registered range.
> @@ -1948,20 +1952,14 @@ void memory_region_notify_iommu_one(IOMMUNotifier=
 *notifier,
> =20
>      assert(entry->iova >=3D notifier->start && entry_end <=3D notifier->=
end);
> =20
> -    if (entry->perm & IOMMU_RW) {
> -        request_flags =3D IOMMU_NOTIFIER_MAP;
> -    } else {
> -        request_flags =3D IOMMU_NOTIFIER_UNMAP;
> -    }
> -
> -    if (notifier->notifier_flags & request_flags) {
> +    if (event->type & notifier->notifier_flags) {
>          notifier->notify(notifier, entry);
>      }
>  }
> =20
>  void memory_region_notify_iommu(IOMMUMemoryRegion *iommu_mr,
>                                  int iommu_idx,
> -                                IOMMUTLBEntry entry)
> +                                IOMMUTLBEvent event)
>  {
>      IOMMUNotifier *iommu_notifier;
> =20
> @@ -1969,7 +1967,7 @@ void memory_region_notify_iommu(IOMMUMemoryRegion *=
iommu_mr,
> =20
>      IOMMU_NOTIFIER_FOREACH(iommu_notifier, iommu_mr) {
>          if (iommu_notifier->iommu_idx =3D=3D iommu_idx) {
> -            memory_region_notify_iommu_one(iommu_notifier, &entry);
> +            memory_region_notify_iommu_one(iommu_notifier, &event);
>          }
>      }
>  }

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--K8nIJk4ghYZn606h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl+0r5sACgkQbDjKyiDZ
s5LnsQ//fb1d24xpiEszkGNHOV4/JySug6VKJSxZYAIEmi3REJeSVVfGvG2E7qkp
1YLJxJEXg0K8sqvR3oF5x4X6xOUmab1x0N6rk0YGObAkbwQfT6PX7MuObtIFZ3e9
/XXkK1080VbVrm4z1PAAtCSx3m2JLb87nUVnrnVrguGi0AyqEK91Az/rgldDKog6
DKtioUwni88Pk4t6Y8vQ7lRJFbdt2omOjJFRHCgImHV+9qU3hwBmp+lRNlUA5DpX
IOhtii+ixSHgxqEwDpsCaQWCkkZrSzhDwq0yw8nE3ayRZkaltihEcQeK+c/Nl/jq
78YKbNpINqSAt7+3QWEWHj6hk64nIQliqFhCIslOiEPLMbOEUqds/9u/CK3j13pC
D7rTUL9gAW18acEfTtqcewySMc/UtSv76l5e6VCo1LIpojCx9oYPY6PEVnE71Wr/
Zh1o8q40bvg0OKt+NtaYYRyPiV0kqGXb+GM3niPyWwi4aDXueV/NXjgIEj7F2kNX
Tm3pEAm9fB/F8UjauarTtdBh3LwYaSossD6BIf+0CBaHQs2V+Euv3mdXBGjTyNbL
cE/nl+znKshLJNO2oMJv7A1A0FVFRrAnyHdG2dXqJGHEyDfIsJpv0ltFzEPcrjf7
CVuNVk4va5uT35mRUAger7Bs36nZ1f1Cc34o3/yoBjveNSf+Hoo=
=OkAl
-----END PGP SIGNATURE-----

--K8nIJk4ghYZn606h--

