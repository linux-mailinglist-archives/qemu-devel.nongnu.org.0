Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B2A3C998F
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 09:21:13 +0200 (CEST)
Received: from localhost ([::1]:44028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3vgG-0005Av-Nn
	for lists+qemu-devel@lfdr.de; Thu, 15 Jul 2021 03:21:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=8230c157d=alistair.francis@wdc.com>)
 id 1m3vc2-0005Oq-BF
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 03:16:50 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:27205)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=8230c157d=alistair.francis@wdc.com>)
 id 1m3vc0-0003VO-Nk
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 03:16:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1626333409; x=1657869409;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=04uox9uATPHL3afcoqaX+g7tK6s153iK9hY6jdlv9oc=;
 b=HaV+0sSCC7rD1Ut+BvKpKf9Uu1OSX1iPGoYfOtQ22E3c4yD0h4GO2aKM
 X9Vs58ROjJ9ZIBpJXODZ2D33eTexkNPkZ3mlXlrRlClTN47EK7FifKWtL
 RTcInEK7v+QIBN6UjQLa4Ke9aZe7G0wQjDuUuyjyL2MJAMCy5NgtlynOs
 EBouU1h78EibQ4QqkEa//bLTyxMNCWcSZNN4WTFSYnj7kK6UdYDsqjIOZ
 H9GwKM/K++aeBG/lSkCt6PN4fJEbq1xZ3q2ZR0qzcao24/oliuHDfU4PC
 ErRV9DMiQU0uEWQXBW2HuUORDKCZJ7Uxp9F0vyAa/qgvPnYQLNtNWxV+Q A==;
IronPort-SDR: Ia4qJfzGP4QVhxAZUsJlnRuMAKXRCMLQc6Y/ZmysHBmj/JZvaqyE6Dzlk100kDAyrcSeLCGtV/
 /1oge5QBCl8YCdBopSX1Bw5obdWv23IFb9Lbb/0jeicSf1LAfjXvQgbZoJnfBn9Dh4NDD5rXQE
 I3AFUS+bbf09JLDb69lx21Qj9fo8iK4zRyZrw5X8EzdDljcQ2tYw0kj9miIlTEuqY7yc45Z5Uf
 DXsGOZBRbHtHO3Sr4CKeXxrd3N88idVHUZzfzyOwJdU6IjnbkXulHb6XO7XpcVOs+7EiFHjUAA
 uLw=
X-IronPort-AV: E=Sophos;i="5.84,240,1620662400"; d="scan'208";a="175212300"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 15 Jul 2021 15:16:42 +0800
IronPort-SDR: tS4s+Rx3WhYSG8531+rMgETeX2OOBRgatFUWks5ARSiAdU3zuZ0cOsW0T21w9S8MkGFveWu+FM
 Mpu9j7Bs98gN+EdJGSA4haHVEwI4eM7uqS16Ib7tec5BjUdzDWan53ZgAp0pmcazD2fVgt4nO/
 5nZ5jwTQ5FFK8Xt93RKWqU3yMlLv9gULuTejHbVY/VrNEiI3fkwyNTrJKfwDaevVNaNapFwBZ9
 zGxAbj7iOazjbY55goBcsaTsavPyDc+TZh3L4YZjBR3uTEJq5AeFYHH5QfqdI13+UyKud76CDj
 GFHYtCAVJDwZpXA8sO56xjmO
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2021 23:54:44 -0700
IronPort-SDR: oip6jwTMbHQ09vaMlWU3V7e2V3MftdphWB+wib7mnOHZvND1Ade6rCEWfwQgnaRkF9vGlATrmc
 ckhvhhHggQFyU1HuRLNOCQmyGB/PPog0DWnuAsYVhNODFp5jlT6EZN57Z3ysNhShmReyEKM+0F
 SIe8zXfwEzea6HpDt3WTCHJSWtKkRMaFnFJJU5PvIJs39xBMH5+Bq8BBm96ZaRQ03N9t+KbRcE
 zuAqoErOeoNW9hLiVBlq6ZDLcoQ4hQQsAkS4Q/1Zufygr4dy4HQhplXvQbLFkNq1e6O7HWXjNN
 Xr8=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
 risc6-mainframe.int.fusionio.com) ([10.196.157.248])
 by uls-op-cesaip02.wdc.com with ESMTP; 15 Jul 2021 00:16:42 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL v2 02/12] target/riscv: csr: Remove redundant check in fp csr
 read/write routines
Date: Thu, 15 Jul 2021 00:16:30 -0700
Message-Id: <20210715071640.232070-3-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210715071640.232070-1-alistair.francis@wdc.com>
References: <20210715071640.232070-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=8230c157d=alistair.francis@wdc.com;
 helo=esa6.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bmeng.cn@gmail.com>

The following check:

    if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
        return -RISCV_EXCP_ILLEGAL_INST;
    }

is redundant in fflags/frm/fcsr read/write routines, as the check was
already done in fs().

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210627120604.11116-1-bmeng.cn@gmail.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/csr.c | 24 ------------------------
 1 file changed, 24 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index fe5628fea6..62b968326c 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -215,11 +215,6 @@ static RISCVException epmp(CPURISCVState *env, int csrno)
 static RISCVException read_fflags(CPURISCVState *env, int csrno,
                                   target_ulong *val)
 {
-#if !defined(CONFIG_USER_ONLY)
-    if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
-        return RISCV_EXCP_ILLEGAL_INST;
-    }
-#endif
     *val = riscv_cpu_get_fflags(env);
     return RISCV_EXCP_NONE;
 }
@@ -228,9 +223,6 @@ static RISCVException write_fflags(CPURISCVState *env, int csrno,
                                    target_ulong val)
 {
 #if !defined(CONFIG_USER_ONLY)
-    if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
-        return RISCV_EXCP_ILLEGAL_INST;
-    }
     env->mstatus |= MSTATUS_FS;
 #endif
     riscv_cpu_set_fflags(env, val & (FSR_AEXC >> FSR_AEXC_SHIFT));
@@ -240,11 +232,6 @@ static RISCVException write_fflags(CPURISCVState *env, int csrno,
 static RISCVException read_frm(CPURISCVState *env, int csrno,
                                target_ulong *val)
 {
-#if !defined(CONFIG_USER_ONLY)
-    if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
-        return RISCV_EXCP_ILLEGAL_INST;
-    }
-#endif
     *val = env->frm;
     return RISCV_EXCP_NONE;
 }
@@ -253,9 +240,6 @@ static RISCVException write_frm(CPURISCVState *env, int csrno,
                                 target_ulong val)
 {
 #if !defined(CONFIG_USER_ONLY)
-    if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
-        return RISCV_EXCP_ILLEGAL_INST;
-    }
     env->mstatus |= MSTATUS_FS;
 #endif
     env->frm = val & (FSR_RD >> FSR_RD_SHIFT);
@@ -265,11 +249,6 @@ static RISCVException write_frm(CPURISCVState *env, int csrno,
 static RISCVException read_fcsr(CPURISCVState *env, int csrno,
                                 target_ulong *val)
 {
-#if !defined(CONFIG_USER_ONLY)
-    if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
-        return RISCV_EXCP_ILLEGAL_INST;
-    }
-#endif
     *val = (riscv_cpu_get_fflags(env) << FSR_AEXC_SHIFT)
         | (env->frm << FSR_RD_SHIFT);
     if (vs(env, csrno) >= 0) {
@@ -283,9 +262,6 @@ static RISCVException write_fcsr(CPURISCVState *env, int csrno,
                                  target_ulong val)
 {
 #if !defined(CONFIG_USER_ONLY)
-    if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
-        return RISCV_EXCP_ILLEGAL_INST;
-    }
     env->mstatus |= MSTATUS_FS;
 #endif
     env->frm = (val & FSR_RD) >> FSR_RD_SHIFT;
-- 
2.31.1


