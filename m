Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B97E35BB6F
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 09:53:11 +0200 (CEST)
Received: from localhost ([::1]:54980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVrNe-0003iO-53
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 03:53:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1lVrMO-0002zY-Ce
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 03:51:52 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:46038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1lVrMI-0005tN-UG
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 03:51:49 -0400
Received: by mail-ej1-x62e.google.com with SMTP id sd23so10021678ejb.12
 for <qemu-devel@nongnu.org>; Mon, 12 Apr 2021 00:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=GGyfS/dYpUxr2A6QbWCe4RVN9Bx7QxJBP0JsZHFKf04=;
 b=cVxzLSUYnLBjMUDf4WFKy3u3FE9XXUs9fL/iRRQ3O0EJC9IBSUcwHgFhcZ3TLXlwIg
 65+fV9wVNn61q0qNAttW8baFW5F2He0bj+cj2sn/fYblFyQs6r3QVw88XBdBkee8hIhZ
 NbTMbisPiB5cbbDjKTaEP5seoYTtm7mbSrZ1HGWGNYThxTq4cg9XT5xAJY7GuE6REIVk
 1wipbt+ugIEZZvSJd5uNRmcnIjwO6qvK/fD8sUEHe4bVu2p5oOGXcyqP0cHyY0VuvqxF
 W9afGTlGmdcmrvwj8EJUxqTGh8N2f8qgLE2XccSAUV5fFxwh9/7m/25fIhdL68hs70a2
 v27g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=GGyfS/dYpUxr2A6QbWCe4RVN9Bx7QxJBP0JsZHFKf04=;
 b=GHDx0+m+OLbZh6JUP7O1GG+mTtHH3EgkCjrRwR41tTY7H5vhGudf7NsctLIwv87Pb8
 eg1i2qIVeHbXic3LSfqelhSSZypu/mlDRWIHPNrE6es1EcZKpvRsQecBhmuH4f8UJnU/
 d5sju2Vn1RN1FKtkBCPqo5nYS8cTRfC1vmWeWjNt9Cg0Ts/sDYUNQ8ARSEHw0UlpYbmj
 mc7IS/HTa9rTa3kPTpUYTBK0hK8XU+xU3aNYGjApYRG2Geb/pYnDZEmc2HJ4WTO13zFs
 B3qWEmRwI8yANy7+g8I77kj/IntAk1GGz9YJKaHvQxPVKG4s/v2oxLfgmajXrXhFXooo
 hHiA==
X-Gm-Message-State: AOAM530O5nL3CmMPsXXNZWNA/+huMVR/b8y2RdCh/O6puv1BecoCUQbt
 UUparr+fISlffSXrsjS0oIHzjPplxDQ2d8fktTT4
X-Google-Smtp-Source: ABdhPJxbK6wVE64hWh1MAQN5J/+MgWqfFFxuALzAd33wnmOVUk7JauUsK55OXmRAOuPgdfHAGxq5DkTzK/F0MorW4X4=
X-Received: by 2002:a17:906:3945:: with SMTP id
 g5mr18321153eje.427.1618213903682; 
 Mon, 12 Apr 2021 00:51:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210408101252.552-1-xieyongji@bytedance.com>
 <20210408101252.552-4-xieyongji@bytedance.com>
 <bb1af0e4-de0d-fb84-0e8c-d725bfaf921c@redhat.com>
 <CACycT3skMQGoA8+SBMMwTj+SZsBZ7RiEQVo972HT6TBN5HrSuA@mail.gmail.com>
 <b21f28cf-a36f-11b4-7bf6-bc68d461189d@redhat.com>
In-Reply-To: <b21f28cf-a36f-11b4-7bf6-bc68d461189d@redhat.com>
From: Yongji Xie <xieyongji@bytedance.com>
Date: Mon, 12 Apr 2021 15:51:32 +0800
Message-ID: <CACycT3t7uxLEHf0y18NyWW1DSqAVM5uo+O09WGp0E+n_ZoLU1Q@mail.gmail.com>
Subject: Re: Re: [PATCH 3/3] vhost-vdpa-blk: Introduce vhost-vdpa-blk host
 device
To: Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=xieyongji@bytedance.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: kwolf@redhat.com, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, "Zhu,
 Lingshan" <lingshan.zhu@intel.com>, mreitz@redhat.com, changpeng.liu@intel.com,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Apr 12, 2021 at 3:14 PM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2021/4/9 =E4=B8=8B=E5=8D=884:17, Yongji Xie =E5=86=99=E9=81=93:
> > On Fri, Apr 9, 2021 at 2:02 PM Jason Wang <jasowang@redhat.com> wrote:
> >>
> >> =E5=9C=A8 2021/4/8 =E4=B8=8B=E5=8D=886:12, Xie Yongji =E5=86=99=E9=81=
=93:
> >>> This commit introduces a new vhost-vdpa block device, which
> >>> will set up a vDPA device specified by a "vdpa-dev" parameter,
> >>> something like:
> >>>
> >>> qemu-system-x86_64 \
> >>>       -device vhost-vdpa-blk-pci,vdpa-dev=3D/dev/vhost-vdpa-0
> >>>
> >>> Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
> >>> ---
> >>>    hw/block/Kconfig                   |   5 +
> >>>    hw/block/meson.build               |   1 +
> >>>    hw/block/vhost-vdpa-blk.c          | 227 +++++++++++++++++++++++++=
++++
> >>>    hw/virtio/meson.build              |   1 +
> >>>    hw/virtio/vhost-vdpa-blk-pci.c     | 101 +++++++++++++
> >>>    include/hw/virtio/vhost-vdpa-blk.h |  30 ++++
> >>>    6 files changed, 365 insertions(+)
> >>>    create mode 100644 hw/block/vhost-vdpa-blk.c
> >>>    create mode 100644 hw/virtio/vhost-vdpa-blk-pci.c
> >>>    create mode 100644 include/hw/virtio/vhost-vdpa-blk.h
> >>>
> >>> diff --git a/hw/block/Kconfig b/hw/block/Kconfig
> >>> index 4fcd152166..4615a2c116 100644
> >>> --- a/hw/block/Kconfig
> >>> +++ b/hw/block/Kconfig
> >>> @@ -41,5 +41,10 @@ config VHOST_USER_BLK
> >>>        default y if VIRTIO_PCI
> >>>        depends on VIRTIO && VHOST_USER && LINUX
> >>>
> >>> +config VHOST_VDPA_BLK
> >>> +    bool
> >>> +    default y if VIRTIO_PCI
> >>> +    depends on VIRTIO && VHOST_VDPA && LINUX
> >>> +
> >>>    config SWIM
> >>>        bool
> >>> diff --git a/hw/block/meson.build b/hw/block/meson.build
> >>> index 5862bda4cb..98f1fc330a 100644
> >>> --- a/hw/block/meson.build
> >>> +++ b/hw/block/meson.build
> >>> @@ -17,5 +17,6 @@ softmmu_ss.add(when: 'CONFIG_NVME_PCI', if_true: fi=
les('nvme.c', 'nvme-ns.c', 'n
> >>>
> >>>    specific_ss.add(when: 'CONFIG_VIRTIO_BLK', if_true: files('virtio-=
blk.c'))
> >>>    specific_ss.add(when: 'CONFIG_VHOST_USER_BLK', if_true: files('vho=
st-blk-common.c', 'vhost-user-blk.c'))
> >>> +specific_ss.add(when: 'CONFIG_VHOST_VDPA_BLK', if_true: files('vhost=
-blk-common.c', 'vhost-vdpa-blk.c'))
> >>>
> >>>    subdir('dataplane')
> >>> diff --git a/hw/block/vhost-vdpa-blk.c b/hw/block/vhost-vdpa-blk.c
> >>> new file mode 100644
> >>> index 0000000000..d5cbbbba10
> >>> --- /dev/null
> >>> +++ b/hw/block/vhost-vdpa-blk.c
> >>> @@ -0,0 +1,227 @@
> >>> +/*
> >>> + * vhost-vdpa-blk host device
> >>> + *
> >>> + * Copyright (C) 2021 Bytedance Inc. and/or its affiliates. All righ=
ts reserved.
> >>> + *
> >>> + * Author:
> >>> + *   Xie Yongji <xieyongji@bytedance.com>
> >>> + *
> >>> + * This work is licensed under the terms of the GNU GPL, version 2. =
 See
> >>> + * the COPYING file in the top-level directory.
> >>> + *
> >>> + */
> >>> +
> >>> +#include "qemu/osdep.h"
> >>> +#include "qapi/error.h"
> >>> +#include "qemu/error-report.h"
> >>> +#include "qemu/cutils.h"
> >>> +#include "hw/qdev-core.h"
> >>> +#include "hw/qdev-properties.h"
> >>> +#include "hw/qdev-properties-system.h"
> >>> +#include "hw/virtio/vhost.h"
> >>> +#include "hw/virtio/vhost-vdpa-blk.h"
> >>> +#include "hw/virtio/virtio.h"
> >>> +#include "hw/virtio/virtio-bus.h"
> >>> +#include "hw/virtio/virtio-access.h"
> >>> +#include "sysemu/sysemu.h"
> >>> +#include "sysemu/runstate.h"
> >>> +
> >>> +static const int vdpa_feature_bits[] =3D {
> >>> +    VIRTIO_BLK_F_SIZE_MAX,
> >>> +    VIRTIO_BLK_F_SEG_MAX,
> >>> +    VIRTIO_BLK_F_GEOMETRY,
> >>> +    VIRTIO_BLK_F_BLK_SIZE,
> >>> +    VIRTIO_BLK_F_TOPOLOGY,
> >>> +    VIRTIO_BLK_F_MQ,
> >>> +    VIRTIO_BLK_F_RO,
> >>> +    VIRTIO_BLK_F_FLUSH,
> >>> +    VIRTIO_BLK_F_CONFIG_WCE,
> >>> +    VIRTIO_BLK_F_DISCARD,
> >>> +    VIRTIO_BLK_F_WRITE_ZEROES,
> >>> +    VIRTIO_F_VERSION_1,
> >>> +    VIRTIO_RING_F_INDIRECT_DESC,
> >>> +    VIRTIO_RING_F_EVENT_IDX,
> >>> +    VIRTIO_F_NOTIFY_ON_EMPTY,
> >>> +    VHOST_INVALID_FEATURE_BIT
> >>> +};
> >>> +
> >>> +static void vhost_vdpa_blk_set_status(VirtIODevice *vdev, uint8_t st=
atus)
> >>> +{
> >>> +    VHostVdpaBlk *s =3D VHOST_VDPA_BLK(vdev);
> >>> +    VHostBlkCommon *vbc =3D VHOST_BLK_COMMON(s);
> >>> +    bool should_start =3D virtio_device_started(vdev, status);
> >>> +    int ret;
> >>> +
> >>> +    if (!vdev->vm_running) {
> >>> +        should_start =3D false;
> >>> +    }
> >>> +
> >>> +    if (vbc->dev.started =3D=3D should_start) {
> >>> +        return;
> >>> +    }
> >>> +
> >>> +    if (should_start) {
> >>> +        ret =3D vhost_blk_common_start(vbc);
> >>> +        if (ret < 0) {
> >>> +            error_report("vhost-vdpa-blk: vhost start failed: %s",
> >>> +                         strerror(-ret));
> >>> +        }
> >>> +    } else {
> >>> +        vhost_blk_common_stop(vbc);
> >>> +    }
> >>> +
> >>> +}
> >>> +
> >>> +static void vhost_vdpa_blk_handle_output(VirtIODevice *vdev, VirtQue=
ue *vq)
> >>> +{
> >>> +    VHostVdpaBlk *s =3D VHOST_VDPA_BLK(vdev);
> >>> +    VHostBlkCommon *vbc =3D VHOST_BLK_COMMON(s);
> >>> +    int i, ret;
> >>
> >> I believe we should never reach here, the backend should poll the
> >> notifier and trigger vq handler there after DRIVER_OK?
> >>
> > Some legacy virtio-blk driver (virtio 0.9) will do that. Kick before
> > set DRIVER_OK.
>
>
> Ok, I see, but any reason:
>
> 1) we need start vhost-blk
> 2) the relay is not done per vq but per device?
>

We need to make vhost backend process I/Os. Otherwise, guest will hang
if we don't start vhost-blk here.

>
> >
> >>> +
> >>> +    if (!vdev->start_on_kick) {
> >>> +        return;
> >>> +    }
> >>> +
> >>> +    if (vbc->dev.started) {
> >>> +        return;
> >>> +    }
> >>> +
> >>> +    ret =3D vhost_blk_common_start(vbc);
> >>> +    if (ret < 0) {
> >>> +        error_report("vhost-vdpa-blk: vhost start failed: %s",
> >>> +                     strerror(-ret));
> >>> +        return;
> >>> +    }
> >>> +
> >>> +    /* Kick right away to begin processing requests already in vring=
 */
> >>> +    for (i =3D 0; i < vbc->dev.nvqs; i++) {
> >>> +        VirtQueue *kick_vq =3D virtio_get_queue(vdev, i);
> >>> +
> >>> +        if (!virtio_queue_get_desc_addr(vdev, i)) {
> >>> +            continue;
> >>> +        }
> >>> +        event_notifier_set(virtio_queue_get_host_notifier(kick_vq));
> >>> +    }
> >>> +}
> >>> +
> >>> +static void vhost_vdpa_blk_device_realize(DeviceState *dev, Error **=
errp)
> >>> +{
> >>> +    VirtIODevice *vdev =3D VIRTIO_DEVICE(dev);
> >>> +    VHostVdpaBlk *s =3D VHOST_VDPA_BLK(vdev);
> >>> +    VHostBlkCommon *vbc =3D VHOST_BLK_COMMON(s);
> >>> +    Error *err =3D NULL;
> >>> +    int ret;
> >>> +
> >>> +    s->vdpa.device_fd =3D qemu_open_old(s->vdpa_dev, O_RDWR);
> >>> +    if (s->vdpa.device_fd =3D=3D -1) {
> >>> +        error_setg(errp, "vhost-vdpa-blk: open %s failed: %s",
> >>> +                   s->vdpa_dev, strerror(errno));
> >>> +        return;
> >>> +    }
> >>> +
> >>> +    vhost_blk_common_realize(vbc, vhost_vdpa_blk_handle_output, &err=
);
> >>> +    if (err !=3D NULL) {
> >>> +        error_propagate(errp, err);
> >>> +        goto blk_err;
> >>> +    }
> >>> +
> >>> +    vbc->vhost_vqs =3D g_new0(struct vhost_virtqueue, vbc->num_queue=
s);
> >>> +    vbc->dev.nvqs =3D vbc->num_queues;
> >>> +    vbc->dev.vqs =3D vbc->vhost_vqs;
> >>> +    vbc->dev.vq_index =3D 0;
> >>> +    vbc->dev.backend_features =3D 0;
> >>> +    vbc->started =3D false;
> >>> +
> >>> +    vhost_dev_set_config_notifier(&vbc->dev, &blk_ops);
> >>> +
> >>> +    ret =3D vhost_dev_init(&vbc->dev, &s->vdpa, VHOST_BACKEND_TYPE_V=
DPA, 0);
> >>> +    if (ret < 0) {
> >>> +        error_setg(errp, "vhost-vdpa-blk: vhost initialization faile=
d: %s",
> >>> +                   strerror(-ret));
> >>> +        goto init_err;
> >>> +    }
> >>> +
> >>> +    ret =3D vhost_dev_get_config(&vbc->dev, (uint8_t *)&vbc->blkcfg,
> >>> +                               sizeof(struct virtio_blk_config));
> >>> +    if (ret < 0) {
> >>> +        error_setg(errp, "vhost-vdpa-blk: get block config failed");
> >>> +        goto config_err;
> >>> +    }
> >>> +
> >>> +    return;
> >>> +config_err:
> >>> +    vhost_dev_cleanup(&vbc->dev);
> >>> +init_err:
> >>> +    vhost_blk_common_unrealize(vbc);
> >>> +blk_err:
> >>> +    close(s->vdpa.device_fd);
> >>> +}
> >>> +
> >>> +static void vhost_vdpa_blk_device_unrealize(DeviceState *dev)
> >>> +{
> >>> +    VirtIODevice *vdev =3D VIRTIO_DEVICE(dev);
> >>> +    VHostVdpaBlk *s =3D VHOST_VDPA_BLK(dev);
> >>> +    VHostBlkCommon *vbc =3D VHOST_BLK_COMMON(s);
> >>> +
> >>> +    virtio_set_status(vdev, 0);
> >>> +    vhost_dev_cleanup(&vbc->dev);
> >>> +    vhost_blk_common_unrealize(vbc);
> >>> +    close(s->vdpa.device_fd);
> >>> +}
> >>> +
> >>> +static void vhost_vdpa_blk_instance_init(Object *obj)
> >>> +{
> >>> +    VHostBlkCommon *vbc =3D VHOST_BLK_COMMON(obj);
> >>> +
> >>> +    vbc->feature_bits =3D vdpa_feature_bits;
> >>> +
> >>> +    device_add_bootindex_property(obj, &vbc->bootindex, "bootindex",
> >>> +                                  "/disk@0,0", DEVICE(obj));
> >>> +}
> >>> +
> >>> +static const VMStateDescription vmstate_vhost_vdpa_blk =3D {
> >>> +    .name =3D "vhost-vdpa-blk",
> >>> +    .minimum_version_id =3D 1,
> >>> +    .version_id =3D 1,
> >>> +    .fields =3D (VMStateField[]) {
> >>> +        VMSTATE_VIRTIO_DEVICE,
> >>> +        VMSTATE_END_OF_LIST()
> >>> +    },
> >>> +};
> >>> +
> >>> +static Property vhost_vdpa_blk_properties[] =3D {
> >>> +    DEFINE_PROP_STRING("vdpa-dev", VHostVdpaBlk, vdpa_dev),
> >>> +    DEFINE_PROP_UINT16("num-queues", VHostBlkCommon, num_queues,
> >>> +                       VHOST_BLK_AUTO_NUM_QUEUES),
> >>> +    DEFINE_PROP_UINT32("queue-size", VHostBlkCommon, queue_size, 256=
),
> >>> +    DEFINE_PROP_BIT("config-wce", VHostBlkCommon, config_wce, 0, tru=
e),
> >>> +    DEFINE_PROP_END_OF_LIST(),
> >>> +};
> >>> +
> >>> +static void vhost_vdpa_blk_class_init(ObjectClass *klass, void *data=
)
> >>> +{
> >>> +    DeviceClass *dc =3D DEVICE_CLASS(klass);
> >>> +    VirtioDeviceClass *vdc =3D VIRTIO_DEVICE_CLASS(klass);
> >>> +
> >>> +    device_class_set_props(dc, vhost_vdpa_blk_properties);
> >>> +    dc->vmsd =3D &vmstate_vhost_vdpa_blk;
> >>> +    set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
> >>> +    vdc->realize =3D vhost_vdpa_blk_device_realize;
> >>> +    vdc->unrealize =3D vhost_vdpa_blk_device_unrealize;
> >>> +    vdc->set_status =3D vhost_vdpa_blk_set_status;
> >>> +}
> >>> +
> >>> +static const TypeInfo vhost_vdpa_blk_info =3D {
> >>> +    .name =3D TYPE_VHOST_VDPA_BLK,
> >>> +    .parent =3D TYPE_VHOST_BLK_COMMON,
> >>> +    .instance_size =3D sizeof(VHostVdpaBlk),
> >>> +    .instance_init =3D vhost_vdpa_blk_instance_init,
> >>> +    .class_init =3D vhost_vdpa_blk_class_init,
> >>> +};
> >>> +
> >>> +static void virtio_register_types(void)
> >>> +{
> >>> +    type_register_static(&vhost_vdpa_blk_info);
> >>> +}
> >>> +
> >>> +type_init(virtio_register_types)
> >>> diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
> >>> index fbff9bc9d4..f02bea65a2 100644
> >>> --- a/hw/virtio/meson.build
> >>> +++ b/hw/virtio/meson.build
> >>> @@ -30,6 +30,7 @@ virtio_pci_ss =3D ss.source_set()
> >>>    virtio_pci_ss.add(when: 'CONFIG_VHOST_VSOCK', if_true: files('vhos=
t-vsock-pci.c'))
> >>>    virtio_pci_ss.add(when: 'CONFIG_VHOST_USER_VSOCK', if_true: files(=
'vhost-user-vsock-pci.c'))
> >>>    virtio_pci_ss.add(when: 'CONFIG_VHOST_USER_BLK', if_true: files('v=
host-user-blk-pci.c'))
> >>> +virtio_pci_ss.add(when: 'CONFIG_VHOST_VDPA_BLK', if_true: files('vho=
st-vdpa-blk-pci.c'))
> >>>    virtio_pci_ss.add(when: 'CONFIG_VHOST_USER_INPUT', if_true: files(=
'vhost-user-input-pci.c'))
> >>>    virtio_pci_ss.add(when: 'CONFIG_VHOST_USER_SCSI', if_true: files('=
vhost-user-scsi-pci.c'))
> >>>    virtio_pci_ss.add(when: 'CONFIG_VHOST_SCSI', if_true: files('vhost=
-scsi-pci.c'))
> >>> diff --git a/hw/virtio/vhost-vdpa-blk-pci.c b/hw/virtio/vhost-vdpa-bl=
k-pci.c
> >>> new file mode 100644
> >>> index 0000000000..976c47fb4f
> >>> --- /dev/null
> >>> +++ b/hw/virtio/vhost-vdpa-blk-pci.c
> >>> @@ -0,0 +1,101 @@
> >>> +/*
> >>> + * vhost-vdpa-blk PCI Bindings
> >>> + *
> >>> + * Copyright (C) 2021 Bytedance Inc. and/or its affiliates. All righ=
ts reserved.
> >>> + *
> >>> + * Author:
> >>> + *   Xie Yongji <xieyongji@bytedance.com>
> >>> + *
> >>> + * This work is licensed under the terms of the GNU GPL, version 2. =
 See
> >>> + * the COPYING file in the top-level directory.
> >>> + *
> >>> + */
> >>> +
> >>> +#include "qemu/osdep.h"
> >>> +#include "standard-headers/linux/virtio_pci.h"
> >>> +#include "hw/virtio/virtio.h"
> >>> +#include "hw/virtio/vhost-vdpa-blk.h"
> >>> +#include "hw/pci/pci.h"
> >>> +#include "hw/qdev-properties.h"
> >>> +#include "qapi/error.h"
> >>> +#include "qemu/error-report.h"
> >>> +#include "qemu/module.h"
> >>> +#include "virtio-pci.h"
> >>> +#include "qom/object.h"
> >>> +
> >>> +typedef struct VHostVdpaBlkPCI VHostVdpaBlkPCI;
> >>> +
> >>> +#define TYPE_VHOST_VDPA_BLK_PCI "vhost-vdpa-blk-pci-base"
> >>> +DECLARE_INSTANCE_CHECKER(VHostVdpaBlkPCI, VHOST_VDPA_BLK_PCI,
> >>> +                         TYPE_VHOST_VDPA_BLK_PCI)
> >>> +
> >>> +struct VHostVdpaBlkPCI {
> >>> +    VirtIOPCIProxy parent_obj;
> >>> +    VHostVdpaBlk vdev;
> >>> +};
> >>> +
> >>> +static Property vhost_vdpa_blk_pci_properties[] =3D {
> >>> +    DEFINE_PROP_UINT32("class", VirtIOPCIProxy, class_code, 0),
> >>> +    DEFINE_PROP_UINT32("vectors", VirtIOPCIProxy, nvectors,
> >>> +                       DEV_NVECTORS_UNSPECIFIED),
> >>> +    DEFINE_PROP_END_OF_LIST(),
> >>> +};
> >>> +
> >>> +static void vhost_vdpa_blk_pci_realize(VirtIOPCIProxy *vpci_dev, Err=
or **errp)
> >>> +{
> >>> +    VHostVdpaBlkPCI *dev =3D VHOST_VDPA_BLK_PCI(vpci_dev);
> >>> +    DeviceState *vdev =3D DEVICE(&dev->vdev);
> >>> +    VHostBlkCommon *vbc =3D VHOST_BLK_COMMON(&dev->vdev);
> >>> +
> >>> +    if (vbc->num_queues =3D=3D VHOST_BLK_AUTO_NUM_QUEUES) {
> >>> +        vbc->num_queues =3D virtio_pci_optimal_num_queues(0);
> >>> +    }
> >>> +
> >>> +    if (vpci_dev->nvectors =3D=3D DEV_NVECTORS_UNSPECIFIED) {
> >>> +        vpci_dev->nvectors =3D vbc->num_queues + 1;
> >>> +    }
> >>> +
> >>> +    qdev_realize(vdev, BUS(&vpci_dev->bus), errp);
> >>> +}
> >>> +
> >>> +static void vhost_vdpa_blk_pci_class_init(ObjectClass *klass, void *=
data)
> >>> +{
> >>> +    DeviceClass *dc =3D DEVICE_CLASS(klass);
> >>> +    VirtioPCIClass *k =3D VIRTIO_PCI_CLASS(klass);
> >>> +    PCIDeviceClass *pcidev_k =3D PCI_DEVICE_CLASS(klass);
> >>> +
> >>> +    set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
> >>> +    device_class_set_props(dc, vhost_vdpa_blk_pci_properties);
> >>> +    k->realize =3D vhost_vdpa_blk_pci_realize;
> >>> +    pcidev_k->vendor_id =3D PCI_VENDOR_ID_REDHAT_QUMRANET;
> >>> +    pcidev_k->device_id =3D PCI_DEVICE_ID_VIRTIO_BLOCK;
> >>> +    pcidev_k->revision =3D VIRTIO_PCI_ABI_VERSION;
> >>> +    pcidev_k->class_id =3D PCI_CLASS_STORAGE_SCSI;
> >>> +}
> >>> +
> >>> +static void vhost_vdpa_blk_pci_instance_init(Object *obj)
> >>> +{
> >>> +    VHostVdpaBlkPCI *dev =3D VHOST_VDPA_BLK_PCI(obj);
> >>> +
> >>> +    virtio_instance_init_common(obj, &dev->vdev, sizeof(dev->vdev),
> >>> +                                TYPE_VHOST_VDPA_BLK);
> >>> +    object_property_add_alias(obj, "bootindex", OBJECT(&dev->vdev),
> >>> +                              "bootindex");
> >>> +}
> >>> +
> >>> +static const VirtioPCIDeviceTypeInfo vhost_vdpa_blk_pci_info =3D {
> >>> +    .base_name               =3D TYPE_VHOST_VDPA_BLK_PCI,
> >>> +    .generic_name            =3D "vhost-vdpa-blk-pci",
> >>> +    .transitional_name       =3D "vhost-vdpa-blk-pci-transitional",
> >>> +    .non_transitional_name   =3D "vhost-vdpa-blk-pci-non-transitiona=
l",
> >>> +    .instance_size  =3D sizeof(VHostVdpaBlkPCI),
> >>> +    .instance_init  =3D vhost_vdpa_blk_pci_instance_init,
> >>> +    .class_init     =3D vhost_vdpa_blk_pci_class_init,
> >>> +};
> >>> +
> >>> +static void vhost_vdpa_blk_pci_register(void)
> >>> +{
> >>> +    virtio_pci_types_register(&vhost_vdpa_blk_pci_info);
> >>> +}
> >>
> >> I wonder how could we use virtio-mmio for vDPA block here.
> >>
> > Use something like:
> >
> > -device vhost-vdpa-blk,vdpa-dev=3D/dev/vhost-vdpa-0 ?
>
>
> Something like this, making vDPA indepedent for a specific bus is a
> great advantage.
>

Yes, and I think we already support that.

Thanks,
Yongji

