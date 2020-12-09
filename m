Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B90312D4AFF
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 20:54:32 +0100 (CET)
Received: from localhost ([::1]:41200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn5Xj-0003m2-Iw
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 14:54:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1kn4Pf-0007c2-2U
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:42:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1kn4Pc-0001y8-7R
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:42:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607539321;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lk3sun6J6ZaKCEXmHk4Lr251oV6cGXMTlOHoLDL99QA=;
 b=A2O10HKXCjhpuTl9k5oMOsmDvH6ax0cTPyUwzA7TWVA2kVqUFfIbAPIzEBR67sYFXad64B
 nqGng/eNFcT5jLvXeAFSAsCCEcXIM4iysP/yb2JUTmSvJI15qZlUxTjzQdLeeVi/xIu2k1
 NdHFNQLNwOu+Mpq36ZkqIP1K9reKqWo=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-184-ybW8m4TqNimpK9v5K8HT9Q-1; Wed, 09 Dec 2020 13:42:00 -0500
X-MC-Unique: ybW8m4TqNimpK9v5K8HT9Q-1
Received: by mail-qk1-f198.google.com with SMTP id e68so1778664qkd.3
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 10:42:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=lk3sun6J6ZaKCEXmHk4Lr251oV6cGXMTlOHoLDL99QA=;
 b=m3ZFZRz5UicYRKqRR7Ehj3mNgGDFKXtIAn8Vbh8t3SOPujarZecJBISu14uC9Lc25H
 DnwDuDBQAdp4zku6VTbB05ZPzVxM8IjRYjjEd5UIYUp4tlcGN1A3y4saRgVnZShyAZCk
 qHXNqXgZBoTy42O3pxGBZAMGVvYP7wASSLlISd0bv0rWRCF8TqUns2alciT3Dz4Wuj9k
 AedXSdik2fLU8x6bpxG7Y2mniwapDO8PcsE5LR9Wi1tl7+cCHQlpRAqL2UPc+vQ+nddZ
 5yP+DS/nttcgu+bonElqUmkZJoxBdokptTmVigUVcO5dxxB1/IMdcVCiW8nRGYtoINg2
 lXrw==
X-Gm-Message-State: AOAM533ypnBKvinraiOQ+NP3ja09a8axD9/NkDluxLmNWAqtZxSj3Jwq
 B61ybxyrXSHqn/dStLloBB7tYT5c6STsS+h6nmpaOM2B9zEhTQ5HyTvNzRHhMK1/ActL4g+TghR
 8fCFUQbiOgfkRNr/qJPiz8+g66fyW/QA=
X-Received: by 2002:a37:4658:: with SMTP id t85mr4608864qka.210.1607539319543; 
 Wed, 09 Dec 2020 10:41:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzXkGCcuiVm+epPlx+mW0vY7zLl3v75k/7Dp2jT6Sl5FNC8Dc6HdWJfZipNZNECFlpW33gUvQfa2MAbG9WCydA=
X-Received: by 2002:a37:4658:: with SMTP id t85mr4608817qka.210.1607539319246; 
 Wed, 09 Dec 2020 10:41:59 -0800 (PST)
MIME-Version: 1.0
References: <20201120185105.279030-1-eperezma@redhat.com>
 <20201120185105.279030-14-eperezma@redhat.com>
 <20201208081621.GR203660@stefanha-x1.localdomain>
In-Reply-To: <20201208081621.GR203660@stefanha-x1.localdomain>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Wed, 9 Dec 2020 19:41:23 +0100
Message-ID: <CAJaqyWf13ta5MtzmTUz2N5XnQ+ebqFPYAivdggL64LEQAf=y+A@mail.gmail.com>
Subject: Re: [RFC PATCH 13/27] vhost: Send buffers to device
To: Stefan Hajnoczi <stefanha@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kvm list <kvm@vger.kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, qemu-level <qemu-devel@nongnu.org>,
 Daniel Daly <dandaly0@gmail.com>, virtualization@lists.linux-foundation.org,
 Liran Alon <liralon@gmail.com>, Eli Cohen <eli@mellanox.com>,
 Nitin Shrivastav <nitin.shrivastav@broadcom.com>,
 Alex Barba <alex.barba@broadcom.com>,
 Christophe Fontaine <cfontain@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Lee Ballard <ballle98@gmail.com>, Lars Ganrot <lars.ganrot@gmail.com>,
 Rob Miller <rob.miller@broadcom.com>, Stefano Garzarella <sgarzare@redhat.com>,
 Howard Cai <howard.cai@gmail.com>, Parav Pandit <parav@mellanox.com>,
 vm <vmireyno@marvell.com>, Salil Mehta <mehta.salil.lnk@gmail.com>,
 Stephen Finucane <stephenfin@redhat.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Sean Mooney <smooney@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Jim Harford <jim.harford@broadcom.com>,
 Dmytro Kazantsev <dmytro.kazantsev@gmail.com>, Siwei Liu <loseweigh@gmail.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Michael Lilja <ml@napatech.com>,
 Max Gurtovoy <maxgu14@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Dec 8, 2020 at 9:16 AM Stefan Hajnoczi <stefanha@gmail.com> wrote:
>
> On Fri, Nov 20, 2020 at 07:50:51PM +0100, Eugenio P=C3=A9rez wrote:
> > -static inline bool vhost_vring_should_kick(VhostShadowVirtqueue *vq)
> > +static bool vhost_vring_should_kick_rcu(VhostShadowVirtqueue *vq)
>
> "vhost_vring_" is a confusing name. This is not related to
> vhost_virtqueue or the vhost_vring_* structs.
>
> vhost_shadow_vq_should_kick_rcu()?
>
> >  {
> > -    return virtio_queue_get_used_notify_split(vq->vq);
> > +    VirtIODevice *vdev =3D vq->vdev;
> > +    vq->num_added =3D 0;
>
> I'm surprised that a bool function modifies state. Is this assignment
> intentional?
>

It's from the kernel code, virtqueue_kick_prepare_split function. The
num_added member is internal (mutable) state, counting for the batch
so the driver sends a notification in case of uint16_t wrapping in
vhost_vring_add_split with no notification in between. I don't know if
some actual virtio devices could be actually affected from this, since
actual vqs are smaller than (uint16_t)-1 so they should be aware that
more buffers have been added anyway.

> > +/* virtqueue_add:
> > + * @vq: The #VirtQueue
> > + * @elem: The #VirtQueueElement
>
> The copy-pasted doc comment doesn't match this function.
>

Right, I will fix it.

> > +int vhost_vring_add(VhostShadowVirtqueue *vq, VirtQueueElement *elem)
> > +{
> > +    int host_head =3D vhost_vring_add_split(vq, elem);
> > +    if (vq->ring_id_maps[host_head]) {
> > +        g_free(vq->ring_id_maps[host_head]);
> > +    }
>
> VirtQueueElement is freed lazily? Is there a reason for this approach? I
> would have expected it to be freed when the used element is process by
> the kick fd handler.
>

Maybe it has more sense to free immediately in this commit and
introduce ring_id_maps in later commits, yes.

> > diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> > index 9352c56bfa..304e0baa61 100644
> > --- a/hw/virtio/vhost.c
> > +++ b/hw/virtio/vhost.c
> > @@ -956,8 +956,34 @@ static void handle_sw_lm_vq(VirtIODevice *vdev, Vi=
rtQueue *vq)
> >      uint16_t idx =3D virtio_get_queue_index(vq);
> >
> >      VhostShadowVirtqueue *svq =3D hdev->sw_lm_shadow_vq[idx];
> > +    VirtQueueElement *elem;
> >
> > -    vhost_vring_kick(svq);
> > +    /*
> > +     * Make available all buffers as possible.
> > +     */
> > +    do {
> > +        if (virtio_queue_get_notification(vq)) {
> > +            virtio_queue_set_notification(vq, false);
> > +        }
> > +
> > +        while (true) {
> > +            int r;
> > +            if (virtio_queue_full(vq)) {
> > +                break;
> > +            }
>
> Why is this check necessary? The guest cannot provide more descriptors
> than there is ring space. If that happens somehow then it's a driver
> error that is already reported in virtqueue_pop() below.
>

It's just checked because virtqueue_pop prints an error on that case,
and there is no way to tell the difference between a regular error and
another caused by other causes. Maybe the right thing to do is just to
not to print that error? Caller should do the error printing in that
case. Should we return an error code?

> I wonder if you added this because the vring implementation above
> doesn't support indirect descriptors? It's easy to exhaust the vhost
> hdev vring while there is still room in the VirtIODevice's VirtQueue
> vring.


