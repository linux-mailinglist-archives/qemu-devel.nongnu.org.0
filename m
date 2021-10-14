Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4ED42D212
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 07:59:48 +0200 (CEST)
Received: from localhost ([::1]:57278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1matmN-0006Zo-Kl
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 01:59:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1matkH-0005LO-BU
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 01:57:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1matkE-00025n-6g
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 01:57:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634191052;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X+dPuisOODmPeXdbCrJTbbpARovb+M3vENxAwRVeJS0=;
 b=baQj3Jd/v5QnJMcx66jBJsTiBdQGybDh7BPhqDrz5WNoW+UGH4m4bNCFHqV7BMsg6ZZR66
 c9BoAi4yo4TGYk8yjzMqv2jPTg34a7fSLSa15sIHbu86dSBmJoIXIPU/ldee1Ex+ziZMYP
 R2VFndxdRPQFQPNV93r+fGM7pLRzxRc=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-436-545V1LLqMmi3rXmLfctQtQ-1; Thu, 14 Oct 2021 01:57:31 -0400
X-MC-Unique: 545V1LLqMmi3rXmLfctQtQ-1
Received: by mail-qt1-f200.google.com with SMTP id
 w12-20020ac80ecc000000b002a7a4cd22faso661144qti.4
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 22:57:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=X+dPuisOODmPeXdbCrJTbbpARovb+M3vENxAwRVeJS0=;
 b=da7UhHyfaWd0xFzcydwwILij2ntuNkyfWQJ+NRwuDZ7w6ZHZtdMSNkQLD8avc2x9Pw
 WLvlC5pbxsx8QAghAHSM1/15V8XZkGOkzDgpUISPsGHzzOQ8TXSl5w3QlW9ynyzIN+ja
 0N2XhWsjI2pR1zb7yViQ2ubnlxNTncYCpj+d/PSudM76Yq+X/IznoLdan9h+pc9yovUl
 DUkKYzJl/QFG3hUx0EMKf6Ve63ehmFeZ1IlRGmqOQFduROKpm/a9Bo9C2PfCoNWfiLe4
 RUVKAiLEb5h2zFUh8Q5kVaOgxpmChZgL0V8SSwJssaXsPq6WYMhH06kyoHE1wq94b0e8
 32Sg==
X-Gm-Message-State: AOAM533iF+OokL2VOoeTpYLDruhfPk39c+LbZ/iY2YCDJ4YxZQqI9uRR
 R2Xv9jHCPZzS9IydfhjnfOzASDvzPqj2n9+GbHqNe3b4UoFr0LCuX97vHhgdDNxAjivY48N50Qi
 LlsTDMmEyxUNuu02yKaMmKaxIrg2P7u8=
X-Received: by 2002:ac8:598d:: with SMTP id e13mr4549513qte.76.1634191051025; 
 Wed, 13 Oct 2021 22:57:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyhWb2aizgPUbz0SS6K8VAm5lE4TUMTWQObDvrwaqSN15HzQ/cEVphZpfg0F/sXVScKew+c4OIvw/uOese8di0=
X-Received: by 2002:ac8:598d:: with SMTP id e13mr4549484qte.76.1634191050729; 
 Wed, 13 Oct 2021 22:57:30 -0700 (PDT)
MIME-Version: 1.0
References: <20211012140710.804529-1-eperezma@redhat.com>
 <20211012140710.804529-4-eperezma@redhat.com>
 <CACGkMEsGDoWuE0WEq7P-S5V5XiLPCZcVAszQFHDLsLDZEAAh5A@mail.gmail.com>
In-Reply-To: <CACGkMEsGDoWuE0WEq7P-S5V5XiLPCZcVAszQFHDLsLDZEAAh5A@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Thu, 14 Oct 2021 07:56:54 +0200
Message-ID: <CAJaqyWdW+JarVW6tOfM6rYHh2fb=whGHFdwmFy0AMcLqukOrpg@mail.gmail.com>
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
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: Parav Pandit <parav@mellanox.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 14, 2021 at 5:30 AM Jason Wang <jasowang@redhat.com> wrote:
>
> On Tue, Oct 12, 2021 at 10:07 PM Eugenio P=C3=A9rez <eperezma@redhat.com>=
 wrote:
> >
> > Check vdpa device range before updating memory regions so we don't add
> > any outside of it, and report the invalid change if any.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >  include/hw/virtio/vhost-vdpa.h |  2 ++
> >  hw/virtio/vhost-vdpa.c         | 62 +++++++++++++++++++++++++---------
> >  hw/virtio/trace-events         |  1 +
> >  3 files changed, 49 insertions(+), 16 deletions(-)
> >
> > diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-v=
dpa.h
> > index a8963da2d9..c288cf7ecb 100644
> > --- a/include/hw/virtio/vhost-vdpa.h
> > +++ b/include/hw/virtio/vhost-vdpa.h
> > @@ -13,6 +13,7 @@
> >  #define HW_VIRTIO_VHOST_VDPA_H
> >
> >  #include "hw/virtio/virtio.h"
> > +#include "standard-headers/linux/vhost_types.h"
> >
> >  typedef struct VhostVDPAHostNotifier {
> >      MemoryRegion mr;
> > @@ -24,6 +25,7 @@ typedef struct vhost_vdpa {
> >      uint32_t msg_type;
> >      bool iotlb_batch_begin_sent;
> >      MemoryListener listener;
> > +    struct vhost_vdpa_iova_range iova_range;
> >      struct vhost_dev *dev;
> >      VhostVDPAHostNotifier notifier[VIRTIO_QUEUE_MAX];
> >  } VhostVDPA;
> > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > index be7c63b4ba..dbf773d032 100644
> > --- a/hw/virtio/vhost-vdpa.c
> > +++ b/hw/virtio/vhost-vdpa.c
> > @@ -37,20 +37,34 @@ static Int128 vhost_vdpa_section_end(const MemoryRe=
gionSection *section)
> >      return llend;
> >  }
> >
> > -static bool vhost_vdpa_listener_skipped_section(MemoryRegionSection *s=
ection)
> > -{
> > -    return (!memory_region_is_ram(section->mr) &&
> > -            !memory_region_is_iommu(section->mr)) ||
> > -            memory_region_is_protected(section->mr) ||
> > -           /* vhost-vDPA doesn't allow MMIO to be mapped  */
> > -            memory_region_is_ram_device(section->mr) ||
> > -           /*
> > -            * Sizing an enabled 64-bit BAR can cause spurious mappings=
 to
> > -            * addresses in the upper part of the 64-bit address space.=
  These
> > -            * are never accessed by the CPU and beyond the address wid=
th of
> > -            * some IOMMU hardware.  TODO: VDPA should tell us the IOMM=
U width.
> > -            */
> > -           section->offset_within_address_space & (1ULL << 63);

[1]

> > +static bool vhost_vdpa_listener_skipped_section(MemoryRegionSection *s=
ection,
> > +                                                uint64_t iova_min,
> > +                                                uint64_t iova_max)
> > +{
> > +    Int128 llend;
> > +
> > +    if ((!memory_region_is_ram(section->mr) &&
> > +         !memory_region_is_iommu(section->mr)) ||
> > +        memory_region_is_protected(section->mr) ||
> > +        /* vhost-vDPA doesn't allow MMIO to be mapped  */
> > +        memory_region_is_ram_device(section->mr)) {
> > +        return true;
> > +    }
> > +
> > +    if (section->offset_within_address_space < iova_min) {
> > +        error_report("RAM section out of device range (min=3D%lu, addr=
=3D%lu)",
> > +                     iova_min, section->offset_within_address_space);
> > +        return true;
> > +    }
> > +
> > +    llend =3D vhost_vdpa_section_end(section);
> > +    if (int128_gt(llend, int128_make64(iova_max))) {
> > +        error_report("RAM section out of device range (max=3D%lu, end =
addr=3D%lu)",
> > +                     iova_max, int128_get64(llend));
> > +        return true;
> > +    }
> > +
> > +    return false;
> >  }
> >
> >  static int vhost_vdpa_dma_map(struct vhost_vdpa *v, hwaddr iova, hwadd=
r size,
> > @@ -162,7 +176,8 @@ static void vhost_vdpa_listener_region_add(MemoryLi=
stener *listener,
> >      void *vaddr;
> >      int ret;
> >
> > -    if (vhost_vdpa_listener_skipped_section(section)) {
> > +    if (vhost_vdpa_listener_skipped_section(section, v->iova_range.fir=
st,
> > +                                            v->iova_range.last)) {
> >          return;
> >      }
> >
> > @@ -220,7 +235,8 @@ static void vhost_vdpa_listener_region_del(MemoryLi=
stener *listener,
> >      Int128 llend, llsize;
> >      int ret;
> >
> > -    if (vhost_vdpa_listener_skipped_section(section)) {
> > +    if (vhost_vdpa_listener_skipped_section(section, v->iova_range.fir=
st,
> > +                                            v->iova_range.last)) {
> >          return;
> >      }
> >
> > @@ -288,6 +304,19 @@ static void vhost_vdpa_add_status(struct vhost_dev=
 *dev, uint8_t status)
> >      vhost_vdpa_call(dev, VHOST_VDPA_SET_STATUS, &s);
> >  }
> >
> > +static void vhost_vdpa_get_iova_range(struct vhost_vdpa *v)
> > +{
> > +    int ret =3D vhost_vdpa_call(v->dev, VHOST_VDPA_GET_IOVA_RANGE,
> > +                              &v->iova_range);
> > +    if (ret !=3D 0) {
> > +        v->iova_range.first =3D 0;
> > +        v->iova_range.last =3D MAKE_64BIT_MASK(0, 63);
>
> Nit:
>
> ULLONG_MAX?
>

It should be ULLONG_MAX >> 1 to match the previous limit [1], and
trusting that uint64_t is effectively unsigned long long. I see a 63
bits mask immediately with MAKE_64BIT_MASK (once I remember the
parameter order), but I find it harder to see it with (ULLONG_MAX >>
1).

If you prefer the _MAX options, I would say it is better to stick with
(UINT64_MAX >> 1) or (HWADDR_MAX >> 1), because of this in
CODING_STYLE.rst:

"If you're using "int" or "long", odds are good that there's a better
type. ...", "In the event that you require a specific width, use a
standard type like int32_t, uint32_t, uint64_t, etc", "Use hwaddr for
guest physical addresses".

Does it make sense to you?

Thanks!

> Others look good.
>
> Thanks
>
> > +    }
> > +
> > +    trace_vhost_vdpa_get_iova_range(v->dev, v->iova_range.first,
> > +                                    v->iova_range.last);
> > +}
> > +
> >  static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque, Error =
**errp)
> >  {
> >      struct vhost_vdpa *v;
> > @@ -300,6 +329,7 @@ static int vhost_vdpa_init(struct vhost_dev *dev, v=
oid *opaque, Error **errp)
> >      v->listener =3D vhost_vdpa_memory_listener;
> >      v->msg_type =3D VHOST_IOTLB_MSG_V2;
> >
> > +    vhost_vdpa_get_iova_range(v);
> >      vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
> >                                 VIRTIO_CONFIG_S_DRIVER);
> >
> > diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
> > index 8ed19e9d0c..650e521e35 100644
> > --- a/hw/virtio/trace-events
> > +++ b/hw/virtio/trace-events
> > @@ -52,6 +52,7 @@ vhost_vdpa_set_vring_call(void *dev, unsigned int ind=
ex, int fd) "dev: %p index:
> >  vhost_vdpa_get_features(void *dev, uint64_t features) "dev: %p feature=
s: 0x%"PRIx64
> >  vhost_vdpa_set_owner(void *dev) "dev: %p"
> >  vhost_vdpa_vq_get_addr(void *dev, void *vq, uint64_t desc_user_addr, u=
int64_t avail_user_addr, uint64_t used_user_addr) "dev: %p vq: %p desc_user=
_addr: 0x%"PRIx64" avail_user_addr: 0x%"PRIx64" used_user_addr: 0x%"PRIx64
> > +vhost_vdpa_get_iova_range(void *dev, uint64_t first, uint64_t last) "d=
ev: %p first: 0x%"PRIx64" last: 0x%"PRIx64
> >
> >  # virtio.c
> >  virtqueue_alloc_element(void *elem, size_t sz, unsigned in_num, unsign=
ed out_num) "elem %p size %zd in_num %u out_num %u"
> > --
> > 2.27.0
> >
>


