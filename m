Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA3C5765A7
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jul 2022 19:08:09 +0200 (CEST)
Received: from localhost ([::1]:59894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCOnR-0006sO-54
	for lists+qemu-devel@lfdr.de; Fri, 15 Jul 2022 13:08:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oCOlV-0004wj-Hs
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 13:06:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oCOlR-00042k-I3
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 13:06:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657904765;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YlW1lJLkozz65K47TcINKaBcwQdKNuoQ/8idqGZvLA0=;
 b=YQKEQBhIeN/gN5c/Js5TdTTQFKCDT461+1hM8FcHIbQFY6O0DJ/jtF9US8qHcapbpNTlhH
 IeBu7UldtRjL9w1tQCE5UUkKfNw+KC9d21SscKLW+MS3roZHAq9rhPS0jDVxZoOeKpWxBi
 NUg/SlA2Ei9rR9b8gTNHR9+2fSWFwUE=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-655-EceaeGq1MV2WuHP6BfRTHg-1; Fri, 15 Jul 2022 13:06:01 -0400
X-MC-Unique: EceaeGq1MV2WuHP6BfRTHg-1
Received: by mail-qv1-f69.google.com with SMTP id
 ld6-20020a056214418600b00472ffe4640eso3361184qvb.13
 for <qemu-devel@nongnu.org>; Fri, 15 Jul 2022 10:06:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YlW1lJLkozz65K47TcINKaBcwQdKNuoQ/8idqGZvLA0=;
 b=HQCgRAByn7dMp8z4tdaxeF4Ym3P5SqjNBuyPQ8muPUDhHf+YtmM3IUZtNfQ/bz0uV6
 hm5gDLMvcDUUmDa7nXwbcHbkE849CPhVjq7lMroB8oJnRqI1z18OuCCVTRm9GXgyeWaM
 6GJ4yKcoZBP8z7RJeF7RIOAgoUv0cBVmry5CH2+RlEJJ063Jd6hJQEvVkeoNgAfFhLiC
 ahQ0tESr5Wm3XWgd1Kwh0rs4QqFpdv7IYBMYwZWf8uV8zkMZRb6ao8LoauaVAAYy49/o
 why0FsTJKDx8cMM0YjjWhovmRnve76glIY3g29TnbiqAQlQD7R99cFNy6A4mvyuSmfqo
 wZ0A==
X-Gm-Message-State: AJIora+O0+WTeKHeHlSpy197g5CB0XHrmjHCkkfdluDl5G7+EByrXoli
 K+MPLpofxib26ThrUxSgYTeGzbxUQS2DscO2efC0u7iEV9KF7WfA3LUYyVBMcuKjhmCS5fhQwB1
 WG+nBkozr8H/teG4S/tIjU7/PjQmQEf4=
X-Received: by 2002:a05:620a:2a13:b0:6b5:c197:d565 with SMTP id
 o19-20020a05620a2a1300b006b5c197d565mr6452806qkp.255.1657904760852; 
 Fri, 15 Jul 2022 10:06:00 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s6PMyrNX0ILWCJdr77oHX/PAjlMJ3uhDREPVgbcmOVYH23jIL9YL1vF4fwIhNfFfUwjBURW4Pta++XM4Sfr98=
X-Received: by 2002:a05:620a:2a13:b0:6b5:c197:d565 with SMTP id
 o19-20020a05620a2a1300b006b5c197d565mr6452779qkp.255.1657904760479; Fri, 15
 Jul 2022 10:06:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220714163150.2536327-1-eperezma@redhat.com>
 <20220714163150.2536327-13-eperezma@redhat.com>
 <CACGkMEuHR_R6Jxjvznv1T-d6SGngsYQyfhCNw8-HoTb3FLcX0w@mail.gmail.com>
 <CAJaqyWfwODXUr_z3Qzp7_MSbEamG0W8MxUtxn1kV-NE_qfBi-A@mail.gmail.com>
 <CACGkMEvfPDMK+7jg+r5hunxA+EXuN9V_d_KZfkCfufe-ONbXFQ@mail.gmail.com>
In-Reply-To: <CACGkMEvfPDMK+7jg+r5hunxA+EXuN9V_d_KZfkCfufe-ONbXFQ@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Fri, 15 Jul 2022 19:05:24 +0200
Message-ID: <CAJaqyWdf-VQxP4rYasSzdq3yaYLPw1_G6J=Kqq5SXXWEDYpKCA@mail.gmail.com>
Subject: Re: [PATCH v2 12/19] vhost: add vhost_svq_poll
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Gautam Dawar <gdawar@xilinx.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Eric Blake <eblake@redhat.com>, 
 Zhu Lingshan <lingshan.zhu@intel.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Parav Pandit <parav@mellanox.com>, 
 Laurent Vivier <lvivier@redhat.com>, Liuxiangdong <liuxiangdong5@huawei.com>, 
 Eli Cohen <eli@mellanox.com>, Cindy Lu <lulu@redhat.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>
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

On Fri, Jul 15, 2022 at 10:48 AM Jason Wang <jasowang@redhat.com> wrote:
>
> On Fri, Jul 15, 2022 at 1:39 PM Eugenio Perez Martin
> <eperezma@redhat.com> wrote:
> >
> > On Fri, Jul 15, 2022 at 5:59 AM Jason Wang <jasowang@redhat.com> wrote:
> > >
> > > On Fri, Jul 15, 2022 at 12:32 AM Eugenio P=C3=A9rez <eperezma@redhat.=
com> wrote:
> > > >
> > > > It allows the Shadow Control VirtQueue to wait for the device to us=
e the
> > > > available buffers.
> > > >
> > > > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > > > ---
> > > >  hw/virtio/vhost-shadow-virtqueue.h |  1 +
> > > >  hw/virtio/vhost-shadow-virtqueue.c | 22 ++++++++++++++++++++++
> > > >  2 files changed, 23 insertions(+)
> > > >
> > > > diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-s=
hadow-virtqueue.h
> > > > index 1692541cbb..b5c6e3b3b4 100644
> > > > --- a/hw/virtio/vhost-shadow-virtqueue.h
> > > > +++ b/hw/virtio/vhost-shadow-virtqueue.h
> > > > @@ -89,6 +89,7 @@ void vhost_svq_push_elem(VhostShadowVirtqueue *sv=
q, const SVQElement *elem,
> > > >  int vhost_svq_add(VhostShadowVirtqueue *svq, const struct iovec *o=
ut_sg,
> > > >                    size_t out_num, const struct iovec *in_sg, size_=
t in_num,
> > > >                    SVQElement *elem);
> > > > +size_t vhost_svq_poll(VhostShadowVirtqueue *svq);
> > > >
> > > >  void vhost_svq_set_svq_kick_fd(VhostShadowVirtqueue *svq, int svq_=
kick_fd);
> > > >  void vhost_svq_set_svq_call_fd(VhostShadowVirtqueue *svq, int call=
_fd);
> > > > diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-s=
hadow-virtqueue.c
> > > > index 5244896358..31a267f721 100644
> > > > --- a/hw/virtio/vhost-shadow-virtqueue.c
> > > > +++ b/hw/virtio/vhost-shadow-virtqueue.c
> > > > @@ -486,6 +486,28 @@ static void vhost_svq_flush(VhostShadowVirtque=
ue *svq,
> > > >      } while (!vhost_svq_enable_notification(svq));
> > > >  }
> > > >
> > > > +/**
> > > > + * Poll the SVQ for one device used buffer.
> > > > + *
> > > > + * This function race with main event loop SVQ polling, so extra
> > > > + * synchronization is needed.
> > > > + *
> > > > + * Return the length written by the device.
> > > > + */
> > > > +size_t vhost_svq_poll(VhostShadowVirtqueue *svq)
> > > > +{
> > > > +    do {
> > > > +        uint32_t len;
> > > > +        SVQElement *elem =3D vhost_svq_get_buf(svq, &len);
> > > > +        if (elem) {
> > > > +            return len;
> > > > +        }
> > > > +
> > > > +        /* Make sure we read new used_idx */
> > > > +        smp_rmb();
> > >
> > > There's already one smp_rmb(0 in vhost_svq_get_buf(). So this seems u=
seless?
> > >
> >
> > That rmb is after checking for new entries with (vq->last_used_idx !=3D
> > svq->shadow_used_idx) , to avoid reordering used_idx read with the
> > actual used entry. So my understanding is
> > that the compiler is free to skip that check within the while loop.
>
> What do you mean by "that check" here?
>

The first check of (presumably cached) last_used_idx !=3D
shadow_used_idx. Right before the SVQ's vring fetch of
svq->vring.used->idx.

> >
> > Maybe the right solution is to add it in vhost_svq_more_used after the
> > condition (vq->last_used_idx !=3D svq->shadow_used_idx) is false?
>
> I'm not sure I get the goal of the smp_rmb() here. What barrier does it p=
air?
>

It pairs with the actual device memory write.

Note that I'm worried about compiler optimizations or reordering
causing an infinite loop, not that the memory is updated properly.

Let's say we just returned from vhost_svq_add, and avail_idx -
used_idx > 0. The device still did not update SVQ vring used idx, and
qemu is very fast so it completes a full call of vhost_svq_get_buf
before the device is able to increment the used index. We can trace
the full vhost_svq_get_buf without a memory barrier.

If the compiler inlines enough and we delete the new smp_rmb barrier,
this is what it sees:

size_t vhost_svq_poll(VhostShadowVirtqueue *svq)
{
    do {
        more_used =3D false
        // The next conditional returns false
        if (svq->last_used_idx !=3D svq->shadow_used_idx) {
            goto useful;
        }

        svq->shadow_used_idx =3D cpu_to_le16(svq->vring.used->idx);

        // next conditional returns false too
        if (!(svq->last_used_idx !=3D svq->shadow_used_idx))
            continue;

useful:
        // actual code to handle new used buffer
        break;
        }
    }
}

And qemu does not need to read again none of the variables since
nothing modifies them within the loop before "useful" tag
(svq->vring.used->idx, svq->last_used_idx, svq->shadow_used_idx). So
it could freely rewrite as:

size_t vhost_svq_poll(VhostShadowVirtqueue *svq) {
    if (svq->last_used_idx =3D=3D svq->shadow_used_idx &&
        svq->last_used_idx =3D=3D svq->vring.used->idx) {
            for (;;);
    }
}

That's why I think the right place for the mb is right after caller
code see (potentially cached) last_used_idx =3D=3D shadow_used_idx, and it
needs to read a value paired with the "device's mb" in the SVQ vring.

We didn't have that problem before, since we clear event_notifier
right before the do{}while(), and event loop should hit a memory
barrier in the next select / poll / read / whatever syscall to check
that event notifier fd is set again.

> Since we are in the busy loop, we will read the for new used_idx for
> sure,

I'm not so sure of that, but maybe I've missed something.

I'm sending v3 with this comment pending, so we can iterate faster.

Thanks!

> and we can't forecast when the used_idx is committed to memory.
>


