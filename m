Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 619C15F6621
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 14:34:06 +0200 (CEST)
Received: from localhost ([::1]:58360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogQ4g-0006zD-Rx
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 08:34:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1ogPq7-00074B-CS
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 08:19:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50318)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1ogPq3-0007Yc-Qv
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 08:18:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665058730;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Nn6b8nWMc5Pov7ZgPpSojMGyzXhq9XLAVoRl+cjFMWA=;
 b=DSR+8LlSzqS05c0aWVkiCU1VgII3GIfHQqk4BGVwYjPCKRBwCKwT2uT2ogeVXh2BEwdtoZ
 KGeV2jC1DbjQua+V4pr0BQoBkYk6P0dS9sMxvaktvDMJ9lzTm9W9ighyRC0dDphrs7aV3A
 IwDqAWQVn1B14qxuzmoEm/CyURMGKII=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-458-uPaI7cT4M-ic2VAaZj1JYw-1; Thu, 06 Oct 2022 08:18:49 -0400
X-MC-Unique: uPaI7cT4M-ic2VAaZj1JYw-1
Received: by mail-qk1-f197.google.com with SMTP id
 d18-20020a05620a241200b006ce80a4d74aso1264631qkn.6
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 05:18:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Nn6b8nWMc5Pov7ZgPpSojMGyzXhq9XLAVoRl+cjFMWA=;
 b=dF+szOPKigDF5rafMKLVBKqjF89mRdllgNnrbfnnhnm5klyQC0pIABvVZclo6QfcoK
 GcvImk7CSJt3ybCRIo8TAqpbgSxFvOKSlARDQ6FnkTB+aeZ8E8N2HSDNmZ0wgg9CTkuP
 RdTbg1wMP5KY+DyuiU0SaiOdTwWQWx7gnnu1qvw4yfwHCSKRcLqcUaomqbLCvW5L8yDy
 pBGvUdobRUWHFAe4K4VNziCKkDfD5t9LtJONA5lxSIY6Zb7r41k7SVHfq+YZ5T98mxIO
 EAtPRV668oWC+tEywLiqsiTthvlUGf5GNsoOOfVnOf+mJ5WONuje6n9laaiZWFe9ktzO
 Yulw==
X-Gm-Message-State: ACrzQf1cTNPHonNdsv2fnWWlrha4sD5p6+eoV5UwsGh4H4+6htZofU+D
 vh+kcX/Key9o7qanJR1SSGMEQOxidCmhlZOJCm1V5G3wMVl/pgfu3EbVpJfHc6xnDv7QSZkDY8D
 yKgRqwDQvkDBBc5Y=
X-Received: by 2002:ad4:5be1:0:b0:496:a686:2bec with SMTP id
 k1-20020ad45be1000000b00496a6862becmr3395942qvc.85.1665058728533; 
 Thu, 06 Oct 2022 05:18:48 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5+jDxsYqQP6BwsKd6/JWgZvHLG62brd57ACauryxkgaPaoXSEYk4oNOpP6RWK+oqfjHg+IZQ==
X-Received: by 2002:ad4:5be1:0:b0:496:a686:2bec with SMTP id
 k1-20020ad45be1000000b00496a6862becmr3395898qvc.85.1665058728182; 
 Thu, 06 Oct 2022 05:18:48 -0700 (PDT)
Received: from sgarzare-redhat (host-79-46-200-222.retail.telecomitalia.it.
 [79.46.200.222]) by smtp.gmail.com with ESMTPSA id
 f21-20020a05620a409500b006b95b0a714esm21143371qko.17.2022.10.06.05.18.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Oct 2022 05:18:47 -0700 (PDT)
Date: Thu, 6 Oct 2022 14:18:35 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
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
 Stefan Hajnoczi <stefanha@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jeff Cody <codyprime@gmail.com>, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v5 00/12] blkio: add libblkio BlockDriver
Message-ID: <CAGxU2F5aE1P-atJ04SmUHrrW5QWbU80E_H7JBNaBzFkoVd7wOw@mail.gmail.com>
References: <20220927193431.22302-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220927193431.22302-1-stefanha@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Hi Stefan,
I tested this series with the vDPA block simulator in Linux v6.0.
It worked well, but I had a segfault when blkio_map_mem_region() fails.

In my case, it failed because I forgot to increase the `memlock` limit 
with `ulimit -l unlimited` since the simulator still requires locking 
all the VM memory.

QEMU failed with this messages:
$ qemu-system-x86_64 ... \
  -blockdev node-name=drive_src1,driver=virtio-blk-vhost-vdpa,path=/dev/vhost-vdpa-0,cache.direct=on
qemu-system-x86_64: -device virtio-blk-pci,id=src1,bootindex=2,drive=drive_src1,iothread=iothread0: Failed to add blkio mem region 0x7f60bfe00000 with size 536870912: Bad address (os error 14)
qemu-system-x86_64: -device virtio-blk-pci,id=src1,bootindex=2,drive=drive_src1,iothread=iothread0: Failed to add blkio mem region 0x7f60be400000 with size 16777216: Bad address (os error 14)
[1]    20803 segmentation fault

IIUC this could be related to a double call to 
ram_block_notifier_remove() in the error path of ram_block_added() 
(block/block-ram-registrar.c) callback.

Maybe we should call blk_register_buf() only if r->ok is true.

The stack trace is the following:
#0  0x00005641a8b097dd in ram_block_notifier_remove (n=n@entry=0x5641ab8354d8) at ../hw/core/numa.c:850
#1  0x00005641a89c4701 in ram_block_added
     (n=0x5641ab8354d8, host=<optimized out>, size=<optimized out>, max_size=<optimized out>)
    at ../block/block-ram-registrar.c:20
#2  0x00005641a8b083af in ram_block_notify_add_single (rb=0x5641ab3d2810, opaque=0x5641ab8354d8)
    at ../hw/core/numa.c:820
#3  0x00005641a8b92d8d in qemu_ram_foreach_block
    (func=func@entry=0x5641a8b08370 <ram_block_notify_add_single>, opaque=opaque@entry=0x5641ab8354d8)
    at ../softmmu/physmem.c:3571
#4  0x00005641a8b097af in ram_block_notifier_add (n=n@entry=0x5641ab8354d8) at ../hw/core/numa.c:844
#5  0x00005641a89c474f in blk_ram_registrar_init (r=r@entry=0x5641ab8354d0, blk=<optimized out>)
    at ../block/block-ram-registrar.c:46
#6  0x00005641a8affe88 in virtio_blk_device_realize (dev=0x5641ab835230, errp=0x7ffc72657190)
    at ../hw/block/virtio-blk.c:1239
#7  0x00005641a8b4b716 in virtio_device_realize (dev=0x5641ab835230, errp=0x7ffc726571f0)
    at ../hw/virtio/virtio.c:3684
#8  0x00005641a8c2049b in device_set_realized (obj=<optimized out>, value=<optimized out>, errp=0x7ffc72657380)
    at ../hw/core/qdev.c:553
#9  0x00005641a8c24738 in property_set_bool
    (obj=0x5641ab835230, v=<optimized out>, name=<optimized out>, opaque=0x5641aa518820, errp=0x7ffc72657380)
    at ../qom/object.c:2273
#10 0x00005641a8c27683 in object_property_set
   
     (obj=obj@entry=0x5641ab835230, name=name@entry=0x5641a8e9719a "realized", v=v@entry=0x5641ab83f5b0, errp=errp@entry=0x7ffc72657380) at ../qom/object.c:1408
#11 0x00005641a8c2a97f in object_property_set_qobject
    (obj=obj@entry=0x5641ab835230, name=name@entry=0x5641a8e9719a "realized", value=value@entry=0x5641ab83f4f0, errp=errp@entry=0x7ffc72657380) at ../qom/qom-qobject.c:28
#12 0x00005641a8c27c84 in object_property_set_bool
    (obj=0x5641ab835230, name=0x5641a8e9719a "realized", value=<optimized out>, errp=0x7ffc72657380)
    at ../qom/object.c:1477
#13 0x00005641a8929b74 in pci_qdev_realize (qdev=<optimized out>, errp=<optimized out>) at ../hw/pci/pci.c:2218
#14 0x00005641a8c2049b in device_set_realized (obj=<optimized out>, value=<optimized out>, errp=0x7ffc726575b0)
    at ../hw/core/qdev.c:553
#15 0x00005641a8c24738 in property_set_bool
    (obj=0x5641ab82ce70, v=<optimized out>, name=<optimized out>, opaque=0x5641aa518820, errp=0x7ffc726575b0)
    at ../qom/object.c:2273
#16 0x00005641a8c27683 in object_property_set

Thanks,
Stefano

On Tue, Sep 27, 2022 at 9:34 PM Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> v5:
> - Drop "RFC" since libblkio 1.0 has been released and the library API is stable
> - Disable BDRV_REQ_REGISTERED_BUF if we run out of blkio_mem_regions. The
>   bounce buffer slow path is taken when there are not enough blkio_mem_regions
>   to cover guest RAM. [Hanna & David Hildenbrand]
> - Call ram_block_discard_disable() when mem-region-pinned property is true or
>   absent [David Hildenbrand]
> - Use a bounce buffer pool instead of allocating/freeing a buffer for each
>   request. This reduces the number of blkio_mem_regions required for bounce
>   buffers to 1 and avoids frequent blkio_mem_region_map/unmap() calls.
> - Switch to .bdrv_co_*() instead of .bdrv_aio_*(). Needed for the bounce buffer
>   pool's CoQueue.
> v4:
> - Patch 1:
>   - Add virtio-blk-vhost-user driver [Kevin]
>   - Drop .bdrv_parse_filename() and .bdrv_needs_filename for virtio-blk-vhost-vdpa [Stefano]
>   - Add copyright and license header [Hanna]
>   - Drop .bdrv_parse_filename() in favor of --blockdev or json: [Hanna]
>   - Clarify that "filename" is always non-NULL for io_uring [Hanna]
>   - Check that virtio-blk-vhost-vdpa "path" option is non-NULL [Hanna]
>   - Fix virtio-blk-vhost-vdpa cache.direct=off logic [Hanna]
>   - Use macros for driver names [Hanna]
>   - Assert that the driver name is valid [Hanna]
>   - Update "readonly" property name to "read-only" [Hanna]
>   - Call blkio_detach_aio_context() in blkio_close() [Hanna]
>   - Avoid uint32_t * to int * casts in blkio_refresh_limits() [Hanna]
>   - Remove write zeroes and discard from the todo list [Hanna]
>   - Use PRIu32 instead of %d for uint32_t [Hanna]
>   - Fix error messages with buf-alignment instead of optimal-io-size [Hanna]
>   - Call map/unmap APIs since libblkio alloc/free APIs no longer do that
>   - Update QAPI schema QEMU version to 7.2
> - Patch 5:
>   - Expand the BDRV_REQ_REGISTERED_BUF flag passthrough and drop assert(!flags)
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
>
> This patch series adds a QEMU BlockDriver for libblkio
> (https://gitlab.com/libblkio/libblkio/), a library for high-performance block
> device I/O. This work was presented at KVM Forum 2022 and slides are available
> here:
> https://static.sched.com/hosted_files/kvmforum2022/8c/libblkio-kvm-forum-2022.pdf
>
> The second patch adds the core BlockDriver and most of the libblkio API usage.
> Three libblkio drivers are included:
> - io_uring
> - virtio-blk-vhost-user
> - virtio-blk-vhost-vdpa
>
> The remainder of the patch series reworks the existing QEMU bdrv_register_buf()
> API so virtio-blk emulation efficiently map guest RAM for libblkio - some
> libblkio drivers require that I/O buffer memory is pre-registered (think VFIO,
> vhost, etc).
>
> Vladimir requested performance results that show the effect of the
> BDRV_REQ_REGISTERED_BUF flag. I ran the patches against qemu-storage-daemon's
> vhost-user-blk export with iodepth=1 bs=512 to see the per-request overhead due
> to bounce buffer allocation/mapping:
>
> Name                                   IOPS   Error
> bounce-buf                          4373.81 ± 0.01%
> registered-buf                     13062.80 ± 0.67%
>
> The BDRV_REQ_REGISTERED_BUF optimization version is about 3x faster.
>
> See the BlockDriver struct in block/blkio.c for a list of APIs that still need
> to be implemented. The core functionality is covered.
>
> Regarding the design: each libblkio driver is a separately named BlockDriver.
> That means there is an "io_uring" BlockDriver and not a generic "libblkio"
> BlockDriver. This way QAPI and open parameters are type-safe and mandatory
> parameters can be checked by QEMU.
>
> Stefan Hajnoczi (12):
>   coroutine: add flag to re-queue at front of CoQueue
>   blkio: add libblkio block driver
>   numa: call ->ram_block_removed() in ram_block_notifer_remove()
>   block: pass size to bdrv_unregister_buf()
>   block: use BdrvRequestFlags type for supported flag fields
>   block: add BDRV_REQ_REGISTERED_BUF request flag
>   block: return errors from bdrv_register_buf()
>   block: add BlockRAMRegistrar
>   exec/cpu-common: add qemu_ram_get_fd()
>   stubs: add qemu_ram_block_from_host() and qemu_ram_get_fd()
>   blkio: implement BDRV_REQ_REGISTERED_BUF optimization
>   virtio-blk: use BDRV_REQ_REGISTERED_BUF optimization hint
>
>  MAINTAINERS                                 |    7 +
>  meson_options.txt                           |    2 +
>  qapi/block-core.json                        |   53 +-
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
>  block/blkio.c                               | 1017 +++++++++++++++++++
>  block/blkverify.c                           |    4 +-
>  block/block-backend.c                       |    8 +-
>  block/block-ram-registrar.c                 |   54 +
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
>  hw/core/numa.c                              |   17 +
>  qemu-img.c                                  |    6 +-
>  softmmu/physmem.c                           |    5 +
>  stubs/physmem.c                             |   13 +
>  tests/qtest/modules-test.c                  |    3 +
>  util/qemu-coroutine-lock.c                  |    9 +-
>  util/vfio-helpers.c                         |    5 +-
>  block/meson.build                           |    2 +
>  scripts/meson-buildoptions.sh               |    3 +
>  stubs/meson.build                           |    1 +
>  42 files changed, 1412 insertions(+), 91 deletions(-)
>  create mode 100644 include/sysemu/block-ram-registrar.h
>  create mode 100644 block/blkio.c
>  create mode 100644 block/block-ram-registrar.c
>  create mode 100644 stubs/physmem.c
>
> --
> 2.37.3
>


