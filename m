Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C6B5F7739
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 13:14:20 +0200 (CEST)
Received: from localhost ([::1]:48078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oglJ5-00005S-4v
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 07:14:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ogkth-0005Ip-Hc
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 06:48:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44066)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ogkte-00034Y-Vz
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 06:48:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665139682;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=yRsRcnYjcOPVHW0jcCBOfkuyNoOcHT86yMpgZnhRerk=;
 b=hNdee5bgggTEZJ0BDM2hbgZbr21J9FcEcDBXPKvzqy84NKxnx/Br+5VWGQ0V9qtH9d1/60
 Ar28Q8NHSZ/Wd83tvJLwnM6Qf8fTtboM57fXQEy90Ds2wUdrYrr3WomMfZJ6r3wf3S3HBK
 n62oILHdoCWo8QZfi1x3PRsgN5JI77w=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-621-q_u9Dq5bMJ6ZPLYZwfxeLQ-1; Fri, 07 Oct 2022 06:48:01 -0400
X-MC-Unique: q_u9Dq5bMJ6ZPLYZwfxeLQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AEAFA85A583;
 Fri,  7 Oct 2022 10:48:00 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.192.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E3FC52024CC6;
 Fri,  7 Oct 2022 10:47:59 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	stefanha@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 00/50] Block layer patches
Date: Fri,  7 Oct 2022 12:47:02 +0200
Message-Id: <20221007104752.141361-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
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

The following changes since commit f1d33f55c47dfdaf8daacd618588ad3ae4c452d1:

  Merge tag 'pull-testing-gdbstub-plugins-gitdm-061022-3' of https://github.com/stsquad/qemu into staging (2022-10-06 07:11:56 -0400)

are available in the Git repository at:

  git://repo.or.cz/qemu/kevin.git tags/for-upstream

for you to fetch changes up to a7ca2eb488ff149c898f43abe103f8bd8e3ca3c4:

  file-posix: Remove unused s->discard_zeroes (2022-10-07 12:11:41 +0200)

----------------------------------------------------------------
Block layer patches

- job: replace AioContext lock with job_mutex
- Fixes to make coroutine_fn annotations more accurate
- QAPI schema: Fix incorrect example
- Code cleanup

----------------------------------------------------------------
Alberto Faria (1):
      coroutine: Drop coroutine_fn annotation from qemu_coroutine_self()

Emanuele Giuseppe Esposito (20):
      job.c: make job_mutex and job_lock/unlock() public
      job.h: categorize fields in struct Job
      job.c: API functions not used outside should be static
      aio-wait.h: introduce AIO_WAIT_WHILE_UNLOCKED
      job.c: add job_lock/unlock while keeping job.h intact
      job: move and update comments from blockjob.c
      blockjob: introduce block_job _locked() APIs
      jobs: add job lock in find_* functions
      jobs: use job locks also in the unit tests
      block/mirror.c: use of job helpers in drivers
      jobs: group together API calls under the same job lock
      jobs: protect job.aio_context with BQL and job_mutex
      blockjob.h: categorize fields in struct BlockJob
      blockjob: rename notifier callbacks as _locked
      blockjob: protect iostatus field in BlockJob struct
      job.h: categorize JobDriver callbacks that need the AioContext lock
      job.c: enable job lock/unlock and remove Aiocontext locks
      block_job_query: remove atomic read
      blockjob: remove unused functions
      job: remove unused functions

Kevin Wolf (2):
      quorum: Remove unnecessary forward declaration
      file-posix: Remove unused s->discard_zeroes

Marc-André Lureau (3):
      9p: add missing coroutine_fn annotations
      migration: add missing coroutine_fn annotations
      test-coroutine: add missing coroutine_fn annotations

Markus Armbruster (1):
      Revert "qapi: fix examples of blockdev-add with qcow2"

Paolo Bonzini (23):
      block/nvme: separate nvme_get_free_req cases for coroutine/non-coroutine context
      block: add missing coroutine_fn annotations
      qcow2: remove incorrect coroutine_fn annotations
      nbd: remove incorrect coroutine_fn annotations
      coroutine: remove incorrect coroutine_fn annotations
      blkverify: add missing coroutine_fn annotations
      file-posix: add missing coroutine_fn annotations
      iscsi: add missing coroutine_fn annotations
      nbd: add missing coroutine_fn annotations
      nfs: add missing coroutine_fn annotations
      nvme: add missing coroutine_fn annotations
      parallels: add missing coroutine_fn annotations
      qcow2: add missing coroutine_fn annotations
      copy-before-write: add missing coroutine_fn annotations
      curl: add missing coroutine_fn annotations
      qed: add missing coroutine_fn annotations
      quorum: add missing coroutine_fn annotations
      throttle: add missing coroutine_fn annotations
      vmdk: add missing coroutine_fn annotations
      job: add missing coroutine_fn annotations
      coroutine-lock: add missing coroutine_fn annotations
      raw-format: add missing coroutine_fn annotations
      job: detect change of aiocontext within job coroutine

 qapi/block-core.json             |  10 +-
 block/qcow2.h                    |  19 +-
 hw/9pfs/9p.h                     |   9 +-
 include/block/aio-wait.h         |  17 +-
 include/block/blockjob.h         |  59 +++-
 include/block/nbd.h              |   2 +-
 include/qemu/coroutine.h         |   4 +-
 include/qemu/job.h               | 306 +++++++++++++-----
 block.c                          |  24 +-
 block/blkverify.c                |   2 +-
 block/block-backend.c            |  10 +-
 block/copy-before-write.c        |   9 +-
 block/curl.c                     |   2 +-
 block/file-posix.c               |  11 +-
 block/io.c                       |  22 +-
 block/iscsi.c                    |   3 +-
 block/mirror.c                   |  19 +-
 block/nbd.c                      |  11 +-
 block/nfs.c                      |   2 +-
 block/nvme.c                     |  54 ++--
 block/parallels.c                |   5 +-
 block/qcow2-cluster.c            |  21 +-
 block/qcow2-refcount.c           |   6 +-
 block/qcow2.c                    |   5 +-
 block/qed.c                      |   4 +-
 block/quorum.c                   |  38 +--
 block/raw-format.c               |   3 +-
 block/replication.c              |   3 +
 block/throttle.c                 |   2 +-
 block/vmdk.c                     |  22 +-
 blockdev.c                       | 129 ++++----
 blockjob.c                       | 132 ++++----
 job-qmp.c                        |  92 +++---
 job.c                            | 674 +++++++++++++++++++++++++--------------
 migration/migration.c            |   3 +-
 monitor/qmp-cmds.c               |   7 +-
 qemu-img.c                       |  17 +-
 tests/unit/test-bdrv-drain.c     |  80 +++--
 tests/unit/test-block-iothread.c |   8 +-
 tests/unit/test-blockjob-txn.c   |  24 +-
 tests/unit/test-blockjob.c       | 136 ++++----
 tests/unit/test-coroutine.c      |   2 +-
 util/qemu-coroutine-lock.c       |  14 +-
 util/qemu-coroutine.c            |   2 +-
 44 files changed, 1237 insertions(+), 787 deletions(-)


