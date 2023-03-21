Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E47C26C2C36
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 09:22:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peXFR-0003GE-0h; Tue, 21 Mar 2023 04:21:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1peXFP-0003G5-9j
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 04:21:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1peXFN-0005uh-EN
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 04:21:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679386892;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w7B3jdHQ94/0yTwjwZZYa8M2YqCZmOWk10hEVoYiCFU=;
 b=hJVoKL7xQl30W+uYy8Ul8Q7dMeeaB1nM3qxkZJazTYeuQ6CJHCoJSSefuWrayqqKn2uJCu
 sp39jgVDA/Y8ghBtMHb9S5C8nXwAsEf333utCFgt4kbELyE6yNv3CSiSGuHEHXt/k7JWBr
 kHZqzL9LSKlnLfwD3h8xImy/woyDEb8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-627-jPkkQCIUN8WU-EZ-M5upJw-1; Tue, 21 Mar 2023 04:21:30 -0400
X-MC-Unique: jPkkQCIUN8WU-EZ-M5upJw-1
Received: by mail-wm1-f71.google.com with SMTP id
 k18-20020a05600c1c9200b003ed2a3f101fso9626031wms.9
 for <qemu-devel@nongnu.org>; Tue, 21 Mar 2023 01:21:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679386889;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w7B3jdHQ94/0yTwjwZZYa8M2YqCZmOWk10hEVoYiCFU=;
 b=mBbEb4ZT223MmvZ2Jqgaxflyqjt1+eTgkpFKAJ6QNxfv2aVYDndrTdk9PbKDp5db9O
 t9o75W3ydh7wN10bT4VL09Ikx5MuEZAYLSc/CwOgzcbNf5C9XzWMM/7U6yFa5chPUC+b
 ru321GTKQ91okzZO9i/KgwveD6hrlY1hYZMZzZlYCw/WoDnCRumUYHQ7Td6ceD/emraC
 jg4UjxCk+IiLzYTxPjji5gyoLvmMSF+R0y+fZjSybY3chOpti0By04XzBLNg2lufHjig
 KJIWdIftt6YHolkJ4a0fnnSJGva2Sq345a7dRytvclJ3MPWuRHRZ2jr7Y+xNYQMW8j4u
 0r9w==
X-Gm-Message-State: AO0yUKX8M2JQ6ZX5ppL7iI59yqq8FxB9SMhd+hXA+3hKsU/a52K6C2am
 xbm/MdTNXqgt/l981IocjP+mJDi50kFOAHuSPeAZviyj2zkpOe0eO5Ra10x8H9rMDdApOitWYzm
 jqc8+k3F+I1nyziEhnVtFhJsJsplXm+Y=
X-Received: by 2002:a7b:c444:0:b0:3ed:779c:4063 with SMTP id
 l4-20020a7bc444000000b003ed779c4063mr509961wmi.8.1679386889030; 
 Tue, 21 Mar 2023 01:21:29 -0700 (PDT)
X-Google-Smtp-Source: AK7set9LklDfKYF4BjaFNPLE+2+DqisLKCMCRZdABjvtTvkLHxXKRpTvGM6sGwxZw0TxfEBgp9E/DBW3nQ8bMqifGNQ=
X-Received: by 2002:a7b:c444:0:b0:3ed:779c:4063 with SMTP id
 l4-20020a7bc444000000b003ed779c4063mr509956wmi.8.1679386888693; Tue, 21 Mar
 2023 01:21:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230320161959.650841-1-lulu@redhat.com>
 <20230320161959.650841-5-lulu@redhat.com>
 <CACGkMEuRZ4EvtYq45ZF0wgjR4g6eZHCfsfcgG45HfeAkZ47gGg@mail.gmail.com>
In-Reply-To: <CACGkMEuRZ4EvtYq45ZF0wgjR4g6eZHCfsfcgG45HfeAkZ47gGg@mail.gmail.com>
From: Cindy Lu <lulu@redhat.com>
Date: Tue, 21 Mar 2023 16:20:50 +0800
Message-ID: <CACLfguWMp_Q_uQ11NwdN=kU5vwQG-sE++Ch94S=pMPB4KQvAMQ@mail.gmail.com>
Subject: Re: [PATCH v14 4/4] vhost-vdpa: Add support for vIOMMU.
To: Jason Wang <jasowang@redhat.com>
Cc: mst@redhat.com, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lulu@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Mar 21, 2023 at 11:21=E2=80=AFAM Jason Wang <jasowang@redhat.com> w=
rote:
>
> On Tue, Mar 21, 2023 at 12:20=E2=80=AFAM Cindy Lu <lulu@redhat.com> wrote=
:
> >
> > 1. The vIOMMU support will make vDPA can work in IOMMU mode. This
> > will fix security issues while using the no-IOMMU mode.
> > To support this feature we need to add new functions for IOMMU MR adds =
and
> > deletes.
> >
> > Also since the SVQ does not support vIOMMU yet, add the check for IOMMU
> > in vhost_vdpa_dev_start, if the SVQ and IOMMU enable at the same time
> > the function will return fail.
> >
> > 2. Skip the iova_max check vhost_vdpa_listener_skipped_section(). While
> > MR is IOMMU, move this check to  vhost_vdpa_iommu_map_notify()
> >
> > Verified in vp_vdpa and vdpa_sim_net driver
> >
> > Signed-off-by: Cindy Lu <lulu@redhat.com>
> > ---
> >  hw/virtio/vhost-vdpa.c         | 149 +++++++++++++++++++++++++++++++--
> >  include/hw/virtio/vhost-vdpa.h |  11 +++
> >  2 files changed, 152 insertions(+), 8 deletions(-)
> >
> > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > index 0c8c37e786..b36922b365 100644
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
> > @@ -60,15 +61,22 @@ static bool vhost_vdpa_listener_skipped_section(Mem=
oryRegionSection *section,
> >                       iova_min, section->offset_within_address_space);
> >          return true;
> >      }
> > +    /*
> > +     * While using vIOMMU, sometimes the section will be larger than i=
ova_max,
> > +     * but the memory that actually maps is smaller, so move the check=
 to
> > +     * function vhost_vdpa_iommu_map_notify(). That function will use =
the actual
> > +     * size that maps to the kernel
> > +     */
> >
> > -    llend =3D vhost_vdpa_section_end(section);
> > -    if (int128_gt(llend, int128_make64(iova_max))) {
> > -        error_report("RAM section out of device range (max=3D0x%" PRIx=
64
> > -                     ", end addr=3D0x%" PRIx64 ")",
> > -                     iova_max, int128_get64(llend));
> > -        return true;
> > +    if (!memory_region_is_iommu(section->mr)) {
> > +        llend =3D vhost_vdpa_section_end(section);
> > +        if (int128_gt(llend, int128_make64(iova_max))) {
> > +            error_report("RAM section out of device range (max=3D0x%" =
PRIx64
> > +                         ", end addr=3D0x%" PRIx64 ")",
> > +                         iova_max, int128_get64(llend));
> > +            return true;
> > +        }
> >      }
> > -
>
> Unnecessary changes.
>
will fix this
> >      return false;
> >  }
> >
> > @@ -185,6 +193,118 @@ static void vhost_vdpa_listener_commit(MemoryList=
ener *listener)
> >      v->iotlb_batch_begin_sent =3D false;
> >  }
> >
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
> > +    Int128 llend;
> > +
> > +    if (iotlb->target_as !=3D &address_space_memory) {
> > +        error_report("Wrong target AS \"%s\", only system memory is al=
lowed",
> > +                     iotlb->target_as->name ? iotlb->target_as->name :=
 "none");
> > +        return;
> > +    }
> > +    RCU_READ_LOCK_GUARD();
> > +    /* check if RAM section out of device range */
> > +    llend =3D int128_add(int128_makes64(iotlb->addr_mask), int128_make=
s64(iova));
> > +    if (int128_gt(llend, int128_make64(v->iova_range.last))) {
> > +        error_report("RAM section out of device range (max=3D0x%" PRIx=
64
> > +                     ", end addr=3D0x%" PRIx64 ")",
> > +                     v->iova_range.last, int128_get64(llend));
> > +        return;
> > +    }
> > +
> > +    vhost_vdpa_iotlb_batch_begin_once(v);
>
> Quoted from you answer in V1:
>
> "
> the VHOST_IOTLB_BATCH_END message was send by
> vhost_vdpa_listener_commit, because we only use
> one vhost_vdpa_memory_listener and no-iommu mode will also need to use
> this listener, So we still need to add the batch begin here, based on
> my testing after the notify function was called,  the listener_commit
> function was also called .so it works well in this situation
> "
>
> This assumes the map_notify to be called within the memory
> transactions which is not necessarily the case.
>
> I think it could be triggered when guest tries to establish a new
> mapping in the vIOMMU. In this case there's no memory transactions at
> all?
>
sure, thanks will fix this
> Thanks
>


