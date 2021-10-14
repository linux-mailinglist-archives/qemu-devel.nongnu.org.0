Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8E342D932
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 14:21:14 +0200 (CEST)
Received: from localhost ([::1]:38810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mazjV-0005FL-55
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 08:21:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mazaw-0005QL-Tb
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 08:12:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mazat-0000yS-PU
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 08:12:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634213538;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VpY0QJ64D1wJSUfFxYum9jPq8C2JO5ocreY8MS5sIXg=;
 b=MkQYSSLNC4WzE7f0Uvy7XF+xyJb00iIwiEy8wnXGbAgvUIQLzUNjWxHUsfqAVkUSwodJY1
 iq/PYa3hpC3PEnTVGCSUZwtVF7PjFOwdUykJgtoRpaqEB8Rk1iUX5nZLyzoKVuZ9XMygS+
 ZQZWF0Nng86btRim/a4tNQBFgCseJyI=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-600-gFmFEWXkMXi0m_CI32sTfQ-1; Thu, 14 Oct 2021 08:12:15 -0400
X-MC-Unique: gFmFEWXkMXi0m_CI32sTfQ-1
Received: by mail-qv1-f70.google.com with SMTP id
 4-20020a05621420a400b003831d93e2b5so5422063qvd.12
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 05:12:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=VpY0QJ64D1wJSUfFxYum9jPq8C2JO5ocreY8MS5sIXg=;
 b=6A+i9ti4Pcn/CmmYB7uiV0ADiFDdirQMDxPc5JGBfk4uPs7AiCAmST2Q6R+YIQPgYp
 veRhPwEm7P3VrJvI1IfAmgpz8p5lmxSi2diiqfWR741mfRS6VqY4cEIZVf8pV9f+QyE6
 DHX3tCFyY4onAS18fxNW6N0je6B7qNbMvkTHxaYihZ5cjBuLu8m7XYul+bp/9y1ZhpVo
 DJwBSs9xYdccuI4rMI4utFP0VL1RdK8EtmrG+b+jyLxou3zsx+2u418DMYUws+BrVOIZ
 kOZ04i6Vo38EI/BPeQroaUCSY7AQ4rCoNpXC53FDs/Lwmxz9ELZKrVMvvhHzetiK1W0j
 EpCg==
X-Gm-Message-State: AOAM53213Ve3bJLqzwaVUZwMTYzX1RHYBiGX+ytHaVTTGl8KIerVXHSL
 hlnyMahFTErh60OQoK3bB2cTP6YLDDE2sY9Ntf+rBvx9q73fNvll8Er75HPmbJrnXqbwIVsu9sD
 0GfW0UjwilUUsNgmXWqZQZIklxAVLLYA=
X-Received: by 2002:ac8:5f90:: with SMTP id j16mr6063145qta.175.1634213534723; 
 Thu, 14 Oct 2021 05:12:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw/HGHcDv2Npe+mesiXBpCfU/GNttWaOUGoHJ+ajj6pT+Zfnn8ahZB6khbQSccVu4L/Cncsr/rO5cl9uLuhBvk=
X-Received: by 2002:ac8:5f90:: with SMTP id j16mr6063116qta.175.1634213534531; 
 Thu, 14 Oct 2021 05:12:14 -0700 (PDT)
MIME-Version: 1.0
References: <20211001070603.307037-1-eperezma@redhat.com>
 <20211001070603.307037-10-eperezma@redhat.com>
 <607201ea-db7f-0264-7dd7-fa19143b3abf@redhat.com>
In-Reply-To: <607201ea-db7f-0264-7dd7-fa19143b3abf@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Thu, 14 Oct 2021 14:11:38 +0200
Message-ID: <CAJaqyWc4g=6AydktvcHbq3YiuGgX8ai3jF3sPb5_9xvYknncKA@mail.gmail.com>
Subject: Re: [RFC PATCH v4 09/20] vdpa: Save call_fd in vhost-vdpa
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Parav Pandit <parav@mellanox.com>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-level <qemu-devel@nongnu.org>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Eric Blake <eblake@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 13, 2021 at 5:43 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2021/10/1 =E4=B8=8B=E5=8D=883:05, Eugenio P=C3=A9rez =E5=86=99=
=E9=81=93:
> > We need to know it to switch to Shadow VirtQueue.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >   include/hw/virtio/vhost-vdpa.h | 2 ++
> >   hw/virtio/vhost-vdpa.c         | 5 +++++
> >   2 files changed, 7 insertions(+)
> >
> > diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-v=
dpa.h
> > index 48aae59d8e..fddac248b3 100644
> > --- a/include/hw/virtio/vhost-vdpa.h
> > +++ b/include/hw/virtio/vhost-vdpa.h
> > @@ -30,6 +30,8 @@ typedef struct vhost_vdpa {
> >       GPtrArray *shadow_vqs;
> >       struct vhost_dev *dev;
> >       QLIST_ENTRY(vhost_vdpa) entry;
> > +    /* File descriptor the device uses to call VM/SVQ */
> > +    int call_fd[VIRTIO_QUEUE_MAX];
>
>
> Any reason we don't do this for kick_fd or why
> virtio_queue_get_guest_notifier() can't work here? Need a comment or
> commit log.
>
> I think we need to have a consistent way to handle both kick and call fd.
>
> Thanks
>

The reasons for it have been given in answers to patch 08/20, since
both have converged to it somehow. Please let me know if you think
otherwise and this needs to be continued here.

Thanks!

>
> >       VhostVDPAHostNotifier notifier[VIRTIO_QUEUE_MAX];
> >   } VhostVDPA;
> >
> > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > index 36c954a779..57a857444a 100644
> > --- a/hw/virtio/vhost-vdpa.c
> > +++ b/hw/virtio/vhost-vdpa.c
> > @@ -652,7 +652,12 @@ static int vhost_vdpa_set_vring_kick(struct vhost_=
dev *dev,
> >   static int vhost_vdpa_set_vring_call(struct vhost_dev *dev,
> >                                          struct vhost_vring_file *file)
> >   {
> > +    struct vhost_vdpa *v =3D dev->opaque;
> > +    int vdpa_idx =3D vhost_vdpa_get_vq_index(dev, file->index);
> > +
> >       trace_vhost_vdpa_set_vring_call(dev, file->index, file->fd);
> > +
> > +    v->call_fd[vdpa_idx] =3D file->fd;
> >       return vhost_vdpa_call(dev, VHOST_SET_VRING_CALL, file);
> >   }
> >
>


