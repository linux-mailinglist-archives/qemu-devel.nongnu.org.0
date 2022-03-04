Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87AC54CCB61
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 02:42:44 +0100 (CET)
Received: from localhost ([::1]:53068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPwxv-0006Rr-Li
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 20:42:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nPwvd-0004xR-RE
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 20:40:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35108)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nPwvL-00041m-Mj
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 20:40:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646358002;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=86IVBTs1zO3soES1BSFbPEwpKK67/iP/hzPqZVJT4Mk=;
 b=XButPzRUPdfkMZ/FnvSV6q9itkrI1JdNnBVzS1SXAYk2KJHXsXp8OE5BHN2IXzs9w2sXQP
 hur8EzGLnnRX4zQyzfS4pjPeDXGWDGa8f9XGAyezzbOmoI5SnEqg8FUNs7ebNGxkj10YKN
 fobpIOVg1rVGtxm1IwPKN8FoRGAcYvk=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-46-4cUrxLp3NLWRcBfHNyJtfA-1; Thu, 03 Mar 2022 20:40:01 -0500
X-MC-Unique: 4cUrxLp3NLWRcBfHNyJtfA-1
Received: by mail-lf1-f69.google.com with SMTP id
 a5-20020ac25205000000b00443a34a9472so2115180lfl.15
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 17:40:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=86IVBTs1zO3soES1BSFbPEwpKK67/iP/hzPqZVJT4Mk=;
 b=F+8NBkYvCw1KFC7Pq3EEy8AS7kFa8xKh1tnWKWI/juOPrv4IOqwYhwYjC7M3HZggbj
 7kvl4s8UTanIKIjPaq1lzmKqwMXhwyluepNSxJkWfdsekBp7tZagWkko01iEoZ/65S0A
 WTNNCx/IwJAS3iDryQS8Aa7PtF3mgC8qilkNr0LymD3JhO3+RtX2H8fQUra983FDTyDZ
 TRxY8XHjEg46KROxB5V94nK+ELio9TXN+NcfADBNpwz+ND4sWTghXgjgoGGpg8Bvg922
 fN+fwwPoKlBYFo7jpmxSHdoXvfAPOSnF3qugcSLEQSP44sMhV9F99flfgx+h69t4tnU2
 BP3Q==
X-Gm-Message-State: AOAM53220qAuFQ8wdK7+I6uOoiMs/2h+RY01/mw9Dx5FiNOGPjwseGKz
 XkHVC7RC4m7S0q1hXOlFQEVctTk+Edi3AN1aDOz2v5Wbj4uQF6GvTVkHxuxoJVEjHBPZY4gHGDm
 4lHcC946S+soAOwiGeo6LTq7BAfSKxa0=
X-Received: by 2002:a05:6512:3d08:b0:43f:8f45:d670 with SMTP id
 d8-20020a0565123d0800b0043f8f45d670mr23724348lfv.587.1646357999842; 
 Thu, 03 Mar 2022 17:39:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz/N5OkKEFPP69HFp2xd3HmlaSo7u6QlzusAq5p05BGKC4gaDVYtb5D7JVLeLqaoKCNZA2BDOr/nxGahzkjTHE=
X-Received: by 2002:a05:6512:3d08:b0:43f:8f45:d670 with SMTP id
 d8-20020a0565123d0800b0043f8f45d670mr23724315lfv.587.1646357999501; Thu, 03
 Mar 2022 17:39:59 -0800 (PST)
MIME-Version: 1.0
References: <20220227134111.3254066-1-eperezma@redhat.com>
 <20220227134111.3254066-3-eperezma@redhat.com>
 <40c5bb81-b33a-9a4a-8ce0-20289b13b907@redhat.com>
 <CAJaqyWezcrc=iPLe=Y7+g9oBYfUY9pK8OM4=ZUeRgXqr9ZUWkg@mail.gmail.com>
 <1da7c2b8-ba6e-e9aa-4d55-b1345bd65ba4@redhat.com>
 <CAJaqyWfbkzi19yMAXY7gwCAoj7sakwU_R2hDc1u8+jHPfHLadA@mail.gmail.com>
In-Reply-To: <CAJaqyWfbkzi19yMAXY7gwCAoj7sakwU_R2hDc1u8+jHPfHLadA@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 4 Mar 2022 09:39:48 +0800
Message-ID: <CACGkMEvnEhpLT7zc0-w6Cfc7w6zjGi6QgMnWK=BmEcN55N3KnQ@mail.gmail.com>
Subject: Re: [PATCH v2 02/14] vhost: Add Shadow VirtQueue kick forwarding
 capabilities
To: Eugenio Perez Martin <eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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

On Thu, Mar 3, 2022 at 5:25 PM Eugenio Perez Martin <eperezma@redhat.com> w=
rote:
>
> On Thu, Mar 3, 2022 at 8:12 AM Jason Wang <jasowang@redhat.com> wrote:
> >
> >
> > =E5=9C=A8 2022/3/2 =E4=B8=8A=E5=8D=882:49, Eugenio Perez Martin =E5=86=
=99=E9=81=93:
> > > On Mon, Feb 28, 2022 at 3:57 AM Jason Wang<jasowang@redhat.com>  wrot=
e:
> > >> =E5=9C=A8 2022/2/27 =E4=B8=8B=E5=8D=889:40, Eugenio P=C3=A9rez =E5=
=86=99=E9=81=93:
> > >>> At this mode no buffer forwarding will be performed in SVQ mode: Qe=
mu
> > >>> will just forward the guest's kicks to the device.
> > >>>
> > >>> Host memory notifiers regions are left out for simplicity, and they=
 will
> > >>> not be addressed in this series.
> > >>>
> > >>> Signed-off-by: Eugenio P=C3=A9rez<eperezma@redhat.com>
> > >>> ---
> > >>>    hw/virtio/vhost-shadow-virtqueue.h |  14 +++
> > >>>    include/hw/virtio/vhost-vdpa.h     |   4 +
> > >>>    hw/virtio/vhost-shadow-virtqueue.c |  52 +++++++++++
> > >>>    hw/virtio/vhost-vdpa.c             | 145 +++++++++++++++++++++++=
+++++-
> > >>>    4 files changed, 213 insertions(+), 2 deletions(-)
> > >>>
> > >>> diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-s=
hadow-virtqueue.h
> > >>> index f1519e3c7b..1cbc87d5d8 100644
> > >>> --- a/hw/virtio/vhost-shadow-virtqueue.h
> > >>> +++ b/hw/virtio/vhost-shadow-virtqueue.h
> > >>> @@ -18,8 +18,22 @@ typedef struct VhostShadowVirtqueue {
> > >>>        EventNotifier hdev_kick;
> > >>>        /* Shadow call notifier, sent to vhost */
> > >>>        EventNotifier hdev_call;
> > >>> +
> > >>> +    /*
> > >>> +     * Borrowed virtqueue's guest to host notifier. To borrow it i=
n this event
> > >>> +     * notifier allows to recover the VhostShadowVirtqueue from th=
e event loop
> > >>> +     * easily. If we use the VirtQueue's one, we don't have an eas=
y way to
> > >>> +     * retrieve VhostShadowVirtqueue.
> > >>> +     *
> > >>> +     * So shadow virtqueue must not clean it, or we would lose Vir=
tQueue one.
> > >>> +     */
> > >>> +    EventNotifier svq_kick;
> > >>>    } VhostShadowVirtqueue;
> > >>>
> > >>> +void vhost_svq_set_svq_kick_fd(VhostShadowVirtqueue *svq, int svq_=
kick_fd);
> > >>> +
> > >>> +void vhost_svq_stop(VhostShadowVirtqueue *svq);
> > >>> +
> > >>>    VhostShadowVirtqueue *vhost_svq_new(void);
> > >>>
> > >>>    void vhost_svq_free(gpointer vq);
> > >>> diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vho=
st-vdpa.h
> > >>> index 3ce79a646d..009a9f3b6b 100644
> > >>> --- a/include/hw/virtio/vhost-vdpa.h
> > >>> +++ b/include/hw/virtio/vhost-vdpa.h
> > >>> @@ -12,6 +12,8 @@
> > >>>    #ifndef HW_VIRTIO_VHOST_VDPA_H
> > >>>    #define HW_VIRTIO_VHOST_VDPA_H
> > >>>
> > >>> +#include <gmodule.h>
> > >>> +
> > >>>    #include "hw/virtio/virtio.h"
> > >>>    #include "standard-headers/linux/vhost_types.h"
> > >>>
> > >>> @@ -27,6 +29,8 @@ typedef struct vhost_vdpa {
> > >>>        bool iotlb_batch_begin_sent;
> > >>>        MemoryListener listener;
> > >>>        struct vhost_vdpa_iova_range iova_range;
> > >>> +    bool shadow_vqs_enabled;
> > >>> +    GPtrArray *shadow_vqs;
> > >>>        struct vhost_dev *dev;
> > >>>        VhostVDPAHostNotifier notifier[VIRTIO_QUEUE_MAX];
> > >>>    } VhostVDPA;
> > >>> diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-s=
hadow-virtqueue.c
> > >>> index 019cf1950f..a5d0659f86 100644
> > >>> --- a/hw/virtio/vhost-shadow-virtqueue.c
> > >>> +++ b/hw/virtio/vhost-shadow-virtqueue.c
> > >>> @@ -11,6 +11,56 @@
> > >>>    #include "hw/virtio/vhost-shadow-virtqueue.h"
> > >>>
> > >>>    #include "qemu/error-report.h"
> > >>> +#include "qemu/main-loop.h"
> > >>> +#include "linux-headers/linux/vhost.h"
> > >>> +
> > >>> +/** Forward guest notifications */
> > >>> +static void vhost_handle_guest_kick(EventNotifier *n)
> > >>> +{
> > >>> +    VhostShadowVirtqueue *svq =3D container_of(n, VhostShadowVirtq=
ueue,
> > >>> +                                             svq_kick);
> > >>> +    event_notifier_test_and_clear(n);
> > >>> +    event_notifier_set(&svq->hdev_kick);
> > >>> +}
> > >>> +
> > >>> +/**
> > >>> + * Set a new file descriptor for the guest to kick the SVQ and not=
ify for avail
> > >>> + *
> > >>> + * @svq          The svq
> > >>> + * @svq_kick_fd  The svq kick fd
> > >>> + *
> > >>> + * Note that the SVQ will never close the old file descriptor.
> > >>> + */
> > >>> +void vhost_svq_set_svq_kick_fd(VhostShadowVirtqueue *svq, int svq_=
kick_fd)
> > >>> +{
> > >>> +    EventNotifier *svq_kick =3D &svq->svq_kick;
> > >>> +    bool poll_stop =3D VHOST_FILE_UNBIND !=3D event_notifier_get_f=
d(svq_kick);
> > >> I wonder if this is robust. E.g is there any chance that may end up =
with
> > >> both poll_stop and poll_start are false?
> > >>
> > > I cannot make that happen in qemu, but the function supports that cas=
e
> > > well: It will do nothing. It's more or less the same code as used in
> > > the vhost kernel, and is the expected behaviour if you send two
> > > VHOST_FILE_UNBIND one right after another to me.
> >
> >
> > I would think it's just stop twice.
> >
> >
> > >
> > >> If not, can we simple detect poll_stop as below and treat !poll_star=
t
> > >> and poll_stop?
> > >>
> > > I'm not sure what does it add. Is there an unexpected consequence wit=
h
> > > the current do-nothing behavior I've missed?
> >
> >
> > I'm not sure, but it feels odd if poll_start is not the reverse value o=
f
> > poll_stop.
> >
>
> If we want to not to restrict the inputs, we need to handle for situation=
s:
>
> a) old_fd =3D -1, new_fd =3D -1,
>
> This is the situation you described, and it's basically a no-op.
> poll_stop =3D=3D poll_start =3D=3D false.
>
> If we make poll_stop =3D true and poll_stop =3D false, we call
> event_notifier_set_handler(-1, ...). Hopefully it will return just an
> error.
>
> If we make poll_stop =3D false and poll_stop =3D true, we are calling
> event_notifier_set(-1) and event_notifier_set_handler(-1,
> poll_callback). Same situation, hopefully an error, but unexpected.
>
> b) old_fd =3D -1, new_fd =3D >-1,
>
> We need to start polling the new_fd. No need for stop polling the
> old_fd, since we are not polling it actually.
>
> c) old_fd =3D >-1, new_fd =3D >-1,
>
> We need to stop polling the old_fd and start polling the new one.
>
> If we make poll_stop =3D true and poll_stop =3D false, we don't register =
a
> new polling function for the new kick_fd so we will miss guest's
> kicks.
>
> If we make poll_stop =3D false and poll_stop =3D true, we keep polling th=
e
> old file descriptor too, so whatever it gets assigned to could call
> vhost_handle_guest_kick if it does not override poll callback.
>
> We *could* detect if old_fd =3D=3D new_fd so we skip all the work, but I
> think it is not worth it to complicate the code, since we're only
> being called with the kick_fd at dev start.
>
> d) c) old_fd =3D >-1, new_fd =3D -1,
>
> We need to stop polling, or we could get invalid kicks callbacks if it
> gets writed after this. No need to poll anything beyond this.

I see, thanks for the clarification.

>
> > Thanks
> >
> >
>


