Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 120824C8A8F
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 12:20:58 +0100 (CET)
Received: from localhost ([::1]:35418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP0Yp-0002kM-OP
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 06:20:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nP0XO-00021F-0B
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 06:19:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nP0XK-0005qR-KO
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 06:19:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646133561;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t/er5w7Eh0x3LUj4N0VWhR9gIt+XlOgyMuRFjmvBpHo=;
 b=evAT3dKYuVJObYLwnfqR/xbzq5zbtt5oW4vOwuwqOlfYioXO5NIoWHd9Er3wowkDNJmgiH
 PyZpj4udoZUsdoYoHRmcA31MCF8Uy6yiph/qfveoJvzLckLPHzfMBBunnbvh3MH3LmB/y7
 llQr2GUzittnHzd+5Nydk/8AF+5RhdE=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-103-wzvCwrGtN06Nxo9AtA6X1g-1; Tue, 01 Mar 2022 06:19:16 -0500
X-MC-Unique: wzvCwrGtN06Nxo9AtA6X1g-1
Received: by mail-qv1-f72.google.com with SMTP id
 t18-20020a0cb712000000b004350812c194so985414qvd.9
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 03:19:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=t/er5w7Eh0x3LUj4N0VWhR9gIt+XlOgyMuRFjmvBpHo=;
 b=sCwwj+cLq6Fd5+EokGJd7eINXR74QpMIqdgV9HV8+uMZOrA6cYeo8ko5UK4rWiWccX
 s8YUeg6lNh70MKWSGyi/AJjQj40HRnncDB6nQ6AaTgQoU9N01Ywf2pLwhEn2Ssp52TtL
 GHaxZySC4kLDYt5wUtr+unWtfjiiLq+N0WxX2M9abb7sWiYiOHkny6aqVNorIW9iwrbw
 /R9ybzvP5gZJxSdevaT4c53HJ5nqUV2fvEmySCvRNiMxaWInUWX26OHH8Vc3k9DY0SYS
 z3LOYbc6EUV6uGOlaWsIR0q4sdE5Mx5UVjhKKcEnUZiIBbwdBR06nAWNnSZcZlGc8jQ9
 yJ5Q==
X-Gm-Message-State: AOAM532oXhlBjREqc2qb+FEQG+EetQQdZ1ZEeQGUxFFE7ALiCj2aWjgp
 dyTuOKT9UURHaOVrishHk7ztFOIK/9TWa/R4YWSkvIUY5l5sVIRXNHeTpx8+d1DeiteqSuH0G9w
 dEL6HzWt62/bZv3h/JTpPt9fvF/NhEpo=
X-Received: by 2002:a05:6214:19cd:b0:433:2eca:f77a with SMTP id
 j13-20020a05621419cd00b004332ecaf77amr4317767qvc.26.1646133556335; 
 Tue, 01 Mar 2022 03:19:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwWyDNHt8wNpzzrINQydlRdoZxSRgujvgSLSLQk9z/dBFLlsyScVjG0S+nrbR+jdodTdS4bn6hQXNnkGTNJL9Y=
X-Received: by 2002:a05:6214:19cd:b0:433:2eca:f77a with SMTP id
 j13-20020a05621419cd00b004332ecaf77amr4317688qvc.26.1646133555063; Tue, 01
 Mar 2022 03:19:15 -0800 (PST)
MIME-Version: 1.0
References: <20220227134111.3254066-1-eperezma@redhat.com>
 <20220227134111.3254066-4-eperezma@redhat.com>
 <627893d5-9976-8cfb-7e2c-edb55ad54254@redhat.com>
In-Reply-To: <627893d5-9976-8cfb-7e2c-edb55ad54254@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 1 Mar 2022 12:18:39 +0100
Message-ID: <CAJaqyWcY8+9xCFbH9qfHbtsqukeuXgwU9FmjhooL-_m_PLuecA@mail.gmail.com>
Subject: Re: [PATCH v2 03/14] vhost: Add Shadow VirtQueue call forwarding
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
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-level <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Eli Cohen <eli@mellanox.com>, Eric Blake <eblake@redhat.com>,
 Parav Pandit <parav@mellanox.com>, Cindy Lu <lulu@redhat.com>,
 "Fangyi \(Eric\)" <eric.fangyi@huawei.com>,
 Markus Armbruster <armbru@redhat.com>, yebiaoxiang@huawei.com,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gautam Dawar <gdawar@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Lingshan <lingshan.zhu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 28, 2022 at 4:18 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2022/2/27 =E4=B8=8B=E5=8D=889:41, Eugenio P=C3=A9rez =E5=86=99=
=E9=81=93:
> > This will make qemu aware of the device used buffers, allowing it to
> > write the guest memory with its contents if needed.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >   hw/virtio/vhost-shadow-virtqueue.h |  4 ++++
> >   hw/virtio/vhost-shadow-virtqueue.c | 34 +++++++++++++++++++++++++++++=
+
> >   hw/virtio/vhost-vdpa.c             | 31 +++++++++++++++++++++++++--
> >   3 files changed, 67 insertions(+), 2 deletions(-)
> >
> > diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shado=
w-virtqueue.h
> > index 1cbc87d5d8..1d4c160d0a 100644
> > --- a/hw/virtio/vhost-shadow-virtqueue.h
> > +++ b/hw/virtio/vhost-shadow-virtqueue.h
> > @@ -28,9 +28,13 @@ typedef struct VhostShadowVirtqueue {
> >        * So shadow virtqueue must not clean it, or we would lose VirtQu=
eue one.
> >        */
> >       EventNotifier svq_kick;
> > +
> > +    /* Guest's call notifier, where the SVQ calls guest. */
> > +    EventNotifier svq_call;
> >   } VhostShadowVirtqueue;
> >
> >   void vhost_svq_set_svq_kick_fd(VhostShadowVirtqueue *svq, int svq_kic=
k_fd);
> > +void vhost_svq_set_guest_call_notifier(VhostShadowVirtqueue *svq, int =
call_fd);
> >
> >   void vhost_svq_stop(VhostShadowVirtqueue *svq);
> >
> > diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shado=
w-virtqueue.c
> > index a5d0659f86..54c701a196 100644
> > --- a/hw/virtio/vhost-shadow-virtqueue.c
> > +++ b/hw/virtio/vhost-shadow-virtqueue.c
> > @@ -23,6 +23,38 @@ static void vhost_handle_guest_kick(EventNotifier *n=
)
> >       event_notifier_set(&svq->hdev_kick);
> >   }
> >
> > +/* Forward vhost notifications */
> > +static void vhost_svq_handle_call(EventNotifier *n)
> > +{
> > +    VhostShadowVirtqueue *svq =3D container_of(n, VhostShadowVirtqueue=
,
> > +                                             hdev_call);
> > +    event_notifier_test_and_clear(n);
> > +    event_notifier_set(&svq->svq_call);
> > +}
> > +
> > +/**
> > + * Set the call notifier for the SVQ to call the guest
> > + *
> > + * @svq Shadow virtqueue
> > + * @call_fd call notifier
> > + *
> > + * Called on BQL context.
> > + */
> > +void vhost_svq_set_guest_call_notifier(VhostShadowVirtqueue *svq, int =
call_fd)
>
>
> I think we need to have consistent naming for both kick and call. Note
> that in patch 2 we had
>
> vhost_svq_set_svq_kick_fd
>
> Maybe it's better to use vhost_svq_set_guest_call_fd() here.
>

I think the same, I will replace it for the next version.

>
> > +{
> > +    if (call_fd =3D=3D VHOST_FILE_UNBIND) {
> > +        /*
> > +         * Fail event_notifier_set if called handling device call.
> > +         *
> > +         * SVQ still needs device notifications, since it needs to kee=
p
> > +         * forwarding used buffers even with the unbind.
> > +         */
> > +        memset(&svq->svq_call, 0, sizeof(svq->svq_call));
>
>
> I may miss something but shouldn't we stop polling svq_call here like
>
> event_notifier_set_handle(&svq->svq_call, false);
>

SVQ never polls that descriptor: It uses that descriptor to call (as
notify) the guest at vhost_svq_flush when SVQ uses descriptors.

svq_kick, svq_call: Descriptors that the guest send to SVQ
hdev_kick, hdev_call: Descriptors that qemu/SVQ send to the device.

I admit it is confusing when reading the code but I cannot come up
with a better naming. Maybe it helps to add a diagram at the top of
the file like:

+-------+-> svq_kick_fd ->+-----+-> hdev_kick ->+-----+
| Guest |                 | SVQ |               | Dev |
+-------+<- svq_call_fd <-+-----+<- hdev_call <-+-----+

Thanks!

> ?
>
> Thanks
>
>


