Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6B9564373
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jul 2022 02:23:50 +0200 (CEST)
Received: from localhost ([::1]:45724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7nOv-0002zy-F4
	for lists+qemu-devel@lfdr.de; Sat, 02 Jul 2022 20:23:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=176813b30=alistair.francis@opensource.wdc.com>)
 id 1o7nEU-0008NF-3z
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 20:13:03 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:46152)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=176813b30=alistair.francis@opensource.wdc.com>)
 id 1o7nEP-0001pZ-TQ
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 20:13:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1656807177; x=1688343177;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=F7to0UWjjt5Pk0ojr+uQDLDz+6a/Avq+GVpGx/8qt7U=;
 b=PPnRF4vmPgulHmROOzwNGk64RgW4JaU8bs6DT0VRGSbqfeAu+RfXaYej
 hnF40QBSsTsY9qGWgniIcWmkewoYNpx7zeqrCNAen06qxU5xUpWnSqal/
 HGrwQ3V7iKbnuPy+YlxKUn5Z9blGcMGcJbRegbct4NQbe+ytTPJds8exP
 3SSIiOvmUTQQHKyzG+M7U2IFTy7jZdkvtd53+s1BhCf4dUHQQUJRq2yyB
 LRRjlzLvstnPys1RN+nmOLTMwHjg4XewHi/wS5cckZeNLwtBCsCaFUQiR
 0yRfhuhwmCd74sqkktwuIMBKr3s9ICciXJVm9fuc9EGXOLcb5NsnAoUZJ w==;
X-IronPort-AV: E=Sophos;i="5.92,241,1650902400"; d="scan'208";a="204667239"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 03 Jul 2022 08:12:56 +0800
IronPort-SDR: hH8HNqzfFmL9bb+XeK5k+4/czOljbBtk/H2d8u/SOsOYYXpkp0iGyHFwAzSAxi99tZDrNH6u68
 HrtJNFGg37PHVO5pTPqLeop8eov0qEmo5x869swDudp2Jp/CaAlf5YgZrYa3RLMkAYI76R5r7y
 rSEVACvScDR7uXhuNHG5a1EoKCrPBAGFKPCbON27iLXd+Le5LRbQdNi+uTg+zJ1agb3LHATl1W
 6dsaK0BMSnjoNvPhNNO0sjAVqOioRhl77WuIz5eshvfMYtRKUlZkJ8dvAs6MkJX5Ed0YTOsps7
 jt65zoz+Myy3IdBWIkBQH0G2
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Jul 2022 16:30:18 -0700
IronPort-SDR: D+7MOoKiHprATPiOBJK8xoDVzbx9AUPJaQ+g2j4kQrZyBs2SBqdeegB1BjnGeYiJWs98qLfsvL
 lJk04+T+QlZD5+uQjc13nDu9+MOHOFvZRFO2ddwaSbX/P6TcEoLhRftQHQ8ER+9E5y/0Iq9niF
 U4Q8/Y/QIFMdwzMppIz4Ep7A8KWyPoLaG5J8gYZ8KphObe/VzJJGsv3oY4uCvIgO+QbyyhiCJb
 8634pdmaaqrk1ogzzIeie4m6NexTMLmUuPayj4dcJc9cHgKRcE9bHbUN/1FAHtEbVFXBxTOlFs
 Yq0=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Jul 2022 17:12:57 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Lb8XS3sLpz1Rwnl
 for <qemu-devel@nongnu.org>; Sat,  2 Jul 2022 17:12:56 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1656807175; x=1659399176; bh=F7to0UWjjt5Pk0ojr+
 uQDLDz+6a/Avq+GVpGx/8qt7U=; b=Epl91g8KF2T4D8DzDUOvCVVAEnsoW0hbgp
 pw5YN1PrT8ZMmSsmnC5gPHcK81Lw19QpkLKY06BqKml5YrBueC3xLIKyDPunaaHH
 Pw7jvfcYK66gVzbBA9H5lqHLp9C7aSRLAcfQQfOLcPbBdOuxbmG0VEmeNOx+ViRD
 SduKhP5zQEyR4Yyk272buV1fft4ygXOoaNUOLj69S5mAFIh9wr6uWhZPFEfBQ7RH
 GTP5Sq1Q/f+fAtkqloZ6Cmrk8dmuv3DPXN+YZ91pKFo0IajjtsUaS6a7Jd71fs+X
 M19by4ZmY7O7uHg0EkC1bTlw9DbwTt0OwQ45PaLvdXfvd9CNGiGA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 8-YRti9nUvSb for <qemu-devel@nongnu.org>;
 Sat,  2 Jul 2022 17:12:55 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.167.123])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Lb8XP6XNYz1Rwnx;
 Sat,  2 Jul 2022 17:12:53 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Atish Patra <atish.patra@wdc.com>,
 Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 Atish Patra <atishp@rivosinc.com>
Subject: [PULL v2 08/19] target/riscv: pmu: Rename the counters extension to
 pmu
Date: Sun,  3 Jul 2022 10:12:23 +1000
Message-Id: <20220703001234.439716-9-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220703001234.439716-1-alistair.francis@opensource.wdc.com>
References: <20220703001234.439716-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=176813b30=alistair.francis@opensource.wdc.com;
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

From: Atish Patra <atish.patra@wdc.com>

The PMU counters are supported via cpu config "Counters" which doesn't
indicate the correct purpose of those counters.

Rename the config property to pmu to indicate that these counters
are performance monitoring counters. This aligns with cpu options for
ARM architecture as well.

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Atish Patra <atish.patra@wdc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
Message-Id: <20220620231603.2547260-4-atishp@rivosinc.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h | 2 +-
 target/riscv/cpu.c | 4 ++--
 target/riscv/csr.c | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 7d6397acdf..252c30a55d 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -397,7 +397,7 @@ struct RISCVCPUConfig {
     bool ext_zksed;
     bool ext_zksh;
     bool ext_zkt;
-    bool ext_counters;
+    bool ext_pmu;
     bool ext_ifencei;
     bool ext_icsr;
     bool ext_svinval;
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 05e6521351..1b57b3c439 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -851,7 +851,7 @@ static void riscv_cpu_init(Object *obj)
 {
     RISCVCPU *cpu =3D RISCV_CPU(obj);
=20
-    cpu->cfg.ext_counters =3D true;
+    cpu->cfg.ext_pmu =3D true;
     cpu->cfg.ext_ifencei =3D true;
     cpu->cfg.ext_icsr =3D true;
     cpu->cfg.mmu =3D true;
@@ -879,7 +879,7 @@ static Property riscv_cpu_extensions[] =3D {
     DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
     DEFINE_PROP_BOOL("v", RISCVCPU, cfg.ext_v, false),
     DEFINE_PROP_BOOL("h", RISCVCPU, cfg.ext_h, true),
-    DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
+    DEFINE_PROP_BOOL("pmu", RISCVCPU, cfg.ext_pmu, true),
     DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
     DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
     DEFINE_PROP_BOOL("Zfh", RISCVCPU, cfg.ext_zfh, false),
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 58d07c511f..0ca05c7788 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -74,8 +74,8 @@ static RISCVException ctr(CPURISCVState *env, int csrno=
)
     RISCVCPU *cpu =3D RISCV_CPU(cs);
     int ctr_index;
=20
-    if (!cpu->cfg.ext_counters) {
-        /* The Counters extensions is not enabled */
+    if (!cpu->cfg.ext_pmu) {
+        /* The PMU extension is not enabled */
         return RISCV_EXCP_ILLEGAL_INST;
     }
=20
--=20
2.36.1


