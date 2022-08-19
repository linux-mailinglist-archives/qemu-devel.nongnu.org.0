Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E35A599851
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 11:08:06 +0200 (CEST)
Received: from localhost ([::1]:43706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOxz2-0002aW-N7
	for lists+qemu-devel@lfdr.de; Fri, 19 Aug 2022 05:08:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oOxsN-0000Ot-1K
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 05:01:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oOxsH-0008WL-6G
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 05:01:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660899663;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WT0snw1dVNmLQ0qo/8XcpHFMHy85GhtOFfFQWXlskJs=;
 b=B47ALaA85eyejGgVQgRrfVxJy1gCwF3lMWU14sgvB/MkDEaE10ifOi0BekTyJ5OqgzxK9i
 CMtuLn86SwUdgTRM3oqALuJjHPjB9xvFEFn+JVDF3KdI6BxdxdMimH5PGOpvRO81c67Sk3
 zfaai711sPHGIBNdU7lBfksATGm92HE=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-642-iNAm2JQQPDSvSi9yjGk5IA-1; Fri, 19 Aug 2022 05:01:02 -0400
X-MC-Unique: iNAm2JQQPDSvSi9yjGk5IA-1
Received: by mail-lf1-f71.google.com with SMTP id
 j9-20020ac24549000000b00492b0d1dea9so1240110lfm.16
 for <qemu-devel@nongnu.org>; Fri, 19 Aug 2022 02:01:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=WT0snw1dVNmLQ0qo/8XcpHFMHy85GhtOFfFQWXlskJs=;
 b=pSGXhIS2M0ffmcDN16FDgfYkpKDnePWgdfMMDaRvsR+u/OtoTJ50WYdqIxphi6QqHv
 S9k5T2AlgJKL9nI5+YD3DesiKZvrXJHo8jYhhUisTiE6cYywWtWB3hhV52EFtUHSagOQ
 iO+ogi3Hc1rrIPcsrowuE6/BLKCS4R1Gn3dLipSMVrvoo3KJM/t1rkd2/4H8UbW7NP0v
 1SwGTWUV38Sh0Kp4hGzp/5GB1uGGTmeIlEbV7RSe1xP414wXEWDDbrHF+uaXAUkqZ58Z
 SKd4PkHRtrFX87vmTwFjK4t5igfjrD5Qe9O+0vBJsuv1ToJVyQMr55Cgge5B6QjOjOZr
 1yTA==
X-Gm-Message-State: ACgBeo1GCJRyP+CwDlu7mtIJmzr1Y7OQWI9vGkZQNUd0353M6DidRxZd
 nuXKkEkjnFDpl/mURkBXfEcdY5vcLD2oLMC22C2Ksl3ESzlayZCl++fuPoJVIouEanvyN7J+MUV
 qX7QzHGdWSxCULUM1O2qQuxrtsTkI8bE=
X-Received: by 2002:a05:651c:2103:b0:25d:6478:2a57 with SMTP id
 a3-20020a05651c210300b0025d64782a57mr1901234ljq.496.1660899660960; 
 Fri, 19 Aug 2022 02:01:00 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5N8iZ/bfasLuHD7e0Ar9FNlZd986Z1gDgvQLZO+0NzZWJFsjdHkFj448APDO9/OZmcd02lRW/Gts9bX/07050=
X-Received: by 2002:a05:651c:2103:b0:25d:6478:2a57 with SMTP id
 a3-20020a05651c210300b0025d64782a57mr1901207ljq.496.1660899660561; Fri, 19
 Aug 2022 02:01:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220810184220.2362292-1-eperezma@redhat.com>
 <20220810184220.2362292-6-eperezma@redhat.com>
 <CACGkMEsEO1hqRMp6d5fR6eMCqCPD4A_8nFTd2ABswWiwX2xSFw@mail.gmail.com>
 <CAJaqyWevZ7d2iNPo68nUP_DdVExD7PMFoJjsFuQ=w5tsMmG2+A@mail.gmail.com>
In-Reply-To: <CAJaqyWevZ7d2iNPo68nUP_DdVExD7PMFoJjsFuQ=w5tsMmG2+A@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 19 Aug 2022 17:00:49 +0800
Message-ID: <CACGkMEtVBOYzxvzz-p7pN8NF=uLUO9NeVtgKtSD_fHgz8aUDLQ@mail.gmail.com>
Subject: Re: [RFC 5/8] vdpa: Add vdpa memory listener
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Cindy Lu <lulu@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
 Parav Pandit <parav@mellanox.com>, Zhu Lingshan <lingshan.zhu@intel.com>, 
 Gautam Dawar <gdawar@xilinx.com>, Liuxiangdong <liuxiangdong5@huawei.com>, 
 Cornelia Huck <cohuck@redhat.com>, Eli Cohen <eli@mellanox.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Fri, Aug 19, 2022 at 4:30 PM Eugenio Perez Martin
<eperezma@redhat.com> wrote:
>
> On Fri, Aug 19, 2022 at 8:29 AM Jason Wang <jasowang@redhat.com> wrote:
> >
> > On Thu, Aug 11, 2022 at 2:42 AM Eugenio P=C3=A9rez <eperezma@redhat.com=
> wrote:
> > >
> > > This enable net/vdpa to restart the full device when a migration is
> > > started or stopped.
> > >
> > > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> >
> > I have the following questions
> >
> > 1) any reason that we need to make this net specific? The dirty page
> > tracking via shadow virtqueue is pretty general. And the net specific
> > part was done via NetClientInfo anyhow.
>
> The listener is only used to know when migration is started / stopped,
> no need for actual memory tracking. Maybe there is a better way to do
> so?

Not sure, SaveVMHandlers?

>
> It's net specific because we are restarting the whole vhost_vdpa
> backend. We could do inside hw/virtio/vhost_vdpa.c (previous POCs did
> that way), but it's a little more complicated in my opinion. To do it
> that way, the setting of _F_LOG was detected and device were resetted
> and setup there.

Can we still have a general vhost-vdpa one and introduce net specific
callbacks? Otherwise the block may have its own listener.

>
>
> > 2) any reason we can't re-use the vhost-vdpa listener?
> >
>
> At this moment, all vhost_vdpa backend is restarted. That implies that
> the listener will be unregistered and registered again.
>
> If we use that listener, it needs either support to unregister itself,
> or store all entries in the iova tree so we can iterate them, unmap
> and map them again.

Ok, but let's double check whether or not we have another choice.
Using a dedicated listener to know if migration is started or not
seems too heavyweight.

Thanks

>
> > (Anyway, it's better to explain the reason in detail in the changelog.)
> >
>
> Sure, I can expand with this.
>
> Thanks!
>
> > Thanks
> >
> > > ---
> > >  net/vhost-vdpa.c | 87 ++++++++++++++++++++++++++++++++++++++++++++++=
++
> > >  1 file changed, 87 insertions(+)
> > >
> > > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > > index a035c89c34..4c6947feb8 100644
> > > --- a/net/vhost-vdpa.c
> > > +++ b/net/vhost-vdpa.c
> > > @@ -21,6 +21,7 @@
> > >  #include "qemu/memalign.h"
> > >  #include "qemu/option.h"
> > >  #include "qapi/error.h"
> > > +#include "exec/address-spaces.h"
> > >  #include <linux/vhost.h>
> > >  #include <sys/ioctl.h>
> > >  #include <err.h>
> > > @@ -32,6 +33,8 @@
> > >  typedef struct VhostVDPAState {
> > >      NetClientState nc;
> > >      struct vhost_vdpa vhost_vdpa;
> > > +    MemoryListener memory_listener;
> > > +
> > >      VHostNetState *vhost_net;
> > >
> > >      /* Control commands shadow buffers */
> > > @@ -110,6 +113,16 @@ static const uint64_t vdpa_svq_device_features =
=3D
> > >  #define VHOST_VDPA_NET_CVQ_PASSTHROUGH 0
> > >  #define VHOST_VDPA_NET_CVQ_ASID 1
> > >
> > > +/*
> > > + * Vdpa memory listener must run before vhost one, so vhost_vdpa doe=
s not get
> > > + * _F_LOG_ALL without SVQ.
> > > + */
> > > +#define VHOST_VDPA_NET_MEMORY_LISTENER_PRIORITY \
> > > +                                       (VHOST_DEV_MEMORY_LISTENER_PR=
IORITY - 1)
> > > +/* Check for underflow */
> > > +QEMU_BUILD_BUG_ON(VHOST_DEV_MEMORY_LISTENER_PRIORITY <
> > > +                  VHOST_VDPA_NET_MEMORY_LISTENER_PRIORITY);
> > > +
> > >  VHostNetState *vhost_vdpa_get_vhost_net(NetClientState *nc)
> > >  {
> > >      VhostVDPAState *s =3D DO_UPCAST(VhostVDPAState, nc, nc);
> > > @@ -172,6 +185,9 @@ static void vhost_vdpa_cleanup(NetClientState *nc=
)
> > >
> > >      qemu_vfree(s->cvq_cmd_out_buffer);
> > >      qemu_vfree(s->cvq_cmd_in_buffer);
> > > +    if (dev->vq_index =3D=3D 0) {
> > > +        memory_listener_unregister(&s->memory_listener);
> > > +    }
> > >      if (dev->vq_index + dev->nvqs =3D=3D dev->vq_index_end) {
> > >          g_clear_pointer(&s->vhost_vdpa.iova_tree, vhost_iova_tree_de=
lete);
> > >      }
> > > @@ -224,6 +240,69 @@ static ssize_t vhost_vdpa_receive(NetClientState=
 *nc, const uint8_t *buf,
> > >      return 0;
> > >  }
> > >
> > > +static void vhost_vdpa_net_log_global_enable(MemoryListener *listene=
r,
> > > +                                             bool enable)
> > > +{
> > > +    VhostVDPAState *s =3D container_of(listener, VhostVDPAState,
> > > +                                     memory_listener);
> > > +    struct vhost_vdpa *v =3D &s->vhost_vdpa;
> > > +    VirtIONet *n;
> > > +    VirtIODevice *vdev;
> > > +    int data_queue_pairs, cvq, r;
> > > +    NetClientState *peer;
> > > +
> > > +    if (s->always_svq || s->log_enabled =3D=3D enable) {
> > > +        return;
> > > +    }
> > > +
> > > +    s->log_enabled =3D enable;
> > > +    vdev =3D v->dev->vdev;
> > > +    n =3D VIRTIO_NET(vdev);
> > > +    if (!n->vhost_started) {
> > > +        return;
> > > +    }
> > > +
> > > +    if (enable) {
> > > +        ioctl(v->device_fd, VHOST_VDPA_SUSPEND);
> > > +    }
> > > +    data_queue_pairs =3D n->multiqueue ? n->max_queue_pairs : 1;
> > > +    cvq =3D virtio_vdev_has_feature(vdev, VIRTIO_NET_F_CTRL_VQ) ?
> > > +                                  n->max_ncs - n->max_queue_pairs : =
0;
> > > +    vhost_net_stop(vdev, n->nic->ncs, data_queue_pairs, cvq);
> > > +
> > > +    peer =3D s->nc.peer;
> > > +    for (int i =3D 0; i < data_queue_pairs + cvq; i++) {
> > > +        VhostVDPAState *vdpa_state;
> > > +        NetClientState *nc;
> > > +
> > > +        if (i < data_queue_pairs) {
> > > +            nc =3D qemu_get_peer(peer, i);
> > > +        } else {
> > > +            nc =3D qemu_get_peer(peer, n->max_queue_pairs);
> > > +        }
> > > +
> > > +        vdpa_state =3D DO_UPCAST(VhostVDPAState, nc, nc);
> > > +        vdpa_state->vhost_vdpa.listener_shadow_vq =3D enable;
> > > +        vdpa_state->vhost_vdpa.shadow_vqs_enabled =3D enable;
> > > +        vdpa_state->log_enabled =3D enable;
> > > +    }
> > > +
> > > +    r =3D vhost_net_start(vdev, n->nic->ncs, data_queue_pairs, cvq);
> > > +    if (unlikely(r < 0)) {
> > > +        error_report("unable to start vhost net: %s(%d)", g_strerror=
(-r), -r);
> > > +    }
> > > +}
> > > +
> > > +static void vhost_vdpa_net_log_global_start(MemoryListener *listener=
)
> > > +{
> > > +    vhost_vdpa_net_log_global_enable(listener, true);
> > > +}
> > > +
> > > +static void vhost_vdpa_net_log_global_stop(MemoryListener *listener)
> > > +{
> > > +    vhost_vdpa_net_log_global_enable(listener, false);
> > > +}
> > > +
> > >  static NetClientInfo net_vhost_vdpa_info =3D {
> > >          .type =3D NET_CLIENT_DRIVER_VHOST_VDPA,
> > >          .size =3D sizeof(VhostVDPAState),
> > > @@ -413,6 +492,7 @@ static void vhost_vdpa_net_cvq_stop(NetClientStat=
e *nc)
> > >
> > >      assert(nc->info->type =3D=3D NET_CLIENT_DRIVER_VHOST_VDPA);
> > >
> > > +    memory_listener_unregister(&s->memory_listener);
> > >      if (s->vhost_vdpa.shadow_vqs_enabled) {
> > >          vhost_vdpa_cvq_unmap_buf(&s->vhost_vdpa, s->cvq_cmd_out_buff=
er);
> > >          vhost_vdpa_cvq_unmap_buf(&s->vhost_vdpa, s->cvq_cmd_in_buffe=
r);
> > > @@ -671,6 +751,13 @@ static NetClientState *net_vhost_vdpa_init(NetCl=
ientState *peer,
> > >      s->vhost_vdpa.shadow_vqs_enabled =3D svq;
> > >      s->vhost_vdpa.listener_shadow_vq =3D svq;
> > >      s->vhost_vdpa.iova_tree =3D iova_tree;
> > > +    if (queue_pair_index =3D=3D 0) {
> > > +        s->memory_listener =3D (MemoryListener) {
> > > +            .log_global_start =3D vhost_vdpa_net_log_global_start,
> > > +            .log_global_stop =3D vhost_vdpa_net_log_global_stop,
> > > +        };
> > > +        memory_listener_register(&s->memory_listener, &address_space=
_memory);
> > > +    }
> > >      if (!is_datapath) {
> > >          s->cvq_cmd_out_buffer =3D qemu_memalign(qemu_real_host_page_=
size(),
> > >                                              vhost_vdpa_net_cvq_cmd_p=
age_len());
> > > --
> > > 2.31.1
> > >
> >
>


