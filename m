Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E24F14CB681
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 06:38:26 +0100 (CET)
Received: from localhost ([::1]:60922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPeAT-00083h-Ps
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 00:38:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=05403f1d5=alistair.francis@opensource.wdc.com>)
 id 1nPe1a-0002As-2U
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 00:29:14 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:61823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=05403f1d5=alistair.francis@opensource.wdc.com>)
 id 1nPe1Y-0001QN-4J
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 00:29:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1646285351; x=1677821351;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WW9tUr7cwvEuPUUhKMADjGBtYWYb91xxbDS/jwUrHSw=;
 b=Sy8jQfIsdl032YWUaCExGXmLDXqBEbXdqv8yuhji64rHF/LwUlVIm3Az
 OnPLZcf2GyWx8bKVuMS11O1dYxf9sW2Ua43wDlgCajXK8FmHHk3nQrBZL
 Vy6qiM9LXyryYgJ09ltPIeCWQxlUCCa0YhwGKcYUJQ0oJ8dJPSJfw2hcw
 amBUPJBO9k6USCLehHMZgV/cw5ObuH3BvLEZJvG29jHxQrPfOvfgPoLpa
 aijS995JTNx6OWWUx9ZPnYbDwCZCEWuY2lZwWtu4P0cD+DDTzTvWdkLug
 R7cJxUuIPwdyYcX83ON6HQQLCC3Dp1VVosy93KIM8q5XQA/wQGxN1woC+ A==;
X-IronPort-AV: E=Sophos;i="5.90,151,1643644800"; d="scan'208";a="194355365"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 03 Mar 2022 13:29:02 +0800
IronPort-SDR: 11wnlxTpRSvqspAsTc7TRGCX/hqxU+NSfSS7+esZlaIfpmIhxcwOk5H1sFvan13Vl0wTOalOEG
 7IYoUxnb81YcpGwb6qwfzxm6DUVBqlqZMgi1k8qcurMDWhFK5+KSCY9LVtKni+ozN043CDouI9
 c/RMVyRkoV1gvErklT/BWzw2E1RqkmJSuAJLb9/PEHnv0YIKOF2c8YjNIAfbYos3VoTBHoDl47
 vKaR5Bs90FIeCMF/OnBdcMrCY4qXn1io30HkKv1ugtXaYZUBNcjnaHmRqgsxU9qT7Ggk+CxzN3
 CagVtbHpJSuEdKLR+5XSEjS3
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2022 21:00:25 -0800
IronPort-SDR: YrMqIckUwSheCOqN+Q5SkLSHj97XFs09jU/atPv84a/YKTdHHcRb8jxOj97Jcks6VdLi00Hdqv
 7/eKPmAGGDmZddOjcjQbBpW7k3qRUbCIheSnglXnxbrQfOIl2WFiHhPXG959jmccIVYQlo+kvf
 dgl29M+qOjWfapzWzRBPbZaDdC65pU4ciXfijC5xBZYXHnuRuDu6Z646h4PrEyoWMA7Ohb7D4h
 ZaCmT3+IpPCtkfHeV+mXg1l2doE+AYX2DbxHzWTIvsDUN+meo4UXti2RViRVt0vWgJNrFfX4bP
 g8o=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2022 21:29:03 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4K8KKW0XJnz1SVnx
 for <qemu-devel@nongnu.org>; Wed,  2 Mar 2022 21:29:03 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1646285342; x=1648877343; bh=WW9tUr7cwvEuPUUhKM
 ADjGBtYWYb91xxbDS/jwUrHSw=; b=adK6/ktEfXpF0Aw1hjqnXXcVjlcH5yebmp
 W8LJ5hbn9qTlXwPom45QdP73U4Io/URI0cQm5qpEfEeTPf/RmpsGyxthDJTa2Vi/
 9jiEKFYP7UeYcibTxp2fxUYI1LkcYF2pLSXht5hhZdEDtj2cRbMsFuvUSF/PR9L0
 xPPaBQI5LOvatltBYX9I9zwOpqUMgJeNKm4qMUWIG8CspZ+mjgvK+BUEEzbxiCzV
 5Hd9QVT22oUWOLmKhAjXZ6INjFMFvvpM/al1uC7oW0dEUye+YpQdhg4XmgOzxKLv
 ExnplOK31Yb9nnbk7rRjqAmYChZHH07gzsS/Of5jh/H42h9Dic4Q==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 2HVA3OawrveO for <qemu-devel@nongnu.org>;
 Wed,  2 Mar 2022 21:29:02 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.101])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4K8KKQ3tBlz1Rvlx;
 Wed,  2 Mar 2022 21:28:58 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Weiwei Li <liweiwei@iscas.ac.cn>,
 ardxwe <ardxwe@gmail.com>, Junqiang Wang <wangjunqiang@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 09/13] target/riscv: hardwire mstatus.FS to zero when enable
 zfinx
Date: Thu,  3 Mar 2022 15:28:00 +1000
Message-Id: <20220303052804.529967-10-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220303052804.529967-1-alistair.francis@opensource.wdc.com>
References: <20220303052804.529967-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=05403f1d5=alistair.francis@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Weiwei Li <liweiwei@iscas.ac.cn>

Co-authored-by: ardxwe <ardxwe@gmail.com>
Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220211043920.28981-3-liweiwei@iscas.ac.cn>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_helper.c |  6 +++++-
 target/riscv/csr.c        | 25 ++++++++++++++++++++-----
 target/riscv/translate.c  |  4 ++++
 3 files changed, 29 insertions(+), 6 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 746335bfd6..1c60fb2e80 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -466,9 +466,13 @@ bool riscv_cpu_vector_enabled(CPURISCVState *env)
=20
 void riscv_cpu_swap_hypervisor_regs(CPURISCVState *env)
 {
-    uint64_t mstatus_mask =3D MSTATUS_MXR | MSTATUS_SUM | MSTATUS_FS |
+    uint64_t mstatus_mask =3D MSTATUS_MXR | MSTATUS_SUM |
                             MSTATUS_SPP | MSTATUS_SPIE | MSTATUS_SIE |
                             MSTATUS64_UXL | MSTATUS_VS;
+
+    if (riscv_has_ext(env, RVF)) {
+        mstatus_mask |=3D MSTATUS_FS;
+    }
     bool current_virt =3D riscv_cpu_virt_enabled(env);
=20
     g_assert(riscv_has_ext(env, RVH));
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index a938760a3f..aea82dff4a 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -39,7 +39,8 @@ void riscv_set_csr_ops(int csrno, riscv_csr_operations =
*ops)
 static RISCVException fs(CPURISCVState *env, int csrno)
 {
 #if !defined(CONFIG_USER_ONLY)
-    if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
+    if (!env->debugger && !riscv_cpu_fp_enabled(env) &&
+        !RISCV_CPU(env_cpu(env))->cfg.ext_zfinx) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
 #endif
@@ -302,7 +303,9 @@ static RISCVException write_fflags(CPURISCVState *env=
, int csrno,
                                    target_ulong val)
 {
 #if !defined(CONFIG_USER_ONLY)
-    env->mstatus |=3D MSTATUS_FS;
+    if (riscv_has_ext(env, RVF)) {
+        env->mstatus |=3D MSTATUS_FS;
+    }
 #endif
     riscv_cpu_set_fflags(env, val & (FSR_AEXC >> FSR_AEXC_SHIFT));
     return RISCV_EXCP_NONE;
@@ -319,7 +322,9 @@ static RISCVException write_frm(CPURISCVState *env, i=
nt csrno,
                                 target_ulong val)
 {
 #if !defined(CONFIG_USER_ONLY)
-    env->mstatus |=3D MSTATUS_FS;
+    if (riscv_has_ext(env, RVF)) {
+        env->mstatus |=3D MSTATUS_FS;
+    }
 #endif
     env->frm =3D val & (FSR_RD >> FSR_RD_SHIFT);
     return RISCV_EXCP_NONE;
@@ -337,7 +342,9 @@ static RISCVException write_fcsr(CPURISCVState *env, =
int csrno,
                                  target_ulong val)
 {
 #if !defined(CONFIG_USER_ONLY)
-    env->mstatus |=3D MSTATUS_FS;
+    if (riscv_has_ext(env, RVF)) {
+        env->mstatus |=3D MSTATUS_FS;
+    }
 #endif
     env->frm =3D (val & FSR_RD) >> FSR_RD_SHIFT;
     riscv_cpu_set_fflags(env, (val & FSR_AEXC) >> FSR_AEXC_SHIFT);
@@ -653,10 +660,14 @@ static RISCVException write_mstatus(CPURISCVState *=
env, int csrno,
         tlb_flush(env_cpu(env));
     }
     mask =3D MSTATUS_SIE | MSTATUS_SPIE | MSTATUS_MIE | MSTATUS_MPIE |
-        MSTATUS_SPP | MSTATUS_FS | MSTATUS_MPRV | MSTATUS_SUM |
+        MSTATUS_SPP | MSTATUS_MPRV | MSTATUS_SUM |
         MSTATUS_MPP | MSTATUS_MXR | MSTATUS_TVM | MSTATUS_TSR |
         MSTATUS_TW | MSTATUS_VS;
=20
+    if (riscv_has_ext(env, RVF)) {
+        mask |=3D MSTATUS_FS;
+    }
+
     if (xl !=3D MXL_RV32 || env->debugger) {
         /*
          * RV32: MPV and GVA are not in mstatus. The current plan is to
@@ -788,6 +799,10 @@ static RISCVException write_misa(CPURISCVState *env,=
 int csrno,
         return RISCV_EXCP_NONE;
     }
=20
+    if (!(val & RVF)) {
+        env->mstatus &=3D ~MSTATUS_FS;
+    }
+
     /* flush translation cache */
     tb_flush(env_cpu(env));
     env->misa_ext =3D val;
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 84dbfa6340..c7232de326 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -426,6 +426,10 @@ static void mark_fs_dirty(DisasContext *ctx)
 {
     TCGv tmp;
=20
+    if (!has_ext(ctx, RVF)) {
+        return;
+    }
+
     if (ctx->mstatus_fs !=3D MSTATUS_FS) {
         /* Remember the state change for the rest of the TB. */
         ctx->mstatus_fs =3D MSTATUS_FS;
--=20
2.35.1


