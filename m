Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EEE95AFFB9
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 10:57:29 +0200 (CEST)
Received: from localhost ([::1]:38232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVqsB-0002sn-Hh
	for lists+qemu-devel@lfdr.de; Wed, 07 Sep 2022 04:57:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=242877ce7=alistair.francis@wdc.com>)
 id 1oVq4Y-0004rY-73
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 04:06:21 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:2013)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=242877ce7=alistair.francis@wdc.com>)
 id 1oVq4W-0004pz-9u
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 04:06:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1662537966; x=1694073966;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4V6AGPzCPtYryffNb1OjDG9Bc89M+g1MRZvBD2yCnMo=;
 b=msWaMGwhSNmhwqY2QiZ/lzgvGAhoYjy0opeY2yqpsf+wgD6o9SvtEo1X
 wpmEf+Mirbr2cCsQUDVKQjm1DGwkugxFCEHfh8f4XJZhsJJlPcGQ7hJUF
 3rjfr2LWUJPEcjY0x0PDdcBMmf09miPkBmkuOcn/r6N6A9GXjEMIinI6v
 ZdVzWxDF9q5tvzAML77XGKb3n+s+bq6RfDzmSz8V+hwGB5IVETQnxbmUH
 Ab4ckI4V3N69l/vVDiXOW7rN/ex9Pl4UzLchoLMsS9KSEXy2EdZCVVyJP
 IQeNaNo1AABDRbQS+es3ktV4g+n9HFPu5v6UKJsJjcWUGuHlDFE6bZuxF A==;
X-IronPort-AV: E=Sophos;i="5.93,296,1654531200"; d="scan'208";a="210715065"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 07 Sep 2022 16:05:04 +0800
IronPort-SDR: ciWxvzErmDSOgU/hWR1xJZM9hG1UazyxYlc6Niyap+W1pMTVCnyzos/ufbRBOCggRLSP+SY/oi
 sUCW7IbF4cFR2zdEyOQd4tedranH9DLbxVIagBWvTVBoytRoF2tKrmRneSQPk1Hw1Kdlk77bSs
 N6ko9RdRQFoFgEo0MAZf2ZMhXaPaVz9epTLoqyfzWV0ZtI8Fp5H+3NHtRxImH7igIXhFfVkGhN
 XiW71sYHfcZL9CQb5OG/I881JPGpxZsPQlS36DZxPK1VMZUHx9O7Llpvbzla5nTHsVP8bNVURG
 KdByHMoVsPv/J60HNighSr5J
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 07 Sep 2022 00:20:02 -0700
IronPort-SDR: aUQ2ZWsu5kCWfUzP9c8U2ox5yDx6T9Wl2psJjiMcIyrnVk7ZNdV61QOJsJZN/aHeWgraYwVPPX
 1OdWKj14aLbSux33uASABw2YqKREcHrZF/sJV9tpJ91Ch+yQPkkOgRr1AzsYCH+jgcXj4m1HkM
 11l/GiygrthRrnLpvXk5yu/EjQKu/uWGNg69m9FCY6pJ8xONsNRR/exMacgDNa+ZMKJjyBOnmE
 YEQ6UbSK5r3tJiS1fju8Lo7dRUDcZNcJmdiCfxoSFjMsgP25MME19lvvf+fZbdulHDb7gP/Nhn
 APA=
WDCIronportException: Internal
Received: from unknown (HELO toolbox.wdc.com) ([10.225.167.94])
 by uls-op-cesaip01.wdc.com with ESMTP; 07 Sep 2022 01:05:04 -0700
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, Weiwei Li <liweiwei@iscas.ac.cn>,
 Junqiang Wang <wangjunqiang@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 27/44] target/riscv: Fix priority of csr related check in
 riscv_csrrw_check
Date: Wed,  7 Sep 2022 10:03:36 +0200
Message-Id: <20220907080353.111926-28-alistair.francis@wdc.com>
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

Normally, riscv_csrrw_check is called when executing Zicsr instructions.
And we can only do access control for existed CSRs. So the priority of
CSR related check, from highest to lowest, should be as follows:
1) check whether Zicsr is supported: raise RISCV_EXCP_ILLEGAL_INST if not
2) check whether csr is existed: raise RISCV_EXCP_ILLEGAL_INST if not
3) do access control: raise RISCV_EXCP_ILLEGAL_INST or RISCV_EXCP_VIRT_
INSTRUCTION_FAULT if not allowed

The predicates contain parts of function of both 2) and 3), So they need
to be placed in the middle of riscv_csrrw_check

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220803123652.3700-1-liweiwei@iscas.ac.cn>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/csr.c | 44 +++++++++++++++++++++++++-------------------
 1 file changed, 25 insertions(+), 19 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 0fb042b2fd..d81f466c80 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -3270,6 +3270,30 @@ static inline RISCVException riscv_csrrw_check(CPURISCVState *env,
     /* check privileges and return RISCV_EXCP_ILLEGAL_INST if check fails */
     int read_only = get_field(csrno, 0xC00) == 3;
     int csr_min_priv = csr_ops[csrno].min_priv_ver;
+
+    /* ensure the CSR extension is enabled. */
+    if (!cpu->cfg.ext_icsr) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    if (env->priv_ver < csr_min_priv) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    /* check predicate */
+    if (!csr_ops[csrno].predicate) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    if (write_mask && read_only) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    RISCVException ret = csr_ops[csrno].predicate(env, csrno);
+    if (ret != RISCV_EXCP_NONE) {
+        return ret;
+    }
+
 #if !defined(CONFIG_USER_ONLY)
     int csr_priv, effective_priv = env->priv;
 
@@ -3290,25 +3314,7 @@ static inline RISCVException riscv_csrrw_check(CPURISCVState *env,
         return RISCV_EXCP_ILLEGAL_INST;
     }
 #endif
-    if (write_mask && read_only) {
-        return RISCV_EXCP_ILLEGAL_INST;
-    }
-
-    /* ensure the CSR extension is enabled. */
-    if (!cpu->cfg.ext_icsr) {
-        return RISCV_EXCP_ILLEGAL_INST;
-    }
-
-    /* check predicate */
-    if (!csr_ops[csrno].predicate) {
-        return RISCV_EXCP_ILLEGAL_INST;
-    }
-
-    if (env->priv_ver < csr_min_priv) {
-        return RISCV_EXCP_ILLEGAL_INST;
-    }
-
-    return csr_ops[csrno].predicate(env, csrno);
+    return RISCV_EXCP_NONE;
 }
 
 static RISCVException riscv_csrrw_do64(CPURISCVState *env, int csrno,
-- 
2.37.2


