Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3697930BBED
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 11:19:39 +0100 (CET)
Received: from localhost ([::1]:36918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6smX-0000FG-OG
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 05:19:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1l6slY-0008H1-9E
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 05:18:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59012)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1l6slR-0006zW-KK
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 05:18:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612261107;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OcBjQhvhMciVDJmXNAYV32z7mFsnjlh+yXSYEcK6pDs=;
 b=at9/tSIZEGsi7tL8yak1yJ3oaqdkfdFLqfHJKsGq5okCvNQ6EiKI3ZEC4SOhZ3JptJz8R2
 RiQWfC/Ew7KOKDrNWREODHJvIaUjeV7Zot1Bd1xINO8dyDh8gwzi4owibSTgskAQL49aqH
 42D8p58iXP4R2DDeIiHXGOUh12ksUgI=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-238-lfEB52wVPXOzyi9WWGsZQA-1; Tue, 02 Feb 2021 05:18:26 -0500
X-MC-Unique: lfEB52wVPXOzyi9WWGsZQA-1
Received: by mail-qk1-f198.google.com with SMTP id y79so15204226qka.23
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 02:18:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=OcBjQhvhMciVDJmXNAYV32z7mFsnjlh+yXSYEcK6pDs=;
 b=c3bx2XFGseMiqJqWMEVXZKSTIDED1lyqEJK8k0n3UACmp2rpksT3x0H9zs3iefxyBp
 OHKh8kXA2xjEIGfjxHa8oYfoBSOKOSKiRRUsFXSZSPs3c/tnfov0AqNhVgiTTIfZDoCO
 hkSEtW0PDPsJ3SxqsPeH1Ai1TFj+kBPJNa53CI+cCaj9u+QR+tYyQDj7eF89tyVmZd5C
 1ycQ8+3VmBT8gKmx7HYufiApZWCCDkvz8/vuu6mOLsjydY5pjFUkwQsQ9NBd2Uj1ELFe
 HQw7q8gv06EBNVfvOpTN+54LsvdcIGFh+s5wrSLT43ffZiRO7fJmqTnfWX1GGzHspYUN
 Bf4g==
X-Gm-Message-State: AOAM533trEcd4ByCZHI6oP6rOGeyhzp9Hum3erS76iF40mPoHhTFKBiC
 MetV96U+SJPlR45fwerOBGErJBgtyizUN34NFJQ8Z0ulnAXRsiKCXS+5i5AjOhfByyJdJFJIeC7
 wQWUmXdk8FKtBmvM7TD+xqx3qD4nwuhQ=
X-Received: by 2002:ac8:5c49:: with SMTP id j9mr19331149qtj.221.1612261106153; 
 Tue, 02 Feb 2021 02:18:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxFU87Lq4wE5rFaJiBwQWLOZGJfFr3kwShPUd5sTePd1bf8pInVr463BJWtU6qKGRM1smW3jRcw9HJ+TD65GFU=
X-Received: by 2002:ac8:5c49:: with SMTP id j9mr19331118qtj.221.1612261105953; 
 Tue, 02 Feb 2021 02:18:25 -0800 (PST)
MIME-Version: 1.0
References: <20210129205415.876290-1-eperezma@redhat.com>
 <20210129205415.876290-6-eperezma@redhat.com>
 <acf16fd6-2282-c220-e642-0868ac839b70@redhat.com>
 <CAJaqyWeRK_i3MMZVgXJUwUNfLaq_h80jChZfQ3sRmWAcQnGLkQ@mail.gmail.com>
 <a526b3ac-91d9-28e6-5ffc-2308aab4fbd6@redhat.com>
In-Reply-To: <a526b3ac-91d9-28e6-5ffc-2308aab4fbd6@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 2 Feb 2021 11:17:50 +0100
Message-ID: <CAJaqyWf-qsr5eLzk4Sum=GYhHoW_+V-9arfbssSjd6G6WnretQ@mail.gmail.com>
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
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
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
Cc: Parav Pandit <parav@mellanox.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-level <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 virtualization@lists.linux-foundation.org, Michael Lilja <ml@napatech.com>,
 Jim Harford <jim.harford@broadcom.com>, Rob Miller <rob.miller@broadcom.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 2, 2021 at 4:31 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> On 2021/2/1 =E4=B8=8B=E5=8D=884:28, Eugenio Perez Martin wrote:
> > On Mon, Feb 1, 2021 at 7:13 AM Jason Wang <jasowang@redhat.com> wrote:
> >>
> >> On 2021/1/30 =E4=B8=8A=E5=8D=884:54, Eugenio P=C3=A9rez wrote:
> >>> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> >>> ---
> >>>    include/hw/virtio/vhost.h |  1 +
> >>>    hw/virtio/vhost.c         | 17 +++++++++++++++++
> >>>    2 files changed, 18 insertions(+)
> >>>
> >>> diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
> >>> index 4a8bc75415..fca076e3f0 100644
> >>> --- a/include/hw/virtio/vhost.h
> >>> +++ b/include/hw/virtio/vhost.h
> >>> @@ -123,6 +123,7 @@ uint64_t vhost_get_features(struct vhost_dev *hde=
v, const int *feature_bits,
> >>>    void vhost_ack_features(struct vhost_dev *hdev, const int *feature=
_bits,
> >>>                            uint64_t features);
> >>>    bool vhost_has_free_slot(void);
> >>> +struct vhost_dev *vhost_dev_from_virtio(const VirtIODevice *vdev);
> >>>
> >>>    int vhost_net_set_backend(struct vhost_dev *hdev,
> >>>                              struct vhost_vring_file *file);
> >>> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> >>> index 28c7d78172..8683d507f5 100644
> >>> --- a/hw/virtio/vhost.c
> >>> +++ b/hw/virtio/vhost.c
> >>> @@ -61,6 +61,23 @@ bool vhost_has_free_slot(void)
> >>>        return slots_limit > used_memslots;
> >>>    }
> >>>
> >>> +/*
> >>> + * Get the vhost device associated to a VirtIO device.
> >>> + */
> >>> +struct vhost_dev *vhost_dev_from_virtio(const VirtIODevice *vdev)
> >>> +{
> >>> +    struct vhost_dev *hdev;
> >>> +
> >>> +    QLIST_FOREACH(hdev, &vhost_devices, entry) {
> >>> +        if (hdev->vdev =3D=3D vdev) {
> >>> +            return hdev;
> >>> +        }
> >>> +    }
> >>> +
> >>> +    assert(hdev);
> >>> +    return NULL;
> >>> +}
> >>
> >> I'm not sure this can work in the case of multiqueue. E.g vhost-net
> >> multiqueue is a N:1 mapping between vhost devics and virtio devices.
> >>
> >> Thanks
> >>
> > Right. We could add an "vdev vq index" parameter to the function in
> > this case, but I guess the most reliable way to do this is to add a
> > vhost_opaque value to VirtQueue, as Stefan proposed in previous RFC.
>
>
> So the question still, it looks like it's easier to hide the shadow
> virtqueue stuffs at vhost layer instead of expose them to virtio layer:
>
> 1) vhost protocol is stable ABI
> 2) no need to deal with virtio stuffs which is more complex than vhost
>
> Or are there any advantages if we do it at virtio layer?
>

As far as I can tell, we will need the virtio layer the moment we
start copying/translating buffers.

In this series, the virtio dependency can be reduced if qemu does not
check the used ring _F_NO_NOTIFY flag before writing to irqfd. It
would enable packed queues and IOMMU immediately, and I think the cost
should not be so high. In the previous RFC this check was deleted
later anyway, so I think it was a bad idea to include it from the start.





> Thanks
>
>
> >
> > I need to take this into account in qmp_x_vhost_enable_shadow_vq too.
> >
> >>> +
> >>>    static void vhost_dev_sync_region(struct vhost_dev *dev,
> >>>                                      MemoryRegionSection *section,
> >>>                                      uint64_t mfirst, uint64_t mlast,
>


