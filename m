Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C46406098F0
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 05:37:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ommib-00056U-Sc
	for lists+qemu-devel@lfdr.de; Sun, 23 Oct 2022 21:57:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1omcEq-0002hA-93
 for qemu-devel@nongnu.org; Sun, 23 Oct 2022 10:46:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1omcEo-00045n-38
 for qemu-devel@nongnu.org; Sun, 23 Oct 2022 10:46:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666536361;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OthyEON0u4Vl2JG5xX3MotBZCIuuwcaryHXxwWW4GY8=;
 b=df1ahC8XsFhCgHF8CpPthY/qqVZe6SPWNXIbIaPtm5ykdSumeSdQi28TBCD6UEJzBwiv9t
 kKL4D8sSw1jFYCIAW6Ydm/7AJSqs8Fog5YSZd2f0URdfVcb3Y7oyyZpqnqFJbL8+28bWiF
 YCLxt+tL1OgTYg/XkmJ33vzV9rho5Kc=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-519-8ptKhwKkMdi8elCRswv1dw-1; Sun, 23 Oct 2022 10:45:58 -0400
X-MC-Unique: 8ptKhwKkMdi8elCRswv1dw-1
Received: by mail-ed1-f70.google.com with SMTP id
 s8-20020a056402520800b0045cab560d5eso7094934edd.1
 for <qemu-devel@nongnu.org>; Sun, 23 Oct 2022 07:45:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OthyEON0u4Vl2JG5xX3MotBZCIuuwcaryHXxwWW4GY8=;
 b=5C8OFcHUzUXyfZ2zBMLS97hifK4r2RKdAxwHytvgjUrp10f+8hqgmfTrgh4KrXFLTP
 v69hIlYFHwF5zE+Ki+4jP6DYy8ohKLNsNrZO5sp/QsORlUWOz9I27L7cySYD43Zl42V7
 lVrSEIWXSiiUMOWxpfzAQ2Zr7i2Yyc6T4ByNbyCNN7z5UYvQ1AbP2HrmTJ+UTiXTH3FM
 g09aJT/JjuUE3OokriyumUplaschGMwH0gG13ag4rtfMdXk2DlcAD7DbF6tgAJkcEDil
 B3iB+Il/LVpCzygFES+0PPri8lMl2d713nLzOAvUMiusXLnKenB7OGFWeKlInu3KlggL
 HmIg==
X-Gm-Message-State: ACrzQf3sWCM6tbuIz3xEm4vhQBrsypUsA84meL3Kvkhd4zdbNEIzkNYp
 heXAjHCK2zDc7FqNkr5pW75GS8+9UtfyJFRVk41NNvlMgK6KvNfP3UnA6wX7kEW7P0GBPQZcrV9
 /3Yud0OhyqYcN+WPfRDD5fuDyYhyu8PM=
X-Received: by 2002:a17:907:2721:b0:78d:4e30:df36 with SMTP id
 d1-20020a170907272100b0078d4e30df36mr23763026ejl.508.1666536357640; 
 Sun, 23 Oct 2022 07:45:57 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5xj174hCyo6Gm4yLgMesvZcAsDis+jr2sUNLHs9idIQBp7dVf6ImcdaXU+0kV3pKehq9ybVd2P8Hpe9bvt+Ew=
X-Received: by 2002:a17:907:2721:b0:78d:4e30:df36 with SMTP id
 d1-20020a170907272100b0078d4e30df36mr23763012ejl.508.1666536357325; Sun, 23
 Oct 2022 07:45:57 -0700 (PDT)
MIME-Version: 1.0
References: <20221019063925.581928-1-lulu@redhat.com>
 <CACGkMEsmrcraoE4h9RjFrart4R5m+2ACvVTiLuDKaYtGdGOevQ@mail.gmail.com>
In-Reply-To: <CACGkMEsmrcraoE4h9RjFrart4R5m+2ACvVTiLuDKaYtGdGOevQ@mail.gmail.com>
From: Cindy Lu <lulu@redhat.com>
Date: Sun, 23 Oct 2022 22:45:20 +0800
Message-ID: <CACLfguUET+811tYPNZ9xqp7Ubx4t2gUOBERkiwcV45Cn6T10Mg@mail.gmail.com>
Subject: Re: [PATCH v2] vhost-vdpa: add support for vIOMMU
To: Jason Wang <jasowang@redhat.com>
Cc: mst@redhat.com, eperezma@redhat.com, qemu-devel@nongnu.org, 
 stefanha@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lulu@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.517,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 20 Oct 2022 at 10:15, Jason Wang <jasowang@redhat.com> wrote:
>
> On Wed, Oct 19, 2022 at 2:39 PM Cindy Lu <lulu@redhat.com> wrote:
> >
> > Add support for vIOMMU. Register a memory listener to dma_as in
> > dev_start
> > - during region_add register a specific IOMMU notifier, and store all n=
otifiers in a list.
> > - during region_del, compare and delete the IOMMU notifier from the lis=
t
> >
> > Verified in vp_vdpa and vdpa_sim_net driver
> >
> > Signed-off-by: Cindy Lu <lulu@redhat.com>
> > ---
> >  hw/virtio/vhost-vdpa.c         | 218 ++++++++++++++++++++++++++++++++-
> >  include/hw/virtio/vhost-vdpa.h |  11 ++
> >  2 files changed, 226 insertions(+), 3 deletions(-)
> >
> > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > index 3ff9ce3501..8f36423c28 100644
> > --- a/hw/virtio/vhost-vdpa.c
> > +++ b/hw/virtio/vhost-vdpa.c
> > @@ -26,6 +26,7 @@
> >  #include "cpu.h"
> >  #include "trace.h"
> >  #include "qapi/error.h"
> > +#include "hw/virtio/virtio-access.h"
> >
> >  /*
> >   * Return one past the end of the end of section. Be careful with uint=
64_t
> > @@ -146,9 +147,8 @@ static void vhost_vdpa_iotlb_batch_begin_once(struc=
t vhost_vdpa *v)
> >      v->iotlb_batch_begin_sent =3D true;
> >  }
> >
> > -static void vhost_vdpa_listener_commit(MemoryListener *listener)
> > +static void vhost_vdpa_iotlb_batch_end(struct vhost_vdpa *v)
> >  {
> > -    struct vhost_vdpa *v =3D container_of(listener, struct vhost_vdpa,=
 listener);
> >      struct vhost_dev *dev =3D v->dev;
> >      struct vhost_msg_v2 msg =3D {};
> >      int fd =3D v->device_fd;
> > @@ -172,6 +172,18 @@ static void vhost_vdpa_listener_commit(MemoryListe=
ner *listener)
> >
> >      v->iotlb_batch_begin_sent =3D false;
> >  }
> > +static void vhost_vdpa_listener_commit(MemoryListener *listener)
> > +{
> > +    struct vhost_vdpa *v =3D container_of(listener, struct vhost_vdpa,=
 listener);
> > +    return vhost_vdpa_iotlb_batch_end(v);
> > +}
> > +
> > +static void vhost_vdpa_listener_iommu_commit(MemoryListener *listener)
> > +{
> > +    struct vhost_vdpa *v =3D
> > +        container_of(listener, struct vhost_vdpa, iommu_listener);
> > +    return vhost_vdpa_iotlb_batch_end(v);
> > +}
> >
> >  static void vhost_vdpa_listener_region_add(MemoryListener *listener,
> >                                             MemoryRegionSection *sectio=
n)
> > @@ -186,6 +198,9 @@ static void vhost_vdpa_listener_region_add(MemoryLi=
stener *listener,
> >                                              v->iova_range.last)) {
> >          return;
> >      }
> > +    if (memory_region_is_iommu(section->mr)) {
> > +        return;
> > +    }
> >
> >      if (unlikely((section->offset_within_address_space & ~TARGET_PAGE_=
MASK) !=3D
> >                   (section->offset_within_region & ~TARGET_PAGE_MASK)))=
 {
> > @@ -260,6 +275,9 @@ static void vhost_vdpa_listener_region_del(MemoryLi=
stener *listener,
> >                                              v->iova_range.last)) {
> >          return;
> >      }
> > +    if (memory_region_is_iommu(section->mr)) {
> > +        return;
> > +    }
> >
> >      if (unlikely((section->offset_within_address_space & ~TARGET_PAGE_=
MASK) !=3D
> >                   (section->offset_within_region & ~TARGET_PAGE_MASK)))=
 {
> > @@ -312,6 +330,180 @@ static const MemoryListener vhost_vdpa_memory_lis=
tener =3D {
> >      .region_del =3D vhost_vdpa_listener_region_del,
> >  };
> >
> > +/* Called with rcu_read_lock held.  */
> > +static bool vhost_vdpa_get_xlat_addr(IOMMUTLBEntry *iotlb, void **vadd=
r,
> > +                                     ram_addr_t *ram_addr, bool *read_=
only)
>
> So this looks exact the same as what VFIO did, try to unify them?
>
for this function, I have tried but seems the vfio does not complied
in some arch by default
such as m68k-softmmu, if we want to use this function, maybe we need
to enable the VFIO in
that arch, not sure if this is worth=EF=BC=9F
Thanks
cindy

> > +{
> > +    MemoryRegion *mr;
> > +    hwaddr xlat;
> > +    hwaddr len =3D iotlb->addr_mask + 1;
> > +    bool writable =3D iotlb->perm & IOMMU_WO;
> > +
> > +    /*
> > +     * The IOMMU TLB entry we have just covers translation through
> > +     * this IOMMU to its immediate target.  We need to translate
> > +     * it the rest of the way through to memory.
> > +     */
> > +    mr =3D address_space_translate(&address_space_memory, iotlb->trans=
lated_addr,
> > +                                 &xlat, &len, writable, MEMTXATTRS_UNS=
PECIFIED);
> > +    if (!memory_region_is_ram(mr)) {
> > +        error_report("iommu map to non memory area %" HWADDR_PRIx "", =
xlat);
> > +        return false;
> > +    } else if (memory_region_has_ram_discard_manager(mr)) {
> > +        RamDiscardManager *rdm =3D memory_region_get_ram_discard_manag=
er(mr);
> > +        MemoryRegionSection tmp =3D {
> > +            .mr =3D mr,
> > +            .offset_within_region =3D xlat,
> > +            .size =3D int128_make64(len),
> > +        };
> > +
> > +        if (!ram_discard_manager_is_populated(rdm, &tmp)) {
> > +            error_report("iommu map to discarded memory (e.g., unplugg=
ed via"
> > +                         " virtio-mem): %" HWADDR_PRIx "",
> > +                         iotlb->translated_addr);
> > +            return false;
> > +        }
> > +    }
> > +    /*
> > +     * Translation truncates length to the IOMMU page size,
> > +     * check that it did not truncate too much.
> > +     */
> > +    if (len & iotlb->addr_mask) {
> > +        error_report("iommu has granularity incompatible with target A=
S");
> > +        return false;
> > +    }
> > +
> > +    if (vaddr) {
> > +        *vaddr =3D memory_region_get_ram_ptr(mr) + xlat;
> > +    }
> > +
> > +    if (ram_addr) {
> > +        *ram_addr =3D memory_region_get_ram_addr(mr) + xlat;
> > +    }
> > +
> > +    if (read_only) {
> > +        *read_only =3D !writable || mr->readonly;
> > +    }
> > +
> > +    return true;
> > +}
> > +
> > +static void vhost_vdpa_iommu_map_notify(IOMMUNotifier *n, IOMMUTLBEntr=
y *iotlb)
> > +{
> > +    struct vdpa_iommu *iommu =3D container_of(n, struct vdpa_iommu, n)=
;
> > +
> > +    hwaddr iova =3D iotlb->iova + iommu->iommu_offset;
> > +    struct vhost_vdpa *v =3D iommu->dev;
> > +    void *vaddr;
> > +    int ret;
> > +
> > +    if (iotlb->target_as !=3D &address_space_memory) {
> > +        error_report("Wrong target AS \"%s\", only system memory is al=
lowed",
> > +                     iotlb->target_as->name ? iotlb->target_as->name :=
 "none");
> > +        return;
> > +    }
> > +    RCU_READ_LOCK_GUARD();
> > +    vhost_vdpa_iotlb_batch_begin_once(v);
> > +
> > +    if ((iotlb->perm & IOMMU_RW) !=3D IOMMU_NONE) {
> > +        bool read_only;
> > +
> > +        if (!vhost_vdpa_get_xlat_addr(iotlb, &vaddr, NULL, &read_only)=
) {
> > +            return;
> > +        }
> > +        ret =3D
> > +            vhost_vdpa_dma_map(v, iova, iotlb->addr_mask + 1, vaddr, r=
ead_only);
> > +        if (ret) {
> > +            error_report("vhost_vdpa_dma_map(%p, 0x%" HWADDR_PRIx ", "
> > +                         "0x%" HWADDR_PRIx ", %p) =3D %d (%m)",
> > +                         v, iova, iotlb->addr_mask + 1, vaddr, ret);
> > +        }
> > +    } else {
> > +        ret =3D vhost_vdpa_dma_unmap(v, iova, iotlb->addr_mask + 1);
> > +        if (ret) {
> > +            error_report("vhost_vdpa_dma_unmap(%p, 0x%" HWADDR_PRIx ",=
 "
> > +                         "0x%" HWADDR_PRIx ") =3D %d (%m)",
> > +                         v, iova, iotlb->addr_mask + 1, ret);
> > +        }
> > +    }
> > +}
> > +
> > +static void vhost_vdpa_iommu_region_add(MemoryListener *listener,
> > +                                        MemoryRegionSection *section)
> > +{
> > +    struct vhost_vdpa *v =3D
> > +        container_of(listener, struct vhost_vdpa, iommu_listener);
> > +
> > +    struct vdpa_iommu *iommu;
> > +    Int128 end;
> > +    int iommu_idx;
> > +    IOMMUMemoryRegion *iommu_mr;
> > +    int ret;
> > +
> > +    if (!memory_region_is_iommu(section->mr)) {
> > +        return;
> > +    }
> > +
> > +    iommu_mr =3D IOMMU_MEMORY_REGION(section->mr);
> > +
> > +    iommu =3D g_malloc0(sizeof(*iommu));
> > +    end =3D
> > +        int128_add(int128_make64(section->offset_within_region), secti=
on->size);
>
> I'd suggest to tweak the line breaking here and below, e.g you can
> keep int128_add and other stuffs as long as it does not exceeds 70 or
> 80 characters at the line where "end =3D" sits.
>
sure will change this
> > +    end =3D int128_sub(end, int128_one());
> > +    iommu_idx =3D
> > +        memory_region_iommu_attrs_to_index(iommu_mr, MEMTXATTRS_UNSPEC=
IFIED);
> > +    iommu->iommu_mr =3D iommu_mr;
> > +
> > +    iommu_notifier_init(
> > +        &iommu->n, vhost_vdpa_iommu_map_notify, IOMMU_NOTIFIER_IOTLB_E=
VENTS,
> > +        section->offset_within_region, int128_get64(end), iommu_idx);
> > +    iommu->iommu_offset =3D
> > +        section->offset_within_address_space - section->offset_within_=
region;
> > +    iommu->dev =3D v;
> > +
> > +    ret =3D memory_region_register_iommu_notifier(section->mr, &iommu-=
>n, NULL);
> > +    if (ret) {
> > +        g_free(iommu);
> > +        return;
> > +    }
> > +
> > +    QLIST_INSERT_HEAD(&v->iommu_list, iommu, iommu_next);
> > +    memory_region_iommu_replay(iommu->iommu_mr, &iommu->n);
> > +
> > +    return;
> > +}
> > +
> > +static void vhost_vdpa_iommu_region_del(MemoryListener *listener,
> > +                                        MemoryRegionSection *section)
> > +{
> > +    struct vhost_vdpa *v =3D
> > +        container_of(listener, struct vhost_vdpa, iommu_listener);
> > +
> > +    struct vdpa_iommu *iommu;
> > +
> > +    if (!memory_region_is_iommu(section->mr)) {
> > +        return;
> > +    }
> > +
> > +    QLIST_FOREACH(iommu, &v->iommu_list, iommu_next)
> > +    {
> > +        if (MEMORY_REGION(iommu->iommu_mr) =3D=3D section->mr &&
> > +            iommu->n.start =3D=3D section->offset_within_region) {
> > +            memory_region_unregister_iommu_notifier(section->mr, &iomm=
u->n);
> > +            QLIST_REMOVE(iommu, iommu_next);
> > +            g_free(iommu);
> > +            break;
> > +        }
> > +    }
> > +}
> > +
> > +static const MemoryListener vhost_vdpa_iommu_listener =3D {
> > +    .name =3D "vhost-vdpa-iommu",
> > +    .region_add =3D vhost_vdpa_iommu_region_add,
> > +    .region_del =3D vhost_vdpa_iommu_region_del,
> > +    .commit =3D vhost_vdpa_listener_iommu_commit,
>
> Unless there's a special requirement. I'd suggest to reuse the
> existing listener (since you've already had if (iommu_region()) check
> there).
>
> Thanks
>
sure Thanks Jason , will provide a new version soon
Thanks
Cindy
> > +};
> > +
> >  static int vhost_vdpa_call(struct vhost_dev *dev, unsigned long int re=
quest,
> >                               void *arg)
> >  {
> > @@ -433,6 +625,18 @@ static int vhost_vdpa_init_svq(struct vhost_dev *h=
dev, struct vhost_vdpa *v,
> >      return 0;
> >  }
> >
> > +static bool vdpa_dev_has_iommu(struct vhost_dev *dev)
> > +{
> > +    VirtIODevice *vdev =3D dev->vdev;
> > +
> > +    if (vdev) {
> > +        return virtio_bus_device_iommu_enabled(vdev) &&
> > +               virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM);
> > +    } else {
> > +        return false;
> > +    }
> > +}
> > +
> >  static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque, Error =
**errp)
> >  {
> >      struct vhost_vdpa *v;
> > @@ -454,6 +658,7 @@ static int vhost_vdpa_init(struct vhost_dev *dev, v=
oid *opaque, Error **errp)
> >      v->dev =3D dev;
> >      dev->opaque =3D  opaque ;
> >      v->listener =3D vhost_vdpa_memory_listener;
> > +    v->iommu_listener =3D vhost_vdpa_iommu_listener;
> >      v->msg_type =3D VHOST_IOTLB_MSG_V2;
> >      ret =3D vhost_vdpa_init_svq(dev, v, errp);
> >      if (ret) {
> > @@ -587,7 +792,6 @@ static int vhost_vdpa_cleanup(struct vhost_dev *dev=
)
> >      v =3D dev->opaque;
> >      trace_vhost_vdpa_cleanup(dev, v);
> >      vhost_vdpa_host_notifiers_uninit(dev, dev->nvqs);
> > -    memory_listener_unregister(&v->listener);
> >      vhost_vdpa_svq_cleanup(dev);
> >
> >      dev->opaque =3D NULL;
> > @@ -1128,11 +1332,19 @@ static int vhost_vdpa_dev_start(struct vhost_de=
v *dev, bool started)
> >
> >      if (started) {
> >          memory_listener_register(&v->listener, &address_space_memory);
> > +        if (vdpa_dev_has_iommu(dev)) {
> > +            memory_listener_register(&v->iommu_listener, dev->vdev->dm=
a_as);
> > +        }
> > +
> >          return vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_DRIVER_OK);
> >      } else {
> >          vhost_vdpa_reset_device(dev);
> >          vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
> >                                     VIRTIO_CONFIG_S_DRIVER);
> > +
> > +        if (vdpa_dev_has_iommu(dev)) {
> > +            memory_listener_unregister(&v->iommu_listener);
> > +        }
> >          memory_listener_unregister(&v->listener);
> >
> >          return 0;
> > diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-v=
dpa.h
> > index d10a89303e..22cbce7934 100644
> > --- a/include/hw/virtio/vhost-vdpa.h
> > +++ b/include/hw/virtio/vhost-vdpa.h
> > @@ -30,6 +30,7 @@ typedef struct vhost_vdpa {
> >      uint32_t msg_type;
> >      bool iotlb_batch_begin_sent;
> >      MemoryListener listener;
> > +    MemoryListener iommu_listener;
> >      struct vhost_vdpa_iova_range iova_range;
> >      uint64_t acked_features;
> >      bool shadow_vqs_enabled;
> > @@ -41,8 +42,18 @@ typedef struct vhost_vdpa {
> >      void *shadow_vq_ops_opaque;
> >      struct vhost_dev *dev;
> >      VhostVDPAHostNotifier notifier[VIRTIO_QUEUE_MAX];
> > +    QLIST_HEAD(, vdpa_iommu) iommu_list;
> > +    IOMMUNotifier n;
> >  } VhostVDPA;
> >
> > +struct vdpa_iommu {
> > +    struct vhost_vdpa *dev;
> > +    IOMMUMemoryRegion *iommu_mr;
> > +    hwaddr iommu_offset;
> > +    IOMMUNotifier n;
> > +    QLIST_ENTRY(vdpa_iommu) iommu_next;
> > +};
> > +
> >  int vhost_vdpa_dma_map(struct vhost_vdpa *v, hwaddr iova, hwaddr size,
> >                         void *vaddr, bool readonly);
> >  int vhost_vdpa_dma_unmap(struct vhost_vdpa *v, hwaddr iova, hwaddr siz=
e);
> > --
> > 2.34.3
> >
>


