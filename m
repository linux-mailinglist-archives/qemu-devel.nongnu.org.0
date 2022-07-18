Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A10577C47
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 09:17:52 +0200 (CEST)
Received: from localhost ([::1]:56106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDL0p-0006pd-OB
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 03:17:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oDKyN-0004yq-NI
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 03:15:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oDKyJ-0005cM-QS
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 03:15:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658128514;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8pBJ9T5JyN3yVIEyahu+WA18lPFGRwKhy04aFxyuamU=;
 b=WCz3Q+QUrq57iisbkAOM8TPzVD05Xl1CdBTRRpS5AXHMzPOFX+GulrCzTkzobCT710Jt8k
 eUI/2+/rZMhlMYnMKsBoE/UP+XuaU373BpLbcbBb/ffhKJssClCW5rFgvGgPaQ01LNeYU2
 xr1ATb9Ycz5/BtP1ul7mvXwis5QSjm8=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-653-MFh6W1FYMZGrpAD4sfXDvA-1; Mon, 18 Jul 2022 03:15:13 -0400
X-MC-Unique: MFh6W1FYMZGrpAD4sfXDvA-1
Received: by mail-qk1-f198.google.com with SMTP id
 ay35-20020a05620a17a300b006b5d9646d31so4916124qkb.6
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 00:15:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8pBJ9T5JyN3yVIEyahu+WA18lPFGRwKhy04aFxyuamU=;
 b=jLynipAMkVh+mke7grzPR8akTiTgCJ0EB8DOLEoJ2+UgeccaVPqHMIKZGGaIosdihC
 VyC8+Lhr58RV7HsqpUPclD0FnlThugZ7n5bAnZwcPcgSqf9Fd8iwsCxQfgeM8ox5+szL
 97MwWjPA+f81aNuy5wWS5EioCVcfcV+WO3kdWtb7b9fYAivx7+QiWaAVAot46MfxOXGf
 yAFWcuOmW8WUqSHa8D1agf7IC+Ac76mh8JCLwzSmCC9iz3KsOEDpdlm3oRAk5nBQj/P7
 pNgybDbzDE0q5LYzLwhOk3eLECjm5OPcs30Ue7dsli+5LB6qbdOxCVs5Gt15m5PFRb8K
 AKVA==
X-Gm-Message-State: AJIora+TMMXkzkgfT4fMjksL5WCZVNr8/HEsUqrOtWHPlSVgcx+iPJoJ
 P3GQ0+1SGtJ/omvCTljyDpiuf+LSO3HZSOGRUuKw9ZpjRFT5Rb+K4IdHcnHWbrwVq5GVC30H7zr
 oZHBrdcppn0yveLAGtANn/X0rdg6SmMY=
X-Received: by 2002:a05:620a:4256:b0:6ab:54c4:cf9 with SMTP id
 w22-20020a05620a425600b006ab54c40cf9mr16868476qko.234.1658128512906; 
 Mon, 18 Jul 2022 00:15:12 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vY95FRCxps+3S4c2MUuQRwDO1/CITCyW483qRhek5NEMb0TkSXU5B+d5QgxRBgkYkJrNdZPKzUd1HTbfA6c64=
X-Received: by 2002:a05:620a:4256:b0:6ab:54c4:cf9 with SMTP id
 w22-20020a05620a425600b006ab54c40cf9mr16868469qko.234.1658128512687; Mon, 18
 Jul 2022 00:15:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220716113407.2730331-1-eperezma@redhat.com>
 <20220716113407.2730331-2-eperezma@redhat.com>
 <CACGkMEt_85xpsJiUTAu8kny4nEVJqHmBJzK2y5Zp5G_oUgXiFw@mail.gmail.com>
In-Reply-To: <CACGkMEt_85xpsJiUTAu8kny4nEVJqHmBJzK2y5Zp5G_oUgXiFw@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 18 Jul 2022 09:14:36 +0200
Message-ID: <CAJaqyWeDjT+fDRGch+qktRWeK_+qZPs7D3U5vNQMnmCCT5sUqA@mail.gmail.com>
Subject: Re: [RFC PATCH 01/12] vhost: Get vring base from vq, not svq
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 Harpreet Singh Anand <hanand@xilinx.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Eli Cohen <eli@mellanox.com>, 
 Parav Pandit <parav@mellanox.com>, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>, 
 Zhu Lingshan <lingshan.zhu@intel.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Cindy Lu <lulu@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, 
 Liuxiangdong <liuxiangdong5@huawei.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Gautam Dawar <gdawar@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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

On Mon, Jul 18, 2022 at 7:48 AM Jason Wang <jasowang@redhat.com> wrote:
>
> On Sat, Jul 16, 2022 at 7:34 PM Eugenio P=C3=A9rez <eperezma@redhat.com> =
wrote:
> >
> > The SVQ vring used idx usually match with the guest visible one, as lon=
g
> > as all the guest buffers (GPA) maps to exactly one buffer within qemu's
> > VA. However, as we can see in virtqueue_map_desc, a single guest buffer
> > could map to many buffers in SVQ vring.
> >
> > The solution is to stop using the device's used idx and check for the
> > last avail idx. Since we cannot report in-flight descriptors with vdpa,
> > let's rewind all of them.
> >
> > Fixes: 6d0b22266633 ("vdpa: Adapt vhost_vdpa_get_vring_base to SVQ")
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >  hw/virtio/vhost-vdpa.c | 8 +++++---
> >  1 file changed, 5 insertions(+), 3 deletions(-)
> >
> > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > index 795ed5a049..18820498b3 100644
> > --- a/hw/virtio/vhost-vdpa.c
> > +++ b/hw/virtio/vhost-vdpa.c
> > @@ -1194,11 +1194,10 @@ static int vhost_vdpa_get_vring_base(struct vho=
st_dev *dev,
> >                                         struct vhost_vring_state *ring)
> >  {
> >      struct vhost_vdpa *v =3D dev->opaque;
> > -    int vdpa_idx =3D ring->index - dev->vq_index;
> >      int ret;
> >
> >      if (v->shadow_vqs_enabled) {
> > -        VhostShadowVirtqueue *svq =3D g_ptr_array_index(v->shadow_vqs,=
 vdpa_idx);
> > +        VirtQueue *vq =3D virtio_get_queue(dev->vdev, ring->index);
> >
> >          /*
> >           * Setting base as last used idx, so destination will see as a=
vailable
> > @@ -1208,7 +1207,10 @@ static int vhost_vdpa_get_vring_base(struct vhos=
t_dev *dev,
> >           * TODO: This is ok for networking, but other kinds of devices=
 might
> >           * have problems with these retransmissions.
> >           */
> > -        ring->num =3D svq->last_used_idx;
> > +        while (virtqueue_rewind(vq, 1)) {
> > +            continue;
> > +        }
>
> Will this leak mapped VirtQueueElement?
>

vhost_get_vring_base op is called only on the device's teardown path,
so they should be free by vhost_svq_stop.

However, you have a point that maybe vhost_get_vring_base should not
trust in that cleaning, even for -stable.

So I think it should be better to squash this and the next one as the
same fix. But it's doing two things at the same time: One of them is
to use the right state (as vring_base), and another one is not
reverting in-flight descriptors.

Thanks!

> Thanks
>
> > +        ring->num =3D virtio_queue_get_last_avail_idx(dev->vdev, ring-=
>index);
> >          return 0;
> >      }
> >
> > --
> > 2.31.1
> >
>


