Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F555AFEB3
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 10:14:15 +0200 (CEST)
Received: from localhost ([::1]:38518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVqCM-0001eM-O0
	for lists+qemu-devel@lfdr.de; Wed, 07 Sep 2022 04:14:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=242877ce7=alistair.francis@wdc.com>)
 id 1oVq31-0003e4-Q9
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 04:04:36 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:1920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=242877ce7=alistair.francis@wdc.com>)
 id 1oVq2x-0004UV-Vs
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 04:04:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1662537871; x=1694073871;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gm8LturORvbChA9/270jnovMPAc2IJw7QHIFto0PF3A=;
 b=kceb6iPcnY1qQBavSrcXufLuKQi2d2yAiz3N+L2UhnUPIID9s4dxH5eI
 Pfx2jxkdY7OsMjLV7Qs4ra5jS94rXc5Fftu8BP3wlRh7H56mBCncFeT3s
 nYzMqOinDIC+/po+ehLw+oT/+T2cavYgajcUXBAdzJ/iKeouw5M7uUacU
 thAgrP68//qk+DlKLgp+AMujtBdRrxKlUD2T70AL0YhoKqyDB3m1gLQqP
 09nHIS/zsBKfxMpCR9SGmP8CNyZgaaFsCkxlmpaPGMGnmEYB1xoiyL/JZ
 +qem/m9fuW3Osbj9YW+CTUixS4iRbU3aJxMQCQM5JD7d61imMCOWTBF4A A==;
X-IronPort-AV: E=Sophos;i="5.93,296,1654531200"; d="scan'208";a="210714966"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 07 Sep 2022 16:04:29 +0800
IronPort-SDR: bjQvTB94cbngaS33LDPKXC6ACD0d8JpKEU0OVXRDzVfCV7QjMFVc/Yg4WkqFQN+Q8gXtS/DgsW
 OQTLfvhpC+Y6Wwc08BzaqOeO3g3qqU6vKfbbrRxAxlT1X9TEpwEZDA77f79li2YvZvQH3RRh8p
 DplLvjq0OQAotu9mt6ecGGhk6ebY+jGVAMb+D1uqQ8HxPd6nH1tys1uWDqWQxfA0kk8XmNwJzW
 2BbW6R3tIMQ08mlyclHFP/E0ARJ+LlhAXh8hPqA/14hmBgfr/b1BhduKlSr/GljLRIoY5krG0B
 KA5TaMHs0X0FK97e2SUsj/vq
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 07 Sep 2022 00:19:26 -0700
IronPort-SDR: NTJITzYik/kgTOAUU5wnPv0W52wwA8SoY5occkIRHvtnFNiAq/PpM1Ap7JIB887D5pjIbRWlBs
 YpNlmcLHVk+XhJ2u87lEz6WM4as5ZjqI/Z2uK5J2mab6OUbFy1F+iseUSLgUXjwfJw/g8AWUMh
 VFhqpo96l350RgnZFOoSfjPe8Xmv8dQaabJtn3CC1v/trD26VoFYE+JCPATMbZh1RNl+1rs3hz
 DWA3k/nJG9blyxK9y/HpoI94Wl6AYtbzMi/HH5f9OcvmUvrO5BtbsVlndVi3kbe7t2tVb8kipY
 dKw=
WDCIronportException: Internal
Received: from unknown (HELO toolbox.wdc.com) ([10.225.167.94])
 by uls-op-cesaip01.wdc.com with ESMTP; 07 Sep 2022 01:04:28 -0700
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, Weiwei Li <liweiwei@iscas.ac.cn>,
 Junqiang Wang <wangjunqiang@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Andrew Jones <ajones@ventanamicro.com>
Subject: [PULL 09/44] target/riscv: Add check for csrs existed with U extension
Date: Wed,  7 Sep 2022 10:03:18 +0200
Message-Id: <20220907080353.111926-10-alistair.francis@wdc.com>
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

Add umode/umode32 predicate for mcounteren, menvcfg/menvcfgh

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Message-Id: <20220718130955.11899-5-liweiwei@iscas.ac.cn>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/csr.c | 24 +++++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 7d4b6ceced..5c69dc838c 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -339,6 +339,24 @@ static RISCVException hmode32(CPURISCVState *env, int csrno)
 
 }
 
+static RISCVException umode(CPURISCVState *env, int csrno)
+{
+    if (riscv_has_ext(env, RVU)) {
+        return RISCV_EXCP_NONE;
+    }
+
+    return RISCV_EXCP_ILLEGAL_INST;
+}
+
+static RISCVException umode32(CPURISCVState *env, int csrno)
+{
+    if (riscv_cpu_mxl(env) != MXL_RV32) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    return umode(env, csrno);
+}
+
 /* Checks if PointerMasking registers could be accessed */
 static RISCVException pointer_masking(CPURISCVState *env, int csrno)
 {
@@ -3519,7 +3537,7 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_MEDELEG]     = { "medeleg",    any,   read_medeleg, write_medeleg },
     [CSR_MIE]         = { "mie",        any,   NULL, NULL,   rmw_mie       },
     [CSR_MTVEC]       = { "mtvec",      any,   read_mtvec,   write_mtvec   },
-    [CSR_MCOUNTEREN]  = { "mcounteren", any,   read_mcounteren,
+    [CSR_MCOUNTEREN]  = { "mcounteren", umode, read_mcounteren,
                           write_mcounteren                                 },
 
     [CSR_MSTATUSH]    = { "mstatush",   any32, read_mstatush,
@@ -3553,9 +3571,9 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_MIPH]     = { "miph",     aia_any32, NULL, NULL, rmw_miph     },
 
     /* Execution environment configuration */
-    [CSR_MENVCFG]  = { "menvcfg",  any,   read_menvcfg,  write_menvcfg,
+    [CSR_MENVCFG]  = { "menvcfg",  umode, read_menvcfg,  write_menvcfg,
                        .min_priv_ver = PRIV_VERSION_1_12_0              },
-    [CSR_MENVCFGH] = { "menvcfgh", any32, read_menvcfgh, write_menvcfgh,
+    [CSR_MENVCFGH] = { "menvcfgh", umode32, read_menvcfgh, write_menvcfgh,
                        .min_priv_ver = PRIV_VERSION_1_12_0              },
     [CSR_SENVCFG]  = { "senvcfg",  smode, read_senvcfg,  write_senvcfg,
                        .min_priv_ver = PRIV_VERSION_1_12_0              },
-- 
2.37.2


