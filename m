Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCEE34A3118
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Jan 2022 18:52:50 +0100 (CET)
Received: from localhost ([::1]:55946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDru5-0005D8-9g
	for lists+qemu-devel@lfdr.de; Sat, 29 Jan 2022 12:52:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nDrri-0003pk-FK
 for qemu-devel@nongnu.org; Sat, 29 Jan 2022 12:50:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27170)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nDrra-000468-6l
 for qemu-devel@nongnu.org; Sat, 29 Jan 2022 12:50:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643478608;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nQCZ9GTnkrb+1GpbBxqzJYyB3lsdsgF8UrLmYEJ1dbY=;
 b=PfXEgq36JaIb8p7Rt4rn1hbNbF3yElzaQiK2AlWo+3ftfdiiAVL5kh0IDeyrrO2Xf7ha5O
 NPTANmoCoAHuuYhZg2oxOWz0M7bLlCQ7OZvt0fj3DWFuOp83upv3Fed3YUhzV9a+Utv35e
 NHZm+l/EudEmG/7XypAvEzk2LrfRpLE=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-606-mhZcucXgOP23_aZVNnELRw-1; Sat, 29 Jan 2022 12:50:07 -0500
X-MC-Unique: mhZcucXgOP23_aZVNnELRw-1
Received: by mail-qk1-f198.google.com with SMTP id
 g3-20020a05620a108300b0047e16fc0d6cso7064845qkk.3
 for <qemu-devel@nongnu.org>; Sat, 29 Jan 2022 09:50:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=nQCZ9GTnkrb+1GpbBxqzJYyB3lsdsgF8UrLmYEJ1dbY=;
 b=xn3pc+bro0QieAJfLr7IQouBWZ0D5izQCq6CuQoLCVU555lc4U6wmR43sF3Ljaha/S
 TIM3U/5AvuXVCjxY0DbOhAvvXnrnrh236nZWxUiVGcHmo1/avpdp0smGEdVH1jJMG5+r
 NwxkxwvfwCBGEAxZ3nN5qrK6GUvDmt9cvCR80fJVflWb5+zl3AVRS3Y2QV9h/eyuR4yT
 1t44Jpvn/e1Ubaa8t9RnfZKmX+7bRTfaxhd5VAStAM3YipbWr1CpXPBpRiNI3BGY3Uy5
 jmK8xMqAmNx4x7jx2G1lFFhhOY4DVdv8NoOOvGIV6AyQPE3qtMTQZRXdlc8R4lP2KHG5
 /KFg==
X-Gm-Message-State: AOAM531UieT7hb+HYV6IVZElE8j2QFTz2PFV0Q5ZIgGlxsmxiDpql7kq
 h+TMz/8/aBk/gQYZdSpz8Aq5WcmJpUkvGfbi0mwvj8OvZJkuGGqZNVwBbOjhszhzYkmYwAEzNA1
 ovUMYf6jxJQaMb7VGrq0ARiBA7LNvJLI=
X-Received: by 2002:a05:620a:1996:: with SMTP id
 bm22mr8718638qkb.764.1643478606643; 
 Sat, 29 Jan 2022 09:50:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxxJebD/pu6nGbwSdb/EckZz16PtH/GVeTQ1sSM/wzaV2ypwFRbAMFQDB5eT3/gjv91Fn4iNADxtWr8ljnpYe0=
X-Received: by 2002:a05:620a:1996:: with SMTP id
 bm22mr8718626qkb.764.1643478606441; 
 Sat, 29 Jan 2022 09:50:06 -0800 (PST)
MIME-Version: 1.0
References: <20220121202733.404989-1-eperezma@redhat.com>
 <20220121202733.404989-8-eperezma@redhat.com>
 <05ff460b-1d9a-935b-8a1d-28ba0b5be8b8@redhat.com>
In-Reply-To: <05ff460b-1d9a-935b-8a1d-28ba0b5be8b8@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Sat, 29 Jan 2022 18:49:30 +0100
Message-ID: <CAJaqyWdoYEOeD6TuKzyRppYGBRzkhyX-LYP9U9jnQ2vXjbJo2w@mail.gmail.com>
Subject: Re: [PATCH 07/31] vhost: dd vhost_svq_get_svq_call_notifier
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-level <qemu-devel@nongnu.org>, Gautam Dawar <gdawar@xilinx.com>,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Peter Xu <peterx@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Eric Blake <eblake@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Jan 29, 2022 at 8:57 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2022/1/22 =E4=B8=8A=E5=8D=884:27, Eugenio P=C3=A9rez =E5=86=99=
=E9=81=93:
> > This allows vhost-vdpa device to retrieve device -> svq call eventfd.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
>
>
> What did 'dd' mean in the title?
>

It was intended to be "add" but I missed the first letter. I will fix
for the next version.

Thanks!

> Thanks
>
>
> > ---
> >   hw/virtio/vhost-shadow-virtqueue.h |  2 ++
> >   hw/virtio/vhost-shadow-virtqueue.c | 12 ++++++++++++
> >   2 files changed, 14 insertions(+)
> >
> > diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shado=
w-virtqueue.h
> > index 4c583a9171..a78234b52b 100644
> > --- a/hw/virtio/vhost-shadow-virtqueue.h
> > +++ b/hw/virtio/vhost-shadow-virtqueue.h
> > @@ -18,6 +18,8 @@ typedef struct VhostShadowVirtqueue VhostShadowVirtqu=
eue;
> >   void vhost_svq_set_svq_kick_fd(VhostShadowVirtqueue *svq, int svq_kic=
k_fd);
> >   const EventNotifier *vhost_svq_get_dev_kick_notifier(
> >                                                 const VhostShadowVirtqu=
eue *svq);
> > +const EventNotifier *vhost_svq_get_svq_call_notifier(
> > +                                              const VhostShadowVirtque=
ue *svq);
> >
> >   void vhost_svq_stop(VhostShadowVirtqueue *svq);
> >
> > diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shado=
w-virtqueue.c
> > index 8991f0b3c3..25fcdf16ec 100644
> > --- a/hw/virtio/vhost-shadow-virtqueue.c
> > +++ b/hw/virtio/vhost-shadow-virtqueue.c
> > @@ -55,6 +55,18 @@ static void vhost_handle_guest_kick(EventNotifier *n=
)
> >       event_notifier_set(&svq->hdev_kick);
> >   }
> >
> > +/**
> > + * Obtain the SVQ call notifier, where vhost device notifies SVQ that =
there
> > + * exists pending used buffers.
> > + *
> > + * @svq Shadow Virtqueue
> > + */
> > +const EventNotifier *vhost_svq_get_svq_call_notifier(
> > +                                               const VhostShadowVirtqu=
eue *svq)
> > +{
> > +    return &svq->hdev_call;
> > +}
> > +
> >   /**
> >    * Set a new file descriptor for the guest to kick SVQ and notify for=
 avail
> >    *
>


