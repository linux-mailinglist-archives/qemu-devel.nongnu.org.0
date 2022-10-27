Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBDC1610065
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 20:39:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo7fl-00014b-Dg; Thu, 27 Oct 2022 14:32:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oo7fe-00014J-KH
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:32:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oo7fc-0002HB-Bu
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:32:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666895519;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=EAjSmgzY6BCGfDHZJP7Ji0gSQgm6Vqz/SJT1fTYN35A=;
 b=Hyn/GHdxT8/ROjacgnyEimhNKxgPANrMgr8QXIOzq4pAwiBUFCxUXdw3QSBykxYk5wGSYd
 QW07HIrVsYTZKvebVzsQkqHDqW3PIlJQM6M9ENuT87YS0EWBbzKZPtwpMc9V44kDjwuHYh
 BZQCI0bCCkj0++c/eN6Rxy/3nL7IbSc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-146-nXAzzuiNOqStObhR0HhOuA-1; Thu, 27 Oct 2022 14:31:58 -0400
X-MC-Unique: nXAzzuiNOqStObhR0HhOuA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C03DD3C0F671;
 Thu, 27 Oct 2022 18:31:56 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 04A72112132D;
 Thu, 27 Oct 2022 18:31:51 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	stefanha@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 00/58] Block layer patches
Date: Thu, 27 Oct 2022 20:30:48 +0200
Message-Id: <20221027183146.463129-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The following changes since commit 344744e148e6e865f5a57e745b02a87e5ea534ad:

  Merge tag 'dump-pull-request' of https://gitlab.com/marcandre.lureau/qemu into staging (2022-10-26 10:53:49 -0400)

are available in the Git repository at:

  git://repo.or.cz/qemu/kevin.git tags/for-upstream

for you to fetch changes up to be8da05b5ed8fb546731b9edb997f303f272bad8:

  block/block-backend: blk_set_enable_write_cache is IO_CODE (2022-10-27 20:27:37 +0200)

----------------------------------------------------------------
Block layer patches

- Cleanup bs->backing and bs->file handling
- Refactor bdrv_try_set_aio_context using transactions
- Changes for improved coroutine_fn consistency
- vhost-user-blk: fix the resize crash
- io_uring: Use of io_uring_register_ring_fd() led to breakage, revert
- vvfat: Fix some problems with r/w mode
- Code cleanup
- MAINTAINERS: Fold "Block QAPI, monitor, ..." into "Block layer core"

----------------------------------------------------------------
Alberto Faria (20):
      backup: remove incorrect coroutine_fn annotation
      block: remove incorrect coroutine_fn annotation
      monitor: add missing coroutine_fn annotation
      ssh: add missing coroutine_fn annotation
      block: add missing coroutine_fn annotation to prototypes
      coroutine-lock: add missing coroutine_fn annotation to prototypes
      coroutine-io: add missing coroutine_fn annotation to prototypes
      block: add missing coroutine_fn annotation to BlockDriverState callbacks
      qcow2: add coroutine_fn annotation for indirect-called functions
      commit: switch to *_co_* functions
      block: switch to *_co_* functions
      mirror: switch to *_co_* functions
      parallels: switch to *_co_* functions
      qcow: switch to *_co_* functions
      qcow2: switch to *_co_* functions
      qed: switch to *_co_* functions
      vdi: switch to *_co_* functions
      vhdx: switch to *_co_* functions
      vmdk: switch to *_co_* functions
      monitor: switch to *_co_* functions

Bin Meng (3):
      block: Ignore close() failure in get_tmp_filename()
      block: Refactor get_tmp_filename()
      block/nfs: Fix 32-bit Windows build

Emanuele Giuseppe Esposito (11):
      block.c: assert bs->aio_context is written under BQL and drains
      block: use transactions as a replacement of ->{can_}set_aio_context()
      bdrv_change_aio_context: use hash table instead of list of visited nodes
      blockjob: implement .change_aio_ctx in child_job
      block: implement .change_aio_ctx in child_of_bds
      block-backend: implement .change_aio_ctx in child_root
      block: use the new _change_ API instead of _can_set_ and _set_
      block: remove all unused ->can_set_aio_ctx and ->set_aio_ctx callbacks
      block: rename bdrv_child_try_change_aio_context in bdrv_try_change_aio_context
      block: remove bdrv_try_set_aio_context and replace it with bdrv_try_change_aio_context
      block/block-backend: blk_set_enable_write_cache is IO_CODE

Hervé Poussineau (2):
      vvfat: allow some writes to bootsector
      vvfat: allow spaces in file names

Li Feng (1):
      vhost-user-blk: fix the resize crash

Markus Armbruster (1):
      MAINTAINERS: Fold "Block QAPI, monitor, ..." into "Block layer core"

Paolo Bonzini (4):
      blkdebug: add missing coroutine_fn annotation for indirect-called functions
      qcow: manually add more coroutine_fn annotations
      qcow2: manually add more coroutine_fn annotations
      vmdk: manually add more coroutine_fn annotations

Sam Li (1):
      block/io_uring: revert "Use io_uring_register_ring_fd() to skip fd operations"

Vladimir Sementsov-Ogievskiy (15):
      block: BlockDriver: add .filtered_child_is_backing field
      block: introduce bdrv_open_file_child() helper
      block/blklogwrites: don't care to remove bs->file child on failure
      test-bdrv-graph-mod: update test_parallel_perm_update test case
      tests-bdrv-drain: bdrv_replace_test driver: declare supports_backing
      test-bdrv-graph-mod: fix filters to be filters
      block: document connection between child roles and bs->backing/bs->file
      block/snapshot: stress that we fallback to primary child
      Revert "block: Let replace_child_noperm free children"
      Revert "block: Let replace_child_tran keep indirect pointer"
      Revert "block: Restructure remove_file_or_backing_child()"
      Revert "block: Pass BdrvChild ** to replace_child_noperm"
      block: Manipulate bs->file / bs->backing pointers in .attach/.detach
      block/snapshot: drop indirection around bdrv_snapshot_fallback_ptr
      block: refactor bdrv_remove_file_or_backing_child to bdrv_remove_child

 docs/devel/multiple-iothreads.txt  |   4 +-
 block/qcow2.h                      |  32 +-
 include/block/block-common.h       |  39 ++
 include/block/block-global-state.h |  18 +-
 include/block/block-hmp-cmds.h     |   2 +-
 include/block/block-io.h           |   5 +-
 include/block/block_int-common.h   |  49 ++-
 include/monitor/hmp.h              |   3 +-
 include/qemu/coroutine.h           |  18 +-
 block.c                            | 855 +++++++++++++++++--------------------
 block/backup.c                     |   2 +-
 block/blkdebug.c                   |  11 +-
 block/blklogwrites.c               |  11 +-
 block/blkreplay.c                  |   7 +-
 block/blkverify.c                  |   9 +-
 block/block-backend.c              |  76 ++--
 block/bochs.c                      |   7 +-
 block/cloop.c                      |   7 +-
 block/commit.c                     |   3 +-
 block/copy-before-write.c          |   9 +-
 block/copy-on-read.c               |   9 +-
 block/crypto.c                     |  11 +-
 block/dmg.c                        |   7 +-
 block/export/export.c              |   2 +-
 block/filter-compress.c            |   8 +-
 block/io.c                         |   8 +-
 block/io_uring.c                   |  13 +-
 block/mirror.c                     |   5 +-
 block/monitor/block-hmp-cmds.c     |   2 +-
 block/nfs.c                        |   8 +
 block/parallels.c                  |  35 +-
 block/preallocate.c                |   9 +-
 block/qcow.c                       |  66 +--
 block/qcow2-bitmap.c               |   4 +-
 block/qcow2-cluster.c              |  29 +-
 block/qcow2-refcount.c             |  18 +-
 block/qcow2-snapshot.c             |   6 +-
 block/qcow2.c                      |  40 +-
 block/qed-table.c                  |   2 +-
 block/qed.c                        |  20 +-
 block/raw-format.c                 |   4 +-
 block/replication.c                |   8 +-
 block/snapshot-access.c            |   6 +-
 block/snapshot.c                   |  59 +--
 block/ssh.c                        |   6 +-
 block/throttle.c                   |   8 +-
 block/vdi.c                        |  24 +-
 block/vhdx.c                       |  15 +-
 block/vmdk.c                       |  95 ++---
 block/vpc.c                        |   7 +-
 block/vvfat.c                      |  35 +-
 blockdev.c                         |  24 +-
 blockjob.c                         |  50 ++-
 hw/block/vhost-user-blk.c          |   4 +
 job.c                              |   2 +-
 tests/unit/test-bdrv-drain.c       |  17 +-
 tests/unit/test-bdrv-graph-mod.c   | 104 +++--
 tests/unit/test-block-iothread.c   |  10 +-
 MAINTAINERS                        |  12 +-
 meson.build                        |   1 -
 tests/qemu-iotests/051             |   3 +-
 tests/qemu-iotests/051.out         |   2 +-
 tests/qemu-iotests/051.pc.out      |   2 +-
 63 files changed, 984 insertions(+), 983 deletions(-)


