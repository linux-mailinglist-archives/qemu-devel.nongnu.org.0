Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 024B7D49DF
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Oct 2019 23:29:16 +0200 (CEST)
Received: from localhost ([::1]:57154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iJ2TK-0004P3-R1
	for lists+qemu-devel@lfdr.de; Fri, 11 Oct 2019 17:29:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54985)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jsnow@redhat.com>) id 1iJ2QI-00027F-8O
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 17:26:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jsnow@redhat.com>) id 1iJ2QH-0000z5-0Z
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 17:26:06 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34242)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jsnow@redhat.com>)
 id 1iJ2QD-0000xv-2d; Fri, 11 Oct 2019 17:26:01 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 313C7A3CD67;
 Fri, 11 Oct 2019 21:26:00 +0000 (UTC)
Received: from probe.bos.redhat.com (dhcp-17-173.bos.redhat.com [10.18.17.173])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 66AA545A3;
 Fri, 11 Oct 2019 21:25:51 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 00/19] Bitmaps patches
Date: Fri, 11 Oct 2019 17:25:31 -0400
Message-Id: <20191011212550.27269-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.68]); Fri, 11 Oct 2019 21:26:00 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, libvir-list@redhat.com,
 John Snow <jsnow@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 98b2e3c9ab3abfe476a2b02f8f51813edb90e7=
2d:

  Merge remote-tracking branch 'remotes/stefanha/tags/block-pull-request'=
 into staging (2019-10-08 16:08:35 +0100)

are available in the Git repository at:

  https://github.com/jnsnow/qemu.git tags/bitmaps-pull-request

for you to fetch changes up to b97d9a1014b61dd0980e7f4a0c9ca1e3b0aaa761:

  dirty-bitmaps: remove deprecated autoload parameter (2019-10-09 17:02:4=
5 -0400)

----------------------------------------------------------------
Pull request

----------------------------------------------------------------

John Snow (2):
  MAINTAINERS: Add Vladimir as a reviewer for bitmaps
  dirty-bitmaps: remove deprecated autoload parameter

Vladimir Sementsov-Ogievskiy (17):
  util/hbitmap: strict hbitmap_reset
  block: move bdrv_can_store_new_dirty_bitmap to block/dirty-bitmap.c
  block/dirty-bitmap: return int from
    bdrv_remove_persistent_dirty_bitmap
  block/qcow2: proper locking on bitmap add/remove paths
  block/dirty-bitmap: drop meta
  block/dirty-bitmap: add bs link
  block/dirty-bitmap: drop BdrvDirtyBitmap.mutex
  block/dirty-bitmap: refactor bdrv_dirty_bitmap_next
  block: switch reopen queue from QSIMPLEQ to QTAILQ
  block: reverse order for reopen commits
  iotests: add test-case to 165 to test reopening qcow2 bitmaps to RW
  block/qcow2-bitmap: get rid of bdrv_has_changed_persistent_bitmaps
  block/qcow2-bitmap: drop qcow2_reopen_bitmaps_rw_hint()
  block/qcow2-bitmap: do not remove bitmaps on reopen-ro
  iotests: add test 260 to check bitmap life after snapshot + commit
  block/qcow2-bitmap: fix and improve qcow2_reopen_bitmaps_rw
  qcow2-bitmap: move bitmap reopen-rw code to qcow2_reopen_commit

 qemu-deprecated.texi           |  20 ++-
 qapi/block-core.json           |   6 +-
 block/qcow2.h                  |  19 +--
 include/block/block.h          |   2 +-
 include/block/block_int.h      |  20 +--
 include/block/dirty-bitmap.h   |  34 ++--
 include/qemu/hbitmap.h         |   5 +
 block.c                        |  79 +++------
 block/backup.c                 |  14 +-
 block/dirty-bitmap.c           | 290 +++++++++++++++++++--------------
 block/mirror.c                 |   4 +-
 block/qcow2-bitmap.c           | 212 +++++++++++++++---------
 block/qcow2.c                  |  22 ++-
 blockdev.c                     |  40 ++---
 migration/block-dirty-bitmap.c |  11 +-
 migration/block.c              |   4 +-
 tests/test-hbitmap.c           |   2 +-
 util/hbitmap.c                 |   4 +
 MAINTAINERS                    |   3 +-
 tests/qemu-iotests/165         |  57 ++++++-
 tests/qemu-iotests/165.out     |   4 +-
 tests/qemu-iotests/260         |  89 ++++++++++
 tests/qemu-iotests/260.out     |  52 ++++++
 tests/qemu-iotests/group       |   1 +
 24 files changed, 624 insertions(+), 370 deletions(-)
 create mode 100755 tests/qemu-iotests/260
 create mode 100644 tests/qemu-iotests/260.out

--=20
2.21.0


