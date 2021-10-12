Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70256429C1C
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 05:52:43 +0200 (CEST)
Received: from localhost ([::1]:58172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ma8qI-0002pS-Fk
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 23:52:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ma8oP-000288-MZ
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 23:50:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ma8oN-0006TE-DD
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 23:50:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634010641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L+oSGKY6U0mucyTgr91MMJWJ8obYh/6gFbCXzafNtPU=;
 b=S4Dcdv2hiwb5y7B1qQ27tu1fU2hSe3DyIUFAqh9cUNvUypiRsir3l5162XG70CoBvVc6N/
 Tr8j0VuPZSavYiW+8hmrLM/54GGuBHRt6DiJx7X3FGiobjBT7mLpp0kS4nQ/lFbSffaXSz
 6bkplE4sbo3v0REarYhbg1Le0uucLjI=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-506-HzThjvaoN6uTqRQF9WhhsQ-1; Mon, 11 Oct 2021 23:50:40 -0400
X-MC-Unique: HzThjvaoN6uTqRQF9WhhsQ-1
Received: by mail-lf1-f72.google.com with SMTP id
 i5-20020a056512224500b003fd2d62dcaaso14139561lfu.23
 for <qemu-devel@nongnu.org>; Mon, 11 Oct 2021 20:50:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=L+oSGKY6U0mucyTgr91MMJWJ8obYh/6gFbCXzafNtPU=;
 b=wzYMhn8E3ONfiN5Pplboc5zwrqUT7/izwHKQJTJOHOp1rhUZsrad1jg8Itf3US/syz
 UbYajf0r5PAtOjb04tBxbsW39mI4fPH+xl4HJ54WxDCv/CbI6I0TI+/r5YssBH5fACNV
 LEdunIJoWGpJP77aLs557EtxRh0HLa80vBI1fKiYoQgZ5gc/aTPsEqtlWLvN7fcImPpJ
 aYle6lBz2EXL31kgulSVxCzajlCeCABN6ayd/TDO77pct7iiMiNvuqBQtLXcx8lAC0u/
 5GWHUKeQdSyfkFN6HQx8raWR5RB3DSxXgW+sfaNKIf3mYf98PxFsUwPoUMXe+baHEem4
 4Zyg==
X-Gm-Message-State: AOAM531BrPrGQL96sd89WObYctEg7qYNplF2K6P+rTXxdKXKdzV3IXUh
 S7D0iwRBc8vYEKtnxp5UGqFnihwdQEU2zzd+BSZCGGs+PyUOKtAN203AUOYC5AH0exAox4Gpjxu
 3/vmsptzWmbjK3K83iVUrWUinlqYN2oI=
X-Received: by 2002:ac2:43d1:: with SMTP id u17mr11759555lfl.348.1634010638710; 
 Mon, 11 Oct 2021 20:50:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwhRzTewdchbZo7NgKsjabz421FBEAXZbU0n0S+sNk9UmT/W3dM8ULHfIiZiAqFGK16O3kPeZB9y21NI3XoatE=
X-Received: by 2002:ac2:43d1:: with SMTP id u17mr11759542lfl.348.1634010638524; 
 Mon, 11 Oct 2021 20:50:38 -0700 (PDT)
MIME-Version: 1.0
References: <20211005134843.439050-1-eperezma@redhat.com>
 <20211005134843.439050-4-eperezma@redhat.com>
In-Reply-To: <20211005134843.439050-4-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 12 Oct 2021 11:50:27 +0800
Message-ID: <CACGkMEsGAKroQysXsNnQHVVnCZcEBsL34-qnDry9JEMcefVRAw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] vdpa: Check for iova range at mappings changes
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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

On Tue, Oct 5, 2021 at 9:49 PM Eugenio P=C3=A9rez <eperezma@redhat.com> wro=
te:
>
> Check vdpa device range before updating memory regions so we don't add
> any outside of it, and report the invalid change if any.
>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> ---
>  include/hw/virtio/vhost-vdpa.h |  2 +
>  hw/virtio/vhost-vdpa.c         | 68 ++++++++++++++++++++++++++--------
>  hw/virtio/trace-events         |  1 +
>  3 files changed, 55 insertions(+), 16 deletions(-)
>
> diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdp=
a.h
> index a8963da2d9..c288cf7ecb 100644
> --- a/include/hw/virtio/vhost-vdpa.h
> +++ b/include/hw/virtio/vhost-vdpa.h
> @@ -13,6 +13,7 @@
>  #define HW_VIRTIO_VHOST_VDPA_H
>
>  #include "hw/virtio/virtio.h"
> +#include "standard-headers/linux/vhost_types.h"
>
>  typedef struct VhostVDPAHostNotifier {
>      MemoryRegion mr;
> @@ -24,6 +25,7 @@ typedef struct vhost_vdpa {
>      uint32_t msg_type;
>      bool iotlb_batch_begin_sent;
>      MemoryListener listener;
> +    struct vhost_vdpa_iova_range iova_range;
>      struct vhost_dev *dev;
>      VhostVDPAHostNotifier notifier[VIRTIO_QUEUE_MAX];
>  } VhostVDPA;
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index be7c63b4ba..6654287050 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -37,20 +37,34 @@ static Int128 vhost_vdpa_section_end(const MemoryRegi=
onSection *section)
>      return llend;
>  }
>
> -static bool vhost_vdpa_listener_skipped_section(MemoryRegionSection *sec=
tion)
> -{
> -    return (!memory_region_is_ram(section->mr) &&
> -            !memory_region_is_iommu(section->mr)) ||
> -            memory_region_is_protected(section->mr) ||
> -           /* vhost-vDPA doesn't allow MMIO to be mapped  */
> -            memory_region_is_ram_device(section->mr) ||
> -           /*
> -            * Sizing an enabled 64-bit BAR can cause spurious mappings t=
o
> -            * addresses in the upper part of the 64-bit address space.  =
These
> -            * are never accessed by the CPU and beyond the address width=
 of
> -            * some IOMMU hardware.  TODO: VDPA should tell us the IOMMU =
width.
> -            */
> -           section->offset_within_address_space & (1ULL << 63);
> +static bool vhost_vdpa_listener_skipped_section(MemoryRegionSection *sec=
tion,
> +                                                uint64_t iova_min,
> +                                                uint64_t iova_max)
> +{
> +    Int128 llend;
> +
> +    if ((!memory_region_is_ram(section->mr) &&
> +         !memory_region_is_iommu(section->mr)) ||
> +        memory_region_is_protected(section->mr) ||
> +        /* vhost-vDPA doesn't allow MMIO to be mapped  */
> +        memory_region_is_ram_device(section->mr)) {
> +        return true;
> +    }
> +
> +    if (section->offset_within_address_space < iova_min) {
> +        error_report("RAM section out of device range (min=3D%lu, addr=
=3D%lu)",
> +                     iova_min, section->offset_within_address_space);
> +        return true;
> +    }
> +
> +    llend =3D vhost_vdpa_section_end(section);
> +    if (int128_gt(llend, int128_make64(iova_max))) {
> +        error_report("RAM section out of device range (max=3D%lu, end ad=
dr=3D%lu)",
> +                     iova_max, int128_get64(llend));
> +        return true;
> +    }
> +
> +    return false;
>  }
>
>  static int vhost_vdpa_dma_map(struct vhost_vdpa *v, hwaddr iova, hwaddr =
size,
> @@ -162,7 +176,8 @@ static void vhost_vdpa_listener_region_add(MemoryList=
ener *listener,
>      void *vaddr;
>      int ret;
>
> -    if (vhost_vdpa_listener_skipped_section(section)) {
> +    if (vhost_vdpa_listener_skipped_section(section, v->iova_range.first=
,
> +                                            v->iova_range.last)) {
>          return;
>      }
>
> @@ -220,7 +235,8 @@ static void vhost_vdpa_listener_region_del(MemoryList=
ener *listener,
>      Int128 llend, llsize;
>      int ret;
>
> -    if (vhost_vdpa_listener_skipped_section(section)) {
> +    if (vhost_vdpa_listener_skipped_section(section, v->iova_range.first=
,
> +                                            v->iova_range.last)) {
>          return;
>      }
>
> @@ -288,9 +304,24 @@ static void vhost_vdpa_add_status(struct vhost_dev *=
dev, uint8_t status)
>      vhost_vdpa_call(dev, VHOST_VDPA_SET_STATUS, &s);
>  }
>
> +static int vhost_vdpa_get_iova_range(struct vhost_vdpa *v)
> +{
> +    int ret;
> +
> +    ret =3D vhost_vdpa_call(v->dev, VHOST_VDPA_GET_IOVA_RANGE, &v->iova_=
range);
> +    if (ret !=3D 0) {
> +        return ret;
> +    }

I think we need a fallback for the kernel that does not support
VHOST_VDPA_GET_IOVA_RANGE?

Thanks

> +
> +    trace_vhost_vdpa_get_iova_range(v->dev, v->iova_range.first,
> +                                    v->iova_range.last);
> +    return ret;
> +}
> +
>  static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque, Error **=
errp)
>  {
>      struct vhost_vdpa *v;
> +    int r;
>      assert(dev->vhost_ops->backend_type =3D=3D VHOST_BACKEND_TYPE_VDPA);
>      trace_vhost_vdpa_init(dev, opaque);
>
> @@ -300,6 +331,11 @@ static int vhost_vdpa_init(struct vhost_dev *dev, vo=
id *opaque, Error **errp)
>      v->listener =3D vhost_vdpa_memory_listener;
>      v->msg_type =3D VHOST_IOTLB_MSG_V2;
>
> +    r =3D vhost_vdpa_get_iova_range(v);
> +    if (unlikely(!r)) {
> +        return r;
> +    }
> +
>      vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
>                                 VIRTIO_CONFIG_S_DRIVER);
>
> diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
> index 8ed19e9d0c..650e521e35 100644
> --- a/hw/virtio/trace-events
> +++ b/hw/virtio/trace-events
> @@ -52,6 +52,7 @@ vhost_vdpa_set_vring_call(void *dev, unsigned int index=
, int fd) "dev: %p index:
>  vhost_vdpa_get_features(void *dev, uint64_t features) "dev: %p features:=
 0x%"PRIx64
>  vhost_vdpa_set_owner(void *dev) "dev: %p"
>  vhost_vdpa_vq_get_addr(void *dev, void *vq, uint64_t desc_user_addr, uin=
t64_t avail_user_addr, uint64_t used_user_addr) "dev: %p vq: %p desc_user_a=
ddr: 0x%"PRIx64" avail_user_addr: 0x%"PRIx64" used_user_addr: 0x%"PRIx64
> +vhost_vdpa_get_iova_range(void *dev, uint64_t first, uint64_t last) "dev=
: %p first: 0x%"PRIx64" last: 0x%"PRIx64
>
>  # virtio.c
>  virtqueue_alloc_element(void *elem, size_t sz, unsigned in_num, unsigned=
 out_num) "elem %p size %zd in_num %u out_num %u"
> --
> 2.27.0
>


