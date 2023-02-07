Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE47C68D068
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 08:16:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPI8k-0000cX-NI; Tue, 07 Feb 2023 02:11:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=395dd5341=alistair.francis@opensource.wdc.com>)
 id 1pPI8Z-0000OL-Ct
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 02:11:32 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=395dd5341=alistair.francis@opensource.wdc.com>)
 id 1pPI8X-0000FD-Lz
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 02:11:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1675753889; x=1707289889;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mivczXb3+jA3+/eUdSpQqT+Zxld8MCw7EIixk2IiFQU=;
 b=dp2wAGlOZBiBs+hmy4J4EPek7f6qjCBhhIBHaLikT19SsFx+ZpBFrkq5
 U2PPxskbF0RziahkD2q1hDJNsbGKSBCN+PG9MXZR7UpmifClljKiEh7Mv
 3ghO6Upx4lpiBCzkn8q0xMcUzu75E23im+pHd7KQHolv1qA9HHjPq63fj
 3S8AGMxfOAocaeWlvAyGwM9/PvTKM5EseT1AhYuiJ9mB4PC4kaH7NPrTp
 0dJWrKOY8udnkUnFAo0r06Q/H8RG7D72hnpLLzjeCijp8WATFyE+B5GLT
 eM3clA0/ZHX1W9b7qa9yS4QSTCzvEoFScciqvWGv31xpRDhQTHULql5tM Q==;
X-IronPort-AV: E=Sophos;i="5.97,278,1669046400"; d="scan'208";a="227657565"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 07 Feb 2023 15:10:41 +0800
IronPort-SDR: SjnZ3Pw6BHZba9A933KsTkXKCplDhMLrY/ugeczFUTXWrHxbnf7Qga9lhR4/LTJUoRTVuEsjko
 2mKziHE8T4roIeLCnJNetDEgo0+gg7bDt0uDkX8UoXdwETgiU8RZBILWoZ6ZOVKBDCylcFamUX
 rq8KFXdt2xF7OZA9e3WMSCUl4u+L4eIN3g4N2vDby2e2rSaHjQdy+YdTZ7CsWougQ9CgcKy6wa
 fjcnI3aDBfckJFsDNqS/JoIgzOsOwjelhtXXXPW14tH2grtOnMcxyxCOnYJhKXLm5v71ObnjvW
 KYI=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Feb 2023 22:27:58 -0800
IronPort-SDR: r22p8Mks+UQftVfx2CgQ3D5vu2bMgWEhOb5GgYuBGxbuyFhxJZA/K1f/xWjiap3x6hr7jjNCS/
 vUgP3+FnCAZKVr12T0YcLviiu9UHsIk4ruYyvh8b3bEndSeNafw3bPJKqZfc7uTykqw8QmEEVq
 AV2kgjl9WxjB6Dj6GXIg/xGoDz6vxpZI7ORuo87WwHRaUkc2NfQNP2i/OO03PnznywxgIdKQUV
 d7cITALSb55PBolvykthpqH1xgJl5BMRNEOAW20FBq1vLZpVjpiTMbxTZKpCzMYFlMrQ1PM0nx
 fWk=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Feb 2023 23:10:41 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4P9vRP3ZKSz1RwtC
 for <qemu-devel@nongnu.org>; Mon,  6 Feb 2023 23:10:41 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1675753840; x=1678345841; bh=mivczXb
 3+jA3+/eUdSpQqT+Zxld8MCw7EIixk2IiFQU=; b=JbuduKB9OVxGkuOqLi2EoSB
 tFxN6Yn5d5BcxDQPDCq4brFtQBrYRT8y6m/gpX5Ux70GsniCghlsFHqdDcgODvCK
 lGPG7wgOuE8rItyF4xOVqr0wZ2RcSgQyxpwcMSv+uyLXGZQBv3ZC82jPO3bCwNIM
 Z6fN8vfiSTgMLguO7LAFiQD3Ea4BG3y/qHWhpPzSFYhAglSWQCEa34ppUZYxWtkq
 aIaTh4hiQwAsb8L8q1zmMeaxKT6bYCmfR4NxRFhKRftlpXDJ8wQNcevbGi8aEEkb
 9zhJENBaQDMUYCnbMF0nqmyI3obYdr9UoksJWF8OE6MWg2VmdkGdeDjS5pj11ww=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 4i24gGRA_F9P for <qemu-devel@nongnu.org>;
 Mon,  6 Feb 2023 23:10:40 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.38])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4P9vRM2tfPz1Rwt8;
 Mon,  6 Feb 2023 23:10:39 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com,
 =?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 26/32] RISC-V: Add initial support for T-Head C906
Date: Tue,  7 Feb 2023 17:09:37 +1000
Message-Id: <20230207070943.2558857-27-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230207070943.2558857-1-alistair.francis@opensource.wdc.com>
References: <20230207070943.2558857-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=395dd5341=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Christoph M=C3=BCllner <christoph.muellner@vrull.eu>

This patch adds the T-Head C906 to the list of known CPUs.
Selecting this CPUs will automatically enable the available
ISA extensions of the CPUs (incl. vendor extensions).

Co-developed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Christoph M=C3=BCllner <christoph.muellner@vrull.eu>
Message-Id: <20230131202013.2541053-13-christoph.muellner@vrull.eu>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h          |  1 +
 target/riscv/cpu_vendorid.h |  6 ++++++
 target/riscv/cpu.c          | 31 +++++++++++++++++++++++++++++++
 3 files changed, 38 insertions(+)
 create mode 100644 target/riscv/cpu_vendorid.h

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 5cc3011529..60478f4a9c 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -53,6 +53,7 @@
 #define TYPE_RISCV_CPU_SIFIVE_E51       RISCV_CPU_TYPE_NAME("sifive-e51"=
)
 #define TYPE_RISCV_CPU_SIFIVE_U34       RISCV_CPU_TYPE_NAME("sifive-u34"=
)
 #define TYPE_RISCV_CPU_SIFIVE_U54       RISCV_CPU_TYPE_NAME("sifive-u54"=
)
+#define TYPE_RISCV_CPU_THEAD_C906       RISCV_CPU_TYPE_NAME("thead-c906"=
)
 #define TYPE_RISCV_CPU_HOST             RISCV_CPU_TYPE_NAME("host")
=20
 #if defined(TARGET_RISCV32)
diff --git a/target/riscv/cpu_vendorid.h b/target/riscv/cpu_vendorid.h
new file mode 100644
index 0000000000..a5aa249bc9
--- /dev/null
+++ b/target/riscv/cpu_vendorid.h
@@ -0,0 +1,6 @@
+#ifndef TARGET_RISCV_CPU_VENDORID_H
+#define TARGET_RISCV_CPU_VENDORID_H
+
+#define THEAD_VENDOR_ID         0x5b7
+
+#endif /*  TARGET_RISCV_CPU_VENDORID_H */
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 3078556f1b..8cbc5c9c1b 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -22,6 +22,7 @@
 #include "qemu/ctype.h"
 #include "qemu/log.h"
 #include "cpu.h"
+#include "cpu_vendorid.h"
 #include "pmu.h"
 #include "internals.h"
 #include "time_helper.h"
@@ -281,6 +282,35 @@ static void rv64_sifive_e_cpu_init(Object *obj)
     cpu->cfg.mmu =3D false;
 }
=20
+static void rv64_thead_c906_cpu_init(Object *obj)
+{
+    CPURISCVState *env =3D &RISCV_CPU(obj)->env;
+    RISCVCPU *cpu =3D RISCV_CPU(obj);
+
+    set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RV=
U);
+    set_priv_version(env, PRIV_VERSION_1_11_0);
+
+    cpu->cfg.ext_g =3D true;
+    cpu->cfg.ext_c =3D true;
+    cpu->cfg.ext_u =3D true;
+    cpu->cfg.ext_s =3D true;
+    cpu->cfg.ext_icsr =3D true;
+    cpu->cfg.ext_zfh =3D true;
+    cpu->cfg.mmu =3D true;
+    cpu->cfg.ext_xtheadba =3D true;
+    cpu->cfg.ext_xtheadbb =3D true;
+    cpu->cfg.ext_xtheadbs =3D true;
+    cpu->cfg.ext_xtheadcmo =3D true;
+    cpu->cfg.ext_xtheadcondmov =3D true;
+    cpu->cfg.ext_xtheadfmemidx =3D true;
+    cpu->cfg.ext_xtheadmac =3D true;
+    cpu->cfg.ext_xtheadmemidx =3D true;
+    cpu->cfg.ext_xtheadmempair =3D true;
+    cpu->cfg.ext_xtheadsync =3D true;
+
+    cpu->cfg.mvendorid =3D THEAD_VENDOR_ID;
+}
+
 static void rv128_base_cpu_init(Object *obj)
 {
     if (qemu_tcg_mttcg_enabled()) {
@@ -1371,6 +1401,7 @@ static const TypeInfo riscv_cpu_type_infos[] =3D {
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E51,       rv64_sifive_e_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U54,       rv64_sifive_u_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SHAKTI_C,         rv64_sifive_u_cpu_init),
+    DEFINE_CPU(TYPE_RISCV_CPU_THEAD_C906,       rv64_thead_c906_cpu_init=
),
     DEFINE_CPU(TYPE_RISCV_CPU_BASE128,          rv128_base_cpu_init),
 #endif
 };
--=20
2.39.1


