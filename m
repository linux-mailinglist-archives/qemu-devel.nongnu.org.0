Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5D65098A9
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 09:10:47 +0200 (CEST)
Received: from localhost ([::1]:46238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhQxi-0001OA-EZ
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 03:10:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=10363b772=alistair.francis@opensource.wdc.com>)
 id 1nhQSb-00061r-L2
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 02:38:38 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:13374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=10363b772=alistair.francis@opensource.wdc.com>)
 id 1nhQSZ-0007zd-Je
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 02:38:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1650523115; x=1682059115;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3utfC3nNOObrAN6/kxFQxt1dUDahhLFhBZOTeGX9jFY=;
 b=JIeUslJnX9N/DUg6idmYMUcW4s+aWwnWMOT/y/Q5vO2GB0aQC98UYDJv
 fnU5bAd9EDChEeKR6GxUEHxUeyvzvfdLdds/NKM+p0WhNWuCPyNrDzJZF
 /tBhd8jX1mEz2UT1r6G9g2SQby/f0Ig2cIVOxOJqDOjc7RHqAM13gx0S5
 CPS1Wghf35HX4z0hdq7LS2s3lY4MXxOIMWz9ZkwtLrLoKTaGd6tZNOlxA
 Vibr1lF1t6sO/iFHz1wXH1r8FgJ8pIO5clLsvAay8JyaSeMmIZEnsytho
 oDLRJ/gwYkMwhRGOaHMnQHrWotjXNv/QDTIBvC0KioEL3F+SPNt278em5 g==;
X-IronPort-AV: E=Sophos;i="5.90,278,1643644800"; d="scan'208";a="302640028"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 21 Apr 2022 14:38:11 +0800
IronPort-SDR: ZKAdIiWjOaBlGcqagLauCau6jgt8v6wqnW4fA5DZduRQbXynR0vGgFSkseiWjp6ncxZ6Z5v9Ph
 /vV7hh0aLvpyiwrz/dx+ZXVcx3BJxzrD102gb5CrRG6iy/pN9v2gZ6oWbCwdDVXFi5FxhKdaiP
 Kpab7BuYGWvDMUntdg8880ghjBmp4rBmRSIL2DHisZR5A05F6dx3s5SaAwAQOtzQWFNCdXOi1L
 59kFkmfk/wKwxgyDcGEmWUiTS2GED3Ib/TbMApu53eo+LNUt0rRsiHOXDP7skGL1IcY4vDB/2p
 CsmUjzmmWjlhQoAvVAbiWzAp
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Apr 2022 23:09:13 -0700
IronPort-SDR: +pZmPQ0ZBb9m4dunyuab/BAAqLeLybPizZ8263QkRI9bzkZE06SZ1FxB1MisCwhBuGCyhclBgY
 J4KEi9WTCc9ONm7kk0ej5e594SQ/0QkV9zEwTi4CcZ+/da+KwuqtOPG/FLlvIJbQEtQzRDzM36
 UPJI/p1sL2WQ8MKt23Ipma4bBvchBtyGALXWLFlO4eOu5QREqrGcq6qRmeUiVGaGTPjNuSJ1wP
 I2f600ShOgabqMOcHyjUXcH+TISNgQzTmaeJFF7K96r88iZq++yoisernOEWjaTC9i69gA1E9e
 kc4=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Apr 2022 23:38:11 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KkSXf42xfz1SVp0
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 23:38:10 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1650523089; x=1653115090; bh=3utfC3nNOObrAN6/kx
 FQxt1dUDahhLFhBZOTeGX9jFY=; b=sg9kadmHnKtiPAx1EwAU0TWB+BIb8jm0Ul
 eya5CX4fcSdrp/6x/PPNEtwe86S9FaIrFgc/Lh86nYzVIjXjAaqSlU6H7fCFiRzo
 puvi/QQVjy++DVygJ7Low8i6/ayUBz5XFqKUQWQBmhq2dNHK+xZB26YdS85Hm2fV
 VBimT+9Sdq6+ocbiUxYgOmZP9A3XQo0mlemITqqi7dGqML79RhrgF8Xv4xrV+Mit
 6vc3yqqu/3tNCk4pTWNPjInsQsPE735usBTe533drrSQJJ1m/y9199pG+1ZRxPYb
 21/ZDektG8a3sjIcmMnZ4zaAqOA72Pir56TFvLtBchMgBF95wXLQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id P3JXcryivnXl for <qemu-devel@nongnu.org>;
 Wed, 20 Apr 2022 23:38:09 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.119])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KkSXb74Qyz1Rvlx;
 Wed, 20 Apr 2022 23:38:07 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 27/31] target/riscv: csr: Hook debug CSR read/write
Date: Thu, 21 Apr 2022 16:36:26 +1000
Message-Id: <20220421063630.1033608-28-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220421063630.1033608-1-alistair.francis@opensource.wdc.com>
References: <20220421063630.1033608-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=10363b772=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
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

From: Bin Meng <bin.meng@windriver.com>

This adds debug CSR read/write support to the RISC-V CSR RW table.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220421003324.1134983-4-bmeng.cn@gmail.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/debug.h |  2 ++
 target/riscv/cpu.c   |  4 ++++
 target/riscv/csr.c   | 57 ++++++++++++++++++++++++++++++++++++++++++++
 target/riscv/debug.c | 27 +++++++++++++++++++++
 4 files changed, 90 insertions(+)

diff --git a/target/riscv/debug.h b/target/riscv/debug.h
index fb21706e1c..27b9cac6b4 100644
--- a/target/riscv/debug.h
+++ b/target/riscv/debug.h
@@ -109,4 +109,6 @@ void riscv_cpu_debug_excp_handler(CPUState *cs);
 bool riscv_cpu_debug_check_breakpoint(CPUState *cs);
 bool riscv_cpu_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp);
=20
+void riscv_trigger_init(CPURISCVState *env);
+
 #endif /* RISCV_DEBUG_H */
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 477961b619..85656cdcc3 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -466,6 +466,10 @@ static void riscv_cpu_reset(DeviceState *dev)
     set_default_nan_mode(1, &env->fp_status);
=20
 #ifndef CONFIG_USER_ONLY
+    if (riscv_feature(env, RISCV_FEATURE_DEBUG)) {
+        riscv_trigger_init(env);
+    }
+
     if (kvm_enabled()) {
         kvm_riscv_reset_vcpu(cpu);
     }
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index a09126a011..6ba85e7b5d 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -290,6 +290,15 @@ static RISCVException epmp(CPURISCVState *env, int c=
srno)
=20
     return RISCV_EXCP_ILLEGAL_INST;
 }
+
+static RISCVException debug(CPURISCVState *env, int csrno)
+{
+    if (riscv_feature(env, RISCV_FEATURE_DEBUG)) {
+        return RISCV_EXCP_NONE;
+    }
+
+    return RISCV_EXCP_ILLEGAL_INST;
+}
 #endif
=20
 /* User Floating-Point CSRs */
@@ -2677,6 +2686,48 @@ static RISCVException write_pmpaddr(CPURISCVState =
*env, int csrno,
     return RISCV_EXCP_NONE;
 }
=20
+static RISCVException read_tselect(CPURISCVState *env, int csrno,
+                                   target_ulong *val)
+{
+    *val =3D tselect_csr_read(env);
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_tselect(CPURISCVState *env, int csrno,
+                                    target_ulong val)
+{
+    tselect_csr_write(env, val);
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException read_tdata(CPURISCVState *env, int csrno,
+                                 target_ulong *val)
+{
+    /* return 0 in tdata1 to end the trigger enumeration */
+    if (env->trigger_cur >=3D TRIGGER_NUM && csrno =3D=3D CSR_TDATA1) {
+        *val =3D 0;
+        return RISCV_EXCP_NONE;
+    }
+
+    if (!tdata_available(env, csrno - CSR_TDATA1)) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    *val =3D tdata_csr_read(env, csrno - CSR_TDATA1);
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_tdata(CPURISCVState *env, int csrno,
+                                  target_ulong val)
+{
+    if (!tdata_available(env, csrno - CSR_TDATA1)) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    tdata_csr_write(env, csrno - CSR_TDATA1, val);
+    return RISCV_EXCP_NONE;
+}
+
 /*
  * Functions to access Pointer Masking feature registers
  * We have to check if current priv lvl could modify
@@ -3418,6 +3469,12 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {
     [CSR_PMPADDR14] =3D  { "pmpaddr14", pmp, read_pmpaddr, write_pmpaddr=
 },
     [CSR_PMPADDR15] =3D  { "pmpaddr15", pmp, read_pmpaddr, write_pmpaddr=
 },
=20
+    /* Debug CSRs */
+    [CSR_TSELECT]   =3D  { "tselect", debug, read_tselect, write_tselect=
 },
+    [CSR_TDATA1]    =3D  { "tdata1",  debug, read_tdata,   write_tdata  =
 },
+    [CSR_TDATA2]    =3D  { "tdata2",  debug, read_tdata,   write_tdata  =
 },
+    [CSR_TDATA3]    =3D  { "tdata3",  debug, read_tdata,   write_tdata  =
 },
+
     /* User Pointer Masking */
     [CSR_UMTE]    =3D    { "umte",    pointer_masking, read_umte,    wri=
te_umte    },
     [CSR_UPMMASK] =3D    { "upmmask", pointer_masking, read_upmmask, wri=
te_upmmask },
diff --git a/target/riscv/debug.c b/target/riscv/debug.c
index 1a9392645e..2f2a51c732 100644
--- a/target/riscv/debug.c
+++ b/target/riscv/debug.c
@@ -412,3 +412,30 @@ bool riscv_cpu_debug_check_watchpoint(CPUState *cs, =
CPUWatchpoint *wp)
=20
     return false;
 }
+
+void riscv_trigger_init(CPURISCVState *env)
+{
+    target_ulong type2 =3D trigger_type(env, TRIGGER_TYPE_AD_MATCH);
+    int i;
+
+    /* type 2 triggers */
+    for (i =3D 0; i < TRIGGER_TYPE2_NUM; i++) {
+        /*
+         * type =3D TRIGGER_TYPE_AD_MATCH
+         * dmode =3D 0 (both debug and M-mode can write tdata)
+         * maskmax =3D 0 (unimplemented, always 0)
+         * sizehi =3D 0 (match against any size, RV64 only)
+         * hit =3D 0 (unimplemented, always 0)
+         * select =3D 0 (always 0, perform match on address)
+         * timing =3D 0 (always 0, trigger before instruction)
+         * sizelo =3D 0 (match against any size)
+         * action =3D 0 (always 0, raise a breakpoint exception)
+         * chain =3D 0 (unimplemented, always 0)
+         * match =3D 0 (always 0, when any compare value equals tdata2)
+         */
+        env->type2_trig[i].mcontrol =3D type2;
+        env->type2_trig[i].maddress =3D 0;
+        env->type2_trig[i].bp =3D NULL;
+        env->type2_trig[i].wp =3D NULL;
+    }
+}
--=20
2.35.1


