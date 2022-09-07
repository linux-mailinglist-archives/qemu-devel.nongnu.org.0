Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7BB05AFF6E
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 10:44:11 +0200 (CEST)
Received: from localhost ([::1]:56738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVqfK-0008At-O8
	for lists+qemu-devel@lfdr.de; Wed, 07 Sep 2022 04:44:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=242877ce7=alistair.francis@wdc.com>)
 id 1oVq3H-0003gv-7V
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 04:04:54 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:1896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=242877ce7=alistair.francis@wdc.com>)
 id 1oVq3B-0004Ol-L8
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 04:04:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1662537885; x=1694073885;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EP7BQnxOBuC2Ss98grf4uwf0avpHUPg28Gx9TYS+aPo=;
 b=n/3yIFe12m2Kq3pYN7onM6fuCsYSznzNH4UxAQOuI6WWflyQnZ97JgBO
 HNq4Y39ES12J/H5/uDdykjUUkNt+r/wXA1yxPzdVc3/HhZhEHbaX2ZoyL
 UcuW5tSYSKzBCZZCsjl0/zbRbquYkfrvE1MnveVRO7CtbT2MITFcSfmGf
 PP4F7ShFjfmxv2MsWRJQe+QgR1GTH9ugXuT7ksnD8FuNv3AMoyfUpkcHH
 BjdiH9IcF8lNCK8WTMOCYJMrZZJ4CSDqtO0SeVefzzEgo4iNoHrWJt3AE
 p9R1JUQgvY9CJfj5EPyh5UJfEPHa9O1oZiApzBxM5QUfG8i2hznUrp51l Q==;
X-IronPort-AV: E=Sophos;i="5.93,296,1654531200"; d="scan'208";a="210714977"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 07 Sep 2022 16:04:33 +0800
IronPort-SDR: OgjtpvuqtSDi//1YRORNuRVVMextOwglmXH5j3frwjbzjv8MS93gAnHuSfnoX8rIVwGw+fvYFi
 ejSSXhbd1zWXWSScqoK2iiUH04dz6SrLQUiYJv9bcKW9s+SCQkqUbixdSrIvUaQylsnPytbeWG
 SWOuyEl8bRrPiUEkwJ0dm+bd3rwE7WI9eS0vZryLaaVhx9lFIsv4r8JnjfV5LBLCbrEyeB4qXe
 7Rb30poouE+X6PIqY15gGks14yi5sFodiDco0RWVNxs187ahRJcmOyHMNUaOnqXE2EfljBkzBM
 KpmV0KFVGwvQEmEDMXGWtbbG
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 07 Sep 2022 00:19:30 -0700
IronPort-SDR: S1IP+fFgxnMlY0TrJYepAczjG11fqPOwm00qSjAQXahmjG3PA/35PAV33hzyaZ1OmpezmdXM59
 EU7bU8gql62SOd7IknHln1vvLNqtq80dUWlvjPbRxlUfNFqjKF3pJ55bE4TVxttg17mbFVeA5t
 WiNwqCfsDay+UtFAEApw4Gz4rvwWmMhRQE2oagUQodtPMvRM68r8XVxg/a8NlQC9pjpUMdh+Bk
 WG1GZcfhXDeRWlE12X0Y0leUcSFwap896vgUzSC2lNPfiHfKaA90WdHzn/PcnXYvpMrdRevmn+
 QrY=
WDCIronportException: Internal
Received: from unknown (HELO toolbox.wdc.com) ([10.225.167.94])
 by uls-op-cesaip01.wdc.com with ESMTP; 07 Sep 2022 01:04:32 -0700
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, Weiwei Li <liweiwei@iscas.ac.cn>,
 Junqiang Wang <wangjunqiang@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Andrew Jones <ajones@ventanamicro.com>
Subject: [PULL 11/44] target/riscv: Simplify the check in hmode to reuse the
 check in riscv_csrrw_check
Date: Wed,  7 Sep 2022 10:03:20 +0200
Message-Id: <20220907080353.111926-12-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220907080353.111926-1-alistair.francis@wdc.com>
References: <20220907080353.111926-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=242877ce7=alistair.francis@wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Alistair Francis <alistair.francis@wdc.com>
From:  Alistair Francis via <qemu-devel@nongnu.org>

From: Weiwei Li <liweiwei@iscas.ac.cn>

Just add 1 to the effective privledge level when in HS mode, then reuse
the check of 'effective_priv < csr_priv' in riscv_csrrw_check to replace
the privilege level related check in hmode. Then, hmode will only check
whether H extension is supported.

When accessing Hypervior CSRs:
   1) If accessing from M privilege level, the check of
'effective_priv< csr_priv' passes, returns hmode(...) which will return
RISCV_EXCP_ILLEGAL_INST when H extension is not supported and return
RISCV_EXCP_NONE otherwise.
   2) If accessing from HS privilege level, effective_priv will add 1,
the check passes and also returns hmode(...) too.
   3) If accessing from VS/VU privilege level, the check fails, and
returns RISCV_EXCP_VIRT_INSTRUCTION_FAULT
   4) If accessing from U privilege level, the check fails, and returns
RISCV_EXCP_ILLEGAL_INST

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Message-Id: <20220718130955.11899-7-liweiwei@iscas.ac.cn>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/csr.c | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index cf15aa67b7..0fb042b2fd 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -312,13 +312,7 @@ static int aia_smode32(CPURISCVState *env, int csrno)
 static RISCVException hmode(CPURISCVState *env, int csrno)
 {
     if (riscv_has_ext(env, RVH)) {
-        /* Hypervisor extension is supported */
-        if ((env->priv == PRV_S && !riscv_cpu_virt_enabled(env)) ||
-            env->priv == PRV_M) {
-            return RISCV_EXCP_NONE;
-        } else {
-            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
-        }
+        return RISCV_EXCP_NONE;
     }
 
     return RISCV_EXCP_ILLEGAL_INST;
@@ -3279,13 +3273,11 @@ static inline RISCVException riscv_csrrw_check(CPURISCVState *env,
 #if !defined(CONFIG_USER_ONLY)
     int csr_priv, effective_priv = env->priv;
 
-    if (riscv_has_ext(env, RVH) && env->priv == PRV_S) {
+    if (riscv_has_ext(env, RVH) && env->priv == PRV_S &&
+        !riscv_cpu_virt_enabled(env)) {
         /*
-         * We are in either HS or VS mode.
-         * Add 1 to the effective privledge level to allow us to access the
-         * Hypervisor CSRs. The `hmode` predicate will determine if access
-         * should be allowed(HS) or if a virtual instruction exception should be
-         * raised(VS).
+         * We are in HS mode. Add 1 to the effective privledge level to
+         * allow us to access the Hypervisor CSRs.
          */
         effective_priv++;
     }
-- 
2.37.2


