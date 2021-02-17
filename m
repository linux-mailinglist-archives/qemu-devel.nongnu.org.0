Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 042A331DF29
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 19:41:17 +0100 (CET)
Received: from localhost ([::1]:58320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCRlE-0004b1-0r
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 13:41:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1lCRjQ-0003vG-69
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 13:39:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35235)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1lCRjN-00036a-Fb
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 13:39:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613587160;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6kGTupil9aGZipMmb+4/eFhsJJpSyKBS3S0l2iwlN9k=;
 b=XIjyzvdyDzSjwVRlfv6VWvXUxlfRXiRabFC4rjMFp5dOqvLbGb0AMSkn4cAxmVGo/1umAy
 J9htrMaz93EkSYTu+FQPYF3gVXrf3sFWjLLbM0lTUHQ2Ak8dmf2pRYeb+i2Mdn2bsR9Dl/
 sO90JyOGrI+C6CwtBdYdbEpVEggUyKk=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-29-zuVB2W0fMsS53fqnSiGLIQ-1; Wed, 17 Feb 2021 13:39:17 -0500
X-MC-Unique: zuVB2W0fMsS53fqnSiGLIQ-1
Received: by mail-qv1-f70.google.com with SMTP id n8so7560631qvo.18
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 10:39:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6kGTupil9aGZipMmb+4/eFhsJJpSyKBS3S0l2iwlN9k=;
 b=es8d+joyJ3Q1jWRImVIMaBbIAhYllSYYlk/QJ8LEa4tiQ0AHw7jbQ9d6RsXfa5COWM
 pRGe9vQMPdCmTxLnTDMNzE45ZZDSpzrvXKbWBUJMZ2ugwd5ROpNd+mfDNLH/fWMrMUVm
 xjcFqkgL2/pzAbJ762m8I3J1oszlpcLZhm7K6MW328YfbIVZt2Id65uPqCgUTq/XIZcJ
 lZEQ+yXDPLd6ac0ai09Jubkst9VXjDFeiQ7LUR8E1qJfJQwPTFBDULLwgRnyWBoeoIT9
 RbewQJjb4c5Lnhwssj4VQnCz7FItaryIkKprWxpZvY7v08ShcGlxa+OGs5S7EXkW6cR9
 bOkQ==
X-Gm-Message-State: AOAM531IaNPAgl57yyT5xE/iFHzYLt5aLR2x/xW2NyKCHh/5dX7c1lxm
 xVyTKH10so6MCjL2OPwYmAKFFHJ/aTiclBXmo1296SAmlbJvY+RVQWO45aohWmTJBvWBrSPKg13
 m8klBuNBF8yWEqwyR2wVJy8NgkixL3p0=
X-Received: by 2002:ac8:708e:: with SMTP id y14mr595977qto.203.1613587156882; 
 Wed, 17 Feb 2021 10:39:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwFNwyAbDYFB8rSH+a+EYi+8wA4CDyLf1XGhTWaO0om+BFVg/RG/d3t+GxdT95zfVMY4wa7ScbffWyiNT9X0Xo=
X-Received: by 2002:ac8:708e:: with SMTP id y14mr595958qto.203.1613587156721; 
 Wed, 17 Feb 2021 10:39:16 -0800 (PST)
MIME-Version: 1.0
References: <20210209153757.1653598-1-eperezma@redhat.com>
 <20210209153757.1653598-3-eperezma@redhat.com>
 <20210217124134.GD269203@stefanha-x1.localdomain>
In-Reply-To: <20210217124134.GD269203@stefanha-x1.localdomain>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Wed, 17 Feb 2021 19:38:40 +0100
Message-ID: <CAJaqyWcWOnva0DB=tOHwZu_=LmV-z49tNohjHqcNn=1WTQhJ8w@mail.gmail.com>
Subject: Re: [RFC v2 2/7] virtio: Add virtio_queue_host_notifier_status
To: Stefan Hajnoczi <stefanha@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Rob Miller <rob.miller@broadcom.com>, Parav Pandit <parav@mellanox.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-level <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Eli Cohen <eli@mellanox.com>, virtualization@lists.linux-foundation.org,
 Michael Lilja <ml@napatech.com>, Jim Harford <jim.harford@broadcom.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 17, 2021 at 1:41 PM Stefan Hajnoczi <stefanha@redhat.com> wrote=
:
>
> On Tue, Feb 09, 2021 at 04:37:52PM +0100, Eugenio P=C3=A9rez wrote:
> > This allows shadow virtqueue code to assert the queue status before
> > making changes.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >  include/hw/virtio/virtio.h | 1 +
> >  hw/virtio/virtio.c         | 5 +++++
> >  2 files changed, 6 insertions(+)
> >
> > diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
> > index b7ece7a6a8..227cec13a8 100644
> > --- a/include/hw/virtio/virtio.h
> > +++ b/include/hw/virtio/virtio.h
> > @@ -316,6 +316,7 @@ void virtio_device_release_ioeventfd(VirtIODevice *=
vdev);
> >  bool virtio_device_ioeventfd_enabled(VirtIODevice *vdev);
> >  EventNotifier *virtio_queue_get_host_notifier(VirtQueue *vq);
> >  void virtio_queue_set_host_notifier_enabled(VirtQueue *vq, bool enable=
d);
> > +bool virtio_queue_host_notifier_status(const VirtQueue *vq);
> >  void virtio_queue_host_notifier_read(EventNotifier *n);
> >  void virtio_queue_aio_set_host_notifier_handler(VirtQueue *vq, AioCont=
ext *ctx,
> >                                                  VirtIOHandleAIOOutput =
handle_output);
> > diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> > index 1fd1917ca0..53473ae4df 100644
> > --- a/hw/virtio/virtio.c
> > +++ b/hw/virtio/virtio.c
> > @@ -3594,6 +3594,11 @@ EventNotifier *virtio_queue_get_host_notifier(Vi=
rtQueue *vq)
> >      return &vq->host_notifier;
> >  }
> >
> > +bool virtio_queue_host_notifier_status(const VirtQueue *vq)
> > +{
> > +    return vq->host_notifier_enabled;
> > +}
> > +
> >  void virtio_queue_set_host_notifier_enabled(VirtQueue *vq, bool enable=
d)
>
> Since there is a virtio_queue_set_host_notifier_enabled() I suggest
> calling this function virtio_queue_is_host_notifier_enabled() or
> virtio_queue_get_host_notifier_enabled(). That way it's clear they
> set/get the same thing.
>

I agree, will change.

Thanks!

> Stefan


