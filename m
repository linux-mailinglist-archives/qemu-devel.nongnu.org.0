Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1F45F108A
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 19:11:16 +0200 (CEST)
Received: from localhost ([::1]:33662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeJXf-0003Wa-8r
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 13:11:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oeJFi-0006JL-77
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 12:52:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oeJFe-0006bE-Gp
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 12:52:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664556757;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=sInYL51cL/VaqtSBVahUQEsnKf25uyZ7iRtuTT4MGsU=;
 b=EDE7mGHGuXUHe+YMsRLLcTo/Ne2zYoTUvvq1zb1pMSKlY/mnn/oKmty/xZwhI/W/n+tZaJ
 K0hKO7XXQ831vIIBkK2VdJge3PahvOOEjgTfBpBuylDoIz4wU7QY9RbSPcERMK8WWiO6mw
 vdEJPWxgyGoaFSa/SxgG1L6xxTJCxTk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-458-fXDWON9-NuCpYpO0uIMdgQ-1; Fri, 30 Sep 2022 12:52:34 -0400
X-MC-Unique: fXDWON9-NuCpYpO0uIMdgQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E77D52A59556;
 Fri, 30 Sep 2022 16:52:33 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.192.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2D66117583;
 Fri, 30 Sep 2022 16:52:33 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	stefanha@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 00/18] Block layer patches
Date: Fri, 30 Sep 2022 18:52:04 +0200
Message-Id: <20220930165222.249716-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit c8de6ec63d766ca1998c5af468483ce912fdc0c2:

  Merge tag 'pull-request-2022-09-28' of https://gitlab.com/thuth/qemu into staging (2022-09-28 17:04:11 -0400)

are available in the Git repository at:

  git://repo.or.cz/qemu/kevin.git tags/for-upstream

for you to fetch changes up to 176e4961bb33d559da1af441fb0ee2e0cb8245ae:

  hw/ide/core.c: Implement ATA INITIALIZE_DEVICE_PARAMETERS command (2022-09-30 18:43:44 +0200)

----------------------------------------------------------------
Block layer patches

- Fix missing block_acct_setup() with -blockdev
- Keep auto_backing_file post-migration
- file-posix: Fixed O_DIRECT memory alignment
- ide: Fix state after EXECUTE DEVICE DIAGNOSTIC and implement
  INITIALIZE DEVICE PARAMETERS
- qemu-img: Wean documentation and help output off '?' for help
- qcow2: fix memory leak and compiler warning
- Code cleanups

----------------------------------------------------------------
Denis V. Lunev (4):
      block: pass OnOffAuto instead of bool to block_acct_setup()
      block: add missed block_acct_setup with new block device init procedure
      block: use bdrv_is_sg() helper instead of raw bs->sg reading
      block: make serializing requests functions 'void'

Hanna Reitz (3):
      block/qcow2: Keep auto_backing_file if possible
      block/qed: Keep auto_backing_file if possible
      iotests/backing-file-invalidation: Add new test

Keith Busch (2):
      block: move bdrv_qiov_is_aligned to file-posix
      block: use the request length for iov alignment

Lev Kujawski (5):
      piix_ide_reset: Use pci_set_* functions instead of direct access
      tests/qtest/ide-test.c: Create disk image for use as a secondary
      hw/ide/core: Clear LBA and drive bits for EXECUTE DEVICE DIAGNOSTIC
      tests/qtest/ide-test: Verify that DIAGNOSTIC clears DEV to zero
      hw/ide/core.c: Implement ATA INITIALIZE_DEVICE_PARAMETERS command

Markus Armbruster (1):
      qemu-img: Wean documentation and help output off '?' for help

Philippe Mathieu-Daudé (1):
      block/qcow2-bitmap: Add missing cast to silent GCC error

Stefan Hajnoczi (1):
      gluster: stop using .bdrv_needs_filename

lu zhipeng (1):
      qcow2: fix memory leak in qcow2_read_extensions

 docs/tools/qemu-img.rst                            |   2 +-
 include/block/accounting.h                         |   6 +-
 include/block/block-io.h                           |   1 -
 include/block/block_int-io.h                       |   2 +-
 include/hw/block/block.h                           |   7 +-
 include/hw/ide/internal.h                          |   3 +
 block/accounting.c                                 |  26 +++-
 block/file-posix.c                                 |  24 +++-
 block/gluster.c                                    |   4 -
 block/io.c                                         |  44 +-----
 block/iscsi.c                                      |   2 +-
 block/qcow2-bitmap.c                               |   2 +-
 block/qcow2.c                                      |  22 ++-
 block/qed.c                                        |  15 +-
 block/raw-format.c                                 |   4 +-
 blockdev.c                                         |  17 ++-
 hw/block/block.c                                   |   2 +
 hw/ide/core.c                                      |  35 ++++-
 hw/ide/piix.c                                      |  17 +--
 qemu-img.c                                         |   4 +-
 tests/qtest/ide-test.c                             |  72 +++++++---
 tests/qemu-iotests/172.out                         |  76 +++++++++++
 tests/qemu-iotests/227.out                         |   4 +-
 tests/qemu-iotests/tests/backing-file-invalidation | 152 +++++++++++++++++++++
 .../tests/backing-file-invalidation.out            |   5 +
 25 files changed, 447 insertions(+), 101 deletions(-)
 create mode 100755 tests/qemu-iotests/tests/backing-file-invalidation
 create mode 100644 tests/qemu-iotests/tests/backing-file-invalidation.out


