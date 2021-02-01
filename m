Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49FDA30A349
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 09:30:56 +0100 (CET)
Received: from localhost ([::1]:42006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6Ubn-00080e-Bm
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 03:30:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1l6UaB-0007bJ-3h
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 03:29:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1l6Ua8-0002i1-8q
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 03:29:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612168150;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RTR+7AdxD1fdwDreb85kpTDOupIN+n3JkgcidWPtoWs=;
 b=M1OXMLQ4vPAQ8/to2/wCkumivRgPzduumnk67RcA1Ha5fhel5ZUfNy8iWK/ygiB6/GyMxP
 uOJ0SXpfg3oTLhCjYFmywj6/zXsQAlSMgpvi1fnBUYetoK3PqlHCQUwF8uQY5XvR2ADwu/
 hmHtvW0K40YgA2+2d8skwCKJLLS81dE=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-443-5GAStT-sPiSL6PWozuVLvg-1; Mon, 01 Feb 2021 03:29:05 -0500
X-MC-Unique: 5GAStT-sPiSL6PWozuVLvg-1
Received: by mail-qt1-f199.google.com with SMTP id o7so10060112qtw.7
 for <qemu-devel@nongnu.org>; Mon, 01 Feb 2021 00:29:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=RTR+7AdxD1fdwDreb85kpTDOupIN+n3JkgcidWPtoWs=;
 b=CYEJp4Gt/34HqUQ2wytrZMde/TaZWINaqnT+IcCIKosMPGzKX2UXtTfvPdT3CqLyUe
 UA8JY8O0cdnYFNTcnddAcVxYpOW0qbIKxhGTvZqCsmKKKrkmZCBnxQ1sWJ2q3HV3MhY3
 cpj7Yi5sUytvEY8EyK2JfMF4moZTuJDVlQkW7w4Ras+Lt1hG6yX8yWi/pDzJpPV2NUTH
 ThqeRYSzqx8ylaUcmjP6JLcUjtdkzA+T6OTKNmZ2Gxj4OUFEIXz4CNsW/IfFl3OIr6+y
 qb/Bcb8DQWgCYWvrXvw0CL180Ser4XLq19y1i5EJ559P0nYvxJLjB3N4teeCF2pHntVl
 Ncaw==
X-Gm-Message-State: AOAM532SuTGacQY5qPcZml3Fu5ocldAH+hqcAMvfM86tm8fAYdI1Iv5v
 i5oz0OzADp0F5IcrLYNSzQbuyJ+ZCFVAYtQuOpOVI9ygZn8lPqaB07qDGvsRqAUeodg0aVMVguS
 wFbT03A/UPrWMziMNeYuzUbxFSuZJYv0=
X-Received: by 2002:a05:6214:108d:: with SMTP id
 o13mr14100546qvr.16.1612168145450; 
 Mon, 01 Feb 2021 00:29:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxTN+N60WTyoTFQjG+96IpaBpNLbddJRVRcbNEiL0sqNxFurnpfoXxXzBiO2r9liea7mnPXr0WeLqev6cjScjI=
X-Received: by 2002:a05:6214:108d:: with SMTP id
 o13mr14100524qvr.16.1612168145205; 
 Mon, 01 Feb 2021 00:29:05 -0800 (PST)
MIME-Version: 1.0
References: <20210129205415.876290-1-eperezma@redhat.com>
 <20210129205415.876290-6-eperezma@redhat.com>
 <acf16fd6-2282-c220-e642-0868ac839b70@redhat.com>
In-Reply-To: <acf16fd6-2282-c220-e642-0868ac839b70@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 1 Feb 2021 09:28:29 +0100
Message-ID: <CAJaqyWeRK_i3MMZVgXJUwUNfLaq_h80jChZfQ3sRmWAcQnGLkQ@mail.gmail.com>
Subject: Re: [RFC 05/10] vhost: Add vhost_dev_from_virtio
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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

On Mon, Feb 1, 2021 at 7:13 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> On 2021/1/30 =E4=B8=8A=E5=8D=884:54, Eugenio P=C3=A9rez wrote:
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >   include/hw/virtio/vhost.h |  1 +
> >   hw/virtio/vhost.c         | 17 +++++++++++++++++
> >   2 files changed, 18 insertions(+)
> >
> > diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
> > index 4a8bc75415..fca076e3f0 100644
> > --- a/include/hw/virtio/vhost.h
> > +++ b/include/hw/virtio/vhost.h
> > @@ -123,6 +123,7 @@ uint64_t vhost_get_features(struct vhost_dev *hdev,=
 const int *feature_bits,
> >   void vhost_ack_features(struct vhost_dev *hdev, const int *feature_bi=
ts,
> >                           uint64_t features);
> >   bool vhost_has_free_slot(void);
> > +struct vhost_dev *vhost_dev_from_virtio(const VirtIODevice *vdev);
> >
> >   int vhost_net_set_backend(struct vhost_dev *hdev,
> >                             struct vhost_vring_file *file);
> > diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> > index 28c7d78172..8683d507f5 100644
> > --- a/hw/virtio/vhost.c
> > +++ b/hw/virtio/vhost.c
> > @@ -61,6 +61,23 @@ bool vhost_has_free_slot(void)
> >       return slots_limit > used_memslots;
> >   }
> >
> > +/*
> > + * Get the vhost device associated to a VirtIO device.
> > + */
> > +struct vhost_dev *vhost_dev_from_virtio(const VirtIODevice *vdev)
> > +{
> > +    struct vhost_dev *hdev;
> > +
> > +    QLIST_FOREACH(hdev, &vhost_devices, entry) {
> > +        if (hdev->vdev =3D=3D vdev) {
> > +            return hdev;
> > +        }
> > +    }
> > +
> > +    assert(hdev);
> > +    return NULL;
> > +}
>
>
> I'm not sure this can work in the case of multiqueue. E.g vhost-net
> multiqueue is a N:1 mapping between vhost devics and virtio devices.
>
> Thanks
>

Right. We could add an "vdev vq index" parameter to the function in
this case, but I guess the most reliable way to do this is to add a
vhost_opaque value to VirtQueue, as Stefan proposed in previous RFC.

I need to take this into account in qmp_x_vhost_enable_shadow_vq too.

>
> > +
> >   static void vhost_dev_sync_region(struct vhost_dev *dev,
> >                                     MemoryRegionSection *section,
> >                                     uint64_t mfirst, uint64_t mlast,
>


