Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3E44AD22F
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 08:28:42 +0100 (CET)
Received: from localhost ([::1]:50906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHKvZ-0001TY-9c
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 02:28:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nHKJF-0000jT-WE
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 01:49:08 -0500
Received: from [2a00:1450:4864:20::12c] (port=44872
 helo=mail-lf1-x12c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nHKJ9-0005V7-2C
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 01:49:02 -0500
Received: by mail-lf1-x12c.google.com with SMTP id i17so5384591lfg.11
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 22:48:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=cnCImlsqpKBgoehDl+Vt4GZ16btMvv1kxq0miKYRfH8=;
 b=6yBRrhubm20hU74zIPan9TjPUXPxQxFFrmtu/UZcb8BQzSjThybXIKoDL/lDsimoHb
 OYqtH0nLLvtPpKGt/2oV6uxbWwwl4GSvWHiM0bcDqYrURr7YkoDSHOW90k8tO8Fh13Ij
 VqLXJ4qa1XptUoIGwAGYLWvB/naolJNy67/QL8Gtw63GqAopMCWnbJiB1DgrB6h6wJ11
 S/Jfl8wbyIx3Kt+vKuZ3DSGCj0toy4SvI+7ZIx0ttSR8ZDlKozKd09+zrwg0uTUSxNlh
 xlJoBHk4bH6MeHTknDGNI28o0ObJqoIHEQhUXIneg1bvrUCyD7CZLVvoDXfffa9akvau
 Ak9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=cnCImlsqpKBgoehDl+Vt4GZ16btMvv1kxq0miKYRfH8=;
 b=tZOVMJVFkBZ6DABeB8SCWcjMKxP2uPl6Edlu4T4XMdnH7VTTuA3W0VHtmBTeExL9I5
 BcK01M+isBmA144W2DXI2kPtqSqRYaBdMnaZLzgoQfHBNrPk90N+VP1+MZro2Xd1YAAF
 dPHRA+aU/fqmT14XaXoVs4XbHKKVplTots/h2UsJWmA+7sT8DGPeOixT7B8918mpzKzi
 NOZZVLzL3bRB5+sjaI2rbmac0jIguJ4DAay9bB+QLLi5Iq9UqIFU2NK5qJRQz6Wt1nZC
 bOBi1N7x19/crnq+0ZNfgbWBaYc3o82bpugu6UnE92WD0J9vFASuD9FUdR+sGZnqND7b
 opQw==
X-Gm-Message-State: AOAM532RNfPie7oNgRJmW4IGJRcki3LFB1bXS/ZWBZG1RmMrrM+9n8Tl
 ZAv68hsCINSrVW7HEv+41SYIyBlmv0Lgfb75mGHXVJfwyr8xUf4=
X-Google-Smtp-Source: ABdhPJwH4iRED80kWJS2VC10zw22w4Z2X6b6zbBiYth6wKPiH2s0k9DxCNMfgNQJRqKoIO3z0vat/aOy0ljhj1USznk=
X-Received: by 2002:a17:906:9741:: with SMTP id
 o1mr2563153ejy.452.1644302572698; 
 Mon, 07 Feb 2022 22:42:52 -0800 (PST)
MIME-Version: 1.0
References: <20220125131800.91-1-xieyongji@bytedance.com>
 <20220125131800.91-3-xieyongji@bytedance.com>
 <YgEmB0nsNGYKunh/@stefanha-x1.localdomain>
In-Reply-To: <YgEmB0nsNGYKunh/@stefanha-x1.localdomain>
From: Yongji Xie <xieyongji@bytedance.com>
Date: Tue, 8 Feb 2022 14:42:41 +0800
Message-ID: <CACycT3vdurZFfAc0PwAP2oVy8OcrEcG74QhgsJATvBuKbq-v-g@mail.gmail.com>
Subject: Re: [PATCH 2/5] libvduse: Add VDUSE (vDPA Device in Userspace) library
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::12c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::12c;
 envelope-from=xieyongji@bytedance.com; helo=mail-lf1-x12c.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, mreitz@redhat.com, mlureau@redhat.com,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 7, 2022 at 10:01 PM Stefan Hajnoczi <stefanha@redhat.com> wrote=
:
>
> On Tue, Jan 25, 2022 at 09:17:57PM +0800, Xie Yongji wrote:
> > VDUSE [1] is a linux framework that makes it possible to implement
> > software-emulated vDPA devices in userspace. This adds a library
> > as a subproject to help implementing VDUSE backends in QEMU.
> >
> > [1] https://www.kernel.org/doc/html/latest/userspace-api/vduse.html
>
> This library assumes that the program is allowed to access the control
> device (/dev/vduse/control). Is that always the case or should the
> library also support access to /dev/vduse/<name> only (maybe even with
> file descriptor passing) so a privileged process can create/destroy
> VDUSE devices?
>

Make sense. I will add two new API to support these two cases.

> I didn't review the vring code in detail.
>
> >
> > Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
> > ---
> >  meson.build                                 |   15 +
> >  meson_options.txt                           |    2 +
> >  scripts/meson-buildoptions.sh               |    3 +
> >  subprojects/libvduse/include/atomic.h       |    1 +
> >  subprojects/libvduse/libvduse.c             | 1025 +++++++++++++++++++
> >  subprojects/libvduse/libvduse.h             |  193 ++++
> >  subprojects/libvduse/meson.build            |   10 +
> >  subprojects/libvduse/standard-headers/linux |    1 +
> >  8 files changed, 1250 insertions(+)
> >  create mode 120000 subprojects/libvduse/include/atomic.h
> >  create mode 100644 subprojects/libvduse/libvduse.c
> >  create mode 100644 subprojects/libvduse/libvduse.h
> >  create mode 100644 subprojects/libvduse/meson.build
> >  create mode 120000 subprojects/libvduse/standard-headers/linux
> >
> > diff --git a/meson.build b/meson.build
> > index 333c61deba..864fb50ade 100644
> > --- a/meson.build
> > +++ b/meson.build
> > @@ -1305,6 +1305,21 @@ if not get_option('fuse_lseek').disabled()
> >    endif
> >  endif
> >
> > +have_libvduse =3D (targetos =3D=3D 'linux')
> > +if get_option('libvduse').enabled()
> > +    if targetos !=3D 'linux'
> > +        error('libvduse requires linux')
> > +    endif
> > +elif get_option('libvduse').disabled()
> > +    have_libvduse =3D false
> > +endif
> > +
> > +libvduse =3D not_found
> > +if have_libvduse
> > +  libvduse_proj =3D subproject('libvduse')
> > +  libvduse =3D libvduse_proj.get_variable('libvduse_dep')
> > +endif
> > +
> >  # libbpf
> >  libbpf =3D dependency('libbpf', required: get_option('bpf'), method: '=
pkg-config')
> >  if libbpf.found() and not cc.links('''
> > diff --git a/meson_options.txt b/meson_options.txt
> > index 921967eddb..16790d1814 100644
> > --- a/meson_options.txt
> > +++ b/meson_options.txt
> > @@ -195,6 +195,8 @@ option('virtfs', type: 'feature', value: 'auto',
> >         description: 'virtio-9p support')
> >  option('virtiofsd', type: 'feature', value: 'auto',
> >         description: 'build virtiofs daemon (virtiofsd)')
> > +option('libvduse', type: 'feature', value: 'auto',
> > +       description: 'build VDUSE Library')
> >
> >  option('capstone', type: 'combo', value: 'auto',
> >         choices: ['disabled', 'enabled', 'auto', 'system', 'internal'],
> > diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions=
.sh
> > index a4af02c527..af5c75d758 100644
> > --- a/scripts/meson-buildoptions.sh
> > +++ b/scripts/meson-buildoptions.sh
> > @@ -58,6 +58,7 @@ meson_options_help() {
> >    printf "%s\n" '  libssh          ssh block device support'
> >    printf "%s\n" '  libudev         Use libudev to enumerate host devic=
es'
> >    printf "%s\n" '  libusb          libusb support for USB passthrough'
> > +  printf "%s\n" '  libvduse        build VDUSE Library'
> >    printf "%s\n" '  libxml2         libxml2 support for Parallels image=
 format'
> >    printf "%s\n" '  linux-aio       Linux AIO support'
> >    printf "%s\n" '  linux-io-uring  Linux io_uring support'
> > @@ -188,6 +189,8 @@ _meson_option_parse() {
> >      --disable-libudev) printf "%s" -Dlibudev=3Ddisabled ;;
> >      --enable-libusb) printf "%s" -Dlibusb=3Denabled ;;
> >      --disable-libusb) printf "%s" -Dlibusb=3Ddisabled ;;
> > +    --enable-libvduse) printf "%s" -Dlibvduse=3Denabled ;;
> > +    --disable-libvduse) printf "%s" -Dlibvduse=3Ddisabled ;;
> >      --enable-libxml2) printf "%s" -Dlibxml2=3Denabled ;;
> >      --disable-libxml2) printf "%s" -Dlibxml2=3Ddisabled ;;
> >      --enable-linux-aio) printf "%s" -Dlinux_aio=3Denabled ;;
> > diff --git a/subprojects/libvduse/include/atomic.h b/subprojects/libvdu=
se/include/atomic.h
> > new file mode 120000
> > index 0000000000..8c2be64f7b
> > --- /dev/null
> > +++ b/subprojects/libvduse/include/atomic.h
> > @@ -0,0 +1 @@
> > +../../../include/qemu/atomic.h
> > \ No newline at end of file
> > diff --git a/subprojects/libvduse/libvduse.c b/subprojects/libvduse/lib=
vduse.c
> > new file mode 100644
> > index 0000000000..7671864bca
> > --- /dev/null
> > +++ b/subprojects/libvduse/libvduse.c
> > @@ -0,0 +1,1025 @@
> > +/*
> > + * VDUSE (vDPA Device in Userspace) library
> > + *
> > + * Copyright (C) 2022 Bytedance Inc. and/or its affiliates. All rights=
 reserved.
> > + *   Portions of codes and concepts borrowed from libvhost-user.c, so:
> > + *     Copyright IBM, Corp. 2007
> > + *     Copyright (c) 2016 Red Hat, Inc.
> > + *
> > + * Author:
> > + *   Xie Yongji <xieyongji@bytedance.com>
> > + *   Anthony Liguori <aliguori@us.ibm.com>
> > + *   Marc-Andr=C3=A9 Lureau <mlureau@redhat.com>
> > + *   Victor Kaplansky <victork@redhat.com>
> > + *
> > + * This work is licensed under the terms of the GNU GPL, version 2 or
> > + * later.  See the COPYING file in the top-level directory.
> > + */
> > +
> > +#include <stdlib.h>
> > +#include <stdio.h>
> > +#include <stdbool.h>
> > +#include <stddef.h>
> > +#include <errno.h>
> > +#include <string.h>
> > +#include <assert.h>
> > +#include <endian.h>
> > +#include <unistd.h>
> > +#include <limits.h>
> > +#include <fcntl.h>
> > +
> > +#include <sys/ioctl.h>
> > +#include <sys/eventfd.h>
> > +#include <sys/mman.h>
> > +
> > +#include "include/atomic.h"
> > +#include "standard-headers/linux/vhost_types.h"
> > +#include "standard-headers/linux/vduse.h"
> > +#include "libvduse.h"
> > +
> > +#define VIRTQUEUE_MAX_SIZE 1024
> > +#define VDUSE_VQ_ALIGN 4096
> > +#define MAX_IOVA_REGIONS 256
> > +
> > +/* Round number down to multiple */
> > +#define ALIGN_DOWN(n, m) ((n) / (m) * (m))
> > +
> > +/* Round number up to multiple */
> > +#define ALIGN_UP(n, m) ALIGN_DOWN((n) + (m) - 1, (m))
> > +
> > +#ifndef unlikely
> > +#define unlikely(x)   __builtin_expect(!!(x), 0)
> > +#endif
> > +
> > +typedef struct VduseRing {
> > +    unsigned int num;
> > +    uint64_t desc_addr;
> > +    uint64_t avail_addr;
> > +    uint64_t used_addr;
> > +    struct vring_desc *desc;
> > +    struct vring_avail *avail;
> > +    struct vring_used *used;
> > +} VduseRing;
> > +
> > +struct VduseVirtq {
> > +    VduseRing vring;
> > +    uint16_t last_avail_idx;
> > +    uint16_t shadow_avail_idx;
> > +    uint16_t used_idx;
> > +    uint16_t signalled_used;
> > +    bool signalled_used_valid;
> > +    int index;
> > +    int inuse;
> > +    bool ready;
> > +    int fd;
> > +    VduseDev *dev;
> > +};
> > +
> > +typedef struct VduseIovaRegion {
> > +    uint64_t iova;
> > +    uint64_t size;
> > +    uint64_t mmap_offset;
> > +    uint64_t mmap_addr;
> > +} VduseIovaRegion;
> > +
> > +struct VduseDev {
> > +    VduseVirtq *vqs;
> > +    VduseIovaRegion regions[MAX_IOVA_REGIONS];
> > +    int num_regions;
> > +    char *name;
> > +    uint32_t device_id;
> > +    uint32_t vendor_id;
> > +    uint16_t num_queues;
> > +    uint16_t queue_size;
> > +    uint64_t features;
> > +    const VduseOps *ops;
> > +    int fd;
> > +    int ctrl_fd;
> > +    void *priv;
> > +};
> > +
> > +static inline bool has_feature(uint64_t features, unsigned int fbit)
> > +{
> > +    assert(fbit < 64);
> > +    return !!(features & (1ULL << fbit));
> > +}
> > +
> > +static inline bool vduse_dev_has_feature(VduseDev *dev, unsigned int f=
bit)
> > +{
> > +    return has_feature(dev->features, fbit);
> > +}
> > +
> > +VduseDev *vduse_queue_get_dev(VduseVirtq *vq)
> > +{
> > +    return vq->dev;
> > +}
> > +
> > +int vduse_queue_get_fd(VduseVirtq *vq)
> > +{
> > +    return vq->fd;
> > +}
> > +
> > +void *vduse_dev_get_priv(VduseDev *dev)
> > +{
> > +    return dev->priv;
> > +}
> > +
> > +VduseVirtq *vduse_dev_get_queue(VduseDev *dev, int index)
> > +{
> > +    return &dev->vqs[index];
> > +}
> > +
> > +int vduse_dev_get_fd(VduseDev *dev)
> > +{
> > +    return dev->fd;
> > +}
> > +
> > +static int vduse_inject_irq(VduseDev *dev, int index)
> > +{
> > +    return ioctl(dev->fd, VDUSE_VQ_INJECT_IRQ, &index);
> > +}
> > +
> > +static void vduse_iova_remove_region(VduseDev *dev, uint64_t start,
> > +                                     uint64_t last)
> > +{
> > +    int i;
> > +
> > +    if (last =3D=3D start) {
> > +        return;
> > +    }
> > +
> > +    for (i =3D 0; i < MAX_IOVA_REGIONS; i++) {
> > +        if (!dev->regions[i].mmap_addr) {
> > +            continue;
> > +        }
> > +
> > +        if (start <=3D dev->regions[i].iova &&
> > +            last >=3D (dev->regions[i].iova + dev->regions[i].size - 1=
)) {
> > +            munmap((void *)dev->regions[i].mmap_addr,
> > +                   dev->regions[i].mmap_offset + dev->regions[i].size)=
;
> > +            dev->regions[i].mmap_addr =3D 0;
> > +            dev->num_regions--;
> > +        }
> > +    }
> > +}
> > +
> > +static int vduse_iova_add_region(VduseDev *dev, int fd,
> > +                                 uint64_t offset, uint64_t start,
> > +                                 uint64_t last, int prot)
> > +{
> > +    int i;
> > +    uint64_t size =3D last - start + 1;
> > +    void *mmap_addr =3D mmap(0, size + offset, prot, MAP_SHARED, fd, 0=
);
> > +
> > +    if (mmap_addr =3D=3D MAP_FAILED) {
> > +        return -EINVAL;
>
> Missing close(fd). This function takes ownership of fd.

Will fix it.

> > +    }
> > +
> > +    for (i =3D 0; i < MAX_IOVA_REGIONS; i++) {
> > +        if (!dev->regions[i].mmap_addr) {
> > +            dev->regions[i].mmap_addr =3D (uint64_t)(uintptr_t)mmap_ad=
dr;
> > +            dev->regions[i].mmap_offset =3D offset;
> > +            dev->regions[i].iova =3D start;
> > +            dev->regions[i].size =3D size;
> > +            dev->num_regions++;
> > +            break;
> > +        }
> > +    }
> > +    close(fd);
>
> assert(i < MAX_IOVA_REGIONS)? If we can really reach the end of the for
> loop then we must remember to call munmap(2).
>

Sure.

> > +
> > +    return 0;
> > +}
> > +
> > +static int perm_to_prot(uint8_t perm)
> > +{
> > +    int prot =3D 0;
> > +
> > +    switch (perm) {
> > +    case VDUSE_ACCESS_WO:
> > +        prot |=3D PROT_WRITE;
> > +        break;
> > +    case VDUSE_ACCESS_RO:
> > +        prot |=3D PROT_READ;
> > +        break;
> > +    case VDUSE_ACCESS_RW:
> > +        prot |=3D PROT_READ | PROT_WRITE;
> > +        break;
> > +    default:
> > +        break;
> > +    }
> > +
> > +    return prot;
> > +}
> > +
> > +static inline void *iova_to_va(VduseDev *dev, uint64_t *plen, uint64_t=
 iova)
> > +{
> > +    int i, ret;
> > +    struct vduse_iotlb_entry entry;
> > +
> > +    for (i =3D 0; i < MAX_IOVA_REGIONS; i++) {
> > +        VduseIovaRegion *r =3D &dev->regions[i];
> > +
> > +        if (!r->mmap_addr) {
> > +            continue;
> > +        }
> > +
> > +        if ((iova >=3D r->iova) && (iova < (r->iova + r->size))) {
> > +            if ((iova + *plen) > (r->iova + r->size)) {
> > +                *plen =3D r->iova + r->size - iova;
> > +            }
> > +            return (void *)(uintptr_t)(iova - r->iova +
> > +                   r->mmap_addr + r->mmap_offset);
> > +        }
> > +    }
> > +
> > +    entry.start =3D iova;
> > +    entry.last =3D iova + 1;
> > +    ret =3D ioctl(dev->fd, VDUSE_IOTLB_GET_FD, &entry);
> > +    if (ret < 0) {
> > +        return NULL;
> > +    }
> > +
> > +    if (!vduse_iova_add_region(dev, ret, entry.offset, entry.start,
> > +                               entry.last, perm_to_prot(entry.perm))) =
{
> > +        return iova_to_va(dev, plen, iova);
> > +    }
> > +
> > +    return NULL;
> > +}
> > +
> > +static inline uint16_t vring_avail_flags(VduseVirtq *vq)
> > +{
> > +    return le16toh(vq->vring.avail->flags);
>
> I remember we discussed whether VDUSE should support Transitional
> devices. VIRTIO 1.0+ uses little-endian but legacy VIRTIO uses
> guest-endian, so le16toh() will not work for legacy VIRTIO vrings in a
> cross-endian configuration (e.g. big-endian guest on little-endian
> host).
>

You're right. Cross-endian isn't supported now.

> If cross-endian isn't supported please add an error during
> intialization so users get a clear error message.
>

Will check VIRTIO_F_VERSION_1 during intialization.

> > +}
> > +
> > +static inline uint16_t vring_avail_idx(VduseVirtq *vq)
> > +{
> > +    vq->shadow_avail_idx =3D le16toh(vq->vring.avail->idx);
> > +
> > +    return vq->shadow_avail_idx;
> > +}
> > +
> > +static inline uint16_t vring_avail_ring(VduseVirtq *vq, int i)
> > +{
> > +    return le16toh(vq->vring.avail->ring[i]);
> > +}
> > +
> > +static inline uint16_t vring_get_used_event(VduseVirtq *vq)
> > +{
> > +    return vring_avail_ring(vq, vq->vring.num);
> > +}
> > +
> > +static bool vduse_queue_get_head(VduseVirtq *vq, unsigned int idx,
> > +                                 unsigned int *head)
> > +{
> > +    /*
> > +     * Grab the next descriptor number they're advertising, and increm=
ent
> > +     * the index we've seen.
> > +     */
> > +    *head =3D vring_avail_ring(vq, idx % vq->vring.num);
> > +
> > +    /* If their number is silly, that's a fatal mistake. */
> > +    if (*head >=3D vq->vring.num) {
> > +        fprintf(stderr, "Guest says index %u is available\n", *head);
> > +        return false;
> > +    }
> > +
> > +    return true;
> > +}
> > +
> > +static int
> > +vduse_queue_read_indirect_desc(VduseDev *dev, struct vring_desc *desc,
> > +                               uint64_t addr, size_t len)
> > +{
> > +    struct vring_desc *ori_desc;
> > +    uint64_t read_len;
> > +
> > +    if (len > (VIRTQUEUE_MAX_SIZE * sizeof(struct vring_desc))) {
> > +        return -1;
> > +    }
> > +
> > +    if (len =3D=3D 0) {
> > +        return -1;
> > +    }
> > +
> > +    while (len) {
> > +        read_len =3D len;
> > +        ori_desc =3D iova_to_va(dev, &read_len, addr);
> > +        if (!ori_desc) {
> > +            return -1;
> > +        }
> > +
> > +        memcpy(desc, ori_desc, read_len);
> > +        len -=3D read_len;
> > +        addr +=3D read_len;
> > +        desc +=3D read_len;
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> > +enum {
> > +    VIRTQUEUE_READ_DESC_ERROR =3D -1,
> > +    VIRTQUEUE_READ_DESC_DONE =3D 0,   /* end of chain */
> > +    VIRTQUEUE_READ_DESC_MORE =3D 1,   /* more buffers in chain */
> > +};
> > +
> > +static int vduse_queue_read_next_desc(struct vring_desc *desc, int i,
> > +                                      unsigned int max, unsigned int *=
next)
> > +{
> > +    /* If this descriptor says it doesn't chain, we're done. */
> > +    if (!(le16toh(desc[i].flags) & VRING_DESC_F_NEXT)) {
> > +        return VIRTQUEUE_READ_DESC_DONE;
> > +    }
> > +
> > +    /* Check they're not leading us off end of descriptors. */
> > +    *next =3D desc[i].next;
> > +    /* Make sure compiler knows to grab that: we don't want it changin=
g! */
> > +    smp_wmb();
> > +
> > +    if (*next >=3D max) {
> > +        fprintf(stderr, "Desc next is %u\n", *next);
> > +        return VIRTQUEUE_READ_DESC_ERROR;
> > +    }
> > +
> > +    return VIRTQUEUE_READ_DESC_MORE;
> > +}
> > +
> > +/*
> > + * Fetch avail_idx from VQ memory only when we really need to know if
> > + * guest has added some buffers.
> > + */
> > +static bool vduse_queue_empty(VduseVirtq *vq)
> > +{
> > +    if (unlikely(!vq->vring.avail)) {
> > +        return true;
> > +    }
> > +
> > +    if (vq->shadow_avail_idx !=3D vq->last_avail_idx) {
> > +        return false;
> > +    }
> > +
> > +    return vring_avail_idx(vq) =3D=3D vq->last_avail_idx;
> > +}
> > +
> > +static bool vduse_queue_should_notify(VduseVirtq *vq)
> > +{
> > +    VduseDev *dev =3D vq->dev;
> > +    uint16_t old, new;
> > +    bool v;
> > +
> > +    /* We need to expose used array entries before checking used event=
. */
> > +    smp_mb();
> > +
> > +    /* Always notify when queue is empty (when feature acknowledge) */
> > +    if (vduse_dev_has_feature(dev, VIRTIO_F_NOTIFY_ON_EMPTY) &&
> > +        !vq->inuse && vduse_queue_empty(vq)) {
> > +        return true;
> > +    }
> > +
> > +    if (!vduse_dev_has_feature(dev, VIRTIO_RING_F_EVENT_IDX)) {
> > +        return !(vring_avail_flags(vq) & VRING_AVAIL_F_NO_INTERRUPT);
> > +    }
> > +
> > +    v =3D vq->signalled_used_valid;
> > +    vq->signalled_used_valid =3D true;
> > +    old =3D vq->signalled_used;
> > +    new =3D vq->signalled_used =3D vq->used_idx;
> > +    return !v || vring_need_event(vring_get_used_event(vq), new, old);
> > +}
> > +
> > +void vduse_queue_notify(VduseVirtq *vq)
> > +{
> > +    VduseDev *dev =3D vq->dev;
> > +
> > +    if (unlikely(!vq->vring.avail)) {
> > +        return;
> > +    }
> > +
> > +    if (!vduse_queue_should_notify(vq)) {
> > +        return;
> > +    }
> > +
> > +    if (vduse_inject_irq(dev, vq->index) < 0) {
> > +        fprintf(stderr, "Error inject irq for vq %d: %s\n",
> > +                vq->index, strerror(errno));
> > +    }
> > +}
> > +
> > +static inline void vring_used_flags_set_bit(VduseVirtq *vq, int mask)
> > +{
> > +    uint16_t *flags;
> > +
> > +    flags =3D (uint16_t *)((char*)vq->vring.used +
> > +                         offsetof(struct vring_used, flags));
> > +    *flags =3D htole16(le16toh(*flags) | mask);
> > +}
> > +
> > +static inline void vring_used_flags_unset_bit(VduseVirtq *vq, int mask=
)
> > +{
> > +    uint16_t *flags;
> > +
> > +    flags =3D (uint16_t *)((char*)vq->vring.used +
> > +                         offsetof(struct vring_used, flags));
> > +    *flags =3D htole16(le16toh(*flags) & ~mask);
> > +}
> > +
> > +static inline void vring_set_avail_event(VduseVirtq *vq, uint16_t val)
> > +{
> > +    *((uint16_t *)&vq->vring.used->ring[vq->vring.num]) =3D htole16(va=
l);
> > +}
> > +
> > +static bool vduse_queue_map_single_desc(VduseVirtq *vq, unsigned int *=
p_num_sg,
> > +                                   struct iovec *iov, unsigned int max=
_num_sg,
> > +                                   bool is_write, uint64_t pa, size_t =
sz)
> > +{
> > +    unsigned num_sg =3D *p_num_sg;
> > +    VduseDev *dev =3D vq->dev;
> > +
> > +    assert(num_sg <=3D max_num_sg);
> > +
> > +    if (!sz) {
> > +        fprintf(stderr, "virtio: zero sized buffers are not allowed\n"=
);
> > +        return false;
> > +    }
> > +
> > +    while (sz) {
> > +        uint64_t len =3D sz;
> > +
> > +        if (num_sg =3D=3D max_num_sg) {
> > +            fprintf(stderr,
> > +                    "virtio: too many descriptors in indirect table\n"=
);
> > +            return false;
> > +        }
> > +
> > +        iov[num_sg].iov_base =3D iova_to_va(dev, &len, pa);
> > +        if (iov[num_sg].iov_base =3D=3D NULL) {
> > +            fprintf(stderr, "virtio: invalid address for buffers\n");
> > +            return false;
> > +        }
> > +        iov[num_sg++].iov_len =3D len;
> > +        sz -=3D len;
> > +        pa +=3D len;
> > +    }
> > +
> > +    *p_num_sg =3D num_sg;
> > +    return true;
> > +}
> > +
> > +static void *vduse_queue_alloc_element(size_t sz, unsigned out_num,
> > +                                       unsigned in_num)
> > +{
> > +    VduseVirtqElement *elem;
> > +    size_t in_sg_ofs =3D ALIGN_UP(sz, __alignof__(elem->in_sg[0]));
> > +    size_t out_sg_ofs =3D in_sg_ofs + in_num * sizeof(elem->in_sg[0]);
> > +    size_t out_sg_end =3D out_sg_ofs + out_num * sizeof(elem->out_sg[0=
]);
> > +
> > +    assert(sz >=3D sizeof(VduseVirtqElement));
> > +    elem =3D malloc(out_sg_end);
>
> Missing malloc() NULL return value check.
>

Will fix it.

> > +    elem->out_num =3D out_num;
> > +    elem->in_num =3D in_num;
> > +    elem->in_sg =3D (void *)elem + in_sg_ofs;
> > +    elem->out_sg =3D (void *)elem + out_sg_ofs;
> > +    return elem;
> > +}
> > +
> > +static void *vduse_queue_map_desc(VduseVirtq *vq, unsigned int idx, si=
ze_t sz)
> > +{
> > +    struct vring_desc *desc =3D vq->vring.desc;
> > +    VduseDev *dev =3D vq->dev;
> > +    uint64_t desc_addr, read_len;
> > +    unsigned int desc_len;
> > +    unsigned int max =3D vq->vring.num;
> > +    unsigned int i =3D idx;
> > +    VduseVirtqElement *elem;
> > +    struct iovec iov[VIRTQUEUE_MAX_SIZE];
> > +    struct vring_desc desc_buf[VIRTQUEUE_MAX_SIZE];
> > +    unsigned int out_num =3D 0, in_num =3D 0;
> > +    int rc;
> > +
> > +    if (le16toh(desc[i].flags) & VRING_DESC_F_INDIRECT) {
> > +        if (le32toh(desc[i].len) % sizeof(struct vring_desc)) {
> > +            fprintf(stderr, "Invalid size for indirect buffer table\n"=
);
> > +            return NULL;
> > +        }
> > +
> > +        /* loop over the indirect descriptor table */
> > +        desc_addr =3D le64toh(desc[i].addr);
> > +        desc_len =3D le32toh(desc[i].len);
> > +        max =3D desc_len / sizeof(struct vring_desc);
> > +        read_len =3D desc_len;
> > +        desc =3D iova_to_va(dev, &read_len, desc_addr);
> > +        if (unlikely(desc && read_len !=3D desc_len)) {
> > +            /* Failed to use zero copy */
> > +            desc =3D NULL;
> > +            if (!vduse_queue_read_indirect_desc(dev, desc_buf,
> > +                                                desc_addr,
> > +                                                desc_len)) {
> > +                desc =3D desc_buf;
> > +            }
> > +        }
> > +        if (!desc) {
> > +            fprintf(stderr, "Invalid indirect buffer table\n");
> > +            return NULL;
> > +        }
> > +        i =3D 0;
> > +    }
> > +
> > +    /* Collect all the descriptors */
> > +    do {
> > +        if (le16toh(desc[i].flags) & VRING_DESC_F_WRITE) {
> > +            if (!vduse_queue_map_single_desc(vq, &in_num, iov + out_nu=
m,
> > +                                             VIRTQUEUE_MAX_SIZE - out_=
num,
> > +                                             true, le64toh(desc[i].add=
r),
> > +                                             le32toh(desc[i].len))) {
> > +                return NULL;
> > +            }
> > +        } else {
> > +            if (in_num) {
> > +                fprintf(stderr, "Incorrect order for descriptors\n");
> > +                return NULL;
> > +            }
> > +            if (!vduse_queue_map_single_desc(vq, &out_num, iov,
> > +                                             VIRTQUEUE_MAX_SIZE, false=
,
> > +                                             le64toh(desc[i].addr),
> > +                                             le32toh(desc[i].len))) {
> > +                return NULL;
> > +            }
> > +        }
> > +
> > +        /* If we've got too many, that implies a descriptor loop. */
> > +        if ((in_num + out_num) > max) {
> > +            fprintf(stderr, "Looped descriptor\n");
> > +            return NULL;
> > +        }
> > +        rc =3D vduse_queue_read_next_desc(desc, i, max, &i);
> > +    } while (rc =3D=3D VIRTQUEUE_READ_DESC_MORE);
> > +
> > +    if (rc =3D=3D VIRTQUEUE_READ_DESC_ERROR) {
> > +        fprintf(stderr, "read descriptor error\n");
> > +        return NULL;
> > +    }
> > +
> > +    /* Now copy what we have collected and mapped */
> > +    elem =3D vduse_queue_alloc_element(sz, out_num, in_num);
> > +    elem->index =3D idx;
> > +    for (i =3D 0; i < out_num; i++) {
> > +        elem->out_sg[i] =3D iov[i];
> > +    }
> > +    for (i =3D 0; i < in_num; i++) {
> > +        elem->in_sg[i] =3D iov[out_num + i];
> > +    }
> > +
> > +    return elem;
> > +}
> > +
> > +void *vduse_queue_pop(VduseVirtq *vq, size_t sz)
> > +{
> > +    unsigned int head;
> > +    VduseVirtqElement *elem;
> > +    VduseDev *dev =3D vq->dev;
> > +
> > +    if (unlikely(!vq->vring.avail)) {
> > +        return NULL;
> > +    }
> > +
> > +    if (vduse_queue_empty(vq)) {
> > +        return NULL;
> > +    }
> > +    /* Needed after virtio_queue_empty() */
> > +    smp_rmb();
> > +
> > +    if (vq->inuse >=3D vq->vring.num) {
> > +        fprintf(stderr, "Virtqueue size exceeded: %d\n", vq->inuse);
> > +        return NULL;
> > +    }
> > +
> > +    if (!vduse_queue_get_head(vq, vq->last_avail_idx++, &head)) {
> > +        return NULL;
> > +    }
> > +
> > +    if (vduse_dev_has_feature(dev, VIRTIO_RING_F_EVENT_IDX)) {
> > +        vring_set_avail_event(vq, vq->last_avail_idx);
> > +    }
> > +
> > +    elem =3D vduse_queue_map_desc(vq, head, sz);
> > +
> > +    if (!elem) {
> > +        return NULL;
> > +    }
> > +
> > +    vq->inuse++;
> > +
> > +    return elem;
> > +}
> > +
> > +static inline void vring_used_write(VduseVirtq *vq,
> > +                                    struct vring_used_elem *uelem, int=
 i)
> > +{
> > +    struct vring_used *used =3D vq->vring.used;
> > +
> > +    used->ring[i] =3D *uelem;
> > +}
> > +
> > +static void vduse_queue_fill(VduseVirtq *vq, const VduseVirtqElement *=
elem,
> > +                             unsigned int len, unsigned int idx)
> > +{
> > +    struct vring_used_elem uelem;
> > +
> > +    if (unlikely(!vq->vring.used)) {
> > +        return;
> > +    }
> > +
> > +    idx =3D (idx + vq->used_idx) % vq->vring.num;
> > +
> > +    uelem.id =3D htole32(elem->index);
> > +    uelem.len =3D htole32(len);
> > +    vring_used_write(vq, &uelem, idx);
> > +}
> > +
> > +static inline void vring_used_idx_set(VduseVirtq *vq, uint16_t val)
> > +{
> > +    vq->vring.used->idx =3D htole16(val);
> > +    vq->used_idx =3D val;
> > +}
> > +
> > +static void vduse_queue_flush(VduseVirtq *vq, unsigned int count)
> > +{
> > +    uint16_t old, new;
> > +
> > +    if (unlikely(!vq->vring.used)) {
> > +        return;
> > +    }
> > +
> > +    /* Make sure buffer is written before we update index. */
> > +    smp_wmb();
> > +
> > +    old =3D vq->used_idx;
> > +    new =3D old + count;
> > +    vring_used_idx_set(vq, new);
> > +    vq->inuse -=3D count;
> > +    if (unlikely((int16_t)(new - vq->signalled_used) < (uint16_t)(new =
- old))) {
> > +        vq->signalled_used_valid =3D false;
> > +    }
> > +}
> > +
> > +void vduse_queue_push(VduseVirtq *vq, const VduseVirtqElement *elem,
> > +                      unsigned int len)
> > +{
> > +    vduse_queue_fill(vq, elem, len, 0);
> > +    vduse_queue_flush(vq, 1);
> > +}
> > +
> > +static int vduse_queue_update_vring(VduseVirtq *vq, uint64_t desc_addr=
,
> > +                                    uint64_t avail_addr, uint64_t used=
_addr)
> > +{
> > +    struct VduseDev *dev =3D vq->dev;
> > +    uint64_t len;
> > +
> > +    len =3D sizeof(struct vring_desc);
> > +    vq->vring.desc =3D iova_to_va(dev, &len, desc_addr);
> > +    assert(len =3D=3D sizeof(struct vring_desc));
> > +
> > +    len =3D sizeof(struct vring_avail);
> > +    vq->vring.avail =3D iova_to_va(dev, &len, avail_addr);
> > +    assert(len =3D=3D sizeof(struct vring_avail));
> > +
> > +    len =3D sizeof(struct vring_used);
> > +    vq->vring.used =3D iova_to_va(dev, &len, used_addr);
> > +    assert(len =3D=3D sizeof(struct vring_used));
> > +
> > +    if (!vq->vring.desc || !vq->vring.avail || !vq->vring.used) {
> > +        fprintf(stderr, "Failed to get vq[%d] iova mapping\n", vq->ind=
ex);
> > +        return -EINVAL;
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> > +static void vduse_queue_enable(VduseVirtq *vq)
> > +{
> > +    struct VduseDev *dev =3D vq->dev;
> > +    struct vduse_vq_info vq_info;
> > +    struct vduse_vq_eventfd vq_eventfd;
> > +    int fd;
> > +
> > +    vq_info.index =3D vq->index;
> > +    if (ioctl(dev->fd, VDUSE_VQ_GET_INFO, &vq_info)) {
> > +        fprintf(stderr, "Failed to get vq[%d] info: %s\n",
> > +                vq->index, strerror(errno));
> > +        return;
> > +    }
> > +
> > +    if (!vq_info.ready) {
> > +        return;
> > +    }
> > +
> > +    vq->vring.num =3D vq_info.num;
> > +    vq->vring.desc_addr =3D vq_info.desc_addr;
> > +    vq->vring.avail_addr =3D vq_info.driver_addr;
> > +    vq->vring.used_addr =3D vq_info.device_addr;
> > +
> > +    if (vduse_queue_update_vring(vq, vq_info.desc_addr,
> > +                                 vq_info.driver_addr, vq_info.device_a=
ddr)) {
> > +        fprintf(stderr, "Failed to update vring for vq[%d]\n", vq->ind=
ex);
> > +        return;
> > +    }
> > +
> > +    fd =3D eventfd(0, EFD_NONBLOCK | EFD_CLOEXEC);
> > +    if (fd < 0) {
> > +        fprintf(stderr, "Failed to init eventfd for vq[%d]\n", vq->ind=
ex);
> > +        return;
> > +    }
> > +
> > +    vq_eventfd.index =3D vq->index;
> > +    vq_eventfd.fd =3D fd;
> > +    if (ioctl(dev->fd, VDUSE_VQ_SETUP_KICKFD, &vq_eventfd)) {
> > +        fprintf(stderr, "Failed to setup kick fd for vq[%d]\n", vq->in=
dex);
> > +        close(fd);
> > +        return;
> > +    }
> > +
> > +    vq->fd =3D fd;
> > +    vq->shadow_avail_idx =3D vq->last_avail_idx =3D vq_info.split.avai=
l_index;
> > +    vq->inuse =3D 0;
> > +    vq->used_idx =3D 0;
> > +    vq->signalled_used_valid =3D false;
> > +    vq->ready =3D true;
> > +
> > +    dev->ops->enable_queue(dev, vq);
> > +}
> > +
> > +static void vduse_queue_disable(VduseVirtq *vq)
> > +{
> > +    struct VduseDev *dev =3D vq->dev;
> > +    struct vduse_vq_eventfd eventfd;
> > +
> > +    if (!vq->ready) {
> > +        return;
> > +    }
> > +
> > +    dev->ops->disable_queue(dev, vq);
> > +
> > +    eventfd.index =3D vq->index;
> > +    eventfd.fd =3D VDUSE_EVENTFD_DEASSIGN;
> > +    ioctl(dev->fd, VDUSE_VQ_SETUP_KICKFD, &eventfd);
> > +    close(vq->fd);
> > +
> > +    assert(vq->inuse =3D=3D 0);
> > +
> > +    vq->vring.num =3D 0;
> > +    vq->vring.desc_addr =3D 0;
> > +    vq->vring.avail_addr =3D 0;
> > +    vq->vring.used_addr =3D 0;
> > +    vq->vring.desc =3D 0;
> > +    vq->vring.avail =3D 0;
> > +    vq->vring.used =3D 0;
> > +    vq->ready =3D false;
> > +    vq->fd =3D -1;
> > +}
> > +
> > +static void vduse_dev_start_dataplane(VduseDev *dev)
> > +{
> > +    int i;
> > +
> > +    if (ioctl(dev->fd, VDUSE_DEV_GET_FEATURES, &dev->features)) {
> > +        fprintf(stderr, "Failed to get features: %s\n", strerror(errno=
));
> > +        return;
> > +    }
> > +
> > +    for (i =3D 0; i < dev->num_queues; i++) {
> > +        vduse_queue_enable(&dev->vqs[i]);
> > +    }
> > +}
> > +
> > +static void vduse_dev_stop_dataplane(VduseDev *dev)
> > +{
> > +    int i;
> > +
> > +    for (i =3D 0; i < dev->num_queues; i++) {
> > +        vduse_queue_disable(&dev->vqs[i]);
> > +    }
> > +    dev->features =3D 0;
> > +    vduse_iova_remove_region(dev, 0, ULONG_MAX);
> > +}
> > +
> > +int vduse_dev_handler(VduseDev *dev)
> > +{
> > +    struct vduse_dev_request req;
> > +    struct vduse_dev_response resp =3D { 0 };
> > +    VduseVirtq *vq;
> > +    int i, ret;
> > +
> > +    ret =3D read(dev->fd, &req, sizeof(req));
>
> This file descriptor is blocking? I guess the assumption is that the
> kernel VDUSE code always enqueues at least one struct vduse_dev_request,
> so userspace will not block when the file descriptor becomes readable?
>

Yes, that's true. We can always get one entire request if the file
descriptor becomes readable.

> > +    if (ret !=3D sizeof(req)) {
> > +        fprintf(stderr, "Read request error [%d]: %s\n",
> > +                ret, strerror(errno));
> > +        return -errno;
> > +    }
> > +    resp.request_id =3D req.request_id;
> > +
> > +    switch (req.type) {
> > +    case VDUSE_GET_VQ_STATE:
> > +        vq =3D &dev->vqs[req.vq_state.index];
> > +        resp.vq_state.split.avail_index =3D vq->last_avail_idx;
> > +        resp.result =3D VDUSE_REQ_RESULT_OK;
> > +        break;
> > +    case VDUSE_SET_STATUS:
> > +        if (req.s.status & VIRTIO_CONFIG_S_DRIVER_OK) {
> > +            vduse_dev_start_dataplane(dev);
> > +        } else if (req.s.status =3D=3D 0) {
> > +            vduse_dev_stop_dataplane(dev);
> > +        }
> > +        resp.result =3D VDUSE_REQ_RESULT_OK;
> > +        break;
> > +    case VDUSE_UPDATE_IOTLB:
> > +        /* The iova will be updated by iova_to_va() later, so just rem=
ove it */
> > +        vduse_iova_remove_region(dev, req.iova.start, req.iova.last);
> > +        for (i =3D 0; i < dev->num_queues; i++) {
> > +            VduseVirtq *vq =3D &dev->vqs[i];
> > +            if (vq->ready) {
> > +                if (vduse_queue_update_vring(vq, vq->vring.desc_addr,
> > +                                             vq->vring.avail_addr,
> > +                                             vq->vring.used_addr)) {
> > +                    fprintf(stderr, "Failed to update vring for vq[%d]=
\n",
> > +                            vq->index);
> > +                }
> > +            }
> > +        }
> > +        resp.result =3D VDUSE_REQ_RESULT_OK;
> > +        break;
> > +    default:
> > +        resp.result =3D VDUSE_REQ_RESULT_FAILED;
> > +        break;
> > +    }
> > +
> > +    ret =3D write(dev->fd, &resp, sizeof(resp));
>
> The kernel never blocks here?
>

Yes.

> > +    if (ret !=3D sizeof(resp)) {
> > +        fprintf(stderr, "Write request %d error [%d]: %s\n",
> > +                req.type, ret, strerror(errno));
> > +        return -errno;
> > +    }
> > +    return 0;
> > +}
> > +
> > +int vduse_dev_update_config(VduseDev *dev, uint32_t size,
> > +                            uint32_t offset, char *buffer)
> > +{
> > +    int ret;
> > +    struct vduse_config_data *data;
> > +
> > +    data =3D malloc(offsetof(struct vduse_config_data, buffer) + size)=
;
> > +    if (!data) {
> > +        return -ENOMEM;
> > +    }
> > +
> > +    data->offset =3D offset;
> > +    data->length =3D size;
> > +    memcpy(data->buffer, buffer, size);
> > +
> > +    ret =3D ioctl(dev->fd, VDUSE_DEV_SET_CONFIG, data);
> > +    free(data);
> > +
> > +    if (ret) {
> > +        return -errno;
> > +    }
> > +
> > +    if (ioctl(dev->fd, VDUSE_DEV_INJECT_CONFIG_IRQ)) {
> > +        return -errno;
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> > +int vduse_dev_setup_queue(VduseDev *dev, int index, int max_size)
> > +{
> > +    VduseVirtq *vq =3D &dev->vqs[index];
> > +    struct vduse_vq_config vq_config =3D { 0 };
> > +
> > +    vq_config.index =3D vq->index;
> > +    vq_config.max_size =3D max_size;
> > +
> > +    if (ioctl(dev->fd, VDUSE_VQ_SETUP, &vq_config)) {
> > +        return -errno;
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> > +VduseDev *vduse_dev_create(const char *name, uint32_t device_id,
> > +                           uint32_t vendor_id, uint64_t features,
> > +                           uint16_t num_queues, uint32_t config_size,
> > +                           char *config, const VduseOps *ops, void *pr=
iv)
> > +{
> > +    VduseDev *dev;
> > +    int i, ret, ctrl_fd, fd =3D -1;
> > +    uint64_t version;
> > +    char dev_path[VDUSE_NAME_MAX + 16];
>
> Why 16? It has to be at least strlen("/dev/vduse/"), but why more? I
> suggest including strlen("/dev/vduse/") instead of hardcoding a magic
> constant.
>

LGTM, will use strlen("/dev/vduse/") instead.

> > +    VduseVirtq *vqs =3D NULL;
> > +    struct vduse_dev_config *dev_config =3D NULL;
> > +    size_t size =3D offsetof(struct vduse_dev_config, config);
> > +
> > +    if (!name || strlen(name) > VDUSE_NAME_MAX || !config ||
>
> The NUL terminator needs to be taken into account:
>
>   strlen(name) + 1 > VDUSE_NAME_MAX
>

Will fix it.

> > +        !config_size || !ops || !ops->enable_queue || !ops->disable_qu=
eue) {
> > +        fprintf(stderr, "Invalid parameter for vduse\n");
> > +        return NULL;
> > +    }
> > +
> > +    dev =3D malloc(sizeof(VduseDev));
> > +    if (!dev) {
> > +        fprintf(stderr, "Failed to allocate vduse device\n");
> > +        return NULL;
> > +    }
> > +    memset(dev, 0, sizeof(VduseDev));
> > +
> > +    ctrl_fd =3D open("/dev/vduse/control", O_RDWR);
> > +    if (ctrl_fd < 0) {
> > +        fprintf(stderr, "Failed to open /dev/vduse/control: %s\n",
> > +                strerror(errno));
> > +        goto err_ctrl;
> > +    }
> > +
> > +    version =3D VDUSE_API_VERSION;
> > +    if (ioctl(ctrl_fd, VDUSE_SET_API_VERSION, &version)) {
> > +        fprintf(stderr, "Failed to set api version %lu: %s\n",
> > +                version, strerror(errno));
> > +        goto err_dev;
> > +    }
> > +
> > +    dev_config =3D malloc(size + config_size);
> > +    if (!dev_config) {
> > +        fprintf(stderr, "Failed to allocate config space\n");
> > +        goto err_dev;
> > +    }
> > +    memset(dev_config, 0, size + config_size);
> > +
> > +    strcpy(dev_config->name, name);
> > +    dev_config->device_id =3D device_id;
> > +    dev_config->vendor_id =3D vendor_id;
> > +    dev_config->features =3D features;
> > +    dev_config->vq_num =3D num_queues;
> > +    dev_config->vq_align =3D VDUSE_VQ_ALIGN;
> > +    dev_config->config_size =3D config_size;
> > +    memcpy(dev_config->config, config, config_size);
> > +
> > +    ret =3D ioctl(ctrl_fd, VDUSE_CREATE_DEV, dev_config);
> > +    free(dev_config);
> > +    if (ret < 0) {
> > +        fprintf(stderr, "Failed to create vduse dev %s: %s\n",
> > +                name, strerror(errno));
> > +        goto err_dev;
> > +    }
> > +
> > +    sprintf(dev_path, "/dev/vduse/%s", name);
> > +    fd =3D open(dev_path, O_RDWR);
>
> Does the caller reject names with ".." path components? Maybe input
> validation should be performed before we call open(2)?
>

Make sense.

> > +    if (fd < 0) {
> > +        fprintf(stderr, "Failed to open vduse dev %s: %s\n",
> > +                name, strerror(errno));
> > +        goto err;
> > +    }
> > +
> > +    vqs =3D calloc(sizeof(VduseVirtq), num_queues);
>
> calloc() could be used instead of malloc + memset above as well.
>

OK.

> > +    if (!vqs) {
> > +        fprintf(stderr, "Failed to allocate virtqueues\n");
> > +        goto err;
> > +    }
> > +
> > +    for (i =3D 0; i < num_queues; i++) {
> > +        vqs[i].index =3D i;
> > +        vqs[i].dev =3D dev;
> > +        vqs[i].fd =3D -1;
> > +    }
> > +
> > +    dev->vqs =3D vqs;
> > +    dev->name =3D strdup(name);
>
> malloc(3) return values are checked elsewhere, strdup(3) should also be
> checked.
>

OK.

> > +    dev->num_queues =3D num_queues;
> > +    dev->ops =3D ops;
> > +    dev->ctrl_fd =3D ctrl_fd;
> > +    dev->fd =3D fd;
> > +    dev->priv =3D priv;
> > +
> > +    return dev;
> > +err:
> > +    if (fd > 0) {
> > +        close(fd);
> > +    }
> > +    ioctl(ctrl_fd, VDUSE_DESTROY_DEV, name);
> > +err_dev:
> > +    close(ctrl_fd);
> > +err_ctrl:
> > +    free(dev);
> > +
> > +    return NULL;
> > +}
> > +
> > +void vduse_dev_destroy(VduseDev *dev)
> > +{
> > +    free(dev->vqs);
> > +    close(dev->fd);
> > +    dev->fd =3D -1;
> > +    ioctl(dev->ctrl_fd, VDUSE_DESTROY_DEV, dev->name);
> > +    free(dev->name);
> > +    close(dev->ctrl_fd);
> > +    dev->ctrl_fd =3D -1;
> > +    free(dev);
> > +}
> > diff --git a/subprojects/libvduse/libvduse.h b/subprojects/libvduse/lib=
vduse.h
> > new file mode 100644
> > index 0000000000..f6bcb51b5a
> > --- /dev/null
> > +++ b/subprojects/libvduse/libvduse.h
> > @@ -0,0 +1,193 @@
> > +/*
> > + * VDUSE (vDPA Device in Userspace) library
> > + *
> > + * Copyright (C) 2022 Bytedance Inc. and/or its affiliates. All rights=
 reserved.
> > + *
> > + * Author:
> > + *   Xie Yongji <xieyongji@bytedance.com>
> > + *
> > + * This work is licensed under the terms of the GNU GPL, version 2 or
> > + * later.  See the COPYING file in the top-level directory.
> > + */
> > +
> > +#ifndef LIBVDUSE_H
> > +#define LIBVDUSE_H
> > +
> > +#include <stdint.h>
> > +#include <sys/uio.h>
> > +
> > +/* VDUSE device structure */
> > +typedef struct VduseDev VduseDev;
> > +
> > +/* Virtqueue structure */
> > +typedef struct VduseVirtq VduseVirtq;
> > +
> > +/* Some operation of VDUSE backend */
> > +typedef struct VduseOps {
> > +    /* Called when virtqueue can be processed */
> > +    void (*enable_queue)(VduseDev *dev, VduseVirtq *vq);
> > +    /* Called when virtqueue processing should be stopped */
> > +    void (*disable_queue)(VduseDev *dev, VduseVirtq *vq);
> > +} VduseOps;
> > +
> > +/* Describing elements of the I/O buffer */
> > +typedef struct VduseVirtqElement {
> > +    /* Virtqueue index */
> > +    unsigned int index;
>
> Is this the descriptor table index or the virtqueue number?
>

It's descriptor table index. Will fix it in v2.

Thanks,
Yongji

