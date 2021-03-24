Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D11203473E2
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 09:45:47 +0100 (CET)
Received: from localhost ([::1]:42480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOz98-00019G-To
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 04:45:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tao3.xu@intel.com>)
 id 1lOz75-000062-TU; Wed, 24 Mar 2021 04:43:40 -0400
Received: from mga03.intel.com ([134.134.136.65]:25459)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tao3.xu@intel.com>)
 id 1lOz71-0004xY-MI; Wed, 24 Mar 2021 04:43:39 -0400
IronPort-SDR: P108RB4d3FSMDFyPlMthn11JZTDP1Zi7CKPV+4LZm5aRA6LRzbN+Fox4/htzA5Je3YGg4rzaZy
 3/uWgahmsvAA==
X-IronPort-AV: E=McAfee;i="6000,8403,9932"; a="190689745"
X-IronPort-AV: E=Sophos;i="5.81,274,1610438400"; d="scan'208";a="190689745"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2021 01:43:25 -0700
IronPort-SDR: AMfOKz+9ZryhTR8YNqltVyDHm+wHjHcLjJpJN9LIRpT12Ux2y2QyrmsT4O7UhI3ireB2zlVDmu
 hbw0PRzXKtlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,274,1610438400"; d="scan'208";a="391220958"
Received: from tao-optiplex-7060.sh.intel.com ([10.239.159.28])
 by orsmga002.jf.intel.com with ESMTP; 24 Mar 2021 01:43:24 -0700
From: Tao Xu <tao3.xu@intel.com>
To: kwolf@redhat.com,
	mreitz@redhat.com
Subject: [PATCH] iotests: Fix typo in iotest 051
Date: Wed, 24 Mar 2021 16:43:21 +0800
Message-Id: <20210324084321.90952-1-tao3.xu@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.65; envelope-from=tao3.xu@intel.com;
 helo=mga03.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: Tao Xu <tao3.xu@intel.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is an typo in iotest 051, correct it.

Signed-off-by: Tao Xu <tao3.xu@intel.com>
---
 tests/qemu-iotests/051        | 2 +-
 tests/qemu-iotests/051.pc.out | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/qemu-iotests/051 b/tests/qemu-iotests/051
index f92161d8ef..1595babe82 100755
--- a/tests/qemu-iotests/051
+++ b/tests/qemu-iotests/051
@@ -209,7 +209,7 @@ case "$QEMU_DEFAULT_MACHINE" in
         # virtio-blk enables the iothread only when the driver initialises the
         # device, so a second virtio-blk device can't be added even with the
         # same iothread. virtio-scsi allows this.
-        run_qemu $iothread -device virtio-blk-pci,drive=disk,iohtread=iothread0,share-rw=on
+        run_qemu $iothread -device virtio-blk-pci,drive=disk,iothread=iothread0,share-rw=on
         run_qemu $iothread -device virtio-scsi,id=virtio-scsi1,iothread=thread0 -device scsi-hd,bus=virtio-scsi1.0,drive=disk,share-rw=on
         ;;
      *)
diff --git a/tests/qemu-iotests/051.pc.out b/tests/qemu-iotests/051.pc.out
index a28e3fc124..a43086bb41 100644
--- a/tests/qemu-iotests/051.pc.out
+++ b/tests/qemu-iotests/051.pc.out
@@ -183,9 +183,9 @@ Testing: -drive file=TEST_DIR/t.qcow2,if=none,node-name=disk -object iothread,id
 QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) QEMU_PROG: -device scsi-hd,bus=virtio-scsi1.0,drive=disk,share-rw=on: Cannot change iothread of active block backend
 
-Testing: -drive file=TEST_DIR/t.qcow2,if=none,node-name=disk -object iothread,id=thread0 -device virtio-scsi,iothread=thread0,id=virtio-scsi0 -device scsi-hd,bus=virtio-scsi0.0,drive=disk,share-rw=on -device virtio-blk-pci,drive=disk,iohtread=iothread0,share-rw=on
+Testing: -drive file=TEST_DIR/t.qcow2,if=none,node-name=disk -object iothread,id=thread0 -device virtio-scsi,iothread=thread0,id=virtio-scsi0 -device scsi-hd,bus=virtio-scsi0.0,drive=disk,share-rw=on -device virtio-blk-pci,drive=disk,iothread=iothread0,share-rw=on
 QEMU X.Y.Z monitor - type 'help' for more information
-(qemu) QEMU_PROG: -device virtio-blk-pci,drive=disk,iohtread=iothread0,share-rw=on: Cannot change iothread of active block backend
+(qemu) QEMU_PROG: -device virtio-blk-pci,drive=disk,iothread=iothread0,share-rw=on: Cannot change iothread of active block backend
 
 Testing: -drive file=TEST_DIR/t.qcow2,if=none,node-name=disk -object iothread,id=thread0 -device virtio-scsi,iothread=thread0,id=virtio-scsi0 -device scsi-hd,bus=virtio-scsi0.0,drive=disk,share-rw=on -device virtio-scsi,id=virtio-scsi1,iothread=thread0 -device scsi-hd,bus=virtio-scsi1.0,drive=disk,share-rw=on
 QEMU X.Y.Z monitor - type 'help' for more information
-- 
2.25.1


