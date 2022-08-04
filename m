Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAFB5589EEB
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 17:53:16 +0200 (CEST)
Received: from localhost ([::1]:33588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJd9v-0002ZZ-RA
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 11:53:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oJd8G-00010l-L2
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 11:51:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46306)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oJd8D-00038v-MB
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 11:51:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659628288;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bq9MrasRVDh2DPtAB1APKVnEdpAcjshkwiusEqYvi1U=;
 b=WkkrXOWhvnrI2bcV4ogwnBleBcqwuN7GmJ0VwCwvCppi/g3Z4c7vwGYylTx5eRMkzyPI2m
 aCvIZfzXVyooDdZcaXp+0PeHLGz/EgCqHLcrNaDJfmrlQpbe9sFRhai8yN91ka5paeuPfZ
 7jXIDtrW0SYP7ZxGA99ovI+JLB3SQ1E=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-340-Pp8vwl4-NXmt99EW574Rww-1; Thu, 04 Aug 2022 11:51:27 -0400
X-MC-Unique: Pp8vwl4-NXmt99EW574Rww-1
Received: by mail-qt1-f198.google.com with SMTP id
 hf13-20020a05622a608d00b003214b6b3777so62117qtb.13
 for <qemu-devel@nongnu.org>; Thu, 04 Aug 2022 08:51:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bq9MrasRVDh2DPtAB1APKVnEdpAcjshkwiusEqYvi1U=;
 b=pjqiaswRKdsTCJvoVKXjMmG2lVnuNpyd9CNWIW07ii/MB6b7xjACqxgSoyAUmA240Q
 UFt9Ep5rqA3r2CwozeCTxnVKY9xObYXFX5WvaOQWFnFUGRZGmUJWYvPGfyVAdkSfrMVY
 ANwaQ1Qu5GC5VAz/QspwYeo3/fJfqam3OcRRGywE5MSp5AgT1ulqnC/c6prGrzCz+oyr
 1d3KrZrBZD0gWcWIc3vKjpVzxNCZ3aiet0gfKuLnpIbZLRcGoE0IqLJzo2wO3VASeh44
 r3cVknoTBr5bjQXp+vSghtf8yh5kDYFKbVY4Xn1+G5rgBzmaP1wa4LF+LmyMx+yT5Yli
 IsbA==
X-Gm-Message-State: ACgBeo3R//L1C2ZZk3tnCCzdZv8dNsVQLplcJUvaoNgyo8A1RzLdCZGj
 sZiwOBntjopo3XL9uhMvGigPKNq9/ShyIKDnaZeFwYjSvsKVU4Hu7pYi+eTCtcUjGjZaVMrIRFV
 NPs++h5MTUrl9GMFnQp4m4M1/aFYHCec=
X-Received: by 2002:a05:620a:21d8:b0:6b8:fc6d:e8ba with SMTP id
 h24-20020a05620a21d800b006b8fc6de8bamr1805289qka.193.1659628286584; 
 Thu, 04 Aug 2022 08:51:26 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6H7INypwGOd2AWwLxcLrcisEJReSSp2gSpaR6aOmM/xik9vwgjs7s5Go4KY9Ba+UDzuK2oV7CrQFRld7jIZh4=
X-Received: by 2002:a05:620a:21d8:b0:6b8:fc6d:e8ba with SMTP id
 h24-20020a05620a21d800b006b8fc6de8bamr1805280qka.193.1659628286354; Thu, 04
 Aug 2022 08:51:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220802143908.274364-1-eperezma@redhat.com>
 <CACGkMEtHaMXFqUN1o=Z-1c=s1hX81umSEbxP6Vf9cH34aERhYw@mail.gmail.com>
 <CAJaqyWe0uxicTKOzM9Yp5PV6diTBFSKX2m8BVqckrMTD7dctYg@mail.gmail.com>
 <e34cd9ee-ccb3-8447-28f1-9500b9f0a106@redhat.com>
 <CAJaqyWebpuOcuud7F4KaQ3mmyf_4v6n4k9FJv_mzK0jVj2aVyA@mail.gmail.com>
In-Reply-To: <CAJaqyWebpuOcuud7F4KaQ3mmyf_4v6n4k9FJv_mzK0jVj2aVyA@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Thu, 4 Aug 2022 17:50:50 +0200
Message-ID: <CAJaqyWd0LM1Dfpm1LnBSgjcLOZ-ocLVLNGgWG=hpxtXmMwyi0g@mail.gmail.com>
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

On Thu, Aug 4, 2022 at 5:02 PM Eugenio Perez Martin <eperezma@redhat.com> w=
rote:
>
> On Thu, Aug 4, 2022 at 6:51 AM Jason Wang <jasowang@redhat.com> wrote:
> >
> >
> > =E5=9C=A8 2022/8/3 16:12, Eugenio Perez Martin =E5=86=99=E9=81=93:
> > > On Wed, Aug 3, 2022 at 10:09 AM Jason Wang <jasowang@redhat.com> wrot=
e:
> > >> On Tue, Aug 2, 2022 at 10:39 PM Eugenio P=C3=A9rez <eperezma@redhat.=
com> wrote:
> > >>> If a map fails for whatever reason, it must not be saved in the tre=
e.
> > >>> Otherwise, qemu will try to unmap it in cleanup, leaving to more er=
rors.
> > >>>
> > >>> Fixes: 34e3c94eda ("vdpa: Add custom IOTLB translations to SVQ")
> > >>> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > >>> ---
> > >>>   hw/virtio/vhost-vdpa.c | 20 +++++++++++++-------
> > >>>   1 file changed, 13 insertions(+), 7 deletions(-)
> > >>>
> > >>> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > >>> index 3ff9ce3501..e44c23dce5 100644
> > >>> --- a/hw/virtio/vhost-vdpa.c
> > >>> +++ b/hw/virtio/vhost-vdpa.c
> > >>> @@ -176,6 +176,7 @@ static void vhost_vdpa_listener_commit(MemoryLi=
stener *listener)
> > >>>   static void vhost_vdpa_listener_region_add(MemoryListener *listen=
er,
> > >>>                                              MemoryRegionSection *s=
ection)
> > >>>   {
> > >>> +    DMAMap mem_region =3D {};
> > >>>       struct vhost_vdpa *v =3D container_of(listener, struct vhost_=
vdpa, listener);
> > >>>       hwaddr iova;
> > >>>       Int128 llend, llsize;
> > >>> @@ -212,13 +213,13 @@ static void vhost_vdpa_listener_region_add(Me=
moryListener *listener,
> > >>>
> > >>>       llsize =3D int128_sub(llend, int128_make64(iova));
> > >>>       if (v->shadow_vqs_enabled) {
> > >>> -        DMAMap mem_region =3D {
> > >>> -            .translated_addr =3D (hwaddr)(uintptr_t)vaddr,
> > >>> -            .size =3D int128_get64(llsize) - 1,
> > >>> -            .perm =3D IOMMU_ACCESS_FLAG(true, section->readonly),
> > >>> -        };
> > >> Nit: can we keep this part unchanged?
> > >>
> > > We can, but that implies we should look for iova again at fail_map
> > > tag. If you are ok with that I'm fine to perform the search again.
> >
> >
> > I meant something like:
> >
> > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > index 9a2daef7e3..edf40868e3 100644
> > --- a/hw/virtio/vhost-vdpa.c
> > +++ b/hw/virtio/vhost-vdpa.c
> > @@ -232,11 +232,15 @@ static void
> > vhost_vdpa_listener_region_add(MemoryListener *listener,
> >                                vaddr, section->readonly);
> >       if (ret) {
> >           error_report("vhost vdpa map fail!");
> > -        goto fail;
> > +        goto fail_unmap;
> >       }
> >
> >       return;
> >
> > +fail_unmap:
> > +    if (v->shadow_vqs_enabled) {
> > +        vhost_iova_tree_remove(v->iova_tree, &mem_region);
> > +    }
> >   fail:
> >       /*
> >        * On the initfn path, store the first error in the container so =
we
> >
>
> Sorry, still not following.
>
> mem_region does not exist in the error path, since it's declared in
> the if (v->shadow_vqs_enabled){} block. We can left first part
> unchanged if we do a lookup for the mem region, based on the
> translated addr.
>

Sending v2 expanding the fix without this comment, please let me know
ifI misunderstood something.

Thanks!


