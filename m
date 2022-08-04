Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6FD589E32
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 17:07:42 +0200 (CEST)
Received: from localhost ([::1]:44196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJcRo-00013T-Fd
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 11:07:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oJcNp-0005X2-NC
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 11:03:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55272)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oJcNm-00048z-JT
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 11:03:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659625409;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rwRxCAreodM30BtTPiubKaaUADs4et7NUJZtjk9FDvg=;
 b=Hq6t2M+iQ01vxLJxxcTNwIuhByLjNyBWw4qcH82dDp07gR7vo3pFj/gPqW7/eKjN4cR7Yk
 Cb6u+XVOPuPQzLZYaF+pHoUjKbon+gT0SUdqoXy8KGIJniDnlmB2iaxOPwCilEiphtYrVO
 CktN8jzKQZmGVM44/EfXVQ2X2ahpiX8=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-576-BTuLmWdwPXe4NrL3b1HHRg-1; Thu, 04 Aug 2022 11:03:27 -0400
X-MC-Unique: BTuLmWdwPXe4NrL3b1HHRg-1
Received: by mail-qk1-f197.google.com with SMTP id
 bk21-20020a05620a1a1500b006b5c24695a4so16125062qkb.15
 for <qemu-devel@nongnu.org>; Thu, 04 Aug 2022 08:03:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=rwRxCAreodM30BtTPiubKaaUADs4et7NUJZtjk9FDvg=;
 b=SYD1fH8/p4nDUTNrygi877WivHfCxDfhX5AS1JMlCfDHY8HCyzxGCNnTeSOkH/AOnL
 AwFn8zwA5K8ID0QmIRmA3hcZQv2Wu6ba4JTHNuSNuiO3lAH0simQLenRC6AXeMZVSak2
 GT+vTUTwPQ6W2rTM9QGiylqLc6L8fGizWyooJyLFfwrIKXmIRsKKuwuZj1rrfyaWe/QZ
 CtX8k5ipIFi1HNxU2XBwYTg+X8itMjll9+w3vfuvjLUlU0Fo+9KtCOHQtWdUfD+rHYu6
 9sq2p2JE7KYUoHTWjygA0rR9AIvGOEI2ddP0UYw17jIligdhTbnBLGsjI/sBm2Hp0VNJ
 LmVQ==
X-Gm-Message-State: ACgBeo2bRYw3L6p90/iQMgOKumUERYT72Im0NQ7sIOpQBY5kZW0u2Rr6
 mWiBXVmxIxmhbx3J54/lZPagaXdXGZMJcMMeUFUbbj6Wv6gEsbiE2Xo0Q/zKCkhLAOQJgrzErLw
 6ldoP9pvkl9ExjZlBQ79EWqB9ZpJ14nw=
X-Received: by 2002:a05:620a:f10:b0:6aa:318e:55a9 with SMTP id
 v16-20020a05620a0f1000b006aa318e55a9mr1666223qkl.559.1659625406906; 
 Thu, 04 Aug 2022 08:03:26 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6Od7n8D85cI6ZSoFKweyU/e02Yi8cPuVDAD74Vgw69bmhGkj4zg3CAOFRn0CGvpjEKCSBxMDT1nAIIauplApk=
X-Received: by 2002:a05:620a:f10:b0:6aa:318e:55a9 with SMTP id
 v16-20020a05620a0f1000b006aa318e55a9mr1666196qkl.559.1659625406648; Thu, 04
 Aug 2022 08:03:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220802143908.274364-1-eperezma@redhat.com>
 <CACGkMEtHaMXFqUN1o=Z-1c=s1hX81umSEbxP6Vf9cH34aERhYw@mail.gmail.com>
 <CAJaqyWe0uxicTKOzM9Yp5PV6diTBFSKX2m8BVqckrMTD7dctYg@mail.gmail.com>
 <e34cd9ee-ccb3-8447-28f1-9500b9f0a106@redhat.com>
In-Reply-To: <e34cd9ee-ccb3-8447-28f1-9500b9f0a106@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Thu, 4 Aug 2022 17:02:50 +0200
Message-ID: <CAJaqyWebpuOcuud7F4KaQ3mmyf_4v6n4k9FJv_mzK0jVj2aVyA@mail.gmail.com>
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

On Thu, Aug 4, 2022 at 6:51 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2022/8/3 16:12, Eugenio Perez Martin =E5=86=99=E9=81=93:
> > On Wed, Aug 3, 2022 at 10:09 AM Jason Wang <jasowang@redhat.com> wrote:
> >> On Tue, Aug 2, 2022 at 10:39 PM Eugenio P=C3=A9rez <eperezma@redhat.co=
m> wrote:
> >>> If a map fails for whatever reason, it must not be saved in the tree.
> >>> Otherwise, qemu will try to unmap it in cleanup, leaving to more erro=
rs.
> >>>
> >>> Fixes: 34e3c94eda ("vdpa: Add custom IOTLB translations to SVQ")
> >>> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> >>> ---
> >>>   hw/virtio/vhost-vdpa.c | 20 +++++++++++++-------
> >>>   1 file changed, 13 insertions(+), 7 deletions(-)
> >>>
> >>> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> >>> index 3ff9ce3501..e44c23dce5 100644
> >>> --- a/hw/virtio/vhost-vdpa.c
> >>> +++ b/hw/virtio/vhost-vdpa.c
> >>> @@ -176,6 +176,7 @@ static void vhost_vdpa_listener_commit(MemoryList=
ener *listener)
> >>>   static void vhost_vdpa_listener_region_add(MemoryListener *listener=
,
> >>>                                              MemoryRegionSection *sec=
tion)
> >>>   {
> >>> +    DMAMap mem_region =3D {};
> >>>       struct vhost_vdpa *v =3D container_of(listener, struct vhost_vd=
pa, listener);
> >>>       hwaddr iova;
> >>>       Int128 llend, llsize;
> >>> @@ -212,13 +213,13 @@ static void vhost_vdpa_listener_region_add(Memo=
ryListener *listener,
> >>>
> >>>       llsize =3D int128_sub(llend, int128_make64(iova));
> >>>       if (v->shadow_vqs_enabled) {
> >>> -        DMAMap mem_region =3D {
> >>> -            .translated_addr =3D (hwaddr)(uintptr_t)vaddr,
> >>> -            .size =3D int128_get64(llsize) - 1,
> >>> -            .perm =3D IOMMU_ACCESS_FLAG(true, section->readonly),
> >>> -        };
> >> Nit: can we keep this part unchanged?
> >>
> > We can, but that implies we should look for iova again at fail_map
> > tag. If you are ok with that I'm fine to perform the search again.
>
>
> I meant something like:
>
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 9a2daef7e3..edf40868e3 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -232,11 +232,15 @@ static void
> vhost_vdpa_listener_region_add(MemoryListener *listener,
>                                vaddr, section->readonly);
>       if (ret) {
>           error_report("vhost vdpa map fail!");
> -        goto fail;
> +        goto fail_unmap;
>       }
>
>       return;
>
> +fail_unmap:
> +    if (v->shadow_vqs_enabled) {
> +        vhost_iova_tree_remove(v->iova_tree, &mem_region);
> +    }
>   fail:
>       /*
>        * On the initfn path, store the first error in the container so we
>

Sorry, still not following.

mem_region does not exist in the error path, since it's declared in
the if (v->shadow_vqs_enabled){} block. We can left first part
unchanged if we do a lookup for the mem region, based on the
translated addr.

Thanks!

> Thanks
>
>
> >
> >> Thanks
> >>
> >>> +        int r;
> >>>
> >>> -        int r =3D vhost_iova_tree_map_alloc(v->iova_tree, &mem_regio=
n);
> >>> +        mem_region.translated_addr =3D (hwaddr)(uintptr_t)vaddr,
> >>> +        mem_region.size =3D int128_get64(llsize) - 1,
> >>> +        mem_region.perm =3D IOMMU_ACCESS_FLAG(true, section->readonl=
y),
> >>> +
> >>> +        r =3D vhost_iova_tree_map_alloc(v->iova_tree, &mem_region);
> >>>           if (unlikely(r !=3D IOVA_OK)) {
> >>>               error_report("Can't allocate a mapping (%d)", r);
> >>>               goto fail;
> >>> @@ -232,11 +233,16 @@ static void vhost_vdpa_listener_region_add(Memo=
ryListener *listener,
> >>>                                vaddr, section->readonly);
> >>>       if (ret) {
> >>>           error_report("vhost vdpa map fail!");
> >>> -        goto fail;
> >>> +        goto fail_map;
> >>>       }
> >>>
> >>>       return;
> >>>
> >>> +fail_map:
> >>> +    if (v->shadow_vqs_enabled) {
> >>> +        vhost_iova_tree_remove(v->iova_tree, &mem_region);
> >>> +    }
> >>> +
> >>>   fail:
> >>>       /*
> >>>        * On the initfn path, store the first error in the container s=
o we
> >>> --
> >>> 2.31.1
> >>>
>


