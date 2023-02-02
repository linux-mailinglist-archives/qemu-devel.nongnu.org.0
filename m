Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B8A688241
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 16:29:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNbWJ-0000Yl-V6; Thu, 02 Feb 2023 10:29:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pNbWG-0000Xg-2Q
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 10:29:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pNbWC-000626-EE
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 10:28:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675351732;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GC5rbXuc9//14O0H48a/dMQ9WZqoUsGq8vOfj+BlrgQ=;
 b=IvzEqJKOW2GlLpj5sUwgc1/OdK+Tc8Krx8w26d1xIKpXldhrH25CSCWC4mfBCV3j7nlv1t
 mBX5Cvoif6wXmnHurU0fOuOk/ikXrfUNlESA2JCy4RcMhYBTET7tEziu0oJBdqzQ5QaQxK
 c41QAjfdXVK0sbu4NEuBqsUgFDa5NjQ=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-527-xl4hcwuSOvG8BIwT4R0n5A-1; Thu, 02 Feb 2023 10:28:51 -0500
X-MC-Unique: xl4hcwuSOvG8BIwT4R0n5A-1
Received: by mail-yb1-f198.google.com with SMTP id
 o131-20020a25d789000000b00859dddecf8eso1856906ybg.17
 for <qemu-devel@nongnu.org>; Thu, 02 Feb 2023 07:28:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GC5rbXuc9//14O0H48a/dMQ9WZqoUsGq8vOfj+BlrgQ=;
 b=ZZyNwl1ZeuXKqfbRhG/R2FJGCaPKUhkjxI0zzLD7K8Itx+yOWLtBLRiLgjL/3HDtqO
 F4x44kdrGj2FFOE4ClluDLl5Pe1/BD79Zdm3HB+3S2KuUs5hp61G9vLGHeXqY3yFyOf4
 VddlmuuHn9CjOZQxZyRhqjDy2piStIMjtSiZKr3AXLb/beIF9csoS8IdbVxEqLT5+0VZ
 XitSLoq0Q632PLSmbKXTDR2qz680AhRmRZjUKOPQ0gOvEUwidYdNz114KhhJiG5www08
 CKX3sZneccpzhrCAPTAcdDEKlYzUszWACtqZdKr03Fjw/R5f4hmqZkNlXbTGQMHUkmSO
 P3NA==
X-Gm-Message-State: AO0yUKUlUpY9aG/+0tQNJJSOB7rjilGSXQ5aubrMt8Ju2nUXyPQbgEnt
 jUo4QUJpMWhLgLSTrrEEOJZ/yRAxxXGRzeNYQL1/W4cdv3oIrr0C524X1XUojHDTHr0SIkHeb3i
 UvFaOB6+AT2N5bpSCYe2KllxWnJqKbIw=
X-Received: by 2002:a81:ae0d:0:b0:4e0:8133:2a5a with SMTP id
 m13-20020a81ae0d000000b004e081332a5amr786986ywh.187.1675351730596; 
 Thu, 02 Feb 2023 07:28:50 -0800 (PST)
X-Google-Smtp-Source: AK7set/LAYoRGyGbVcnLdXZt4lz7F2XrbNKF4z4PxsMmwcZNCAYr9mVhsqU2R6Vd3IWjzmR7SM/2BM/k8rZuyOsG2xc=
X-Received: by 2002:a81:ae0d:0:b0:4e0:8133:2a5a with SMTP id
 m13-20020a81ae0d000000b004e081332a5amr786968ywh.187.1675351730303; Thu, 02
 Feb 2023 07:28:50 -0800 (PST)
MIME-Version: 1.0
References: <20230112172434.760850-1-eperezma@redhat.com>
 <20230112172434.760850-12-eperezma@redhat.com>
 <d434e204-6847-f34f-258a-9ae1cf6328ce@oracle.com>
In-Reply-To: <d434e204-6847-f34f-258a-9ae1cf6328ce@oracle.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Thu, 2 Feb 2023 16:28:13 +0100
Message-ID: <CAJaqyWf5mNxjeAskVjLTFu08LpPxiHffhrtknKB75aUAEayEcQ@mail.gmail.com>
Subject: Re: [RFC v2 11/13] vdpa: add vdpa net migration state notifier
To: Si-Wei Liu <si-wei.liu@oracle.com>
Cc: qemu-devel@nongnu.org, Liuxiangdong <liuxiangdong5@huawei.com>, 
 Zhu Lingshan <lingshan.zhu@intel.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, 
 alvaro.karsz@solid-run.com, Shannon Nelson <snelson@pensando.io>, 
 Laurent Vivier <lvivier@redhat.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 Gautam Dawar <gdawar@xilinx.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Cindy Lu <lulu@redhat.com>, 
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Parav Pandit <parav@mellanox.com>
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

On Thu, Feb 2, 2023 at 2:53 AM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
>
>
>
> On 1/12/2023 9:24 AM, Eugenio P=C3=A9rez wrote:
> > This allows net to restart the device backend to configure SVQ on it.
> >
> > Ideally, these changes should not be net specific. However, the vdpa ne=
t
> > backend is the one with enough knowledge to configure everything becaus=
e
> > of some reasons:
> > * Queues might need to be shadowed or not depending on its kind (contro=
l
> >    vs data).
> > * Queues need to share the same map translations (iova tree).
> >
> > Because of that it is cleaner to restart the whole net backend and
> > configure again as expected, similar to how vhost-kernel moves between
> > userspace and passthrough.
> >
> > If more kinds of devices need dynamic switching to SVQ we can create a
> > callback struct like VhostOps and move most of the code there.
> > VhostOps cannot be reused since all vdpa backend share them, and to
> > personalize just for networking would be too heavy.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >   net/vhost-vdpa.c | 84 +++++++++++++++++++++++++++++++++++++++++++++++=
+
> >   1 file changed, 84 insertions(+)
> >
> > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > index 5d7ad6e4d7..f38532b1df 100644
> > --- a/net/vhost-vdpa.c
> > +++ b/net/vhost-vdpa.c
> > @@ -26,6 +26,8 @@
> >   #include <err.h>
> >   #include "standard-headers/linux/virtio_net.h"
> >   #include "monitor/monitor.h"
> > +#include "migration/migration.h"
> > +#include "migration/misc.h"
> >   #include "migration/blocker.h"
> >   #include "hw/virtio/vhost.h"
> >
> > @@ -33,6 +35,7 @@
> >   typedef struct VhostVDPAState {
> >       NetClientState nc;
> >       struct vhost_vdpa vhost_vdpa;
> > +    Notifier migration_state;
> >       Error *migration_blocker;
> >       VHostNetState *vhost_net;
> >
> > @@ -243,10 +246,86 @@ static VhostVDPAState *vhost_vdpa_net_first_nc_vd=
pa(VhostVDPAState *s)
> >       return DO_UPCAST(VhostVDPAState, nc, nc0);
> >   }
> >
> > +static void vhost_vdpa_net_log_global_enable(VhostVDPAState *s, bool e=
nable)
> > +{
> > +    struct vhost_vdpa *v =3D &s->vhost_vdpa;
> > +    VirtIONet *n;
> > +    VirtIODevice *vdev;
> > +    int data_queue_pairs, cvq, r;
> > +    NetClientState *peer;
> > +
> > +    /* We are only called on the first data vqs and only if x-svq is n=
ot set */
> > +    if (s->vhost_vdpa.shadow_vqs_enabled =3D=3D enable) {
> > +        return;
> > +    }
> > +
> > +    vdev =3D v->dev->vdev;
> > +    n =3D VIRTIO_NET(vdev);
> > +    if (!n->vhost_started) {
> > +        return;
> > +    }
> > +
> > +    if (enable) {
> > +        ioctl(v->device_fd, VHOST_VDPA_SUSPEND);
> > +    }
> > +    data_queue_pairs =3D n->multiqueue ? n->max_queue_pairs : 1;
> > +    cvq =3D virtio_vdev_has_feature(vdev, VIRTIO_NET_F_CTRL_VQ) ?
> > +                                  n->max_ncs - n->max_queue_pairs : 0;
> > +    vhost_net_stop(vdev, n->nic->ncs, data_queue_pairs, cvq);
> > +
> > +    peer =3D s->nc.peer;
> > +    for (int i =3D 0; i < data_queue_pairs + cvq; i++) {
> > +        VhostVDPAState *vdpa_state;
> > +        NetClientState *nc;
> > +
> > +        if (i < data_queue_pairs) {
> > +            nc =3D qemu_get_peer(peer, i);
> > +        } else {
> > +            nc =3D qemu_get_peer(peer, n->max_queue_pairs);
> > +        }
> > +
> > +        vdpa_state =3D DO_UPCAST(VhostVDPAState, nc, nc);
> > +        vdpa_state->vhost_vdpa.shadow_data =3D enable;
> > +
> > +        if (i < data_queue_pairs) {
> > +            /* Do not override CVQ shadow_vqs_enabled */
> > +            vdpa_state->vhost_vdpa.shadow_vqs_enabled =3D enable;
> > +        }
> > +    }
> > +
> > +    r =3D vhost_net_start(vdev, n->nic->ncs, data_queue_pairs, cvq);
> As the first revision, this method (vhost_net_stop followed by
> vhost_net_start) should be fine for software vhost-vdpa backend for e.g.
> vp_vdpa and vdpa_sim_net. However, I would like to get your attention
> that this method implies substantial blackout time for mode switching on
> real hardware - get a full cycle of device reset of getting memory
> mappings torn down, unpin & repin same set of pages, and set up new
> mapping would take very significant amount of time, especially for a
> large VM. Maybe we can do:
>

Right, I think this is something that deserves optimization in the future.

Note that we must replace the mappings anyway, with all passthrough
queues stopped. This is because SVQ vrings are not in the guest space.
The pin can be skipped though, I think that's a low hand fruit here.

If any, we can track guest's IOVA and add SVQ vrings in a hole. If
guest's IOVA layout changes, we can translate it then to a new
location. That way we only need one map operation in the worst case.
I'm omitting the lookup time here, but I still should be worth it.

But as you mention I think it is not worth complicating this series
and we can think about it on top. We can start building it on top of
your suggestions for sure.

> 1) replace reset with the RESUME feature that was just added to the
> vhost-vdpa ioctls in kernel

We cannot change vring addresses just with a SUSPEND / RESUME.

We could do it with the VIRTIO_F_RING_RESET feature though. Would it
be advantageous to the device?

> 2) add new vdpa ioctls to allow iova range rebound to new virtual
> address for QEMU's shadow vq or back to device's vq

Actually, if the device supports ASID we can allocate ASID 1 to that
purpose. At this moment only CVQ vrings and control buffers are there
when the device is passthrough.

But this doesn't solve the problem if we need to send all SVQ
translation to the device on-chip IOMMU, doesn't it? We must clear all
of it and send the new one to the device anyway.

> 3) use a light-weighted sequence of suspend+rebind+resume to switch mode
> on the fly instead of getting through the whole reset+restart cycle
>

I think this is the same as 1, isn't it?

> I suspect the same idea could even be used to address high live
> migration downtime seen on hardware vdpa device. What do you think?
>

I think this is a great start for sure! Some questions:
a) Is the time on reprogramming on-chip IOMMU comparable to program
regular IOMMU? If it is the case it should be easier to find vdpa
devices with support for _F_RESET soon.
b) Not to merge on master, but it is possible to add an artificial
delay on vdpa_sim that simulates the properties of the delay of IOMMU?
In that line, have you observed if it is linear with the size of the
memory, with the number of maps, other factors..?

Thanks!

> Thanks,
> -Siwei
>
> > +    if (unlikely(r < 0)) {
> > +        error_report("unable to start vhost net: %s(%d)", g_strerror(-=
r), -r);
> > +    }
> > +}
> > +
> > +static void vdpa_net_migration_state_notifier(Notifier *notifier, void=
 *data)
> > +{
> > +    MigrationState *migration =3D data;
> > +    VhostVDPAState *s =3D container_of(notifier, VhostVDPAState,
> > +                                     migration_state);
> > +
> > +    switch (migration->state) {
> > +    case MIGRATION_STATUS_SETUP:
> > +        vhost_vdpa_net_log_global_enable(s, true);
> > +        return;
> > +
> > +    case MIGRATION_STATUS_CANCELLING:
> > +    case MIGRATION_STATUS_CANCELLED:
> > +    case MIGRATION_STATUS_FAILED:
> > +        vhost_vdpa_net_log_global_enable(s, false);
> > +        return;
> > +    };
> > +}
> > +
> >   static void vhost_vdpa_net_data_start_first(VhostVDPAState *s)
> >   {
> >       struct vhost_vdpa *v =3D &s->vhost_vdpa;
> >
> > +    if (v->feature_log) {
> > +        add_migration_state_change_notifier(&s->migration_state);
> > +    }
> > +
> >       if (v->shadow_vqs_enabled) {
> >           v->iova_tree =3D vhost_iova_tree_new(v->iova_range.first,
> >                                              v->iova_range.last);
> > @@ -280,6 +359,10 @@ static void vhost_vdpa_net_client_stop(NetClientSt=
ate *nc)
> >
> >       assert(nc->info->type =3D=3D NET_CLIENT_DRIVER_VHOST_VDPA);
> >
> > +    if (s->vhost_vdpa.index =3D=3D 0 && s->vhost_vdpa.feature_log) {
> > +        remove_migration_state_change_notifier(&s->migration_state);
> > +    }
> > +
> >       dev =3D s->vhost_vdpa.dev;
> >       if (dev->vq_index + dev->nvqs =3D=3D dev->vq_index_end) {
> >           g_clear_pointer(&s->vhost_vdpa.iova_tree, vhost_iova_tree_del=
ete);
> > @@ -767,6 +850,7 @@ static NetClientState *net_vhost_vdpa_init(NetClien=
tState *peer,
> >       s->vhost_vdpa.device_fd =3D vdpa_device_fd;
> >       s->vhost_vdpa.index =3D queue_pair_index;
> >       s->always_svq =3D svq;
> > +    s->migration_state.notify =3D vdpa_net_migration_state_notifier;
> >       s->vhost_vdpa.shadow_vqs_enabled =3D svq;
> >       s->vhost_vdpa.iova_range =3D iova_range;
> >       s->vhost_vdpa.shadow_data =3D svq;
>


