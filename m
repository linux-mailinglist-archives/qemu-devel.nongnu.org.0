Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4876842E8D3
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 08:18:54 +0200 (CEST)
Received: from localhost ([::1]:56960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbGYP-0004Ae-DX
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 02:18:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mbGXU-0003Vh-A6
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 02:17:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mbGXS-0006z6-Oh
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 02:17:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634278673;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wnB2bn8Tk1qap/4C/JK3nO/PNM+0PV9GrTSzCvfmwew=;
 b=XjwC1h/f5pC+VfDXCpACmC/hR0uwuZjStprUU/kiv8ID7OooTz3TVh60ATbSHeBSNtCx0a
 BVbNRd62zJEmGSnFZ4r7/Earkz8D5YEIMJqz/we48G74foGOkgP6aWR4EGXiVTHUldsNMx
 CM+h2dyYTpvUtBSMd86Y07gJF6Ybbfc=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-57-2_CS6dYUMJO5oeysoaNu1Q-1; Fri, 15 Oct 2021 02:17:52 -0400
X-MC-Unique: 2_CS6dYUMJO5oeysoaNu1Q-1
Received: by mail-qt1-f198.google.com with SMTP id
 q26-20020ac8735a000000b002a781ad8463so5998368qtp.16
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 23:17:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wnB2bn8Tk1qap/4C/JK3nO/PNM+0PV9GrTSzCvfmwew=;
 b=z/KMpReTwz3Qgb9eZcf0BvUP70ADe5HJlFkuVu0kJFCPYB/24fHh72eIkRSRSZkZfq
 BXASNu/ivP5Mu6E+j8VZRNHsbvy0S/lGFyWAhWVqK8QvjIoILmD/x+DTo2i7Qlp/qUYY
 eaOaHG8CjF3oOneOHkHGHloUOrbooyZ+F5sWLsxxnkE9EsTamCjkEv9T30UmcvJZ+l7j
 167xJYWeK4yPH6cPKrto0kzfUztt4b0Ot5kBAPSfuF3mrZcvT10PywyCdPcuuZ5vmEpf
 OuUJaOewxVZYBF+ClqLEpWfA7zB2qusoWuSEoLiB1XnXGHtlczUqtsBZT0I1HVjbSe/t
 eulw==
X-Gm-Message-State: AOAM530PG30Q/TB7jT8bDVqYMDDaAs1N5lSMBY2Vbmp74ssdi829ugM9
 Fj2KZMQa2/7qgDsDLqF3TmTuhDIn5gx0TJH/A5mSoDz5FMLUE/Joul3axSuBPfIXV3L9MDp32a/
 GMTqTXVzsaPXDguj+cEmDAaV4yfNXJ7Y=
X-Received: by 2002:ac8:5bcf:: with SMTP id b15mr11775566qtb.178.1634278672153; 
 Thu, 14 Oct 2021 23:17:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyFmV6xo862epA0Sg+9LB+B3H6nUbZreaw77S6eZTMvbejt5QjmwjmscSzxH3x0PUNAmeYh87kfl+j+roXWRSU=
X-Received: by 2002:ac8:5bcf:: with SMTP id b15mr11775550qtb.178.1634278671962; 
 Thu, 14 Oct 2021 23:17:51 -0700 (PDT)
MIME-Version: 1.0
References: <20211001070603.307037-1-eperezma@redhat.com>
 <20211001070603.307037-17-eperezma@redhat.com>
 <f77b8efb-9d6b-5f35-2285-72f2dc59c26a@redhat.com>
In-Reply-To: <f77b8efb-9d6b-5f35-2285-72f2dc59c26a@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Fri, 15 Oct 2021 08:17:15 +0200
Message-ID: <CAJaqyWeGriU8kUo_TFu_iM8JJit4BLkds4eR5qFdMr1Xpm3mnw@mail.gmail.com>
Subject: Re: [RFC PATCH v4 16/20] vhost: Check for device
 VRING_USED_F_NO_NOTIFY at shadow virtqueue kick
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Wed, Oct 13, 2021 at 6:35 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2021/10/1 =E4=B8=8B=E5=8D=883:05, Eugenio P=C3=A9rez =E5=86=99=
=E9=81=93:
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >   hw/virtio/vhost-shadow-virtqueue.c | 11 ++++++++++-
> >   1 file changed, 10 insertions(+), 1 deletion(-)
> >
> > diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shado=
w-virtqueue.c
> > index df7e6fa3ec..775f8d36a0 100644
> > --- a/hw/virtio/vhost-shadow-virtqueue.c
> > +++ b/hw/virtio/vhost-shadow-virtqueue.c
> > @@ -173,6 +173,15 @@ static void vhost_svq_add(VhostShadowVirtqueue *sv=
q, VirtQueueElement *elem)
> >       svq->ring_id_maps[qemu_head] =3D elem;
> >   }
> >
> > +static void vhost_svq_kick(VhostShadowVirtqueue *svq)
> > +{
> > +    /* Make sure we are reading updated device flag */
>
>
> I guess this would be better:
>
>          /* We need to expose available array entries before checking use=
d
>           * flags. */
>
> (Borrowed from kernel codes).
>
> Thanks
>

Right, I will replace it, thanks!

>
> > +    smp_mb();
> > +    if (!(svq->vring.used->flags & VRING_USED_F_NO_NOTIFY)) {
> > +        event_notifier_set(&svq->kick_notifier);
> > +    }
> > +}
> > +
> >   /* Handle guest->device notifications */
> >   static void vhost_handle_guest_kick(EventNotifier *n)
> >   {
> > @@ -197,7 +206,7 @@ static void vhost_handle_guest_kick(EventNotifier *=
n)
> >               }
> >
> >               vhost_svq_add(svq, elem);
> > -            event_notifier_set(&svq->kick_notifier);
> > +            vhost_svq_kick(svq);
> >           }
> >
> >           virtio_queue_set_notification(svq->vq, true);
>


