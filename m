Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CFA5225614
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jul 2020 05:14:54 +0200 (CEST)
Received: from localhost ([::1]:50976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jxMGT-0001Md-2D
	for lists+qemu-devel@lfdr.de; Sun, 19 Jul 2020 23:14:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <up@anigera-ubuntu>) id 1jxMEs-0000t1-8j
 for qemu-devel@nongnu.org; Sun, 19 Jul 2020 23:13:14 -0400
Received: from 113x36x239x145.ap113.ftth.ucom.ne.jp ([113.36.239.145]:63011
 helo=anigera-ubuntu)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <up@anigera-ubuntu>) id 1jxMEq-0005LP-C8
 for qemu-devel@nongnu.org; Sun, 19 Jul 2020 23:13:14 -0400
Received: from anigera-ubuntu (localhost [127.0.0.1])
 by anigera-ubuntu (8.15.2/8.15.2/Debian-10) with ESMTP id 06HCaYQI015502;
 Fri, 17 Jul 2020 21:36:34 +0900
Received: (from up@localhost)
 by anigera-ubuntu (8.15.2/8.15.2/Submit) id 06HCaTWm015453;
 Fri, 17 Jul 2020 21:36:29 +0900
From: Kenta Ishiguro <kentaishiguro@slowstart.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/i386/kvm/ioapic.c: fix typo in error message
Date: Fri, 17 Jul 2020 21:35:14 +0900
Message-Id: <20200717123514.15406-1-kentaishiguro@slowstart.org>
X-Mailer: git-send-email 2.17.1
Received-SPF: none client-ip=113.36.239.145; envelope-from=up@anigera-ubuntu;
 helo=anigera-ubuntu
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/19 23:13:08
X-ACL-Warn: Detected OS   = Windows NT kernel [generic] [fuzzy]
X-Spam_score_int: 21
X-Spam_score: 2.1
X-Spam_bar: ++
X-Spam_report: (2.1 / 5.0 requ) BAYES_00=-1.9, FSL_HELO_NON_FQDN_1=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, HELO_NO_DOMAIN=1, KHOP_HELO_FCRDNS=1,
 RDNS_DYNAMIC=0.982, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Kenta Ishiguro <kentaishiguro@slowstart.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix a typo in an error message for KVM_SET_IRQCHIP ioctl:
"KVM_GET_IRQCHIP" should be "KVM_SET_IRQCHIP".

Signed-off-by: Kenta Ishiguro <kentaishiguro@slowstart.org>
---
 hw/i386/kvm/ioapic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i386/kvm/ioapic.c b/hw/i386/kvm/ioapic.c
index 4ba8e47251..c5528df942 100644
--- a/hw/i386/kvm/ioapic.c
+++ b/hw/i386/kvm/ioapic.c
@@ -97,7 +97,7 @@ static void kvm_ioapic_put(IOAPICCommonState *s)
 
     ret = kvm_vm_ioctl(kvm_state, KVM_SET_IRQCHIP, &chip);
     if (ret < 0) {
-        fprintf(stderr, "KVM_GET_IRQCHIP failed: %s\n", strerror(ret));
+        fprintf(stderr, "KVM_SET_IRQCHIP failed: %s\n", strerror(ret));
         abort();
     }
 }
-- 
2.17.1


