Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D597B4FCC6E
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 04:25:03 +0200 (CEST)
Received: from localhost ([::1]:46608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ne6DG-0006kd-Ck
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 22:25:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qtxuning1999@sjtu.edu.cn>)
 id 1ne62A-0006YY-50; Mon, 11 Apr 2022 22:13:34 -0400
Received: from smtp180.sjtu.edu.cn ([202.120.2.180]:42410)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qtxuning1999@sjtu.edu.cn>)
 id 1ne626-0002R4-5l; Mon, 11 Apr 2022 22:13:33 -0400
Received: from proxy02.sjtu.edu.cn (smtp188.sjtu.edu.cn [202.120.2.188])
 by smtp180.sjtu.edu.cn (Postfix) with ESMTPS id D25E91008CBC5;
 Tue, 12 Apr 2022 10:13:20 +0800 (CST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by proxy02.sjtu.edu.cn (Postfix) with ESMTP id BD1E0200B8926;
 Tue, 12 Apr 2022 10:13:20 +0800 (CST)
X-Virus-Scanned: amavisd-new at 
Received: from proxy02.sjtu.edu.cn ([127.0.0.1])
 by localhost (proxy02.sjtu.edu.cn [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id Gj21nH4otGXw; Tue, 12 Apr 2022 10:13:20 +0800 (CST)
Received: from guozhi-ipads.ipads-lab.se.sjtu.edu.cn (unknown [202.120.40.82])
 (Authenticated sender: qtxuning1999@sjtu.edu.cn)
 by proxy02.sjtu.edu.cn (Postfix) with ESMTPSA id 0AEF8200A5E94;
 Tue, 12 Apr 2022 10:13:13 +0800 (CST)
From: Guo Zhi <qtxuning1999@sjtu.edu.cn>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
Subject: [PATCH v2] hw/ppc: change indentation to spaces from TABs
Date: Tue, 12 Apr 2022 10:12:41 +0800
Message-Id: <20220412021240.2080218-1-qtxuning1999@sjtu.edu.cn>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <897919466.10558377.1649695044864.JavaMail.zimbra@sjtu.edu.cn>
References: <897919466.10558377.1649695044864.JavaMail.zimbra@sjtu.edu.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=202.120.2.180;
 envelope-from=qtxuning1999@sjtu.edu.cn; helo=smtp180.sjtu.edu.cn
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_SORBS_WEB=1.5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, Guo Zhi <qtxuning1999@sjtu.edu.cn>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/374

There are still some files in the QEMU PPC code base that use TABs for indentation instead of using  spaces. The TABs should be replaced so that we have a consistent coding style.

Signed-off-by: Guo Zhi <qtxuning1999@sjtu.edu.cn>
---
 hw/ppc/ppc440_bamboo.c |  6 +++---
 hw/ppc/spapr_rtas.c    | 18 +++++++++---------
 include/hw/ppc/ppc.h   | 10 +++++-----
 3 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/hw/ppc/ppc440_bamboo.c b/hw/ppc/ppc440_bamboo.c
index 7fb620b9a0..5ec3a9a17f 100644
--- a/hw/ppc/ppc440_bamboo.c
+++ b/hw/ppc/ppc440_bamboo.c
@@ -3,9 +3,9 @@
  *
  * Copyright 2007 IBM Corporation.
  * Authors:
- *	Jerone Young <jyoung5@us.ibm.com>
- *	Christian Ehrhardt <ehrhardt@linux.vnet.ibm.com>
- *	Hollis Blanchard <hollisb@us.ibm.com>
+ *  Jerone Young <jyoung5@us.ibm.com>
+ *  Christian Ehrhardt <ehrhardt@linux.vnet.ibm.com>
+ *  Hollis Blanchard <hollisb@us.ibm.com>
  *
  * This work is licensed under the GNU GPL license version 2 or later.
  *
diff --git a/hw/ppc/spapr_rtas.c b/hw/ppc/spapr_rtas.c
index d7c04237fe..d58b65e88f 100644
--- a/hw/ppc/spapr_rtas.c
+++ b/hw/ppc/spapr_rtas.c
@@ -474,16 +474,16 @@ static void rtas_ibm_nmi_interlock(PowerPCCPU *cpu,
 
     if (spapr->fwnmi_machine_check_interlock != cpu->vcpu_id) {
         /*
-	 * The vCPU that hit the NMI should invoke "ibm,nmi-interlock"
+         * The vCPU that hit the NMI should invoke "ibm,nmi-interlock"
          * This should be PARAM_ERROR, but Linux calls "ibm,nmi-interlock"
-	 * for system reset interrupts, despite them not being interlocked.
-	 * PowerVM silently ignores this and returns success here. Returning
-	 * failure causes Linux to print the error "FWNMI: nmi-interlock
-	 * failed: -3", although no other apparent ill effects, this is a
-	 * regression for the user when enabling FWNMI. So for now, match
-	 * PowerVM. When most Linux clients are fixed, this could be
-	 * changed.
-	 */
+         * for system reset interrupts, despite them not being interlocked.
+         * PowerVM silently ignores this and returns success here. Returning
+         * failure causes Linux to print the error "FWNMI: nmi-interlock
+         * failed: -3", although no other apparent ill effects, this is a
+         * regression for the user when enabling FWNMI. So for now, match
+         * PowerVM. When most Linux clients are fixed, this could be
+         * changed.
+         */
         rtas_st(rets, 0, RTAS_OUT_SUCCESS);
         return;
     }
diff --git a/include/hw/ppc/ppc.h b/include/hw/ppc/ppc.h
index 364f165b4b..02af03ada2 100644
--- a/include/hw/ppc/ppc.h
+++ b/include/hw/ppc/ppc.h
@@ -99,11 +99,11 @@ enum {
     ARCH_MAC99_U3,
 };
 
-#define FW_CFG_PPC_WIDTH	(FW_CFG_ARCH_LOCAL + 0x00)
-#define FW_CFG_PPC_HEIGHT	(FW_CFG_ARCH_LOCAL + 0x01)
-#define FW_CFG_PPC_DEPTH	(FW_CFG_ARCH_LOCAL + 0x02)
-#define FW_CFG_PPC_TBFREQ	(FW_CFG_ARCH_LOCAL + 0x03)
-#define FW_CFG_PPC_CLOCKFREQ	(FW_CFG_ARCH_LOCAL + 0x04)
+#define FW_CFG_PPC_WIDTH        (FW_CFG_ARCH_LOCAL + 0x00)
+#define FW_CFG_PPC_HEIGHT       (FW_CFG_ARCH_LOCAL + 0x01)
+#define FW_CFG_PPC_DEPTH        (FW_CFG_ARCH_LOCAL + 0x02)
+#define FW_CFG_PPC_TBFREQ       (FW_CFG_ARCH_LOCAL + 0x03)
+#define FW_CFG_PPC_CLOCKFREQ    (FW_CFG_ARCH_LOCAL + 0x04)
 #define FW_CFG_PPC_IS_KVM       (FW_CFG_ARCH_LOCAL + 0x05)
 #define FW_CFG_PPC_KVM_HC       (FW_CFG_ARCH_LOCAL + 0x06)
 #define FW_CFG_PPC_KVM_PID      (FW_CFG_ARCH_LOCAL + 0x07)
-- 
2.35.1


