Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98EA660E83E
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 21:04:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onlcs-0006ih-SW; Wed, 26 Oct 2022 14:59:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1onlci-0005wc-S6
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 14:59:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1onlcf-00070M-Hl
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 14:59:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666810769;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bKf680qTiiqsti8ig8tLHmlKwKnihzW6D4Peg6yPxZQ=;
 b=In30iZwbu3EgVUebgdkbJooboczwomnlvVfKwo5qTbEIGWFN1u9D1ZMVJavbxZq31rtblp
 //IIJhbsP2BW6loiBKBTCNlyBOUBG9ChLIhMhrWy5MY9Ja8caDU2yhN7ISvBwsGdn6+hZO
 dzO1K8rSYSJdoovTQ0yFng5g4dNTQdA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-614-x59DbVbhM0OeSGwMO-oePQ-1; Wed, 26 Oct 2022 14:59:25 -0400
X-MC-Unique: x59DbVbhM0OeSGwMO-oePQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3E3A6101A528;
 Wed, 26 Oct 2022 18:59:24 +0000 (UTC)
Received: from localhost (unknown [10.39.192.42])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D8DCA2166B38;
 Wed, 26 Oct 2022 18:59:22 +0000 (UTC)
Date: Wed, 26 Oct 2022 14:57:21 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Fam Zheng <fam@euphon.net>, Markus Armbruster <armbru@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Wen Congyang <wencongyang2@huawei.com>, Kevin Wolf <kwolf@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-block@nongnu.org,
 Eric Blake <eblake@redhat.com>, John Snow <jsnow@redhat.com>,
 afaria@redhat.com, Jeff Cody <codyprime@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>, sgarzare@redhat.com,
 integration@gluster.org, Peter Xu <peterx@redhat.com>,
 "Richard W.M. Jones" <rjones@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 "Denis V. Lunev" <den@openvz.org>
Subject: Re: [PATCH v7 00/13] blkio: add libblkio BlockDriver
Message-ID: <Y1mDEWUCJQoMjUyj@fedora>
References: <20221013185908.1297568-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="oLelfeNuX/JRIAzr"
Content-Disposition: inline
In-Reply-To: <20221013185908.1297568-1-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--oLelfeNuX/JRIAzr
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 13, 2022 at 02:58:55PM -0400, Stefan Hajnoczi wrote:
> v7:
> - Add nvme-io_uring and virtio-blk-vhost-user syntax examples to commit d=
escription [Markus]
> - Add missing nvme-io_uring QAPI [Markus, Alberto]
> - Rename mem-regions-pinned to may-pin-mem-regions [Alberto]
> - Fix value/bs->bl.max_iov mix-up [Stefano]
> v6:
> - Add untested nvme-io_uring driver. Please test in your nested NVMe envi=
ronment, Alberto. [Alberto]
> - Map blkio mem regions only when necessary to reduce conflicts with RAM =
discard [Alberto]
> - Reduce duplication by having a single blkio_virtio_blk_common_open() fu=
nction [Alberto]
> - Avoid duplication in BlockDriver definitions using a macro [Alberto]
> - Avoid ram block registrar segfault [Stefano]
> - Use QLIST_FOREACH_SAFE() in ram block notifier code so callbacks can re=
move themselves
> v5:
> - Drop "RFC" since libblkio 1.0 has been released and the library API is =
stable
> - Disable BDRV_REQ_REGISTERED_BUF if we run out of blkio_mem_regions. The
>   bounce buffer slow path is taken when there are not enough blkio_mem_re=
gions
>   to cover guest RAM. [Hanna & David Hildenbrand]
> - Call ram_block_discard_disable() when mem-region-pinned property is tru=
e or
>   absent [David Hildenbrand]
> - Use a bounce buffer pool instead of allocating/freeing a buffer for each
>   request. This reduces the number of blkio_mem_regions required for boun=
ce
>   buffers to 1 and avoids frequent blkio_mem_region_map/unmap() calls.
> - Switch to .bdrv_co_*() instead of .bdrv_aio_*(). Needed for the bounce =
buffer
>   pool's CoQueue.
> v4:
> - Patch 1:
>   - Add virtio-blk-vhost-user driver [Kevin]
>   - Drop .bdrv_parse_filename() and .bdrv_needs_filename for virtio-blk-v=
host-vdpa [Stefano]
>   - Add copyright and license header [Hanna]
>   - Drop .bdrv_parse_filename() in favor of --blockdev or json: [Hanna]
>   - Clarify that "filename" is always non-NULL for io_uring [Hanna]
>   - Check that virtio-blk-vhost-vdpa "path" option is non-NULL [Hanna]
>   - Fix virtio-blk-vhost-vdpa cache.direct=3Doff logic [Hanna]
>   - Use macros for driver names [Hanna]
>   - Assert that the driver name is valid [Hanna]
>   - Update "readonly" property name to "read-only" [Hanna]
>   - Call blkio_detach_aio_context() in blkio_close() [Hanna]
>   - Avoid uint32_t * to int * casts in blkio_refresh_limits() [Hanna]
>   - Remove write zeroes and discard from the todo list [Hanna]
>   - Use PRIu32 instead of %d for uint32_t [Hanna]
>   - Fix error messages with buf-alignment instead of optimal-io-size [Han=
na]
>   - Call map/unmap APIs since libblkio alloc/free APIs no longer do that
>   - Update QAPI schema QEMU version to 7.2
> - Patch 5:
>   - Expand the BDRV_REQ_REGISTERED_BUF flag passthrough and drop assert(!=
flags)
>     in drivers [Hanna]
> - Patch 7:
>   - Fix BLK->BDRV typo [Hanna]
>   - Make BlockRAMRegistrar handle failure [Hanna]
> - Patch 8:
>   - Replace memory_region_get_fd() approach with qemu_ram_get_fd()
> - Patch 10:
>   - Use (void)ret; to discard unused return value [Hanna]
>   - libblkio's blkio_unmap_mem_region() API no longer has a return value
>   - Check for registered bufs that cross RAMBlocks [Hanna]
> - Patch 11:
>   - Handle bdrv_register_buf() errors [Hanna]
> v3:
> - Add virtio-blk-vhost-vdpa for vdpa-blk devices including VDUSE
> - Add discard and write zeroes support
> - Rebase and adopt latest libblkio APIs
> v2:
> - Add BDRV_REQ_REGISTERED_BUF to bs.supported_write_flags [Stefano]
> - Use new blkioq_get_num_completions() API
> - Implement .bdrv_refresh_limits()
>=20
> This patch series adds a QEMU BlockDriver for libblkio
> (https://gitlab.com/libblkio/libblkio/), a library for high-performance b=
lock
> device I/O. This work was presented at KVM Forum 2022 and slides are avai=
lable
> here:
> https://static.sched.com/hosted_files/kvmforum2022/8c/libblkio-kvm-forum-=
2022.pdf
>=20
> The second patch adds the core BlockDriver and most of the libblkio API u=
sage.
> Three libblkio drivers are included:
> - io_uring
> - virtio-blk-vhost-user
> - virtio-blk-vhost-vdpa
>=20
> The remainder of the patch series reworks the existing QEMU bdrv_register=
_buf()
> API so virtio-blk emulation efficiently map guest RAM for libblkio - some
> libblkio drivers require that I/O buffer memory is pre-registered (think =
VFIO,
> vhost, etc).
>=20
> Vladimir requested performance results that show the effect of the
> BDRV_REQ_REGISTERED_BUF flag. I ran the patches against qemu-storage-daem=
on's
> vhost-user-blk export with iodepth=3D1 bs=3D512 to see the per-request ov=
erhead due
> to bounce buffer allocation/mapping:
>=20
> Name                                   IOPS   Error
> bounce-buf                          4373.81 =B1 0.01%
> registered-buf                     13062.80 =B1 0.67%
>=20
> The BDRV_REQ_REGISTERED_BUF optimization version is about 3x faster.
>=20
> See the BlockDriver struct in block/blkio.c for a list of APIs that still=
 need
> to be implemented. The core functionality is covered.
>=20
> Regarding the design: each libblkio driver is a separately named BlockDri=
ver.
> That means there is an "io_uring" BlockDriver and not a generic "libblkio"
> BlockDriver. This way QAPI and open parameters are type-safe and mandatory
> parameters can be checked by QEMU.
>=20
> Stefan Hajnoczi (13):
>   coroutine: add flag to re-queue at front of CoQueue
>   blkio: add libblkio block driver
>   numa: call ->ram_block_removed() in ram_block_notifer_remove()
>   block: pass size to bdrv_unregister_buf()
>   block: use BdrvRequestFlags type for supported flag fields
>   block: add BDRV_REQ_REGISTERED_BUF request flag
>   block: return errors from bdrv_register_buf()
>   numa: use QLIST_FOREACH_SAFE() for RAM block notifiers
>   block: add BlockRAMRegistrar
>   exec/cpu-common: add qemu_ram_get_fd()
>   stubs: add qemu_ram_block_from_host() and qemu_ram_get_fd()
>   blkio: implement BDRV_REQ_REGISTERED_BUF optimization
>   virtio-blk: use BDRV_REQ_REGISTERED_BUF optimization hint
>=20
>  MAINTAINERS                                 |    7 +
>  meson_options.txt                           |    2 +
>  qapi/block-core.json                        |   77 +-
>  meson.build                                 |    9 +
>  include/block/block-common.h                |    9 +
>  include/block/block-global-state.h          |   10 +-
>  include/block/block_int-common.h            |   15 +-
>  include/exec/cpu-common.h                   |    1 +
>  include/hw/virtio/virtio-blk.h              |    2 +
>  include/qemu/coroutine.h                    |   15 +-
>  include/sysemu/block-backend-global-state.h |    4 +-
>  include/sysemu/block-ram-registrar.h        |   37 +
>  block.c                                     |   14 +
>  block/blkio.c                               | 1008 +++++++++++++++++++
>  block/blkverify.c                           |    4 +-
>  block/block-backend.c                       |    8 +-
>  block/block-ram-registrar.c                 |   58 ++
>  block/crypto.c                              |    4 +-
>  block/file-posix.c                          |    1 -
>  block/gluster.c                             |    1 -
>  block/io.c                                  |  101 +-
>  block/mirror.c                              |    2 +
>  block/nbd.c                                 |    1 -
>  block/nvme.c                                |   20 +-
>  block/parallels.c                           |    1 -
>  block/qcow.c                                |    2 -
>  block/qed.c                                 |    1 -
>  block/raw-format.c                          |    2 +
>  block/replication.c                         |    1 -
>  block/ssh.c                                 |    1 -
>  block/vhdx.c                                |    1 -
>  hw/block/virtio-blk.c                       |   39 +-
>  hw/core/numa.c                              |   26 +-
>  qemu-img.c                                  |    6 +-
>  softmmu/physmem.c                           |    5 +
>  stubs/physmem.c                             |   13 +
>  tests/qtest/modules-test.c                  |    3 +
>  util/qemu-coroutine-lock.c                  |    9 +-
>  util/vfio-helpers.c                         |    5 +-
>  block/meson.build                           |    2 +
>  scripts/meson-buildoptions.sh               |    3 +
>  stubs/meson.build                           |    1 +
>  42 files changed, 1435 insertions(+), 96 deletions(-)
>  create mode 100644 include/sysemu/block-ram-registrar.h
>  create mode 100644 block/blkio.c
>  create mode 100644 block/block-ram-registrar.c
>  create mode 100644 stubs/physmem.c
>=20
> --=20
> 2.37.3
>=20

Thanks, applied to my block tree:
https://gitlab.com/stefanha/qemu/commits/block

Stefan

--oLelfeNuX/JRIAzr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmNZgxAACgkQnKSrs4Gr
c8hjcgf+P6RNb9r1auFMopUC2seA/SuRZzjqNIW8881W2Nhh9d3E/TEwEL8/JYHQ
MISp+EfRx6bXP1CXsrhiSf92le8ydPwEzaW1NAI2ijSsnILnAnM7v5M2MzfR5jE5
ZlfAWi2Q+I98AYNt2/NSBAURaum0LQtPpzr5BjzQlf1r8sOAOoAx5Vt1BtWYJ9WW
+fWIG1YNxGHrk7eSqk4kBFfpZG3M3+XVN8sRHix6P2aOjD5URTzWQeX4HsQstn0j
MhZ3iMPNqqsow5rhwAl8CFp0q+Nj8N3uPQLmunMWGpK9m0c9auKlZZn2SLR3QYMa
/wro4IgMQ/CHWGU0IhyXpqm4Diekvg==
=GirM
-----END PGP SIGNATURE-----

--oLelfeNuX/JRIAzr--


