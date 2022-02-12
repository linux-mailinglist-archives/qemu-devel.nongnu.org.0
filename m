Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEDA34B324D
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Feb 2022 02:07:36 +0100 (CET)
Received: from localhost ([::1]:55766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIgsx-0003Xa-I3
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 20:07:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=03511bb56=alistair.francis@opensource.wdc.com>)
 id 1nIfte-0000XR-Kf
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 19:04:17 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:7880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=03511bb56=alistair.francis@opensource.wdc.com>)
 id 1nIftR-0000Ve-9s
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 19:04:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1644624244; x=1676160244;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xBwofrwi48pVPtDFWuxDh/a2BN1h2L8su5YfJ1V9v60=;
 b=aDVPfZfz/8j9UQ4xfKfoMjJ1cifwjD7e3gMQwJLd278zYieaVf3b+0UR
 VxCzelpl2iQFtaUTMJ72BWalFzjDE4CmjEfePN1PoMlHQYLAhgfcI6O/s
 5a7WK/Cd8W2X30viShdnKPSF8BalPaGRujeFuXdotxi6Cond/9OelrK2G
 FfO8rXyMsaSddF/kRGbxn0FwnqIrkl2TTDuitNExRWAhrTuqdfI4Mu1zZ
 dw8aHxJCaQ7Ogy0MKHrSP8HY4jDhPDW7d3J0Smkv+Cld6aAoWTXoH1kz0
 MGo35YM7m7sQzWjbPt2G/NhbUYCWN/JYx86/Zbw/FJdGy/ljnfmuWv6nO g==;
X-IronPort-AV: E=Sophos;i="5.88,361,1635177600"; d="scan'208";a="193710282"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 12 Feb 2022 08:03:51 +0800
IronPort-SDR: d7eyCZrbk2UKr63UfnrEYiAx4nYQ5xebV8fNL4vaoa16tmlC5i+mrCGnb9DAo/LciISytM758a
 XRAhD00SRJs4zRzwMLeIVjsnUcTla6yJ16RAw/8FqVwG/i/jelJL0hjCk7ayNOl8MIfXbvYx+K
 rKRcXtAJa+ilbhAFiGZo8ljYlave8fTkZj80NbDKgwTjlRKdWxVHDjvRwHHiUFTB3Ly3+XgKLt
 enHlQkXqeRcXN8iuv2BehFcOpfe8E5BdMnhy0pEvomqz4S6thsEpzD2+g0DmvLXLDvLGpol6fb
 8vZU1Bn1cQBF18CPHe1gsOFb
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 15:35:35 -0800
IronPort-SDR: +vCrIrDv9vR+CmNayb68Y1W+hL6FR+biGqyWCjsw//D0iYY1aK/bkMbs/IfBBbxjddO3Gjky3r
 4OJQ/Zf0XPyrl2ucfugCBNEn+XLl86Kn0ti4kozA5oVlcbkLJyWmQ68PIrys05vVWqZJXcnhXI
 ofK01PEi+FnO1BQklWKNUDYvbL3DnlQKLsNWLIZP6ACpKvuOdW3B7MbT30MvYlICD7kCnMB1ja
 JbFtOYh9jRDHDLrSSsw8M45HLwMpi0QF9u0LvhL0Cwyj74oVt671KSpr5q2IvTvqFC3h+z5EMC
 dBI=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 16:03:49 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JwW1159tjz1SVp2
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 16:03:49 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1644624228; x=1647216229; bh=xBwofrwi48pVPtDFWu
 xDh/a2BN1h2L8su5YfJ1V9v60=; b=sNDOx9RlI2+JvFkO8aHycUW9qKF9QVx4PM
 ZfqaGpJ7TD80ZqHtB6gQiTFhv6BC5ildhYGqghZHSQebMsMK/qV4noH7kJzktsYu
 60rkaDmg/4f8KqLpHxRz5Du4biM1qAlgUkRnZz5J4Gn2XINO1T2USYTKfqNcRrN/
 JeW5JdXBJmfi9qD7z9pwioTemLvOuYNEyIypGPkapd2EM3X/MxePJU8IG3XJtGI+
 b5uaDjmikT1XTqplPyqj1qmEDmmVihNDhZkKcelyI7zrq6bx0Vz2ZbmBlGv9CvMT
 o7KR7DZ9G9Iy6MyyzV/Unvbwpud1x+cF8K2hCeju3y10jZS7/1EA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id G7LenP5_oZzU for <qemu-devel@nongnu.org>;
 Fri, 11 Feb 2022 16:03:48 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.96])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JwW0w5FCxz1Rwrw;
 Fri, 11 Feb 2022 16:03:44 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Guo Ren <ren_guo@c-sky.com>,
 Liu Zhiwei <zhiwei_liu@c-sky.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [PULL 35/40] target/riscv: Ignore reserved bits in PTE for RV64
Date: Sat, 12 Feb 2022 10:00:26 +1000
Message-Id: <20220212000031.3946524-36-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220212000031.3946524-1-alistair.francis@opensource.wdc.com>
References: <20220212000031.3946524-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=03511bb56=alistair.francis@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
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

From: Guo Ren <ren_guo@c-sky.com>

Highest bits of PTE has been used for svpbmt, ref: [1], [2], so we
need to ignore them. They cannot be a part of ppn.

1: The RISC-V Instruction Set Manual, Volume II: Privileged Architecture
   4.4 Sv39: Page-Based 39-bit Virtual-Memory System
   4.5 Sv48: Page-Based 48-bit Virtual-Memory System

2: https://github.com/riscv/virtual-memory/blob/main/specs/663-Svpbmt-dif=
f.pdf

Signed-off-by: Guo Ren <ren_guo@c-sky.com>
Reviewed-by: Liu Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Cc: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220204022658.18097-2-liweiwei@iscas.ac.cn>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h        | 15 +++++++++++++++
 target/riscv/cpu_bits.h   |  3 +++
 target/riscv/cpu_helper.c | 13 ++++++++++++-
 3 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 7ecb1387dd..cefccb4016 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -359,6 +359,8 @@ struct RISCVCPUConfig {
     bool ext_counters;
     bool ext_ifencei;
     bool ext_icsr;
+    bool ext_svnapot;
+    bool ext_svpbmt;
     bool ext_zfh;
     bool ext_zfhmin;
     bool ext_zve32f;
@@ -558,6 +560,19 @@ static inline int riscv_cpu_xlen(CPURISCVState *env)
     return 16 << env->xl;
 }
=20
+#ifdef TARGET_RISCV32
+#define riscv_cpu_sxl(env)  ((void)(env), MXL_RV32)
+#else
+static inline RISCVMXL riscv_cpu_sxl(CPURISCVState *env)
+{
+#ifdef CONFIG_USER_ONLY
+    return env->misa_mxl;
+#else
+    return get_field(env->mstatus, MSTATUS64_SXL);
+#endif
+}
+#endif
+
 /*
  * Encode LMUL to lmul as follows:
  *     LMUL    vlmul    lmul
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 068c4d8034..b3489cbc10 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -565,6 +565,9 @@ typedef enum {
 /* Page table PPN shift amount */
 #define PTE_PPN_SHIFT       10
=20
+/* Page table PPN mask */
+#define PTE_PPN_MASK        0x3FFFFFFFFFFC00ULL
+
 /* Leaf page shift amount */
 #define PGSHIFT             12
=20
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 430060dcd8..7df4569526 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -751,6 +751,8 @@ static int get_physical_address(CPURISCVState *env, h=
waddr *physical,
     MemTxAttrs attrs =3D MEMTXATTRS_UNSPECIFIED;
     int mode =3D mmu_idx & TB_FLAGS_PRIV_MMU_MASK;
     bool use_background =3D false;
+    hwaddr ppn;
+    RISCVCPU *cpu =3D env_archcpu(env);
=20
     /*
      * Check if we should use the background registers for the two
@@ -919,7 +921,16 @@ restart:
             return TRANSLATE_FAIL;
         }
=20
-        hwaddr ppn =3D pte >> PTE_PPN_SHIFT;
+        if (riscv_cpu_sxl(env) =3D=3D MXL_RV32) {
+            ppn =3D pte >> PTE_PPN_SHIFT;
+        } else if (cpu->cfg.ext_svpbmt || cpu->cfg.ext_svnapot) {
+            ppn =3D (pte & (target_ulong)PTE_PPN_MASK) >> PTE_PPN_SHIFT;
+        } else {
+            ppn =3D pte >> PTE_PPN_SHIFT;
+            if ((pte & ~(target_ulong)PTE_PPN_MASK) >> PTE_PPN_SHIFT) {
+                return TRANSLATE_FAIL;
+            }
+        }
=20
         if (!(pte & PTE_V)) {
             /* Invalid PTE */
--=20
2.34.1


