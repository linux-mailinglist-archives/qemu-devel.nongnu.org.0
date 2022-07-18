Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F7A9577E65
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 11:13:03 +0200 (CEST)
Received: from localhost ([::1]:42464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDMoI-0002Mf-Dm
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 05:13:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oDMk4-00062Z-R1
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 05:08:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oDMk3-00051t-9W
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 05:08:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658135318;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bdq6TGJHHrB3cYAnbpXT77oWpDe1IwgzqqKlef8Al00=;
 b=MJ1eI8piQ+zm82fbm/omQc4JLgR+W40lt01EJoBigZAXa6AWrCuAGeOO/iY1kNmV8rejMo
 LqtUb9qCXGSTM9LOn/vYYZhO7pK5/S+Ct5ZOCxAtzwJ0YQb/rg1MYa9YXtrixtl2Sabn4U
 FxWSgp/cRwVDIk0eYWgl8paKhgILODM=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-629-h0B6aoWxPfeM518OVlaLRQ-1; Mon, 18 Jul 2022 05:08:37 -0400
X-MC-Unique: h0B6aoWxPfeM518OVlaLRQ-1
Received: by mail-qv1-f69.google.com with SMTP id
 ld6-20020a056214418600b00472ffe4640eso5146614qvb.13
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 02:08:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bdq6TGJHHrB3cYAnbpXT77oWpDe1IwgzqqKlef8Al00=;
 b=MVOGBeXCHeuLU/pB7o8h2PuLik0Ch65P4XRKJ5z3cp/Q/B8kDpwrrR23o24aO3DfB6
 CjkVCitr2RqMZaRNObexTdXG4Oj9Tp7poH2ASpP1zgwpUAbhO6TF0mGPJYR7Sg0RoiWZ
 L8qr2TAstsnvTbCPJrCNSF9A9td8JY55NwaCBXtlhIwdLiNc9CTGXbEXV3tEjf0VJhtz
 8MwG3O3m0XHENRgwKF+znpojWoFw0xDLF5zr+GiIngUudgo6bTkUM3nHM7GHS5VMxyIN
 /dQwJkcRYbzCwQvSn36Fj9UIr2Mf5Pb1930gOzOpF21H01m3J0eOPha1WSUrB1peowAQ
 Qahw==
X-Gm-Message-State: AJIora/4e5Ew4r1IxbKNhoTwl4EkiiN4gJ+ZUxnpE9klMuUxoMLgPKsb
 yjGORqlwjtDXWCbMN0pFPTDt3DlCWfLW+Fdw2khyJ50/FQLz87FpMA6/wdMq5vtJSW2jNGTulkR
 wwtN/P7JjZv9ThFGAT46CJepM5R9FNPs=
X-Received: by 2002:a05:620a:f10:b0:6aa:318e:55a9 with SMTP id
 v16-20020a05620a0f1000b006aa318e55a9mr16628263qkl.559.1658135316761; 
 Mon, 18 Jul 2022 02:08:36 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t4BGWJtwKhBE8xaQ9aHsTrD/zR3ckQT/g2AIwMgKoLyW5AccOwJDTwkFNWxyHnw0q1x1aCmRTzOoN8UDe6W60=
X-Received: by 2002:a05:620a:f10:b0:6aa:318e:55a9 with SMTP id
 v16-20020a05620a0f1000b006aa318e55a9mr16628251qkl.559.1658135316538; Mon, 18
 Jul 2022 02:08:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220716113407.2730331-1-eperezma@redhat.com>
 <20220716113407.2730331-8-eperezma@redhat.com>
 <CACGkMEsUMtY-8suaPVQMm=H3ckWVNFhFFj4=5su_wjHq7mjqPA@mail.gmail.com>
In-Reply-To: <CACGkMEsUMtY-8suaPVQMm=H3ckWVNFhFFj4=5su_wjHq7mjqPA@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 18 Jul 2022 11:08:00 +0200
Message-ID: <CAJaqyWc3NfyEF5sqL6ZbZf6Nutvx9WNASeaX5LyAZ=2i3QWY+Q@mail.gmail.com>
Subject: Re: [RFC PATCH 07/12] vhost: Add VhostVDPAStartOp operation
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

On Mon, Jul 18, 2022 at 10:50 AM Jason Wang <jasowang@redhat.com> wrote:
>
> On Sat, Jul 16, 2022 at 7:34 PM Eugenio P=C3=A9rez <eperezma@redhat.com> =
wrote:
> >
> > It allows to run commands at start of the device, before it have enable=
d
> > any queue.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >  hw/virtio/vhost-shadow-virtqueue.h | 3 +++
> >  include/hw/virtio/vhost-vdpa.h     | 5 +++++
> >  hw/virtio/vhost-vdpa.c             | 8 ++++++++
> >  3 files changed, 16 insertions(+)
> >
> > diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shado=
w-virtqueue.h
> > index 03eb7ff670..210fe393cd 100644
> > --- a/hw/virtio/vhost-shadow-virtqueue.h
> > +++ b/hw/virtio/vhost-shadow-virtqueue.h
> > @@ -26,6 +26,8 @@ typedef struct SVQDescState {
> >  } SVQDescState;
> >
> >  typedef struct VhostShadowVirtqueue VhostShadowVirtqueue;
> > +typedef int (*ShadowVirtQueueStart)(VhostShadowVirtqueue *svq,
> > +                                    void *opaque);
> >
> >  /**
> >   * Callback to handle an avail buffer.
> > @@ -43,6 +45,7 @@ typedef int (*VirtQueueAvailCallback)(VhostShadowVirt=
queue *svq,
> >                                        void *vq_callback_opaque);
> >
> >  typedef struct VhostShadowVirtqueueOps {
> > +    ShadowVirtQueueStart start;
>
> What's the difference between this and start_op?
>

This is a leftover, I'll delete for the next series.

Thanks!

> Thanks
>
> >      VirtQueueAvailCallback avail_handler;
> >  } VhostShadowVirtqueueOps;
> >
> > diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-v=
dpa.h
> > index d10a89303e..b7d18b4e30 100644
> > --- a/include/hw/virtio/vhost-vdpa.h
> > +++ b/include/hw/virtio/vhost-vdpa.h
> > @@ -24,6 +24,10 @@ typedef struct VhostVDPAHostNotifier {
> >      void *addr;
> >  } VhostVDPAHostNotifier;
> >
> > +struct vhost_vdpa;
> > +/* Called after send DRIVER_OK but after enabling vrings */
> > +typedef int (*VhostVDPAStartOp)(struct vhost_vdpa *v);
> > +
> >  typedef struct vhost_vdpa {
> >      int device_fd;
> >      int index;
> > @@ -39,6 +43,7 @@ typedef struct vhost_vdpa {
> >      GPtrArray *shadow_vqs;
> >      const VhostShadowVirtqueueOps *shadow_vq_ops;
> >      void *shadow_vq_ops_opaque;
> > +    VhostVDPAStartOp start_op;
> >      struct vhost_dev *dev;
> >      VhostVDPAHostNotifier notifier[VIRTIO_QUEUE_MAX];
> >  } VhostVDPA;
> > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > index 1d8829c619..48f031b8c0 100644
> > --- a/hw/virtio/vhost-vdpa.c
> > +++ b/hw/virtio/vhost-vdpa.c
> > @@ -1136,6 +1136,14 @@ static int vhost_vdpa_dev_start(struct vhost_dev=
 *dev, bool started)
> >          if (unlikely(r)) {
> >              return r;
> >          }
> > +
> > +        if (v->start_op) {
> > +            r =3D v->start_op(v);
> > +            if (unlikely(r)) {
> > +                return r;
> > +            }
> > +        }
> > +
> >          vhost_vdpa_set_vring_ready(dev);
> >      } else {
> >          vhost_vdpa_reset_device(dev);
> > --
> > 2.31.1
> >
>


