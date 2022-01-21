Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0F4495CAA
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 10:18:12 +0100 (CET)
Received: from localhost ([::1]:34454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAq3e-0005FJ-Mv
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 04:18:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAn0y-0000Cf-Aa
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 01:03:16 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:60338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAn0u-0004AK-Dd
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 01:03:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1642744988; x=1674280988;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wUf1U0qj6BARONTMAKBZ92D45vuISX1KcrurXCHkxFs=;
 b=kya0pFyM4K6akAhVpeE8T8xyKpz/YuMz4Ex16wH37LWkLr9nd5wQhslQ
 x/4pOM7e5L5P5LYyCsetfL2FJV0kuBJyuS0mTi3TBVaL7FSNo0zWtr8OZ
 /pqr/53V8iM6KU/2F89tMjLvc5wQO++nbwBPob8FgAJT0V/hkPl/4omWy
 wLyTFyP4btgqi3+9dmTc82s7bJ6v8vLEzjFncJnbaH1APczzGr0VNJ4hj
 aSg1E+5IsPSbfcsQrwQxzAVXi6onoSJrls+pWGUPvE9LpPt1oBGNFpNl2
 wib6kOog8DrNr6/pW+tYSB3E26tkmlBKJ8B1Ugj/f3CZ5kXlkvrWbaj8G Q==;
X-IronPort-AV: E=Sophos;i="5.88,304,1635177600"; d="scan'208";a="295083078"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 21 Jan 2022 14:01:50 +0800
IronPort-SDR: UiF4gLKEnbc3zhmttjV8F356YWf6fxzqqJ8ehcnSMHN147S9Qv7W/PGDFQK22CPe8nVbFSKvjC
 sOQyxNjSSXdRXEeJrjNJLkh8QWv9jz5t0q2FC5zzfWQ0iHhL8OApwkwrMhX6CC+EKAKONhBuDy
 z+sGg+0epkN+jAs1SEAI6sRi1losRXdtixPxXL49NUsXOfgMlrVyAJkzmVMvTKL5EUQqh07NfN
 mdrAMU9gDo2104ItVJSVTyZdqz5U4Hq8yl9f2fHTs3xmstbNELXmxkNKiwODSzkI9ak4QOQ2cS
 0IXjrkBpuyPAXHY6VsqADqAg
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 21:35:17 -0800
IronPort-SDR: AiYR92fOhXBaG2LdxAkHCd1WeFbVq3hdju6XsyEbe+FtasM6vGVGKA5hpZR6SGrHjXTlLoHUI7
 jBT5hlDDEH0g6GIi1fp/Z1MbXPPUI0MZ5dxbwy6g7bnJXEsCFLHSyTVzqLeuV+IX8t9rp25Nlq
 ZTrUtrazYsEnExUy4ppHlzHW7Dx5EGnwgbaZBg4c+ERDI6JkKVadh2Et8JeTCVzUPA351IluB1
 ZA6vQdcpvaenQ/kovJEgmAMvoAkadH5037JDAfT5nj1wjxRj+lC+rBowmjp88Dhbd52I4I5/1y
 wMQ=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 22:01:50 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Jg80F629tz1Rwrw
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 22:01:49 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1642744909; x=1645336910; bh=wUf1U0qj6BARONTMAK
 BZ92D45vuISX1KcrurXCHkxFs=; b=Y9Dotrwyj+zVitofZedOPigPBM+IYuTm+0
 Au+dx/x5wqe5Gs0hVceeD0vjj9MZl5Ojloj5O36Tn4FQkp7inSigla5ZlD/uW4ZF
 EVaLcU47Y9xzmEkcqczNeGM+0dDyr4+fzfkbdNp52cQRrY8O7h2zKMn7paKPFrjt
 VakR1kRCwZVR4/tnE6bSmupv0z76K4mX7Ba46xyJ6StfILMz1/2E76aL2JD0k1Dl
 06b3UtU8a/RNmPIUK8/YWDhHKciZPN4TZNgf8i9v33Vq1bQJ6LfM4e6oxiN1WqQG
 kFN85umzl4YbSmll1mSq+NHj5MfgKSPJYi5beXtO2r2bvMX9rXPQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id WW8M7NDaB33k for <qemu-devel@nongnu.org>;
 Thu, 20 Jan 2022 22:01:49 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.80])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Jg80B0GYjz1RvlN;
 Thu, 20 Jan 2022 22:01:45 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 45/61] target/riscv: Extend pc for runtime pc write
Date: Fri, 21 Jan 2022 15:58:14 +1000
Message-Id: <20220121055830.3164408-46-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220121055830.3164408-1-alistair.francis@opensource.wdc.com>
References: <20220121055830.3164408-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=0135fdaf6=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: LIU Zhiwei <zhiwei_liu@c-sky.com>

In some cases, we must restore the guest PC to the address of the start o=
f
the TB, such as when the instruction counter hits zero. So extend pc regi=
ster
according to current xlen for these cases.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20220120122050.41546-8-zhiwei_liu@c-sky.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 736cf1d4e7..eac5f7bf03 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -355,7 +355,12 @@ static void riscv_cpu_set_pc(CPUState *cs, vaddr val=
ue)
 {
     RISCVCPU *cpu =3D RISCV_CPU(cs);
     CPURISCVState *env =3D &cpu->env;
-    env->pc =3D value;
+
+    if (env->xl =3D=3D MXL_RV32) {
+        env->pc =3D (int32_t)value;
+    } else {
+        env->pc =3D value;
+    }
 }
=20
 static void riscv_cpu_synchronize_from_tb(CPUState *cs,
@@ -363,7 +368,13 @@ static void riscv_cpu_synchronize_from_tb(CPUState *=
cs,
 {
     RISCVCPU *cpu =3D RISCV_CPU(cs);
     CPURISCVState *env =3D &cpu->env;
-    env->pc =3D tb->pc;
+    RISCVMXL xl =3D FIELD_EX32(tb->flags, TB_FLAGS, XL);
+
+    if (xl =3D=3D MXL_RV32) {
+        env->pc =3D (int32_t)tb->pc;
+    } else {
+        env->pc =3D tb->pc;
+    }
 }
=20
 static bool riscv_cpu_has_work(CPUState *cs)
@@ -384,7 +395,12 @@ static bool riscv_cpu_has_work(CPUState *cs)
 void restore_state_to_opc(CPURISCVState *env, TranslationBlock *tb,
                           target_ulong *data)
 {
-    env->pc =3D data[0];
+    RISCVMXL xl =3D FIELD_EX32(tb->flags, TB_FLAGS, XL);
+    if (xl =3D=3D MXL_RV32) {
+        env->pc =3D (int32_t)data[0];
+    } else {
+        env->pc =3D data[0];
+    }
 }
=20
 static void riscv_cpu_reset(DeviceState *dev)
--=20
2.31.1


