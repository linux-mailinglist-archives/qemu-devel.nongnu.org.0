Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D686073E5
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 11:21:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oloDi-0003OX-LY
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 05:21:38 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olmjb-0004br-7v
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 03:46:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1olmjA-00044s-3Q
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 03:46:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1olmj5-0002Dn-1j
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 03:45:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666338353;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DEiZfm3BDzJVhHo2AVYjW/q9a+n269vm4njTsm/wV5o=;
 b=c0vsQ2Dxwv6Be9By1y00I+8GXTTvUM7lCqnwGN0sJ73BGoa+GuVnFH3uheoEyJv1eXeuWb
 wf11+7HuDPuqhe+i77E1EeyQv8gF2xxCnqD+fPqTi4zE6icKIEEJf50P6GmUZBh6hMiQ73
 R6Pa44JC2qIBsLb6LIKVYMjvyIXDGw8=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-644-W24hMm8yOh6Bw4J8wa5Rfw-1; Fri, 21 Oct 2022 03:45:52 -0400
X-MC-Unique: W24hMm8yOh6Bw4J8wa5Rfw-1
Received: by mail-pl1-f198.google.com with SMTP id
 z5-20020a170903018500b00184aedd9c75so1201648plg.11
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 00:45:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DEiZfm3BDzJVhHo2AVYjW/q9a+n269vm4njTsm/wV5o=;
 b=oEHpiKlsa6dQPtXfVknpRDIaGXWOYEAvMjFTEZxqLKQZvs85uuiYoxGFSpW0i+yV7w
 VPVAA5qH9lBI1qiQ9s7kFLEcBfdAekdG7amMU3wRVZD31h0JRGttXsktjSVNf4kTmBW6
 WWsMJ82AGeP6hdCxF9HesiWHLw7RPYDQX51TAYY0v6JrGJzjeklLpcrbAAQikWxAhXXR
 JjVyKepGfJVaNWG7i72zBhTRYK3Ab37wuOFrUpAUqsTSfD7igoG7dBVrIcjBcpjWrpIy
 Rl4I8g9HJYdXxuniW/v34gD+Jbw43BlWCM46ho56F6An4e7l9JvTDOReZtyGD/H1FgQx
 qNPA==
X-Gm-Message-State: ACrzQf1BjZulgdCKbqrxJmtVw28u2LXy/ofgKhL9Wcn9xKWl71qZtxJo
 UvjF/88MP/z4ujDUpqScgqpft3nWYBxxwwSaIj4qf4wKq5WgzSrU/LMOpXKPSWZqA9WruEf+7p1
 GeV4OC8kU+tqqqacch8QU/oIvZWkiY/k=
X-Received: by 2002:a65:5504:0:b0:42a:352d:c79c with SMTP id
 f4-20020a655504000000b0042a352dc79cmr15894055pgr.58.1666338351377; 
 Fri, 21 Oct 2022 00:45:51 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4E6d8XXVuELmd0IY5ifHceho+wJwNUUc3gXWcS/xcg3WwF9+HXQJR61uhMhp8Z/nlMrvYFBb9YU8ImZVxpTS4=
X-Received: by 2002:a65:5504:0:b0:42a:352d:c79c with SMTP id
 f4-20020a655504000000b0042a352dc79cmr15894026pgr.58.1666338351051; Fri, 21
 Oct 2022 00:45:51 -0700 (PDT)
MIME-Version: 1.0
References: <20221020155251.398735-1-eperezma@redhat.com>
 <20221020155251.398735-3-eperezma@redhat.com>
 <CACGkMEukKCXRDSmR3nemxdHDphQHspGdY3nC9O5g9grQ59PN8w@mail.gmail.com>
In-Reply-To: <CACGkMEukKCXRDSmR3nemxdHDphQHspGdY3nC9O5g9grQ59PN8w@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Fri, 21 Oct 2022 09:45:14 +0200
Message-ID: <CAJaqyWf0uXRze3qK1d02RB+Q4BJ60A8E7YYnnjBpdyANB2=new@mail.gmail.com>
Subject: Re: [PATCH 2/4] vhost: toggle device callbacks using used event idx
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel@nongnu.org, Liuxiangdong <liuxiangdong5@huawei.com>, 
 Parav Pandit <parav@mellanox.com>, Harpreet Singh Anand <hanand@xilinx.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Zhu Lingshan <lingshan.zhu@intel.com>, Gautam Dawar <gdawar@xilinx.com>,
 Eli Cohen <eli@mellanox.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Cindy Lu <lulu@redhat.com>, 
 Si-Wei Liu <si-wei.liu@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On Fri, Oct 21, 2022 at 5:40 AM Jason Wang <jasowang@redhat.com> wrote:
>
> On Thu, Oct 20, 2022 at 11:53 PM Eugenio P=C3=A9rez <eperezma@redhat.com>=
 wrote:
> >
> > Actually use the new field of the used ring and tell the device if SVQ
> > wants to be notified.
> >
> > The code is not reachable at the moment.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >  hw/virtio/vhost-shadow-virtqueue.c | 18 +++++++++++++++---
> >  1 file changed, 15 insertions(+), 3 deletions(-)
> >
> > diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shado=
w-virtqueue.c
> > index a518f84772..f5c0fad3fc 100644
> > --- a/hw/virtio/vhost-shadow-virtqueue.c
> > +++ b/hw/virtio/vhost-shadow-virtqueue.c
> > @@ -369,15 +369,27 @@ static bool vhost_svq_more_used(VhostShadowVirtqu=
eue *svq)
> >   */
> >  static bool vhost_svq_enable_notification(VhostShadowVirtqueue *svq)
> >  {
> > -    svq->vring.avail->flags &=3D ~cpu_to_le16(VRING_AVAIL_F_NO_INTERRU=
PT);
> > -    /* Make sure the flag is written before the read of used_idx */
> > +    if (virtio_vdev_has_feature(svq->vdev, VIRTIO_RING_F_EVENT_IDX)) {
> > +        uint16_t *used_event =3D (uint16_t *)&svq->vring.avail->ring[s=
vq->vring.num];
> > +        *used_event =3D svq->shadow_used_idx;
>
> Do we need to care about the endian here?
>
> E.g vduse has:
>
>     *((uint16_t *)&vq->vring.used->ring[vq->vring.num]) =3D htole16(val);
>

Good catch, I forgot about endianness.

I'll review the series, thanks!

> Thanks
>
> > +    } else {
> > +        svq->vring.avail->flags &=3D ~cpu_to_le16(VRING_AVAIL_F_NO_INT=
ERRUPT);
> > +    }
> > +
> > +    /* Make sure the event is enabled before the read of used_idx */
> >      smp_mb();
> >      return !vhost_svq_more_used(svq);
> >  }
> >
> >  static void vhost_svq_disable_notification(VhostShadowVirtqueue *svq)
> >  {
> > -    svq->vring.avail->flags |=3D cpu_to_le16(VRING_AVAIL_F_NO_INTERRUP=
T);
> > +    /*
> > +     * No need to disable notification in the event idx case, since us=
ed event
> > +     * index is already an index too far away.
> > +     */
> > +    if (!virtio_vdev_has_feature(svq->vdev, VIRTIO_RING_F_EVENT_IDX)) =
{
> > +        svq->vring.avail->flags |=3D cpu_to_le16(VRING_AVAIL_F_NO_INTE=
RRUPT);
> > +    }
> >  }
> >
> >  static uint16_t vhost_svq_last_desc_of_chain(const VhostShadowVirtqueu=
e *svq,
> > --
> > 2.31.1
> >
>


