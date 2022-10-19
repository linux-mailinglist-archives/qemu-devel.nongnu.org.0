Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 729096040AC
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 12:09:08 +0200 (CEST)
Received: from localhost ([::1]:37014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ol60Z-00050G-0h
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 06:09:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1ol5n1-0006ZB-7R
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 05:55:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46165)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1ol5mo-0005re-RH
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 05:55:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666173294;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UPg9q8YiYC+qj8cVraaEmev8daoWzpV1g3l1jEmdSXA=;
 b=gDAYT0R5Wzxo6ZZoNej7gGM9QviIeqe139ZgYnnic3VMJXvznPLbLEn8LgK3s92Prp5fmu
 ts5VYqWxJ1cUhR4yd9AWSJn94UMcjkVixal6DyqO76rTISBy1HZ1GQzbshKr5rzFYKnf5Z
 WtjVRqWpumzNM7GMidSVt7veDtk4nEU=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-354-6vQQMziKMteFf619DPsCtA-1; Wed, 19 Oct 2022 05:54:53 -0400
X-MC-Unique: 6vQQMziKMteFf619DPsCtA-1
Received: by mail-qv1-f70.google.com with SMTP id
 q17-20020a056214019100b004b1d3c9f3acso10231734qvr.0
 for <qemu-devel@nongnu.org>; Wed, 19 Oct 2022 02:54:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UPg9q8YiYC+qj8cVraaEmev8daoWzpV1g3l1jEmdSXA=;
 b=PGhi1wE/y/Prw0Jt5eRaVKPV9hH94V1JqzmRaG2BAn3Zk9CiKwst8y7Ljvqkiv9Za3
 IWNTZtUvYjCiTThII/Ss14IDzxi26yXGmvAoU7Q7zI5V41dKw4x1teyCVVZUOypW1T61
 0Ks7Rrv3eGMk3jfT+qDxHXd8kFq1sZc082gukeZeQzWHnLWR/VSgpBGnoMuYbQa6vh1a
 KsFl89Y/wj+y6Lz1DuZ1oWB4L1D0vSK2aAA0vCx9GNkyThZzWrGrOXeV/1/G0IhZEBNj
 9U4d4otzcDtmWHsofrgTHvwC9vKV5neCVXlmkF/ChziT7mrC5vc1OJ4qoJl8g1owKBQx
 ZtGQ==
X-Gm-Message-State: ACrzQf0/IIjH8F4P/jBYX42v8rQzY+NtPHgTkcji6A77OPonMub5vq3T
 lyltXgr4GlN1Nhlff5/jPJD/vpW57MVAIEW+qPXILSdTLtOA5oLZjcqfgdciAZlqLKC9b8GYdli
 YMMvBY8ubhuTJ8oU=
X-Received: by 2002:a05:620a:1309:b0:6ee:52fd:a82d with SMTP id
 o9-20020a05620a130900b006ee52fda82dmr4813284qkj.431.1666173292559; 
 Wed, 19 Oct 2022 02:54:52 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7QT8ISRSwF9rr7/RrHIQCW/IY7BUhmBESRbbGNyZpY+PoQ4KsUVBGwPf+U1gIeAPW+0BjFFA==
X-Received: by 2002:a05:620a:1309:b0:6ee:52fd:a82d with SMTP id
 o9-20020a05620a130900b006ee52fda82dmr4813253qkj.431.1666173292281; 
 Wed, 19 Oct 2022 02:54:52 -0700 (PDT)
Received: from sgarzare-redhat ([5.179.190.19])
 by smtp.gmail.com with ESMTPSA id
 s7-20020a05620a254700b006af0ce13499sm4589872qko.115.2022.10.19.02.54.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Oct 2022 02:54:51 -0700 (PDT)
Date: Wed, 19 Oct 2022 11:54:42 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, Fam Zheng <fam@euphon.net>,
 Markus Armbruster <armbru@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Wen Congyang <wencongyang2@huawei.com>, Kevin Wolf <kwolf@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-block@nongnu.org,
 Eric Blake <eblake@redhat.com>, John Snow <jsnow@redhat.com>,
 afaria@redhat.com, Jeff Cody <codyprime@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 integration@gluster.org, Peter Xu <peterx@redhat.com>,
 "Richard W.M. Jones" <rjones@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 "Denis V. Lunev" <den@openvz.org>
Subject: Re: [PATCH v7 00/13] blkio: add libblkio BlockDriver
Message-ID: <20221019095442.vgto56yi64s3gcmq@sgarzare-redhat>
References: <20221013185908.1297568-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221013185908.1297568-1-stefanha@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

I reviewed some patches (the others I do not feel confident of my 
knowledge). But I think we are in a very good shape and can merge from 
my point of view.

Thanks again for this work,
Stefano

On Thu, Oct 13, 2022 at 02:58:55PM -0400, Stefan Hajnoczi wrote:
>v7:
>- Add nvme-io_uring and virtio-blk-vhost-user syntax examples to commit description [Markus]
>- Add missing nvme-io_uring QAPI [Markus, Alberto]
>- Rename mem-regions-pinned to may-pin-mem-regions [Alberto]
>- Fix value/bs->bl.max_iov mix-up [Stefano]
>v6:
>- Add untested nvme-io_uring driver. Please test in your nested NVMe environment, Alberto. [Alberto]
>- Map blkio mem regions only when necessary to reduce conflicts with RAM discard [Alberto]
>- Reduce duplication by having a single blkio_virtio_blk_common_open() function [Alberto]
>- Avoid duplication in BlockDriver definitions using a macro [Alberto]
>- Avoid ram block registrar segfault [Stefano]
>- Use QLIST_FOREACH_SAFE() in ram block notifier code so callbacks can remove themselves
>v5:
>- Drop "RFC" since libblkio 1.0 has been released and the library API is stable
>- Disable BDRV_REQ_REGISTERED_BUF if we run out of blkio_mem_regions. The
>  bounce buffer slow path is taken when there are not enough blkio_mem_regions
>  to cover guest RAM. [Hanna & David Hildenbrand]
>- Call ram_block_discard_disable() when mem-region-pinned property is true or
>  absent [David Hildenbrand]
>- Use a bounce buffer pool instead of allocating/freeing a buffer for each
>  request. This reduces the number of blkio_mem_regions required for bounce
>  buffers to 1 and avoids frequent blkio_mem_region_map/unmap() calls.
>- Switch to .bdrv_co_*() instead of .bdrv_aio_*(). Needed for the bounce buffer
>  pool's CoQueue.
>v4:
>- Patch 1:
>  - Add virtio-blk-vhost-user driver [Kevin]
>  - Drop .bdrv_parse_filename() and .bdrv_needs_filename for virtio-blk-vhost-vdpa [Stefano]
>  - Add copyright and license header [Hanna]
>  - Drop .bdrv_parse_filename() in favor of --blockdev or json: [Hanna]
>  - Clarify that "filename" is always non-NULL for io_uring [Hanna]
>  - Check that virtio-blk-vhost-vdpa "path" option is non-NULL [Hanna]
>  - Fix virtio-blk-vhost-vdpa cache.direct=off logic [Hanna]
>  - Use macros for driver names [Hanna]
>  - Assert that the driver name is valid [Hanna]
>  - Update "readonly" property name to "read-only" [Hanna]
>  - Call blkio_detach_aio_context() in blkio_close() [Hanna]
>  - Avoid uint32_t * to int * casts in blkio_refresh_limits() [Hanna]
>  - Remove write zeroes and discard from the todo list [Hanna]
>  - Use PRIu32 instead of %d for uint32_t [Hanna]
>  - Fix error messages with buf-alignment instead of optimal-io-size [Hanna]
>  - Call map/unmap APIs since libblkio alloc/free APIs no longer do that
>  - Update QAPI schema QEMU version to 7.2
>- Patch 5:
>  - Expand the BDRV_REQ_REGISTERED_BUF flag passthrough and drop assert(!flags)
>    in drivers [Hanna]
>- Patch 7:
>  - Fix BLK->BDRV typo [Hanna]
>  - Make BlockRAMRegistrar handle failure [Hanna]
>- Patch 8:
>  - Replace memory_region_get_fd() approach with qemu_ram_get_fd()
>- Patch 10:
>  - Use (void)ret; to discard unused return value [Hanna]
>  - libblkio's blkio_unmap_mem_region() API no longer has a return value
>  - Check for registered bufs that cross RAMBlocks [Hanna]
>- Patch 11:
>  - Handle bdrv_register_buf() errors [Hanna]
>v3:
>- Add virtio-blk-vhost-vdpa for vdpa-blk devices including VDUSE
>- Add discard and write zeroes support
>- Rebase and adopt latest libblkio APIs
>v2:
>- Add BDRV_REQ_REGISTERED_BUF to bs.supported_write_flags [Stefano]
>- Use new blkioq_get_num_completions() API
>- Implement .bdrv_refresh_limits()
>
>This patch series adds a QEMU BlockDriver for libblkio
>(https://gitlab.com/libblkio/libblkio/), a library for high-performance block
>device I/O. This work was presented at KVM Forum 2022 and slides are available
>here:
>https://static.sched.com/hosted_files/kvmforum2022/8c/libblkio-kvm-forum-2022.pdf
>
>The second patch adds the core BlockDriver and most of the libblkio API usage.
>Three libblkio drivers are included:
>- io_uring
>- virtio-blk-vhost-user
>- virtio-blk-vhost-vdpa
>
>The remainder of the patch series reworks the existing QEMU bdrv_register_buf()
>API so virtio-blk emulation efficiently map guest RAM for libblkio - some
>libblkio drivers require that I/O buffer memory is pre-registered (think VFIO,
>vhost, etc).
>
>Vladimir requested performance results that show the effect of the
>BDRV_REQ_REGISTERED_BUF flag. I ran the patches against qemu-storage-daemon's
>vhost-user-blk export with iodepth=1 bs=512 to see the per-request overhead due
>to bounce buffer allocation/mapping:
>
>Name                                   IOPS   Error
>bounce-buf                          4373.81 ± 0.01%
>registered-buf                     13062.80 ± 0.67%
>
>The BDRV_REQ_REGISTERED_BUF optimization version is about 3x faster.
>
>See the BlockDriver struct in block/blkio.c for a list of APIs that still need
>to be implemented. The core functionality is covered.
>
>Regarding the design: each libblkio driver is a separately named BlockDriver.
>That means there is an "io_uring" BlockDriver and not a generic "libblkio"
>BlockDriver. This way QAPI and open parameters are type-safe and mandatory
>parameters can be checked by QEMU.
>
>Stefan Hajnoczi (13):
>  coroutine: add flag to re-queue at front of CoQueue
>  blkio: add libblkio block driver
>  numa: call ->ram_block_removed() in ram_block_notifer_remove()
>  block: pass size to bdrv_unregister_buf()
>  block: use BdrvRequestFlags type for supported flag fields
>  block: add BDRV_REQ_REGISTERED_BUF request flag
>  block: return errors from bdrv_register_buf()
>  numa: use QLIST_FOREACH_SAFE() for RAM block notifiers
>  block: add BlockRAMRegistrar
>  exec/cpu-common: add qemu_ram_get_fd()
>  stubs: add qemu_ram_block_from_host() and qemu_ram_get_fd()
>  blkio: implement BDRV_REQ_REGISTERED_BUF optimization
>  virtio-blk: use BDRV_REQ_REGISTERED_BUF optimization hint
>
> MAINTAINERS                                 |    7 +
> meson_options.txt                           |    2 +
> qapi/block-core.json                        |   77 +-
> meson.build                                 |    9 +
> include/block/block-common.h                |    9 +
> include/block/block-global-state.h          |   10 +-
> include/block/block_int-common.h            |   15 +-
> include/exec/cpu-common.h                   |    1 +
> include/hw/virtio/virtio-blk.h              |    2 +
> include/qemu/coroutine.h                    |   15 +-
> include/sysemu/block-backend-global-state.h |    4 +-
> include/sysemu/block-ram-registrar.h        |   37 +
> block.c                                     |   14 +
> block/blkio.c                               | 1008 +++++++++++++++++++
> block/blkverify.c                           |    4 +-
> block/block-backend.c                       |    8 +-
> block/block-ram-registrar.c                 |   58 ++
> block/crypto.c                              |    4 +-
> block/file-posix.c                          |    1 -
> block/gluster.c                             |    1 -
> block/io.c                                  |  101 +-
> block/mirror.c                              |    2 +
> block/nbd.c                                 |    1 -
> block/nvme.c                                |   20 +-
> block/parallels.c                           |    1 -
> block/qcow.c                                |    2 -
> block/qed.c                                 |    1 -
> block/raw-format.c                          |    2 +
> block/replication.c                         |    1 -
> block/ssh.c                                 |    1 -
> block/vhdx.c                                |    1 -
> hw/block/virtio-blk.c                       |   39 +-
> hw/core/numa.c                              |   26 +-
> qemu-img.c                                  |    6 +-
> softmmu/physmem.c                           |    5 +
> stubs/physmem.c                             |   13 +
> tests/qtest/modules-test.c                  |    3 +
> util/qemu-coroutine-lock.c                  |    9 +-
> util/vfio-helpers.c                         |    5 +-
> block/meson.build                           |    2 +
> scripts/meson-buildoptions.sh               |    3 +
> stubs/meson.build                           |    1 +
> 42 files changed, 1435 insertions(+), 96 deletions(-)
> create mode 100644 include/sysemu/block-ram-registrar.h
> create mode 100644 block/blkio.c
> create mode 100644 block/block-ram-registrar.c
> create mode 100644 stubs/physmem.c
>
>-- 
>2.37.3
>


