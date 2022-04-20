Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB53550930B
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 00:41:11 +0200 (CEST)
Received: from localhost ([::1]:59242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhJ0Y-0002lT-Q1
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 18:41:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nhIeL-0001MJ-4u; Wed, 20 Apr 2022 18:18:13 -0400
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230]:33782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nhIeJ-0006Dv-Ap; Wed, 20 Apr 2022 18:18:12 -0400
Received: by mail-oi1-x230.google.com with SMTP id s16so3727026oie.0;
 Wed, 20 Apr 2022 15:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dTba2BlKCOgh8usQ8iRDKa8NiBlJLsM6RdAgi+hZnU0=;
 b=TN7nFy3qlwOt/XBz0MIxlr1c3sDxETFeCGEV2bKXY2XZCtmVx8tJfJ4YbY5UsBTfEh
 KkfUtJobdUrpMWa7ugQ7u17M9JKi6FoG5H433qm7vRQEQkpE17q4VBaaDOVispqa9837
 428gIj4IU9dQa8tSfutrm/WDFCEc3A0h8HqzwCwoXRNLfSYdCjaRcYfwE+MGzY+Vluhf
 9KeygMruC1WiMv+MBA6baGTBzd0KKYAQk/jEckxrovnvHahsT4Y35EuUTRQ9+Fpdx+Z5
 7X2QFAs6VdDJYGKxcVqBSjCuYWNk1K+DEp7KuIK1HYa+rv4unu+0ze1dtaePoc537EQt
 08hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dTba2BlKCOgh8usQ8iRDKa8NiBlJLsM6RdAgi+hZnU0=;
 b=wMer3cf3pHLJzF01HmvjrgwJmyoX0RRKi86cHpDFFW+Fx7CVWKkzzn2oQxQICSDxyu
 tuu0YFQTqXLE40b8w7Lf+S4LZE71Z6R4kF0Gz8BaxS+czYneop2AE7pZCq9/QR/pSZGp
 JtgljZcjZpI8Onu+2QNwRqAA5n/4jIiWSBeOS8rZh9J0RK5Hb+OnIkRSRfNWabFNk8Og
 XbV+QDKIpVbYujAYoK9oO9jLox6pRdjmwopb1WEnsNndCqPFLjgm4Srq8HPrjSsBHqTO
 JZz/ZjKZRFuN909zRwJgcSvGTQpbnuzy/TJPatMA1osm/zKXDVflVZherbH/tMcp2K7J
 b9RA==
X-Gm-Message-State: AOAM531HIiXZ0AjfLq0XubZolhU6B+6DFnDN/7yZiGygFz4CuCpWyRGL
 eSGMOXR4iYHi813vVfBrOnhJvqG8xv4=
X-Google-Smtp-Source: ABdhPJxxgfsGlwz8kdomFAV9zk7k4/BmhkLpX0h8iMrk+cC1BjHs94QrMYmEgkBtqtDGwVAKi+DeZw==
X-Received: by 2002:aca:2b0d:0:b0:322:b685:f583 with SMTP id
 i13-20020aca2b0d000000b00322b685f583mr2743680oik.57.1650493089656; 
 Wed, 20 Apr 2022 15:18:09 -0700 (PDT)
Received: from rekt.ibmuc.com ([2804:431:c7c7:486c:c4fd:c4aa:a799:60c2])
 by smtp.gmail.com with ESMTPSA id
 14-20020aca110e000000b00322847e6f53sm3876082oir.46.2022.04.20.15.18.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 15:18:09 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 23/23] hw/ppc: change indentation to spaces from TABs
Date: Wed, 20 Apr 2022 19:13:29 -0300
Message-Id: <20220420221329.169755-24-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220420221329.169755-1-danielhb413@gmail.com>
References: <20220420221329.169755-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x230.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 danielhb413@gmail.com, qemu-ppc@nongnu.org, Guo Zhi <qtxuning1999@sjtu.edu.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Guo Zhi <qtxuning1999@sjtu.edu.cn>

There are still some files in the QEMU PPC code base that use TABs for
indentation instead of using  spaces. The TABs should be replaced so
that we have a consistent coding style.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/374
Signed-off-by: Guo Zhi <qtxuning1999@sjtu.edu.cn>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20220412021240.2080218-1-qtxuning1999@sjtu.edu.cn>
[danielhb: trimmed commit msg to 72 chars per line]
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/ppc440_bamboo.c |  6 +++---
 hw/ppc/spapr_rtas.c    | 18 +++++++++---------
 include/hw/ppc/ppc.h   | 10 +++++-----
 3 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/hw/ppc/ppc440_bamboo.c b/hw/ppc/ppc440_bamboo.c
index efa90ef5ba..d5973f2484 100644
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


