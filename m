Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D482D31DF74
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 20:16:58 +0100 (CET)
Received: from localhost ([::1]:39118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCSJl-0006ED-Ez
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 14:16:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1lCSGe-0004yc-F2
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 14:13:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1lCSGc-0004cr-2o
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 14:13:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613589221;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OK0ddR0JOF5OxMCP1GWajWcY9Xof0dflqFJcbfo4jIs=;
 b=MxcvsJ0QdU3T9u8MhfojiOg1zoQ7u88wKJ6/Bhhwl+QAJQykmknv8rwIl/ZXX3RL10AAJi
 ujRLwlKkd0ChlsD7CvxldLCUULwWpo9/Mxmmr3dbUfLIuAmUuFpDlmBQlj8anPXv2XSMlz
 2tsGodywob5y6g1Wcvj3+meQIST/7Sc=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-523-Dol9gsThNnau-wr_fguSUg-1; Wed, 17 Feb 2021 14:13:39 -0500
X-MC-Unique: Dol9gsThNnau-wr_fguSUg-1
Received: by mail-qv1-f72.google.com with SMTP id u8so10642805qvm.5
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 11:13:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=OK0ddR0JOF5OxMCP1GWajWcY9Xof0dflqFJcbfo4jIs=;
 b=TvwDQe8l621q+kkGEan5914q4VphUg/QBQzMcU2m8iFVL2cV57LSNZ3PheKzUnD+Rd
 /uOutaRxxmBzflW5Drh8D6xZLTlFtNiZXEqcIiC21hVsstbSi078GKlXfArmvK/+e5PD
 OKWTRmyZdnaF3tPA+p2JYjEgwcr1VhAs0c+s8WdYVUSSjF+be+Zg9jhOr9aCNl4tJ3I3
 rzqobTy5EmM1q9hwhsi/oUbJVcKXlc5J2u2+7kxDtEWlPQBni+nyNw9KBUqPoDfS1Esd
 EvFJHxcIhnqs3DSv0qmMPVRpbZ24sUGV3s7ufjCaxgWGflajv7zeN7/e+karSVGNsOk3
 e+ng==
X-Gm-Message-State: AOAM532e2L3TUE6RWo1a12WOyIaEF0KK25NqeXlGkHgDwErWltbZKW6X
 D6ap0GoYiCtqIKDc6yOL+9OOFponRpo1HIjqLi3v0YHhUFyS0pk/pKzHOlMN7f0n4E03cQxoMpg
 gkBN+0SBXRNy+pgTiJSYgn4b7knfDOJQ=
X-Received: by 2002:ac8:5c49:: with SMTP id j9mr733706qtj.221.1613589219083;
 Wed, 17 Feb 2021 11:13:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx88iD7LOVZ5cl066nbpGbuPo4M+2igtAVhKSWV3gPVmyDPqRdW9mwNY04WviyokR4XwRf7CDP+e7GTRFoNd80=
X-Received: by 2002:ac8:5c49:: with SMTP id j9mr733678qtj.221.1613589218842;
 Wed, 17 Feb 2021 11:13:38 -0800 (PST)
MIME-Version: 1.0
References: <20210209153757.1653598-1-eperezma@redhat.com>
 <20210209153757.1653598-8-eperezma@redhat.com>
 <20210217172401.GI269203@stefanha-x1.localdomain>
In-Reply-To: <20210217172401.GI269203@stefanha-x1.localdomain>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Wed, 17 Feb 2021 20:13:02 +0100
Message-ID: <CAJaqyWes0g2VkkpvXGVqMqpSmk2C=iTRVWyJCpHdAy_dmCe9ng@mail.gmail.com>
Subject: Re: [RFC v2 7/7] vhost: Route host->guest notification through shadow
 virtqueue
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

On Wed, Feb 17, 2021 at 6:24 PM Stefan Hajnoczi <stefanha@redhat.com> wrote=
:
>
> On Tue, Feb 09, 2021 at 04:37:57PM +0100, Eugenio P=C3=A9rez wrote:
> > @@ -40,6 +42,26 @@ static void vhost_handle_guest_kick(EventNotifier *n=
)
> >      }
> >  }
> >
> > +/* Forward vhost notifications */
> > +static void vhost_handle_call(EventNotifier *n)
>
> The name vhost_shadow_vq_handle_call() expresses the purpose of the
> function more clearly.
>

I will rename it.

> > @@ -75,8 +102,19 @@ bool vhost_shadow_vq_start_rcu(struct vhost_dev *de=
v,
> >      /* Check for pending notifications from the guest */
> >      vhost_handle_guest_kick(&svq->host_notifier);
> >
> > +    r =3D dev->vhost_ops->vhost_set_vring_call(dev, &call_file);
> > +    if (r !=3D 0) {
> > +        error_report("Couldn't set call fd: %s", strerror(errno));
> > +        goto err_set_vring_call;
> > +    }
>
> This ignores notifier_is_masked and always unmasks.

Right, I will check for it too.

>
> > @@ -1608,6 +1607,10 @@ void vhost_virtqueue_mask(struct vhost_dev *hdev=
, VirtIODevice *vdev, int n,
> >      if (mask) {
> >          assert(vdev->use_guest_notifier_mask);
> >          file.fd =3D event_notifier_get_fd(&hdev->vqs[index].masked_not=
ifier);
> > +    } else if (hdev->sw_lm_enabled) {
> > +        VhostShadowVirtqueue *svq =3D hdev->shadow_vqs[n];
> > +        EventNotifier *e =3D vhost_shadow_vq_get_call_notifier(svq);
> > +        file.fd =3D event_notifier_get_fd(e);
> >      } else {
> >          file.fd =3D event_notifier_get_fd(virtio_queue_get_guest_notif=
ier(vvq));
> >      }
>
> Maybe you can extend this function so it can be called unconditionally
> from both vhost_shadow_vq_start_rcu() and vhost_shadow_vq_stop_rcu(). It
> would be a single place that invokes vhost_set_vring_call().

Your proposal is better, but I'm not sure if something depends on
calling mask(..., false) repeatedly. For example, if guest_notifier
changes.

However, from SVQ point of view we are only interested in avoiding to
set masked notifiers over a vhost already masked: unmasked state will
always incur on a file descriptor change. So I think it should be fine
if we allow unmasking, In other words, allow calling
vhost_set_vring_call(guest_notifier()) repeatedly, so old behavior is
preserved, and only omit the mask(..., true) if the notifier is
already masked, so we can call it unconditionally on
vhost_shadow_vq_start/stop.

Thanks!


