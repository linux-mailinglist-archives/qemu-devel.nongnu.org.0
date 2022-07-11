Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B8656FC9B
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 11:45:41 +0200 (CEST)
Received: from localhost ([::1]:49954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oApz2-0003Bl-Dh
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 05:45:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oApxI-00014E-CW
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 05:43:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30188)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oApxG-0006WA-0z
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 05:43:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657532628;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+kdMNPlV8kbpPKRg99v/u4jcB0CoXAgVxYCkNEpP1HY=;
 b=A5G0oab9cZ4iS+jPuonUudHFB1rTIU4LnPT4Mll/GwVQoqqAcmS9pkUhu76vNrK4WxtzF1
 jxar9E2Q/+Po74YOEquV4395KoR1j68pdc74yg2ri9E7uLZQOi+ynQjx6cgKBENvitdig9
 20n2wnndYg+gaxQynmDRy0LXLEfo1xs=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-590-MJvWVS6gPku4i2SU5jSF9g-1; Mon, 11 Jul 2022 05:43:47 -0400
X-MC-Unique: MJvWVS6gPku4i2SU5jSF9g-1
Received: by mail-qv1-f72.google.com with SMTP id
 eb3-20020ad44e43000000b00472e7d52ce6so486qvb.17
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 02:43:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+kdMNPlV8kbpPKRg99v/u4jcB0CoXAgVxYCkNEpP1HY=;
 b=qonBXMIXtHo8UL4O0zPIEKtLL/PPR1z2o5QxwS5RHZb9/GUtOKdS4MbOjSt+ZWcYcN
 1e9dWp5rPHfW7HiMZJ4tMDIEUzq0qXJPLFGCcmPzdo7LPVg5++PCUW+xtNpxNdftBehw
 gCh5fZnZKM0T9r3XQOPuRzroWZt4oT0lpmY5txB4L/U5aue80w0vWlhCPBI8+Zmo979R
 wo5FlDrofXpF7WsPYKVdef/TRuc6BHcWfdAqJuU5gFdM8FN8856g3Rsq6JuiegRhLacA
 q+MiwmCpXTwPxT13gHqQ9nanh49AcCTcoyqgg/aHOJYpTJalJb4s75h8uEYPGj3DU9I5
 PW9A==
X-Gm-Message-State: AJIora8jTwfzPTqGziClwPyPyzURUNWaULQUrHTLMHfgeAGpRXcdKLeY
 cVWL1IIJ9wkG8y4pKCGdFBHaJAp8fzSVnoNIh4iJhBN2IVR5d9CEAxxr6fmv9q4fY8J5Th2N+Xw
 gOQRrrL0XQWsYmTroiUM9ewjJw28RpP8=
X-Received: by 2002:ac8:5b51:0:b0:317:3513:cf60 with SMTP id
 n17-20020ac85b51000000b003173513cf60mr13175700qtw.495.1657532627040; 
 Mon, 11 Jul 2022 02:43:47 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tzvgFkL0eepuHLdKLYO518EI4KTSOADtLtwC4heYwfHMdTyxZI7PWqn2mXUYM89K5u4l8Xw3EIkpLI0Q2B1wE=
X-Received: by 2002:ac8:5b51:0:b0:317:3513:cf60 with SMTP id
 n17-20020ac85b51000000b003173513cf60mr13175674qtw.495.1657532626801; Mon, 11
 Jul 2022 02:43:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220706184008.1649478-1-eperezma@redhat.com>
 <20220706184008.1649478-14-eperezma@redhat.com>
 <5f1c6d8f-5d3f-8e13-05d5-3afed733626f@redhat.com>
In-Reply-To: <5f1c6d8f-5d3f-8e13-05d5-3afed733626f@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 11 Jul 2022 11:43:10 +0200
Message-ID: <CAJaqyWcnuM3n4Zpu48MZS9YqP_Czg4i-eq=pKtZcjQMvdHen8Q@mail.gmail.com>
Subject: Re: [RFC PATCH v9 13/23] vhost: Add vhost_svq_inject
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-level <qemu-devel@nongnu.org>, Liuxiangdong <liuxiangdong5@huawei.com>,
 Markus Armbruster <armbru@redhat.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 Eric Blake <eblake@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>, 
 Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Gautam Dawar <gdawar@xilinx.com>, Eli Cohen <eli@mellanox.com>, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Cindy Lu <lulu@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 11, 2022 at 11:14 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2022/7/7 02:39, Eugenio P=C3=A9rez =E5=86=99=E9=81=93:
> > This allows qemu to inject buffers to the device.
>
>
> Not a native speaker but we probably need a better terminology than
> inject here.
>
> Since the CVQ is totally under the control of the Qemu anyhow.
>

I'm totally fine to change terminology

>
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >   hw/virtio/vhost-shadow-virtqueue.h |  2 ++
> >   hw/virtio/vhost-shadow-virtqueue.c | 34 +++++++++++++++++++++++++++++=
+
> >   2 files changed, 36 insertions(+)
> >
> > diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shado=
w-virtqueue.h
> > index a811f90e01..d01d2370db 100644
> > --- a/hw/virtio/vhost-shadow-virtqueue.h
> > +++ b/hw/virtio/vhost-shadow-virtqueue.h
> > @@ -98,6 +98,8 @@ bool vhost_svq_valid_features(uint64_t features, Erro=
r **errp);
> >
> >   void vhost_svq_push_elem(VhostShadowVirtqueue *svq,
> >                            const VirtQueueElement *elem, uint32_t len);
> > +int vhost_svq_inject(VhostShadowVirtqueue *svq, const struct iovec *io=
v,
> > +                     size_t out_num, size_t in_num, void *opaque);
> >   void vhost_svq_set_svq_kick_fd(VhostShadowVirtqueue *svq, int svq_kic=
k_fd);
> >   void vhost_svq_set_svq_call_fd(VhostShadowVirtqueue *svq, int call_fd=
);
> >   void vhost_svq_get_vring_addr(const VhostShadowVirtqueue *svq,
> > diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shado=
w-virtqueue.c
> > index 492bb12b5f..bd9e34b413 100644
> > --- a/hw/virtio/vhost-shadow-virtqueue.c
> > +++ b/hw/virtio/vhost-shadow-virtqueue.c
> > @@ -283,6 +283,40 @@ static bool vhost_svq_add_element(VhostShadowVirtq=
ueue *svq,
> >       return ok;
> >   }
> >
> > +/**
> > + * Inject a chain of buffers to the device
> > + *
> > + * @svq: Shadow VirtQueue
> > + * @iov: I/O vector
> > + * @out_num: Number of front out descriptors
> > + * @in_num: Number of last input descriptors
> > + * @opaque: Contextual data to store in descriptor
> > + *
> > + * Return 0 on success, -ENOMEM if cannot inject
> > + */
> > +int vhost_svq_inject(VhostShadowVirtqueue *svq, const struct iovec *io=
v,
> > +                     size_t out_num, size_t in_num, void *opaque)
>
>
> If we manage to embed opaque into VirtqueueElement, we can simply use
> vhost_svq_add() here.
>

That works fine as long as SVQ only forwards elements, but it needs to
do more than that: We need to inject new elements without guest
notice.

How could we track elements that do not have corresponding
VirtQueueElement, like the elements sent to restore the status at the
LM destination?

I'll try to make it clearer in the patch message.

Thanks!

> Thanks
>
>
> > +{
> > +    bool ok;
> > +
> > +    /*
> > +     * All vhost_svq_inject calls are controlled by qemu so we won't h=
it this
> > +     * assertions.
> > +     */
> > +    assert(out_num || in_num);
> > +    assert(svq->ops);
> > +
> > +    if (unlikely(svq->next_guest_avail_elem)) {
> > +        error_report("Injecting in a full queue");
> > +        return -ENOMEM;
> > +    }
> > +
> > +    ok =3D vhost_svq_add(svq, iov, out_num, iov + out_num, in_num, opa=
que);
> > +    assert(ok);
> > +    vhost_svq_kick(svq);
> > +    return 0;
> > +}
> > +
> >   /**
> >    * Forward available buffers.
> >    *
>


