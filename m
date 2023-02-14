Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03BF8695D0F
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 09:37:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRqns-0007D3-O3; Tue, 14 Feb 2023 03:36:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pRqnq-0007Ct-OW
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 03:36:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pRqnp-0001YF-06
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 03:36:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676363800;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P7hZuS7WR3XesrXnbxnk/uTgZ4QR1mXo4p2CUx5FIw4=;
 b=Hk06AMQ5/lzqX2VNMAGCpiLvU8VC9CePsxDDAQXb5s/UUWvhLC00/w7qNjnKEQYZHvc/TU
 TzP5JbZKxpKQc8bb2K/zb3fmQZQITpnjt4JujhGd9i/cNNLZ8xS1bDvsm+Z4jhAV3hOuWA
 1ppxJy6A+4puK7/n6j8uaRXaqfkqtOw=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-115-LGbQy1WCMLWnnkj9Gy6A8Q-1; Tue, 14 Feb 2023 03:36:39 -0500
X-MC-Unique: LGbQy1WCMLWnnkj9Gy6A8Q-1
Received: by mail-yw1-f197.google.com with SMTP id
 00721157ae682-52f2ab6a942so43630357b3.14
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 00:36:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P7hZuS7WR3XesrXnbxnk/uTgZ4QR1mXo4p2CUx5FIw4=;
 b=mVH2+ruR3LOrH3eFlyktpsQvqTeqB1jHOJPrs1UwU7JZCGtsKLcRqw+f8nRaKyajK8
 fyRe4zcXrYyYGytwRJkm8ShcMnyG31cA6Ab+ulgL6K9/OJjQlwW/8VKzxEhMACT+dCgS
 wlCFnGc7Vw81ZpDvU30Z/iPWYwjSHTV+q9l2uqLfGMSBOznc+uGdOYI+HIz2Aznqh3Gr
 u75sOAiHyr1kIhz9iX2BPrwfbNI0RyWN4i+lU/O5k8yyo2+57eS60qaM9wW2KRvZ6u/W
 k5h+QvjzUYFZvx4Cd1NoBceXfdxl05O4mo9h8w33jww39GOevz/lu8UAg3cRIGHpuQO9
 V9Cg==
X-Gm-Message-State: AO0yUKWZfj08WJuFixnFcUWzWQaLOfmED3xgn3LMA0MhDqyMOvgpixeE
 2Lc5/zqx5VRxbYRBiDtb1Xw931NsBuErlc5sxLcao42IutWaDscDmpCI+gCf1jvLcC8K9yIe+kX
 eMd0H4kqqQC+aRMFYvmOGNa4nA1JB8B4=
X-Received: by 2002:a0d:e944:0:b0:52e:db9c:9ef2 with SMTP id
 s65-20020a0de944000000b0052edb9c9ef2mr104855ywe.269.1676363797669; 
 Tue, 14 Feb 2023 00:36:37 -0800 (PST)
X-Google-Smtp-Source: AK7set8S+nfbAOWk1asfgfJjawY7tl/dfyKqsDgYEkubmAFgdV5ZZoJtpNB4D7XWos3fXFTVKD6WXmTOVpBbI3yL4mE=
X-Received: by 2002:a0d:e944:0:b0:52e:db9c:9ef2 with SMTP id
 s65-20020a0de944000000b0052edb9c9ef2mr104843ywe.269.1676363797422; Tue, 14
 Feb 2023 00:36:37 -0800 (PST)
MIME-Version: 1.0
References: <20230213191929.1547497-1-eperezma@redhat.com>
 <CACGkMEsQe=zcfmK=rMH=u6RgHkkBFs+tJO7gT0v_bWwJ_N+z6Q@mail.gmail.com>
 <CAJaqyWfsBLvsJNF=RvhbirwNypzjfaO7thyK22s-nCjdaNs4yQ@mail.gmail.com>
 <20230214024736-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230214024736-mutt-send-email-mst@kernel.org>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 14 Feb 2023 09:36:01 +0100
Message-ID: <CAJaqyWc8JON+QhJbqQCFx+q+qxb5LqjgsHS2wZ7R3v37uVU_sw@mail.gmail.com>
Subject: Re: [PATCH] vhost: accept VIRTIO_F_ORDER_PLATFORM as a valid SVQ
 feature
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org, 
 Gautam Dawar <gdawar@xilinx.com>, Parav Pandit <parav@mellanox.com>, 
 Zhu Lingshan <lingshan.zhu@intel.com>, Cindy Lu <lulu@redhat.com>,
 longpeng2@huawei.com, 
 Eli Cohen <eli@mellanox.com>, alvaro.karsz@solid-run.com, 
 Lei Yang <leiyang@redhat.com>, Laurent Vivier <lvivier@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Feb 14, 2023 at 8:51 AM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Tue, Feb 14, 2023 at 08:02:08AM +0100, Eugenio Perez Martin wrote:
> > On Tue, Feb 14, 2023 at 7:31 AM Jason Wang <jasowang@redhat.com> wrote:
> > >
> > > On Tue, Feb 14, 2023 at 3:19 AM Eugenio P=C3=A9rez <eperezma@redhat.c=
om> wrote:
> > > >
> > > > VIRTIO_F_ORDER_PLATFORM indicates that memory accesses by the drive=
r and
> > > > the device are ordered in a way described by the platform.  Since v=
DPA
> > > > devices may be backed by a hardware devices, let's allow
> > > > VIRTIO_F_ORDER_PLATFORM.
> > > >
> > > > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > > > ---
> > > >  hw/virtio/vhost-shadow-virtqueue.c | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > >
> > > > diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-s=
hadow-virtqueue.c
> > > > index 4307296358..6bb1998f12 100644
> > > > --- a/hw/virtio/vhost-shadow-virtqueue.c
> > > > +++ b/hw/virtio/vhost-shadow-virtqueue.c
> > > > @@ -34,6 +34,7 @@ bool vhost_svq_valid_features(uint64_t features, =
Error **errp)
> > > >          switch (b) {
> > > >          case VIRTIO_F_ANY_LAYOUT:
> > > >          case VIRTIO_RING_F_EVENT_IDX:
> > > > +        case VIRTIO_F_ORDER_PLATFORM:
> > >
> > > Do we need to add this bit to vdpa_feature_bits[] as well?
> > >
> >
> > If we want to pass it to the guest, yes we should. I'll send another
> > patch for it.
> >
> > But I think that should be done on top / in parallel actually.
> >
> > Open question: Should all vdpa hardware devices offer it? Or this is
> > only needed on specific archs?
> >
> > Thanks!
>
> I don't get what this is doing at all frankly. vdpa has to
> pass VIRTIO_F_ORDER_PLATFORM to guest at all times - unless
> - it's a x86 host where it kind of works anyway
> - it's vduse which frankly is so slow we can do VIRTIO_F_ORDER_PLATFORM a=
nyway.

That was my understanding, adding vdpasim to the list of exceptions
(please correct me if I'm wrong).

> In short VIRTIO_F_ORDER_PLATFORM has nothing to do with the device
> and everything with qemu itself.
>

I have little experience outside of x86 so I may be wrong here. My
understanding is that this feature allows the guest to optimize
barriers around memory ops:
* If VIRTIO_F_ORDER_PLATFORM is not negotiated, the driver can use
softer memory barriers that protects ordering between different
processors.
* If VIRTIO_F_ORDER_PLATFORM is negotiated, stronger ordering is
needed that also protects transport (PCI) accesses

This is backed up by comments in the standard:
This implies that the driver needs to use memory barriers suitable for
devices described by the platform; e.g. for the PCI transport in the
case of hardware PCI devices.

And in virtio drivers:
For virtio_pci on SMP, we don't need to order with respect to MMIO
accesses through relaxed memory I/O windows, so virt_mb() et al are
sufficient.
For using virtio to talk to real devices (eg. other heterogeneous
CPUs) we do need real barriers.

So the sentence "VIRTIO_F_ORDER_PLATFORM has nothing to do with the
device and everything with qemu itself." is actually the reverse, and
has everything to do with devices?

> Yea we can allow VIRTIO_F_ORDER_PLATFORM from kernel but given
> we never did at this point it will need a protocol feature bit.
> I don't think it's worth it ..
>

With "from kernel" do you mean in vhost-kernel or in virtio ring
driver? The virtio ring driver already supports them.

I'm ok with leaving this for the future but that means hw devices in
non-x86 platforms may not work correctly, isn't it?

Thanks!


