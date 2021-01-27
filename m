Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF28306492
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 20:59:30 +0100 (CET)
Received: from localhost ([::1]:58038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4qyP-0004UR-6z
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 14:59:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l4qx4-0002ul-Sl
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 14:58:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l4qx3-0007Yp-4k
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 14:58:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611777484;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=9O8sO5v0ah1R70Ua/pHntHT0+b/7r/6gGprjAP4DxEI=;
 b=BiGu9koWPuXwgSLJt+p+h3Wueskg/5ZJCbRXo/qsxFCBAz/hVN2JzH4gngV/Xi2hpJsvhb
 sJGe+rIBhxJ0mW5cNoi9o5lROiWDJhQ3RS/4Z5WMgLwh5mNLQRSkOApgDE400aOEvZmOcd
 yZfpIzOjXoleftyZaxJThKbC5pT8ZL8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-114-kQxcSYDfNAm16BkgQHinsA-1; Wed, 27 Jan 2021 14:58:01 -0500
X-MC-Unique: kQxcSYDfNAm16BkgQHinsA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 30E9C802B45;
 Wed, 27 Jan 2021 19:58:00 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-94.ams2.redhat.com [10.36.115.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3559E10016FB;
 Wed, 27 Jan 2021 19:57:59 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 0/8] Block layer patches
Date: Wed, 27 Jan 2021 20:57:45 +0100
Message-Id: <20210127195753.59773-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.308,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit bf159f0bdc7b8e7aa8342dedb3829ca744c1b612:

  Merge remote-tracking branch 'remotes/edgar/tags/edgar/xilinx-next-2021-01-27.for-upstream' into staging (2021-01-27 17:40:25 +0000)

are available in the Git repository at:

  git://repo.or.cz/qemu/kevin.git tags/for-upstream

for you to fetch changes up to a44be0334beae3a9affb4a3a92cc6852993d7a84:

  iotests: rename and move 169 and 199 tests (2021-01-27 20:53:14 +0100)

----------------------------------------------------------------
Block layer patches:

- Fix crash on write to read-only devices
- iotests: Rewrite 'check' in Python, get rid of 'groups' and allow
  non-numeric test case names

----------------------------------------------------------------
Kevin Wolf (2):
      block: Separate blk_is_writable() and blk_supports_write_perm()
      virtio-scsi-test: Test writing to scsi-cd device

Vladimir Sementsov-Ogievskiy (6):
      iotests: 146: drop extra whitespaces from .out file
      iotests: add findtests.py
      iotests: add testenv.py
      iotests: add testrunner.py
      iotests: rewrite check into python
      iotests: rename and move 169 and 199 tests

 docs/devel/testing.rst                             |   50 +-
 include/sysemu/block-backend.h                     |    3 +-
 block/block-backend.c                              |   19 +-
 hw/block/dataplane/xen-block.c                     |    2 +-
 hw/block/fdc.c                                     |    9 +-
 hw/block/m25p80.c                                  |    6 +-
 hw/block/nand.c                                    |    2 +-
 hw/block/nvme-ns.c                                 |    7 +-
 hw/block/onenand.c                                 |    2 +-
 hw/block/pflash_cfi01.c                            |    2 +-
 hw/block/pflash_cfi02.c                            |    2 +-
 hw/block/swim.c                                    |    6 +-
 hw/block/virtio-blk.c                              |    6 +-
 hw/block/xen-block.c                               |    2 +-
 hw/ide/core.c                                      |    2 +-
 hw/misc/sifive_u_otp.c                             |    2 +-
 hw/ppc/pnv_pnor.c                                  |    2 +-
 hw/scsi/scsi-disk.c                                |   10 +-
 hw/scsi/scsi-generic.c                             |    4 +-
 hw/sd/sd.c                                         |    6 +-
 hw/usb/dev-storage.c                               |    4 +-
 tests/qtest/virtio-scsi-test.c                     |   39 +
 tests/qemu-iotests/findtests.py                    |  159 +++
 tests/qemu-iotests/iotests.py                      |    8 +
 tests/qemu-iotests/testenv.py                      |  281 +++++
 tests/qemu-iotests/testrunner.py                   |  367 +++++++
 Makefile                                           |    1 -
 tests/check-block.sh                               |    3 +-
 tests/qemu-iotests/146.out                         |  780 +++++++-------
 tests/qemu-iotests/check                           | 1095 +++-----------------
 tests/qemu-iotests/common.env.in                   |    3 -
 tests/qemu-iotests/group                           |  323 ------
 tests/qemu-iotests/meson.build                     |    3 -
 .../{199 => tests/migrate-bitmaps-postcopy-test}   |    0
 .../migrate-bitmaps-postcopy-test.out}             |    0
 .../{169 => tests/migrate-bitmaps-test}            |    0
 .../{169.out => tests/migrate-bitmaps-test.out}    |    0
 37 files changed, 1481 insertions(+), 1729 deletions(-)
 create mode 100644 tests/qemu-iotests/findtests.py
 create mode 100644 tests/qemu-iotests/testenv.py
 create mode 100644 tests/qemu-iotests/testrunner.py
 delete mode 100644 tests/qemu-iotests/common.env.in
 delete mode 100644 tests/qemu-iotests/group
 rename tests/qemu-iotests/{199 => tests/migrate-bitmaps-postcopy-test} (100%)
 rename tests/qemu-iotests/{199.out => tests/migrate-bitmaps-postcopy-test.out} (100%)
 rename tests/qemu-iotests/{169 => tests/migrate-bitmaps-test} (100%)
 rename tests/qemu-iotests/{169.out => tests/migrate-bitmaps-test.out} (100%)


