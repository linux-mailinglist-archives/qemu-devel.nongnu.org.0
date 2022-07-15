Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF2B575B15
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jul 2022 07:44:20 +0200 (CEST)
Received: from localhost ([::1]:53964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCE7f-00054b-V3
	for lists+qemu-devel@lfdr.de; Fri, 15 Jul 2022 01:44:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oCE3v-0001vs-23
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 01:40:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oCE3s-0005ai-V0
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 01:40:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657863624;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wl21EM1FFoMcGgF5i2HD0d0yDMyhSRatyzX4e9wfarA=;
 b=VXEOOSnjDupMjWmiTLTHasHNT3zWQMNYDsm8KzqO1wBO9Tv9iVmrjX0LKuDpL4HGjeB/h6
 d1MzfadGRIeO6Fb7hWjlIdzsgEVO1wBBmswxUafS99Wxcm+8dPRFjOYuMj5I7LcS3W6i7m
 Kac/nvooiecofpVe9WAVnphLf3g+lQ0=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-587-DuKP8RjxNeGt1hCMouTuxA-1; Fri, 15 Jul 2022 01:40:23 -0400
X-MC-Unique: DuKP8RjxNeGt1hCMouTuxA-1
Received: by mail-qk1-f197.google.com with SMTP id
 n15-20020a05620a294f00b006b5768a0ed0so2713038qkp.7
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 22:40:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wl21EM1FFoMcGgF5i2HD0d0yDMyhSRatyzX4e9wfarA=;
 b=k4tNPWVURGgjInmWvgtob8VQNJ+AUR0I6F5K+eIwOSLH0B2YoYSk/Ia3RVQBQDJrYf
 dFKOcB2HSXrDvK5cbouWrUCU0XUl7y1wG2W4rnP+jp3gR39orGwwYwFHeKMQAsfwhDwU
 4bOlHyChoTN1WTMSxhzM60gfWJE1cpc833QC/ASZtcYWQUMfcKUaWRUtg4sRe85G46Pc
 n2KiHsr05n0JfcANvzIYp0oouol+HrkSh9aVDC1k1BUtioVx1+7a1Om27lKTW3DrKyVw
 MWd5d5BB4ExFz6oQct8A7x8yDDe6eKyuJ5y+7HateVqZiCXoj28RxJ4TVz7+ZXrw0KpB
 9H6A==
X-Gm-Message-State: AJIora+l2WBkEOvQsHZkIXPRhO3GbfxMomENOxjd5L3wzmcfusp9kDId
 svG0c2opuiFh0hNel8/TzuVqNJdSlp3fxOalfgoIPgA4yvsVqojzo7emF9jeuk9BrEDSsVIo42q
 jCAJMAjeTMRMRCZxRLkJEOf5DZx8GSP0=
X-Received: by 2002:a05:6214:5085:b0:472:e878:866a with SMTP id
 kk5-20020a056214508500b00472e878866amr10764381qvb.2.1657863622633; 
 Thu, 14 Jul 2022 22:40:22 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v5/cPQhOMeTkoo1ianOyNR9ZVLVMgIT39XoswnsiqmHpVUMT+07sRapnz3Ws0dqzQO90v009x2lQDPVhn45LM=
X-Received: by 2002:a05:6214:5085:b0:472:e878:866a with SMTP id
 kk5-20020a056214508500b00472e878866amr10764367qvb.2.1657863622388; Thu, 14
 Jul 2022 22:40:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220714163150.2536327-1-eperezma@redhat.com>
 <20220714163150.2536327-19-eperezma@redhat.com>
 <CACGkMEsmSygJVtuXMZ_Fj4xgL-xb65UqGFXFOv1FE+wzbKeVHA@mail.gmail.com>
In-Reply-To: <CACGkMEsmSygJVtuXMZ_Fj4xgL-xb65UqGFXFOv1FE+wzbKeVHA@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Fri, 15 Jul 2022 07:39:46 +0200
Message-ID: <CAJaqyWcYWF8Q565XyvOSM6WfMK9kgnyqCd32tZpy2Tgx2UwxNQ@mail.gmail.com>
Subject: Re: [PATCH v2 18/19] vdpa: Add device migration blocker
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Gautam Dawar <gdawar@xilinx.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Eric Blake <eblake@redhat.com>, 
 Zhu Lingshan <lingshan.zhu@intel.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Parav Pandit <parav@mellanox.com>, 
 Laurent Vivier <lvivier@redhat.com>, Liuxiangdong <liuxiangdong5@huawei.com>, 
 Eli Cohen <eli@mellanox.com>, Cindy Lu <lulu@redhat.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>
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

On Fri, Jul 15, 2022 at 6:03 AM Jason Wang <jasowang@redhat.com> wrote:
>
> On Fri, Jul 15, 2022 at 12:32 AM Eugenio P=C3=A9rez <eperezma@redhat.com>=
 wrote:
> >
> > Since the vhost-vdpa device is exposing _F_LOG,
>
> I may miss something but I think it doesn't?
>

It's at vhost_vdpa_get_features. As long as SVQ is enabled, it's
exposing VHOST_F_LOG_ALL.

Thanks!

> Note that the features were fetched from the vDPA parent.
>
> Thanks
>
> > adding a migration blocker if
> > it uses CVQ.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >  include/hw/virtio/vhost-vdpa.h |  1 +
> >  hw/virtio/vhost-vdpa.c         | 14 ++++++++++++++
> >  2 files changed, 15 insertions(+)
> >
> > diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-v=
dpa.h
> > index 1111d85643..d10a89303e 100644
> > --- a/include/hw/virtio/vhost-vdpa.h
> > +++ b/include/hw/virtio/vhost-vdpa.h
> > @@ -35,6 +35,7 @@ typedef struct vhost_vdpa {
> >      bool shadow_vqs_enabled;
> >      /* IOVA mapping used by the Shadow Virtqueue */
> >      VhostIOVATree *iova_tree;
> > +    Error *migration_blocker;
> >      GPtrArray *shadow_vqs;
> >      const VhostShadowVirtqueueOps *shadow_vq_ops;
> >      void *shadow_vq_ops_opaque;
> > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > index beaaa7049a..795ed5a049 100644
> > --- a/hw/virtio/vhost-vdpa.c
> > +++ b/hw/virtio/vhost-vdpa.c
> > @@ -20,6 +20,7 @@
> >  #include "hw/virtio/vhost-shadow-virtqueue.h"
> >  #include "hw/virtio/vhost-vdpa.h"
> >  #include "exec/address-spaces.h"
> > +#include "migration/blocker.h"
> >  #include "qemu/cutils.h"
> >  #include "qemu/main-loop.h"
> >  #include "cpu.h"
> > @@ -1022,6 +1023,13 @@ static bool vhost_vdpa_svqs_start(struct vhost_d=
ev *dev)
> >          return true;
> >      }
> >
> > +    if (v->migration_blocker) {
> > +        int r =3D migrate_add_blocker(v->migration_blocker, &err);
> > +        if (unlikely(r < 0)) {
> > +            goto err_migration_blocker;
> > +        }
> > +    }
> > +
> >      for (i =3D 0; i < v->shadow_vqs->len; ++i) {
> >          VirtQueue *vq =3D virtio_get_queue(dev->vdev, dev->vq_index + =
i);
> >          VhostShadowVirtqueue *svq =3D g_ptr_array_index(v->shadow_vqs,=
 i);
> > @@ -1064,6 +1072,9 @@ err:
> >          vhost_svq_stop(svq);
> >      }
> >
> > +err_migration_blocker:
> > +    error_reportf_err(err, "Cannot setup SVQ %u: ", i);
> > +
> >      return false;
> >  }
> >
> > @@ -1083,6 +1094,9 @@ static bool vhost_vdpa_svqs_stop(struct vhost_dev=
 *dev)
> >          }
> >      }
> >
> > +    if (v->migration_blocker) {
> > +        migrate_del_blocker(v->migration_blocker);
> > +    }
> >      return true;
> >  }
> >
> > --
> > 2.31.1
> >
>


