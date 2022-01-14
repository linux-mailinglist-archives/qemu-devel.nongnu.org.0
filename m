Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E431948EB34
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 15:07:03 +0100 (CET)
Received: from localhost ([::1]:37796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8NEN-0000ZV-0C
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 09:07:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1n8N0R-0002xm-B8
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 08:52:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28119)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1n8N0O-0000IO-1G
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 08:52:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642168354;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=NVwF4cGfBYEp1/GQXtvbVnFV460sOu362JNx5QxmAjo=;
 b=NBUu/X/MI8/9tWpcePHVOeY5QmmXZ2ZE2VDGA5gBP6h5qjWD3GMrOnkDGec1br/o09Q6Ie
 2Qh2tKDxMLw+DOVHsv3J8O9O0t0MvZM9CoNpxccc9kqyXavJHwMolfIXyNa8HaSNyXJDLS
 g2CaVe3maTGdOVHQZiY8yuBqKReQDWQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-653-OI0JufNRNr6NgUWBZhtY_A-1; Fri, 14 Jan 2022 08:52:31 -0500
X-MC-Unique: OI0JufNRNr6NgUWBZhtY_A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 83C5F1853031;
 Fri, 14 Jan 2022 13:52:30 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.194.212])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7BC7C105B213;
 Fri, 14 Jan 2022 13:52:29 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 00/16] Block layer patches
Date: Fri, 14 Jan 2022 14:52:10 +0100
Message-Id: <20220114135226.185407-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 67b6526cf042f22521feff5ea521a05d3dd2bf8f:

  Merge remote-tracking branch 'remotes/bonzini-gitlab/tags/for-upstream' into staging (2022-01-13 13:59:56 +0000)

are available in the Git repository at:

  git://repo.or.cz/qemu/kevin.git tags/for-upstream

for you to fetch changes up to e5e748739562268ef4063ee77bf53ad7040b25c7:

  iotests/testrunner.py: refactor test_field_width (2022-01-14 12:03:16 +0100)

----------------------------------------------------------------
Block layer patches

- qemu-storage-daemon: Add vhost-user-blk help
- block-backend: Fix use-after-free for BDS pointers after aio_poll()
- qemu-img: Fix sparseness of output image with unaligned ranges
- vvfat: Fix crashes in read-write mode
- Fix device deletion events with -device JSON syntax
- Code cleanups

----------------------------------------------------------------
Daniel P. Berrangé (1):
      softmmu: fix device deletion events with -device JSON syntax

Emanuele Giuseppe Esposito (3):
      block_int: make bdrv_backing_overridden static
      include/sysemu/blockdev.h: remove drive_mark_claimed_by_board and inline drive_def
      include/sysemu/blockdev.h: remove drive_get_max_devs

Hanna Reitz (2):
      iotests/stream-error-on-reset: New test
      iotests/308: Fix for CAP_DAC_OVERRIDE

Kevin Wolf (3):
      vvfat: Fix size of temporary qcow file
      vvfat: Fix vvfat_write() for writes before the root directory
      iotests: Test qemu-img convert of zeroed data cluster

Philippe Mathieu-Daudé (3):
      docs: Correct 'vhost-user-blk' spelling
      qemu-storage-daemon: Add vhost-user-blk help
      qapi/block: Restrict vhost-user-blk to CONFIG_VHOST_USER_BLK_SERVER

Stefan Hajnoczi (1):
      block-backend: prevent dangling BDS pointers across aio_poll()

Vladimir Sementsov-Ogievskiy (3):
      qemu-img: make is_allocated_sectors() more efficient
      block: drop BLK_PERM_GRAPH_MOD
      iotests/testrunner.py: refactor test_field_width

 qapi/block-core.json                               |   7 +-
 qapi/block-export.json                             |   6 +-
 qapi/qdev.json                                     |   5 +-
 docs/tools/qemu-storage-daemon.rst                 |   2 +-
 include/block/block.h                              |   9 +-
 include/block/block_int.h                          |   3 -
 include/sysemu/blockdev.h                          |   3 -
 block.c                                            |  11 +-
 block/block-backend.c                              |  19 ++-
 block/commit.c                                     |   1 -
 block/mirror.c                                     |  15 +--
 block/monitor/block-hmp-cmds.c                     |   2 +-
 block/vvfat.c                                      |  37 ++++--
 blockdev.c                                         |  24 +---
 hw/block/block.c                                   |   3 +-
 qemu-img.c                                         |  23 +++-
 softmmu/vl.c                                       |   8 +-
 storage-daemon/qemu-storage-daemon.c               |  13 ++
 tests/qtest/device-plug-test.c                     |  19 +++
 scripts/render_block_graph.py                      |   1 -
 tests/qemu-iotests/testrunner.py                   |  21 ++--
 tests/qemu-iotests/122                             |   1 +
 tests/qemu-iotests/122.out                         |   2 +
 tests/qemu-iotests/273.out                         |   4 -
 tests/qemu-iotests/308                             |  25 +++-
 tests/qemu-iotests/308.out                         |   2 +-
 tests/qemu-iotests/tests/stream-error-on-reset     | 140 +++++++++++++++++++++
 tests/qemu-iotests/tests/stream-error-on-reset.out |   5 +
 28 files changed, 307 insertions(+), 104 deletions(-)
 create mode 100755 tests/qemu-iotests/tests/stream-error-on-reset
 create mode 100644 tests/qemu-iotests/tests/stream-error-on-reset.out


