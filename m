Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A53D3C668A
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 00:56:14 +0200 (CEST)
Received: from localhost ([::1]:43616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m34qT-00088n-6l
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 18:56:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=820a0e1fd=alistair.francis@wdc.com>)
 id 1m34oI-0005Ay-TS
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 18:53:58 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:17601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=820a0e1fd=alistair.francis@wdc.com>)
 id 1m34oH-0006rU-6g
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 18:53:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1626130438; x=1657666438;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=04uox9uATPHL3afcoqaX+g7tK6s153iK9hY6jdlv9oc=;
 b=nHjv+6toyLcbL5k0qgjUNNhU62TBeQiSm00NEQVrVV5XwLFnG0kIi9a+
 qkU8z+mGEWZjMeb721LnCv7i6IvvjQKY8dRTBHiKTVkKSY3xO3B6fvrA0
 qaoL9iFj8eoBpkKExyUi4McpWwHY6tr1Fl/9xKL9MiQ/cYjDeFoBPCuLu
 tF3eJ5aCjEIZSiCLkr/kL0pZMaqsD+D0SlLGwW2VLLvLd9T87b4FR+82V
 QamCEDtmvQQrj0Ac6UsUEVubjRHtf49uMnNaQ1S32Qzfi2HXYMRLv/6SN
 PGL4xCBHIJ1A289EuwkxxEnPUhP66OK0ItpjdBAGJdX8POVWl2juo87d0 A==;
IronPort-SDR: +8gK1zW1jhzxzsyGT955DzJYZSIsN5MO6OQu5eS/8Jbz4jIdajTpIfDCMukeCf4v65TnaTAexl
 V94aDo3y5w5BOWN8gJrC+obAAtDHctI0oj1QZfvwd/v4Suulk7gFazzlb/9TSgKQtUg0Z5BQyh
 9NcnFMCh9kfpkM0FaqvPDGA57lkkRGdGxsXzv6eerEPn14x1lmtG+iL71C8Ufxnm/IvHxHl3l1
 /hcIGVRzZFML17CxmlVev7JVL972AvBNTIz+1/X6gpvYuONGND1CUMf1I12FVGDnxrrFmpIa8w
 T4U=
X-IronPort-AV: E=Sophos;i="5.84,235,1620662400"; d="scan'208";a="174973301"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 13 Jul 2021 06:53:52 +0800
IronPort-SDR: CJ1EInN01U/YY9samxxNWSS8xYwHiRNNrOwmu0QOJBiqcYyTwr7k1QWew/MQlUK35tm887LOJk
 KAUoL8QMxl22ZMviowbc5BEQ8kgfjiRRSJRWcx4ctg7yd6zGE/5cjuSw82aylI/iBjrudJL0ka
 aR1UzaSxLFSGqRsCVjzeLBTMWrTaI0pcN5FsoecIU56e4ZzbnfRrMLOVmwBLfRHh+oZWLOF8+g
 7aS+RdYHVeHUiyn/x0qJxducumys9IRFexT63ry5ki6PVeaMdE3OwTDkQ5bJMAoo2c5VERq7fA
 H0uqAZSPJ5HyWuwK19aObk4f
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2021 15:31:57 -0700
IronPort-SDR: p+IVZ6cWsSFqi2bF4vkczx6qg3cOLYolzenpDjSN9jSrb0aJUaQaAD6/9CCsqUkqSv4Hi5NQnc
 QT17wy9YuBuiT0YH7l3IQG1ho+Ya7o0O+UR/eNRkm+qCYBAnqolfVXnluYqmCytlCpPHHHjwRS
 Ol5ZXxlITl9ukZvCMnduLnF+BW9wdJ2GgOqWal8DjTm7pBh/eSYYgO26AnxnN0Oydy1WeJIsjF
 QVKZSkfgEzo8GHOMt8LOxz0Durbtg16LF5Dlat9QgZv+BYZ4kuYSO+OjsmjfP7mc1Utu8BzqJp
 OY0=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
 risc6-mainframe.int.fusionio.com) ([10.196.157.248])
 by uls-op-cesaip01.wdc.com with ESMTP; 12 Jul 2021 15:53:52 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 02/11] target/riscv: csr: Remove redundant check in fp csr
 read/write routines
Date: Mon, 12 Jul 2021 15:53:39 -0700
Message-Id: <20210712225348.213819-3-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210712225348.213819-1-alistair.francis@wdc.com>
References: <20210712225348.213819-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=820a0e1fd=alistair.francis@wdc.com;
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


