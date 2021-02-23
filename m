Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB2A322C99
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 15:42:49 +0100 (CET)
Received: from localhost ([::1]:44256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEYtk-0002F3-4g
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 09:42:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1lEYrC-0000MQ-Vx; Tue, 23 Feb 2021 09:40:12 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:42489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1lEYr8-0006sH-V9; Tue, 23 Feb 2021 09:40:10 -0500
Received: by mail-ej1-x635.google.com with SMTP id lu16so34844625ejb.9;
 Tue, 23 Feb 2021 06:40:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=gemQ+30vB2xNjN6aJ9+UPYlpjXhd5+Guk/37VNF6wEQ=;
 b=GY4yQLHbn7EUXSL0lJzLY2Gffg3Vx6BzrtcxEht602yEs8NWz/y/qLsxr+oFa/3EfD
 +SGf0T/B1s+Bdo3t8ZOoSuERDoZmSoPo8yHcSIv36z1Zr41M/7y6u5qEZ1l2dWzQia7T
 QeErOWqZW8qtbdVxIqD07j7TItaKs+CykOBDgsZDA5OvjFDc4tTAHmdrSa7X+BfztjWK
 xQZKf4lx7NXXReEFA4k0dox+IcTmtjIKsYDiiyAJNLn2nmHCxlW/i+6fX9LI55zq+39f
 P/Khuh6SBkhMby7mTFDZCbHCjjGDRgL2aT5CcsRu1FmQvNiUVGOGMmCs0IaErNHPFW5r
 fWYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=gemQ+30vB2xNjN6aJ9+UPYlpjXhd5+Guk/37VNF6wEQ=;
 b=mdg9NsmY3o+iGFiyFouGs5W3nIAAl0A5x8Qnq7d+kjr+5ytWVfqT4InphDjFrfXJLM
 xQweDr/AuMunW6E+oE+X4rEbnXTCa0EHxH9XHR9/SqTn5TfWKiss8NDjtStJ3YOcoj/c
 dvtZzl7a9NK/WrdHCYbwknQX0kz1qD223tKTlh/a2hndo3y8IeUAfk6ninafYPSPX8Nc
 a0eUqcgDx399l1pQFEgJzx2auXU5OAJnettAFz4zEROYBvCiEypM8vqG36Y0IoyuykeB
 PEdWhiL1/JMhvdU+xyz1tNhcHWxh34mCnub2shjqxnjF8bPiDnuKSd5wyL5xYdakcxMw
 IBnQ==
X-Gm-Message-State: AOAM530zaGQAznQeUUKpueHrW4jsEuIxsPtK0GeXbXM6spwWFpgfOUA+
 3J1+re7QWfeURqhrzWXnRiE=
X-Google-Smtp-Source: ABdhPJwe5lcWUsCdBPeY4UL9CfiaBiT/7DdpwLHAgVWGAXSfIRi+r70yV4a252nOEfMP63xJvhwKSg==
X-Received: by 2002:a17:906:b082:: with SMTP id
 x2mr25515424ejy.100.1614091204299; 
 Tue, 23 Feb 2021 06:40:04 -0800 (PST)
Received: from localhost ([51.15.41.238])
 by smtp.gmail.com with ESMTPSA id ly8sm6963955ejb.124.2021.02.23.06.40.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Feb 2021 06:40:03 -0800 (PST)
Date: Tue, 23 Feb 2021 14:40:02 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Coiby Xu <coiby.xu@gmail.com>
Subject: Re: [PATCH v2 05/12] test: new qTest case to test the
 vhost-user-blk-server
Message-ID: <YDUTwvndtdN2SRM0@stefanha-x1.localdomain>
References: <20201207172030.251905-1-stefanha@redhat.com>
 <20201207172030.251905-6-stefanha@redhat.com>
 <20201218145632.7id2vg3pyngqhezs@Rk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="cuNjXTHGRNFKwQzU"
Content-Disposition: inline
In-Reply-To: <20201218145632.7id2vg3pyngqhezs@Rk>
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=stefanha@gmail.com; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Raphael Norwitz <raphael.norwitz@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--cuNjXTHGRNFKwQzU
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 18, 2020 at 10:56:32PM +0800, Coiby Xu wrote:
> On Mon, Dec 07, 2020 at 05:20:23PM +0000, Stefan Hajnoczi wrote:
> > From: Coiby Xu <coiby.xu@gmail.com>
> >=20
> > This test case has the same tests as tests/virtio-blk-test.c except for
> > tests have block_resize. Since the vhost-user-blk export only serves one
> > client one time, two exports are started by qemu-storage-daemon for the
> > hotplug test.
> >=20
> > Suggested-by: Thomas Huth <thuth@redhat.com>
> > Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > ---
> > MAINTAINERS                         |   2 +
> > tests/qtest/libqos/vhost-user-blk.h |  48 ++
> > tests/qtest/libqos/vhost-user-blk.c | 130 +++++
> > tests/qtest/vhost-user-blk-test.c   | 788 ++++++++++++++++++++++++++++
> > tests/qtest/libqos/meson.build      |   1 +
> > tests/qtest/meson.build             |   4 +
> > 6 files changed, 973 insertions(+)
> > create mode 100644 tests/qtest/libqos/vhost-user-blk.h
> > create mode 100644 tests/qtest/libqos/vhost-user-blk.c
> > create mode 100644 tests/qtest/vhost-user-blk-test.c
> >=20
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 68bc160f41..d351280d1f 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -3103,6 +3103,8 @@ F: block/export/vhost-user-blk-server.c
> > F: block/export/vhost-user-blk-server.h
> > F: include/qemu/vhost-user-server.h
> > F: tests/qtest/libqos/vhost-user-blk.c
> > +F: tests/qtest/libqos/vhost-user-blk.h
> > +F: tests/qtest/vhost-user-blk-test.c
> > F: util/vhost-user-server.c
> >=20
> > Replication
> > diff --git a/tests/qtest/libqos/vhost-user-blk.h b/tests/qtest/libqos/v=
host-user-blk.h
> > new file mode 100644
> > index 0000000000..2a03456a45
> > --- /dev/null
> > +++ b/tests/qtest/libqos/vhost-user-blk.h
> > @@ -0,0 +1,48 @@
> > +/*
> > + * libqos driver framework
> > + *
> > + * Based on tests/qtest/libqos/virtio-blk.c
> > + *
> > + * Copyright (c) 2020 Coiby Xu <coiby.xu@gmail.com>
> > + *
> > + * Copyright (c) 2018 Emanuele Giuseppe Esposito <e.emanuelegiuseppe@g=
mail.com>
> > + *
> > + * This library is free software; you can redistribute it and/or
> > + * modify it under the terms of the GNU Lesser General Public
> > + * License version 2 as published by the Free Software Foundation.
> > + *
> > + * This library is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> > + * Lesser General Public License for more details.
> > + *
> > + * You should have received a copy of the GNU Lesser General Public
> > + * License along with this library; if not, see <http://www.gnu.org/li=
censes/>
> > + */
> > +
> > +#ifndef TESTS_LIBQOS_VHOST_USER_BLK_H
> > +#define TESTS_LIBQOS_VHOST_USER_BLK_H
> > +
> > +#include "qgraph.h"
> > +#include "virtio.h"
> > +#include "virtio-pci.h"
> > +
> > +typedef struct QVhostUserBlk QVhostUserBlk;
> > +typedef struct QVhostUserBlkPCI QVhostUserBlkPCI;
> > +typedef struct QVhostUserBlkDevice QVhostUserBlkDevice;
> > +
> > +struct QVhostUserBlk {
> > +    QVirtioDevice *vdev;
> > +};
> > +
> > +struct QVhostUserBlkPCI {
> > +    QVirtioPCIDevice pci_vdev;
> > +    QVhostUserBlk blk;
> > +};
> > +
> > +struct QVhostUserBlkDevice {
> > +    QOSGraphObject obj;
> > +    QVhostUserBlk blk;
> > +};
> > +
> > +#endif
> > diff --git a/tests/qtest/libqos/vhost-user-blk.c b/tests/qtest/libqos/v=
host-user-blk.c
> > new file mode 100644
> > index 0000000000..568c3426ed
> > --- /dev/null
> > +++ b/tests/qtest/libqos/vhost-user-blk.c
> > @@ -0,0 +1,130 @@
> > +/*
> > + * libqos driver framework
> > + *
> > + * Based on tests/qtest/libqos/virtio-blk.c
> > + *
> > + * Copyright (c) 2020 Coiby Xu <coiby.xu@gmail.com>
> > + *
> > + * Copyright (c) 2018 Emanuele Giuseppe Esposito <e.emanuelegiuseppe@g=
mail.com>
> > + *
> > + * This library is free software; you can redistribute it and/or
> > + * modify it under the terms of the GNU Lesser General Public
> > + * License version 2.1 as published by the Free Software Foundation.
> > + *
> > + * This library is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> > + * Lesser General Public License for more details.
> > + *
> > + * You should have received a copy of the GNU Lesser General Public
> > + * License along with this library; if not, see <http://www.gnu.org/li=
censes/>
> > + */
> > +
> > +#include "qemu/osdep.h"
> > +#include "libqtest.h"
> > +#include "qemu/module.h"
> > +#include "standard-headers/linux/virtio_blk.h"
> > +#include "vhost-user-blk.h"
> > +
> > +#define PCI_SLOT                0x04
> > +#define PCI_FN                  0x00
> > +
> > +/* virtio-blk-device */
> > +static void *qvhost_user_blk_get_driver(QVhostUserBlk *v_blk,
> > +                                    const char *interface)
> > +{
> > +    if (!g_strcmp0(interface, "vhost-user-blk")) {
> > +        return v_blk;
> > +    }
> > +    if (!g_strcmp0(interface, "virtio")) {
> > +        return v_blk->vdev;
> > +    }
> > +
> > +    fprintf(stderr, "%s not present in vhost-user-blk-device\n", inter=
face);
> > +    g_assert_not_reached();
> > +}
> > +
> > +static void *qvhost_user_blk_device_get_driver(void *object,
> > +                                           const char *interface)
> > +{
> > +    QVhostUserBlkDevice *v_blk =3D object;
> > +    return qvhost_user_blk_get_driver(&v_blk->blk, interface);
> > +}
> > +
> > +static void *vhost_user_blk_device_create(void *virtio_dev,
> > +                                      QGuestAllocator *t_alloc,
> > +                                      void *addr)
> > +{
> > +    QVhostUserBlkDevice *vhost_user_blk =3D g_new0(QVhostUserBlkDevice=
, 1);
> > +    QVhostUserBlk *interface =3D &vhost_user_blk->blk;
> > +
> > +    interface->vdev =3D virtio_dev;
> > +
> > +    vhost_user_blk->obj.get_driver =3D qvhost_user_blk_device_get_driv=
er;
> > +
> > +    return &vhost_user_blk->obj;
> > +}
> > +
> > +/* virtio-blk-pci */
> > +static void *qvhost_user_blk_pci_get_driver(void *object, const char *=
interface)
> > +{
> > +    QVhostUserBlkPCI *v_blk =3D object;
> > +    if (!g_strcmp0(interface, "pci-device")) {
> > +        return v_blk->pci_vdev.pdev;
> > +    }
> > +    return qvhost_user_blk_get_driver(&v_blk->blk, interface);
> > +}
> > +
> > +static void *vhost_user_blk_pci_create(void *pci_bus, QGuestAllocator =
*t_alloc,
> > +                                      void *addr)
> > +{
> > +    QVhostUserBlkPCI *vhost_user_blk =3D g_new0(QVhostUserBlkPCI, 1);
> > +    QVhostUserBlk *interface =3D &vhost_user_blk->blk;
> > +    QOSGraphObject *obj =3D &vhost_user_blk->pci_vdev.obj;
> > +
> > +    virtio_pci_init(&vhost_user_blk->pci_vdev, pci_bus, addr);
> > +    interface->vdev =3D &vhost_user_blk->pci_vdev.vdev;
> > +
> > +    g_assert_cmphex(interface->vdev->device_type, =3D=3D, VIRTIO_ID_BL=
OCK);
> > +
> > +    obj->get_driver =3D qvhost_user_blk_pci_get_driver;
> > +
> > +    return obj;
> > +}
> > +
> > +static void vhost_user_blk_register_nodes(void)
> > +{
> > +    /*
> > +     * FIXME: every test using these two nodes needs to setup a
> > +     * -drive,id=3Ddrive0 otherwise QEMU is not going to start.
> > +     * Therefore, we do not include "produces" edge for virtio
> > +     * and pci-device yet.
> > +     */
> > +
> > +    char *arg =3D g_strdup_printf("id=3Ddrv0,chardev=3Dchar1,addr=3D%x=
=2E%x",
> > +                                PCI_SLOT, PCI_FN);
> > +
> > +    QPCIAddress addr =3D {
> > +        .devfn =3D QPCI_DEVFN(PCI_SLOT, PCI_FN),
> > +    };
> > +
> > +    QOSGraphEdgeOptions opts =3D { };
> > +
> > +    /* virtio-blk-device */
> > +    /** opts.extra_device_opts =3D "drive=3Ddrive0"; */
> > +    qos_node_create_driver("vhost-user-blk-device",
> > +                           vhost_user_blk_device_create);
> > +    qos_node_consumes("vhost-user-blk-device", "virtio-bus", &opts);
> > +    qos_node_produces("vhost-user-blk-device", "vhost-user-blk");
> > +
> > +    /* virtio-blk-pci */
> > +    opts.extra_device_opts =3D arg;
> > +    add_qpci_address(&opts, &addr);
> > +    qos_node_create_driver("vhost-user-blk-pci", vhost_user_blk_pci_cr=
eate);
> > +    qos_node_consumes("vhost-user-blk-pci", "pci-bus", &opts);
> > +    qos_node_produces("vhost-user-blk-pci", "vhost-user-blk");
> > +
> > +    g_free(arg);
> > +}
> > +
> > +libqos_init(vhost_user_blk_register_nodes);
> > diff --git a/tests/qtest/vhost-user-blk-test.c b/tests/qtest/vhost-user=
-blk-test.c
> > new file mode 100644
> > index 0000000000..175dccab98
> > --- /dev/null
> > +++ b/tests/qtest/vhost-user-blk-test.c
> > @@ -0,0 +1,788 @@
> > +/*
> > + * QTest testcase for Vhost-user Block Device
> > + *
> > + * Based on tests/qtest//virtio-blk-test.c
> > +
> > + * Copyright (c) 2014 SUSE LINUX Products GmbH
> > + * Copyright (c) 2014 Marc Mar=ED
> > + * Copyright (c) 2020 Coiby Xu
> > + *
> > + * This work is licensed under the terms of the GNU GPL, version 2 or =
later.
> > + * See the COPYING file in the top-level directory.
> > + */
> > +
> > +#include "qemu/osdep.h"
> > +#include "libqtest-single.h"
> > +#include "qemu/bswap.h"
> > +#include "qemu/module.h"
> > +#include "standard-headers/linux/virtio_blk.h"
> > +#include "standard-headers/linux/virtio_pci.h"
> > +#include "libqos/qgraph.h"
> > +#include "libqos/vhost-user-blk.h"
> > +#include "libqos/libqos-pc.h"
> > +
> > +#define TEST_IMAGE_SIZE         (64 * 1024 * 1024)
> > +#define QVIRTIO_BLK_TIMEOUT_US  (30 * 1000 * 1000)
> > +#define PCI_SLOT_HP             0x06
> > +
> > +typedef struct {
> > +    pid_t pid;
> > +} QemuStorageDaemonState;
> > +
> > +typedef struct QVirtioBlkReq {
> > +    uint32_t type;
> > +    uint32_t ioprio;
> > +    uint64_t sector;
> > +    char *data;
> > +    uint8_t status;
> > +} QVirtioBlkReq;
> > +
> > +#ifdef HOST_WORDS_BIGENDIAN
> > +static const bool host_is_big_endian =3D true;
> > +#else
> > +static const bool host_is_big_endian; /* false */
> > +#endif
> > +
> > +static inline void virtio_blk_fix_request(QVirtioDevice *d, QVirtioBlk=
Req *req)
> > +{
> > +    if (qvirtio_is_big_endian(d) !=3D host_is_big_endian) {
> > +        req->type =3D bswap32(req->type);
> > +        req->ioprio =3D bswap32(req->ioprio);
> > +        req->sector =3D bswap64(req->sector);
> > +    }
> > +}
> > +
> > +static inline void virtio_blk_fix_dwz_hdr(QVirtioDevice *d,
> > +    struct virtio_blk_discard_write_zeroes *dwz_hdr)
> > +{
> > +    if (qvirtio_is_big_endian(d) !=3D host_is_big_endian) {
> > +        dwz_hdr->sector =3D bswap64(dwz_hdr->sector);
> > +        dwz_hdr->num_sectors =3D bswap32(dwz_hdr->num_sectors);
> > +        dwz_hdr->flags =3D bswap32(dwz_hdr->flags);
> > +    }
> > +}
> > +
> > +static uint64_t virtio_blk_request(QGuestAllocator *alloc, QVirtioDevi=
ce *d,
> > +                                   QVirtioBlkReq *req, uint64_t data_s=
ize)
> > +{
> > +    uint64_t addr;
> > +    uint8_t status =3D 0xFF;
> > +    QTestState *qts =3D global_qtest;
> > +
> > +    switch (req->type) {
> > +    case VIRTIO_BLK_T_IN:
> > +    case VIRTIO_BLK_T_OUT:
> > +        g_assert_cmpuint(data_size % 512, =3D=3D, 0);
> > +        break;
> > +    case VIRTIO_BLK_T_DISCARD:
> > +    case VIRTIO_BLK_T_WRITE_ZEROES:
> > +        g_assert_cmpuint(data_size %
> > +                         sizeof(struct virtio_blk_discard_write_zeroes=
), =3D=3D, 0);
> > +        break;
> > +    default:
> > +        g_assert_cmpuint(data_size, =3D=3D, 0);
> > +    }
> > +
> > +    addr =3D guest_alloc(alloc, sizeof(*req) + data_size);
> > +
> > +    virtio_blk_fix_request(d, req);
> > +
> > +    qtest_memwrite(qts, addr, req, 16);
> > +    qtest_memwrite(qts, addr + 16, req->data, data_size);
> > +    qtest_memwrite(qts, addr + 16 + data_size, &status, sizeof(status)=
);
> > +
> > +    return addr;
> > +}
> > +
> > +/* Returns the request virtqueue so the caller can perform further tes=
ts */
> > +static QVirtQueue *test_basic(QVirtioDevice *dev, QGuestAllocator *all=
oc)
> > +{
> > +    QVirtioBlkReq req;
> > +    uint64_t req_addr;
> > +    uint64_t capacity;
> > +    uint64_t features;
> > +    uint32_t free_head;
> > +    uint8_t status;
> > +    char *data;
> > +    QTestState *qts =3D global_qtest;
> > +    QVirtQueue *vq;
> > +
> > +    features =3D qvirtio_get_features(dev);
> > +    features =3D features & ~(QVIRTIO_F_BAD_FEATURE |
> > +                    (1u << VIRTIO_RING_F_INDIRECT_DESC) |
> > +                    (1u << VIRTIO_RING_F_EVENT_IDX) |
> > +                    (1u << VIRTIO_BLK_F_SCSI));
> > +    qvirtio_set_features(dev, features);
> > +
> > +    capacity =3D qvirtio_config_readq(dev, 0);
> > +    g_assert_cmpint(capacity, =3D=3D, TEST_IMAGE_SIZE / 512);
> > +
> > +    vq =3D qvirtqueue_setup(dev, alloc, 0);
> > +
> > +    qvirtio_set_driver_ok(dev);
> > +
> > +    /* Write and read with 3 descriptor layout */
> > +    /* Write request */
> > +    req.type =3D VIRTIO_BLK_T_OUT;
> > +    req.ioprio =3D 1;
> > +    req.sector =3D 0;
> > +    req.data =3D g_malloc0(512);
> > +    strcpy(req.data, "TEST");
> > +
> > +    req_addr =3D virtio_blk_request(alloc, dev, &req, 512);
> > +
> > +    g_free(req.data);
> > +
> > +    free_head =3D qvirtqueue_add(qts, vq, req_addr, 16, false, true);
> > +    qvirtqueue_add(qts, vq, req_addr + 16, 512, false, true);
> > +    qvirtqueue_add(qts, vq, req_addr + 528, 1, true, false);
> > +
> > +    qvirtqueue_kick(qts, dev, vq, free_head);
> > +
> > +    qvirtio_wait_used_elem(qts, dev, vq, free_head, NULL,
> > +                           QVIRTIO_BLK_TIMEOUT_US);
> > +    status =3D readb(req_addr + 528);
> > +    g_assert_cmpint(status, =3D=3D, 0);
> > +
> > +    guest_free(alloc, req_addr);
> > +
> > +    /* Read request */
> > +    req.type =3D VIRTIO_BLK_T_IN;
> > +    req.ioprio =3D 1;
> > +    req.sector =3D 0;
> > +    req.data =3D g_malloc0(512);
> > +
> > +    req_addr =3D virtio_blk_request(alloc, dev, &req, 512);
> > +
> > +    g_free(req.data);
> > +
> > +    free_head =3D qvirtqueue_add(qts, vq, req_addr, 16, false, true);
> > +    qvirtqueue_add(qts, vq, req_addr + 16, 512, true, true);
> > +    qvirtqueue_add(qts, vq, req_addr + 528, 1, true, false);
> > +
> > +    qvirtqueue_kick(qts, dev, vq, free_head);
> > +
> > +    qvirtio_wait_used_elem(qts, dev, vq, free_head, NULL,
> > +                           QVIRTIO_BLK_TIMEOUT_US);
> > +    status =3D readb(req_addr + 528);
> > +    g_assert_cmpint(status, =3D=3D, 0);
> > +
> > +    data =3D g_malloc0(512);
> > +    qtest_memread(qts, req_addr + 16, data, 512);
> > +    g_assert_cmpstr(data, =3D=3D, "TEST");
> > +    g_free(data);
> > +
> > +    guest_free(alloc, req_addr);
> > +
> > +    if (features & (1u << VIRTIO_BLK_F_WRITE_ZEROES)) {
> > +        struct virtio_blk_discard_write_zeroes dwz_hdr;
> > +        void *expected;
> > +
> > +        /*
> > +         * WRITE_ZEROES request on the same sector of previous test wh=
ere
> > +         * we wrote "TEST".
> > +         */
> > +        req.type =3D VIRTIO_BLK_T_WRITE_ZEROES;
> > +        req.data =3D (char *) &dwz_hdr;
> > +        dwz_hdr.sector =3D 0;
> > +        dwz_hdr.num_sectors =3D 1;
> > +        dwz_hdr.flags =3D 0;
> > +
> > +        virtio_blk_fix_dwz_hdr(dev, &dwz_hdr);
> > +
> > +        req_addr =3D virtio_blk_request(alloc, dev, &req, sizeof(dwz_h=
dr));
> > +
> > +        free_head =3D qvirtqueue_add(qts, vq, req_addr, 16, false, tru=
e);
> > +        qvirtqueue_add(qts, vq, req_addr + 16, sizeof(dwz_hdr), false,=
 true);
> > +        qvirtqueue_add(qts, vq, req_addr + 16 + sizeof(dwz_hdr), 1, tr=
ue,
> > +                       false);
> > +
> > +        qvirtqueue_kick(qts, dev, vq, free_head);
> > +
> > +        qvirtio_wait_used_elem(qts, dev, vq, free_head, NULL,
> > +                               QVIRTIO_BLK_TIMEOUT_US);
> > +        status =3D readb(req_addr + 16 + sizeof(dwz_hdr));
> > +        g_assert_cmpint(status, =3D=3D, 0);
> > +
> > +        guest_free(alloc, req_addr);
> > +
> > +        /* Read request to check if the sector contains all zeroes */
> > +        req.type =3D VIRTIO_BLK_T_IN;
> > +        req.ioprio =3D 1;
> > +        req.sector =3D 0;
> > +        req.data =3D g_malloc0(512);
> > +
> > +        req_addr =3D virtio_blk_request(alloc, dev, &req, 512);
> > +
> > +        g_free(req.data);
> > +
> > +        free_head =3D qvirtqueue_add(qts, vq, req_addr, 16, false, tru=
e);
> > +        qvirtqueue_add(qts, vq, req_addr + 16, 512, true, true);
> > +        qvirtqueue_add(qts, vq, req_addr + 528, 1, true, false);
> > +
> > +        qvirtqueue_kick(qts, dev, vq, free_head);
> > +
> > +        qvirtio_wait_used_elem(qts, dev, vq, free_head, NULL,
> > +                               QVIRTIO_BLK_TIMEOUT_US);
> > +        status =3D readb(req_addr + 528);
> > +        g_assert_cmpint(status, =3D=3D, 0);
> > +
> > +        data =3D g_malloc(512);
> > +        expected =3D g_malloc0(512);
> > +        qtest_memread(qts, req_addr + 16, data, 512);
> > +        g_assert_cmpmem(data, 512, expected, 512);
> > +        g_free(expected);
> > +        g_free(data);
> > +
> > +        guest_free(alloc, req_addr);
> > +    }
> > +
> > +    if (features & (1u << VIRTIO_BLK_F_DISCARD)) {
> > +        struct virtio_blk_discard_write_zeroes dwz_hdr;
> > +
> > +        req.type =3D VIRTIO_BLK_T_DISCARD;
> > +        req.data =3D (char *) &dwz_hdr;
> > +        dwz_hdr.sector =3D 0;
> > +        dwz_hdr.num_sectors =3D 1;
> > +        dwz_hdr.flags =3D 0;
> > +
> > +        virtio_blk_fix_dwz_hdr(dev, &dwz_hdr);
> > +
> > +        req_addr =3D virtio_blk_request(alloc, dev, &req, sizeof(dwz_h=
dr));
> > +
> > +        free_head =3D qvirtqueue_add(qts, vq, req_addr, 16, false, tru=
e);
> > +        qvirtqueue_add(qts, vq, req_addr + 16, sizeof(dwz_hdr), false,=
 true);
> > +        qvirtqueue_add(qts, vq, req_addr + 16 + sizeof(dwz_hdr),
> > +                       1, true, false);
> > +
> > +        qvirtqueue_kick(qts, dev, vq, free_head);
> > +
> > +        qvirtio_wait_used_elem(qts, dev, vq, free_head, NULL,
> > +                               QVIRTIO_BLK_TIMEOUT_US);
> > +        status =3D readb(req_addr + 16 + sizeof(dwz_hdr));
> > +        g_assert_cmpint(status, =3D=3D, 0);
> > +
> > +        guest_free(alloc, req_addr);
> > +    }
> > +
> > +    if (features & (1u << VIRTIO_F_ANY_LAYOUT)) {
> > +        /* Write and read with 2 descriptor layout */
> > +        /* Write request */
> > +        req.type =3D VIRTIO_BLK_T_OUT;
> > +        req.ioprio =3D 1;
> > +        req.sector =3D 1;
> > +        req.data =3D g_malloc0(512);
> > +        strcpy(req.data, "TEST");
> > +
> > +        req_addr =3D virtio_blk_request(alloc, dev, &req, 512);
> > +
> > +        g_free(req.data);
> > +
> > +        free_head =3D qvirtqueue_add(qts, vq, req_addr, 528, false, tr=
ue);
> > +        qvirtqueue_add(qts, vq, req_addr + 528, 1, true, false);
> > +        qvirtqueue_kick(qts, dev, vq, free_head);
> > +
> > +        qvirtio_wait_used_elem(qts, dev, vq, free_head, NULL,
> > +                               QVIRTIO_BLK_TIMEOUT_US);
> > +        status =3D readb(req_addr + 528);
> > +        g_assert_cmpint(status, =3D=3D, 0);
> > +
> > +        guest_free(alloc, req_addr);
> > +
> > +        /* Read request */
> > +        req.type =3D VIRTIO_BLK_T_IN;
> > +        req.ioprio =3D 1;
> > +        req.sector =3D 1;
> > +        req.data =3D g_malloc0(512);
> > +
> > +        req_addr =3D virtio_blk_request(alloc, dev, &req, 512);
> > +
> > +        g_free(req.data);
> > +
> > +        free_head =3D qvirtqueue_add(qts, vq, req_addr, 16, false, tru=
e);
> > +        qvirtqueue_add(qts, vq, req_addr + 16, 513, true, false);
> > +
> > +        qvirtqueue_kick(qts, dev, vq, free_head);
> > +
> > +        qvirtio_wait_used_elem(qts, dev, vq, free_head, NULL,
> > +                               QVIRTIO_BLK_TIMEOUT_US);
> > +        status =3D readb(req_addr + 528);
> > +        g_assert_cmpint(status, =3D=3D, 0);
> > +
> > +        data =3D g_malloc0(512);
> > +        qtest_memread(qts, req_addr + 16, data, 512);
> > +        g_assert_cmpstr(data, =3D=3D, "TEST");
> > +        g_free(data);
> > +
> > +        guest_free(alloc, req_addr);
> > +    }
> > +
> > +    return vq;
> > +}
> > +
> > +static void basic(void *obj, void *data, QGuestAllocator *t_alloc)
> > +{
> > +    QVhostUserBlk *blk_if =3D obj;
> > +    QVirtQueue *vq;
> > +
> > +    vq =3D test_basic(blk_if->vdev, t_alloc);
> > +    qvirtqueue_cleanup(blk_if->vdev->bus, vq, t_alloc);
> > +
> > +}
> > +
> > +static void indirect(void *obj, void *u_data, QGuestAllocator *t_alloc)
> > +{
> > +    QVirtQueue *vq;
> > +    QVhostUserBlk *blk_if =3D obj;
> > +    QVirtioDevice *dev =3D blk_if->vdev;
> > +    QVirtioBlkReq req;
> > +    QVRingIndirectDesc *indirect;
> > +    uint64_t req_addr;
> > +    uint64_t capacity;
> > +    uint64_t features;
> > +    uint32_t free_head;
> > +    uint8_t status;
> > +    char *data;
> > +    QTestState *qts =3D global_qtest;
> > +
> > +    features =3D qvirtio_get_features(dev);
> > +    g_assert_cmphex(features & (1u << VIRTIO_RING_F_INDIRECT_DESC), !=
=3D, 0);
> > +    features =3D features & ~(QVIRTIO_F_BAD_FEATURE |
> > +                            (1u << VIRTIO_RING_F_EVENT_IDX) |
> > +                            (1u << VIRTIO_BLK_F_SCSI));
> > +    qvirtio_set_features(dev, features);
> > +
> > +    capacity =3D qvirtio_config_readq(dev, 0);
> > +    g_assert_cmpint(capacity, =3D=3D, TEST_IMAGE_SIZE / 512);
> > +
> > +    vq =3D qvirtqueue_setup(dev, t_alloc, 0);
> > +    qvirtio_set_driver_ok(dev);
> > +
> > +    /* Write request */
> > +    req.type =3D VIRTIO_BLK_T_OUT;
> > +    req.ioprio =3D 1;
> > +    req.sector =3D 0;
> > +    req.data =3D g_malloc0(512);
> > +    strcpy(req.data, "TEST");
> > +
> > +    req_addr =3D virtio_blk_request(t_alloc, dev, &req, 512);
> > +
> > +    g_free(req.data);
> > +
> > +    indirect =3D qvring_indirect_desc_setup(qts, dev, t_alloc, 2);
> > +    qvring_indirect_desc_add(dev, qts, indirect, req_addr, 528, false);
> > +    qvring_indirect_desc_add(dev, qts, indirect, req_addr + 528, 1, tr=
ue);
> > +    free_head =3D qvirtqueue_add_indirect(qts, vq, indirect);
> > +    qvirtqueue_kick(qts, dev, vq, free_head);
> > +
> > +    qvirtio_wait_used_elem(qts, dev, vq, free_head, NULL,
> > +                           QVIRTIO_BLK_TIMEOUT_US);
> > +    status =3D readb(req_addr + 528);
> > +    g_assert_cmpint(status, =3D=3D, 0);
> > +
> > +    g_free(indirect);
> > +    guest_free(t_alloc, req_addr);
> > +
> > +    /* Read request */
> > +    req.type =3D VIRTIO_BLK_T_IN;
> > +    req.ioprio =3D 1;
> > +    req.sector =3D 0;
> > +    req.data =3D g_malloc0(512);
> > +    strcpy(req.data, "TEST");
> > +
> > +    req_addr =3D virtio_blk_request(t_alloc, dev, &req, 512);
> > +
> > +    g_free(req.data);
> > +
> > +    indirect =3D qvring_indirect_desc_setup(qts, dev, t_alloc, 2);
> > +    qvring_indirect_desc_add(dev, qts, indirect, req_addr, 16, false);
> > +    qvring_indirect_desc_add(dev, qts, indirect, req_addr + 16, 513, t=
rue);
> > +    free_head =3D qvirtqueue_add_indirect(qts, vq, indirect);
> > +    qvirtqueue_kick(qts, dev, vq, free_head);
> > +
> > +    qvirtio_wait_used_elem(qts, dev, vq, free_head, NULL,
> > +                           QVIRTIO_BLK_TIMEOUT_US);
> > +    status =3D readb(req_addr + 528);
> > +    g_assert_cmpint(status, =3D=3D, 0);
> > +
> > +    data =3D g_malloc0(512);
> > +    qtest_memread(qts, req_addr + 16, data, 512);
> > +    g_assert_cmpstr(data, =3D=3D, "TEST");
> > +    g_free(data);
> > +
> > +    g_free(indirect);
> > +    guest_free(t_alloc, req_addr);
> > +    qvirtqueue_cleanup(dev->bus, vq, t_alloc);
> > +}
> > +
> > +static void idx(void *obj, void *u_data, QGuestAllocator *t_alloc)
> > +{
> > +    QVirtQueue *vq;
> > +    QVhostUserBlkPCI *blk =3D obj;
> > +    QVirtioPCIDevice *pdev =3D &blk->pci_vdev;
> > +    QVirtioDevice *dev =3D &pdev->vdev;
> > +    QVirtioBlkReq req;
> > +    uint64_t req_addr;
> > +    uint64_t capacity;
> > +    uint64_t features;
> > +    uint32_t free_head;
> > +    uint32_t write_head;
> > +    uint32_t desc_idx;
> > +    uint8_t status;
> > +    char *data;
> > +    QOSGraphObject *blk_object =3D obj;
> > +    QPCIDevice *pci_dev =3D blk_object->get_driver(blk_object, "pci-de=
vice");
> > +    QTestState *qts =3D global_qtest;
> > +
> > +    if (qpci_check_buggy_msi(pci_dev)) {
> > +        return;
> > +    }
> > +
> > +    qpci_msix_enable(pdev->pdev);
> > +    qvirtio_pci_set_msix_configuration_vector(pdev, t_alloc, 0);
> > +
> > +    features =3D qvirtio_get_features(dev);
> > +    features =3D features & ~(QVIRTIO_F_BAD_FEATURE |
> > +                            (1u << VIRTIO_RING_F_INDIRECT_DESC) |
> > +                            (1u << VIRTIO_F_NOTIFY_ON_EMPTY) |
> > +                            (1u << VIRTIO_BLK_F_SCSI));
> > +    qvirtio_set_features(dev, features);
> > +
> > +    capacity =3D qvirtio_config_readq(dev, 0);
> > +    g_assert_cmpint(capacity, =3D=3D, TEST_IMAGE_SIZE / 512);
> > +
> > +    vq =3D qvirtqueue_setup(dev, t_alloc, 0);
> > +    qvirtqueue_pci_msix_setup(pdev, (QVirtQueuePCI *)vq, t_alloc, 1);
> > +
> > +    qvirtio_set_driver_ok(dev);
> > +
> > +    /* Write request */
> > +    req.type =3D VIRTIO_BLK_T_OUT;
> > +    req.ioprio =3D 1;
> > +    req.sector =3D 0;
> > +    req.data =3D g_malloc0(512);
> > +    strcpy(req.data, "TEST");
> > +
> > +    req_addr =3D virtio_blk_request(t_alloc, dev, &req, 512);
> > +
> > +    g_free(req.data);
> > +
> > +    free_head =3D qvirtqueue_add(qts, vq, req_addr, 16, false, true);
> > +    qvirtqueue_add(qts, vq, req_addr + 16, 512, false, true);
> > +    qvirtqueue_add(qts, vq, req_addr + 528, 1, true, false);
> > +    qvirtqueue_kick(qts, dev, vq, free_head);
> > +
> > +    qvirtio_wait_used_elem(qts, dev, vq, free_head, NULL,
> > +                           QVIRTIO_BLK_TIMEOUT_US);
> > +
> > +    /* Write request */
> > +    req.type =3D VIRTIO_BLK_T_OUT;
> > +    req.ioprio =3D 1;
> > +    req.sector =3D 1;
> > +    req.data =3D g_malloc0(512);
> > +    strcpy(req.data, "TEST");
> > +
> > +    req_addr =3D virtio_blk_request(t_alloc, dev, &req, 512);
> > +
> > +    g_free(req.data);
> > +
> > +    /* Notify after processing the third request */
> > +    qvirtqueue_set_used_event(qts, vq, 2);
> > +    free_head =3D qvirtqueue_add(qts, vq, req_addr, 16, false, true);
> > +    qvirtqueue_add(qts, vq, req_addr + 16, 512, false, true);
> > +    qvirtqueue_add(qts, vq, req_addr + 528, 1, true, false);
> > +    qvirtqueue_kick(qts, dev, vq, free_head);
> > +    write_head =3D free_head;
> > +
> > +    /* No notification expected */
> > +    status =3D qvirtio_wait_status_byte_no_isr(qts, dev,
> > +                                             vq, req_addr + 528,
> > +                                             QVIRTIO_BLK_TIMEOUT_US);
> > +    g_assert_cmpint(status, =3D=3D, 0);
> > +
> > +    guest_free(t_alloc, req_addr);
> > +
> > +    /* Read request */
> > +    req.type =3D VIRTIO_BLK_T_IN;
> > +    req.ioprio =3D 1;
> > +    req.sector =3D 1;
> > +    req.data =3D g_malloc0(512);
> > +
> > +    req_addr =3D virtio_blk_request(t_alloc, dev, &req, 512);
> > +
> > +    g_free(req.data);
> > +
> > +    free_head =3D qvirtqueue_add(qts, vq, req_addr, 16, false, true);
> > +    qvirtqueue_add(qts, vq, req_addr + 16, 512, true, true);
> > +    qvirtqueue_add(qts, vq, req_addr + 528, 1, true, false);
> > +
> > +    qvirtqueue_kick(qts, dev, vq, free_head);
> > +
> > +    /* We get just one notification for both requests */
> > +    qvirtio_wait_used_elem(qts, dev, vq, write_head, NULL,
> > +                           QVIRTIO_BLK_TIMEOUT_US);
> > +    g_assert(qvirtqueue_get_buf(qts, vq, &desc_idx, NULL));
> > +    g_assert_cmpint(desc_idx, =3D=3D, free_head);
> > +
> > +    status =3D readb(req_addr + 528);
> > +    g_assert_cmpint(status, =3D=3D, 0);
> > +
> > +    data =3D g_malloc0(512);
> > +    qtest_memread(qts, req_addr + 16, data, 512);
> > +    g_assert_cmpstr(data, =3D=3D, "TEST");
> > +    g_free(data);
> > +
> > +    guest_free(t_alloc, req_addr);
> > +
> > +    /* End test */
> > +    qpci_msix_disable(pdev->pdev);
> > +
> > +    qvirtqueue_cleanup(dev->bus, vq, t_alloc);
> > +}
> > +
> > +static void pci_hotplug(void *obj, void *data, QGuestAllocator *t_allo=
c)
> > +{
> > +    QVirtioPCIDevice *dev1 =3D obj;
> > +    QVirtioPCIDevice *dev;
> > +    QTestState *qts =3D dev1->pdev->bus->qts;
> > +
> > +    /* plug secondary disk */
> > +    qtest_qmp_device_add(qts, "vhost-user-blk-pci", "drv1",
> > +                         "{'addr': %s, 'chardev': 'char2'}",
> > +                         stringify(PCI_SLOT_HP) ".0");
> > +
> > +    dev =3D virtio_pci_new(dev1->pdev->bus,
> > +                         &(QPCIAddress) { .devfn =3D QPCI_DEVFN(PCI_SL=
OT_HP, 0)
> > +                                        });
> > +    g_assert_nonnull(dev);
> > +    g_assert_cmpint(dev->vdev.device_type, =3D=3D, VIRTIO_ID_BLOCK);
> > +    qvirtio_pci_device_disable(dev);
> > +    qos_object_destroy((QOSGraphObject *)dev);
> > +
> > +    /* unplug secondary disk */
> > +    qpci_unplug_acpi_device_test(qts, "drv1", PCI_SLOT_HP);
> > +}
> > +
> > +/*
> > + * Check that setting the vring addr on a non-existent virtqueue does
> > + * not crash.
> > + */
> > +static void test_nonexistent_virtqueue(void *obj, void *data,
> > +                                       QGuestAllocator *t_alloc)
> > +{
> > +    QVhostUserBlkPCI *blk =3D obj;
> > +    QVirtioPCIDevice *pdev =3D &blk->pci_vdev;
> > +    QPCIBar bar0;
> > +    QPCIDevice *dev;
> > +
> > +    dev =3D qpci_device_find(pdev->pdev->bus, QPCI_DEVFN(4, 0));
> > +    g_assert(dev !=3D NULL);
> > +    qpci_device_enable(dev);
> > +
> > +    bar0 =3D qpci_iomap(dev, 0, NULL);
> > +
> > +    qpci_io_writeb(dev, bar0, VIRTIO_PCI_QUEUE_SEL, 2);
> > +    qpci_io_writel(dev, bar0, VIRTIO_PCI_QUEUE_PFN, 1);
> > +
> > +    g_free(dev);
> > +}
> > +
> > +static const char *qtest_qemu_storage_daemon_binary(void)
> > +{
> > +    const char *qemu_storage_daemon_bin;
> > +
> > +    qemu_storage_daemon_bin =3D getenv("QTEST_QEMU_STORAGE_DAEMON_BINA=
RY");
> > +    if (!qemu_storage_daemon_bin) {
> > +        fprintf(stderr, "Environment variable "
> > +                        "QTEST_QEMU_STORAGE_DAEMON_BINARY required\n");
> > +        exit(0);
> > +    }
> > +
> > +    return qemu_storage_daemon_bin;
> > +}
> > +
> > +/* g_test_queue_destroy() cleanup function for files */
> > +static void destroy_file(void *path)
> > +{
> > +    unlink(path);
> > +    g_free(path);
> > +    qos_invalidate_command_line();
> > +}
> > +
> > +static char *drive_create(void)
> > +{
> > +    int fd, ret;
> > +    /** vhost-user-blk won't recognize drive located in /tmp */
> > +    char *t_path =3D g_strdup("qtest.XXXXXX");
> > +
> > +    /** Create a temporary raw image */
> > +    fd =3D mkstemp(t_path);
> > +    g_assert_cmpint(fd, >=3D, 0);
> > +    ret =3D ftruncate(fd, TEST_IMAGE_SIZE);
> > +    g_assert_cmpint(ret, =3D=3D, 0);
> > +    close(fd);
> > +
> > +    g_test_queue_destroy(destroy_file, t_path);
> > +    return t_path;
> > +}
> > +
> > +static char *create_listen_socket(int *fd)
> > +{
> > +    int tmp_fd;
> > +    char *path;
> > +
> > +    /* No race because our pid makes the path unique */
> > +    path =3D g_strdup_printf("/tmp/qtest-%d-sock.XXXXXX", getpid());
> > +    tmp_fd =3D mkstemp(path);
> > +    g_assert_cmpint(tmp_fd, >=3D, 0);
> > +    close(tmp_fd);
> > +    unlink(path);
> > +
> > +    *fd =3D qtest_socket_server(path);
> > +    g_test_queue_destroy(destroy_file, path);
> > +    return path;
> > +}
> > +
> > +/*
> > + * g_test_queue_destroy() and qtest_add_abrt_handler() cleanup functio=
n for
> > + * qemu-storage-daemon.
> > + */
> > +static void quit_storage_daemon(void *data)
> > +{
> > +    QemuStorageDaemonState *qsd =3D data;
> > +    int wstatus;
> > +    pid_t pid;
> > +
> > +    /*
> > +     * If we were invoked as a g_test_queue_destroy() cleanup function=
 we need
> > +     * to remove the abrt handler to avoid being called again if the c=
ode below
> > +     * aborts. Also, we must not leave the abrt handler installed after
> > +     * cleanup.
> > +     */
> > +    qtest_remove_abrt_handler(data);
> > +
>=20
> There is an issue. If a test fails, quit_storage_daemon won't be
> called. Since there no abrt_handler like kill_qemu_hook_func
> installed to stop qemu-storage-daemon, qemu-storage-daemon would keep
> running after QEMU is killed by kill_qemu_hook_func.

I'm not sure I understand. quit_storage_daemon() is installed as an abrt
handler and as a g_test_queue_destroy handler. The abrt handler is
executed when the test failed. The g_test_queue_destroy handler is
executed when the test completes successfully.

Can you describe the scenario where the test fails but
quit_storage_daemon() is not invoked by the abrt handler that this code
installs?

Thanks,
Stefan

--cuNjXTHGRNFKwQzU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmA1E8EACgkQnKSrs4Gr
c8iC5gf/b3OlucgMn1h9O3/bgLiTIt1Gmv5Wg9gBgk7a/BF6xtt5t+NxjippFkj+
8GJHRapesaMDe7go3xxpD85c76PxVWUpgYZ9v5sAuGEwYDgpJlC5uAanhEqU9iTy
PlatOQb6LkuOXRXpUcP8RxKs7Cr4rg9AABAhZ2/cJfZUbW0VyQCTAJtq1QMbT8nd
uAKx+d0JCDotIo4lFKdAUR0aSD8khfzGaeTRkOiNetNR/7xdVOT/ZrkoIgKM31NZ
g5IJ9pl3lZR8kOmIoDb2atCo9ImrCi9OCYtpeQegeLtjOFxBa62ySZrUG3/WT8z5
2Bo96LX9Q05MUmdTXgdEoCEcvcTdfA==
=49Bs
-----END PGP SIGNATURE-----

--cuNjXTHGRNFKwQzU--

