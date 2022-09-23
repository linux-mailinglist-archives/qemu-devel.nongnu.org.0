Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8625A5E72C2
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 06:17:25 +0200 (CEST)
Received: from localhost ([::1]:34284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oba7w-0000TJ-Kl
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 00:17:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1obZwt-0008LV-Mo
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 00:06:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42275)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1obZwp-0004WM-LV
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 00:05:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663905954;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CVqvE8oCrFXFToMqv70si+8Qs+gOwlgCkNJw6djKoW4=;
 b=E8vEKXDYqPGHTk6IIQAtLZLSBrJ/j7q2qMcWIShgKUP8srCHOm8KVD5NafIe6HCVc5HkcB
 cZa+TKxRQ4kMTk48KlRsblJ2KK6tPft2UovPYPHxPFQ1AtOd5HT1W0yhINrgh0CfJsaJmQ
 S5yM8gGB59Ff3lJ81rFjKmrPiVkaYZ4=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-442-UUzbRATtPXCOkdZyZty6Nw-1; Fri, 23 Sep 2022 00:05:53 -0400
X-MC-Unique: UUzbRATtPXCOkdZyZty6Nw-1
Received: by mail-oo1-f72.google.com with SMTP id
 i25-20020a4a6f59000000b004758bda2303so4806948oof.0
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 21:05:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=CVqvE8oCrFXFToMqv70si+8Qs+gOwlgCkNJw6djKoW4=;
 b=Ag2oWcRKz5SnooDB4dt0XvNZRXqqMCs+bqulLH831ph4Hno14nzO97JIK6YVKWaRKZ
 v5vCrO0eC+zSevlmW/VBkMUQd7RaA8C2OdSuwNZQq5CPY3zjbTvvW+yIbM2xlK8pNfzy
 UKt3tHycrHG5f51iGQm9goBFJzcke8YlAcpKRXjbOayp8H57W9KydXIGE3mAmqS0XX4X
 rqHnJhhzD4Zj4eybKPURzicXeRzffSL6ahIjQ2BFlUDzTVRA6f5wPHkd0hSNd4WqvNzW
 YLzvQrV/IvLT2cD0nijwOHaAIOHtDxgbiC5G0w3De2dadMTyfWRQADmI4dRCEFtNoR8Y
 MKfw==
X-Gm-Message-State: ACrzQf25tQezPP6wMRRaH+LcNEdqvevg0mi9zamSMQXK2/0NuABhkvRn
 AQMfZOHuVl4j8tjNuEJf0MKBTDSA4NHJLoxG/0eVV9qxpW+suC/JzNqCvOxs1qUFjFQW1OZpp4u
 tIt0ncFj/0iyFvuHXyuXE+FYuywxhf8Q=
X-Received: by 2002:a05:6870:e409:b0:127:d330:c941 with SMTP id
 n9-20020a056870e40900b00127d330c941mr3820053oag.280.1663905951821; 
 Thu, 22 Sep 2022 21:05:51 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6VmtcW1M+CjuOaNfUUx0CqlOCudZvrN5kXay+FYefsRk6D1c8QKMlgYH1wF2aOgjqzwc9rQPtwc7zfYxKoImc=
X-Received: by 2002:a05:6870:e409:b0:127:d330:c941 with SMTP id
 n9-20020a056870e40900b00127d330c941mr3820038oag.280.1663905951528; Thu, 22
 Sep 2022 21:05:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220921060026.392164-1-chenh@yusur.tech>
 <BL3PR02MB79380882D0B877C2D5A754FFEA4F9@BL3PR02MB7938.namprd02.prod.outlook.com>
 <CACGkMEttGsDrFo_U7AKHEof0HwVfHaRTeQSRE+QTiRPPtnU3hQ@mail.gmail.com>
 <2022092311532239888519@yusur.tech>
In-Reply-To: <2022092311532239888519@yusur.tech>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 23 Sep 2022 12:05:40 +0800
Message-ID: <CACGkMEvbwrRWYxDpxYYmU3u9E-Z4TSnRdsuD4XUB_ft4+2=Nqg@mail.gmail.com>
Subject: Re: Re: [PATCH v2] hw/virtio/vhost-user: support obtain vdpa device's
 mac address automatically
To: "houyl@yusur.tech" <houyl@yusur.tech>
Cc: "raphael.norwitz" <raphael.norwitz@nutanix.com>, mst <mst@redhat.com>, 
 kwolf <kwolf@redhat.com>, hreitz <hreitz@redhat.com>,
 qemu-block <qemu-block@nongnu.org>, 
 qemu-devel <qemu-devel@nongnu.org>, zy <zy@yusur.tech>, 
 "lulu@redhat.com" <lulu@redhat.com>, =?UTF-8?B?6ZmI5rWp?= <chenh@yusur.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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

On Fri, Sep 23, 2022 at 11:55 AM houyl@yusur.tech <houyl@yusur.tech> wrote:
>
> On Thu, 22 Sep 2022 09:34:41 +0800 Jason Wang<jasowang@redhat.com>  wrote=
:
>
>
> >On Thu, Sep 22, 2022 at 1:58 AM Raphael Norwitz
> ><raphael.norwitz@nutanix.com> wrote:
> >>
> >> If I read your response on the other thread correctly, this change is =
intended
> >>
> >> to prioritize the MAC address exposed by DPDK over the one provided by=
 the
> >>
> >> QEMU command line? Sounds reasonable in principle, but I would get con=
firmation
> >>
> >> from vDPA/vhost-net maintainers.
>
> >I think the best way is to (and it seems easier)
>
> >1) have the management layer to make sure the mac came from cli
> >matches the underlayer vDPA
>
>  Agreed, that's no problem.
>
> >2) having a sanity check and fail the device initialization if they don'=
t match
>
> However, one MAC address for integrity check is from the cli, and the oth=
er MAC address is from the vDPA device,
> How to get it?

VHOST_USER_GET_CONFIG?

Thanks

>
> The current situation is if MAC came from cli don't match the underlayer =
vDPA, the virtual machine can still start without any hints.
>
> Thanks
>
>
> >Thanks
>
> >>
> >>
> >>
> >> That said the way you=E2=80=99re hacking the vhost-user code breaks a =
valuable check for
> >>
> >> bad vhost-user-blk backends. I would suggest finding another implement=
ation which
> >>
> >> does not regress functionality for other device types.
> >>
> >>
> >>
> >>
> >>
> >> >From: Hao Chen <chenh@yusur.tech>
> >>
> >> >
> >>
> >> >When use dpdk-vdpa tests vdpa device. You need to specify the mac add=
ress to
> >>
> >> >start the virtual machine through libvirt or qemu, but now, the libvi=
rt or
> >>
> >> >qemu can call dpdk vdpa vendor driver's ops .get_config through vhost=
_net_get_config
> >>
> >> >to get the mac address of the vdpa hardware without manual configurat=
ion.
> >>
> >> >
> >>
> >> >v1->v2:
> >>
> >> >Only copy ETH_ALEN data of netcfg for some vdpa device such as
> >>
> >> >NVIDIA BLUEFIELD DPU(BF2)'s netcfg->status is not right.
> >>
> >> >We only need the mac address and don't care about the status field.
> >>
> >> >
> >>
> >> >Signed-off-by: Hao Chen <chenh@yusur.tech>
> >>
> >> >---
> >>
> >> > hw/block/vhost-user-blk.c |  1 -
> >>
> >> > hw/net/virtio-net.c       |  7 +++++++
> >>
> >> > hw/virtio/vhost-user.c    | 19 -------------------
> >>
> >> > 3 files changed, 7 insertions(+), 20 deletions(-)
> >>
> >> >
> >>
> >> >diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
> >>
> >> >index 9117222456..5dca4eab09 100644
> >>
> >> >--- a/hw/block/vhost-user-blk.c
> >>
> >> >+++ b/hw/block/vhost-user-blk.c
> >>
> >> >@@ -337,7 +337,6 @@ static int vhost_user_blk_connect(DeviceState *de=
v, Error **errp)
> >>
> >> >
> >>
> >> >     vhost_dev_set_config_notifier(&s->dev, &blk_ops);
> >>
> >> >
> >>
> >> >-    s->vhost_user.supports_config =3D true;
> >>
> >> >     ret =3D vhost_dev_init(&s->dev, &s->vhost_user, VHOST_BACKEND_TY=
PE_USER, 0,
> >>
> >> >                          errp);
> >>
> >> >     if (ret < 0) {
> >>
> >> >diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> >>
> >> >index dd0d056fde..90405083b1 100644
> >>
> >> >--- a/hw/net/virtio-net.c
> >>
> >> >+++ b/hw/net/virtio-net.c
> >>
> >> >@@ -166,6 +166,13 @@ static void virtio_net_get_config(VirtIODevice *=
vdev, uint8_t *config)
> >>
> >> >             }
> >>
> >> >             memcpy(config, &netcfg, n->config_size);
> >>
> >> >         }
> >>
> >> >+    } else if (nc->peer && nc->peer->info->type =3D=3D NET_CLIENT_DR=
IVER_VHOST_USER) {
> >>
> >> >+        ret =3D vhost_net_get_config(get_vhost_net(nc->peer), (uint8=
_t *)&netcfg,
> >>
> >> >+                                   n->config_size);
> >>
> >> >+        if (ret !=3D -1) {
> >>
> >> >+               /* Automatically obtain the mac address of the vdpa d=
evice
> >>
> >> >+                * when using the dpdk vdpa */
> >>
> >> >+                memcpy(config, &netcfg, ETH_ALEN);
> >>
> >> >     }
> >>
> >> > }
> >>
> >> >
> >>
> >> >diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
> >>
> >> >index bd24741be8..8b01078249 100644
> >>
> >> >--- a/hw/virtio/vhost-user.c
> >>
> >> >+++ b/hw/virtio/vhost-user.c
> >>
> >> >@@ -2013,8 +2013,6 @@ static int vhost_user_backend_init(struct vhost=
_dev *dev, void *opaque,
> >>
> >> >     }
> >>
> >> >
> >>
> >> >     if (virtio_has_feature(features, VHOST_USER_F_PROTOCOL_FEATURES)=
) {
> >>
> >> >-        bool supports_f_config =3D vus->supports_config ||
> >>
> >> >-            (dev->config_ops && dev->config_ops->vhost_dev_config_no=
tifier);
> >>
> >> >         uint64_t protocol_features;
> >>
> >> >
> >>
> >> >         dev->backend_features |=3D 1ULL << VHOST_USER_F_PROTOCOL_FEA=
TURES;
> >>
> >> >@@ -2033,23 +2031,6 @@ static int vhost_user_backend_init(struct vhos=
t_dev *dev, void *opaque,
> >>
> >> >          */
> >>
> >> >         protocol_features &=3D VHOST_USER_PROTOCOL_FEATURE_MASK;
> >>
> >> >
> >>
> >> >-        if (supports_f_config) {
> >>
> >> >-            if (!virtio_has_feature(protocol_features,
> >>
> >> >-                                    VHOST_USER_PROTOCOL_F_CONFIG)) {
> >>
> >> >-                error_setg(errp, "vhost-user device expecting "
> >>
> >> >-                           "VHOST_USER_PROTOCOL_F_CONFIG but the vho=
st-user backend does "
> >>
> >> >-                           "not support it.");
> >>
> >> >-                return -EPROTO;
> >>
> >> >-            }
> >>
> >> >-        } else {
> >>
> >> >-            if (virtio_has_feature(protocol_features,
> >>
> >> >-                                   VHOST_USER_PROTOCOL_F_CONFIG)) {
> >>
> >> >-                warn_reportf_err(*errp, "vhost-user backend supports=
 "
> >>
> >> >-                                 "VHOST_USER_PROTOCOL_F_CONFIG but Q=
EMU does not.");
> >>
> >> >-                protocol_features &=3D ~(1ULL << VHOST_USER_PROTOCOL=
_F_CONFIG);
> >>
> >> >-            }
> >>
> >> >-        }
> >>
> >> >-
> >>
> >> >         /* final set of protocol features */
> >>
> >> >         dev->protocol_features =3D protocol_features;
> >>
> >> >         err =3D vhost_user_set_protocol_features(dev, dev->protocol_=
features);
> >>
> >> >--
> >>
> >> >2.27.0
> >>
> >> >
> >>
> >>
>


