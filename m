Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F31B5255A0
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 21:21:45 +0200 (CEST)
Received: from localhost ([::1]:47542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npENc-0008GF-1k
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 15:21:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1npD8Y-0004T4-Eq
 for qemu-devel@nongnu.org; Thu, 12 May 2022 14:02:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1npD8W-0002K1-H2
 for qemu-devel@nongnu.org; Thu, 12 May 2022 14:02:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652378520;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rzrR/wu6plV49zoKbir82gDpfEgUGOvh7GFWYsZZEqM=;
 b=HmqbwqdzdZt8SZgwJmFndkGR15IdawnM/un/3pT1NoW0rMZgQ3PmzMYuMKa5qNXt/D22ev
 yuFybBwwnNGsuNNSiqb/ZMQPCQjxVBY6XKSM1DB9SY78P0gn0a4/Of1uABZXQeshkjVVBH
 h1OTh8+3fCy09KT9AK7zQZltK3O3opo=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-519-58PnaeyQPTiuIL0ZfcNOfA-1; Thu, 12 May 2022 14:01:58 -0400
X-MC-Unique: 58PnaeyQPTiuIL0ZfcNOfA-1
Received: by mail-qk1-f198.google.com with SMTP id
 l20-20020a05620a211400b006a0d5b5e51dso4717896qkl.2
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 11:01:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=rzrR/wu6plV49zoKbir82gDpfEgUGOvh7GFWYsZZEqM=;
 b=TiZRKBkB47JXea3EcpJJFNBBVQiRV5rwzxhsUvJFL2OYf3E0GeDG4H9Chmua7wAJUe
 qUIB1+UA7COiJrA+ktdLiSx7bVE17GiaUQq8R4I//8g7g1nfSh010/aSAkVVlA86ew8n
 oD0S8/wDKN5cOikdI/RC/62U6rV6KueOfK8M81LCSGHh/7p7q8rfidOICQ4+19l5KxiK
 J/fpy7n//4D/reYeBAJULqfDHqTK32C6rTFm/BQ7/xHRxqk5W1DqPhF7GH140SWyNNkF
 OZh+KrvSOm0nkixZLmFdFHdXriwbSqx9p37sPJgC8ko6rDD6el4cyaTRKB+jsRW4g03P
 UDXw==
X-Gm-Message-State: AOAM5318W2VOJmk2+7o8zVERsXAIHbYLtdiWBcpV87eWWbYb3G9uxPA3
 ccwbnv/WRLgmsgI7TRxPKMiO5JegBSX+DQTv/k3beaoBcWzI+VhTCN3wkdvDQmJ+7ISc7WiNSjX
 /IXaigl0DRM/G2LZnlPq+i9KSYE/KtLA=
X-Received: by 2002:a05:6214:b8e:b0:456:3674:ca6 with SMTP id
 fe14-20020a0562140b8e00b0045636740ca6mr1185043qvb.40.1652378517912; 
 Thu, 12 May 2022 11:01:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwPDgtt7CVnYZ1nYnuEbARmLjjZKO6ufTHrfLocpq9ggRbb6VKGUYL3hsE2BUQDfBrrZUX3ec7EDLAaNSyXVuw=
X-Received: by 2002:a05:6214:b8e:b0:456:3674:ca6 with SMTP id
 fe14-20020a0562140b8e00b0045636740ca6mr1185005qvb.40.1652378517479; Thu, 12
 May 2022 11:01:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220315061420.31910-1-jasowang@redhat.com>
 <20220315061420.31910-9-jasowang@redhat.com>
 <CAFEAcA_p4KWptkQ4xUXmtUkmYufn72KLr=1B_9q1QZ3FLJBkPw@mail.gmail.com>
In-Reply-To: <CAFEAcA_p4KWptkQ4xUXmtUkmYufn72KLr=1B_9q1QZ3FLJBkPw@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Thu, 12 May 2022 20:01:21 +0200
Message-ID: <CAJaqyWfyxokmC4Szy0TqTqAO58+qPB3yPktxSVX06zVNZACrqw@mail.gmail.com>
Subject: Re: [PULL V3 08/15] vhost: Shadow virtqueue buffers forwarding
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Jason Wang <jasowang@redhat.com>, qemu-level <qemu-devel@nongnu.org>, 
 "Michael S . Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Thu, May 12, 2022 at 5:48 PM Peter Maydell <peter.maydell@linaro.org> wr=
ote:
>
> On Tue, 15 Mar 2022 at 06:14, Jason Wang <jasowang@redhat.com> wrote:
> >
> > From: Eugenio P=C3=A9rez <eperezma@redhat.com>
> >
> > Initial version of shadow virtqueue that actually forward buffers. Ther=
e
> > is no iommu support at the moment, and that will be addressed in future
> > patches of this series. Since all vhost-vdpa devices use forced IOMMU,
> > this means that SVQ is not usable at this point of the series on any
> > device.
> >
> > For simplicity it only supports modern devices, that expects vring
> > in little endian, with split ring and no event idx or indirect
> > descriptors. Support for them will not be added in this series.
> >
> > It reuses the VirtQueue code for the device part. The driver part is
> > based on Linux's virtio_ring driver, but with stripped functionality
> > and optimizations so it's easier to review.
> >
> > However, forwarding buffers have some particular pieces: One of the mos=
t
> > unexpected ones is that a guest's buffer can expand through more than
> > one descriptor in SVQ. While this is handled gracefully by qemu's
> > emulated virtio devices, it may cause unexpected SVQ queue full. This
> > patch also solves it by checking for this condition at both guest's
> > kicks and device's calls. The code may be more elegant in the future if
> > SVQ code runs in its own iocontext.
>
> Hi; Coverity thinks there's a memory leak in an error handling
> path in this code (CID 1487559):
>
> > +/**
> > + * Forward available buffers.
> > + *
> > + * @svq: Shadow VirtQueue
> > + *
> > + * Note that this function does not guarantee that all guest's availab=
le
> > + * buffers are available to the device in SVQ avail ring. The guest ma=
y have
> > + * exposed a GPA / GIOVA contiguous buffer, but it may not be contiguo=
us in
> > + * qemu vaddr.
> > + *
> > + * If that happens, guest's kick notifications will be disabled until =
the
> > + * device uses some buffers.
> > + */
> > +static void vhost_handle_guest_kick(VhostShadowVirtqueue *svq)
> > +{
> > +    /* Clear event notifier */
> > +    event_notifier_test_and_clear(&svq->svq_kick);
> > +
> > +    /* Forward to the device as many available buffers as possible */
> > +    do {
> > +        virtio_queue_set_notification(svq->vq, false);
> > +
> > +        while (true) {
> > +            VirtQueueElement *elem;
> > +            bool ok;
> > +
> > +            if (svq->next_guest_avail_elem) {
> > +                elem =3D g_steal_pointer(&svq->next_guest_avail_elem);
> > +            } else {
> > +                elem =3D virtqueue_pop(svq->vq, sizeof(*elem));
> > +            }
>
> Here virtqueue_pop() returns allocated memory...
>
> > +
> > +            if (!elem) {
> > +                break;
> > +            }
> > +
> > +            if (elem->out_num + elem->in_num > vhost_svq_available_slo=
ts(svq)) {
> > +                /*
> > +                 * This condition is possible since a contiguous buffe=
r in GPA
> > +                 * does not imply a contiguous buffer in qemu's VA
> > +                 * scatter-gather segments. If that happens, the buffe=
r exposed
> > +                 * to the device needs to be a chain of descriptors at=
 this
> > +                 * moment.
> > +                 *
> > +                 * SVQ cannot hold more available buffers if we are he=
re:
> > +                 * queue the current guest descriptor and ignore furth=
er kicks
> > +                 * until some elements are used.
> > +                 */
> > +                svq->next_guest_avail_elem =3D elem;
> > +                return;
> > +            }
> > +
> > +            ok =3D vhost_svq_add(svq, elem);
> > +            if (unlikely(!ok)) {
> > +                /* VQ is broken, just return and ignore any other kick=
s */
> > +                return;
>
> ...but in this error return path we have neither put elem
> anywhere, nor freed it, so the memory is leaked.
>
> > +            }
> > +            vhost_svq_kick(svq);
> > +        }
> > +
> > +        virtio_queue_set_notification(svq->vq, true);
> > +    } while (!virtio_queue_empty(svq->vq));
> > +}
>

Thank you very much for the analysis. There is no way to enable SVQ at
this moment, so we cannot trigger the leak in master. Should we
backport the fix to stable?

Sending patches for this and other bugs detected while working on the
next iteration of SVQ.

Thanks!

> thanks
> -- PMM
>


