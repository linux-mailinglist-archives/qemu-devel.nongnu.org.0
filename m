Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02EF15888AE
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 10:22:28 +0200 (CEST)
Received: from localhost ([::1]:59508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJ9e6-0000bY-NO
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 04:22:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oJ9Uw-0003w4-UO
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 04:13:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22137)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oJ9Ut-0001A1-Kg
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 04:12:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659514375;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/hdAtoq5AeBgbIgUaaNC4SJxBpbt+ktjZuGiBQE755c=;
 b=Of1ObvxxIUbWENr4I9MWXiLhNxzKMmGwiQnddeQJocFTlnEOsUmV7kXgc9mUL8ItCrv22T
 KjXngEKxwQyW6dbE61ARZAExezeWS93qqUunW/KFpUD/OpPgAYYTemRkauJRZNhm+cE2Rk
 Eem4NJRE+GaIwocvBGVsnqnWfQ9FhuA=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-610-ShHQRWoPO_Gulw3LS6KGEw-1; Wed, 03 Aug 2022 04:12:53 -0400
X-MC-Unique: ShHQRWoPO_Gulw3LS6KGEw-1
Received: by mail-qv1-f71.google.com with SMTP id
 m11-20020a0cfbab000000b004738181b474so9524686qvp.6
 for <qemu-devel@nongnu.org>; Wed, 03 Aug 2022 01:12:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/hdAtoq5AeBgbIgUaaNC4SJxBpbt+ktjZuGiBQE755c=;
 b=lrTW2C/38LpSj0KelWzZpM+XD0P262+bG9e2er+MvNhD1EM/R910cT/NCAP4908l7y
 92QKLhhz1DNLpGZ51AjIux/4jEAC0Xmtsv1GWJH4LDn9AWH5PqG7wGFQuqitVcla7WUQ
 wDw1iq7R8xtoXH6ypm2TdnNVOMGyDs52wf7KR4JbT901+TsFffiG+z5YezerRMquskyH
 bWueMSJt1BquaXxTdvIyKvVMuo56EOK1LUk1a5JpnJD7T8z4F0ppjs0EcMXM9DVxbbkk
 Vv8jOeQx135+t4o2Tl/DINlMz3nRsejJUZht/AiT3dkAU10v8j9lYKrZjHyiZW6KQGhp
 pQnA==
X-Gm-Message-State: AJIora/tBosMs34kBWw4sc5/tVIYODudWMCFAYodTJIfDe5wWtPMrLL3
 Pt4KPwqQcpn45QMsaGtQjPV3+5z7oKTPaASLiExR5D85YxzBkA4LtwbwXQ6DrHq6Y6RVrw0aiA3
 EoX2Q/6T+ncdmJyPFQckCTE1IUba60S0=
X-Received: by 2002:a05:620a:1456:b0:6b5:dbd5:3c50 with SMTP id
 i22-20020a05620a145600b006b5dbd53c50mr17294365qkl.193.1659514373336; 
 Wed, 03 Aug 2022 01:12:53 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1smuCWSxM0eOfSi+IwzeIsix/kNnTZVoE+PJ2K2btJ5tb0YkGXM2eldYw5R/zDJa5vxW3CeSErpG+xET4K6RkE=
X-Received: by 2002:a05:620a:1456:b0:6b5:dbd5:3c50 with SMTP id
 i22-20020a05620a145600b006b5dbd53c50mr17294362qkl.193.1659514373117; Wed, 03
 Aug 2022 01:12:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220802143908.274364-1-eperezma@redhat.com>
 <CACGkMEtHaMXFqUN1o=Z-1c=s1hX81umSEbxP6Vf9cH34aERhYw@mail.gmail.com>
In-Reply-To: <CACGkMEtHaMXFqUN1o=Z-1c=s1hX81umSEbxP6Vf9cH34aERhYw@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Wed, 3 Aug 2022 10:12:17 +0200
Message-ID: <CAJaqyWe0uxicTKOzM9Yp5PV6diTBFSKX2m8BVqckrMTD7dctYg@mail.gmail.com>
Subject: Re: [PATCH] vdpa: do not save failed dma maps in SVQ iova tree
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Aug 3, 2022 at 10:09 AM Jason Wang <jasowang@redhat.com> wrote:
>
> On Tue, Aug 2, 2022 at 10:39 PM Eugenio P=C3=A9rez <eperezma@redhat.com> =
wrote:
> >
> > If a map fails for whatever reason, it must not be saved in the tree.
> > Otherwise, qemu will try to unmap it in cleanup, leaving to more errors=
.
> >
> > Fixes: 34e3c94eda ("vdpa: Add custom IOTLB translations to SVQ")
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >  hw/virtio/vhost-vdpa.c | 20 +++++++++++++-------
> >  1 file changed, 13 insertions(+), 7 deletions(-)
> >
> > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > index 3ff9ce3501..e44c23dce5 100644
> > --- a/hw/virtio/vhost-vdpa.c
> > +++ b/hw/virtio/vhost-vdpa.c
> > @@ -176,6 +176,7 @@ static void vhost_vdpa_listener_commit(MemoryListen=
er *listener)
> >  static void vhost_vdpa_listener_region_add(MemoryListener *listener,
> >                                             MemoryRegionSection *sectio=
n)
> >  {
> > +    DMAMap mem_region =3D {};
> >      struct vhost_vdpa *v =3D container_of(listener, struct vhost_vdpa,=
 listener);
> >      hwaddr iova;
> >      Int128 llend, llsize;
> > @@ -212,13 +213,13 @@ static void vhost_vdpa_listener_region_add(Memory=
Listener *listener,
> >
> >      llsize =3D int128_sub(llend, int128_make64(iova));
> >      if (v->shadow_vqs_enabled) {
> > -        DMAMap mem_region =3D {
> > -            .translated_addr =3D (hwaddr)(uintptr_t)vaddr,
> > -            .size =3D int128_get64(llsize) - 1,
> > -            .perm =3D IOMMU_ACCESS_FLAG(true, section->readonly),
> > -        };
>
> Nit: can we keep this part unchanged?
>

We can, but that implies we should look for iova again at fail_map
tag. If you are ok with that I'm fine to perform the search again.

> Thanks
>
> > +        int r;
> >
> > -        int r =3D vhost_iova_tree_map_alloc(v->iova_tree, &mem_region)=
;
> > +        mem_region.translated_addr =3D (hwaddr)(uintptr_t)vaddr,
> > +        mem_region.size =3D int128_get64(llsize) - 1,
> > +        mem_region.perm =3D IOMMU_ACCESS_FLAG(true, section->readonly)=
,
> > +
> > +        r =3D vhost_iova_tree_map_alloc(v->iova_tree, &mem_region);
> >          if (unlikely(r !=3D IOVA_OK)) {
> >              error_report("Can't allocate a mapping (%d)", r);
> >              goto fail;
> > @@ -232,11 +233,16 @@ static void vhost_vdpa_listener_region_add(Memory=
Listener *listener,
> >                               vaddr, section->readonly);
> >      if (ret) {
> >          error_report("vhost vdpa map fail!");
> > -        goto fail;
> > +        goto fail_map;
> >      }
> >
> >      return;
> >
> > +fail_map:
> > +    if (v->shadow_vqs_enabled) {
> > +        vhost_iova_tree_remove(v->iova_tree, &mem_region);
> > +    }
> > +
> >  fail:
> >      /*
> >       * On the initfn path, store the first error in the container so w=
e
> > --
> > 2.31.1
> >
>


