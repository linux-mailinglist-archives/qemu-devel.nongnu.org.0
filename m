Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E525333C1
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 01:03:03 +0200 (CEST)
Received: from localhost ([::1]:47278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntdYM-0001tP-MB
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 19:03:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1363756b6=alistair.francis@opensource.wdc.com>)
 id 1ntdHP-0008Hw-Ru
 for qemu-devel@nongnu.org; Tue, 24 May 2022 18:45:31 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:62510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1363756b6=alistair.francis@opensource.wdc.com>)
 id 1ntdHO-0002sH-2Z
 for qemu-devel@nongnu.org; Tue, 24 May 2022 18:45:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1653432329; x=1684968329;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=01+2gQafXHXAH8DLR3SOqCtHNtEwqLBrW4OqHDOwtfY=;
 b=n9Ppy/9OThMru+M1LsAQyiOs7qUsAVNxGJXomEH3BAiZ6fFOW3jOrkxF
 DYozGCD/LhEZikd+BJASFMFZH9P/vWxMmp3yyW65bqmp0tmyBTXbPsEX7
 TI7OBELRh6dKBhuAioQ4T2mOulryvvIURVdICsvEMF55+ACET3vQCSl8a
 qgNlS+wk4tErpqxz65EGMlXhGf1n61DDxAl3VHQXlP7V1KAzU0vXQ25K5
 topOoS9zNa7DKLaMpNcJ6oyOGVBESdW34u/+HB5lVdltfhpzg/pau31Wk
 JQVytNN8KwCgjKpxfLZYBdOxFSRJC+SpJIboTXCcDH/m8O+TB80MEPazD w==;
X-IronPort-AV: E=Sophos;i="5.91,250,1647273600"; d="scan'208";a="305566696"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 25 May 2022 06:45:17 +0800
IronPort-SDR: 1ICC2nmRIlFx2EYYBBJCbRgHZ2ezGhW99YgGSOF/SRCwrmgf0aPSNDLdiqqxQrsbx0XN/e+v3N
 xuhqUz3NGp8C02P53JHJAz+/3mpQWIcFqxi1t9T15WM5rMGXcmSv0gtC7u8flm7a7FMIwgZNrE
 vj2cHnyfyYAQu+0Vw4wvMDbRXk94GpgeEvOEdC+NZEZ7tVBxnQ/AzNaQZyJyWI/yP+BsqBMh2p
 0yKlay5WAEiPAgc8xCr5HGVXOlKan3YXfU00r/WEzNU+hqGgb6KVCnUTsAH0SDo7vm7pCmqda4
 YcZwXLlZWNXq09owS+Ji30n/
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 May 2022 15:04:49 -0700
IronPort-SDR: 5PR9RqPBD27WGi0Bdsf9OSg5wvRHB2s4dTNwuTc9TCz+hny5eY+lCklhoct0qfcuvoev12+ChA
 c8dh957/gGb0vKo93VokII9jF0qvJ/kJA94OoNC1qrXaZEX62JLvhoVeFqwm70peIsgd28wXDt
 F8/BWV/2sSZ4QxvB2DaYkXZvICfKwdkuL9uyMZ5mW+KdJL55BVx8xdpyP7B2KVY/0yuWyGOu0p
 BsCWumkToosRo8WzYHQ+XWzfXTEKbuxXQe8k6g2QOTjoSPijvSCgtImuVXPEo11mvf/6v92bYl
 JqA=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 May 2022 15:45:18 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4L78RK4bgRz1Rvlx
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 15:45:17 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1653432317; x=1656024318; bh=01+2gQafXHXAH8DLR3
 SOqCtHNtEwqLBrW4OqHDOwtfY=; b=HZcdOQzDTy4yO3YTT5UH73OSTm180LNHWM
 HWjKCy+YhYGvOCb0AGy6+awlup+KzYgred01UHNRqVNp2kphyQyXUAyyAaqtBj00
 9PjUVnJtIlTcJeyDuFrMU36rH585z3tdg2CuMagbWVZe5Iffp5o/SdDCiuJYsCub
 lrKCNrOi8CaIpj5auGhQyw+nIv0V9vCgSH52pHDJbxvAtDgqmZO2ramq1Sb0Pwwg
 wRmWi723DJaOdZu+SlwSfPRQSm9deJDdZe/HHUZfEYh0JI3RyPr35+PeLCuwOt5E
 eDmIfOxV5M2ij6my2nq9c+pvbYlk1VbRPWW8fT7ZcXJXTMPPV0CA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id UUB_W7A0jakc for <qemu-devel@nongnu.org>;
 Tue, 24 May 2022 15:45:17 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.5])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4L78RH35GXz1Rvlc;
 Tue, 24 May 2022 15:45:15 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 16/23] target/riscv: Fix typo of mimpid cpu option
Date: Wed, 25 May 2022 08:44:21 +1000
Message-Id: <20220524224428.552334-17-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220524224428.552334-1-alistair.francis@opensource.wdc.com>
References: <20220524224428.552334-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=1363756b6=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
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

From: Frank Chang <frank.chang@sifive.com>

"mimpid" cpu option was mistyped to "mipid".

Fixes: 9951ba94 ("target/riscv: Support configuarable marchid, mvendorid,=
 mipid CSR values")
Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220523153147.15371-1-frank.chang@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h | 2 +-
 target/riscv/cpu.c | 4 ++--
 target/riscv/csr.c | 8 ++++----
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index f5ff7294c6..44975e3e5a 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -408,7 +408,7 @@ struct RISCVCPUConfig {
=20
     uint32_t mvendorid;
     uint64_t marchid;
-    uint64_t mipid;
+    uint64_t mimpid;
=20
     /* Vendor-specific custom extensions */
     bool ext_XVentanaCondOps;
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 87e1eddce6..fe8ceb4133 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -37,7 +37,7 @@
 #define RISCV_CPU_MARCHID   ((QEMU_VERSION_MAJOR << 16) | \
                              (QEMU_VERSION_MINOR << 8)  | \
                              (QEMU_VERSION_MICRO))
-#define RISCV_CPU_MIPID     RISCV_CPU_MARCHID
+#define RISCV_CPU_MIMPID    RISCV_CPU_MARCHID
=20
 static const char riscv_single_letter_exts[] =3D "IEMAFDQCPVH";
=20
@@ -869,7 +869,7 @@ static Property riscv_cpu_properties[] =3D {
=20
     DEFINE_PROP_UINT32("mvendorid", RISCVCPU, cfg.mvendorid, 0),
     DEFINE_PROP_UINT64("marchid", RISCVCPU, cfg.marchid, RISCV_CPU_MARCH=
ID),
-    DEFINE_PROP_UINT64("mipid", RISCVCPU, cfg.mipid, RISCV_CPU_MIPID),
+    DEFINE_PROP_UINT64("mimpid", RISCVCPU, cfg.mimpid, RISCV_CPU_MIMPID)=
,
=20
     DEFINE_PROP_BOOL("svinval", RISCVCPU, cfg.ext_svinval, false),
     DEFINE_PROP_BOOL("svnapot", RISCVCPU, cfg.ext_svnapot, false),
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 4ea7df02c9..0d5bc2f41d 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -674,13 +674,13 @@ static RISCVException read_marchid(CPURISCVState *e=
nv, int csrno,
     return RISCV_EXCP_NONE;
 }
=20
-static RISCVException read_mipid(CPURISCVState *env, int csrno,
-                                 target_ulong *val)
+static RISCVException read_mimpid(CPURISCVState *env, int csrno,
+                                  target_ulong *val)
 {
     CPUState *cs =3D env_cpu(env);
     RISCVCPU *cpu =3D RISCV_CPU(cs);
=20
-    *val =3D cpu->cfg.mipid;
+    *val =3D cpu->cfg.mimpid;
     return RISCV_EXCP_NONE;
 }
=20
@@ -3372,7 +3372,7 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {
     /* Machine Information Registers */
     [CSR_MVENDORID] =3D { "mvendorid", any,   read_mvendorid },
     [CSR_MARCHID]   =3D { "marchid",   any,   read_marchid   },
-    [CSR_MIMPID]    =3D { "mimpid",    any,   read_mipid     },
+    [CSR_MIMPID]    =3D { "mimpid",    any,   read_mimpid    },
     [CSR_MHARTID]   =3D { "mhartid",   any,   read_mhartid   },
=20
     [CSR_MCONFIGPTR]  =3D { "mconfigptr", any,   read_zero,
--=20
2.35.3


