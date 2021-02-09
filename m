Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 108AE3152F4
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 16:40:55 +0100 (CET)
Received: from localhost ([::1]:49178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9V8H-0004Nx-FP
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 10:40:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1l9V3O-0001fY-Lt
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 10:35:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1l9V3K-00073k-HJ
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 10:35:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612884944;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HEAw868dCapzOWy1vWFf5Owc892CmvfkwJPYv82F5+8=;
 b=I37hmLyE4n/JM0jKdEazQaf3xVdk6hsf7DcQTXiO9fkrpjVmWW02UBfO3yD8FigOkKBL4r
 uiKRHd6NgAEhNseF5ugE6bD6UXLuTNF13K3N7RBCPNMdCrHKSAcj8Dlc7dRl6MeCcIMKID
 F5fvVjo7/jpPcfRquDdq4fqOg6+SpcM=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-78-tgHUcUj_MGSMRfCuXPEYoA-1; Tue, 09 Feb 2021 10:35:42 -0500
X-MC-Unique: tgHUcUj_MGSMRfCuXPEYoA-1
Received: by mail-lf1-f69.google.com with SMTP id g6so10999854lfu.13
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 07:35:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=HEAw868dCapzOWy1vWFf5Owc892CmvfkwJPYv82F5+8=;
 b=p3IAzS4RkPAYo0GrgtlAykCpy1wGp4VT+gE0ZM5JPC2KZ0hGFISWkiedSbCZa95wW4
 6yPcEaXzKc/+6NRPwdaLcpuPo50zKnFQoFk0pqjWI3kvCogwZqERpfhLotlKNRLL85UW
 Fb3/boT+MUy5LUX9Ssnw+85IWCHIaIu26BG5GLW8O7vbhrd5ahFmOw/C4riQ/Bln3cav
 3XZ8egryABgjH2lFNo0taAb3xbtv2nbYUFKTDI60t/Togrs9RRrUV8U9dcT7YAfPWnxl
 LUsZ4lZtW7V448QVteR+2+RAaZ23E0RTTnEqexVCmo2YCaKDo4OdOyABF3X40fbDT4+g
 Fg2g==
X-Gm-Message-State: AOAM532Btwi9Nv2u0hliuiM/M614xKPa5iMwTM4cd5chj+JPHShThAZW
 9nysla2I4Q0D7LL99HKUDXecI7qk4UlY0HwX+nnsZnvl1fsYak06Nn1uJJQx4NRZIOvm9zfkW7j
 u8mKom0/3VdSP7I+QlhLnddtHilfp+q4=
X-Received: by 2002:a2e:5402:: with SMTP id i2mr1258391ljb.222.1612884940623; 
 Tue, 09 Feb 2021 07:35:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyNoiXF8Zv3QvMdPpZPGLCLLLerNVui5qFXSmsrUVxphleTV+JCymMlnyZu3upuRnnLXwA4CmcrZiC9e+9XDdo=
X-Received: by 2002:a2e:5402:: with SMTP id i2mr1258375ljb.222.1612884940312; 
 Tue, 09 Feb 2021 07:35:40 -0800 (PST)
MIME-Version: 1.0
References: <20210129205415.876290-1-eperezma@redhat.com>
 <20210129205415.876290-6-eperezma@redhat.com>
 <acf16fd6-2282-c220-e642-0868ac839b70@redhat.com>
 <CAJaqyWeRK_i3MMZVgXJUwUNfLaq_h80jChZfQ3sRmWAcQnGLkQ@mail.gmail.com>
 <a526b3ac-91d9-28e6-5ffc-2308aab4fbd6@redhat.com>
 <CAJaqyWf-qsr5eLzk4Sum=GYhHoW_+V-9arfbssSjd6G6WnretQ@mail.gmail.com>
 <a37502d6-b83f-fd34-7634-1060f4661540@redhat.com>
 <CAJaqyWcvWyMxRuH4U2aMRrcZJHSkajO94JcH1WBfYvFrthESLw@mail.gmail.com>
 <569ace3d-f2c3-8b9f-63f5-809ce7067046@redhat.com>
In-Reply-To: <569ace3d-f2c3-8b9f-63f5-809ce7067046@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 9 Feb 2021 16:35:03 +0100
Message-ID: <CAJaqyWcBdkOd1WFWqWVtHtgm11ti7DKKa0BS1oN5k6acX6T9rw@mail.gmail.com>
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
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
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
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-level <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 virtualization@lists.linux-foundation.org, Michael Lilja <ml@napatech.com>,
 Jim Harford <jim.harford@broadcom.com>, Rob Miller <rob.miller@broadcom.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 5, 2021 at 4:52 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> On 2021/2/4 =E4=B8=8B=E5=8D=885:25, Eugenio Perez Martin wrote:
> > On Thu, Feb 4, 2021 at 4:14 AM Jason Wang <jasowang@redhat.com> wrote:
> >>
> >> On 2021/2/2 =E4=B8=8B=E5=8D=886:17, Eugenio Perez Martin wrote:
> >>> On Tue, Feb 2, 2021 at 4:31 AM Jason Wang <jasowang@redhat.com> wrote=
:
> >>>> On 2021/2/1 =E4=B8=8B=E5=8D=884:28, Eugenio Perez Martin wrote:
> >>>>> On Mon, Feb 1, 2021 at 7:13 AM Jason Wang <jasowang@redhat.com> wro=
te:
> >>>>>> On 2021/1/30 =E4=B8=8A=E5=8D=884:54, Eugenio P=C3=A9rez wrote:
> >>>>>>> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> >>>>>>> ---
> >>>>>>>      include/hw/virtio/vhost.h |  1 +
> >>>>>>>      hw/virtio/vhost.c         | 17 +++++++++++++++++
> >>>>>>>      2 files changed, 18 insertions(+)
> >>>>>>>
> >>>>>>> diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.=
h
> >>>>>>> index 4a8bc75415..fca076e3f0 100644
> >>>>>>> --- a/include/hw/virtio/vhost.h
> >>>>>>> +++ b/include/hw/virtio/vhost.h
> >>>>>>> @@ -123,6 +123,7 @@ uint64_t vhost_get_features(struct vhost_dev =
*hdev, const int *feature_bits,
> >>>>>>>      void vhost_ack_features(struct vhost_dev *hdev, const int *f=
eature_bits,
> >>>>>>>                              uint64_t features);
> >>>>>>>      bool vhost_has_free_slot(void);
> >>>>>>> +struct vhost_dev *vhost_dev_from_virtio(const VirtIODevice *vdev=
);
> >>>>>>>
> >>>>>>>      int vhost_net_set_backend(struct vhost_dev *hdev,
> >>>>>>>                                struct vhost_vring_file *file);
> >>>>>>> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> >>>>>>> index 28c7d78172..8683d507f5 100644
> >>>>>>> --- a/hw/virtio/vhost.c
> >>>>>>> +++ b/hw/virtio/vhost.c
> >>>>>>> @@ -61,6 +61,23 @@ bool vhost_has_free_slot(void)
> >>>>>>>          return slots_limit > used_memslots;
> >>>>>>>      }
> >>>>>>>
> >>>>>>> +/*
> >>>>>>> + * Get the vhost device associated to a VirtIO device.
> >>>>>>> + */
> >>>>>>> +struct vhost_dev *vhost_dev_from_virtio(const VirtIODevice *vdev=
)
> >>>>>>> +{
> >>>>>>> +    struct vhost_dev *hdev;
> >>>>>>> +
> >>>>>>> +    QLIST_FOREACH(hdev, &vhost_devices, entry) {
> >>>>>>> +        if (hdev->vdev =3D=3D vdev) {
> >>>>>>> +            return hdev;
> >>>>>>> +        }
> >>>>>>> +    }
> >>>>>>> +
> >>>>>>> +    assert(hdev);
> >>>>>>> +    return NULL;
> >>>>>>> +}
> >>>>>> I'm not sure this can work in the case of multiqueue. E.g vhost-ne=
t
> >>>>>> multiqueue is a N:1 mapping between vhost devics and virtio device=
s.
> >>>>>>
> >>>>>> Thanks
> >>>>>>
> >>>>> Right. We could add an "vdev vq index" parameter to the function in
> >>>>> this case, but I guess the most reliable way to do this is to add a
> >>>>> vhost_opaque value to VirtQueue, as Stefan proposed in previous RFC=
.
> >>>> So the question still, it looks like it's easier to hide the shadow
> >>>> virtqueue stuffs at vhost layer instead of expose them to virtio lay=
er:
> >>>>
> >>>> 1) vhost protocol is stable ABI
> >>>> 2) no need to deal with virtio stuffs which is more complex than vho=
st
> >>>>
> >>>> Or are there any advantages if we do it at virtio layer?
> >>>>
> >>> As far as I can tell, we will need the virtio layer the moment we
> >>> start copying/translating buffers.
> >>>
> >>> In this series, the virtio dependency can be reduced if qemu does not
> >>> check the used ring _F_NO_NOTIFY flag before writing to irqfd. It
> >>> would enable packed queues and IOMMU immediately, and I think the cos=
t
> >>> should not be so high. In the previous RFC this check was deleted
> >>> later anyway, so I think it was a bad idea to include it from the sta=
rt.
> >>
> >> I am not sure I understand here. For vhost, we can still do anything w=
e
> >> want, e.g accessing guest memory etc. Any blocker that prevent us from
> >> copying/translating buffers? (Note that qemu will propagate memory
> >> mappings to vhost).
> >>
> > There is nothing that forbids us to access directly, but if we don't
> > reuse the virtio layer functionality we would have to duplicate every
> > access function. "Need" was a too strong word maybe :).
> >
> > In other words: for the shadow vq vring exposed for the device, qemu
> > treats it as a driver, and this functionality needs to be added to
> > qemu. But for accessing the guest's one do not reuse virtio.c would be
> > a bad idea in my opinion.
>
>
> The problem is, virtio.c is not a library and it has a lot of dependency
> with other qemu modules basically makes it impossible to be reused at
> vhost level.
>

While virtio.c as a whole has dependencies, I think that the functions
needed in the original RFC do not have these dependencies.

However I see how to split vring dataplane from virtio device
management can benefit.

> We can solve this by:
>
> 1) split the core functions out as a library or
> 2) switch to use contrib/lib-vhostuser but needs to decouple UNIX socket
> transport
>
> None of the above looks trivial and they are only device codes. For
> shadow virtqueue, we need driver codes as well where no code can be reuse=
d.
>
> As we discussed, we probably need IOVA allocated when forwarding
> descriptors between the two virtqueues. So my feeling is we can have our
> own codes to start then we can consider whether we can reuse some from
> the existing virtio.c or lib-vhostuser.
>

As I see it, if we develop our own code a lot of it will be copied
from current virtio.c, which itself duplicates a lot of contrib/ lib
functionality.

Maybe it's better to combine your proposals and decouple the vring
functions, the vhost transport, and the qemu virtio device management,
so other projects can reuse them directly?

I still think this can be left for a later series with buffer
forwarding on top of this one, do you think they can/should be merged
independently?

Thanks!

> Thanks
>
>
> >
> >> Thanks
> >>
> >>
> >>>
> >>>
> >>>
> >>>
> >>>> Thanks
> >>>>
> >>>>
> >>>>> I need to take this into account in qmp_x_vhost_enable_shadow_vq to=
o.
> >>>>>
> >>>>>>> +
> >>>>>>>      static void vhost_dev_sync_region(struct vhost_dev *dev,
> >>>>>>>                                        MemoryRegionSection *secti=
on,
> >>>>>>>                                        uint64_t mfirst, uint64_t =
mlast,
> >
>


