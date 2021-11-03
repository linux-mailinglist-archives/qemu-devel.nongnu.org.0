Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 182C3443BCF
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 04:20:48 +0100 (CET)
Received: from localhost ([::1]:47772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mi6pT-0006M8-8v
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 23:20:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mi6nb-0004vO-FA
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 23:18:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mi6nX-0002kg-Ps
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 23:18:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635909526;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nbi9rn2xsE5yf8jFyQAhibGX8oN+6/Yf35r4qZ0RW1k=;
 b=ERmHe+BagyaXUOHHmDoSClFnEN5pflKxE32b89F8JCz5X6GDioosc+DCKb+h+9CiHgRh4n
 p7d7BS5LzPgnSWrhRnEkmvTgYNiOT96ZRhNtBjSC6xUERWQ9R0hx/Qk9qPckHXm+a+h7Ls
 hLcUwGMgxJctdHPFZ7BaHnnac1PoY/o=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-242-ldlAJXqAPXm07G5D1ZczZg-1; Tue, 02 Nov 2021 23:18:43 -0400
X-MC-Unique: ldlAJXqAPXm07G5D1ZczZg-1
Received: by mail-lj1-f197.google.com with SMTP id
 f6-20020a2e9e86000000b00211349f9ce3so521456ljk.3
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 20:18:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=nbi9rn2xsE5yf8jFyQAhibGX8oN+6/Yf35r4qZ0RW1k=;
 b=ynEjKoU0HBuquoqYn+y+cY2uohtlKVLrgFPzcSllEmbAfqqIeh+h/4+SWdzApQJbho
 MWZD5Y1M5x7zRDaYtn79OQeOyq+msNJXA/w5yw8mkg8xEmt+uq04/CyI9ipJiDv4lBFh
 HE1j1otpRLXc9jOx+V+aikTtWfXHD8jmFVIFLPnmAYVHF5tC1l96ylYM5EqYWfPiJarl
 e7i2vJkHhzD2OmGlkDXEkLQK6rNP0RRTkWFhkxC06PdcduuPY3NzsYUsvbxuExhBlyXM
 kWKO3dhX4MCTZ8rfkdw9oX6qBNjmQWJyWXJakeN/Z8FgVvkxfwPAYelAdhFXccfpMNdr
 dp+g==
X-Gm-Message-State: AOAM533sCQLdH2iuFCf2NyPwygy9zzOfK+a9NpQK7gsChAVvteRXPR1K
 DzX8upH/KpZtAgvWlNbxbMVfdYPZjV7VTFyGLJj7/lMWyGX2mz2xOwBctUhBq6S62UotojfumxH
 HYpVU1ccCCbanGwMuXEDMsRFCyiS713w=
X-Received: by 2002:a05:651c:1254:: with SMTP id
 h20mr43543820ljh.420.1635909522413; 
 Tue, 02 Nov 2021 20:18:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxi1q1R1sCNlX0y74CNOGX7yiG87rnq/CIa6IVvhtvbbPlNJwhZY0tF688cVh8XLXLBPy6krwe4saZaLPCIB0w=
X-Received: by 2002:a05:651c:1254:: with SMTP id
 h20mr43543779ljh.420.1635909522140; 
 Tue, 02 Nov 2021 20:18:42 -0700 (PDT)
MIME-Version: 1.0
References: <20211029183525.1776416-1-eperezma@redhat.com>
 <20211029183525.1776416-22-eperezma@redhat.com>
 <CACGkMEt8fusPLj3=E1GETzotMOhkuTAzD_bON0hQEjNecg2GcQ@mail.gmail.com>
 <CAJaqyWfdZwW82cTXwfdyfcLZUyKyw7R2wcwF2SM0wwTcVmZ_yQ@mail.gmail.com>
In-Reply-To: <CAJaqyWfdZwW82cTXwfdyfcLZUyKyw7R2wcwF2SM0wwTcVmZ_yQ@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 3 Nov 2021 11:18:30 +0800
Message-ID: <CACGkMEvw8-D7VL3P0QJcn3zNFW3St3cEncqFfBW1J+m1b99CAQ@mail.gmail.com>
Subject: Re: [RFC PATCH v5 21/26] vhost: Add vhost_svq_valid_guest_features to
 shadow vq
To: Eugenio Perez Martin <eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Xiao W Wang <xiao.w.wang@intel.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Eric Blake <eblake@redhat.com>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Parav Pandit <parav@mellanox.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 2, 2021 at 4:10 PM Eugenio Perez Martin <eperezma@redhat.com> w=
rote:
>
> On Tue, Nov 2, 2021 at 6:26 AM Jason Wang <jasowang@redhat.com> wrote:
> >
> > On Sat, Oct 30, 2021 at 2:44 AM Eugenio P=C3=A9rez <eperezma@redhat.com=
> wrote:
> > >
> > > This allows it to test if the guest has aknowledge an invalid transpo=
rt
> > > feature for SVQ. This will include packed vq layout or event_idx,
> > > where VirtIO device needs help from SVQ.
> > >
> > > There is not needed at this moment, but since SVQ will not re-negotia=
te
> > > features again with the guest, a failure in acknowledge them is fatal
> > > for SVQ.
> > >
> >
> > It's not clear to me why we need this. Maybe you can give me an
> > example. E.g isn't it sufficient to filter out the device with
> > event_idx?
> >
>
> If the guest did negotiate _F_EVENT_IDX, it expects to be notified
> only when device marks as used a specific number of descriptors.
>
> If we use VirtQueue notification, the VirtQueue code handles it
> transparently. But if we want to be able to change the guest VQ's
> call_fd, we cannot use VirtQueue's, so this needs to be handled by SVQ
> code. And that is still not implemented.
>
> Of course in the event_idx case we could just ignore it and notify in
> all used descriptors, but it seems not polite to me :). I will develop
> event_idx on top of this, either exposing the needed pieces in
> VirtQueue (I prefer this) or rolling our own in SVQ.

Yes, but what I meant is, we can fail the SVQ enabling if the device
supports event_idx. Then we're sure guests won't negotiate event_idx.

Thanks

>
> Same reasoning can be applied to unknown transport features.
>
> Thanks!
>
> > Thanks
> >
> > > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > > ---
> > >  hw/virtio/vhost-shadow-virtqueue.h | 1 +
> > >  hw/virtio/vhost-shadow-virtqueue.c | 6 ++++++
> > >  2 files changed, 7 insertions(+)
> > >
> > > diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-sha=
dow-virtqueue.h
> > > index 946b2c6295..ac55588009 100644
> > > --- a/hw/virtio/vhost-shadow-virtqueue.h
> > > +++ b/hw/virtio/vhost-shadow-virtqueue.h
> > > @@ -16,6 +16,7 @@
> > >  typedef struct VhostShadowVirtqueue VhostShadowVirtqueue;
> > >
> > >  bool vhost_svq_valid_device_features(uint64_t *features);
> > > +bool vhost_svq_valid_guest_features(uint64_t *features);
> > >
> > >  void vhost_svq_set_svq_kick_fd(VhostShadowVirtqueue *svq, int svq_ki=
ck_fd);
> > >  void vhost_svq_set_guest_call_notifier(VhostShadowVirtqueue *svq, in=
t call_fd);
> > > diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-sha=
dow-virtqueue.c
> > > index 6e0508a231..cb9ffcb015 100644
> > > --- a/hw/virtio/vhost-shadow-virtqueue.c
> > > +++ b/hw/virtio/vhost-shadow-virtqueue.c
> > > @@ -62,6 +62,12 @@ bool vhost_svq_valid_device_features(uint64_t *dev=
_features)
> > >      return true;
> > >  }
> > >
> > > +/* If the guest is using some of these, SVQ cannot communicate */
> > > +bool vhost_svq_valid_guest_features(uint64_t *guest_features)
> > > +{
> > > +    return true;
> > > +}
> > > +
> > >  /* Forward guest notifications */
> > >  static void vhost_handle_guest_kick(EventNotifier *n)
> > >  {
> > > --
> > > 2.27.0
> > >
> >
>


