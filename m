Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 531B244291D
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 09:11:06 +0100 (CET)
Received: from localhost ([::1]:37456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhosr-0002Ok-0p
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 04:11:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mhos1-0001f2-Lh
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 04:10:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42212)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mhorz-0001g5-1l
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 04:10:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635840609;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F90+LzrKnwtYknm8CVjHSygEfVB6cdvAN6+/RjJIcMA=;
 b=UiGPh1ic7dBcYlBJF0k90S3Ue1fWiCP5RNgQ1bCD612ZMqeUxo1/bCSX27xSmC7qtq81NV
 zUhlCETj3hR0TJwit3v3qwa/VyXEOEl2RmETWBSamXgRLIEies0Xku1z3NAp3Rh6Ib5dvI
 68+Hd0Lgi/EeG+x6tg5PTjVVthFGwoQ=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-447-WGFepVbbOBGYsQlN3OAe5w-1; Tue, 02 Nov 2021 04:10:08 -0400
X-MC-Unique: WGFepVbbOBGYsQlN3OAe5w-1
Received: by mail-qv1-f71.google.com with SMTP id
 o3-20020a0562140e4300b0039a8ccca8efso11507081qvc.7
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 01:10:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=F90+LzrKnwtYknm8CVjHSygEfVB6cdvAN6+/RjJIcMA=;
 b=V06uqAJFFegLBQd9IIeLqeI4Qe7WhL0xZAeP8UVILhaM8Xs7ZKWR9YvQAFWyxjmLRr
 7BwUGgcUGvF3WNkrmXSmfAFIpn0OqYLsGCe87s/cHjVFTXTSS5HBH5QJSTfSNUKQih95
 +phBYBtAtv/KEcZn6eLbKmAYXIjIQgxmLywtSWFZSMuXiKeWjVYxzygtxXRECMPKJa3J
 7X+D38SaiRqmmtCFmgrCgQLmG59I/0GwB+XwKF76Qhdc0nOeHAHgeEoJ/dEB0d1DsYAi
 e3xkjqKjZI0V0iCJYHGDY5TX/Bm0dJK3BOn1mL0SVaEKcNwPO76eiPQJ+Ujh9uzQUqDY
 QBaA==
X-Gm-Message-State: AOAM530fzg4V10ebwaJ+gyG6sp+wRvpx3J45M3kKhLUqOe/MU3fxk3t2
 FDwvIX+KX5oe5wjUr4trHc+rhXXynqtS0bJfxegFEMsJIfqbBvv7vWZ66YzghOA/bAZOEedNaaA
 jIVEmXcl2buvbUxcCnS4be5EIy4tv2Dw=
X-Received: by 2002:a05:622a:1194:: with SMTP id
 m20mr36478895qtk.175.1635840608041; 
 Tue, 02 Nov 2021 01:10:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzemLfp9bh+GhuMPsF9lfW2FkVPkmn2oy0RvHjCEhOhGVnKZw1YZTWcZrgESw/n0xgkhOi5sDgM0DawDZfJjNE=
X-Received: by 2002:a05:622a:1194:: with SMTP id
 m20mr36478869qtk.175.1635840607843; 
 Tue, 02 Nov 2021 01:10:07 -0700 (PDT)
MIME-Version: 1.0
References: <20211029183525.1776416-1-eperezma@redhat.com>
 <20211029183525.1776416-22-eperezma@redhat.com>
 <CACGkMEt8fusPLj3=E1GETzotMOhkuTAzD_bON0hQEjNecg2GcQ@mail.gmail.com>
In-Reply-To: <CACGkMEt8fusPLj3=E1GETzotMOhkuTAzD_bON0hQEjNecg2GcQ@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 2 Nov 2021 09:09:31 +0100
Message-ID: <CAJaqyWfdZwW82cTXwfdyfcLZUyKyw7R2wcwF2SM0wwTcVmZ_yQ@mail.gmail.com>
Subject: Re: [RFC PATCH v5 21/26] vhost: Add vhost_svq_valid_guest_features to
 shadow vq
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
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

On Tue, Nov 2, 2021 at 6:26 AM Jason Wang <jasowang@redhat.com> wrote:
>
> On Sat, Oct 30, 2021 at 2:44 AM Eugenio P=C3=A9rez <eperezma@redhat.com> =
wrote:
> >
> > This allows it to test if the guest has aknowledge an invalid transport
> > feature for SVQ. This will include packed vq layout or event_idx,
> > where VirtIO device needs help from SVQ.
> >
> > There is not needed at this moment, but since SVQ will not re-negotiate
> > features again with the guest, a failure in acknowledge them is fatal
> > for SVQ.
> >
>
> It's not clear to me why we need this. Maybe you can give me an
> example. E.g isn't it sufficient to filter out the device with
> event_idx?
>

If the guest did negotiate _F_EVENT_IDX, it expects to be notified
only when device marks as used a specific number of descriptors.

If we use VirtQueue notification, the VirtQueue code handles it
transparently. But if we want to be able to change the guest VQ's
call_fd, we cannot use VirtQueue's, so this needs to be handled by SVQ
code. And that is still not implemented.

Of course in the event_idx case we could just ignore it and notify in
all used descriptors, but it seems not polite to me :). I will develop
event_idx on top of this, either exposing the needed pieces in
VirtQueue (I prefer this) or rolling our own in SVQ.

Same reasoning can be applied to unknown transport features.

Thanks!

> Thanks
>
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >  hw/virtio/vhost-shadow-virtqueue.h | 1 +
> >  hw/virtio/vhost-shadow-virtqueue.c | 6 ++++++
> >  2 files changed, 7 insertions(+)
> >
> > diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shado=
w-virtqueue.h
> > index 946b2c6295..ac55588009 100644
> > --- a/hw/virtio/vhost-shadow-virtqueue.h
> > +++ b/hw/virtio/vhost-shadow-virtqueue.h
> > @@ -16,6 +16,7 @@
> >  typedef struct VhostShadowVirtqueue VhostShadowVirtqueue;
> >
> >  bool vhost_svq_valid_device_features(uint64_t *features);
> > +bool vhost_svq_valid_guest_features(uint64_t *features);
> >
> >  void vhost_svq_set_svq_kick_fd(VhostShadowVirtqueue *svq, int svq_kick=
_fd);
> >  void vhost_svq_set_guest_call_notifier(VhostShadowVirtqueue *svq, int =
call_fd);
> > diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shado=
w-virtqueue.c
> > index 6e0508a231..cb9ffcb015 100644
> > --- a/hw/virtio/vhost-shadow-virtqueue.c
> > +++ b/hw/virtio/vhost-shadow-virtqueue.c
> > @@ -62,6 +62,12 @@ bool vhost_svq_valid_device_features(uint64_t *dev_f=
eatures)
> >      return true;
> >  }
> >
> > +/* If the guest is using some of these, SVQ cannot communicate */
> > +bool vhost_svq_valid_guest_features(uint64_t *guest_features)
> > +{
> > +    return true;
> > +}
> > +
> >  /* Forward guest notifications */
> >  static void vhost_handle_guest_kick(EventNotifier *n)
> >  {
> > --
> > 2.27.0
> >
>


