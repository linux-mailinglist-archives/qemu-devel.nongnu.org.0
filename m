Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E49FA40CC0D
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 19:56:33 +0200 (CEST)
Received: from localhost ([::1]:50660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQZ96-0002GI-Vb
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 13:56:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mQZ6A-0005UK-EJ
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 13:53:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mQZ66-0006L4-86
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 13:53:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631728404;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=dESDxRGCqgAbD7y5rojTCiRj7kGk9M7TVdCnvmoN2IA=;
 b=MSIxAYhhky3Kr/5Bk729LRbDE5g04TicZwIKBHwmkAAHrvEXOdR0g/F2QLeX51FjSoz1ux
 hPlRcnJEaV1KtR1iX8WDlRhyRlj4uQeEOw5GhR5/JaNsAlsv1oYeXqdBpLTlzZSKgL2E1I
 01DLAfMSXW50Toxo7RWdoJpMd195+7Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-242-0nnVeVtUN_yqxxy2V2a9ow-1; Wed, 15 Sep 2021 13:53:21 -0400
X-MC-Unique: 0nnVeVtUN_yqxxy2V2a9ow-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CD1EE80124F;
 Wed, 15 Sep 2021 17:53:20 +0000 (UTC)
Received: from localhost (unknown [10.39.192.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 70C187A5CE;
 Wed, 15 Sep 2021 17:53:20 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 00/32] Block patches
Date: Wed, 15 Sep 2021 19:52:46 +0200
Message-Id: <20210915175318.853225-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 0b6206b9c6825619cd721085fe082d7a0abc9af4:

  Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-tcg-20210914-4' into staging (2021-09-15 13:27:49 +0100)

are available in the Git repository at:

  https://github.com/XanClic/qemu.git tags/pull-block-2021-09-15

for you to fetch changes up to 1899bf47375ad40555dcdff12ba49b4b8b82df38:

  qemu-img: Add -F shorthand to convert (2021-09-15 18:42:38 +0200)

----------------------------------------------------------------
Block patches:
- Block-status cache for data regions
- qcow2 optimization (when using subclusters)
- iotests delinting, and let 297 (lint checker) cover named iotests
- qcow2 check improvements
- Added -F (target backing file format) option to qemu-img convert
- Mirror job fix
- Fix for when a migration is initiated while a backup job runs
- Fix for uncached qemu-img convert to a volume with 4k sectors (for an
  unaligned image)
- Minor gluster driver fix

----------------------------------------------------------------
Eric Blake (1):
  qemu-img: Add -F shorthand to convert

Hanna Reitz (15):
  gluster: Align block-status tail
  block: Drop BDS comment regarding bdrv_append()
  block: block-status cache for data regions
  block: Clarify that @bytes is no limit on *pnum
  block/file-posix: Do not force-cap *pnum
  block/gluster: Do not force-cap *pnum
  block/iscsi: Do not force-cap *pnum
  iotests: Fix unspecified-encoding pylint warnings
  iotests: Fix use-{list,dict}-literal warnings
  iotests/297: Drop 169 and 199 from the skip list
  migrate-bitmaps-postcopy-test: Fix pylint warnings
  migrate-bitmaps-test: Fix pylint warnings
  mirror-top-perms: Fix AbnormalShutdown path
  iotests/297: Cover tests/
  qemu-img: Allow target be aligned to sector size

Stefano Garzarella (1):
  block/mirror: fix NULL pointer dereference in
    mirror_wait_on_conflicts()

Vladimir Sementsov-Ogievskiy (15):
  tests: add migrate-during-backup
  block: bdrv_inactivate_recurse(): check for permissions and fix crash
  simplebench: add img_bench_templater.py
  qcow2: refactor handle_dependencies() loop body
  qcow2: handle_dependencies(): relax conflict detection
  qcow2-refcount: improve style of check_refcounts_l2()
  qcow2: compressed read: simplify cluster descriptor passing
  qcow2: introduce qcow2_parse_compressed_l2_entry() helper
  qcow2-refcount: introduce fix_l2_entry_by_zero()
  qcow2-refcount: fix_l2_entry_by_zero(): also zero L2 entry bitmap
  qcow2-refcount: check_refcounts_l2(): check l2_bitmap
  qcow2-refcount: check_refcounts_l2(): check reserved bits
  qcow2-refcount: improve style of check_refcounts_l1()
  qcow2-refcount: check_refcounts_l1(): check reserved bits
  qcow2-refcount: check_refblocks(): add separate message for reserved

 docs/tools/qemu-img.rst                       |   4 +-
 block/qcow2.h                                 |   7 +-
 include/block/block_int.h                     |  61 +++-
 block.c                                       |  88 +++++
 block/file-posix.c                            |   7 +-
 block/gluster.c                               |  23 +-
 block/io.c                                    |  68 +++-
 block/iscsi.c                                 |   3 -
 block/mirror.c                                |  25 +-
 block/qcow2-cluster.c                         |  78 +++--
 block/qcow2-refcount.c                        | 326 ++++++++++++------
 block/qcow2.c                                 |  13 +-
 qemu-img.c                                    |  18 +-
 qemu-img-cmds.hx                              |   2 +-
 scripts/simplebench/img_bench_templater.py    |  95 +++++
 scripts/simplebench/table_templater.py        |  62 ++++
 tests/qemu-iotests/122                        |   2 +-
 tests/qemu-iotests/271                        |   5 +-
 tests/qemu-iotests/271.out                    |   4 +-
 tests/qemu-iotests/297                        |   9 +-
 tests/qemu-iotests/iotests.py                 |  12 +-
 .../tests/migrate-bitmaps-postcopy-test       |  13 +-
 tests/qemu-iotests/tests/migrate-bitmaps-test |  43 ++-
 .../qemu-iotests/tests/migrate-during-backup  |  97 ++++++
 .../tests/migrate-during-backup.out           |   5 +
 tests/qemu-iotests/tests/mirror-top-perms     |   2 +-
 26 files changed, 855 insertions(+), 217 deletions(-)
 create mode 100755 scripts/simplebench/img_bench_templater.py
 create mode 100644 scripts/simplebench/table_templater.py
 create mode 100755 tests/qemu-iotests/tests/migrate-during-backup
 create mode 100644 tests/qemu-iotests/tests/migrate-during-backup.out

-- 
2.31.1


