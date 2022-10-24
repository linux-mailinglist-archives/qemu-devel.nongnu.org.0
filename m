Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF316098ED
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 05:35:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omneG-0005Fr-88; Sun, 23 Oct 2022 22:57:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1omn1J-0001HE-Pb
 for qemu-devel@nongnu.org; Sun, 23 Oct 2022 22:17:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1omn1I-00034h-1Z
 for qemu-devel@nongnu.org; Sun, 23 Oct 2022 22:16:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666577810;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O+KG/R6IbfK9PN7QqMcXu9YUuUL8CIJnK7BDtDB4dAU=;
 b=FJf52Cb2xzScr1iLc0/jpBYs0OrA/WLSotJS2JErRHj8QWJjfRATOtjYvPgQZxV/OgBKlx
 szFnmWXd6vXLk75iOzYZ9Tebnj7fWOjZShKQ907k+jsPwqKpUhqQDy7a1aPyfwjEVyRu4U
 paEiZFUlXg40K0EQJfFBDqk/w+N1XMs=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-125-qiDks83yO6qVqgkXYLD8WA-1; Sun, 23 Oct 2022 22:16:46 -0400
X-MC-Unique: qiDks83yO6qVqgkXYLD8WA-1
Received: by mail-ed1-f69.google.com with SMTP id
 m20-20020a056402511400b0045da52f2d3cso8144744edd.20
 for <qemu-devel@nongnu.org>; Sun, 23 Oct 2022 19:16:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O+KG/R6IbfK9PN7QqMcXu9YUuUL8CIJnK7BDtDB4dAU=;
 b=eO2itkGRzy7UeDADWOGyIpFrz+GFE1+RnZtRk+ww9W0X6p7szmCaPt+QbGzTkeEIay
 VXGtcQWHemW1tRZd6Rvxj7tqqQi8zh76HFcMCB0xca/4CIpg149rPYKtRQU2B/Rtilxh
 oyvbsK98vtY2IDBRwSnpW70IhXStQL38USCPM/QmsYIf4oLJU6sGX7/cObolohJHl/MD
 UiDl8m8Nduiz5OE5DBXdcbOFydHwzZu4zlQkS7KmLS8gujr8ClZJzHGaE6Y9FYcD4KQX
 kScawRBvhMMLo29KheLPHErrwKwjUJjxkCi5sP36kdR68x4iDJx1WTdFzZTc0py/aFil
 lGEg==
X-Gm-Message-State: ACrzQf0sb5kzNRF9nHMCt/ngjjAMWZ94h5RlfBhXGUWxLKbwhYDlLJXt
 bn0I5ZD36DbxFqMwHzPlfc1JgI2GJ+OT997Y1SvNbrTsjQrAkRLS5+2sAxV89TwTa4aAR94mvqZ
 60V8KrFo9ILud+9JpXOdcNvPaz4D+hwk=
X-Received: by 2002:aa7:cb59:0:b0:461:7378:7be0 with SMTP id
 w25-20020aa7cb59000000b0046173787be0mr9569957edt.60.1666577803569; 
 Sun, 23 Oct 2022 19:16:43 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5uAHP3l7BMj1xfH3+oQGAPrS255NmA36JDzEoa2i9rPyccj0yxfLeYQjeMEgi74U9IW7UH2A9/mFNfOzwvn1k=
X-Received: by 2002:aa7:cb59:0:b0:461:7378:7be0 with SMTP id
 w25-20020aa7cb59000000b0046173787be0mr9569948edt.60.1666577803400; Sun, 23
 Oct 2022 19:16:43 -0700 (PDT)
MIME-Version: 1.0
References: <20221020155251.398735-1-eperezma@redhat.com>
 <20221020155251.398735-3-eperezma@redhat.com>
 <CACGkMEukKCXRDSmR3nemxdHDphQHspGdY3nC9O5g9grQ59PN8w@mail.gmail.com>
 <CAJaqyWf0uXRze3qK1d02RB+Q4BJ60A8E7YYnnjBpdyANB2=new@mail.gmail.com>
 <20221021041453-mutt-send-email-mst@kernel.org>
In-Reply-To: <20221021041453-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 24 Oct 2022 10:16:30 +0800
Message-ID: <CACGkMEvNoxKcFBpawaWgtq=YgCh4CXMDD9Y5DUgoZ1Qn-zOwpA@mail.gmail.com>
Subject: Re: [PATCH 2/4] vhost: toggle device callbacks using used event idx
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Eugenio Perez Martin <eperezma@redhat.com>, qemu-devel@nongnu.org, 
 Liuxiangdong <liuxiangdong5@huawei.com>, Parav Pandit <parav@mellanox.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>, Laurent Vivier <lvivier@redhat.com>, 
 Zhu Lingshan <lingshan.zhu@intel.com>, Gautam Dawar <gdawar@xilinx.com>,
 Eli Cohen <eli@mellanox.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Cindy Lu <lulu@redhat.com>, 
 Si-Wei Liu <si-wei.liu@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.517,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Oct 21, 2022 at 4:15 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Fri, Oct 21, 2022 at 09:45:14AM +0200, Eugenio Perez Martin wrote:
> > On Fri, Oct 21, 2022 at 5:40 AM Jason Wang <jasowang@redhat.com> wrote:
> > >
> > > On Thu, Oct 20, 2022 at 11:53 PM Eugenio P=C3=A9rez <eperezma@redhat.=
com> wrote:
> > > >
> > > > Actually use the new field of the used ring and tell the device if =
SVQ
> > > > wants to be notified.
> > > >
> > > > The code is not reachable at the moment.
> > > >
> > > > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > > > ---
> > > >  hw/virtio/vhost-shadow-virtqueue.c | 18 +++++++++++++++---
> > > >  1 file changed, 15 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-s=
hadow-virtqueue.c
> > > > index a518f84772..f5c0fad3fc 100644
> > > > --- a/hw/virtio/vhost-shadow-virtqueue.c
> > > > +++ b/hw/virtio/vhost-shadow-virtqueue.c
> > > > @@ -369,15 +369,27 @@ static bool vhost_svq_more_used(VhostShadowVi=
rtqueue *svq)
> > > >   */
> > > >  static bool vhost_svq_enable_notification(VhostShadowVirtqueue *sv=
q)
> > > >  {
> > > > -    svq->vring.avail->flags &=3D ~cpu_to_le16(VRING_AVAIL_F_NO_INT=
ERRUPT);
> > > > -    /* Make sure the flag is written before the read of used_idx *=
/
> > > > +    if (virtio_vdev_has_feature(svq->vdev, VIRTIO_RING_F_EVENT_IDX=
)) {
> > > > +        uint16_t *used_event =3D (uint16_t *)&svq->vring.avail->ri=
ng[svq->vring.num];
> > > > +        *used_event =3D svq->shadow_used_idx;
> > >
> > > Do we need to care about the endian here?
> > >
> > > E.g vduse has:
> > >
> > >     *((uint16_t *)&vq->vring.used->ring[vq->vring.num]) =3D htole16(v=
al);
> > >
> >
> > Good catch, I forgot about endianness.
> >
> > I'll review the series, thanks!
>
> It's generally a waste that we don't use endian-ness annotations
> the way linux does.

Yes, it's worth doing something similar sometime.

Thanks

>
>
> > > Thanks
> > >
> > > > +    } else {
> > > > +        svq->vring.avail->flags &=3D ~cpu_to_le16(VRING_AVAIL_F_NO=
_INTERRUPT);
> > > > +    }
> > > > +
> > > > +    /* Make sure the event is enabled before the read of used_idx =
*/
> > > >      smp_mb();
> > > >      return !vhost_svq_more_used(svq);
> > > >  }
> > > >
> > > >  static void vhost_svq_disable_notification(VhostShadowVirtqueue *s=
vq)
> > > >  {
> > > > -    svq->vring.avail->flags |=3D cpu_to_le16(VRING_AVAIL_F_NO_INTE=
RRUPT);
> > > > +    /*
> > > > +     * No need to disable notification in the event idx case, sinc=
e used event
> > > > +     * index is already an index too far away.
> > > > +     */
> > > > +    if (!virtio_vdev_has_feature(svq->vdev, VIRTIO_RING_F_EVENT_ID=
X)) {
> > > > +        svq->vring.avail->flags |=3D cpu_to_le16(VRING_AVAIL_F_NO_=
INTERRUPT);
> > > > +    }
> > > >  }
> > > >
> > > >  static uint16_t vhost_svq_last_desc_of_chain(const VhostShadowVirt=
queue *svq,
> > > > --
> > > > 2.31.1
> > > >
> > >
>


