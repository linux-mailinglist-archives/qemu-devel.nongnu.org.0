Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F024B8334
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 09:46:42 +0100 (CET)
Received: from localhost ([::1]:39956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKFxR-00037Z-BW
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 03:46:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=039576d22=alistair.francis@opensource.wdc.com>)
 id 1nKDqt-0007Ii-3Z
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:31:48 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:31692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=039576d22=alistair.francis@opensource.wdc.com>)
 id 1nKDqr-0006ss-49
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:31:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1644993105; x=1676529105;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xBwofrwi48pVPtDFWuxDh/a2BN1h2L8su5YfJ1V9v60=;
 b=SmqfrlzjlAbJLT6jxQkMVN+bDzAXaOOdZBIyl9P8joOePWgJao4vT5XP
 VHRrtk9nGvIsImzS4tXg1rJ1Ig9xxyGQ9albOu3iDz4Mw+LvJbpwxFE8d
 E4lNTGpmOC3bbx6GA0Iv9wbnMIgH41msoaXkO8mihRkBu6Ngp412a0iVR
 QUdfx2bIzKpBUw2qpYByz/TfawjHQ0XRvMjkDIT1RxrPRQK6SVgYLUlIr
 3++kVIBcc7iMWq7mPMuMmMYkvvVXFiT07XUdoZF093Cp+I+MtEXVVHGaD
 7Wly7KxYcQX7rljLIKfLyAeBOfWHXlOp15fLA8PxYS2RXLX3FkyfVnRVA w==;
X-IronPort-AV: E=Sophos;i="5.88,373,1635177600"; d="scan'208";a="304974651"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 16 Feb 2022 14:31:43 +0800
IronPort-SDR: RdZWScatkGWCvNNu4XN/ISdAwI8Fd4UAK4tsXt8eCEbqj9apr/4Q3wtKn+eiJVHhtPGiYWpTww
 f33pDXzh1F2zRYmIoDaC8KGz1zzLykw7YC72qwDvA6lkwPkzUWCDKtoDvXavO9DmU5EiS5YV/t
 kauz1EfKrs5iimXQU5VdCBMYvxSaWcox6xSuhGPs9wCQCpeUMhnwc8wHfAPjOWyPoNEv3o58sk
 Sxg8zt8uUUCtpp3zrW2r8FR3oJfPriEYAfmxw2ygGTbTNcLNTTFmHX0Uparb4CxlE5olH+7pQJ
 LFCcrj/IWGV9+8IuQOKsbudG
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 22:03:24 -0800
IronPort-SDR: hgbQ9lDp6ZECsMRHzfBqBmbLp8XzWX1DgWAtmnfuVuZtNsZ7ZBE9Oj1L261ldUjeHmYwPCzAUv
 Q5l1fkEdEO9EfZ5c7UZo31rzvSPgadhrjnMmk8bNJ5+XqAHt/coufhVYTOPydCYm448kJqwX3q
 owtTW+CoU0juVyDPMVmACdpgwtHcMdATSlp6AdKWkMeB768kkFJMhyDTrLFWd1j1Vto3zQuPzf
 yYkPMI6Q3Rfnnw4xSNdqMlGgqom6Sj39JE2UtN70Xsm9Em+HAp3LjYP8ibIGAaXJckGTWzDPWZ
 ZiE=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 22:31:44 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Jz7Ql39rlz1Rwrw
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 22:31:43 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1644993102; x=1647585103; bh=xBwofrwi48pVPtDFWu
 xDh/a2BN1h2L8su5YfJ1V9v60=; b=hcRjkcZq0jT1xtpE1fIkgr2f5lzJoVNcUk
 WcjU2xTlSslIUjlrj7fXhRiBRj8ZlYNr9ztPpfTf4fK/P+eK+F3usVU7d13sfSE+
 MT323WK3be2de3Lg/T0Q0fsMZMOVS49OuDDR4ArBFwWMkHxoQeJHWjZDNsvpd9Ij
 FK77SE0tjAuLYMzt2ik8gCG+cZbXD2K3OHonSl+hfiO6hwItASsrCkOskBAdwT4o
 xd0+YZ5dGpfUpEXg09pmlfkHerMa+r6t5lU6rM1tTSuaT7x9oRx0pPTzdRKixjmZ
 doukGLWaSda2qqHaPO+Ax737fZQ8dVU5u7GDVnrUCt2MZuSSDUog==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id ALOP6FKLMM_H for <qemu-devel@nongnu.org>;
 Tue, 15 Feb 2022 22:31:42 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.97])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Jz7Qf57sxz1SHwl;
 Tue, 15 Feb 2022 22:31:38 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Guo Ren <ren_guo@c-sky.com>,
 Liu Zhiwei <zhiwei_liu@c-sky.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [PULL v2 30/35] target/riscv: Ignore reserved bits in PTE for RV64
Date: Wed, 16 Feb 2022 16:29:07 +1000
Message-Id: <20220216062912.319738-31-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220216062912.319738-1-alistair.francis@opensource.wdc.com>
References: <20220216062912.319738-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=039576d22=alistair.francis@opensource.wdc.com;
 helo=esa1.hgst.iphmx.com
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


