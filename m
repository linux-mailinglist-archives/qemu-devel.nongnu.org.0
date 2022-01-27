Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C362A49DFB8
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 11:47:48 +0100 (CET)
Received: from localhost ([::1]:33878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD2Jf-0007IQ-Eo
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 05:47:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1nD2G7-0004U7-FV; Thu, 27 Jan 2022 05:44:07 -0500
Received: from mga03.intel.com ([134.134.136.65]:40194)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1nD2Fy-0001ul-LS; Thu, 27 Jan 2022 05:44:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643280238; x=1674816238;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8vZ2wLiF0D8fcxIiyM1b/e46mihNk1dtqR3LRzL3/hU=;
 b=GcuKUZpanyFD7ofvWYx+Xbrth/l1IO2q1UA27y+8PTA0Lrrka/OPke9e
 QXXVhCgpGfUmvUHkBdpRBdfsiG1I8lGOZb9K1Ok9D8msycB79Fb77UyO2
 UCDuvM5ozwzvhO3iy2NcXcxxi94fjAHerN4OWTBiPprqqK5BrGoXTRT2p
 oYO8pqc0tmmi2EDWcHd6uk8KqeiNcGzULNz+lIHWYmCfK4NKWrRvSyrC6
 W8uG2EZB0hPn1Nii35UsKg9mRF+gYXsH9ztN5O25Qn8VMHRBYt1pOzhHw
 B92kOcgddwEnSg8Tc4r8t+AQMVqnicjnZzy2aeyQ5rgqyaloCyNYUcw5t w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10239"; a="246760118"
X-IronPort-AV: E=Sophos;i="5.88,320,1635231600"; d="scan'208";a="246760118"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2022 02:43:53 -0800
X-IronPort-AV: E=Sophos;i="5.88,320,1635231600"; d="scan'208";a="480244969"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2022 02:43:51 -0800
From: Zhang Chen <chen.zhang@intel.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-dev <qemu-devel@nongnu.org>,
 qemu-trivial@nongnu.org
Subject: [PATCH] docs/devel/migration.rst: Updates content from code and fixes
 minor issues
Date: Thu, 27 Jan 2022 18:32:44 +0800
Message-Id: <20220127103244.3277760-1-chen.zhang@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.65; envelope-from=chen.zhang@intel.com;
 helo=mga03.intel.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.159,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: Zhang Chen <chen.zhang@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Zhang Chen <chen.zhang@intel.com>
---
 docs/devel/migration.rst | 36 +++++++++++++++++++++++-------------
 1 file changed, 23 insertions(+), 13 deletions(-)

diff --git a/docs/devel/migration.rst b/docs/devel/migration.rst
index 2401253482..9f190d439a 100644
--- a/docs/devel/migration.rst
+++ b/docs/devel/migration.rst
@@ -156,12 +156,20 @@ An example (from hw/input/pckbd.c)
       .name = "pckbd",
       .version_id = 3,
       .minimum_version_id = 3,
+      .pre_load = kbd_pre_load,
+      .post_load = kbd_post_load,
+      .pre_save = kbd_pre_save,
       .fields = (VMStateField[]) {
           VMSTATE_UINT8(write_cmd, KBDState),
           VMSTATE_UINT8(status, KBDState),
           VMSTATE_UINT8(mode, KBDState),
-          VMSTATE_UINT8(pending, KBDState),
+          VMSTATE_UINT8(pending_tmp, KBDState),
           VMSTATE_END_OF_LIST()
+      },
+      .subsections = (const VMStateDescription*[]) {
+          &vmstate_kbd_outport,
+          &vmstate_kbd_extended_state,
+          NULL
       }
   };
 
@@ -278,7 +286,7 @@ Example:
       IDEState *s = opaque;
 
       return ((s->status & DRQ_STAT) != 0)
-          || (s->bus->error_status & BM_STATUS_PIO_RETRY);
+          || (s->bus->error_status & IDE_RETRY_PIO);
   }
 
   const VMStateDescription vmstate_ide_drive_pio_state = {
@@ -312,6 +320,8 @@ Example:
       },
       .subsections = (const VMStateDescription*[]) {
           &vmstate_ide_drive_pio_state,
+          &vmstate_ide_tray_state,
+          &vmstate_ide_atapi_gesn_state,
           NULL
       }
   };
@@ -481,11 +491,11 @@ versions exist for high bandwidth IO.
 
 An iterative device must provide:
 
-  - A ``save_setup`` function that initialises the data structures and
-    transmits a first section containing information on the device.  In the
-    case of RAM this transmits a list of RAMBlocks and sizes.
+  - A ``save_setup`` function that initialize the data structures and
+    transmits a first section containing information on the device. In the
+    case of RAM used to transmit a list of RAMBlocks and sizes.
 
-  - A ``load_setup`` function that initialises the data structures on the
+  - A ``load_setup`` function that initialize the data structures on the
     destination.
 
   - A ``save_live_pending`` function that is called repeatedly and must
@@ -756,13 +766,13 @@ ADVISE->DISCARD->LISTEN->RUNNING->END
     (the 'listen thread') which takes over the job of receiving
     pages off the migration stream, while the main thread carries
     on processing the blob.  With this thread able to process page
-    reception, the destination now 'sensitises' the RAM to detect
+    reception, the destination now 'sensitive' the RAM to detect
     any access to missing pages (on Linux using the 'userfault'
     system).
 
  - Running
 
-    POSTCOPY_RUN causes the destination to synchronise all
+    POSTCOPY_RUN causes the destination to synchronize all
     state and start the CPUs and IO devices running.  The main
     thread now finishes processing the migration package and
     now carries on as it would for normal precopy migration
@@ -771,8 +781,8 @@ ADVISE->DISCARD->LISTEN->RUNNING->END
 
  - End
 
-    The listen thread can now quit, and perform the cleanup of migration
-    state, the migration is now complete.
+    The listen thread already exited, and perform the cleanup of migration
+    state, the migration has been completed.
 
 Source side page maps
 ---------------------
@@ -861,9 +871,9 @@ Firmware
 ========
 
 Migration migrates the copies of RAM and ROM, and thus when running
-on the destination it includes the firmware from the source. Even after
-resetting a VM, the old firmware is used.  Only once QEMU has been restarted
-is the new firmware in use.
+on the destination it includes the firmware from the source. The old
+firmware of the VM is still used even rebooted. And the new firmware
+will not be loaded until QEMU is restarted.
 
 - Changes in firmware size can cause changes in the required RAMBlock size
   to hold the firmware and thus migration can fail.  In practice it's best
-- 
2.25.1


