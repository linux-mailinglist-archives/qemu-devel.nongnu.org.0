Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD534CBA32
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 10:29:51 +0100 (CET)
Received: from localhost ([::1]:45242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPhmQ-0005rJ-4p
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 04:29:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nPhiL-0004Fk-QU
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 04:25:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nPhiI-0006FQ-GX
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 04:25:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646299533;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=//AacuTs1O72BVAC6KmgfBkaLa6gYXi4jJ0C4MnkJyo=;
 b=SePOdY5fG9Ab25CcWv25TyuQp3f+Na07JLqdTzaWf6nBT6i4yYnhM3pa4XjN+w7m2Gy3Sh
 y6nqQAKOnjXZqVIM3WVKb4LSNyGr0giwUGEk7bCObp9LyZtZayRAClJDgQO2/ne+Suvwpw
 GzN/K0wgyGt2sMjlyJOZJrw/OYSE7tk=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-296-jDJ3bt6GO02CKbQyuch6sA-1; Thu, 03 Mar 2022 04:25:32 -0500
X-MC-Unique: jDJ3bt6GO02CKbQyuch6sA-1
Received: by mail-qv1-f70.google.com with SMTP id
 fv11-20020a056214240b00b0043253a948f0so3747664qvb.1
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 01:25:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=//AacuTs1O72BVAC6KmgfBkaLa6gYXi4jJ0C4MnkJyo=;
 b=TMdRxLUnnfhXdDtdX07TN5/ZuRNCsZGrZoUi2OO9Ccv66YNR8Bk0unPN5sigAz53mo
 pP5H1xzSHTwi01gDwk01hxgIS7ahH9BTrBbUDxW38PgeeloZ5/KRRTl11+xX/meUfuxd
 LXeUfDBOXIHtZ/SZJRKzXq2Ry7iB1yCipKK5dinE+EdU0Ef/ka7IHf+445L+YcMbuOc/
 EWBiAi+80W7Sblsgz8iWUIwz73a68/dL8qYIFhU3eSYXN/mZMmG2UzA8YFupjeORIRlw
 lEGUbsyBbLljzdVWlj1Hn5r3qZ/mWurB7DYidp3aV/IN6TIspaPuUglRvsLe3uwo7iVW
 ajzQ==
X-Gm-Message-State: AOAM531JHs8Pq5rUr2tdHhToXa0GRaNMB6aKKO0OVTp8f9nU53q/VXZE
 l3249W4i1JhJIo5APhndGR+2FIzQyFT1keySXcKI1wgajSo7k+LD3WtQAP0Gl8q2ZYVHaXZ+sSo
 OBkRe1e99QMBtYrVkje0ey4YRm8P9B2s=
X-Received: by 2002:a05:6214:1d0d:b0:433:1869:1fb7 with SMTP id
 e13-20020a0562141d0d00b0043318691fb7mr13322954qvd.40.1646299532201; 
 Thu, 03 Mar 2022 01:25:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwCrz/1DDSulhK5dTh2j2Efh2RZlYTZ12qbN/J2H4vQKpgu9nAYW6ZkPXwk5N3rlNcVaL8MgHfjNLy/DPIX0B4=
X-Received: by 2002:a05:6214:1d0d:b0:433:1869:1fb7 with SMTP id
 e13-20020a0562141d0d00b0043318691fb7mr13322925qvd.40.1646299531854; Thu, 03
 Mar 2022 01:25:31 -0800 (PST)
MIME-Version: 1.0
References: <20220227134111.3254066-1-eperezma@redhat.com>
 <20220227134111.3254066-3-eperezma@redhat.com>
 <40c5bb81-b33a-9a4a-8ce0-20289b13b907@redhat.com>
 <CAJaqyWezcrc=iPLe=Y7+g9oBYfUY9pK8OM4=ZUeRgXqr9ZUWkg@mail.gmail.com>
 <1da7c2b8-ba6e-e9aa-4d55-b1345bd65ba4@redhat.com>
In-Reply-To: <1da7c2b8-ba6e-e9aa-4d55-b1345bd65ba4@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Thu, 3 Mar 2022 10:24:55 +0100
Message-ID: <CAJaqyWfbkzi19yMAXY7gwCAoj7sakwU_R2hDc1u8+jHPfHLadA@mail.gmail.com>
Subject: Re: [PATCH v2 02/14] vhost: Add Shadow VirtQueue kick forwarding
 capabilities
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-level <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Eli Cohen <eli@mellanox.com>, Eric Blake <eblake@redhat.com>,
 Parav Pandit <parav@mellanox.com>, Cindy Lu <lulu@redhat.com>,
 "Fangyi \(Eric\)" <eric.fangyi@huawei.com>,
 Markus Armbruster <armbru@redhat.com>, yebiaoxiang@huawei.com,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gautam Dawar <gdawar@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Lingshan <lingshan.zhu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 3, 2022 at 8:12 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2022/3/2 =E4=B8=8A=E5=8D=882:49, Eugenio Perez Martin =E5=86=99=
=E9=81=93:
> > On Mon, Feb 28, 2022 at 3:57 AM Jason Wang<jasowang@redhat.com>  wrote:
> >> =E5=9C=A8 2022/2/27 =E4=B8=8B=E5=8D=889:40, Eugenio P=C3=A9rez =E5=86=
=99=E9=81=93:
> >>> At this mode no buffer forwarding will be performed in SVQ mode: Qemu
> >>> will just forward the guest's kicks to the device.
> >>>
> >>> Host memory notifiers regions are left out for simplicity, and they w=
ill
> >>> not be addressed in this series.
> >>>
> >>> Signed-off-by: Eugenio P=C3=A9rez<eperezma@redhat.com>
> >>> ---
> >>>    hw/virtio/vhost-shadow-virtqueue.h |  14 +++
> >>>    include/hw/virtio/vhost-vdpa.h     |   4 +
> >>>    hw/virtio/vhost-shadow-virtqueue.c |  52 +++++++++++
> >>>    hw/virtio/vhost-vdpa.c             | 145 +++++++++++++++++++++++++=
+++-
> >>>    4 files changed, 213 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-sha=
dow-virtqueue.h
> >>> index f1519e3c7b..1cbc87d5d8 100644
> >>> --- a/hw/virtio/vhost-shadow-virtqueue.h
> >>> +++ b/hw/virtio/vhost-shadow-virtqueue.h
> >>> @@ -18,8 +18,22 @@ typedef struct VhostShadowVirtqueue {
> >>>        EventNotifier hdev_kick;
> >>>        /* Shadow call notifier, sent to vhost */
> >>>        EventNotifier hdev_call;
> >>> +
> >>> +    /*
> >>> +     * Borrowed virtqueue's guest to host notifier. To borrow it in =
this event
> >>> +     * notifier allows to recover the VhostShadowVirtqueue from the =
event loop
> >>> +     * easily. If we use the VirtQueue's one, we don't have an easy =
way to
> >>> +     * retrieve VhostShadowVirtqueue.
> >>> +     *
> >>> +     * So shadow virtqueue must not clean it, or we would lose VirtQ=
ueue one.
> >>> +     */
> >>> +    EventNotifier svq_kick;
> >>>    } VhostShadowVirtqueue;
> >>>
> >>> +void vhost_svq_set_svq_kick_fd(VhostShadowVirtqueue *svq, int svq_ki=
ck_fd);
> >>> +
> >>> +void vhost_svq_stop(VhostShadowVirtqueue *svq);
> >>> +
> >>>    VhostShadowVirtqueue *vhost_svq_new(void);
> >>>
> >>>    void vhost_svq_free(gpointer vq);
> >>> diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost=
-vdpa.h
> >>> index 3ce79a646d..009a9f3b6b 100644
> >>> --- a/include/hw/virtio/vhost-vdpa.h
> >>> +++ b/include/hw/virtio/vhost-vdpa.h
> >>> @@ -12,6 +12,8 @@
> >>>    #ifndef HW_VIRTIO_VHOST_VDPA_H
> >>>    #define HW_VIRTIO_VHOST_VDPA_H
> >>>
> >>> +#include <gmodule.h>
> >>> +
> >>>    #include "hw/virtio/virtio.h"
> >>>    #include "standard-headers/linux/vhost_types.h"
> >>>
> >>> @@ -27,6 +29,8 @@ typedef struct vhost_vdpa {
> >>>        bool iotlb_batch_begin_sent;
> >>>        MemoryListener listener;
> >>>        struct vhost_vdpa_iova_range iova_range;
> >>> +    bool shadow_vqs_enabled;
> >>> +    GPtrArray *shadow_vqs;
> >>>        struct vhost_dev *dev;
> >>>        VhostVDPAHostNotifier notifier[VIRTIO_QUEUE_MAX];
> >>>    } VhostVDPA;
> >>> diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-sha=
dow-virtqueue.c
> >>> index 019cf1950f..a5d0659f86 100644
> >>> --- a/hw/virtio/vhost-shadow-virtqueue.c
> >>> +++ b/hw/virtio/vhost-shadow-virtqueue.c
> >>> @@ -11,6 +11,56 @@
> >>>    #include "hw/virtio/vhost-shadow-virtqueue.h"
> >>>
> >>>    #include "qemu/error-report.h"
> >>> +#include "qemu/main-loop.h"
> >>> +#include "linux-headers/linux/vhost.h"
> >>> +
> >>> +/** Forward guest notifications */
> >>> +static void vhost_handle_guest_kick(EventNotifier *n)
> >>> +{
> >>> +    VhostShadowVirtqueue *svq =3D container_of(n, VhostShadowVirtque=
ue,
> >>> +                                             svq_kick);
> >>> +    event_notifier_test_and_clear(n);
> >>> +    event_notifier_set(&svq->hdev_kick);
> >>> +}
> >>> +
> >>> +/**
> >>> + * Set a new file descriptor for the guest to kick the SVQ and notif=
y for avail
> >>> + *
> >>> + * @svq          The svq
> >>> + * @svq_kick_fd  The svq kick fd
> >>> + *
> >>> + * Note that the SVQ will never close the old file descriptor.
> >>> + */
> >>> +void vhost_svq_set_svq_kick_fd(VhostShadowVirtqueue *svq, int svq_ki=
ck_fd)
> >>> +{
> >>> +    EventNotifier *svq_kick =3D &svq->svq_kick;
> >>> +    bool poll_stop =3D VHOST_FILE_UNBIND !=3D event_notifier_get_fd(=
svq_kick);
> >> I wonder if this is robust. E.g is there any chance that may end up wi=
th
> >> both poll_stop and poll_start are false?
> >>
> > I cannot make that happen in qemu, but the function supports that case
> > well: It will do nothing. It's more or less the same code as used in
> > the vhost kernel, and is the expected behaviour if you send two
> > VHOST_FILE_UNBIND one right after another to me.
>
>
> I would think it's just stop twice.
>
>
> >
> >> If not, can we simple detect poll_stop as below and treat !poll_start
> >> and poll_stop?
> >>
> > I'm not sure what does it add. Is there an unexpected consequence with
> > the current do-nothing behavior I've missed?
>
>
> I'm not sure, but it feels odd if poll_start is not the reverse value of
> poll_stop.
>

If we want to not to restrict the inputs, we need to handle for situations:

a) old_fd =3D -1, new_fd =3D -1,

This is the situation you described, and it's basically a no-op.
poll_stop =3D=3D poll_start =3D=3D false.

If we make poll_stop =3D true and poll_stop =3D false, we call
event_notifier_set_handler(-1, ...). Hopefully it will return just an
error.

If we make poll_stop =3D false and poll_stop =3D true, we are calling
event_notifier_set(-1) and event_notifier_set_handler(-1,
poll_callback). Same situation, hopefully an error, but unexpected.

b) old_fd =3D -1, new_fd =3D >-1,

We need to start polling the new_fd. No need for stop polling the
old_fd, since we are not polling it actually.

c) old_fd =3D >-1, new_fd =3D >-1,

We need to stop polling the old_fd and start polling the new one.

If we make poll_stop =3D true and poll_stop =3D false, we don't register a
new polling function for the new kick_fd so we will miss guest's
kicks.

If we make poll_stop =3D false and poll_stop =3D true, we keep polling the
old file descriptor too, so whatever it gets assigned to could call
vhost_handle_guest_kick if it does not override poll callback.

We *could* detect if old_fd =3D=3D new_fd so we skip all the work, but I
think it is not worth it to complicate the code, since we're only
being called with the kick_fd at dev start.

d) c) old_fd =3D >-1, new_fd =3D -1,

We need to stop polling, or we could get invalid kicks callbacks if it
gets writed after this. No need to poll anything beyond this.

> Thanks
>
>


