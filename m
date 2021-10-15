Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E78542E8EA
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 08:23:48 +0200 (CEST)
Received: from localhost ([::1]:33262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbGd9-0007Pn-HI
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 02:23:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mbGcM-0006kp-To
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 02:22:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33307)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mbGcK-0002mp-Aw
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 02:22:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634278975;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pZ0eRnSmn2LxZfmxj8yqDDANQxCG16mcoNYAXnY6fLg=;
 b=ZJlNvRY+hb3Ct7SEB5u4QU1Y+eSCrASlHZnYURPBoeSKnZpIn5vQZ59h/sAY7S0aCjQOwY
 VQLU1El3kyELAxMze77KES8Vo7c2SswV/Wnp1UvQD3D3uDlNmP03FuQKp+29JflbhKVx1C
 qEUcG7+N9Txr2TeTq5ouPAtvX6fGUL8=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-454-Li-CUXqePxaoT52YwuslZQ-1; Fri, 15 Oct 2021 02:22:54 -0400
X-MC-Unique: Li-CUXqePxaoT52YwuslZQ-1
Received: by mail-qt1-f199.google.com with SMTP id
 d19-20020ac85ad3000000b002a74d0626bcso6084174qtd.5
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 23:22:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pZ0eRnSmn2LxZfmxj8yqDDANQxCG16mcoNYAXnY6fLg=;
 b=ruf150fvIrVdqx/aJ1sA3zfy6jYP2MmQajWv/6yeqJGrhwnh8+xzkhwZJGcPOT8s6V
 fTOyfmM7vY1fEE7hk1Nvj4SfSmLGi5sNsGjjdbShocWt3FFrXz7P4n1LS6FTdnyieRWF
 j51Y1DWjQnDwKX+JQNrnvtSaq9GV/IRZoOmzaOMXSxnZ3GaHViCNmdR6tHMvJx0ct8XQ
 qit3LbCEKIKFFTPjdwXZZjpR9YX/Befldyg4O5ZH3tOfNqkXsveBAy35rAIMxMXXNOg/
 CtO9y8B4B9WpIR8H3GKYSJw7PQqOp0DL2o7J4Zx8zOHN5X0QsPyTV0SaTgoeTlsrsZGd
 yxAg==
X-Gm-Message-State: AOAM532aJ+H7l03Tac47yfcNDrHGo4UG99Mv03zQLHha4AqTJykdNTXP
 7eLY5J883rzaJjUywPT9qlOQkS265XbrqH7CVqeYpjJKM694OYEWEPMJPomKnBEerdGROQIWpPe
 BsnDUmEjWQZydE7GjiLStJKCjO2IyvA4=
X-Received: by 2002:ac8:598d:: with SMTP id e13mr12114105qte.76.1634278973672; 
 Thu, 14 Oct 2021 23:22:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx6P24RTjqCKEdAi1X8P5uOLpClmLrHrfjSzHRhh7RIcfVRM6CxRwVI3WJz887RoJHQ9GPdci+gCn3KakwfRag=
X-Received: by 2002:ac8:598d:: with SMTP id e13mr12114084qte.76.1634278973455; 
 Thu, 14 Oct 2021 23:22:53 -0700 (PDT)
MIME-Version: 1.0
References: <20211001070603.307037-1-eperezma@redhat.com>
 <20211001070603.307037-18-eperezma@redhat.com>
 <6ae86e3f-a922-3576-a73a-a6c80ac7dd3f@redhat.com>
In-Reply-To: <6ae86e3f-a922-3576-a73a-a6c80ac7dd3f@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Fri, 15 Oct 2021 08:22:17 +0200
Message-ID: <CAJaqyWfp=JO9j-ba3PmkHPbJqtoKPYeB9W-bNtTA1WVZMvocew@mail.gmail.com>
Subject: Re: [RFC PATCH v4 17/20] vhost: Use VRING_AVAIL_F_NO_INTERRUPT at
 device call on shadow virtqueue
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
 Eric Blake <eblake@redhat.com>, Michael Lilja <ml@napatech.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 13, 2021 at 6:36 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2021/10/1 =E4=B8=8B=E5=8D=883:06, Eugenio P=C3=A9rez =E5=86=99=
=E9=81=93:
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
>
>
> Commit log please.
>
> Thanks
>

Sorry, this was another commit that was intended to be squashed.

I think I squashed two other (previous) commits by mistake in the
rebase editor, that's why you detected unrelated changes and mixed SVQ
& vhost-vdpa changes. I will take more care for the next series I
send.

Thanks!

>
> > ---
> >   hw/virtio/vhost-shadow-virtqueue.c | 24 +++++++++++++++++++++++-
> >   1 file changed, 23 insertions(+), 1 deletion(-)
> >
> > diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shado=
w-virtqueue.c
> > index 775f8d36a0..2fd0bab75d 100644
> > --- a/hw/virtio/vhost-shadow-virtqueue.c
> > +++ b/hw/virtio/vhost-shadow-virtqueue.c
> > @@ -60,6 +60,9 @@ typedef struct VhostShadowVirtqueue {
> >
> >       /* Next head to consume from device */
> >       uint16_t used_idx;
> > +
> > +    /* Cache for the exposed notification flag */
> > +    bool notification;
> >   } VhostShadowVirtqueue;
> >
> >   /* If the device is using some of these, SVQ cannot communicate */
> > @@ -105,6 +108,24 @@ bool vhost_svq_valid_device_features(uint64_t *dev=
_features)
> >       return r;
> >   }
> >
> > +static void vhost_svq_set_notification(VhostShadowVirtqueue *svq, bool=
 enable)
> > +{
> > +    uint16_t notification_flag;
> > +
> > +    if (svq->notification =3D=3D enable) {
> > +        return;
> > +    }
> > +
> > +    notification_flag =3D cpu_to_le16(VRING_AVAIL_F_NO_INTERRUPT);
> > +
> > +    svq->notification =3D enable;
> > +    if (enable) {
> > +        svq->vring.avail->flags &=3D ~notification_flag;
> > +    } else {
> > +        svq->vring.avail->flags |=3D notification_flag;
> > +    }
> > +}
> > +
> >   static void vhost_vring_write_descs(VhostShadowVirtqueue *svq,
> >                                       const struct iovec *iovec,
> >                                       size_t num, bool more_descs, bool=
 write)
> > @@ -273,7 +294,7 @@ static void vhost_svq_handle_call_no_test(EventNoti=
fier *n)
> >       do {
> >           unsigned i =3D 0;
> >
> > -        /* TODO: Use VRING_AVAIL_F_NO_INTERRUPT */
> > +        vhost_svq_set_notification(svq, false);
> >           while (true) {
> >               g_autofree VirtQueueElement *elem =3D vhost_svq_get_buf(s=
vq);
> >               if (!elem) {
> > @@ -286,6 +307,7 @@ static void vhost_svq_handle_call_no_test(EventNoti=
fier *n)
> >
> >           virtqueue_flush(vq, i);
> >           event_notifier_set(&svq->guest_call_notifier);
> > +        vhost_svq_set_notification(svq, true);
> >       } while (vhost_svq_more_used(svq));
> >   }
> >
>


