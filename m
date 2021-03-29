Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C5C34D398
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 17:19:54 +0200 (CEST)
Received: from localhost ([::1]:45178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQtgH-0008Jp-0S
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 11:19:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lQtei-0007ri-S4
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 11:18:16 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:46613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lQtee-0003cr-KH
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 11:18:16 -0400
Received: by mail-wr1-x42c.google.com with SMTP id v4so13218191wrp.13
 for <qemu-devel@nongnu.org>; Mon, 29 Mar 2021 08:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=hQRpicPwbMUkjhji1kCTHquuyXewC5MUhcQfHXvsmOk=;
 b=IkdaNLogjiiEbPQFpG1CeSz5QEE/TgRoCqvr9Wp8PU6azcAOXcY55frusxCUPbV3oC
 0wlhMCjrm6/30313ikWVQzk/bRaW+TLhEp9MzteQy+ymRftlcJLoXwalk6TNH5f2upKD
 3pZFwAsaG9+w7Gp9Da89OmUrJ4ZdDx6wr0UjAOKEsuNKyD/4rzIevLkOPHJ7CH/DX47V
 dRnSap9YNEaKFW7MTYBPROsEAtBXvF28Fbqgqu/mC3EgaiF7x59kfFZib/5xsTyJ4NW6
 AZCGh0/AZTDcesjtHyzt5NZ6b9tUShtvpiO3Nvp7u25kFxYFYePI+z0Bgq3tikGw2c0S
 wbww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=hQRpicPwbMUkjhji1kCTHquuyXewC5MUhcQfHXvsmOk=;
 b=hDeZk1bNUQbh3PkQmtFklpyG+RARoVodOxuGfjHNJ3TmoiFLHNAbuzxughCkW4O76C
 vMOhcUaLYwG/m49CZSfbjVvAY4UdRTfXPSUHZb3enLBPpvXATf7BGlEgZCRtDpszi4cr
 bHxvd647Ykm5y762X3QOyat6qzhNMs7nFCwDaF+JkKwfwCGRZrrmOdh/9ISt8dTtoq/2
 MUyA9RVwZoK/ICZSqjAILOqQAhh1OwR9ydddWHQ+CNkRLI+TTLY9so4j2A6yN2gsDmEY
 aP5koOcNinvDWxOeTGihiWwflU09QFr05GTCHpAy8g3qwLWe1a5kgXcc5YV1uKWiTFeT
 TRQQ==
X-Gm-Message-State: AOAM5321i4+AOPjzm6a+lu2GAQHdKxn98CbMrHpdN4IuMB10JwPQv/Q3
 EaU2o/p+bY3EUgpMCQIE6tsk9A==
X-Google-Smtp-Source: ABdhPJwS0+l2GdXJJO74SPFZ50W0/KreN8D0Rzozx+J9FgYkN6lC2WbhoWMUthJbnv3BqJ9+Q5Do5A==
X-Received: by 2002:adf:f843:: with SMTP id d3mr28613590wrq.55.1617031090814; 
 Mon, 29 Mar 2021 08:18:10 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r16sm23987908wrx.75.2021.03.29.08.18.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Mar 2021 08:18:09 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 108261FF7E;
 Mon, 29 Mar 2021 16:18:09 +0100 (BST)
References: <cover.1616570702.git.viresh.kumar@linaro.org>
 <680d46df15a19a7ccb05f79370cb03226c23d943.1616570702.git.viresh.kumar@linaro.org>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 1/5] hw/virtio: add boilerplate for vhost-user-i2c device
Date: Mon, 29 Mar 2021 16:13:27 +0100
In-reply-to: <680d46df15a19a7ccb05f79370cb03226c23d943.1616570702.git.viresh.kumar@linaro.org>
Message-ID: <87lfa6xa32.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, Jie Deng <jie.deng@intel.com>,
 Bill Mills <bill.mills@linaro.org>, qemu-devel@nongnu.org,
 Arnd Bergmann <arnd.bergmann@linaro.com>, Mike Holmes <mike.holmes@linaro.org>,
 stratos-dev@op-lists.linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Viresh Kumar <viresh.kumar@linaro.org> writes:

> This creates the QEMU side of the vhost-user-i2c device which connects
> to the remote daemon. It is based of vhost-user-fs code.
>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  hw/virtio/Kconfig                           |   5 +
>  hw/virtio/meson.build                       |   1 +
>  hw/virtio/vhost-user-i2c.c                  | 286 ++++++++++++++++++++
>  include/hw/virtio/vhost-user-i2c.h          |  37 +++
>  include/standard-headers/linux/virtio_ids.h |   1 +
>  5 files changed, 330 insertions(+)
>  create mode 100644 hw/virtio/vhost-user-i2c.c
>  create mode 100644 include/hw/virtio/vhost-user-i2c.h
>
> diff --git a/hw/virtio/Kconfig b/hw/virtio/Kconfig
> index 0eda25c4e1bf..35ab45e2095c 100644
> --- a/hw/virtio/Kconfig
> +++ b/hw/virtio/Kconfig
> @@ -58,3 +58,8 @@ config VIRTIO_MEM
>      depends on LINUX
>      depends on VIRTIO_MEM_SUPPORTED
>      select MEM_DEVICE
> +
> +config VHOST_USER_I2C
> +    bool
> +    default y
> +    depends on VIRTIO && VHOST_USER
> diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
> index fbff9bc9d4de..1a0d736a0db5 100644
> --- a/hw/virtio/meson.build
> +++ b/hw/virtio/meson.build
> @@ -25,6 +25,7 @@ virtio_ss.add(when: 'CONFIG_VHOST_USER_VSOCK', if_true:=
 files('vhost-user-vsock.
>  virtio_ss.add(when: 'CONFIG_VIRTIO_RNG', if_true: files('virtio-rng.c'))
>  virtio_ss.add(when: 'CONFIG_VIRTIO_IOMMU', if_true: files('virtio-iommu.=
c'))
>  virtio_ss.add(when: 'CONFIG_VIRTIO_MEM', if_true: files('virtio-mem.c'))
> +virtio_ss.add(when: 'CONFIG_VHOST_USER_I2C', if_true: files('vhost-user-=
i2c.c'))
>=20=20
>  virtio_pci_ss =3D ss.source_set()
>  virtio_pci_ss.add(when: 'CONFIG_VHOST_VSOCK', if_true: files('vhost-vsoc=
k-pci.c'))
> diff --git a/hw/virtio/vhost-user-i2c.c b/hw/virtio/vhost-user-i2c.c
> new file mode 100644
> index 000000000000..7b0dc24412a4
> --- /dev/null
> +++ b/hw/virtio/vhost-user-i2c.c
> @@ -0,0 +1,286 @@
> +/*
> + * Vhost-user i2c virtio device
> + *
> + * Copyright (c) 2021 Viresh Kumar <viresh.kumar@linaro.org>
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qapi/error.h"
> +#include "hw/qdev-properties.h"
> +#include "hw/virtio/virtio-bus.h"
> +#include "hw/virtio/vhost-user-i2c.h"
> +#include "qemu/error-report.h"
> +#include "standard-headers/linux/virtio_ids.h"
> +
> +static void vu_i2c_start(VirtIODevice *vdev)
> +{
> +    VHostUserI2C *i2c =3D VHOST_USER_I2C(vdev);
> +    BusState *qbus =3D BUS(qdev_get_parent_bus(DEVICE(vdev)));
> +    VirtioBusClass *k =3D VIRTIO_BUS_GET_CLASS(qbus);
> +    int ret;
> +    int i;
> +
> +    if (!k->set_guest_notifiers) {
> +        error_report("binding does not support guest notifiers");
> +        return;
> +    }
> +
> +    ret =3D vhost_dev_enable_notifiers(&i2c->vhost_dev, vdev);
> +    if (ret < 0) {
> +        error_report("Error enabling host notifiers: %d", -ret);
> +        return;
> +    }
> +
> +    ret =3D k->set_guest_notifiers(qbus->parent, i2c->vhost_dev.nvqs, tr=
ue);
> +    if (ret < 0) {
> +        error_report("Error binding guest notifier: %d", -ret);
> +        goto err_host_notifiers;
> +    }
> +
> +    i2c->vhost_dev.acked_features =3D vdev->guest_features;
> +    ret =3D vhost_dev_start(&i2c->vhost_dev, vdev);
> +    if (ret < 0) {
> +        error_report("Error starting vhost-user-i2c: %d", -ret);
> +        goto err_guest_notifiers;
> +    }
> +
> +    /*
> +     * guest_notifier_mask/pending not used yet, so just unmask
> +     * everything here. virtio-pci will do the right thing by
> +     * enabling/disabling irqfd.
> +     */
> +    for (i =3D 0; i < i2c->vhost_dev.nvqs; i++) {
> +        vhost_virtqueue_mask(&i2c->vhost_dev, vdev, i, false);
> +    }
> +
> +    return;
> +
> +err_guest_notifiers:
> +    k->set_guest_notifiers(qbus->parent, i2c->vhost_dev.nvqs, false);
> +err_host_notifiers:
> +    vhost_dev_disable_notifiers(&i2c->vhost_dev, vdev);
> +}
> +
> +static void vu_i2c_stop(VirtIODevice *vdev)
> +{
> +    VHostUserI2C *i2c =3D VHOST_USER_I2C(vdev);
> +    BusState *qbus =3D BUS(qdev_get_parent_bus(DEVICE(vdev)));
> +    VirtioBusClass *k =3D VIRTIO_BUS_GET_CLASS(qbus);
> +    int ret;
> +
> +    if (!k->set_guest_notifiers) {
> +        return;
> +    }
> +
> +    vhost_dev_stop(&i2c->vhost_dev, vdev);
> +
> +    ret =3D k->set_guest_notifiers(qbus->parent, i2c->vhost_dev.nvqs, fa=
lse);
> +    if (ret < 0) {
> +        error_report("vhost guest notifier cleanup failed: %d", ret);
> +        return;
> +    }
> +
> +    vhost_dev_disable_notifiers(&i2c->vhost_dev, vdev);
> +}
> +
> +static void vu_i2c_set_status(VirtIODevice *vdev, uint8_t status)
> +{
> +    VHostUserI2C *i2c =3D VHOST_USER_I2C(vdev);
> +    bool should_start =3D status & VIRTIO_CONFIG_S_DRIVER_OK;
> +
> +    if (!vdev->vm_running) {
> +        should_start =3D false;
> +    }
> +
> +    if (i2c->vhost_dev.started =3D=3D should_start) {
> +        return;
> +    }
> +
> +    if (should_start) {
> +        vu_i2c_start(vdev);
> +    } else {
> +        vu_i2c_stop(vdev);
> +    }
> +}
> +
> +static uint64_t vu_i2c_get_features(VirtIODevice *vdev,
> +                                    uint64_t requested_features, Error *=
*errp)
> +{
> +    /* No feature bits used yet */
> +    return requested_features;
> +}
> +
> +static void vu_i2c_handle_output(VirtIODevice *vdev, VirtQueue *vq)
> +{
> +    /*
> +     * Not normally called; it's the daemon that handles the queue;
> +     * however virtio's cleanup path can call this.
> +     */
> +}
> +
> +static void vu_i2c_guest_notifier_mask(VirtIODevice *vdev, int idx, bool=
 mask)
> +{
> +    VHostUserI2C *i2c =3D VHOST_USER_I2C(vdev);
> +
> +    vhost_virtqueue_mask(&i2c->vhost_dev, vdev, idx, mask);
> +}
> +
> +static bool vu_i2c_guest_notifier_pending(VirtIODevice *vdev, int idx)
> +{
> +    VHostUserI2C *i2c =3D VHOST_USER_I2C(vdev);
> +
> +    return vhost_virtqueue_pending(&i2c->vhost_dev, idx);
> +}
> +
> +static void do_vhost_user_cleanup(VirtIODevice *vdev, VHostUserI2C *i2c)
> +{
> +    vhost_user_cleanup(&i2c->vhost_user);
> +    virtio_delete_queue(i2c->req_vq);
> +    g_free(i2c->vhost_dev.vqs);
> +    virtio_cleanup(vdev);
> +    g_free(i2c->vhost_dev.vqs);

This is a double free of the same queue.

> +    i2c->vhost_dev.vqs =3D NULL;
> +}
> +
> +static int vu_i2c_connect(DeviceState *dev)
> +{
> +    VirtIODevice *vdev =3D VIRTIO_DEVICE(dev);
> +    VHostUserI2C *i2c =3D VHOST_USER_I2C(vdev);
> +
> +    if (i2c->connected) {
> +        return 0;
> +    }
> +    i2c->connected =3D true;
> +
> +    /* restore vhost state */
> +    if (virtio_device_started(vdev, vdev->status)) {
> +        vu_i2c_start(vdev);
> +    }
> +
> +    return 0;
> +}
> +
> +static void vu_i2c_disconnect(DeviceState *dev)
> +{
> +    VirtIODevice *vdev =3D VIRTIO_DEVICE(dev);
> +    VHostUserI2C *i2c =3D VHOST_USER_I2C(vdev);
> +
> +    if (!i2c->connected) {
> +        return;
> +    }
> +    i2c->connected =3D false;
> +
> +    if (i2c->vhost_dev.started) {
> +        vu_i2c_stop(vdev);
> +    }
> +}
> +
> +static void vu_i2c_event(void *opaque, QEMUChrEvent event)
> +{
> +    DeviceState *dev =3D opaque;
> +    VirtIODevice *vdev =3D VIRTIO_DEVICE(dev);
> +    VHostUserI2C *i2c =3D VHOST_USER_I2C(vdev);
> +
> +    switch (event) {
> +    case CHR_EVENT_OPENED:
> +        if (vu_i2c_connect(dev) < 0) {
> +            qemu_chr_fe_disconnect(&i2c->conf.chardev);
> +            return;
> +        }
> +        break;
> +    case CHR_EVENT_CLOSED:
> +        vu_i2c_disconnect(dev);
> +        break;
> +    case CHR_EVENT_BREAK:
> +    case CHR_EVENT_MUX_IN:
> +    case CHR_EVENT_MUX_OUT:
> +        /* Ignore */
> +        break;
> +    }
> +}
> +
> +static void vu_i2c_device_realize(DeviceState *dev, Error **errp)
> +{
> +    VirtIODevice *vdev =3D VIRTIO_DEVICE(dev);
> +    VHostUserI2C *i2c =3D VHOST_USER_I2C(dev);
> +    int ret;
> +
> +    if (!i2c->conf.chardev.chr) {
> +        error_setg(errp, "missing chardev");
> +        return;
> +    }
> +
> +    if (!vhost_user_init(&i2c->vhost_user, &i2c->conf.chardev, errp)) {
> +        return;
> +    }
> +
> +    virtio_init(vdev, "vhost-user-i2c", VIRTIO_ID_I2C, 0);
> +
> +    i2c->req_vq =3D virtio_add_queue(vdev, 3, vu_i2c_handle_output);
> +    i2c->vhost_dev.nvqs =3D 1;
> +    i2c->vhost_dev.vqs =3D g_new0(struct vhost_virtqueue, i2c->vhost_dev=
.nvqs);
> +    ret =3D vhost_dev_init(&i2c->vhost_dev, &i2c->vhost_user,
> +                         VHOST_BACKEND_TYPE_USER, 0);
> +    if (ret < 0) {
> +        error_setg_errno(errp, -ret, "vhost_dev_init() failed");
> +        do_vhost_user_cleanup(vdev, i2c);
> +    }
> +
> +    qemu_chr_fe_set_handlers(&i2c->conf.chardev, NULL, NULL, vu_i2c_even=
t, NULL,
> +                             dev, NULL, true);
> +}
> +
> +static void vu_i2c_device_unrealize(DeviceState *dev)
> +{
> +    VirtIODevice *vdev =3D VIRTIO_DEVICE(dev);
> +    VHostUserI2C *i2c =3D VHOST_USER_I2C(dev);
> +
> +    /* This will stop vhost backend if appropriate. */
> +    vu_i2c_set_status(vdev, 0);
> +
> +    vhost_dev_cleanup(&i2c->vhost_dev);
> +
> +    do_vhost_user_cleanup(vdev, i2c);
> +}
> +
> +static const VMStateDescription vu_i2c_vmstate =3D {
> +    .name =3D "vhost-user-i2c",
> +    .unmigratable =3D 1,
> +};
> +
> +static Property vu_i2c_properties[] =3D {
> +    DEFINE_PROP_CHR("chardev", VHostUserI2C, conf.chardev),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void vu_i2c_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc =3D DEVICE_CLASS(klass);
> +    VirtioDeviceClass *vdc =3D VIRTIO_DEVICE_CLASS(klass);
> +
> +    device_class_set_props(dc, vu_i2c_properties);
> +    dc->vmsd =3D &vu_i2c_vmstate;
> +    set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
> +    vdc->realize =3D vu_i2c_device_realize;
> +    vdc->unrealize =3D vu_i2c_device_unrealize;
> +    vdc->get_features =3D vu_i2c_get_features;
> +    vdc->set_status =3D vu_i2c_set_status;
> +    vdc->guest_notifier_mask =3D vu_i2c_guest_notifier_mask;
> +    vdc->guest_notifier_pending =3D vu_i2c_guest_notifier_pending;
> +}
> +
> +static const TypeInfo vu_i2c_info =3D {
> +    .name =3D TYPE_VHOST_USER_I2C,
> +    .parent =3D TYPE_VIRTIO_DEVICE,
> +    .instance_size =3D sizeof(VHostUserI2C),
> +    .class_init =3D vu_i2c_class_init,
> +};
> +
> +static void vu_i2c_register_types(void)
> +{
> +    type_register_static(&vu_i2c_info);
> +}
> +
> +type_init(vu_i2c_register_types)
> diff --git a/include/hw/virtio/vhost-user-i2c.h b/include/hw/virtio/vhost=
-user-i2c.h
> new file mode 100644
> index 000000000000..a5fffcb6096c
> --- /dev/null
> +++ b/include/hw/virtio/vhost-user-i2c.h
> @@ -0,0 +1,37 @@
> +/*
> + * Vhost-user i2c virtio device
> + *
> + * Copyright (c) 2021 Viresh Kumar <viresh.kumar@linaro.org>
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#ifndef _QEMU_VHOST_USER_I2C_H
> +#define _QEMU_VHOST_USER_I2C_H
> +
> +#include "hw/virtio/virtio.h"
> +#include "hw/virtio/vhost.h"
> +#include "hw/virtio/vhost-user.h"
> +#include "chardev/char-fe.h"
> +
> +#define TYPE_VHOST_USER_I2C "vhost-user-i2c-device"
> +OBJECT_DECLARE_SIMPLE_TYPE(VHostUserI2C, VHOST_USER_I2C)
> +
> +typedef struct {
> +    CharBackend chardev;
> +} VHostUserI2CConf;
> +
> +struct VHostUserI2C {
> +    /*< private >*/
> +    VirtIODevice parent;
> +    VHostUserI2CConf conf;
> +    struct vhost_virtqueue *vhost_vq;
> +    struct vhost_dev vhost_dev;
> +    VhostUserState vhost_user;
> +    VirtQueue *req_vq;
> +    bool connected;
> +
> +    /*< public >*/
> +};
> +
> +#endif /* _QEMU_VHOST_USER_I2C_H */
> diff --git a/include/standard-headers/linux/virtio_ids.h b/include/standa=
rd-headers/linux/virtio_ids.h
> index bc1c0621f5ed..aba00c54b9cd 100644
> --- a/include/standard-headers/linux/virtio_ids.h
> +++ b/include/standard-headers/linux/virtio_ids.h
> @@ -54,5 +54,6 @@
>  #define VIRTIO_ID_FS			26 /* virtio filesystem */
>  #define VIRTIO_ID_PMEM			27 /* virtio pmem */
>  #define VIRTIO_ID_MAC80211_HWSIM	29 /* virtio mac80211-hwsim */
> +#define VIRTIO_ID_I2C			34 /* virtio i2c */

This should come in as a separate patch. Generally I run:

  ./scripts/update-linux-headers.sh ~/lsrc/linux.git

and tag the patch as (!MERGE) as a place holder until it can get picked
up with one of the regular UAPI updates.

>=20=20
>  #endif /* _LINUX_VIRTIO_IDS_H */


--=20
Alex Benn=C3=A9e

