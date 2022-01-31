Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC83E4A4085
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 11:54:28 +0100 (CET)
Received: from localhost ([::1]:34770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEUKJ-0004lp-Ap
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 05:54:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nEUFX-0003JP-G3
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 05:49:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nEUFV-00029O-Eu
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 05:49:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643626167;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+tPk8DMWsnbsWzw0Q8JX/BbP8grt+OqmcVDR+Ta2fGw=;
 b=NhH0lTbnsBvJynVorxgkAa4ftl+pYty6SNiDU0NbPQc2ORC9YGmem7Cg9/liA5LC+SNo4j
 eo116vjmCtrpdD7E+wz+S9mcASsdU3j5sQTMxvjSG8tWBXEi8YVEtY9T1jtkPk0lp/zM2/
 BZXUGlBJl8kdTWnUz+QMc2ZixkOGH0Q=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-635-yR0ec4QHOPOxxe_jcBJMBA-1; Mon, 31 Jan 2022 05:49:26 -0500
X-MC-Unique: yR0ec4QHOPOxxe_jcBJMBA-1
Received: by mail-qt1-f199.google.com with SMTP id
 h22-20020ac85696000000b002d258f68e98so9911100qta.22
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 02:49:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+tPk8DMWsnbsWzw0Q8JX/BbP8grt+OqmcVDR+Ta2fGw=;
 b=lzs4l/oxLzOPJgnmT6RfvHns622sweJMxQ+YJbHIhN6skfCvGblrNfUOpT5UxIOz8P
 KdMVW6hj14RbROvmIYOeu1df0eNwstefP+zxZ4nn7CdF5cZiCyHNSpozTD6Fyx4vI1Ar
 PqYV1VGTh4YGTnxX3FkHKrjCVPlfZAMm03psxir4mSCIedcVzuHED4f4eZog7oynRZuc
 Y93E/z6tDnlMJWvko6k+CGsX3KHH38DBSc9/3UzHSjfdXApOcydsrzovrB+ZaEgv0hBz
 /FxYFPS+k7JjL9t6Cy8kK0TVmqzDNpMLgbbp2cnSODo+2wRRnQQsodrWn4yxjFTxhea8
 vKTg==
X-Gm-Message-State: AOAM530ZqcXkHc00NXA4psri5MCsnTZnWLj5Sh8o85M8SFy+gTZ22g91
 BGF9y2eID5qRxR8rKN868il91khcn3azeWtp1+MZOCHh2MJWXE1LnuFeYnaTpahRk+aHNOvzmF8
 gGsll62G23n7ud61HIX9nizZrnTojq1Q=
X-Received: by 2002:a05:6214:d8e:: with SMTP id
 e14mr16294507qve.119.1643626166041; 
 Mon, 31 Jan 2022 02:49:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy04qDvIycdyAAwJYDs/y+eeFT1wqvBiyjUG25B8Yl6Xy3vjtdLVBp4aX/DvCQP4V9g+Icjaxyt0DZpC8yOyYg=
X-Received: by 2002:a05:6214:d8e:: with SMTP id
 e14mr16294481qve.119.1643626165748; 
 Mon, 31 Jan 2022 02:49:25 -0800 (PST)
MIME-Version: 1.0
References: <20220121202733.404989-1-eperezma@redhat.com>
 <20220121202733.404989-6-eperezma@redhat.com>
 <5d51d7c9-7066-e72e-e775-ad3956733779@redhat.com>
In-Reply-To: <5d51d7c9-7066-e72e-e775-ad3956733779@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 31 Jan 2022 11:48:49 +0100
Message-ID: <CAJaqyWd7OS2wYmdcUhMhCdbBrOkhQQnYFA7O5hCWd7Tq6nZT-A@mail.gmail.com>
Subject: Re: [PATCH 05/31] vhost: Add Shadow VirtQueue kick forwarding
 capabilities
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.088,
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

On Fri, Jan 28, 2022 at 7:33 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2022/1/22 =E4=B8=8A=E5=8D=884:27, Eugenio P=C3=A9rez =E5=86=99=
=E9=81=93:
> > At this mode no buffer forwarding will be performed in SVQ mode: Qemu
> > will just forward the guest's kicks to the device.
> >
> > Also, host notifiers must be disabled at SVQ start, and they will not
> > start if SVQ has been enabled when the device is stopped. This will be
> > addressed in next patches.
>
>
> We need to disable host_notifier_mr as well, otherwise guest may touch
> the hardware doorbell directly without going through eventfd.
>

Yes. SVQ cannot be enabled at this point anyway, but I think it's a
good idea to reorder so we disable hn_mr first.

>
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >   hw/virtio/vhost-shadow-virtqueue.h |  2 ++
> >   hw/virtio/vhost-shadow-virtqueue.c | 27 ++++++++++++++++++++++++++-
> >   2 files changed, 28 insertions(+), 1 deletion(-)
> >
> > diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shado=
w-virtqueue.h
> > index a56ecfc09d..4c583a9171 100644
> > --- a/hw/virtio/vhost-shadow-virtqueue.h
> > +++ b/hw/virtio/vhost-shadow-virtqueue.h
> > @@ -19,6 +19,8 @@ void vhost_svq_set_svq_kick_fd(VhostShadowVirtqueue *=
svq, int svq_kick_fd);
> >   const EventNotifier *vhost_svq_get_dev_kick_notifier(
> >                                                 const VhostShadowVirtqu=
eue *svq);
> >
> > +void vhost_svq_stop(VhostShadowVirtqueue *svq);
> > +
> >   VhostShadowVirtqueue *vhost_svq_new(void);
> >
> >   void vhost_svq_free(VhostShadowVirtqueue *vq);
> > diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shado=
w-virtqueue.c
> > index 21534bc94d..8991f0b3c3 100644
> > --- a/hw/virtio/vhost-shadow-virtqueue.c
> > +++ b/hw/virtio/vhost-shadow-virtqueue.c
> > @@ -42,11 +42,26 @@ const EventNotifier *vhost_svq_get_dev_kick_notifie=
r(
> >       return &svq->hdev_kick;
> >   }
> >
> > +/* Forward guest notifications */
> > +static void vhost_handle_guest_kick(EventNotifier *n)
> > +{
> > +    VhostShadowVirtqueue *svq =3D container_of(n, VhostShadowVirtqueue=
,
> > +                                             svq_kick);
> > +
> > +    if (unlikely(!event_notifier_test_and_clear(n))) {
> > +        return;
> > +    }
> > +
> > +    event_notifier_set(&svq->hdev_kick);
> > +}
> > +
> >   /**
> >    * Set a new file descriptor for the guest to kick SVQ and notify for=
 avail
> >    *
> >    * @svq          The svq
> > - * @svq_kick_fd  The new svq kick fd
> > + * @svq_kick_fd  The svq kick fd
> > + *
> > + * Note that SVQ will never close the old file descriptor.
> >    */
> >   void vhost_svq_set_svq_kick_fd(VhostShadowVirtqueue *svq, int svq_kic=
k_fd)
> >   {
> > @@ -65,12 +80,22 @@ void vhost_svq_set_svq_kick_fd(VhostShadowVirtqueue=
 *svq, int svq_kick_fd)
> >        * need to explicitely check for them.
> >        */
> >       event_notifier_init_fd(&svq->svq_kick, svq_kick_fd);
> > +    event_notifier_set_handler(&svq->svq_kick, vhost_handle_guest_kick=
);
> >
> >       if (!check_old || event_notifier_test_and_clear(&tmp)) {
> >           event_notifier_set(&svq->hdev_kick);
> >       }
> >   }
> >
> > +/**
> > + * Stop shadow virtqueue operation.
> > + * @svq Shadow Virtqueue
> > + */
> > +void vhost_svq_stop(VhostShadowVirtqueue *svq)
> > +{
> > +    event_notifier_set_handler(&svq->svq_kick, NULL);
> > +}
>
>
> This function is not used in the patch.
>

Right, I will add the use of it here.

Thanks!

> Thanks
>
>
> > +
> >   /**
> >    * Creates vhost shadow virtqueue, and instruct vhost device to use t=
he shadow
> >    * methods and file descriptors.
>


