Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8463258988C
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 09:38:51 +0200 (CEST)
Received: from localhost ([::1]:52158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJVRS-00031N-1g
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 03:38:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oJVJt-0006I3-Vf
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 03:31:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oJVJq-0003kW-Es
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 03:30:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659598255;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rY4eea5GIcyeYvC6uQfClxYXJJaltYiDX84miqN3Lkc=;
 b=DYzQo0MawUGV0T92kilombtJ+DeZ7kMLXjLBfDDRUt3siIXhB9qb25m3lBUKy3Z9av1BtO
 ZpW3r25kKiLurtFc6OUp8nhjrO+JdoSsEa7cedTzl/TN2jtrWMG6wjTD5abVfriNnXW9Pu
 73hwdwDYXZysPRXVgvdwqFFZ4uxE8NQ=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-351-VmWX4XPoO_6NlJW8JM96Gg-1; Thu, 04 Aug 2022 03:30:53 -0400
X-MC-Unique: VmWX4XPoO_6NlJW8JM96Gg-1
Received: by mail-lj1-f200.google.com with SMTP id
 bi26-20020a05651c231a00b0025e4ba4f7e5so2943939ljb.16
 for <qemu-devel@nongnu.org>; Thu, 04 Aug 2022 00:30:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=rY4eea5GIcyeYvC6uQfClxYXJJaltYiDX84miqN3Lkc=;
 b=Ww8tAsb1CFiJtqTinrLAGQXncp/T7EGzF117A4811LsqePVg/HAhZlygZeX6RWVUmL
 hQr3/vO+VpkbOZBO4mDLOXR00pCmwLsFsfqEjSjs27lCWO+zQV6N4K2hr9P5CPUaLYTk
 uRu308PAJzkDNQFwE/WfP1qvHzTJRbj180v2dJ59Lej5PpVaCTyzQS8YP9yZwm079eut
 OKKNRWQbfXgachYX6aWE3JZ47NJYabutM+4Ke/k5b5VUcT2MQ/rIgnLJXnQ0orcw7jPd
 zIicKj4aRrADL32GcGaNq+hcFr7Ap8QsktMsC3GXYxXvcuFsjPHZSFvdCE3wNXL05hDn
 9FBg==
X-Gm-Message-State: ACgBeo1YqNx1+uzl5kRxWnSbr+4zFfRNGirbqhmhCsN+zZNv8kMlexcs
 ASv9EqckRqFZsx6Pv4dlV3ue28sZGixjudR+SmZOx/20hUHfPc+6ao2rpAh075ub2Rqc51zs+dw
 JdRQPJY9+QhxsYJ4WBCNgVF/fVriH0S8=
X-Received: by 2002:a19:790f:0:b0:48a:d438:9f79 with SMTP id
 u15-20020a19790f000000b0048ad4389f79mr248146lfc.411.1659598252307; 
 Thu, 04 Aug 2022 00:30:52 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6ehcpe/ZOLPlk+jp7aHcIoGkzp2hQPQZ4FM1rQ79+nQXiTkdZ7Ow/sNqpFwf7u6/AoW9wcYmjwbfwxkeYLbc8=
X-Received: by 2002:a19:790f:0:b0:48a:d438:9f79 with SMTP id
 u15-20020a19790f000000b0048ad4389f79mr248124lfc.411.1659598252060; Thu, 04
 Aug 2022 00:30:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220802175731.312115-1-eperezma@redhat.com>
 <20220802175731.312115-4-eperezma@redhat.com>
 <308c14f4-90c5-9256-3a87-801dbd9eda05@redhat.com>
 <CAJaqyWeHVM7RV0aDzM2LVLQDoFEEnwzJGjgAB-wSVqJEq1LzTw@mail.gmail.com>
In-Reply-To: <CAJaqyWeHVM7RV0aDzM2LVLQDoFEEnwzJGjgAB-wSVqJEq1LzTw@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 4 Aug 2022 15:30:40 +0800
Message-ID: <CACGkMEuZSZRgFQ94fBsY4B_F4__64eiP=57So_03zW-Wy_yhmw@mail.gmail.com>
Subject: Re: [PATCH v5 03/10] vhost: Do not depend on !NULL VirtQueueElement
 on vhost_svq_flush
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: qemu-level <qemu-devel@nongnu.org>, Eli Cohen <eli@mellanox.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Parav Pandit <parav@mellanox.com>, 
 Markus Armbruster <armbru@redhat.com>, Gautam Dawar <gdawar@xilinx.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, 
 Cornelia Huck <cohuck@redhat.com>, Cindy Lu <lulu@redhat.com>, 
 Liuxiangdong <liuxiangdong5@huawei.com>, Zhu Lingshan <lingshan.zhu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
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

On Thu, Aug 4, 2022 at 2:21 PM Eugenio Perez Martin <eperezma@redhat.com> w=
rote:
>
> On Thu, Aug 4, 2022 at 5:14 AM Jason Wang <jasowang@redhat.com> wrote:
> >
> >
> > =E5=9C=A8 2022/8/3 01:57, Eugenio P=C3=A9rez =E5=86=99=E9=81=93:
> > > Since QEMU will be able to inject new elements on CVQ to restore the
> > > state, we need not to depend on a VirtQueueElement to know if a new
> > > element has been used by the device or not. Instead of check that, ch=
eck
> > > if there are new elements only using used idx on vhost_svq_flush.
> > >
> > > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > > ---
> > >   hw/virtio/vhost-shadow-virtqueue.c | 18 +++++++++---------
> > >   1 file changed, 9 insertions(+), 9 deletions(-)
> > >
> > > diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-sha=
dow-virtqueue.c
> > > index e6eebd0e8d..fdb550c31b 100644
> > > --- a/hw/virtio/vhost-shadow-virtqueue.c
> > > +++ b/hw/virtio/vhost-shadow-virtqueue.c
> > > @@ -491,7 +491,7 @@ static void vhost_svq_flush(VhostShadowVirtqueue =
*svq,
> > >   /**
> > >    * Poll the SVQ for one device used buffer.
> > >    *
> > > - * This function race with main event loop SVQ polling, so extra
> > > + * This function races with main event loop SVQ polling, so extra
> > >    * synchronization is needed.
> > >    *
> > >    * Return the length written by the device.
> > > @@ -499,20 +499,20 @@ static void vhost_svq_flush(VhostShadowVirtqueu=
e *svq,
> > >   size_t vhost_svq_poll(VhostShadowVirtqueue *svq)
> > >   {
> > >       int64_t start_us =3D g_get_monotonic_time();
> > > -    do {
> > > +    while (true) {
> > >           uint32_t len;
> > > -        VirtQueueElement *elem =3D vhost_svq_get_buf(svq, &len);
> > > -        if (elem) {
> > > -            return len;
> > > -        }
> > >
> > >           if (unlikely(g_get_monotonic_time() - start_us > 10e6)) {
> > >               return 0;
> > >           }
> > >
> > > -        /* Make sure we read new used_idx */
> > > -        smp_rmb();
> > > -    } while (true);
> > > +        if (!vhost_svq_more_used(svq)) {
> > > +            continue;
> > > +        }
> > > +
> > > +        vhost_svq_get_buf(svq, &len);
> >
> >
> > I wonder if this means we won't worry about the infinite wait?
> >
>
> vhost_svq_get_buf call doesn't block, and the check for the timeout is
> immediately above the check for new descriptors. Am I missing
> something?

No, I misread the code.

Sorry.

Thanks

>
> > Thanks
> >
> >
> > > +        return len;
> > > +    }
> > >   }
> > >
> > >   /**
> >
>


