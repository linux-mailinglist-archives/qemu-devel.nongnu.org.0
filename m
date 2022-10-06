Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E735F6D55
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 20:09:01 +0200 (CEST)
Received: from localhost ([::1]:53082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogVIq-00058V-Po
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 14:09:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ogUjg-0002hc-H0
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 13:32:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ogUjb-0001nP-Up
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 13:32:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665077554;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iEXNRgx/RDn5nxZajmoACrbSX4OGt/JNnoDexXqCBkw=;
 b=cFiaZxKj5ReUlxh5T3FuSWq4dS0h1xmT9e2YUOwtXkB1MCpKWs1vBMcT6gCHlLaDnMn9UK
 86gKDAbj0d/8qz7+peA0tmtaIkpSSgYaPfCQ0zVFATNrirqFqHr3ENyHK338fSMg8PvzPE
 pDQgxsWeInFsNgj0bsDvqhwKIQlSXdE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-57-SqaY2pR7OmKNSSWlBW-QAg-1; Thu, 06 Oct 2022 13:32:31 -0400
X-MC-Unique: SqaY2pR7OmKNSSWlBW-QAg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 32AB08027FE;
 Thu,  6 Oct 2022 17:32:30 +0000 (UTC)
Received: from localhost (unknown [10.39.193.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6CFC82024CBB;
 Thu,  6 Oct 2022 17:32:28 +0000 (UTC)
Date: Thu, 6 Oct 2022 13:32:26 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: qemu-devel@nongnu.org, Yanan Wang <wangyanan55@huawei.com>,
 Kevin Wolf <kwolf@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>,
 "Denis V. Lunev" <den@openvz.org>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Eric Blake <eblake@redhat.com>, integration@gluster.org,
 David Hildenbrand <david@redhat.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Laurent Vivier <lvivier@redhat.com>,
 "Richard W.M. Jones" <rjones@redhat.com>, afaria@redhat.com,
 Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Peter Xu <peterx@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Jeff Cody <codyprime@gmail.com>, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v5 00/12] blkio: add libblkio BlockDriver
Message-ID: <Yz8RKiROmD5TjHNx@fedora>
References: <20220927193431.22302-1-stefanha@redhat.com>
 <CAGxU2F5aE1P-atJ04SmUHrrW5QWbU80E_H7JBNaBzFkoVd7wOw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="7KrLp3hww3Zx0w3B"
Content-Disposition: inline
In-Reply-To: <CAGxU2F5aE1P-atJ04SmUHrrW5QWbU80E_H7JBNaBzFkoVd7wOw@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--7KrLp3hww3Zx0w3B
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 06, 2022 at 02:18:35PM +0200, Stefano Garzarella wrote:
> Hi Stefan,
> I tested this series with the vDPA block simulator in Linux v6.0.
> It worked well, but I had a segfault when blkio_map_mem_region() fails.
>=20
> In my case, it failed because I forgot to increase the `memlock` limit=20
> with `ulimit -l unlimited` since the simulator still requires locking=20
> all the VM memory.
>=20
> QEMU failed with this messages:
> $ qemu-system-x86_64 ... \
>   -blockdev node-name=3Ddrive_src1,driver=3Dvirtio-blk-vhost-vdpa,path=3D=
/dev/vhost-vdpa-0,cache.direct=3Don
> qemu-system-x86_64: -device virtio-blk-pci,id=3Dsrc1,bootindex=3D2,drive=
=3Ddrive_src1,iothread=3Diothread0: Failed to add blkio mem region 0x7f60bf=
e00000 with size 536870912: Bad address (os error 14)
> qemu-system-x86_64: -device virtio-blk-pci,id=3Dsrc1,bootindex=3D2,drive=
=3Ddrive_src1,iothread=3Diothread0: Failed to add blkio mem region 0x7f60be=
400000 with size 16777216: Bad address (os error 14)
> [1]    20803 segmentation fault
>=20
> IIUC this could be related to a double call to=20
> ram_block_notifier_remove() in the error path of ram_block_added()=20
> (block/block-ram-registrar.c) callback.
>=20
> Maybe we should call blk_register_buf() only if r->ok is true.

Thanks for pointing this out!

The notifiers don't use QLIST_FOREACH_SAFE() so calling
ram_block_notifier_remove() from within .ram_block_added() is incorrect.

Stefan

>=20
> The stack trace is the following:
> #0  0x00005641a8b097dd in ram_block_notifier_remove (n=3Dn@entry=3D0x5641=
ab8354d8) at ../hw/core/numa.c:850
> #1  0x00005641a89c4701 in ram_block_added
>      (n=3D0x5641ab8354d8, host=3D<optimized out>, size=3D<optimized out>,=
 max_size=3D<optimized out>)
>     at ../block/block-ram-registrar.c:20
> #2  0x00005641a8b083af in ram_block_notify_add_single (rb=3D0x5641ab3d281=
0, opaque=3D0x5641ab8354d8)
>     at ../hw/core/numa.c:820
> #3  0x00005641a8b92d8d in qemu_ram_foreach_block
>     (func=3Dfunc@entry=3D0x5641a8b08370 <ram_block_notify_add_single>, op=
aque=3Dopaque@entry=3D0x5641ab8354d8)
>     at ../softmmu/physmem.c:3571
> #4  0x00005641a8b097af in ram_block_notifier_add (n=3Dn@entry=3D0x5641ab8=
354d8) at ../hw/core/numa.c:844
> #5  0x00005641a89c474f in blk_ram_registrar_init (r=3Dr@entry=3D0x5641ab8=
354d0, blk=3D<optimized out>)
>     at ../block/block-ram-registrar.c:46
> #6  0x00005641a8affe88 in virtio_blk_device_realize (dev=3D0x5641ab835230=
, errp=3D0x7ffc72657190)
>     at ../hw/block/virtio-blk.c:1239
> #7  0x00005641a8b4b716 in virtio_device_realize (dev=3D0x5641ab835230, er=
rp=3D0x7ffc726571f0)
>     at ../hw/virtio/virtio.c:3684
> #8  0x00005641a8c2049b in device_set_realized (obj=3D<optimized out>, val=
ue=3D<optimized out>, errp=3D0x7ffc72657380)
>     at ../hw/core/qdev.c:553
> #9  0x00005641a8c24738 in property_set_bool
>     (obj=3D0x5641ab835230, v=3D<optimized out>, name=3D<optimized out>, o=
paque=3D0x5641aa518820, errp=3D0x7ffc72657380)
>     at ../qom/object.c:2273
> #10 0x00005641a8c27683 in object_property_set
>   =20
>      (obj=3Dobj@entry=3D0x5641ab835230, name=3Dname@entry=3D0x5641a8e9719=
a "realized", v=3Dv@entry=3D0x5641ab83f5b0, errp=3Derrp@entry=3D0x7ffc72657=
380) at ../qom/object.c:1408
> #11 0x00005641a8c2a97f in object_property_set_qobject
>     (obj=3Dobj@entry=3D0x5641ab835230, name=3Dname@entry=3D0x5641a8e9719a=
 "realized", value=3Dvalue@entry=3D0x5641ab83f4f0, errp=3Derrp@entry=3D0x7f=
fc72657380) at ../qom/qom-qobject.c:28
> #12 0x00005641a8c27c84 in object_property_set_bool
>     (obj=3D0x5641ab835230, name=3D0x5641a8e9719a "realized", value=3D<opt=
imized out>, errp=3D0x7ffc72657380)
>     at ../qom/object.c:1477
> #13 0x00005641a8929b74 in pci_qdev_realize (qdev=3D<optimized out>, errp=
=3D<optimized out>) at ../hw/pci/pci.c:2218
> #14 0x00005641a8c2049b in device_set_realized (obj=3D<optimized out>, val=
ue=3D<optimized out>, errp=3D0x7ffc726575b0)
>     at ../hw/core/qdev.c:553
> #15 0x00005641a8c24738 in property_set_bool
>     (obj=3D0x5641ab82ce70, v=3D<optimized out>, name=3D<optimized out>, o=
paque=3D0x5641aa518820, errp=3D0x7ffc726575b0)
>     at ../qom/object.c:2273
> #16 0x00005641a8c27683 in object_property_set
>=20
> Thanks,
> Stefano
>=20
> On Tue, Sep 27, 2022 at 9:34 PM Stefan Hajnoczi <stefanha@redhat.com> wro=
te:
> >
> > v5:
> > - Drop "RFC" since libblkio 1.0 has been released and the library API i=
s stable
> > - Disable BDRV_REQ_REGISTERED_BUF if we run out of blkio_mem_regions. T=
he
> >   bounce buffer slow path is taken when there are not enough blkio_mem_=
regions
> >   to cover guest RAM. [Hanna & David Hildenbrand]
> > - Call ram_block_discard_disable() when mem-region-pinned property is t=
rue or
> >   absent [David Hildenbrand]
> > - Use a bounce buffer pool instead of allocating/freeing a buffer for e=
ach
> >   request. This reduces the number of blkio_mem_regions required for bo=
unce
> >   buffers to 1 and avoids frequent blkio_mem_region_map/unmap() calls.
> > - Switch to .bdrv_co_*() instead of .bdrv_aio_*(). Needed for the bounc=
e buffer
> >   pool's CoQueue.
> > v4:
> > - Patch 1:
> >   - Add virtio-blk-vhost-user driver [Kevin]
> >   - Drop .bdrv_parse_filename() and .bdrv_needs_filename for virtio-blk=
-vhost-vdpa [Stefano]
> >   - Add copyright and license header [Hanna]
> >   - Drop .bdrv_parse_filename() in favor of --blockdev or json: [Hanna]
> >   - Clarify that "filename" is always non-NULL for io_uring [Hanna]
> >   - Check that virtio-blk-vhost-vdpa "path" option is non-NULL [Hanna]
> >   - Fix virtio-blk-vhost-vdpa cache.direct=3Doff logic [Hanna]
> >   - Use macros for driver names [Hanna]
> >   - Assert that the driver name is valid [Hanna]
> >   - Update "readonly" property name to "read-only" [Hanna]
> >   - Call blkio_detach_aio_context() in blkio_close() [Hanna]
> >   - Avoid uint32_t * to int * casts in blkio_refresh_limits() [Hanna]
> >   - Remove write zeroes and discard from the todo list [Hanna]
> >   - Use PRIu32 instead of %d for uint32_t [Hanna]
> >   - Fix error messages with buf-alignment instead of optimal-io-size [H=
anna]
> >   - Call map/unmap APIs since libblkio alloc/free APIs no longer do that
> >   - Update QAPI schema QEMU version to 7.2
> > - Patch 5:
> >   - Expand the BDRV_REQ_REGISTERED_BUF flag passthrough and drop assert=
(!flags)
> >     in drivers [Hanna]
> > - Patch 7:
> >   - Fix BLK->BDRV typo [Hanna]
> >   - Make BlockRAMRegistrar handle failure [Hanna]
> > - Patch 8:
> >   - Replace memory_region_get_fd() approach with qemu_ram_get_fd()
> > - Patch 10:
> >   - Use (void)ret; to discard unused return value [Hanna]
> >   - libblkio's blkio_unmap_mem_region() API no longer has a return value
> >   - Check for registered bufs that cross RAMBlocks [Hanna]
> > - Patch 11:
> >   - Handle bdrv_register_buf() errors [Hanna]
> > v3:
> > - Add virtio-blk-vhost-vdpa for vdpa-blk devices including VDUSE
> > - Add discard and write zeroes support
> > - Rebase and adopt latest libblkio APIs
> > v2:
> > - Add BDRV_REQ_REGISTERED_BUF to bs.supported_write_flags [Stefano]
> > - Use new blkioq_get_num_completions() API
> > - Implement .bdrv_refresh_limits()
> >
> > This patch series adds a QEMU BlockDriver for libblkio
> > (https://gitlab.com/libblkio/libblkio/), a library for high-performance=
 block
> > device I/O. This work was presented at KVM Forum 2022 and slides are av=
ailable
> > here:
> > https://static.sched.com/hosted_files/kvmforum2022/8c/libblkio-kvm-foru=
m-2022.pdf
> >
> > The second patch adds the core BlockDriver and most of the libblkio API=
 usage.
> > Three libblkio drivers are included:
> > - io_uring
> > - virtio-blk-vhost-user
> > - virtio-blk-vhost-vdpa
> >
> > The remainder of the patch series reworks the existing QEMU bdrv_regist=
er_buf()
> > API so virtio-blk emulation efficiently map guest RAM for libblkio - so=
me
> > libblkio drivers require that I/O buffer memory is pre-registered (thin=
k VFIO,
> > vhost, etc).
> >
> > Vladimir requested performance results that show the effect of the
> > BDRV_REQ_REGISTERED_BUF flag. I ran the patches against qemu-storage-da=
emon's
> > vhost-user-blk export with iodepth=3D1 bs=3D512 to see the per-request =
overhead due
> > to bounce buffer allocation/mapping:
> >
> > Name                                   IOPS   Error
> > bounce-buf                          4373.81 =B1 0.01%
> > registered-buf                     13062.80 =B1 0.67%
> >
> > The BDRV_REQ_REGISTERED_BUF optimization version is about 3x faster.
> >
> > See the BlockDriver struct in block/blkio.c for a list of APIs that sti=
ll need
> > to be implemented. The core functionality is covered.
> >
> > Regarding the design: each libblkio driver is a separately named BlockD=
river.
> > That means there is an "io_uring" BlockDriver and not a generic "libblk=
io"
> > BlockDriver. This way QAPI and open parameters are type-safe and mandat=
ory
> > parameters can be checked by QEMU.
> >
> > Stefan Hajnoczi (12):
> >   coroutine: add flag to re-queue at front of CoQueue
> >   blkio: add libblkio block driver
> >   numa: call ->ram_block_removed() in ram_block_notifer_remove()
> >   block: pass size to bdrv_unregister_buf()
> >   block: use BdrvRequestFlags type for supported flag fields
> >   block: add BDRV_REQ_REGISTERED_BUF request flag
> >   block: return errors from bdrv_register_buf()
> >   block: add BlockRAMRegistrar
> >   exec/cpu-common: add qemu_ram_get_fd()
> >   stubs: add qemu_ram_block_from_host() and qemu_ram_get_fd()
> >   blkio: implement BDRV_REQ_REGISTERED_BUF optimization
> >   virtio-blk: use BDRV_REQ_REGISTERED_BUF optimization hint
> >
> >  MAINTAINERS                                 |    7 +
> >  meson_options.txt                           |    2 +
> >  qapi/block-core.json                        |   53 +-
> >  meson.build                                 |    9 +
> >  include/block/block-common.h                |    9 +
> >  include/block/block-global-state.h          |   10 +-
> >  include/block/block_int-common.h            |   15 +-
> >  include/exec/cpu-common.h                   |    1 +
> >  include/hw/virtio/virtio-blk.h              |    2 +
> >  include/qemu/coroutine.h                    |   15 +-
> >  include/sysemu/block-backend-global-state.h |    4 +-
> >  include/sysemu/block-ram-registrar.h        |   37 +
> >  block.c                                     |   14 +
> >  block/blkio.c                               | 1017 +++++++++++++++++++
> >  block/blkverify.c                           |    4 +-
> >  block/block-backend.c                       |    8 +-
> >  block/block-ram-registrar.c                 |   54 +
> >  block/crypto.c                              |    4 +-
> >  block/file-posix.c                          |    1 -
> >  block/gluster.c                             |    1 -
> >  block/io.c                                  |  101 +-
> >  block/mirror.c                              |    2 +
> >  block/nbd.c                                 |    1 -
> >  block/nvme.c                                |   20 +-
> >  block/parallels.c                           |    1 -
> >  block/qcow.c                                |    2 -
> >  block/qed.c                                 |    1 -
> >  block/raw-format.c                          |    2 +
> >  block/replication.c                         |    1 -
> >  block/ssh.c                                 |    1 -
> >  block/vhdx.c                                |    1 -
> >  hw/block/virtio-blk.c                       |   39 +-
> >  hw/core/numa.c                              |   17 +
> >  qemu-img.c                                  |    6 +-
> >  softmmu/physmem.c                           |    5 +
> >  stubs/physmem.c                             |   13 +
> >  tests/qtest/modules-test.c                  |    3 +
> >  util/qemu-coroutine-lock.c                  |    9 +-
> >  util/vfio-helpers.c                         |    5 +-
> >  block/meson.build                           |    2 +
> >  scripts/meson-buildoptions.sh               |    3 +
> >  stubs/meson.build                           |    1 +
> >  42 files changed, 1412 insertions(+), 91 deletions(-)
> >  create mode 100644 include/sysemu/block-ram-registrar.h
> >  create mode 100644 block/blkio.c
> >  create mode 100644 block/block-ram-registrar.c
> >  create mode 100644 stubs/physmem.c
> >
> > --
> > 2.37.3
> >
>=20

--7KrLp3hww3Zx0w3B
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmM/ESoACgkQnKSrs4Gr
c8jEbQgAtVcPRYumevBA7TZjJ3SsDcRg9QCaXgBxfIoYAjM3X5eEeJcWVkj7mxj5
Ae421mghRJU/T1KRbhUZBLADuyY5hT+iv0YAXN1HF8T1Kn51UZFcwgGmUX5SWwhp
i7507ixp6rea8QKfaRi5r7QZaKQ21iCuPdWvUPYZJYs1bj4MjZloxDEegy80Sk0W
B5C6QsZ/Mtzv6wRrQvDAe42NsfhX9mT1H4NkMEQQbCaXbyQpA+n9e8C9t1BhnVpZ
0l+fvFoV4KEulKM0zgEqUzIIZaN5HgAdl/RLzhhanjxRRZ/TT4XF449FUcmqe/gJ
4MrkW8/Ip0OjBQlsoLdD1kjCPTTKZQ==
=fm8s
-----END PGP SIGNATURE-----

--7KrLp3hww3Zx0w3B--


