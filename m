Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B623D0AE7
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 10:58:00 +0200 (CEST)
Received: from localhost ([::1]:35898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m683D-0001m2-7l
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 04:57:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m681Z-0000A7-QB
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 04:56:21 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:46793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m681X-00063F-SA
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 04:56:17 -0400
Received: by mail-wr1-x42a.google.com with SMTP id d12so1274130wre.13
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 01:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=xTwB07pNZJ3SSl+2z7wRAPXtZzcdGpHPqpKvnoX09jU=;
 b=w6jETzMdOpGKS+fOWFouTtee4MoZEyycyzaWrkBPg1qLCOqxtB2qeivcBkXiIKpzX3
 6dj/kPSs38J4R8shgdXGMRk6TyfxdBpkZovtZttMuJ3JtOl4WHNR702Eld486nsdVdIm
 gUKL9BbonSkTndHvdzHQIYu4OWcLwEvmuO018d6cdElE36bVx4w96TI7aS6lZJeUeXV4
 6cl+78UhRBywJIxIpXGSfIFOkQVbkSrsNzIsSz5heG6RnTih4vSCd+Wupvau4lhxcCtR
 2Yx0T60O4lMDMYtzi5NRJkGCUu1NuxUUFtTr3ccZF9IDZcbCQ22mHMLzCTPOzA0a8LSP
 pL5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=xTwB07pNZJ3SSl+2z7wRAPXtZzcdGpHPqpKvnoX09jU=;
 b=dzNQl4LSoCCoCrfzukC2zREBprnkNTbRagE/U+tIIl3NythTrse7RivP4+Vy4/Stsb
 Qke1n7Uwe9ufRYktYS7+braFvZXhh0gqZGmRWCR3CcptBs/3P/uNtGFLJsKU7451XEHn
 8hjLH8F0Dts+9cyU9S3wrC9my/ef/NRgEqxa71LOp99fTt7ALc2pxSBClVHtlhVyRCv/
 9/hb9ChXf7n2MSWCaJnFe0xZPu45VF8IHuPS62o6pVl8bCrglapstp3liIQoUA6ejpFK
 DwnJYtIMRXpyg3knqOuSUPOgaAlVlGWTkuWC6+G0Cer93l6iyDhJlFNTmrCQM2GKwz3c
 931Q==
X-Gm-Message-State: AOAM5320k6bx80DoQ8I8zdrXJRnFHk+VChpZCm30cFTeCxeF6AmAMX/w
 Jfy/I0V3PHKOpvDRfABn4sRwow==
X-Google-Smtp-Source: ABdhPJwVoM98saPoAjMuGUT9QmmKacQMw6+RH1pKptoOi27UH7vzymR2ISKrFRXt9Dnw+56edNsGmQ==
X-Received: by 2002:a5d:6501:: with SMTP id x1mr40748387wru.169.1626857773954; 
 Wed, 21 Jul 2021 01:56:13 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v11sm25805994wrs.4.2021.07.21.01.56.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 01:56:13 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6187A1FF7E;
 Wed, 21 Jul 2021 09:56:12 +0100 (BST)
References: <20210710005929.1702431-1-mathieu.poirier@linaro.org>
 <20210710005929.1702431-2-mathieu.poirier@linaro.org>
User-agent: mu4e 1.5.14; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH v3 1/4] vhost-user-rng: Add vhost-user-rng implementation
Date: Wed, 21 Jul 2021 09:52:50 +0100
In-reply-to: <20210710005929.1702431-2-mathieu.poirier@linaro.org>
Message-ID: <87mtqgkpub.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Mathieu Poirier <mathieu.poirier@linaro.org> writes:

> Following in the footsteps of what whas done for vhost-user-i2c
> and virtiofsd, introduce a random number generator (RNG) backend
> that communicates with a vhost-user server to retrieve entropy.
> That way another VMM could be using the same vhost-user daemon and
> avoid having to write yet another RNG driver.
>
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
>  hw/virtio/Kconfig                  |   5 +
>  hw/virtio/meson.build              |   1 +

FWIW there are simple merge failures for the meson and Kconfig parts due
to I2C being merged.

<snip>
> +
> +    rng->vhost_dev.nvqs =3D 1;
> +    rng->vhost_dev.vqs =3D g_new0(struct vhost_virtqueue, rng->vhost_dev=
.nvqs);
> +    if (!rng->vhost_dev.vqs) {
> +        error_setg_errno(errp, -1, "memory allocation failed");
> +        goto vhost_dev_init_failed;
> +    }

g_new0 will abort on memory allocation failure (which is fine for
userspace ;-) so you don't need the check and erro handling exit here.

> +
> +    ret =3D vhost_dev_init(&rng->vhost_dev, &rng->vhost_user,
> +                         VHOST_BACKEND_TYPE_USER, 0, errp);
> +    if (ret < 0) {
> +        error_setg_errno(errp, -ret, "vhost_dev_init() failed");
> +        goto vhost_dev_init_failed;
> +    }
> +
> +    qemu_chr_fe_set_handlers(&rng->chardev, NULL, NULL, vu_rng_event, NU=
LL,
> +                             dev, NULL, true);
> +
> +    return;
> +
> +vhost_dev_init_failed:
> +    virtio_delete_queue(rng->req_vq);
> +virtio_add_queue_failed:
> +    virtio_cleanup(vdev);
> +    vhost_user_cleanup(&rng->vhost_user);
> +}
> +
> +static void vu_rng_device_unrealize(DeviceState *dev)
> +{
> +    VirtIODevice *vdev =3D VIRTIO_DEVICE(dev);
> +    VHostUserRNG *rng =3D VHOST_USER_RNG(dev);
> +
> +    vu_rng_set_status(vdev, 0);
> +
> +    vhost_dev_cleanup(&rng->vhost_dev);
> +    g_free(rng->vhost_dev.vqs);
> +    rng->vhost_dev.vqs =3D NULL;
> +    virtio_delete_queue(rng->req_vq);
> +    virtio_cleanup(vdev);
> +    vhost_user_cleanup(&rng->vhost_user);
> +}
> +
> +static const VMStateDescription vu_rng_vmstate =3D {
> +    .name =3D "vhost-user-rng",
> +    .unmigratable =3D 1,
> +};
> +
> +static Property vu_rng_properties[] =3D {
> +    DEFINE_PROP_CHR("chardev", VHostUserRNG, chardev),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void vu_rng_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc =3D DEVICE_CLASS(klass);
> +    VirtioDeviceClass *vdc =3D VIRTIO_DEVICE_CLASS(klass);
> +
> +    device_class_set_props(dc, vu_rng_properties);
> +    dc->vmsd =3D &vu_rng_vmstate;
> +    set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
> +
> +    vdc->realize =3D vu_rng_device_realize;
> +    vdc->unrealize =3D vu_rng_device_unrealize;
> +    vdc->get_features =3D vu_rng_get_features;
> +    vdc->set_status =3D vu_rng_set_status;
> +    vdc->guest_notifier_mask =3D vu_rng_guest_notifier_mask;
> +    vdc->guest_notifier_pending =3D vu_rng_guest_notifier_pending;
> +}
> +
> +static const TypeInfo vu_rng_info =3D {
> +    .name =3D TYPE_VHOST_USER_RNG,
> +    .parent =3D TYPE_VIRTIO_DEVICE,
> +    .instance_size =3D sizeof(VHostUserRNG),
> +    .class_init =3D vu_rng_class_init,
> +};
> +
> +static void vu_rng_register_types(void)
> +{
> +    type_register_static(&vu_rng_info);
> +}
> +
> +type_init(vu_rng_register_types)
> diff --git a/include/hw/virtio/vhost-user-rng.h b/include/hw/virtio/vhost=
-user-rng.h
> new file mode 100644
> index 000000000000..071539996d1d
> --- /dev/null
> +++ b/include/hw/virtio/vhost-user-rng.h
> @@ -0,0 +1,33 @@
> +/*
> + * Vhost-user RNG virtio device
> + *
> + * Copyright (c) 2021 Mathieu Poirier <mathieu.poirier@linaro.org>
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#ifndef _QEMU_VHOST_USER_RNG_H
> +#define _QEMU_VHOST_USER_RNG_H
> +
> +#include "hw/virtio/virtio.h"
> +#include "hw/virtio/vhost.h"
> +#include "hw/virtio/vhost-user.h"
> +#include "chardev/char-fe.h"
> +
> +#define TYPE_VHOST_USER_RNG "vhost-user-rng"
> +OBJECT_DECLARE_SIMPLE_TYPE(VHostUserRNG, VHOST_USER_RNG)
> +
> +struct VHostUserRNG {
> +    /*< private >*/
> +    VirtIODevice parent;
> +    CharBackend chardev;
> +    struct vhost_virtqueue *vhost_vq;
> +    struct vhost_dev vhost_dev;
> +    VhostUserState vhost_user;
> +    VirtQueue *req_vq;
> +    bool connected;
> +
> +    /*< public >*/
> +};
> +
> +#endif /* _QEMU_VHOST_USER_RNG_H */

Otherwise:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

