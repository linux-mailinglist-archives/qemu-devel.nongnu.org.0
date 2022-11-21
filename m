Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 190C96327DA
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 16:24:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox8dX-0007EY-I3; Mon, 21 Nov 2022 10:23:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1ox8dS-0007C9-CI
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 10:23:03 -0500
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1ox8dQ-0005RB-Dj
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 10:23:02 -0500
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-3a4c2c83300so20709357b3.13
 for <qemu-devel@nongnu.org>; Mon, 21 Nov 2022 07:23:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Qo2VKaa8y05xUPfbxnCzUsv7k9NlVEn9nTcQkgJQXRA=;
 b=Q2flUWdrCHPTRyBN1DDFvK8/fXfw1nK+Qdc4PXJL/M1G4xHYoi7vmmstvQyyULb9F5
 SqaS/sUuXpcV0YaHgAeUhEgqElK7QTQtchfRwAscoEpCtM0za5WyucgeK6N4cvGNSfGP
 2H3niUjuS84asPMCPWJ1tGmDcWupUiN9gM96uYA+sLiCydLCYKRiR9A+tyKwU2u8/pS9
 X0E92hYW+A0nZOazCXmFS0kM4VC/uRVZYRJnssFdSDZgmae5HnFWHxDfIHOhGuiwAcr3
 ZQdmhjyDWmhyuXaaE0l41uVxswVKalRF11Dbq++1hOQpxNaldpe//zlbRG3wwsA7C0WW
 rgjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Qo2VKaa8y05xUPfbxnCzUsv7k9NlVEn9nTcQkgJQXRA=;
 b=L3bYmTJjNR+kZGixYr33hs0qNk1bn1V/QEuRT2tryofTtU9NrsyIQeM7VbHmYFcvwZ
 tN2UE9upEtoHIvOYL6A07CNp5pbSQ/B80fdsUTbrsjXcb601qnmG6XM5qBryh4X9dHAO
 4RVJZ2UwkaVOagYZlCmenQNsqLrxIT5nXCbpzU5lI3siNx2PMwVYEZlyRLJ28Aa0Oatq
 DWxbk6NtKJypKhv2057+Nk40ilxSNtSwThutvW5p9VXyzrsXjgdUjbhvWEv6HNt954WD
 PmoE7ZHrAMo3qD4W+qBVlocqw1CFfUN0FlJ06+GSxttyxmizYn7K1JRuouwrFCz2Ccq8
 V4Xw==
X-Gm-Message-State: ANoB5pk5x55ORajwJeGIflgkJDBMLK+UTXyBWAWjXCetNc2jmWNDXaIZ
 YUfp/BTO17vyaquA2hSt78tFaFVR4bLWj0JoAsM=
X-Google-Smtp-Source: AA0mqf7olekNLcvgpbkbfGYOsskTfjxwTkatIon+zizB8QldCrOTYMiCD1pbT5xgp4baBSVUz7mvW5OId3dvqm8mp5A=
X-Received: by 2002:a81:5309:0:b0:38f:80d5:f22d with SMTP id
 h9-20020a815309000000b0038f80d5f22dmr5034820ywb.296.1669044179255; Mon, 21
 Nov 2022 07:22:59 -0800 (PST)
MIME-Version: 1.0
References: <20221121144921.2830330-1-alex.bennee@linaro.org>
In-Reply-To: <20221121144921.2830330-1-alex.bennee@linaro.org>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 21 Nov 2022 10:22:47 -0500
Message-ID: <CAJSP0QU72EnMQRbHpZ812QpszkjEeStA1R2Jic1VvCKBFas8_g@mail.gmail.com>
Subject: Re: [RFC PATCH] include/hw: attempt to document VirtIO feature
 variables (!DISCUSS!)
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Stefano Garzarella <sgarzare@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x112b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Mon, 21 Nov 2022 at 09:49, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> We have a bunch of variables associated with the device and the vhost
> backend which are used inconsistently throughout the code base. Lets
> start trying to bring some order by agreeing what each variable is
> for. Some cases to address (vho/vio renames to avoid ambiguous results
> while grepping):
>
> virtio->guest_features is mostly the live status of the features field
> and read and written as such by the guest. It does get manipulated by
> the various load state via virtio_set_features_nocheck(vdev, val) for
> migration.
>
> virtio->host_features is the result of vcd->get_features() most of the
> time and for vhost-user devices eventually ends up down at the vhost
> get features message:
>
>   ./hw/virtio/virtio-bus.c:66:    vdev->host_features =3D vdc->get_featur=
es(vdev, vdev->host_features,
>
> However virtio-net does a lot of direct modification of it:
>
>   ./hw/net/virtio-net.c:3517:        n->host_features |=3D (1ULL << VIRTI=
O_NET_F_MTU);
>   ./hw/net/virtio-net.c:3529:        n->host_features |=3D (1ULL << VIRTI=
O_NET_F_SPEED_DUPLEX);
>   ./hw/net/virtio-net.c:3539:        n->host_features |=3D (1ULL << VIRTI=
O_NET_F_SPEED_DUPLEX);
>   ./hw/net/virtio-net.c:3548:        n->host_features |=3D (1ULL << VIRTI=
O_NET_F_STANDBY);
>   ./hw/virtio/virtio.c:3438:    bool bad =3D (val & ~(vdev->host_features=
)) !=3D 0;
>
> And we have this case which propagates the global QMP values for the
> device to the host features. This causes the resent regression of
> vhost-user-sock due to 69e1c14aa2 (virtio: core: vq reset feature
> negotation support) because the reset feature was rejected by the
> vhost-user backend causing it to freeze:
>
>   ./hw/virtio/virtio.c:4667:    status->host_features =3D qmp_decode_feat=
ures(vdev->device_id,
>
> virtio->backend_features is only used by virtio-net to stash the
> vhost_net_get_features features for checking later:
>
>     features =3D vhost_net_get_features(get_vhost_net(nc->peer), features=
);
>     vdev->vio_backend_features =3D features;
>
> and:
>
>     if (n->mtu_bypass_backend &&
>             !virtio_has_feature(vdev->vio_backend_features, VIRTIO_NET_F_=
MTU)) {
>         features &=3D ~(1ULL << VIRTIO_NET_F_MTU);
>     }
>
> vhost_dev->acked_features seems to mostly reflect
> virtio->guest_features (but where in the negotiation cycle?). Except
> for vhost_net where is becomes vhost_dev->backend_features
>
>   ./backends/vhost-user.c:87:    b->dev.vho_acked_features =3D b->vdev->g=
uest_features;
>   ./hw/block/vhost-user-blk.c:149:    s->dev.vho_acked_features =3D vdev-=
>guest_features;
>   ./hw/net/vhost_net.c:132:    net->dev.vho_acked_features =3D net->dev.v=
ho_backend_features;
>   ./hw/scsi/vhost-scsi-common.c:53:    vsc->dev.vho_acked_features =3D vd=
ev->guest_features;
>   ./hw/virtio/vhost-user-fs.c:77:    fs->vhost_dev.vho_acked_features =3D=
 vdev->guest_features;
>   ./hw/virtio/vhost-user-i2c.c:46:    i2c->vhost_dev.vho_acked_features =
=3D vdev->guest_features;
>   ./hw/virtio/vhost-user-rng.c:44:    rng->vhost_dev.vho_acked_features =
=3D vdev->guest_features;
>   ./hw/virtio/vhost-vsock-common.c:71:    vvc->vhost_dev.vho_acked_featur=
es =3D vdev->guest_features;
>   ./hw/virtio/vhost.c:1631:            hdev->vho_acked_features |=3D bit_=
mask;
>
> vhost_dev->backend_features has become overloaded with two use cases:
>
>   ./hw/block/vhost-user-blk.c:336:    s->dev.vho_backend_features =3D 0;
>   ./hw/net/vhost_net.c:180:        net->dev.vho_backend_features =3D qemu=
_has_vnet_hdr(options->net_backend)
>   ./hw/net/vhost_net.c:185:        net->dev.vho_backend_features =3D 0;
>   ./hw/scsi/vhost-scsi.c:220:    vsc->dev.vho_backend_features =3D 0;
>   ./hw/scsi/vhost-user-scsi.c:121:    vsc->dev.vho_backend_features =3D 0=
;
>   ./hw/virtio/vhost-user.c:2083:        dev->vho_backend_features |=3D 1U=
LL << VHOST_USER_F_PROTOCOL_FEATURES;
> One use for saving the availability of a vhost-net feature and another
> for ensuring we add the protocol feature negotiation bit when querying
> a vhost backend. Maybe the places where this is queried should really
> be bools that can be queried in the appropriate places?
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Stefano Garzarella <sgarzare@redhat.com>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Stefan Hajnoczi <stefanha@gmail.com>
> ---
>  include/hw/virtio/vhost.h  | 18 +++++++++++++++---
>  include/hw/virtio/virtio.h | 20 +++++++++++++++++++-
>  2 files changed, 34 insertions(+), 4 deletions(-)
>
> diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
> index 353252ac3e..502aa5677a 100644
> --- a/include/hw/virtio/vhost.h
> +++ b/include/hw/virtio/vhost.h
> @@ -88,13 +88,25 @@ struct vhost_dev {
>      int vq_index_end;
>      /* if non-zero, minimum required value for max_queues */
>      int num_queues;
> +    /**
> +     * vhost feature handling requires matching the feature set
> +     * offered by a backend which may be a subset of the total
> +     * features eventually offered to the guest.
> +     *
> +     * @features: available features provided by the backend
> +     * @acked_features: final set of negotiated features with the
> +     * front-end driver
> +     * @backend_features: additional feature bits applied during negotia=
tion

What does this mean?

> +     *
> +     * Finally the @protocol_features is the final protocal feature

s/protocal/protocol/

All the other fields are VIRTIO feature bits and this field holds the
VHOST_USER_SET_FEATURES feature bits?

> +     * set negotiated between QEMU and the backend (after
> +     * VHOST_USER_F_PROTOCOL_FEATURES is negotiated)
> +     */
>      uint64_t features;
> -    /** @acked_features: final set of negotiated features */
>      uint64_t acked_features;
> -    /** @backend_features: backend specific feature bits */
>      uint64_t backend_features;
> -    /** @protocol_features: final negotiated protocol features */
>      uint64_t protocol_features;
> +
>      uint64_t max_queues;
>      uint64_t backend_cap;
>      /* @started: is the vhost device started? */
> diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
> index a973811cbf..9939a0a632 100644
> --- a/include/hw/virtio/virtio.h
> +++ b/include/hw/virtio/virtio.h
> @@ -93,6 +93,12 @@ enum virtio_device_endian {
>      VIRTIO_DEVICE_ENDIAN_BIG,
>  };
>
> +/**
> + * struct VirtIODevice - common VirtIO structure
> + * @name: name of the device
> + * @status: VirtIO Device Status field
> + *
> + */
>  struct VirtIODevice
>  {
>      DeviceState parent_obj;
> @@ -100,9 +106,21 @@ struct VirtIODevice
>      uint8_t status;
>      uint8_t isr;
>      uint16_t queue_sel;
> -    uint64_t guest_features;
> +    /**
> +     * These fields represent a set of VirtIO features at various
> +     * levels of the stack. @host_features indicates the complete
> +     * feature set the VirtIO device can offer to the driver.
> +     * @guest_features indicates which features the VirtIO driver can
> +     * support.

The device never knows the features that the driver can support, so
this sentence is ambiguous/incorrect. The device only knows the
features that the driver writes during negotiation, which the spec
says is a subset of host_features.

Maybe "indicates the features that driver wrote"?

I noticed that this field is assigned even when the guest writes
invalid feature bits.

> Finally @backend_features represents everything
> +     * supported by the backend. This set might be split between stuff
> +     * done by QEMU itself and stuff handled by an external backend
> +     * (e.g. vhost). As a result some feature bits may be added or
> +     * masked from the backend.

I'm not 100% sure what this is referring to. Transport features that
are handled by QEMU and not the backend?

> +     */
>      uint64_t host_features;
> +    uint64_t guest_features;
>      uint64_t backend_features;
> +
>      size_t config_len;
>      void *config;
>      uint16_t config_vector;
> --
> 2.34.1
>

