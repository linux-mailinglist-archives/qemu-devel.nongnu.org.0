Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 340CA5E581C
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 03:36:54 +0200 (CEST)
Received: from localhost ([::1]:56072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obB93-00069Y-2F
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 21:36:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1obB7C-0004Qh-NO
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 21:34:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1obB79-0007LQ-8y
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 21:34:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663810494;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DPmxR+tpq4G4DNMWORFkQbyWROnalkIjB1cSdNrqBmM=;
 b=GLaXTGLeJy48u1z+0GCFGFu5dpuC6FHBVNYdcMxv02srC4V3ZmQ1nnuxSFVNUGjLINstXY
 x/SCMG9mn0llMstZ7BMNqSxVsc8ajqdTA2i04VX+hiubYUN+f1bZPlYgxwM5BaMzBMjHzI
 bxWl1YDsW16lXkD8YZgjjYC3e70QgE4=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-301-8C8GTObEMOGLV159VcYsJA-1; Wed, 21 Sep 2022 21:34:53 -0400
X-MC-Unique: 8C8GTObEMOGLV159VcYsJA-1
Received: by mail-oi1-f200.google.com with SMTP id
 r9-20020a056808210900b003502cbdfd87so3945152oiw.5
 for <qemu-devel@nongnu.org>; Wed, 21 Sep 2022 18:34:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=DPmxR+tpq4G4DNMWORFkQbyWROnalkIjB1cSdNrqBmM=;
 b=M6unUgs0hHe+ysn2xVHmMn9fwRBNJQWv0h8/r0KQMLRmgI1o+JaIE0D9E51N5oJvdu
 6usMjKourLDU5G6J1ln01PIg8WfJ4dlv9Q24rMKVva8A0YPggzou6QkPhCy6iLqcFS5r
 gnNnrrMBzGOxjv0I1GjOJYSEqu9iD1m0sTZDDBt53B9SwTGV2GBJFMly9qtcnos1yahC
 Mhzzv4iSgyhX0QNMWbYxVL/JR5R+Fub5RVl0eqDvnFWurwi+RYgyJVlmwckUzZTy2Xoi
 ZnGhGhL6Lgoq9BaIRHMnMSmreMxm94CgNQuHhhNk472r7TY1rYtN4ORVnSYFIGeNYxuh
 kCNQ==
X-Gm-Message-State: ACrzQf1nnoJpoj/BKdnrFKzc7LRTFNVOez/now+gFIeKeDaXLgiG/LpG
 11dwl6MGsmulTKCzHgdVJp8LHPk37mCkev7Q229Do0CgUsFC5ojHiha7GWWEv+bUeGYlybc3HNW
 3f23DLoWHu4PrNypFLSQIVyQysgHZymw=
X-Received: by 2002:a05:6870:e409:b0:127:d330:c941 with SMTP id
 n9-20020a056870e40900b00127d330c941mr545084oag.280.1663810492388; 
 Wed, 21 Sep 2022 18:34:52 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM71t6fDc1Y389I6O5VT6OdBVULBLYY+xn/atSk8a0uVxr2D69MkM64YN5PnQEkEiNX0jpI3Tub8miiaWwJdAW8=
X-Received: by 2002:a05:6870:e409:b0:127:d330:c941 with SMTP id
 n9-20020a056870e40900b00127d330c941mr545073oag.280.1663810492180; Wed, 21 Sep
 2022 18:34:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220921060026.392164-1-chenh@yusur.tech>
 <BL3PR02MB79380882D0B877C2D5A754FFEA4F9@BL3PR02MB7938.namprd02.prod.outlook.com>
In-Reply-To: <BL3PR02MB79380882D0B877C2D5A754FFEA4F9@BL3PR02MB7938.namprd02.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 22 Sep 2022 09:34:41 +0800
Message-ID: <CACGkMEttGsDrFo_U7AKHEof0HwVfHaRTeQSRE+QTiRPPtnU3hQ@mail.gmail.com>
Subject: Re: [PATCH v2] hw/virtio/vhost-user: support obtain vdpa device's mac
 address automatically
To: Raphael Norwitz <raphael.norwitz@nutanix.com>
Cc: "mst@redhat.com" <mst@redhat.com>, "kwolf@redhat.com" <kwolf@redhat.com>, 
 "hreitz@redhat.com" <hreitz@redhat.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>, 
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "houyl@yusur.tech" <houyl@yusur.tech>, 
 "zy@yusur.tech" <zy@yusur.tech>, "lulu@redhat.com" <lulu@redhat.com>,
 Hao Chen <chenh@yusur.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 22, 2022 at 1:58 AM Raphael Norwitz
<raphael.norwitz@nutanix.com> wrote:
>
> If I read your response on the other thread correctly, this change is int=
ended
>
> to prioritize the MAC address exposed by DPDK over the one provided by th=
e
>
> QEMU command line? Sounds reasonable in principle, but I would get confir=
mation
>
> from vDPA/vhost-net maintainers.

I think the best way is to (and it seems easier)

1) have the management layer to make sure the mac came from cli
matches the underlayer vDPA
2) having a sanity check and fail the device initialization if they don't m=
atch

Thanks

>
>
>
> That said the way you=E2=80=99re hacking the vhost-user code breaks a val=
uable check for
>
> bad vhost-user-blk backends. I would suggest finding another implementati=
on which
>
> does not regress functionality for other device types.
>
>
>
>
>
> >From: Hao Chen <chenh@yusur.tech>
>
> >
>
> >When use dpdk-vdpa tests vdpa device. You need to specify the mac addres=
s to
>
> >start the virtual machine through libvirt or qemu, but now, the libvirt =
or
>
> >qemu can call dpdk vdpa vendor driver's ops .get_config through vhost_ne=
t_get_config
>
> >to get the mac address of the vdpa hardware without manual configuration=
.
>
> >
>
> >v1->v2:
>
> >Only copy ETH_ALEN data of netcfg for some vdpa device such as
>
> >NVIDIA BLUEFIELD DPU(BF2)'s netcfg->status is not right.
>
> >We only need the mac address and don't care about the status field.
>
> >
>
> >Signed-off-by: Hao Chen <chenh@yusur.tech>
>
> >---
>
> > hw/block/vhost-user-blk.c |  1 -
>
> > hw/net/virtio-net.c       |  7 +++++++
>
> > hw/virtio/vhost-user.c    | 19 -------------------
>
> > 3 files changed, 7 insertions(+), 20 deletions(-)
>
> >
>
> >diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
>
> >index 9117222456..5dca4eab09 100644
>
> >--- a/hw/block/vhost-user-blk.c
>
> >+++ b/hw/block/vhost-user-blk.c
>
> >@@ -337,7 +337,6 @@ static int vhost_user_blk_connect(DeviceState *dev, =
Error **errp)
>
> >
>
> >     vhost_dev_set_config_notifier(&s->dev, &blk_ops);
>
> >
>
> >-    s->vhost_user.supports_config =3D true;
>
> >     ret =3D vhost_dev_init(&s->dev, &s->vhost_user, VHOST_BACKEND_TYPE_=
USER, 0,
>
> >                          errp);
>
> >     if (ret < 0) {
>
> >diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
>
> >index dd0d056fde..90405083b1 100644
>
> >--- a/hw/net/virtio-net.c
>
> >+++ b/hw/net/virtio-net.c
>
> >@@ -166,6 +166,13 @@ static void virtio_net_get_config(VirtIODevice *vde=
v, uint8_t *config)
>
> >             }
>
> >             memcpy(config, &netcfg, n->config_size);
>
> >         }
>
> >+    } else if (nc->peer && nc->peer->info->type =3D=3D NET_CLIENT_DRIVE=
R_VHOST_USER) {
>
> >+        ret =3D vhost_net_get_config(get_vhost_net(nc->peer), (uint8_t =
*)&netcfg,
>
> >+                                   n->config_size);
>
> >+        if (ret !=3D -1) {
>
> >+               /* Automatically obtain the mac address of the vdpa devi=
ce
>
> >+                * when using the dpdk vdpa */
>
> >+                memcpy(config, &netcfg, ETH_ALEN);
>
> >     }
>
> > }
>
> >
>
> >diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
>
> >index bd24741be8..8b01078249 100644
>
> >--- a/hw/virtio/vhost-user.c
>
> >+++ b/hw/virtio/vhost-user.c
>
> >@@ -2013,8 +2013,6 @@ static int vhost_user_backend_init(struct vhost_de=
v *dev, void *opaque,
>
> >     }
>
> >
>
> >     if (virtio_has_feature(features, VHOST_USER_F_PROTOCOL_FEATURES)) {
>
> >-        bool supports_f_config =3D vus->supports_config ||
>
> >-            (dev->config_ops && dev->config_ops->vhost_dev_config_notif=
ier);
>
> >         uint64_t protocol_features;
>
> >
>
> >         dev->backend_features |=3D 1ULL << VHOST_USER_F_PROTOCOL_FEATUR=
ES;
>
> >@@ -2033,23 +2031,6 @@ static int vhost_user_backend_init(struct vhost_d=
ev *dev, void *opaque,
>
> >          */
>
> >         protocol_features &=3D VHOST_USER_PROTOCOL_FEATURE_MASK;
>
> >
>
> >-        if (supports_f_config) {
>
> >-            if (!virtio_has_feature(protocol_features,
>
> >-                                    VHOST_USER_PROTOCOL_F_CONFIG)) {
>
> >-                error_setg(errp, "vhost-user device expecting "
>
> >-                           "VHOST_USER_PROTOCOL_F_CONFIG but the vhost-=
user backend does "
>
> >-                           "not support it.");
>
> >-                return -EPROTO;
>
> >-            }
>
> >-        } else {
>
> >-            if (virtio_has_feature(protocol_features,
>
> >-                                   VHOST_USER_PROTOCOL_F_CONFIG)) {
>
> >-                warn_reportf_err(*errp, "vhost-user backend supports "
>
> >-                                 "VHOST_USER_PROTOCOL_F_CONFIG but QEMU=
 does not.");
>
> >-                protocol_features &=3D ~(1ULL << VHOST_USER_PROTOCOL_F_=
CONFIG);
>
> >-            }
>
> >-        }
>
> >-
>
> >         /* final set of protocol features */
>
> >         dev->protocol_features =3D protocol_features;
>
> >         err =3D vhost_user_set_protocol_features(dev, dev->protocol_fea=
tures);
>
> >--
>
> >2.27.0
>
> >
>
>


