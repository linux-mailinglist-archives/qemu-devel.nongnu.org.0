Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E27E45098A2
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 09:07:46 +0200 (CEST)
Received: from localhost ([::1]:42132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhQuk-0006M5-8u
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 03:07:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=10363b772=alistair.francis@opensource.wdc.com>)
 id 1nhQRH-0005C1-AO
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 02:37:15 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:13328)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=10363b772=alistair.francis@opensource.wdc.com>)
 id 1nhQRF-0007xM-K2
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 02:37:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1650523033; x=1682059033;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FrQXpr5Vxfb8nWiDsJDGy1Vhs7NRhjml2Jwy5spgypw=;
 b=rZlitVFh8taDHArq0HCkIAX/bjAgmjGF1NwApRjZZWUJYOWbArDjor53
 MiCwl6ACtxltC1IG91I9BnsyLQNy9BFB5u7iF3Rbv8dIxGayHWk+wsNOb
 +wq6pwZ2s9q03pSMoAWJ17taCyVDnxO+flWtY8Hi6v6821H6Cm4+i3RRW
 Ynnhg1BQ6hFuFO/srKEfY2efIRAu231e2tb67O7NUogMR0tnr0ffoa/bj
 UNjivf0ND+uc/m3PDCJsrtSVdLeN8R7BoBma/XSjiAuSOlP51NLRjyl3h
 7nCIIEcGV7NUbMkBIo6Lu9s/Th9KpHVULa893PQMrAcJYAloBs6e2BSCK w==;
X-IronPort-AV: E=Sophos;i="5.90,278,1643644800"; d="scan'208";a="302639956"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 21 Apr 2022 14:37:12 +0800
IronPort-SDR: fUmdYeU4aJE5/W/OOzE5A302kaKrxMXI6RtwjnordwoUJCtaOsyJP0spuZk+uWcrOAQ9Zpaj9p
 TceSR0yiBYRPHW9hNXeHv9ziH0OXoyxfo24HP99H2mGbAk4YySOFsA2Hwmg0yHQOxfQ6hR9ZXP
 oCBsfSjYOTJU+w00vVjlOpgNRvLHixX/unuk6X9M9fPJ53ioYRhmPV+7bxvnFpwh7iOpxkuYvk
 pt2E485cAj+dXt32/CX4t8q6A+8i3VrKgXjB6zY6OQ19Zk3wRw91DyfkGWlS2PlRO2pPBfp9v/
 40lCESEv+7tTHpgUIzgXVEnH
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Apr 2022 23:08:14 -0700
IronPort-SDR: yfs/kuXnNyq7LEgydR9EYwDLsN8PRFJubzmhlHuDzD96ASrPOSukHnYUmzZCCaRIXfhTzWnz3j
 ZPxhgLx4TOFXItpdCMzr9JAZJXHhR7lWrPJs6qeNbbmtzj1HlnmOhZYzvyKPnN95e87pSZ26/F
 2g1uMeLYltUw3Sr/5/wa5qFP95X56GTzIvIn0xlEMZl7L4q49EH8ibsdidyCwSORt4XvOSlYBG
 IKMNJl+TjSdNyCX1KVC8Q0IoCd+OEv5Fe//WRX7JERWcIdaC5wJoitZ0nev4HG5hn9MlgpwX2W
 nAM=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Apr 2022 23:37:13 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KkSWX1788z1Rvlx
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 23:37:12 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1650523031; x=1653115032; bh=FrQXpr5Vxfb8nWiDsJ
 DGy1Vhs7NRhjml2Jwy5spgypw=; b=PLNcOUQPt5Xtp5B4BPBOAvMoXZ8YcLKBKR
 YruDVyUe63sc8GTqstGqtH5juVCkQ7DtTw8tpzMf9eWTn7+7fR1ECEPL4nbLl1oX
 EUU0cgEyEQqfNKgR3mnhTseDsooRNXFDEihZoXHV6o2IHlQ9TW92R1lpAcoCex2i
 Id5hKmoSDaGofzCp5oRcIErfHUk5cKi0FiYQ3WuDMpkwm4/EQ7mX3gXwnE+OWxi6
 ElRBf97yh/EE5XG1BhJFAPIBfQ5rdW/I2lKmiExKJzbf0NqEBeo11PrDIHRORUfT
 Q/xgGmJyzAbbEMuR556qj9r7VtBdsHF+oeAmAHeWGzygP1zHHz9w==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id xJuhrP3Ub1gs for <qemu-devel@nongnu.org>;
 Wed, 20 Apr 2022 23:37:11 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.119])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KkSWT6jFKz1SVp1;
 Wed, 20 Apr 2022 23:37:09 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Atish Patra <atishp@rivosinc.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 08/31] target/riscv: Enable privileged spec version 1.12
Date: Thu, 21 Apr 2022 16:36:07 +1000
Message-Id: <20220421063630.1033608-9-alistair.francis@opensource.wdc.com>
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

From: Atish Patra <atishp@rivosinc.com>

Virt machine uses privileged specification version 1.12 now.
All other machine continue to use the default one defined for that
machine unless changed to 1.12 by the user explicitly.

This commit enforces the privilege version for csrs introduced in
v1.12 or after.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
Message-Id: <20220303185440.512391-7-atishp@rivosinc.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 8 +++++---
 target/riscv/csr.c | 5 +++++
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index ddda4906ff..c3fd018ecb 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -150,7 +150,7 @@ static void riscv_any_cpu_init(Object *obj)
 #elif defined(TARGET_RISCV64)
     set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVU);
 #endif
-    set_priv_version(env, PRIV_VERSION_1_11_0);
+    set_priv_version(env, PRIV_VERSION_1_12_0);
 }
=20
 #if defined(TARGET_RISCV64)
@@ -503,7 +503,9 @@ static void riscv_cpu_realize(DeviceState *dev, Error=
 **errp)
     }
=20
     if (cpu->cfg.priv_spec) {
-        if (!g_strcmp0(cpu->cfg.priv_spec, "v1.11.0")) {
+        if (!g_strcmp0(cpu->cfg.priv_spec, "v1.12.0")) {
+            priv_version =3D PRIV_VERSION_1_12_0;
+        } else if (!g_strcmp0(cpu->cfg.priv_spec, "v1.11.0")) {
             priv_version =3D PRIV_VERSION_1_11_0;
         } else if (!g_strcmp0(cpu->cfg.priv_spec, "v1.10.0")) {
             priv_version =3D PRIV_VERSION_1_10_0;
@@ -518,7 +520,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error=
 **errp)
     if (priv_version) {
         set_priv_version(env, priv_version);
     } else if (!env->priv_ver) {
-        set_priv_version(env, PRIV_VERSION_1_11_0);
+        set_priv_version(env, PRIV_VERSION_1_12_0);
     }
=20
     if (cpu->cfg.mmu) {
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 84a398b205..8b6a1b90f1 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -2975,6 +2975,7 @@ static inline RISCVException riscv_csrrw_check(CPUR=
ISCVState *env,
 {
     /* check privileges and return RISCV_EXCP_ILLEGAL_INST if check fail=
s */
     int read_only =3D get_field(csrno, 0xC00) =3D=3D 3;
+    int csr_min_priv =3D csr_ops[csrno].min_priv_ver;
 #if !defined(CONFIG_USER_ONLY)
     int effective_priv =3D env->priv;
=20
@@ -3007,6 +3008,10 @@ static inline RISCVException riscv_csrrw_check(CPU=
RISCVState *env,
         return RISCV_EXCP_ILLEGAL_INST;
     }
=20
+    if (env->priv_ver < csr_min_priv) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
     return csr_ops[csrno].predicate(env, csrno);
 }
=20
--=20
2.35.1


