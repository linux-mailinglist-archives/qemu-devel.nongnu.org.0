Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56358318D74
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 15:33:59 +0100 (CET)
Received: from localhost ([::1]:32804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAD2b-0001X5-Rw
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 09:33:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lACn5-0001Xn-8d
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 09:17:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47078)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lACn1-0008DT-BV
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 09:17:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613053069;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0ThC5pqPbk/NzQGPJZxpUjt1cKwbU6U9ACXbxD3Zxjc=;
 b=UdXM0zDGGuYxGFejYQD7QeL86vm4V/7gfaauvltQTVt0CuRz7TT6eJSuCRFp9cYZnTRCH8
 QkGTAwom4d6lUfV08Xu1+ZhYPpA5ocwkCIz3+uY1QL4V1BsEVD52lsyCuMRMdYTc9H35uD
 dCg9SbMBtwXbUtzfIxAJcvwfNSyhSF4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-189-Uffqypk_PYSVrtqDJCNDCA-1; Thu, 11 Feb 2021 09:17:46 -0500
X-MC-Unique: Uffqypk_PYSVrtqDJCNDCA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 357A0195D561
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 14:17:45 +0000 (UTC)
Received: from localhost (ovpn-115-9.ams2.redhat.com [10.36.115.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 117FE19C45;
 Thu, 11 Feb 2021 14:17:35 +0000 (UTC)
Date: Thu, 11 Feb 2021 14:17:34 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Subject: Re: [PATCH 16/24] DAX/unmap: virtiofsd: Add VHOST_USER_SLAVE_FS_IO
Message-ID: <20210211141734.GQ247031@stefanha-x1.localdomain>
References: <20210209190224.62827-1-dgilbert@redhat.com>
 <20210209190224.62827-17-dgilbert@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210209190224.62827-17-dgilbert@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="uRjmd8ppyyws0Tml"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: virtio-fs@redhat.com, marcandre.lureau@redhat.com, qemu-devel@nongnu.org,
 vgoyal@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--uRjmd8ppyyws0Tml
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 09, 2021 at 07:02:16PM +0000, Dr. David Alan Gilbert (git) wrot=
e:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>=20
> Define a new slave command 'VHOST_USER_SLAVE_FS_IO' for a
> client to ask qemu to perform a read/write from an fd directly
> to GPA.
>=20
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>  docs/interop/vhost-user.rst               | 11 +++
>  hw/virtio/trace-events                    |  6 ++
>  hw/virtio/vhost-user-fs.c                 | 84 +++++++++++++++++++++++
>  hw/virtio/vhost-user.c                    |  4 ++
>  include/hw/virtio/vhost-user-fs.h         |  2 +
>  subprojects/libvhost-user/libvhost-user.h |  1 +
>  6 files changed, 108 insertions(+)
>=20
> diff --git a/docs/interop/vhost-user.rst b/docs/interop/vhost-user.rst
> index 1deedd3407..821712f4a2 100644
> --- a/docs/interop/vhost-user.rst
> +++ b/docs/interop/vhost-user.rst
> @@ -1452,6 +1452,17 @@ Slave message types
>    multiple chunks can be unmapped in one command.
>    A reply is generated indicating whether unmapping succeeded.
> =20
> +``VHOST_USER_SLAVE_FS_IO``
> +  :id: 9
> +  :equivalent ioctl: N/A
> +  :slave payload: fd + n * (offset + address + len)

Please clarify the payload representation. This is not enough for
someone to implement the spec.

> +  :master payload: N/A
> +
> +  Requests that the QEMU performs IO directly from an fd to guest memory

To avoid naming a particular VMM:

s/the QEMU performs IO/IO be performed/

> +  on behalf of the daemon; this is normally for a case where a memory re=
gion
> +  isn't visible to the daemon. slave payload has flags which determine
> +  the direction of IO operation.

Please document the payload flags in the spec.

> +
>  .. _reply_ack:
> =20
>  VHOST_USER_PROTOCOL_F_REPLY_ACK
> diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
> index c62727f879..20557a078e 100644
> --- a/hw/virtio/trace-events
> +++ b/hw/virtio/trace-events
> @@ -53,6 +53,12 @@ vhost_vdpa_get_features(void *dev, uint64_t features) =
"dev: %p features: 0x%"PRI
>  vhost_vdpa_set_owner(void *dev) "dev: %p"
>  vhost_vdpa_vq_get_addr(void *dev, void *vq, uint64_t desc_user_addr, uin=
t64_t avail_user_addr, uint64_t used_user_addr) "dev: %p vq: %p desc_user_a=
ddr: 0x%"PRIx64" avail_user_addr: 0x%"PRIx64" used_user_addr: 0x%"PRIx64
> =20
> +# vhost-user-fs.c
> +
> +vhost_user_fs_slave_io_loop(const char *name, uint64_t owr, int is_ram, =
int is_romd, size_t size) "region %s with internal offset 0x%"PRIx64 " ram=
=3D%d romd=3D%d mrs.size=3D%zd"
> +vhost_user_fs_slave_io_loop_res(ssize_t transferred) "%zd"
> +vhost_user_fs_slave_io_exit(int res, size_t done) "res: %d done: %zd"
> +
>  # virtio.c
>  virtqueue_alloc_element(void *elem, size_t sz, unsigned in_num, unsigned=
 out_num) "elem %p size %zd in_num %u out_num %u"
>  virtqueue_fill(void *vq, const void *elem, unsigned int len, unsigned in=
t idx) "vq %p elem %p len %u idx %u"
> diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
> index 5f2fca4d82..357bc1d04e 100644
> --- a/hw/virtio/vhost-user-fs.c
> +++ b/hw/virtio/vhost-user-fs.c
> @@ -23,6 +23,8 @@
>  #include "hw/virtio/vhost-user-fs.h"
>  #include "monitor/monitor.h"
>  #include "sysemu/sysemu.h"
> +#include "exec/address-spaces.h"
> +#include "trace.h"
> =20
>  /*
>   * The powerpc kernel code expects the memory to be accessible during
> @@ -155,6 +157,88 @@ uint64_t vhost_user_fs_slave_unmap(struct vhost_dev =
*dev,
>      return (uint64_t)res;
>  }
> =20
> +uint64_t vhost_user_fs_slave_io(struct vhost_dev *dev, VhostUserFSSlaveM=
sg *sm,
> +                                int fd)
> +{
> +    VHostUserFS *fs =3D VHOST_USER_FS(dev->vdev);
> +    if (!fs) {
> +        /* Shouldn't happen - but seen it in error paths */
> +        error_report("Bad fs ptr");
> +        return (uint64_t)-1;
> +    }

Same pointer casting issue as with map/unmap.

> +
> +    unsigned int i;
> +    int res =3D 0;
> +    size_t done =3D 0;
> +
> +    if (fd < 0) {
> +        error_report("Bad fd for map");
> +        return (uint64_t)-1;
> +    }
> +
> +    for (i =3D 0; i < VHOST_USER_FS_SLAVE_ENTRIES && !res; i++) {
> +        if (sm->len[i] =3D=3D 0) {
> +            continue;
> +        }
> +
> +        size_t len =3D sm->len[i];
> +        hwaddr gpa =3D sm->c_offset[i];
> +
> +        while (len && !res) {
> +            MemoryRegionSection mrs =3D memory_region_find(get_system_me=
mory(),
> +                                                         gpa, len);
> +            size_t mrs_size =3D (size_t)int128_get64(mrs.size);

If there is a vIOMMU then the vhost-user device backend should be
restricted to just areas of guest RAM that are mapped. I think this can
be achieved by using the vhost-user-fs device's address space instead of
get_system_memory(). For example, virtio_pci_get_dma_as().

> +
> +            if (!mrs_size) {
> +                error_report("No guest region found for 0x%" HWADDR_PRIx=
, gpa);
> +                res =3D -EFAULT;
> +                break;
> +            }
> +
> +            trace_vhost_user_fs_slave_io_loop(mrs.mr->name,
> +                                          (uint64_t)mrs.offset_within_re=
gion,
> +                                          memory_region_is_ram(mrs.mr),
> +                                          memory_region_is_romd(mrs.mr),
> +                                          (size_t)mrs_size);
> +
> +            void *hostptr =3D qemu_map_ram_ptr(mrs.mr->ram_block,
> +                                             mrs.offset_within_region);
> +            ssize_t transferred;
> +            if (sm->flags[i] & VHOST_USER_FS_FLAG_MAP_R) {

The flag name is specific to map requests but it's shared with the IO
request. Perhaps rename the flags?

> +                /* Read from file into RAM */
> +                if (mrs.mr->readonly) {
> +                    res =3D -EFAULT;
> +                    break;
> +                }
> +                transferred =3D pread(fd, hostptr, mrs_size, sm->fd_offs=
et[i]);
> +            } else {
> +                /* Write into file from RAM */
> +                assert((sm->flags[i] & VHOST_USER_FS_FLAG_MAP_W));

The vhost-user device backend must not be able to crash the VMM. Please
use an if statement and fail the request if the flags are invalid
instead of assert().

> +                transferred =3D pwrite(fd, hostptr, mrs_size, sm->fd_off=
set[i]);
> +            }
> +            trace_vhost_user_fs_slave_io_loop_res(transferred);
> +            if (transferred < 0) {
> +                res =3D -errno;
> +                break;
> +            }
> +            if (!transferred) {
> +                /* EOF */
> +                break;
> +            }
> +
> +            done +=3D transferred;
> +            len -=3D transferred;

Is gpa +=3D transferred missing so that this loop can handle crossing
MemoryRegion boundaries?

sm->fd_offset[i] also needs to be put into a local variable and
incremented by transferred each time around the loop.

--uRjmd8ppyyws0Tml
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmAlPH4ACgkQnKSrs4Gr
c8gnNgf+KhArgBSgDZy8b5OVDuCl1yfLW6woYT3n7G6vj31jxXRIhPfHhv32Xwsk
RgGUZbwbzOG3xG+HVzhfHxg8zn47598XjWdzopbT23s/nIRbN3fDnWyEbiYALc+m
hlCReXA9dVyrHqHQuyor9nKhZjqqD7tUa++lFHMZ/XlhR62wVXveYcko9ohZdz55
kHmf6KDOJh5oig96HJ/gg2dHLstPsBa5SzK8Hiz9lD59R41nFiShK+/mrhTUCUdf
nWJuTeKDOahiNUQlR/1MWKQ7Wulc3jfKcu7dtzhYVM3vuItaa1eVo3sFm7/nm8ba
1mNTCT7U/MHBu21iPgY+agDd5AeYSQ==
=6XVS
-----END PGP SIGNATURE-----

--uRjmd8ppyyws0Tml--


