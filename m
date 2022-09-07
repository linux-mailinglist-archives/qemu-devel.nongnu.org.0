Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BABE5AFEE0
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 10:21:30 +0200 (CEST)
Received: from localhost ([::1]:47152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVqJN-0007c4-GH
	for lists+qemu-devel@lfdr.de; Wed, 07 Sep 2022 04:21:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=242877ce7=alistair.francis@wdc.com>)
 id 1oVq35-0003ed-NL
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 04:04:49 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:1923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=242877ce7=alistair.francis@wdc.com>)
 id 1oVq31-0004Ud-9b
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 04:04:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1662537874; x=1694073874;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6gSvtGRAuJ5jbOZAZHTGiwzP5QODFlPLV7wvtfHwujc=;
 b=VzK/2I/zfCfeukWOGHQDHT2lAGnbf/8YKvlFLMRxTsywDv6tNCti1eIM
 Sv4/5CIriWTPzsHf8XAFCg8kZqc2FU5GZhQNS2cKIKMz94PlS0cTerJcs
 KtbuUaYkBjEjIbJYNmbKkPmvm03tSAOFdjzCl0gKGywO9QXZOugc4+Ci8
 KoA16Vo8+EQv2U8jW9MZi3V2WH1uKWAn1fPn40frhzn5ebp2Dig9XymaF
 +zETDm8EpeA5qkHqlc+iH4MyKbeiA/GAcpzUzOKiTTaL3pS8IRLZPctrm
 zFU0mlKo3x9WMzS0JG//TgXejS8uvx3x6aiWg1UXTkB80S/osPYiaHSj/ A==;
X-IronPort-AV: E=Sophos;i="5.93,296,1654531200"; d="scan'208";a="210714972"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 07 Sep 2022 16:04:31 +0800
IronPort-SDR: ZZFuhrgtOmF8kPEKYVaMU0eGwBAIBH02c4LYHUdAG3cHBgzCehlJ0vhVwS284uHhdnqgAs64Sk
 FPygwB+80KFOudaXNCYGYWlGeiOKKhM0vVvvkc9B5cDzX8hKqHAuomFor8jTS+hhRA1Es5hjGd
 a+YPN/ZUa/EXcuNpLPZhXs8DJtB/LftylTqpVPjtibBdz8F7zhFEHK0ZtEzALKeeLaZN9FyhjO
 0JfpzTPZ1pVjD+KRu4v4K6vitfE58m5LB9vrSxjMkjsk7CZ4sgRBff5jORlC2bhdjmNuZXPosD
 AfRqfqOZxdnqcT60GplAhXwc
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 07 Sep 2022 00:19:28 -0700
IronPort-SDR: Zoql0GcF/lJhxjNk4OIhkFy0MAy9LRHolNpKYv6EjLtyRZl7LZjFA7DoNX+lq4+Dqt5/lUpKAP
 iJxx5sZQcgjs23qzy7W5U2FYJwXqo8Jj88UBuLWoacU3qJ15NR56xP5g6SERGU5OBWiVKa8ujT
 QraGlNTiWWNzmIqUHfwGt7t9oabMdTxw9Wvgl0/WxRckPe/l24sPo1thLZGXOrR7qqamHcDOw3
 2gmJhlkMOwwNlRpx2+jUrPO+rBkaXkY0ad/GECyLrHpew4XxZC0ymDzYAJzJiyb/dH2RJRZpMV
 rcs=
WDCIronportException: Internal
Received: from unknown (HELO toolbox.wdc.com) ([10.225.167.94])
 by uls-op-cesaip01.wdc.com with ESMTP; 07 Sep 2022 01:04:30 -0700
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, Weiwei Li <liweiwei@iscas.ac.cn>,
 Junqiang Wang <wangjunqiang@iscas.ac.cn>,
 Andrew Jones <ajones@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 10/44] target/riscv: Fix checks in hmode/hmode32
Date: Wed,  7 Sep 2022 10:03:19 +0200
Message-Id: <20220907080353.111926-11-alistair.francis@wdc.com>
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

Add check for the implicit dependence between H and S

Csrs only existed in RV32 will not trigger virtual instruction fault
when not in RV32 based on section 8.6.1 of riscv-privileged spec
(draft-20220717)

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220718130955.11899-6-liweiwei@iscas.ac.cn>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 5 +++++
 target/riscv/csr.c | 9 ++-------
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index fb37ffac64..117d308ae5 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -733,6 +733,11 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
             return;
         }
 
+        if (cpu->cfg.ext_h && !cpu->cfg.ext_s) {
+            error_setg(errp, "H extension implicitly requires S-mode");
+            return;
+        }
+
         if (cpu->cfg.ext_f && !cpu->cfg.ext_icsr) {
             error_setg(errp, "F extension requires Zicsr");
             return;
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 5c69dc838c..cf15aa67b7 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -311,8 +311,7 @@ static int aia_smode32(CPURISCVState *env, int csrno)
 
 static RISCVException hmode(CPURISCVState *env, int csrno)
 {
-    if (riscv_has_ext(env, RVS) &&
-        riscv_has_ext(env, RVH)) {
+    if (riscv_has_ext(env, RVH)) {
         /* Hypervisor extension is supported */
         if ((env->priv == PRV_S && !riscv_cpu_virt_enabled(env)) ||
             env->priv == PRV_M) {
@@ -328,11 +327,7 @@ static RISCVException hmode(CPURISCVState *env, int csrno)
 static RISCVException hmode32(CPURISCVState *env, int csrno)
 {
     if (riscv_cpu_mxl(env) != MXL_RV32) {
-        if (!riscv_cpu_virt_enabled(env)) {
-            return RISCV_EXCP_ILLEGAL_INST;
-        } else {
-            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
-        }
+        return RISCV_EXCP_ILLEGAL_INST;
     }
 
     return hmode(env, csrno);
-- 
2.37.2


