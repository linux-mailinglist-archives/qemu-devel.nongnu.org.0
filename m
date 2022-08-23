Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7CA59DAF7
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 13:38:38 +0200 (CEST)
Received: from localhost ([::1]:49174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQSEv-0005rv-1J
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 07:38:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oQS9J-0001WI-CX
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 07:32:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oQS9G-0001dD-8Z
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 07:32:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661254365;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YmdJLMV9oCzjqPyxWrF0n4St9RIie3HL2Hb8WDsPiyE=;
 b=Rd25l+aX3Jx53DZFdyJkrEI2KR/LR8U6T3Amn/uf8GkXeUolcVMzcgiHxitI7tgd1JqGki
 TspIjMLsJT6wYYpbwP23Ar43u+WG8/pkJbiqsYWkY4VkPXE//CMbsLvewRmSRhgHa4p1Y5
 rgJdJ2mmy+Y7Q6jIEKKukRISLkfPA2Q=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-302-unRQ4rEBONKsI6BrjV77zw-1; Tue, 23 Aug 2022 07:32:44 -0400
X-MC-Unique: unRQ4rEBONKsI6BrjV77zw-1
Received: by mail-qv1-f71.google.com with SMTP id
 d10-20020a0cf6ca000000b00496744bc8e6so7184821qvo.2
 for <qemu-devel@nongnu.org>; Tue, 23 Aug 2022 04:32:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=YmdJLMV9oCzjqPyxWrF0n4St9RIie3HL2Hb8WDsPiyE=;
 b=oR9X5NYNm4FvlRAPE/jlFWZ0pXSqJuGqojC7kefBSQPC0GSKd6x1KCujczrzQAAvGE
 NRWqKZIALFiW/BFJ8ynqRroYJMwrMjVGHK2MuHUvwneqrF3Ji3HRmr/kUEPuXAZ66oju
 F/7dXMVNT5/nQSXFXpyhCji9nnzdAalq+sBJOXi1Y5q+V7uik+KOcHviiNr5OIgVuEYU
 ZxHs6MpKNHgJqrOwcEgX7DwHwSSu0Mh2MFwtOUBksDEVuW2mwH6HkHCSwVE8QyaIEquF
 iExgDae4N7cjeezXpTZgxA7cAzhwjhgNyeAHNCmYTydS1RCgGQ59NqM6TvjlEI5vpHYe
 qorA==
X-Gm-Message-State: ACgBeo3xY561D0Y5DItdVJR5HVYUDHjESERPcnIvKc9o+rc3NsNHk6wP
 V0xsthTH7TenF6bn4Ujw+CfspA9O4A0OfIAw0eunnqUrM3joja2d5ysHJI1Zj/Qii4lf9IxQ/sG
 zh5jWfm7GWVs67Mpm0mnjjzbGafCYOJM=
X-Received: by 2002:a37:2c06:0:b0:6bb:242:d117 with SMTP id
 s6-20020a372c06000000b006bb0242d117mr15834372qkh.234.1661254363561; 
 Tue, 23 Aug 2022 04:32:43 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4Ag7EkA+zfkM+VlQrPJdqu+epLYo1UBlbjbtaoH5hi7fOT+EjAX3MpVmAeV0wyItXBspxMlP8ll1LVOoLxwbI=
X-Received: by 2002:a37:2c06:0:b0:6bb:242:d117 with SMTP id
 s6-20020a372c06000000b006bb0242d117mr15834358qkh.234.1661254363354; Tue, 23
 Aug 2022 04:32:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220819165357.3591965-1-eperezma@redhat.com>
 <20220819165357.3591965-8-eperezma@redhat.com>
 <f55e8c88-4ea6-0152-73c1-afa1601dfb26@redhat.com>
In-Reply-To: <f55e8c88-4ea6-0152-73c1-afa1601dfb26@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 23 Aug 2022 13:32:07 +0200
Message-ID: <CAJaqyWf2HAoOiE-J9fQuWdKb1-VZ9Juk5K7Fr=fXA=PWapwjAg@mail.gmail.com>
Subject: Re: [PATCH 7/7] vdpa: Use ring hwaddr at vhost_vdpa_svq_unmap_ring
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-level <qemu-devel@nongnu.org>, Lei Yang <leiyang@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Cindy Lu <lulu@redhat.com>,
 Peter Xu <peterx@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

On Tue, Aug 23, 2022 at 8:40 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2022/8/20 00:53, Eugenio P=C3=A9rez =E5=86=99=E9=81=93:
> > Reduce code duplication.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
>
>
> Acked-by: Jason Wang <jasowang@redhat.com>
>
> (In the future, we need to look for other cases where a function may use
> only a partial of DMAMap.)
>

Do you have a use case in mind? The IOVA tree also trusts the memory
listener will unmap and map chunks symmetrically.

Thanks!

> Thanks
>
>
> > ---
> >   hw/virtio/vhost-vdpa.c | 17 ++++++++---------
> >   1 file changed, 8 insertions(+), 9 deletions(-)
> >
> > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > index 07d00f5284..45d6e86b45 100644
> > --- a/hw/virtio/vhost-vdpa.c
> > +++ b/hw/virtio/vhost-vdpa.c
> > @@ -884,10 +884,12 @@ static int vhost_vdpa_svq_set_fds(struct vhost_de=
v *dev,
> >   /**
> >    * Unmap a SVQ area in the device
> >    */
> > -static void vhost_vdpa_svq_unmap_ring(struct vhost_vdpa *v,
> > -                                      const DMAMap *needle)
> > +static void vhost_vdpa_svq_unmap_ring(struct vhost_vdpa *v, hwaddr add=
r)
> >   {
> > -    const DMAMap *result =3D vhost_iova_tree_find_iova(v->iova_tree, n=
eedle);
> > +    const DMAMap needle =3D {
> > +        .translated_addr =3D addr,
> > +    };
> > +    const DMAMap *result =3D vhost_iova_tree_find_iova(v->iova_tree, &=
needle);
> >       hwaddr size;
> >       int r;
> >
> > @@ -908,17 +910,14 @@ static void vhost_vdpa_svq_unmap_ring(struct vhos=
t_vdpa *v,
> >   static void vhost_vdpa_svq_unmap_rings(struct vhost_dev *dev,
> >                                          const VhostShadowVirtqueue *sv=
q)
> >   {
> > -    DMAMap needle =3D {};
> >       struct vhost_vdpa *v =3D dev->opaque;
> >       struct vhost_vring_addr svq_addr;
> >
> >       vhost_svq_get_vring_addr(svq, &svq_addr);
> >
> > -    needle.translated_addr =3D svq_addr.desc_user_addr;
> > -    vhost_vdpa_svq_unmap_ring(v, &needle);
> > +    vhost_vdpa_svq_unmap_ring(v, svq_addr.desc_user_addr);
> >
> > -    needle.translated_addr =3D svq_addr.used_user_addr;
> > -    vhost_vdpa_svq_unmap_ring(v, &needle);
> > +    vhost_vdpa_svq_unmap_ring(v, svq_addr.used_user_addr);
> >   }
> >
> >   /**
> > @@ -996,7 +995,7 @@ static bool vhost_vdpa_svq_map_rings(struct vhost_d=
ev *dev,
> >       ok =3D vhost_vdpa_svq_map_ring(v, &device_region, errp);
> >       if (unlikely(!ok)) {
> >           error_prepend(errp, "Cannot create vq device region: ");
> > -        vhost_vdpa_svq_unmap_ring(v, &driver_region);
> > +        vhost_vdpa_svq_unmap_ring(v, driver_region.translated_addr);
> >       }
> >       addr->used_user_addr =3D device_region.iova;
> >
>


