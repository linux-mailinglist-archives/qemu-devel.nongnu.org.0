Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C816480702
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Dec 2021 08:37:36 +0100 (CET)
Received: from localhost ([::1]:34388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2738-0000VH-FP
	for lists+qemu-devel@lfdr.de; Tue, 28 Dec 2021 02:37:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1n271c-0008Fk-Um
 for qemu-devel@nongnu.org; Tue, 28 Dec 2021 02:36:00 -0500
Received: from mga17.intel.com ([192.55.52.151]:7586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1n271Y-0001Fe-Nf
 for qemu-devel@nongnu.org; Tue, 28 Dec 2021 02:35:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640676956; x=1672212956;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=enmf7k8YIJ9Og9xbP5RLKmYhw63Yb7k2SI9J84DpvFY=;
 b=mQWcYB6LBe+PJgbd75wLWz5AwnXQFomOku2kjB5OuUGMW3Rq8g2bw4Ew
 su78w5paUvyE6oucmSGGy0ey5zgwLi7VnK8qgJdFsgMSo4UEGqEB82iJy
 lmEjFJgZoWxo06DNp7jBUjhEGxiyC4QkhQ+Itvw+Ld9wgp8vb4e3asMxT
 PDwEY+biFDUwbLNaVXGH9vhFLVIJK8Ie3eMY0SpYouRLkPViMxA3qqk3V
 DWuqRMmC3WbknXf9OVIr1AVxfO8iK5aqQx+1T5+O5/DgtUAgNhKhKs1cx
 bf2TCFAK9ZkSt1ZKhRdseFw+H3iMLgRf6YOJtyU5apuwzXNs+ksv+8spF Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10210"; a="222000325"
X-IronPort-AV: E=Sophos;i="5.88,241,1635231600"; d="scan'208";a="222000325"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Dec 2021 23:35:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,241,1635231600"; d="scan'208";a="523546804"
Received: from unknown (HELO leirao-pc.bj.intel.com) ([10.238.156.139])
 by orsmga008.jf.intel.com with ESMTP; 27 Dec 2021 23:35:48 -0800
From: Rao Lei <lei.rao@intel.com>
To: chen.zhang@intel.com, zhanghailiang@xfusion.com, quintela@redhat.com,
 dgilbert@redhat.com
Subject: [PATCH] migration/colo.c: Add missed return in error handling
Date: Tue, 28 Dec 2021 15:35:17 +0800
Message-Id: <20211228073517.88193-1-lei.rao@intel.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.151; envelope-from=lei.rao@intel.com;
 helo=mga17.intel.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.573,
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
Cc: Rao Lei <lei.rao@intel.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When doing failover and checkpoint, some returns are missed in error
handling. Let's add it.

Signed-off-by: Lei Rao <lei.rao@intel.com>
---
 migration/colo.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/migration/colo.c b/migration/colo.c
index 5f7071b3cd..014d3cba01 100644
--- a/migration/colo.c
+++ b/migration/colo.c
@@ -94,12 +94,15 @@ static void secondary_vm_do_failover(void)
     if (local_err) {
         error_report_err(local_err);
         local_err = NULL;
+        return;
     }
 
     /* Notify all filters of all NIC to do checkpoint */
     colo_notify_filters_event(COLO_EVENT_FAILOVER, &local_err);
     if (local_err) {
         error_report_err(local_err);
+        local_err = NULL;
+        return;
     }
 
     if (!autostart) {
@@ -178,6 +181,7 @@ static void primary_vm_do_failover(void)
     if (local_err) {
         error_report_err(local_err);
         local_err = NULL;
+        return;
     }
 
     /* Notify COLO thread that failover work is finished */
@@ -507,12 +511,11 @@ static int colo_do_checkpoint_transaction(MigrationState *s,
         goto out;
     }
 
-    ret = 0;
-
     qemu_mutex_lock_iothread();
     vm_start();
     qemu_mutex_unlock_iothread();
     trace_colo_vm_state_change("stop", "run");
+    return 0;
 
 out:
     if (local_err) {
-- 
2.32.0


