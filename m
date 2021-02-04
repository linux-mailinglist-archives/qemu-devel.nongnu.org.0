Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD78B30EFA3
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 10:27:55 +0100 (CET)
Received: from localhost ([::1]:34112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7ava-0002jE-Uy
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 04:27:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1l7auK-0002Hl-Cn
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 04:26:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1l7auH-0002MN-TV
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 04:26:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612430791;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BLIHKrmPXGBvFAtZDz+TQjcdkEORlCpcSGeyWmYlj/I=;
 b=NW4N9pcg3WWcSDlYK4M1gST5rKYf94MJz42D5dSY1dzYjcH+PfZEpT8UFKfkMm2eBfLHgA
 QEwr5PHOZTemA7vt4x19KUfrMmx1/gOjacb6G2k1uL5qJVrtqaVwqRBEL3Wm7qOd+Agm8N
 LNLENhz9H4nL5IqL+B+eorg+bf3wj2M=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-358--m9GBOImNoaCATAY2Oatcg-1; Thu, 04 Feb 2021 04:26:27 -0500
X-MC-Unique: -m9GBOImNoaCATAY2Oatcg-1
Received: by mail-qt1-f199.google.com with SMTP id v13so2091717qtq.18
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 01:26:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BLIHKrmPXGBvFAtZDz+TQjcdkEORlCpcSGeyWmYlj/I=;
 b=MnzAWB+jlHI7xwNHjZxssrNAX7YjOIwOOLyfoGWZIj29qF6oSnf4KzzzvsZV3zEaSE
 NJgrWxlXvqD7pFt1oaxl+9Rbv14xI3J4DOZTyj/mc9T6B9GC/korD7K8IAvURDLpg5rw
 E98NHiERxcLTL6W2Y+O66B6ZWuBjitfg5xWL8DpOP3jakKjpB/F+ELU3z/ulDjQ3D2uz
 lyDY7QY02BOw23Qbdvy9J31oblwDYAB2Mpy/0QC0Y62YkcldaYz9uRQzLf3R0D3Q/vsU
 KpCOoSeltyQHnSuIX4EZsSbv4yGsmFwpgIja7WOGE2YXT80dhM/pimVy8qilvSRHV0NN
 jFzA==
X-Gm-Message-State: AOAM532T0BXLyYeRDxvWM7lEatmYdchVFYBfkPj9M32xb4Jc6Nvousq8
 tSyq4yQsy8Py0SxR0je5uwvUQm5dJRfLn3M+1PKLDpvFDxgpLzOBQ6GP1VE/BNnror8xb8mxwd2
 WvzddC0wSgnY2h0eRTB86Y3jp68Gf8iE=
X-Received: by 2002:ac8:6b8a:: with SMTP id z10mr6549937qts.384.1612430787399; 
 Thu, 04 Feb 2021 01:26:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzOad7srowUhJCPg77zZM7k8nOgeldwpkFxi8pED1twQ3NPZ4yHjk/7u0HKPP34y5hMHNqDGCz7l/okHrmIuUY=
X-Received: by 2002:ac8:6b8a:: with SMTP id z10mr6549910qts.384.1612430787195; 
 Thu, 04 Feb 2021 01:26:27 -0800 (PST)
MIME-Version: 1.0
References: <20210129205415.876290-1-eperezma@redhat.com>
 <20210129205415.876290-6-eperezma@redhat.com>
 <acf16fd6-2282-c220-e642-0868ac839b70@redhat.com>
 <CAJaqyWeRK_i3MMZVgXJUwUNfLaq_h80jChZfQ3sRmWAcQnGLkQ@mail.gmail.com>
 <a526b3ac-91d9-28e6-5ffc-2308aab4fbd6@redhat.com>
 <CAJaqyWf-qsr5eLzk4Sum=GYhHoW_+V-9arfbssSjd6G6WnretQ@mail.gmail.com>
 <a37502d6-b83f-fd34-7634-1060f4661540@redhat.com>
In-Reply-To: <a37502d6-b83f-fd34-7634-1060f4661540@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Thu, 4 Feb 2021 10:25:51 +0100
Message-ID: <CAJaqyWcvWyMxRuH4U2aMRrcZJHSkajO94JcH1WBfYvFrthESLw@mail.gmail.com>
Subject: Re: [RFC 05/10] vhost: Add vhost_dev_from_virtio
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
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
Cc: Rob Miller <rob.miller@broadcom.com>, Parav Pandit <parav@mellanox.com>,
 Juan Quintela <quintela@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-level <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 virtualization@lists.linux-foundation.org, Michael Lilja <ml@napatech.com>,
 Jim Harford <jim.harford@broadcom.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 4, 2021 at 4:14 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> On 2021/2/2 =E4=B8=8B=E5=8D=886:17, Eugenio Perez Martin wrote:
> > On Tue, Feb 2, 2021 at 4:31 AM Jason Wang <jasowang@redhat.com> wrote:
> >>
> >> On 2021/2/1 =E4=B8=8B=E5=8D=884:28, Eugenio Perez Martin wrote:
> >>> On Mon, Feb 1, 2021 at 7:13 AM Jason Wang <jasowang@redhat.com> wrote=
:
> >>>> On 2021/1/30 =E4=B8=8A=E5=8D=884:54, Eugenio P=C3=A9rez wrote:
> >>>>> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> >>>>> ---
> >>>>>     include/hw/virtio/vhost.h |  1 +
> >>>>>     hw/virtio/vhost.c         | 17 +++++++++++++++++
> >>>>>     2 files changed, 18 insertions(+)
> >>>>>
> >>>>> diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
> >>>>> index 4a8bc75415..fca076e3f0 100644
> >>>>> --- a/include/hw/virtio/vhost.h
> >>>>> +++ b/include/hw/virtio/vhost.h
> >>>>> @@ -123,6 +123,7 @@ uint64_t vhost_get_features(struct vhost_dev *h=
dev, const int *feature_bits,
> >>>>>     void vhost_ack_features(struct vhost_dev *hdev, const int *feat=
ure_bits,
> >>>>>                             uint64_t features);
> >>>>>     bool vhost_has_free_slot(void);
> >>>>> +struct vhost_dev *vhost_dev_from_virtio(const VirtIODevice *vdev);
> >>>>>
> >>>>>     int vhost_net_set_backend(struct vhost_dev *hdev,
> >>>>>                               struct vhost_vring_file *file);
> >>>>> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> >>>>> index 28c7d78172..8683d507f5 100644
> >>>>> --- a/hw/virtio/vhost.c
> >>>>> +++ b/hw/virtio/vhost.c
> >>>>> @@ -61,6 +61,23 @@ bool vhost_has_free_slot(void)
> >>>>>         return slots_limit > used_memslots;
> >>>>>     }
> >>>>>
> >>>>> +/*
> >>>>> + * Get the vhost device associated to a VirtIO device.
> >>>>> + */
> >>>>> +struct vhost_dev *vhost_dev_from_virtio(const VirtIODevice *vdev)
> >>>>> +{
> >>>>> +    struct vhost_dev *hdev;
> >>>>> +
> >>>>> +    QLIST_FOREACH(hdev, &vhost_devices, entry) {
> >>>>> +        if (hdev->vdev =3D=3D vdev) {
> >>>>> +            return hdev;
> >>>>> +        }
> >>>>> +    }
> >>>>> +
> >>>>> +    assert(hdev);
> >>>>> +    return NULL;
> >>>>> +}
> >>>> I'm not sure this can work in the case of multiqueue. E.g vhost-net
> >>>> multiqueue is a N:1 mapping between vhost devics and virtio devices.
> >>>>
> >>>> Thanks
> >>>>
> >>> Right. We could add an "vdev vq index" parameter to the function in
> >>> this case, but I guess the most reliable way to do this is to add a
> >>> vhost_opaque value to VirtQueue, as Stefan proposed in previous RFC.
> >>
> >> So the question still, it looks like it's easier to hide the shadow
> >> virtqueue stuffs at vhost layer instead of expose them to virtio layer=
:
> >>
> >> 1) vhost protocol is stable ABI
> >> 2) no need to deal with virtio stuffs which is more complex than vhost
> >>
> >> Or are there any advantages if we do it at virtio layer?
> >>
> > As far as I can tell, we will need the virtio layer the moment we
> > start copying/translating buffers.
> >
> > In this series, the virtio dependency can be reduced if qemu does not
> > check the used ring _F_NO_NOTIFY flag before writing to irqfd. It
> > would enable packed queues and IOMMU immediately, and I think the cost
> > should not be so high. In the previous RFC this check was deleted
> > later anyway, so I think it was a bad idea to include it from the start=
.
>
>
> I am not sure I understand here. For vhost, we can still do anything we
> want, e.g accessing guest memory etc. Any blocker that prevent us from
> copying/translating buffers? (Note that qemu will propagate memory
> mappings to vhost).
>

There is nothing that forbids us to access directly, but if we don't
reuse the virtio layer functionality we would have to duplicate every
access function. "Need" was a too strong word maybe :).

In other words: for the shadow vq vring exposed for the device, qemu
treats it as a driver, and this functionality needs to be added to
qemu. But for accessing the guest's one do not reuse virtio.c would be
a bad idea in my opinion.

> Thanks
>
>
> >
> >
> >
> >
> >
> >> Thanks
> >>
> >>
> >>> I need to take this into account in qmp_x_vhost_enable_shadow_vq too.
> >>>
> >>>>> +
> >>>>>     static void vhost_dev_sync_region(struct vhost_dev *dev,
> >>>>>                                       MemoryRegionSection *section,
> >>>>>                                       uint64_t mfirst, uint64_t mla=
st,
> >
>


