Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0C559DAF3
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 13:35:45 +0200 (CEST)
Received: from localhost ([::1]:38238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQSC7-00035L-LA
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 07:35:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oQS6L-00087X-Ms
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 07:29:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43373)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oQS6I-00016j-75
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 07:29:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661254181;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vZVKIj92DLANrmPojhD39Z818Uv+rbL8ULzjxPDWG20=;
 b=U0cuvp3ie6+Pt3CiJ8N6pXwWwRFJB1FOoW5eqDRY8vyjpFeoX6uCPLyamGbdJLyNEOLbCj
 1S7iRWZXNyc/RMoKDs5djPU/HMmozUMMoPSz2ZOR3xq5qQLnGMEaaY1wHaPgJ9XSNDrktX
 HaEHa8hVcdfdRozDVMxOQbhJCY0cWoM=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-447-k3Kty9EmO0WZwPP-sKw45g-1; Tue, 23 Aug 2022 07:29:39 -0400
X-MC-Unique: k3Kty9EmO0WZwPP-sKw45g-1
Received: by mail-qv1-f69.google.com with SMTP id
 o20-20020a0ccb14000000b00496d08db3beso3865458qvk.8
 for <qemu-devel@nongnu.org>; Tue, 23 Aug 2022 04:29:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=vZVKIj92DLANrmPojhD39Z818Uv+rbL8ULzjxPDWG20=;
 b=KgQ7VpppXwi97H8CYIgFPd6Ysm6bjasox30E78MzAwpmT0PJfzuXlcy2/2rQ+C5CKz
 TtQBNJmcbMSUQdDrYCHGaTutp2M1X6xlsYP5XtgX2tQ9cyr1GfMXtwxcRuHEuGM4RE8I
 8lvlYI/Oqezxo2W36ziQXoXMrlqPI12xf3SfYJSy6OeVLxKAJ0V7SqOvVOGLwqldpoV9
 cF3EB7SxtijuWXRifDXyZdWh8JSIGfNOounVd/Ewr7szp1WGqDxJUK6OdlIJR6a9qz4C
 CVlZ4XTn+6yYWdjm3w5epGJw3YMajE6NUcjJaQ8UoI4el9YKE+dAR4UgjkYkbetdPKrL
 o5Ww==
X-Gm-Message-State: ACgBeo2H+zbLeSO+8wasqWfjC2H8UqD1IW1teHIwSYdCirfwxE+hgvX2
 KmrmhnI2U0TMMBT+WGCOQwPb7tNpLNkziGn6TtFu5I49bcANPwpEOcn7bCX3ncMj54POyQfDOGY
 3izxoKcyXTxLeEZMH+7HIXKA/ACP0tNQ=
X-Received: by 2002:a37:9a8c:0:b0:6ba:c06f:bc1d with SMTP id
 c134-20020a379a8c000000b006bac06fbc1dmr15293907qke.193.1661254179333; 
 Tue, 23 Aug 2022 04:29:39 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6wB/IjTPRzEvLGuNUf3lz5kdDIUnZPqbmEtogHzHJwitQyAPdH7Aea50GhNRUnMvMX+TI45ajCN4BB3plDvgs=
X-Received: by 2002:a37:9a8c:0:b0:6ba:c06f:bc1d with SMTP id
 c134-20020a379a8c000000b006bac06fbc1dmr15293895qke.193.1661254179123; Tue, 23
 Aug 2022 04:29:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220819165357.3591965-1-eperezma@redhat.com>
 <20220819165357.3591965-5-eperezma@redhat.com>
 <709a894f-d333-d13e-a712-dff0a77a85ab@redhat.com>
In-Reply-To: <709a894f-d333-d13e-a712-dff0a77a85ab@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 23 Aug 2022 13:29:03 +0200
Message-ID: <CAJaqyWcRJpLxyJ4DMRyYx_-HNER3b9zHoO+q=3dS4q7EcwU0aQ@mail.gmail.com>
Subject: Re: [PATCH 4/7] vdpa: Remove SVQ vring from iova_tree at shutdown
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-level <qemu-devel@nongnu.org>, Lei Yang <leiyang@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Cindy Lu <lulu@redhat.com>,
 Peter Xu <peterx@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Tue, Aug 23, 2022 at 8:25 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2022/8/20 00:53, Eugenio P=C3=A9rez =E5=86=99=E9=81=93:
> > Although the device will be reset before usage, the right thing to do i=
s
> > to clean it.
> >
> > Reported-by: Lei Yang <leiyang@redhat.com>
> > Fixes: 34e3c94eda ("vdpa: Add custom IOTLB translations to SVQ")
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >   hw/virtio/vhost-vdpa.c | 7 ++++++-
> >   1 file changed, 6 insertions(+), 1 deletion(-)
> >
> > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > index 7e28d2f674..943799c17c 100644
> > --- a/hw/virtio/vhost-vdpa.c
> > +++ b/hw/virtio/vhost-vdpa.c
> > @@ -898,7 +898,12 @@ static bool vhost_vdpa_svq_unmap_ring(struct vhost=
_vdpa *v,
> >
> >       size =3D ROUND_UP(result->size, qemu_real_host_page_size());
> >       r =3D vhost_vdpa_dma_unmap(v, result->iova, size);
> > -    return r =3D=3D 0;
> > +    if (unlikely(r < 0)) {
> > +        return false;
>
>
> vhost-vdpa_svq_map_ring() will call error_report() here, should we do
> the same?
>

We can use it unconditionally on error paths if we don't report
errors. I can try to check if we use that way at this moment.

>      if (unlikely(r !=3D 0)) {
>          error_setg_errno(errp, -r, "Cannot map region to device");
>
> (Btw the error is not very informative, we should dump the map it self
> at least?)
>
> Thanks
>
>
> > +    }
> > +
> > +    vhost_iova_tree_remove(v->iova_tree, result);
> > +    return 0;
> >   }
> >
> >   static bool vhost_vdpa_svq_unmap_rings(struct vhost_dev *dev,
>


