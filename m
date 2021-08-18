Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9A43F06A1
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 16:26:03 +0200 (CEST)
Received: from localhost ([::1]:54090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGMW2-000869-5K
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 10:26:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1mGMKK-0003aO-Cm; Wed, 18 Aug 2021 10:13:56 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:49073)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1mGMKI-0006Bx-Un; Wed, 18 Aug 2021 10:13:56 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 3C07D4055A;
 Wed, 18 Aug 2021 17:13:53 +0300 (MSK)
Received: from tls.msk.ru (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with SMTP id 1B4E7E9;
 Wed, 18 Aug 2021 17:13:53 +0300 (MSK)
Received: (nullmailer pid 417766 invoked by uid 1000);
 Wed, 18 Aug 2021 14:13:53 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Subject: [PATCH, trivial, for-6.1] target/i386: spelling: occured=>occurred
Date: Wed, 18 Aug 2021 17:13:52 +0300
Message-Id: <20210818141352.417716-1-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 accel/kvm/kvm-all.c      | 2 +-
 target/i386/cpu-sysemu.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 0125c17edb..cace5ffe64 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -2469,7 +2469,7 @@ static int kvm_init(MachineState *ms)
             ret = kvm_vm_enable_cap(s, KVM_CAP_DIRTY_LOG_RING, 0, ring_bytes);
             if (ret) {
                 error_report("Enabling of KVM dirty ring failed: %s. "
-                             "Suggested mininum value is 1024.", strerror(-ret));
+                             "Suggested minimum value is 1024.", strerror(-ret));
                 goto err;
             }
 
diff --git a/target/i386/cpu-sysemu.c b/target/i386/cpu-sysemu.c
index 1078e3d157..37b7c562f5 100644
--- a/target/i386/cpu-sysemu.c
+++ b/target/i386/cpu-sysemu.c
@@ -335,7 +335,7 @@ void x86_cpu_get_crash_info_qom(Object *obj, Visitor *v,
     GuestPanicInformation *panic_info;
 
     if (!cs->crash_occurred) {
-        error_setg(errp, "No crash occured");
+        error_setg(errp, "No crash occurred");
         return;
     }
 
-- 
2.30.2


