Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A303A575DF2
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jul 2022 11:01:43 +0200 (CEST)
Received: from localhost ([::1]:33808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCHCg-00060a-LK
	for lists+qemu-devel@lfdr.de; Fri, 15 Jul 2022 05:01:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oCGvq-0001YW-FL
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 04:44:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36350)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oCGvo-0004O9-AL
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 04:44:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657874655;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/YQS9aufDR7pbVm20GYYfUCJWZQiiawCj2DdGFOG4xs=;
 b=d3xi5BO07jaVzDuaCWOM+4cV0Z9gpdrV/ppNkKLKNAym3MaCn/GtDcWQ4VJpGRrIm9fBx3
 wUoFDQ53aN0ioavEhXyQm/4I9amLKQp3f7F7PXSwmHzgwL0qEk5rWOzp1rcGXB44TYhj5N
 rh2NLC8WG5A01kXOJyno7Q4FwFQTftE=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-654-vZLTaRmVPYyLeAV52_YpAA-1; Fri, 15 Jul 2022 04:44:14 -0400
X-MC-Unique: vZLTaRmVPYyLeAV52_YpAA-1
Received: by mail-lf1-f72.google.com with SMTP id
 z1-20020a195041000000b00489cc321e11so1580370lfj.23
 for <qemu-devel@nongnu.org>; Fri, 15 Jul 2022 01:44:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/YQS9aufDR7pbVm20GYYfUCJWZQiiawCj2DdGFOG4xs=;
 b=Xz47KBKvesrtNeu4B+u68yfMgjg9ddC4HJ+xlXH55UCg1/Qwq3636yvCHUhEuorU1Y
 EQ55bxCMHzTA06JW+mwYI0Pr+ba+JzlVtJyzPenTLk/xc6BE8RJxhClXr8D4hqRZySY/
 nPRSMg4/cQF1Dzh0jyjzdrNfWUke5WeUlFBNDKfPrgHZp/waCaYAIW5X8HlCjb4F9vxa
 LgvTmqHmXHTWqxqwPZAfsfSXagNebWnrcGGPYjLpJ8wRHv3Ru/lwM1KCetGb9ZOlgrV+
 cal6pfL1CrbPuCatfrHlLZXMF4Fks4nWHp+ChLr8V6dX2J/QRYvdrOFhAgB17BOw2ARq
 msNw==
X-Gm-Message-State: AJIora8e/3yzmh4Vuzqk1hejsL5oUoJhL/fdQCYCU+MDy2+uGOM5GKvF
 Qt7wKPv1rCbJK2taqsYAaarxMgBmhSS55UfNF3Gh9rCH8bA0uQq4mNP3LcnJfv7Qh8esCdtFmiC
 WaE3QMtuFpwofK0HMSRDnaxcpm8nDxv4=
X-Received: by 2002:a05:6512:b0d:b0:481:5cb4:cf1e with SMTP id
 w13-20020a0565120b0d00b004815cb4cf1emr7146879lfu.442.1657874652476; 
 Fri, 15 Jul 2022 01:44:12 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sS9ICBQsUxxG6nY9JZy4pU1dJuJpoPn3C7V0ga0dVpWkiE1Bu8i8Azh8y8iBYpJTujXufx53FkdDmdnwkQRdw=
X-Received: by 2002:a05:6512:b0d:b0:481:5cb4:cf1e with SMTP id
 w13-20020a0565120b0d00b004815cb4cf1emr7146854lfu.442.1657874652138; Fri, 15
 Jul 2022 01:44:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220714163150.2536327-1-eperezma@redhat.com>
 <20220714163150.2536327-16-eperezma@redhat.com>
 <CACGkMEvV9X6odd=p2g_6NyUqOw7ZqApd_zker0uDLXyZK9kDcw@mail.gmail.com>
 <CAJaqyWdJf9qSJvKo4-gjpFPKb2rpwDwKaZ2-reEsEtThdx+c6A@mail.gmail.com>
In-Reply-To: <CAJaqyWdJf9qSJvKo4-gjpFPKb2rpwDwKaZ2-reEsEtThdx+c6A@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 15 Jul 2022 16:44:01 +0800
Message-ID: <CACGkMEuETovdsG1J=bbYdvevCxErbobt8WA9P4wAp=s8sfjing@mail.gmail.com>
Subject: Re: [PATCH v2 15/19] vdpa: manual forward CVQ buffers
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Gautam Dawar <gdawar@xilinx.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Eric Blake <eblake@redhat.com>, 
 Zhu Lingshan <lingshan.zhu@intel.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Parav Pandit <parav@mellanox.com>, 
 Laurent Vivier <lvivier@redhat.com>, Liuxiangdong <liuxiangdong5@huawei.com>, 
 Eli Cohen <eli@mellanox.com>, Cindy Lu <lulu@redhat.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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

On Fri, Jul 15, 2022 at 1:34 PM Eugenio Perez Martin
<eperezma@redhat.com> wrote:
>
> On Fri, Jul 15, 2022 at 6:08 AM Jason Wang <jasowang@redhat.com> wrote:
> >
> > On Fri, Jul 15, 2022 at 12:32 AM Eugenio P=C3=A9rez <eperezma@redhat.co=
m> wrote:
> > >
> > > Do a simple forwarding of CVQ buffers, the same work SVQ could do but
> > > through callbacks. No functional change intended.
> > >
> > > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > > ---
> > >  include/hw/virtio/vhost-vdpa.h |  3 ++
> > >  hw/virtio/vhost-vdpa.c         |  3 +-
> > >  net/vhost-vdpa.c               | 58 ++++++++++++++++++++++++++++++++=
++
> > >  3 files changed, 63 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost=
-vdpa.h
> > > index 7214eb47dc..1111d85643 100644
> > > --- a/include/hw/virtio/vhost-vdpa.h
> > > +++ b/include/hw/virtio/vhost-vdpa.h
> > > @@ -15,6 +15,7 @@
> > >  #include <gmodule.h>
> > >
> > >  #include "hw/virtio/vhost-iova-tree.h"
> > > +#include "hw/virtio/vhost-shadow-virtqueue.h"
> > >  #include "hw/virtio/virtio.h"
> > >  #include "standard-headers/linux/vhost_types.h"
> > >
> > > @@ -35,6 +36,8 @@ typedef struct vhost_vdpa {
> > >      /* IOVA mapping used by the Shadow Virtqueue */
> > >      VhostIOVATree *iova_tree;
> > >      GPtrArray *shadow_vqs;
> > > +    const VhostShadowVirtqueueOps *shadow_vq_ops;
> > > +    void *shadow_vq_ops_opaque;
> > >      struct vhost_dev *dev;
> > >      VhostVDPAHostNotifier notifier[VIRTIO_QUEUE_MAX];
> > >  } VhostVDPA;
> > > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > > index 96997210be..beaaa7049a 100644
> > > --- a/hw/virtio/vhost-vdpa.c
> > > +++ b/hw/virtio/vhost-vdpa.c
> > > @@ -419,7 +419,8 @@ static int vhost_vdpa_init_svq(struct vhost_dev *=
hdev, struct vhost_vdpa *v,
> > >      for (unsigned n =3D 0; n < hdev->nvqs; ++n) {
> > >          g_autoptr(VhostShadowVirtqueue) svq;
> > >
> > > -        svq =3D vhost_svq_new(v->iova_tree, NULL, NULL);
> > > +        svq =3D vhost_svq_new(v->iova_tree, v->shadow_vq_ops,
> > > +                            v->shadow_vq_ops_opaque);
> > >          if (unlikely(!svq)) {
> > >              error_setg(errp, "Cannot create svq %u", n);
> > >              return -1;
> > > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > > index df1e69ee72..805c9dd6b6 100644
> > > --- a/net/vhost-vdpa.c
> > > +++ b/net/vhost-vdpa.c
> > > @@ -11,11 +11,14 @@
> > >
> > >  #include "qemu/osdep.h"
> > >  #include "clients.h"
> > > +#include "hw/virtio/virtio-net.h"
> > >  #include "net/vhost_net.h"
> > >  #include "net/vhost-vdpa.h"
> > >  #include "hw/virtio/vhost-vdpa.h"
> > >  #include "qemu/config-file.h"
> > >  #include "qemu/error-report.h"
> > > +#include "qemu/log.h"
> > > +#include "qemu/memalign.h"
> > >  #include "qemu/option.h"
> > >  #include "qapi/error.h"
> > >  #include <linux/vhost.h>
> > > @@ -187,6 +190,57 @@ static NetClientInfo net_vhost_vdpa_info =3D {
> > >          .check_peer_type =3D vhost_vdpa_check_peer_type,
> > >  };
> > >
> > > +/**
> > > + * Forward buffer for the moment.
> > > + */
> > > +static int vhost_vdpa_net_handle_ctrl_avail(VhostShadowVirtqueue *sv=
q,
> > > +                                            SVQElement *svq_elem, vo=
id *opaque)
> > > +{
> > > +    VirtQueueElement *elem =3D &svq_elem->elem;
> > > +    unsigned int n =3D elem->out_num + elem->in_num;
> > > +    g_autofree struct iovec *dev_buffers =3D g_new(struct iovec, n);
> > > +    size_t in_len, dev_written;
> > > +    virtio_net_ctrl_ack status =3D VIRTIO_NET_ERR;
> > > +    int r;
> > > +
> > > +    memcpy(dev_buffers, elem->out_sg, elem->out_num);
> > > +    memcpy(dev_buffers + elem->out_num, elem->in_sg, elem->in_num);
> > > +
> > > +    r =3D vhost_svq_add(svq, &dev_buffers[0], elem->out_num, &dev_bu=
ffers[1],
> > > +                      elem->in_num, svq_elem);
> > > +    if (unlikely(r !=3D 0)) {
> > > +        if (unlikely(r =3D=3D -ENOSPC)) {
> > > +            qemu_log_mask(LOG_GUEST_ERROR, "%s: No space on device q=
ueue\n",
> > > +                          __func__);
> > > +        }
> > > +        goto out;
> > > +    }
> > > +
> > > +    /*
> > > +     * We can poll here since we've had BQL from the time we sent th=
e
> > > +     * descriptor. Also, we need to take the answer before SVQ pulls=
 by itself,
> > > +     * when BQL is released
> > > +     */
> > > +    dev_written =3D vhost_svq_poll(svq);
> > > +    if (unlikely(dev_written < sizeof(status))) {
> > > +        error_report("Insufficient written data (%zu)", dev_written)=
;
> > > +    }
> > > +
> > > +out:
> > > +    in_len =3D iov_from_buf(elem->in_sg, elem->in_num, 0, &status,
> > > +                          sizeof(status));
> > > +    if (unlikely(in_len < sizeof(status))) {
> > > +        error_report("Bad device CVQ written length");
> > > +    }
> > > +    vhost_svq_push_elem(svq, svq_elem, MIN(in_len, sizeof(status)));
> > > +    g_free(svq_elem);
> > > +    return r;
> > > +}
> > > +
> > > +static const VhostShadowVirtqueueOps vhost_vdpa_net_svq_ops =3D {
> > > +    .avail_handler =3D vhost_vdpa_net_handle_ctrl_avail,
> > > +};
> >
> > I wonder if it's possible to even remove this handler. Can we let the
> > kick to be handled by virtio_net_handler_ctrl() in virtio-net.c?
> >
>
> I kind of drafted that here:
> https://lists.nongnu.org/archive/html/qemu-devel/2022-07/msg02652.html
>
> But I'm not sure about the part of not enabling the guest event
> notifiers. I'd say we would need to move SVQ to the VirtIODevice
> itself, which seems rather complicated at this moment.
>
> Without applying that patch, all of the events of vDPA devices go
> either to device itself or to the SVQ registered handlers. If we go
> that route, we add the vq event handler, and that would depend on the
> svq state + specific vq.

So what's in my mind is to let it work more like existing vhost
backends. In that case the shadow virtqueue is only used as one way to
communicate with the vhost-backend:

1) vhost-net using TAP ioctl
2) vhost-user using UNIX domain socket
3) vhost-vDPA is using shadow cvq

>
> I'm totally ok to do it the first thing for the next merge window, or
> if I have the certainty it's the accepted way to go. Otherwise, I
> think we will not be able to deliver at least migration with SVQ for
> this merge window again.

So I think it's fine for the current stage. We can improve it in the future=
.

Thanks

>
> Thanks!
>


