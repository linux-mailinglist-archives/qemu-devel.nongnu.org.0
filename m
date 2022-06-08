Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9644D543FC7
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 01:12:37 +0200 (CEST)
Received: from localhost ([::1]:48932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nz4qq-0003ev-5R
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 19:12:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nz4pP-0002yU-PT
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 19:11:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nz4pJ-0005In-No
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 19:11:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654729860;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5NCXIAZSJhyReRKfXoYdJM6pfx9uN0uIJaIaJAX882U=;
 b=TF/bXZKXYpLIvjW2R4/iUxYyja38T6VhkA4IttmoEQSeG+M0pW5TBmv4dXmDSIqbyhnqtA
 0Ipd/1vSL0ZAuAtSusF1stkReS/facEvVu2GArhFZugg7PCR/DOKZYDYWEWiD2N47LBELY
 e94unuEB+MTXmi5kSUW0jRNrxdZFCG4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-643-9OyM2hcuOb-78DLUT1w1Kw-1; Wed, 08 Jun 2022 19:10:59 -0400
X-MC-Unique: 9OyM2hcuOb-78DLUT1w1Kw-1
Received: by mail-wm1-f69.google.com with SMTP id
 o3-20020a05600c510300b0039743540ac7so7505397wms.5
 for <qemu-devel@nongnu.org>; Wed, 08 Jun 2022 16:10:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=5NCXIAZSJhyReRKfXoYdJM6pfx9uN0uIJaIaJAX882U=;
 b=uCq5H1izEmc23AAnMYfWvpghYrta/niG0/KJVxS6ajcg5ar51iPeV6AmQYODUse2q9
 93WhIU9MlyK6rBncMp3agpJrcpnjDqbDxRRjeDLr7EGJerEWWRyit1STs6HjuFyEbEiA
 Qu8O48CWU988U46QI5jdQsj0s6g5oxpClPqIHV9lAh5JiLdlVFtgFsOzSFq0bx+/kRJL
 1u0o2AxGPvLYx8LD9GwfacnVX36CE9uoJj6gG1rAuj2WFQqGmK8CnahaSI3EgHz5FcF8
 4bCUvl7+9Ams8o1MXOOI6CuVkwrLaqwU1Q/AzvPB+fdMr+7KtjaHFCc0CyQpDNFWoVJd
 wusw==
X-Gm-Message-State: AOAM533IsfkYc44fJo3OwSUfUysvFX/1FogIiyXZ8GNaGXHF9LnPqjHF
 JJqOWUMStWvrxz1LTrDcJ/TH6hH81Yz41RU+joOYKVdpXKbwNO5eF/fXiOgGy746zWulfV4CSd1
 yPwQpNkMKAMbrL1o=
X-Received: by 2002:a1c:e903:0:b0:397:36b8:795a with SMTP id
 q3-20020a1ce903000000b0039736b8795amr303663wmc.98.1654729858019; 
 Wed, 08 Jun 2022 16:10:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwaepeOSxSy/bF/+31sXNcnnRajz6RkQ+46rKS8WCX6dfCwNvQw29B6guu3l6WaunU6JnSARw==
X-Received: by 2002:a1c:e903:0:b0:397:36b8:795a with SMTP id
 q3-20020a1ce903000000b0039736b8795amr303637wmc.98.1654729857744; 
 Wed, 08 Jun 2022 16:10:57 -0700 (PDT)
Received: from redhat.com ([2.53.13.104]) by smtp.gmail.com with ESMTPSA id
 k24-20020a05600c1c9800b0039c5645c60fsm388771wms.3.2022.06.08.16.10.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 16:10:57 -0700 (PDT)
Date: Wed, 8 Jun 2022 19:10:52 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Longpeng(Mike)" <longpeng2@huawei.com>
Cc: stefanha@redhat.com, jasowang@redhat.com, sgarzare@redhat.com,
 cohuck@redhat.com, pbonzini@redhat.com, arei.gonglei@huawei.com,
 yechuan@huawei.com, huangzhichao@huawei.com, qemu-devel@nongnu.org
Subject: Re: [PATCH v6 resend 4/4] vdpa: add vdpa-dev-pci support
Message-ID: <20220608191041-mutt-send-email-mst@kernel.org>
References: <20220514041107.1980-1-longpeng2@huawei.com>
 <20220514041107.1980-5-longpeng2@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220514041107.1980-5-longpeng2@huawei.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Sat, May 14, 2022 at 12:11:07PM +0800, Longpeng(Mike) wrote:
> From: Longpeng <longpeng2@huawei.com>
>=20
> Supports vdpa-dev-pci, we can use the device as follow:
>=20
> -device vhost-vdpa-device-pci,vhostdev=3D/dev/vhost-vdpa-X
>=20
> Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
> Signed-off-by: Longpeng <longpeng2@huawei.com>


Build fails:

FAILED: libqemu-aarch64-softmmu.fa.p/hw_virtio_vdpa-dev-pci.c.o=20
cc -m64 -mcx16 -Ilibqemu-aarch64-softmmu.fa.p -I. -I.. -Itarget/arm -I../ta=
rget/arm -Iqapi -Itrace -Iui -Iui/shader -I/usr/include/pixman-1 -I/usr/inc=
lude/capstone -I/usr/include/spice-server -I/usr/include/spice-1 -I/usr/inc=
lude/cacard -I/usr/include/glib-2.0 -I/usr/lib64/glib-2.0/include -I/usr/in=
clude/sysprof-4 -I/usr/include/nss3 -I/usr/include/nspr4 -I/usr/include/PCS=
C -fdiagnostics-color=3Dauto -Wall -Winvalid-pch -Werror -std=3Dgnu11 -O2 -=
g -isystem /scm/qemu/linux-headers -isystem linux-headers -iquote . -iquote=
 /scm/qemu -iquote /scm/qemu/include -iquote /scm/qemu/disas/libvixl -iquot=
e /scm/qemu/tcg/i386 -pthread -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=3D2 -D_GN=
U_SOURCE -D_FILE_OFFSET_BITS=3D64 -D_LARGEFILE_SOURCE -Wstrict-prototypes -=
Wredundant-decls -Wundef -Wwrite-strings -Wmissing-prototypes -fno-strict-a=
liasing -fno-common -fwrapv -Wold-style-declaration -Wold-style-definition =
-Wtype-limits -Wformat-security -Wformat-y2k -Winit-self -Wignored-qualifie=
rs -Wempty-body -Wnested-externs -Wendif-labels -Wexpansion-to-defined -Wim=
plicit-fallthrough=3D2 -Wno-missing-include-dirs -Wno-shift-negative-value =
-Wno-psabi -fstack-protector-strong -fPIE -isystem../linux-headers -isystem=
linux-headers -DNEED_CPU_H '-DCONFIG_TARGET=3D"aarch64-softmmu-config-targe=
t.h"' '-DCONFIG_DEVICES=3D"aarch64-softmmu-config-devices.h"' -MD -MQ libqe=
mu-aarch64-softmmu.fa.p/hw_virtio_vdpa-dev-pci.c.o -MF libqemu-aarch64-soft=
mmu.fa.p/hw_virtio_vdpa-dev-pci.c.o.d -o libqemu-aarch64-softmmu.fa.p/hw_vi=
rtio_vdpa-dev-pci.c.o -c ../hw/virtio/vdpa-dev-pci.c
=2E./hw/virtio/vdpa-dev-pci.c:26:10: fatal error: virtio-pci.h: No such fil=
e or directory
   26 | #include "virtio-pci.h"
      |          ^~~~~~~~~~~~~~
compilation terminated.


> ---
>  hw/virtio/meson.build    |   1 +
>  hw/virtio/vdpa-dev-pci.c | 102 +++++++++++++++++++++++++++++++++++++++
>  2 files changed, 103 insertions(+)
>  create mode 100644 hw/virtio/vdpa-dev-pci.c
>=20
> diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
> index 8f6f86db71..c2da69616f 100644
> --- a/hw/virtio/meson.build
> +++ b/hw/virtio/meson.build
> @@ -50,6 +50,7 @@ virtio_pci_ss.add(when: 'CONFIG_VIRTIO_SERIAL', if_true=
: files('virtio-serial-pc
>  virtio_pci_ss.add(when: 'CONFIG_VIRTIO_PMEM', if_true: files('virtio-pme=
m-pci.c'))
>  virtio_pci_ss.add(when: 'CONFIG_VIRTIO_IOMMU', if_true: files('virtio-io=
mmu-pci.c'))
>  virtio_pci_ss.add(when: 'CONFIG_VIRTIO_MEM', if_true: files('virtio-mem-=
pci.c'))
> +virtio_pci_ss.add(when: 'CONFIG_VHOST_VDPA_DEV', if_true: files('vdpa-de=
v-pci.c'))
> =20
>  virtio_ss.add_all(when: 'CONFIG_VIRTIO_PCI', if_true: virtio_pci_ss)
> =20
> diff --git a/hw/virtio/vdpa-dev-pci.c b/hw/virtio/vdpa-dev-pci.c
> new file mode 100644
> index 0000000000..fde35dfc92
> --- /dev/null
> +++ b/hw/virtio/vdpa-dev-pci.c
> @@ -0,0 +1,102 @@
> +/*
> + * Vhost Vdpa Device PCI Bindings
> + *
> + * Copyright (c) Huawei Technologies Co., Ltd. 2022. All Rights Reserved.
> + *
> + * Authors:
> + *   Longpeng <longpeng2@huawei.com>
> + *
> + * Largely based on the "vhost-user-blk-pci.c" and "vhost-user-blk.c"
> + * implemented by:
> + *   Changpeng Liu <changpeng.liu@intel.com>
> + *
> + * This work is licensed under the terms of the GNU LGPL, version 2 or l=
ater.
> + * See the COPYING.LIB file in the top-level directory.
> + */
> +#include "qemu/osdep.h"
> +#include <sys/ioctl.h>
> +#include <linux/vhost.h>
> +#include "hw/virtio/virtio.h"
> +#include "hw/virtio/vdpa-dev.h"
> +#include "hw/pci/pci.h"
> +#include "hw/qdev-properties.h"
> +#include "qapi/error.h"
> +#include "qemu/error-report.h"
> +#include "qemu/module.h"
> +#include "virtio-pci.h"
> +#include "qom/object.h"
> +
> +
> +typedef struct VhostVdpaDevicePCI VhostVdpaDevicePCI;
> +
> +#define TYPE_VHOST_VDPA_DEVICE_PCI "vhost-vdpa-device-pci-base"
> +DECLARE_INSTANCE_CHECKER(VhostVdpaDevicePCI, VHOST_VDPA_DEVICE_PCI,
> +                         TYPE_VHOST_VDPA_DEVICE_PCI)
> +
> +struct VhostVdpaDevicePCI {
> +    VirtIOPCIProxy parent_obj;
> +    VhostVdpaDevice vdev;
> +};
> +
> +static void vhost_vdpa_device_pci_instance_init(Object *obj)
> +{
> +    VhostVdpaDevicePCI *dev =3D VHOST_VDPA_DEVICE_PCI(obj);
> +
> +    virtio_instance_init_common(obj, &dev->vdev, sizeof(dev->vdev),
> +                                TYPE_VHOST_VDPA_DEVICE);
> +    object_property_add_alias(obj, "bootindex", OBJECT(&dev->vdev),
> +                              "bootindex");
> +}
> +
> +static Property vhost_vdpa_device_pci_properties[] =3D {
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static int vhost_vdpa_device_pci_post_init(VhostVdpaDevice *v, Error **e=
rrp)
> +{
> +    VhostVdpaDevicePCI *dev =3D container_of(v, VhostVdpaDevicePCI, vdev=
);
> +    VirtIOPCIProxy *vpci_dev =3D &dev->parent_obj;
> +
> +    vpci_dev->class_code =3D virtio_pci_get_class_id(v->vdev_id);
> +    vpci_dev->trans_devid =3D virtio_pci_get_trans_devid(v->vdev_id);
> +    /* one for config vector */
> +    vpci_dev->nvectors =3D v->num_queues + 1;
> +
> +    return 0;
> +}
> +
> +static void
> +vhost_vdpa_device_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
> +{
> +    VhostVdpaDevicePCI *dev =3D VHOST_VDPA_DEVICE_PCI(vpci_dev);
> +
> +    dev->vdev.post_init =3D vhost_vdpa_device_pci_post_init;
> +    qdev_realize(DEVICE(&dev->vdev), BUS(&vpci_dev->bus), errp);
> +}
> +
> +static void vhost_vdpa_device_pci_class_init(ObjectClass *klass, void *d=
ata)
> +{
> +    DeviceClass *dc =3D DEVICE_CLASS(klass);
> +    VirtioPCIClass *k =3D VIRTIO_PCI_CLASS(klass);
> +
> +    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
> +    device_class_set_props(dc, vhost_vdpa_device_pci_properties);
> +    k->realize =3D vhost_vdpa_device_pci_realize;
> +}
> +
> +static const VirtioPCIDeviceTypeInfo vhost_vdpa_device_pci_info =3D {
> +    .base_name               =3D TYPE_VHOST_VDPA_DEVICE_PCI,
> +    .generic_name            =3D "vhost-vdpa-device-pci",
> +    .transitional_name       =3D "vhost-vdpa-device-pci-transitional",
> +    .non_transitional_name   =3D "vhost-vdpa-device-pci-non-transitional=
",
> +    .instance_size  =3D sizeof(VhostVdpaDevicePCI),
> +    .instance_init  =3D vhost_vdpa_device_pci_instance_init,
> +    .class_init     =3D vhost_vdpa_device_pci_class_init,
> +};
> +
> +static void vhost_vdpa_device_pci_register(void)
> +{
> +    virtio_pci_types_register(&vhost_vdpa_device_pci_info);
> +}
> +
> +type_init(vhost_vdpa_device_pci_register);
> --=20
> 2.23.0


