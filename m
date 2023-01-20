Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09502674D95
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 08:02:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIlPG-0000A1-0N; Fri, 20 Jan 2023 02:01:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pIlOz-0008UH-RH
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 02:01:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pIlOw-0005Fz-QZ
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 02:01:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674198085;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+T39vI+d7+kJY3GNW30TDsM+Poct2V5aathPLUdVJlI=;
 b=KLn/v4erIy38JJsOsf2OYH3EujtgYOHvg0bogdDk1ZhApYmmuGvS1Xc0lqC3K0RzcemoR7
 5OsCw2FStvWN8uOwdRATP3mBQe4KPqk97Aa1Mp2qxBR6t5xzp0yhdkJeSzXtuVBv6b6gxA
 wOBVRGfNOgjEv04NmbAQ0QKgFxTetHk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-215-GUVdM1FtOwKOZpxJW0x8dg-1; Fri, 20 Jan 2023 02:01:24 -0500
X-MC-Unique: GUVdM1FtOwKOZpxJW0x8dg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C201C85A588;
 Fri, 20 Jan 2023 07:01:23 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 826801121315;
 Fri, 20 Jan 2023 07:01:23 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 81A4121E6A28; Fri, 20 Jan 2023 08:01:22 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
Subject: [PULL 00/12] Header cleanup patches for 2023-01-20
Date: Fri, 20 Jan 2023 08:01:10 +0100
Message-Id: <20230120070122.3982588-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The following changes since commit 7ec8aeb6048018680c06fb9205c01ca6bda08846:

  Merge tag 'pull-tpm-2023-01-17-1' of https://github.com/stefanberger/qemu-tpm into staging (2023-01-17 15:47:53 +0000)

are available in the Git repository at:

  https://repo.or.cz/qemu/armbru.git tags/pull-include-2023-01-20

for you to fetch changes up to b6c80037ed3ba275eea2b33bc17e36af2b89813a:

  include/hw/ppc include/hw/pci-host: Drop extra typedefs (2023-01-20 07:25:22 +0100)

----------------------------------------------------------------
Header cleanup patches for 2023-01-20

----------------------------------------------------------------
Markus Armbruster (12):
      coroutine: Clean up superfluous inclusion of qemu/coroutine.h
      coroutine: Move coroutine_fn to qemu/osdep.h, trim includes
      coroutine: Clean up superfluous inclusion of qemu/lockable.h
      coroutine: Split qemu/coroutine-core.h off qemu/coroutine.h
      coroutine: Use Coroutine typedef name instead of structure tag
      include/block: Untangle inclusion loops
      hw/sparc64/niagara: Use blk_name() instead of open-coding it
      include/hw/block: Include hw/block/block.h where needed
      include/hw/ppc: Split pnv_chip.h off pnv.h
      include/hw/ppc: Supply a few missing includes
      include/hw/ppc: Don't include hw/pci-host/pnv_phb.h from pnv.h
      include/hw/ppc include/hw/pci-host: Drop extra typedefs

 accel/tcg/debuginfo.h                  |   2 +
 crypto/block-luks-priv.h               |   1 -
 hw/9pfs/coth.h                         |   2 +-
 hw/pci-host/pnv_phb.h                  |   2 +-
 include/block/aio.h                    |   9 +-
 include/block/aio_task.h               |   2 -
 include/block/block-common.h           |  10 +--
 include/block/block-copy.h             |   4 +-
 include/block/block-global-state.h     |   4 +-
 include/block/block-hmp-cmds.h         |   2 +
 include/block/block-io.h               |   5 +-
 include/block/block.h                  |   4 +-
 include/block/block_backup.h           |   2 +-
 include/block/block_int-common.h       |  14 ++-
 include/block/block_int-global-state.h |   5 +-
 include/block/block_int-io.h           |   4 +-
 include/block/block_int.h              |   4 +-
 include/block/blockjob.h               |   2 +-
 include/block/blockjob_int.h           |   1 -
 include/block/dirty-bitmap.h           |   1 +
 include/block/graph-lock.h             |   2 -
 include/block/qapi.h                   |   2 +-
 include/block/raw-aio.h                |   1 -
 include/block/thread-pool.h            |   2 +-
 include/block/throttle-groups.h        |   2 +-
 include/hw/block/swim.h                |   1 +
 include/hw/pci-host/pnv_phb3.h         |   1 -
 include/hw/pci-host/pnv_phb4.h         |   5 +-
 include/hw/ppc/pnv.h                   | 146 +------------------------------
 include/hw/ppc/pnv_chip.h              | 147 +++++++++++++++++++++++++++++++
 include/hw/ppc/pnv_core.h              |   3 +-
 include/hw/ppc/pnv_homer.h             |   2 +-
 include/hw/ppc/pnv_lpc.h               |  11 +--
 include/hw/ppc/pnv_occ.h               |   3 +-
 include/hw/ppc/pnv_pnor.h              |   2 +-
 include/hw/ppc/pnv_sbe.h               |   3 +-
 include/hw/ppc/pnv_xive.h              |   7 +-
 include/hw/ppc/pnv_xscom.h             |   3 +-
 include/hw/ppc/xive2.h                 |   2 +
 include/hw/ppc/xive2_regs.h            |   2 +
 include/io/channel.h                   |   2 +-
 include/monitor/hmp.h                  |   1 -
 include/qemu/coroutine-core.h          | 154 +++++++++++++++++++++++++++++++++
 include/qemu/coroutine.h               | 113 ++----------------------
 include/qemu/lockable.h                |   2 +-
 include/qemu/osdep.h                   |  16 ++++
 include/qemu/progress_meter.h          |   2 +-
 include/qemu/typedefs.h                |   1 -
 include/scsi/pr-manager.h              |   1 -
 include/sysemu/block-backend-io.h      |   1 +
 nbd/nbd-internal.h                     |   1 -
 block.c                                |   1 +
 block/amend.c                          |   1 +
 block/backup.c                         |   1 +
 block/blkdebug.c                       |   1 +
 block/blklogwrites.c                   |   1 +
 block/blkreplay.c                      |   1 +
 block/blkverify.c                      |   1 +
 block/block-copy.c                     |   4 +
 block/bochs.c                          |   1 +
 block/cloop.c                          |   1 +
 block/copy-before-write.c              |   1 +
 block/copy-on-read.c                   |   1 +
 block/curl.c                           |   1 +
 block/dirty-bitmap.c                   |   2 +
 block/dmg.c                            |   1 +
 block/export/fuse.c                    |   3 +-
 block/file-posix.c                     |   1 +
 block/file-win32.c                     |   1 +
 block/filter-compress.c                |   1 +
 block/gluster.c                        |   1 +
 block/io.c                             |   1 +
 block/iscsi.c                          |   1 +
 block/mirror.c                         |   1 +
 block/monitor/bitmap-qmp-cmds.c        |   2 +
 block/nfs.c                            |   1 +
 block/null.c                           |   1 +
 block/nvme.c                           |   1 +
 block/parallels-ext.c                  |   2 +
 block/preallocate.c                    |   1 +
 block/progress_meter.c                 |   2 +
 block/qapi-sysemu.c                    |   1 +
 block/qapi.c                           |   1 +
 block/qcow2-bitmap.c                   |   2 +
 block/qcow2-cache.c                    |   1 +
 block/qcow2-cluster.c                  |   1 +
 block/qcow2-refcount.c                 |   1 +
 block/qcow2-threads.c                  |   1 +
 block/qcow2.c                          |   1 +
 block/qed-check.c                      |   1 +
 block/qed-table.c                      |   1 +
 block/raw-format.c                     |   1 +
 block/rbd.c                            |   1 +
 block/ssh.c                            |   1 +
 block/throttle.c                       |   2 +
 block/vhdx-log.c                       |   1 +
 block/vvfat.c                          |   1 +
 block/win32-aio.c                      |   1 +
 block/write-threshold.c                |   1 +
 blockdev.c                             |   1 +
 blockjob.c                             |   2 +-
 crypto/block-luks.c                    |   1 -
 hw/9pfs/codir.c                        |   1 -
 hw/9pfs/cofile.c                       |   1 -
 hw/9pfs/cofs.c                         |   1 -
 hw/9pfs/coxattr.c                      |   1 -
 hw/block/block.c                       |   1 +
 hw/intc/pnv_xive.c                     |   1 +
 hw/intc/pnv_xive2.c                    |   1 +
 hw/pci-host/pnv_phb3.c                 |   1 +
 hw/pci-host/pnv_phb4_pec.c             |   1 +
 hw/ppc/pnv.c                           |   3 +
 hw/ppc/pnv_core.c                      |   1 +
 hw/ppc/pnv_homer.c                     |   1 +
 hw/ppc/pnv_lpc.c                       |   1 +
 hw/ppc/pnv_psi.c                       |   1 +
 hw/ppc/pnv_xscom.c                     |   1 +
 hw/sparc64/niagara.c                   |   5 +-
 hw/virtio/virtio-pmem.c                |   1 +
 migration/block-dirty-bitmap.c         |   1 +
 migration/block.c                      |   1 +
 migration/savevm.c                     |   1 +
 monitor/qmp-cmds.c                     |   1 +
 nbd/client-connection.c                |   1 +
 nbd/server.c                           |   2 +
 qemu-img.c                             |   1 +
 softmmu/cpus.c                         |   1 +
 softmmu/physmem.c                      |   1 +
 storage-daemon/qemu-storage-daemon.c   |   1 +
 target/i386/kvm/kvm.c                  |   1 +
 tests/unit/test-aio.c                  |   2 +-
 tests/unit/test-bdrv-drain.c           |   2 +-
 tests/unit/test-block-iothread.c       |   1 +
 tests/unit/test-coroutine.c            |   2 -
 tests/unit/test-vmstate.c              |   1 -
 ui/console.c                           |   1 +
 util/async.c                           |   4 +-
 util/qemu-coroutine-lock.c             |   1 -
 util/qemu-coroutine-sleep.c            |   1 -
 util/qemu-coroutine.c                  |   1 -
 scripts/block-coroutine-wrapper.py     |   3 +-
 141 files changed, 494 insertions(+), 344 deletions(-)
 create mode 100644 include/hw/ppc/pnv_chip.h
 create mode 100644 include/qemu/coroutine-core.h

-- 
2.39.0


