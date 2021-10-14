Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF9142D491
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 10:11:54 +0200 (CEST)
Received: from localhost ([::1]:38156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mavqB-0008C9-5s
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 04:11:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mavnD-0006pr-R3
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 04:08:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26300)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mavn6-0005Cb-VL
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 04:08:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634198919;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/ORA295WyReid2O6RmW5hy4elM1ARVmV2IOmlXL2Kfw=;
 b=TAyI1n2p7bhjWyGo8U9phbiv09QtUzK0Q85sLWI9Tc8uugvUH6STk69LRpr32YUABxJfaA
 ZKvb5qL/MxQPuwQItZHC1zRdciVeQ34Kj7oENPMs/YkUx8sNGlPMX/v999MPEunrCku+Y/
 zqYJNSUK0k943rdAkQgha1UDx67hbfk=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-286-4qCAi_vvNZSzpKET6frUEQ-1; Thu, 14 Oct 2021 04:08:38 -0400
X-MC-Unique: 4qCAi_vvNZSzpKET6frUEQ-1
Received: by mail-qv1-f72.google.com with SMTP id
 p9-20020a05621421e900b003830bb235fbso4981790qvj.14
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 01:08:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/ORA295WyReid2O6RmW5hy4elM1ARVmV2IOmlXL2Kfw=;
 b=rS66fUhiuaVRK10rlcCDU4OL0z1snBQ5v/nPR/Mno/frLFIz0nqhEQCJqtY7+hQORf
 x6+BM3vN4kFV12V4symFnKarHVZt5tPhgl0RBoyeMx51frEtUKeSjUMxUjKBKfYDkvBt
 dnq7BCdTDa9gk/3ytO29d+DM7z/jJlbxc6q4xSY9qrGnt49ZPo2HM4rzycioFzAUtLpU
 DKIfhDTtD723bxcNIzOuOAEG9nQVSw59cWVqcoiHjz1S65RFF9MdIPmEuEBV1PuPSsnd
 zawwPWROiLAcEavmeLgTgjgkrp0PhXiqAozc7DctBMyb6CHkYS6D43K3m0TVPcsQnoH+
 e7fw==
X-Gm-Message-State: AOAM531JuPnQy3pMirr2qxj+LYfEzraxKHZQvncwaXiiBpDLoN9ow8z2
 AuvZI9LWBlDDhlaIpVI7VoaEa71OgwzGeaZjXuUciYE4yJaYWvFf+4239OchlDlVq0d57Rmw9hC
 2UdSD11g7nMD/nnUenR3QGdB8Npfk3NA=
X-Received: by 2002:ac8:6112:: with SMTP id a18mr4678563qtm.401.1634198917912; 
 Thu, 14 Oct 2021 01:08:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzItR68O/Upg7a415XPAOE8jKXoIbEZHNLRc+q+Yg7xLq7/VptP8XZCjnzP1vJUDM6Xb8mjvha3+nFOE7FKzpc=
X-Received: by 2002:ac8:6112:: with SMTP id a18mr4678535qtm.401.1634198917629; 
 Thu, 14 Oct 2021 01:08:37 -0700 (PDT)
MIME-Version: 1.0
References: <20211012140710.804529-1-eperezma@redhat.com>
 <20211012140710.804529-4-eperezma@redhat.com>
 <CACGkMEsGDoWuE0WEq7P-S5V5XiLPCZcVAszQFHDLsLDZEAAh5A@mail.gmail.com>
 <CAJaqyWdW+JarVW6tOfM6rYHh2fb=whGHFdwmFy0AMcLqukOrpg@mail.gmail.com>
 <CACGkMEv1P3MiRYENsDfx-iarEiv7Bik-qTaYUEAAmAUV1nEfWg@mail.gmail.com>
In-Reply-To: <CACGkMEv1P3MiRYENsDfx-iarEiv7Bik-qTaYUEAAmAUV1nEfWg@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Thu, 14 Oct 2021 10:08:01 +0200
Message-ID: <CAJaqyWfU2KAULXkNPNPOo+824Kx2z5ibo-Gr6q2FNoOCpThQ8Q@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] vdpa: Check for iova range at mappings changes
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Parav Pandit <parav@mellanox.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 14, 2021 at 9:02 AM Jason Wang <jasowang@redhat.com> wrote:
>
> On Thu, Oct 14, 2021 at 1:57 PM Eugenio Perez Martin
> <eperezma@redhat.com> wrote:
> >
> > On Thu, Oct 14, 2021 at 5:30 AM Jason Wang <jasowang@redhat.com> wrote:
> > >
> > > On Tue, Oct 12, 2021 at 10:07 PM Eugenio P=C3=A9rez <eperezma@redhat.=
com> wrote:
> > > >
> > > > Check vdpa device range before updating memory regions so we don't =
add
> > > > any outside of it, and report the invalid change if any.
> > > >
> > > > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > > > ---
> > > >  include/hw/virtio/vhost-vdpa.h |  2 ++
> > > >  hw/virtio/vhost-vdpa.c         | 62 +++++++++++++++++++++++++-----=
----
> > > >  hw/virtio/trace-events         |  1 +
> > > >  3 files changed, 49 insertions(+), 16 deletions(-)
> > > >
> > > > diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vho=
st-vdpa.h
> > > > index a8963da2d9..c288cf7ecb 100644
> > > > --- a/include/hw/virtio/vhost-vdpa.h
> > > > +++ b/include/hw/virtio/vhost-vdpa.h
> > > > @@ -13,6 +13,7 @@
> > > >  #define HW_VIRTIO_VHOST_VDPA_H
> > > >
> > > >  #include "hw/virtio/virtio.h"
> > > > +#include "standard-headers/linux/vhost_types.h"
> > > >
> > > >  typedef struct VhostVDPAHostNotifier {
> > > >      MemoryRegion mr;
> > > > @@ -24,6 +25,7 @@ typedef struct vhost_vdpa {
> > > >      uint32_t msg_type;
> > > >      bool iotlb_batch_begin_sent;
> > > >      MemoryListener listener;
> > > > +    struct vhost_vdpa_iova_range iova_range;
> > > >      struct vhost_dev *dev;
> > > >      VhostVDPAHostNotifier notifier[VIRTIO_QUEUE_MAX];
> > > >  } VhostVDPA;
> > > > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > > > index be7c63b4ba..dbf773d032 100644
> > > > --- a/hw/virtio/vhost-vdpa.c
> > > > +++ b/hw/virtio/vhost-vdpa.c
> > > > @@ -37,20 +37,34 @@ static Int128 vhost_vdpa_section_end(const Memo=
ryRegionSection *section)
> > > >      return llend;
> > > >  }
> > > >
> > > > -static bool vhost_vdpa_listener_skipped_section(MemoryRegionSectio=
n *section)
> > > > -{
> > > > -    return (!memory_region_is_ram(section->mr) &&
> > > > -            !memory_region_is_iommu(section->mr)) ||
> > > > -            memory_region_is_protected(section->mr) ||
> > > > -           /* vhost-vDPA doesn't allow MMIO to be mapped  */
> > > > -            memory_region_is_ram_device(section->mr) ||
> > > > -           /*
> > > > -            * Sizing an enabled 64-bit BAR can cause spurious mapp=
ings to
> > > > -            * addresses in the upper part of the 64-bit address sp=
ace.  These
> > > > -            * are never accessed by the CPU and beyond the address=
 width of
> > > > -            * some IOMMU hardware.  TODO: VDPA should tell us the =
IOMMU width.
> > > > -            */
> > > > -           section->offset_within_address_space & (1ULL << 63);
> >
> > [1]
> >
> > > > +static bool vhost_vdpa_listener_skipped_section(MemoryRegionSectio=
n *section,
> > > > +                                                uint64_t iova_min,
> > > > +                                                uint64_t iova_max)
> > > > +{
> > > > +    Int128 llend;
> > > > +
> > > > +    if ((!memory_region_is_ram(section->mr) &&
> > > > +         !memory_region_is_iommu(section->mr)) ||
> > > > +        memory_region_is_protected(section->mr) ||
> > > > +        /* vhost-vDPA doesn't allow MMIO to be mapped  */
> > > > +        memory_region_is_ram_device(section->mr)) {
> > > > +        return true;
> > > > +    }
> > > > +
> > > > +    if (section->offset_within_address_space < iova_min) {
> > > > +        error_report("RAM section out of device range (min=3D%lu, =
addr=3D%lu)",
> > > > +                     iova_min, section->offset_within_address_spac=
e);
> > > > +        return true;
> > > > +    }
> > > > +
> > > > +    llend =3D vhost_vdpa_section_end(section);
> > > > +    if (int128_gt(llend, int128_make64(iova_max))) {
> > > > +        error_report("RAM section out of device range (max=3D%lu, =
end addr=3D%lu)",
> > > > +                     iova_max, int128_get64(llend));
> > > > +        return true;
> > > > +    }
> > > > +
> > > > +    return false;
> > > >  }
> > > >
> > > >  static int vhost_vdpa_dma_map(struct vhost_vdpa *v, hwaddr iova, h=
waddr size,
> > > > @@ -162,7 +176,8 @@ static void vhost_vdpa_listener_region_add(Memo=
ryListener *listener,
> > > >      void *vaddr;
> > > >      int ret;
> > > >
> > > > -    if (vhost_vdpa_listener_skipped_section(section)) {
> > > > +    if (vhost_vdpa_listener_skipped_section(section, v->iova_range=
.first,
> > > > +                                            v->iova_range.last)) {
> > > >          return;
> > > >      }
> > > >
> > > > @@ -220,7 +235,8 @@ static void vhost_vdpa_listener_region_del(Memo=
ryListener *listener,
> > > >      Int128 llend, llsize;
> > > >      int ret;
> > > >
> > > > -    if (vhost_vdpa_listener_skipped_section(section)) {
> > > > +    if (vhost_vdpa_listener_skipped_section(section, v->iova_range=
.first,
> > > > +                                            v->iova_range.last)) {
> > > >          return;
> > > >      }
> > > >
> > > > @@ -288,6 +304,19 @@ static void vhost_vdpa_add_status(struct vhost=
_dev *dev, uint8_t status)
> > > >      vhost_vdpa_call(dev, VHOST_VDPA_SET_STATUS, &s);
> > > >  }
> > > >
> > > > +static void vhost_vdpa_get_iova_range(struct vhost_vdpa *v)
> > > > +{
> > > > +    int ret =3D vhost_vdpa_call(v->dev, VHOST_VDPA_GET_IOVA_RANGE,
> > > > +                              &v->iova_range);
> > > > +    if (ret !=3D 0) {
> > > > +        v->iova_range.first =3D 0;
> > > > +        v->iova_range.last =3D MAKE_64BIT_MASK(0, 63);
> > >
> > > Nit:
> > >
> > > ULLONG_MAX?
> > >
> >
> > It should be ULLONG_MAX >> 1 to match the previous limit [1],
>
> I think they don't conflict. We just want to preserve the default iova
> range as what the kernel did. Kernel will give ULLONG_MAX if
> get_iova_range() is not implemented by the device?
>

Right, so each one understood a different "previous limit" then :). I
will replace it with UINT64_MAX if you are ok with that.

Thanks!

>
> > and
> > trusting that uint64_t is effectively unsigned long long. I see a 63
> > bits mask immediately with MAKE_64BIT_MASK (once I remember the
> > parameter order), but I find it harder to see it with (ULLONG_MAX >>
> > 1).
> >
> > If you prefer the _MAX options, I would say it is better to stick with
> > (UINT64_MAX >> 1) or (HWADDR_MAX >> 1), because of this in
> > CODING_STYLE.rst:
> >
> > "If you're using "int" or "long", odds are good that there's a better
> > type. ...", "In the event that you require a specific width, use a
> > standard type like int32_t, uint32_t, uint64_t, etc", "Use hwaddr for
> > guest physical addresses".
> >
> > Does it make sense to you?
>
> If I was not wrong, we can use UINT64_MAX.
>
> Thanks
>
> >
> > Thanks!
> >
> > > Others look good.
> > >
> > > Thanks
> > >
> > > > +    }
> > > > +
> > > > +    trace_vhost_vdpa_get_iova_range(v->dev, v->iova_range.first,
> > > > +                                    v->iova_range.last);
> > > > +}
> > > > +
> > > >  static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque, Er=
ror **errp)
> > > >  {
> > > >      struct vhost_vdpa *v;
> > > > @@ -300,6 +329,7 @@ static int vhost_vdpa_init(struct vhost_dev *de=
v, void *opaque, Error **errp)
> > > >      v->listener =3D vhost_vdpa_memory_listener;
> > > >      v->msg_type =3D VHOST_IOTLB_MSG_V2;
> > > >
> > > > +    vhost_vdpa_get_iova_range(v);
> > > >      vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
> > > >                                 VIRTIO_CONFIG_S_DRIVER);
> > > >
> > > > diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
> > > > index 8ed19e9d0c..650e521e35 100644
> > > > --- a/hw/virtio/trace-events
> > > > +++ b/hw/virtio/trace-events
> > > > @@ -52,6 +52,7 @@ vhost_vdpa_set_vring_call(void *dev, unsigned int=
 index, int fd) "dev: %p index:
> > > >  vhost_vdpa_get_features(void *dev, uint64_t features) "dev: %p fea=
tures: 0x%"PRIx64
> > > >  vhost_vdpa_set_owner(void *dev) "dev: %p"
> > > >  vhost_vdpa_vq_get_addr(void *dev, void *vq, uint64_t desc_user_add=
r, uint64_t avail_user_addr, uint64_t used_user_addr) "dev: %p vq: %p desc_=
user_addr: 0x%"PRIx64" avail_user_addr: 0x%"PRIx64" used_user_addr: 0x%"PRI=
x64
> > > > +vhost_vdpa_get_iova_range(void *dev, uint64_t first, uint64_t last=
) "dev: %p first: 0x%"PRIx64" last: 0x%"PRIx64
> > > >
> > > >  # virtio.c
> > > >  virtqueue_alloc_element(void *elem, size_t sz, unsigned in_num, un=
signed out_num) "elem %p size %zd in_num %u out_num %u"
> > > > --
> > > > 2.27.0
> > > >
> > >
> >
>


