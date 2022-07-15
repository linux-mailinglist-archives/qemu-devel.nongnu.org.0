Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F02575A28
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jul 2022 06:05:26 +0200 (CEST)
Received: from localhost ([::1]:53922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCCZx-0005C3-Pz
	for lists+qemu-devel@lfdr.de; Fri, 15 Jul 2022 00:05:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oCCY7-0003mm-5r
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 00:03:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55158)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oCCY4-0000Os-BM
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 00:03:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657857807;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2H2WkTIj4shoePiRMhucSmjpGOu6jmKpDDjOxL/oy0U=;
 b=ZvbZORBtRo9kR9Ot3pPh2mhHUlRH7MEDgaZLTr2h/cad/uPWaZqKKLdmTaX1EsrEOo4X8V
 uKF0QkjTJwjF1DoMVFDxLfGi4dXEEe/25peE3SLUzm1/vA29Vk5ebU0LXU0r6D0ejzzweq
 svHQOI4kgVeRzVbp5InHgnE4dN10ERI=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-176-wB00eK5WMCiSW33No7eZPw-1; Fri, 15 Jul 2022 00:03:20 -0400
X-MC-Unique: wB00eK5WMCiSW33No7eZPw-1
Received: by mail-lj1-f197.google.com with SMTP id
 g25-20020a2e9e59000000b0025baf0470feso782272ljk.8
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 21:03:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2H2WkTIj4shoePiRMhucSmjpGOu6jmKpDDjOxL/oy0U=;
 b=CwsyJLimRq1pXjl9CFlfpEF3pB3N7ERywSFmhvtOH96XVAzx/MJuRpmkEpnBycIh0r
 2yWxlPdgMzPDLaOZJ60yheBIJdy4OS/f/d2KWyNtBHEIV53W+dw2lbk8d0LdjN9BroE/
 +tT6wD0KL7takxKdRDih3zzlepcFXMA9RIEtZk0MtgUf6DMtbPcXR+VYMN4fZ2EeQl+Y
 XvEt1P3cEKiCZjmdvV27VBZcgMAx3eniIir8y+yJ++6/lDhidGMYCw5tKWzyonZt59f4
 HDE4N870btNuag24NsOzgjoRkWkZKGuvMkmwTLvqRjhJMkcvHhtfNrQyD2pLtinsw2YL
 viAA==
X-Gm-Message-State: AJIora+UAk/VsIu4+4GH0h6eUeez9yH/d3i1hi9tNo1Omt+rgYWAhSX5
 19aYG1StTgdADjTWU5VqjLnLFXIvazpr5fFlR9LyNrRCgDTnkIWr1dcQmZariOHc7A4MqQj0gxB
 uONt30a+C7xn4quoBGvAGeSG4cNGNVTA=
X-Received: by 2002:a2e:9e17:0:b0:25d:7654:4c6b with SMTP id
 e23-20020a2e9e17000000b0025d76544c6bmr6103295ljk.130.1657857798749; 
 Thu, 14 Jul 2022 21:03:18 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tJ+g+bULh9erbpFRQRnEwkiSp4yYRKx659aT22dKIEAN1FVGB30wVGQoEnRAPR9DQVpt7PZc1d187KXam89kk=
X-Received: by 2002:a2e:9e17:0:b0:25d:7654:4c6b with SMTP id
 e23-20020a2e9e17000000b0025d76544c6bmr6103270ljk.130.1657857798471; Thu, 14
 Jul 2022 21:03:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220714163150.2536327-1-eperezma@redhat.com>
 <20220714163150.2536327-19-eperezma@redhat.com>
In-Reply-To: <20220714163150.2536327-19-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 15 Jul 2022 12:03:07 +0800
Message-ID: <CACGkMEsmSygJVtuXMZ_Fj4xgL-xb65UqGFXFOv1FE+wzbKeVHA@mail.gmail.com>
Subject: Re: [PATCH v2 18/19] vdpa: Add device migration blocker
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
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

On Fri, Jul 15, 2022 at 12:32 AM Eugenio P=C3=A9rez <eperezma@redhat.com> w=
rote:
>
> Since the vhost-vdpa device is exposing _F_LOG,

I may miss something but I think it doesn't?

Note that the features were fetched from the vDPA parent.

Thanks

> adding a migration blocker if
> it uses CVQ.
>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> ---
>  include/hw/virtio/vhost-vdpa.h |  1 +
>  hw/virtio/vhost-vdpa.c         | 14 ++++++++++++++
>  2 files changed, 15 insertions(+)
>
> diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdp=
a.h
> index 1111d85643..d10a89303e 100644
> --- a/include/hw/virtio/vhost-vdpa.h
> +++ b/include/hw/virtio/vhost-vdpa.h
> @@ -35,6 +35,7 @@ typedef struct vhost_vdpa {
>      bool shadow_vqs_enabled;
>      /* IOVA mapping used by the Shadow Virtqueue */
>      VhostIOVATree *iova_tree;
> +    Error *migration_blocker;
>      GPtrArray *shadow_vqs;
>      const VhostShadowVirtqueueOps *shadow_vq_ops;
>      void *shadow_vq_ops_opaque;
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index beaaa7049a..795ed5a049 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -20,6 +20,7 @@
>  #include "hw/virtio/vhost-shadow-virtqueue.h"
>  #include "hw/virtio/vhost-vdpa.h"
>  #include "exec/address-spaces.h"
> +#include "migration/blocker.h"
>  #include "qemu/cutils.h"
>  #include "qemu/main-loop.h"
>  #include "cpu.h"
> @@ -1022,6 +1023,13 @@ static bool vhost_vdpa_svqs_start(struct vhost_dev=
 *dev)
>          return true;
>      }
>
> +    if (v->migration_blocker) {
> +        int r =3D migrate_add_blocker(v->migration_blocker, &err);
> +        if (unlikely(r < 0)) {
> +            goto err_migration_blocker;
> +        }
> +    }
> +
>      for (i =3D 0; i < v->shadow_vqs->len; ++i) {
>          VirtQueue *vq =3D virtio_get_queue(dev->vdev, dev->vq_index + i)=
;
>          VhostShadowVirtqueue *svq =3D g_ptr_array_index(v->shadow_vqs, i=
);
> @@ -1064,6 +1072,9 @@ err:
>          vhost_svq_stop(svq);
>      }
>
> +err_migration_blocker:
> +    error_reportf_err(err, "Cannot setup SVQ %u: ", i);
> +
>      return false;
>  }
>
> @@ -1083,6 +1094,9 @@ static bool vhost_vdpa_svqs_stop(struct vhost_dev *=
dev)
>          }
>      }
>
> +    if (v->migration_blocker) {
> +        migrate_del_blocker(v->migration_blocker);
> +    }
>      return true;
>  }
>
> --
> 2.31.1
>


