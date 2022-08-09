Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 545FB58D47D
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 09:23:51 +0200 (CEST)
Received: from localhost ([::1]:49524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLJag-0006XP-CO
	for lists+qemu-devel@lfdr.de; Tue, 09 Aug 2022 03:23:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oLJUk-0003a3-VY
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 03:17:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32188)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oLJUj-0005cI-7Y
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 03:17:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660029460;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oOhhwmNbJLWHLMcN3uHVEODtrGWWF4rdeht9NvGbbQk=;
 b=KkuPOK9MsMOWcLD1BPuxS5IkH28TrStSiAJy71MM2OJAdjJ/RVYG60e1QZXxxMuE7vsu/w
 PA70N0z2CbA9e51Cloh2C7/+pAoVZENrOsrVglvBWQddPJeGw+DnY5fJi+BxoF2t+UM2Gu
 juBr/9C5StT4Kt86/3KXhGTYTAXt2rs=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-628-wJ2wWVUSMEmhtSLKVVtn1A-1; Tue, 09 Aug 2022 03:17:39 -0400
X-MC-Unique: wJ2wWVUSMEmhtSLKVVtn1A-1
Received: by mail-lj1-f197.google.com with SMTP id
 g3-20020a2e9cc3000000b00253cc2b5ab5so3180131ljj.19
 for <qemu-devel@nongnu.org>; Tue, 09 Aug 2022 00:17:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=oOhhwmNbJLWHLMcN3uHVEODtrGWWF4rdeht9NvGbbQk=;
 b=yHJctM5ijeB3JAJqKhV4k+j0VDBD+RhgXySGygAsTdhdx55OffqYHKBEN3+GSeGmLo
 vQan+HXGN55iOwGHufcX4OlvjckXiaFg8ntPjjXapp8EMj1oZz4eFuidKrddHcbTJHr2
 lZ34qUrIPGvKBH5A5+d4FbzinPYx9oGX9FeD7fHyosKOxCpUc0TX8y0EhMSDo/qA+Juj
 1WbvtwAaPrkMe8ldp3CVAPvIDy8R6GHHev5oZh2bPsOMrOJmByZwJQZPGffjcNp1wTaJ
 dD93ZLDeN4t51hu0lJ/pyraS6KahOjj9h9XnPuSSmjFLMV4uCHWe9aCLITIjdFg71aOP
 /gpA==
X-Gm-Message-State: ACgBeo2PkBvcygVSrJ3FmxyxLNCz6LYjf2qy6aLGDSJi3sOkmXrcEEJJ
 ko8wY+eJt6CC9NAVIPmOAJO4n5TwqN/2HK8aCmFADS7z3kb+8NORjITJtEEMc/2TdJXssKGz1Z1
 CeoNFtoMqUWaZnqdFIcnSb4nIsBAnj9M=
X-Received: by 2002:a05:6512:12c7:b0:48b:3bc4:10f4 with SMTP id
 p7-20020a05651212c700b0048b3bc410f4mr6265985lfg.411.1660029457986; 
 Tue, 09 Aug 2022 00:17:37 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4kgr2IPXUY+dGV30RpThET05RIhoVd9RGHHfzn/eBE8PlricK+XTS9koyc0z5kZk0t3+aL2OQ9b6dY5QUBiLU=
X-Received: by 2002:a05:6512:12c7:b0:48b:3bc4:10f4 with SMTP id
 p7-20020a05651212c700b0048b3bc410f4mr6265968lfg.411.1660029457705; Tue, 09
 Aug 2022 00:17:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220804182852.703398-1-eperezma@redhat.com>
 <20220804182852.703398-13-eperezma@redhat.com>
In-Reply-To: <20220804182852.703398-13-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 9 Aug 2022 15:17:26 +0800
Message-ID: <CACGkMEvAq5yNbS__g_HF5B_STCvGc-vOwhGa4iJTLsz7=y-HdQ@mail.gmail.com>
Subject: Re: [PATCH v7 12/12] vdpa: Delete CVQ migration blocker
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Cindy Lu <lulu@redhat.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Eric Blake <eblake@redhat.com>, 
 Gautam Dawar <gdawar@xilinx.com>, Markus Armbruster <armbru@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
 Liuxiangdong <liuxiangdong5@huawei.com>, Eli Cohen <eli@mellanox.com>, 
 Cornelia Huck <cohuck@redhat.com>, Zhu Lingshan <lingshan.zhu@intel.com>
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

On Fri, Aug 5, 2022 at 2:29 AM Eugenio P=C3=A9rez <eperezma@redhat.com> wro=
te:
>
> We can restore the device state in the destination via CVQ now. Remove
> the migration blocker.
>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>

Acked-by: Jason Wang <jasowang@redhat.com>

> ---
>  include/hw/virtio/vhost-vdpa.h |  1 -
>  hw/virtio/vhost-vdpa.c         | 14 --------------
>  net/vhost-vdpa.c               |  2 --
>  3 files changed, 17 deletions(-)
>
> diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdp=
a.h
> index d10a89303e..1111d85643 100644
> --- a/include/hw/virtio/vhost-vdpa.h
> +++ b/include/hw/virtio/vhost-vdpa.h
> @@ -35,7 +35,6 @@ typedef struct vhost_vdpa {
>      bool shadow_vqs_enabled;
>      /* IOVA mapping used by the Shadow Virtqueue */
>      VhostIOVATree *iova_tree;
> -    Error *migration_blocker;
>      GPtrArray *shadow_vqs;
>      const VhostShadowVirtqueueOps *shadow_vq_ops;
>      void *shadow_vq_ops_opaque;
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 7e28d2f674..4b0cfc0f56 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -1033,13 +1033,6 @@ static bool vhost_vdpa_svqs_start(struct vhost_dev=
 *dev)
>          return true;
>      }
>
> -    if (v->migration_blocker) {
> -        int r =3D migrate_add_blocker(v->migration_blocker, &err);
> -        if (unlikely(r < 0)) {
> -            return false;
> -        }
> -    }
> -
>      for (i =3D 0; i < v->shadow_vqs->len; ++i) {
>          VirtQueue *vq =3D virtio_get_queue(dev->vdev, dev->vq_index + i)=
;
>          VhostShadowVirtqueue *svq =3D g_ptr_array_index(v->shadow_vqs, i=
);
> @@ -1082,10 +1075,6 @@ err:
>          vhost_svq_stop(svq);
>      }
>
> -    if (v->migration_blocker) {
> -        migrate_del_blocker(v->migration_blocker);
> -    }
> -
>      return false;
>  }
>
> @@ -1105,9 +1094,6 @@ static bool vhost_vdpa_svqs_stop(struct vhost_dev *=
dev)
>          }
>      }
>
> -    if (v->migration_blocker) {
> -        migrate_del_blocker(v->migration_blocker);
> -    }
>      return true;
>  }
>
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index 4f1524c2e9..7c0d600aea 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -558,8 +558,6 @@ static NetClientState *net_vhost_vdpa_init(NetClientS=
tate *peer,
>
>          s->vhost_vdpa.shadow_vq_ops =3D &vhost_vdpa_net_svq_ops;
>          s->vhost_vdpa.shadow_vq_ops_opaque =3D s;
> -        error_setg(&s->vhost_vdpa.migration_blocker,
> -                   "Migration disabled: vhost-vdpa uses CVQ.");
>      }
>      ret =3D vhost_vdpa_add(nc, (void *)&s->vhost_vdpa, queue_pair_index,=
 nvqs);
>      if (ret) {
> --
> 2.31.1
>


