Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3328657161F
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 11:50:03 +0200 (CEST)
Received: from localhost ([::1]:48626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBCWo-0005IJ-8Q
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 05:50:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oBCQH-00053t-PF
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 05:43:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oBCQF-0004xN-92
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 05:43:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657618993;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W/cFVyPgvctv1d1A4qetV3aBBUZz7TB638muE0LEszA=;
 b=Qc/Dg38+snYrWjkErBxj48/U3h/uEfxiS6lKfW0HMrElOAZf8Yvz8kZVhxGeNmA84pe0QP
 trucN6zjOO56rzHgDGTwEIL3cAQMw0mt2qcnR4B7CpV7X06hhD4Ho/aNe8DmnRmAxriYRw
 3rzDEl+SoVKDoSQaQ1ZG68gNGewk/88=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-211-S9JtV4ayPXOhmQSp_AxMZg-1; Tue, 12 Jul 2022 05:43:07 -0400
X-MC-Unique: S9JtV4ayPXOhmQSp_AxMZg-1
Received: by mail-qt1-f200.google.com with SMTP id
 bb14-20020a05622a1b0e00b0031eb88da7d0so2628810qtb.3
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 02:43:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=W/cFVyPgvctv1d1A4qetV3aBBUZz7TB638muE0LEszA=;
 b=DZ/tBoOgLblb+DW8xUhQjpqZB4ix+6JtEmAezBQDN/VGBUXiClsLriHDHmQ2WdzP9U
 BUZ9HmzNQJmzuf5dZH2uWh77Z/c4jtcwgt5kWRh7pNN1xCq83UYPtPlFoAUpVdFMKNPd
 d9cEyJwplX8xA3YasMMkBAc6m5MvzNIA4cxzP/Y2DZSyznMIyV6ZElHx2zUFSf7C/pi/
 7U28QSYLKZ8n4MiKWHoJs0tTUXM/eg2/+UxJlXFoioUNKZqJl6/pYSRv5GB+YtnCjViP
 plUgrOEZAiu8nT1apZXF7ov8laN/J3Uyka7d+OAGU3GpGMH9JUAl67vfX42UOBrzBglf
 L5ag==
X-Gm-Message-State: AJIora8lpIgFZ5QJFXf/dTRSfZYp/CqQ2dpuctfndLEqcwh8o1Lpf68c
 ffsCwXmon798HGbFF550ARfl9uPbg6XcLi9klnBGE2vaWyI69XBIC0hOlA9bY4p0IGjPCpwl/cC
 3ypZiNUrvEbcOWaazchw6i4gzwZZZOos=
X-Received: by 2002:a05:622a:14cc:b0:31b:f650:16af with SMTP id
 u12-20020a05622a14cc00b0031bf65016afmr16931314qtx.186.1657618987425; 
 Tue, 12 Jul 2022 02:43:07 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tXEkV62uTllmOQC16lJyHLgCA0KCdkzkmKZQKN5/3jkfwm5UuHsssfKsxZXyE5DWCJ0nfY0Gi0/MgeboV01+s=
X-Received: by 2002:a05:622a:14cc:b0:31b:f650:16af with SMTP id
 u12-20020a05622a14cc00b0031bf65016afmr16931277qtx.186.1657618986574; Tue, 12
 Jul 2022 02:43:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220706184008.1649478-1-eperezma@redhat.com>
 <20220706184008.1649478-5-eperezma@redhat.com>
 <CACGkMEv660pXKK9-E+eLhph_Pq346PVELVEryg=MKNtB0BL5eg@mail.gmail.com>
 <CAJaqyWcqmpyXGvz6OvJaO=qJG+PFyjF_M+Bm0o-9cSQ+fbuApg@mail.gmail.com>
 <e3d5000e-993b-597c-2e1e-4acc4a89bb04@redhat.com>
In-Reply-To: <e3d5000e-993b-597c-2e1e-4acc4a89bb04@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 12 Jul 2022 11:42:30 +0200
Message-ID: <CAJaqyWcudk83XCPgMSDGfGhM6k5Nf2qBceMWU_aDAHhNi=5CkQ@mail.gmail.com>
Subject: Re: [RFC PATCH v9 04/23] vhost: Get vring base from vq, not svq
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Liuxiangdong <liuxiangdong5@huawei.com>,
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

On Tue, Jul 12, 2022 at 9:42 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2022/7/8 18:10, Eugenio Perez Martin =E5=86=99=E9=81=93:
> > On Fri, Jul 8, 2022 at 11:12 AM Jason Wang <jasowang@redhat.com> wrote:
> >> On Thu, Jul 7, 2022 at 2:40 AM Eugenio P=C3=A9rez <eperezma@redhat.com=
> wrote:
> >>> The used idx used to match with this, but it will not match from the
> >>> moment we introduce svq_inject.
> >> It might be better to explain what "svq_inject" means here.
> >>
> > Good point, I'll change for the next version.
> >
> >>> Rewind all the descriptors not used by
> >>> vdpa device and get the vq state properly.
> >>>
> >>> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> >>> ---
> >>>   include/hw/virtio/virtio.h | 1 +
> >>>   hw/virtio/vhost-vdpa.c     | 7 +++----
> >>>   hw/virtio/virtio.c         | 5 +++++
> >>>   3 files changed, 9 insertions(+), 4 deletions(-)
> >>>
> >>> diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
> >>> index db1c0ddf6b..4b51ab9d06 100644
> >>> --- a/include/hw/virtio/virtio.h
> >>> +++ b/include/hw/virtio/virtio.h
> >>> @@ -302,6 +302,7 @@ hwaddr virtio_queue_get_desc_size(VirtIODevice *v=
dev, int n);
> >>>   hwaddr virtio_queue_get_avail_size(VirtIODevice *vdev, int n);
> >>>   hwaddr virtio_queue_get_used_size(VirtIODevice *vdev, int n);
> >>>   unsigned int virtio_queue_get_last_avail_idx(VirtIODevice *vdev, in=
t n);
> >>> +unsigned int virtio_queue_get_in_use(const VirtQueue *vq);
> >>>   void virtio_queue_set_last_avail_idx(VirtIODevice *vdev, int n,
> >>>                                        unsigned int idx);
> >>>   void virtio_queue_restore_last_avail_idx(VirtIODevice *vdev, int n)=
;
> >>> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> >>> index 2ee8009594..de76128030 100644
> >>> --- a/hw/virtio/vhost-vdpa.c
> >>> +++ b/hw/virtio/vhost-vdpa.c
> >>> @@ -1189,12 +1189,10 @@ static int vhost_vdpa_get_vring_base(struct v=
host_dev *dev,
> >>>                                          struct vhost_vring_state *ri=
ng)
> >>>   {
> >>>       struct vhost_vdpa *v =3D dev->opaque;
> >>> -    int vdpa_idx =3D ring->index - dev->vq_index;
> >>>       int ret;
> >>>
> >>>       if (v->shadow_vqs_enabled) {
> >>> -        VhostShadowVirtqueue *svq =3D g_ptr_array_index(v->shadow_vq=
s, vdpa_idx);
> >>> -
> >>> +        const VirtQueue *vq =3D virtio_get_queue(dev->vdev, ring->in=
dex);
> >>>           /*
> >>>            * Setting base as last used idx, so destination will see a=
s available
> >>>            * all the entries that the device did not use, including t=
he in-flight
> >>> @@ -1203,7 +1201,8 @@ static int vhost_vdpa_get_vring_base(struct vho=
st_dev *dev,
> >>>            * TODO: This is ok for networking, but other kinds of devi=
ces might
> >>>            * have problems with these retransmissions.
> >>>            */
> >>> -        ring->num =3D svq->last_used_idx;
> >>> +        ring->num =3D virtio_queue_get_last_avail_idx(dev->vdev, rin=
g->index) -
> >>> +                    virtio_queue_get_in_use(vq);
> >> I think we need to change the above comment as well otherwise readers
> >> might get confused.
> >>
> > Re-thinking this: This part has always been buggy, so this is actually
> > a fix. I'll tag it for next versions or, even better, send it
> > separately.
> >
> > But the comment still holds: We cannot use the device's used idx since
> > it could not match with the guest visible one. This is actually easy
> > to trigger if we migrate a guest many times with traffic.
>
>
> I may miss someting, maybe you can give me an example on this (I assume
> the size of the svq is the same as what guest can see).
>

The code assumes that the device's last_used_idx will be the same as
the guest one. This was true as long as the guest has booted the
device, because one used descriptor in the device always forward to
one used descriptor to the guest.

However, now we're injecting buffers to the device so we can restore
the status. These buffers only count on the device's avail / used
rings, not in the guest's one. So we got the invalid one (device's).
We want to migrate the guest's visible vring state.

>
> >
> > Maybe it's cleaner to export directly used_idx from VirtQueue? Extra
> > care is needed with packed vq, but SVQ still does not support it. I
> > didn't want to duplicate that logic in virtio ring handling.
>
>
> So two more questions here:
>
> 1) what's the reason of rewinding via virtio_queue_get_in_use()?
>

We don't want to count in-flight descriptors, like rx ones, in the vq state=
.

Re-thinking about this, maybe we could get enough information about
them only with the VirtIODevice, and expose them as new available ones
in the destination?

> 2) it looks like we could end up with underflow with the above math?
>

I don't think so, we're using the same inuse variable both times.

Thanks!


