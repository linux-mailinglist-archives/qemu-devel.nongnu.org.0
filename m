Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 141F656436A
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jul 2022 02:18:16 +0200 (CEST)
Received: from localhost ([::1]:56638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7nJX-00089i-5H
	for lists+qemu-devel@lfdr.de; Sat, 02 Jul 2022 20:18:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=176813b30=alistair.francis@opensource.wdc.com>)
 id 1o7nF2-0000l2-Gn
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 20:13:36 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:46182)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=176813b30=alistair.francis@opensource.wdc.com>)
 id 1o7nF0-0001zT-LM
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 20:13:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1656807213; x=1688343213;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aBbkY/5eQz39KTBVgbT03tYExu0XWDBj7TWYoIjAih0=;
 b=TvJ5wPfLfckB0v/cl+Og+Q9VEB5jc3PCKqfqBofMaUmeVWa7RRJr/O7F
 Ar+fWUAyUwClzQmzlc+kKq+WZfHkF/iPumTEIwF+gwSUUrVKJ5Ukvlrh1
 neZmtSJmXDRSh8R3v1L5aOvZFF00mvqccdSjmZb0HNXoAeqR6lgpB9UNQ
 8qnlxX43eUKcMCZ/DN2d0gokIp+vG43cMSd403wywRaCY/ADfzZh0Iwc7
 mCBwd4DeQFOREtPbVtMxcUzEhu8QkMW1Jwmi2t3TSXMz2JXrC46ZpKXrv
 jeCN/ZKP70gamoP2RnGzTxxvzTOYPGxk8t4WMh+37296m5wmZrPVRjUDz Q==;
X-IronPort-AV: E=Sophos;i="5.92,241,1650902400"; d="scan'208";a="204667264"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 03 Jul 2022 08:13:12 +0800
IronPort-SDR: m6li6zP9HOkWDtc6Vdep+ETbXhdLlraXf9rKmqpBuQ4Qqb/UYOy3AMe5Mqcqq0ad2jpNUms0z0
 oAuFgxe7xgSvudFCDMk1g2yPWtNHmlr5HywZ2kK4xQFUGCDUvSc8W1wBR2m1HiZRFh0Amv+Mw+
 g1s6RxUBzD+CTeJOs4tY4kEEtMzWHJHlkmHNOapv0S/+0Z9ScES5V47iknsNWG0P7u3oZE4Of/
 yJv8FhXY4YGpoFRlAF0ZlTevjJyT3FJJyS3ZVpfMHn+UVYP/FgAeTwKs0gTLJuoKMaMQpX1Ecw
 1kWFS/VgpHBJ00zzfzOMb4uW
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Jul 2022 16:30:36 -0700
IronPort-SDR: KXHbc/djo14+Tn/99TIQhVaZPhkRYgaUci1Csh+d7T/hdPIkXnl4ooCLf2cGMoOV31+w3VX3DJ
 UrEDY8nOUMqWFui2OvoySBBPeUKJo/esgSDEagVbrvRDeBLVTUd+WptUHu5qsa2/fXdtE+TkXU
 02GyiP30XnzWcGVoiDhfQcgUqo9nhdgvgqwSVB0B2afxR5MC2xXtm9JPIMWfN+9f4J4jowjCaG
 yvmweRgedWyXc4m516cw5iyLj/5yFSEtAkmD7CUWZaVXdct/ZPfN/ySRndLsy2697qnaS5FGYb
 LyI=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Jul 2022 17:13:14 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Lb8Xn735qz1Rw4L
 for <qemu-devel@nongnu.org>; Sat,  2 Jul 2022 17:13:13 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1656807193; x=1659399194; bh=aBbkY/5eQz39KTBVgb
 T03tYExu0XWDBj7TWYoIjAih0=; b=jsHYT1/yt/XU7arDIZ+n6BBN418kl4Pb7o
 fk+NJdMgZpuGogrKvhVPv07rv69z2Jg4LMhEkMCCqyh56YsOTdLsYYCMUXlyb2fN
 jPHPAxWs8yzIrvjXXAKuJwzw5JPWhunVmRoKoEC6Olp7zWPdXVKHPM7ZNIFQp7MZ
 1CO6/cQXzXjyyRzAP+RnSL7iO0QPLYsV5sLmOk6vBbjszB+JcULBtQPYe2wTzTes
 yk5zTNNxcOxMVcG9DbToAfjL9kmcQIQ7dbcEbzQmvf0kqaY9QONibou4xuNzYc+S
 sUvrzYyI8yLuiMoAZRDzK7HO41xSB5gWxZb8bxiivCIXvVA07SyA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id u1SsZldSuRj1 for <qemu-devel@nongnu.org>;
 Sat,  2 Jul 2022 17:13:13 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.167.123])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Lb8Xl45XQz1Rwnl;
 Sat,  2 Jul 2022 17:13:11 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Anup Patel <apatel@ventanamicro.com>,
 Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Atish Patra <atishp@rivosinc.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [PULL v2 15/19] target/riscv: Don't force update priv spec version to
 latest
Date: Sun,  3 Jul 2022 10:12:30 +1000
Message-Id: <20220703001234.439716-16-alistair.francis@opensource.wdc.com>
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

From: Anup Patel <apatel@ventanamicro.com>

The riscv_cpu_realize() sets priv spec version to v1.12 when it is
when "env->priv_ver =3D=3D 0" (i.e. default v1.10) because the enum
value of priv spec v1.10 is zero.

Due to above issue, the sifive_u machine will see priv spec v1.12
instead of priv spec v1.10.

To fix this issue, we set latest priv spec version (i.e. v1.12)
for base rv64/rv32 cpu and riscv_cpu_realize() will override priv
spec version only when "cpu->cfg.priv_spec !=3D NULL".

Fixes: 7100fe6c2441 ("target/riscv: Enable privileged spec version 1.12")
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-Id: <20220611080107.391981-2-apatel@ventanamicro.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index aac0576fe1..1bb3973806 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -173,6 +173,8 @@ static void rv64_base_cpu_init(Object *obj)
     /* We set this in the realise function */
     set_misa(env, MXL_RV64, 0);
     register_cpu_props(DEVICE(obj));
+    /* Set latest version of privileged specification */
+    set_priv_version(env, PRIV_VERSION_1_12_0);
 }
=20
 static void rv64_sifive_u_cpu_init(Object *obj)
@@ -204,6 +206,8 @@ static void rv128_base_cpu_init(Object *obj)
     /* We set this in the realise function */
     set_misa(env, MXL_RV128, 0);
     register_cpu_props(DEVICE(obj));
+    /* Set latest version of privileged specification */
+    set_priv_version(env, PRIV_VERSION_1_12_0);
 }
 #else
 static void rv32_base_cpu_init(Object *obj)
@@ -212,6 +216,8 @@ static void rv32_base_cpu_init(Object *obj)
     /* We set this in the realise function */
     set_misa(env, MXL_RV32, 0);
     register_cpu_props(DEVICE(obj));
+    /* Set latest version of privileged specification */
+    set_priv_version(env, PRIV_VERSION_1_12_0);
 }
=20
 static void rv32_sifive_u_cpu_init(Object *obj)
@@ -524,7 +530,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error=
 **errp)
     CPURISCVState *env =3D &cpu->env;
     RISCVCPUClass *mcc =3D RISCV_CPU_GET_CLASS(dev);
     CPUClass *cc =3D CPU_CLASS(mcc);
-    int priv_version =3D 0;
+    int priv_version =3D -1;
     Error *local_err =3D NULL;
=20
     cpu_exec_realizefn(cs, &local_err);
@@ -548,10 +554,8 @@ static void riscv_cpu_realize(DeviceState *dev, Erro=
r **errp)
         }
     }
=20
-    if (priv_version) {
+    if (priv_version >=3D PRIV_VERSION_1_10_0) {
         set_priv_version(env, priv_version);
-    } else if (!env->priv_ver) {
-        set_priv_version(env, PRIV_VERSION_1_12_0);
     }
=20
     if (cpu->cfg.mmu) {
--=20
2.36.1


