Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9BE6072EA
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 10:52:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olnl5-0002y7-3z
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 04:52:05 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olnCB-0001Ws-5j
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 04:15:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1olnBl-0001N6-NF
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 04:15:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1olnBk-00032O-8N
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 04:15:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666340131;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nhpSHGYWOSmnnLS8a+W9t9U6uuN7fcZSs/uUYwDqrAw=;
 b=ZSkylcX8VqLMss982TuEPt6LyAfKD8whsc8A7pUfPWP4iNE6wxWTDlSbPRVccSxQfbcXu2
 6kH3OKUgA4vD1JCdRdscc7grO4XrkUTgBgacSyeft68K1qOa7tYhrYpynUUQG8t857HoE0
 zjdyXUb99QBV1/w+FGDy1jGAKnstORY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-556-RaQN9HQLPy6fcrkFwQwCcQ-1; Fri, 21 Oct 2022 04:15:30 -0400
X-MC-Unique: RaQN9HQLPy6fcrkFwQwCcQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 az35-20020a05600c602300b003c5273b79fdso3004507wmb.3
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 01:15:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nhpSHGYWOSmnnLS8a+W9t9U6uuN7fcZSs/uUYwDqrAw=;
 b=N6fEenMZif74LwkI50kLi4z7mtXJxsqUjMulvKZujQD3WevZ1l1yxEi1xbpz1osxd2
 O3gFtNLlwi6i6T8xiBHsQd4yoSwbjL4fKJfR5P8p/JBSQJYFmfNHShmpZgGTV69tv58A
 3zt8K6KrY1R56Jp//arSbiRlXNRA+OrJX92hIZKYF0vupYlCGljKbtsHJWh6SXmULidY
 dCxBj60OE4oG6R6AiZ/+HrC2ql6MNEidlKVYay4/z9jVgTmqKQDFyGz205DOaOatkkjn
 01bNKXvSt/ygdnc54WXb6vlRs7HhHQ3+RBJpkJLY+bPl/y0GzRVnfH0AbEFSaU19SmSm
 QadQ==
X-Gm-Message-State: ACrzQf3e1i5ucTT6nqz0/B6WnNELEokCVHTKGr6YGz12+epRcgTu/22C
 5SAIksEhrizKWzbE+arpFDFpisaWcvtYcHEDM7PMTmib939C1NCC2bsiekul+qpyAApm9Y0fhBv
 CfuP9nZgJaXD5AoM=
X-Received: by 2002:a05:600c:6885:b0:3bd:d782:623c with SMTP id
 fn5-20020a05600c688500b003bdd782623cmr11980768wmb.102.1666340129060; 
 Fri, 21 Oct 2022 01:15:29 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7dSqRkXzqC5F4Obj+JQsrZJ5zjwLNbZ8lcffV8nkUfR8TxmBsP4hsGz4IbGAQ7f4KxMqOOGg==
X-Received: by 2002:a05:600c:6885:b0:3bd:d782:623c with SMTP id
 fn5-20020a05600c688500b003bdd782623cmr11980756wmb.102.1666340128854; 
 Fri, 21 Oct 2022 01:15:28 -0700 (PDT)
Received: from redhat.com ([2.54.40.233]) by smtp.gmail.com with ESMTPSA id
 v24-20020a7bcb58000000b003a682354f63sm1939753wmj.11.2022.10.21.01.15.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 01:15:28 -0700 (PDT)
Date: Fri, 21 Oct 2022 04:15:24 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Liuxiangdong <liuxiangdong5@huawei.com>, Parav Pandit <parav@mellanox.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 Laurent Vivier <lvivier@redhat.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 Gautam Dawar <gdawar@xilinx.com>, Eli Cohen <eli@mellanox.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Cindy Lu <lulu@redhat.com>, Si-Wei Liu <si-wei.liu@oracle.com>
Subject: Re: [PATCH 2/4] vhost: toggle device callbacks using used event idx
Message-ID: <20221021041453-mutt-send-email-mst@kernel.org>
References: <20221020155251.398735-1-eperezma@redhat.com>
 <20221020155251.398735-3-eperezma@redhat.com>
 <CACGkMEukKCXRDSmR3nemxdHDphQHspGdY3nC9O5g9grQ59PN8w@mail.gmail.com>
 <CAJaqyWf0uXRze3qK1d02RB+Q4BJ60A8E7YYnnjBpdyANB2=new@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJaqyWf0uXRze3qK1d02RB+Q4BJ60A8E7YYnnjBpdyANB2=new@mail.gmail.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Oct 21, 2022 at 09:45:14AM +0200, Eugenio Perez Martin wrote:
> On Fri, Oct 21, 2022 at 5:40 AM Jason Wang <jasowang@redhat.com> wrote:
> >
> > On Thu, Oct 20, 2022 at 11:53 PM Eugenio Pérez <eperezma@redhat.com> wrote:
> > >
> > > Actually use the new field of the used ring and tell the device if SVQ
> > > wants to be notified.
> > >
> > > The code is not reachable at the moment.
> > >
> > > Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> > > ---
> > >  hw/virtio/vhost-shadow-virtqueue.c | 18 +++++++++++++++---
> > >  1 file changed, 15 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
> > > index a518f84772..f5c0fad3fc 100644
> > > --- a/hw/virtio/vhost-shadow-virtqueue.c
> > > +++ b/hw/virtio/vhost-shadow-virtqueue.c
> > > @@ -369,15 +369,27 @@ static bool vhost_svq_more_used(VhostShadowVirtqueue *svq)
> > >   */
> > >  static bool vhost_svq_enable_notification(VhostShadowVirtqueue *svq)
> > >  {
> > > -    svq->vring.avail->flags &= ~cpu_to_le16(VRING_AVAIL_F_NO_INTERRUPT);
> > > -    /* Make sure the flag is written before the read of used_idx */
> > > +    if (virtio_vdev_has_feature(svq->vdev, VIRTIO_RING_F_EVENT_IDX)) {
> > > +        uint16_t *used_event = (uint16_t *)&svq->vring.avail->ring[svq->vring.num];
> > > +        *used_event = svq->shadow_used_idx;
> >
> > Do we need to care about the endian here?
> >
> > E.g vduse has:
> >
> >     *((uint16_t *)&vq->vring.used->ring[vq->vring.num]) = htole16(val);
> >
> 
> Good catch, I forgot about endianness.
> 
> I'll review the series, thanks!

It's generally a waste that we don't use endian-ness annotations
the way linux does.


> > Thanks
> >
> > > +    } else {
> > > +        svq->vring.avail->flags &= ~cpu_to_le16(VRING_AVAIL_F_NO_INTERRUPT);
> > > +    }
> > > +
> > > +    /* Make sure the event is enabled before the read of used_idx */
> > >      smp_mb();
> > >      return !vhost_svq_more_used(svq);
> > >  }
> > >
> > >  static void vhost_svq_disable_notification(VhostShadowVirtqueue *svq)
> > >  {
> > > -    svq->vring.avail->flags |= cpu_to_le16(VRING_AVAIL_F_NO_INTERRUPT);
> > > +    /*
> > > +     * No need to disable notification in the event idx case, since used event
> > > +     * index is already an index too far away.
> > > +     */
> > > +    if (!virtio_vdev_has_feature(svq->vdev, VIRTIO_RING_F_EVENT_IDX)) {
> > > +        svq->vring.avail->flags |= cpu_to_le16(VRING_AVAIL_F_NO_INTERRUPT);
> > > +    }
> > >  }
> > >
> > >  static uint16_t vhost_svq_last_desc_of_chain(const VhostShadowVirtqueue *svq,
> > > --
> > > 2.31.1
> > >
> >


