Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 450DC5E72BD
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 06:15:16 +0200 (CEST)
Received: from localhost ([::1]:56816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oba5r-0006g7-4P
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 00:15:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2580c328f=alistair.francis@opensource.wdc.com>)
 id 1obZyS-0001iV-U7
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 00:07:38 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:63924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2580c328f=alistair.francis@opensource.wdc.com>)
 id 1obZyP-0005cr-4K
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 00:07:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1663906053; x=1695442053;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=b02/TLqgF0kTES/41rCHOv0/nTxWSCUUk8n7CI4Sep4=;
 b=EK/rHMqaSfsncPhu6dd5nNsoGZGHyC93gjoShRhEQLfJkMeq0yjJH/mP
 UApZhXczD3PgP+eeJi5ibcIekMx18H44a5gYkEv8CLj+vAqb6fsxZUULg
 HCQ20tbyZvule8HaieEYwOPbaa2ofT54Y569vJBbKi5o1ikn7479Jlsh8
 wjWFaa3WGzMJZfhAZytTvcz3J42RmHnfg14vDGLNjs1eCLQJrfzR0/6DQ
 2OVgkiDbxSswEkAIEl4jC24kcNqGkWHdpQx1mayL4oqumuypaNUiiFUz+
 PcH6Rj9RWjP+KeuuMiZ5gSHeFn1ceSV6kxwjG8fbKKfY2+ihRS+bFSx5d Q==;
X-IronPort-AV: E=Sophos;i="5.93,337,1654531200"; d="scan'208";a="212510475"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 23 Sep 2022 12:07:32 +0800
IronPort-SDR: kAhrAUelKwpMv8iyJNGB0Vfnn85EIz9mR7LWyHqGdxPLKsO52x/wELznqzKEtZmN4UVZrfzIPv
 w38BDC502i/vOYH1buBN6rPGOrifqRzjTyWIXkng0lCzIYmM+Qs4/ptDdkf8pV50P64gHpeXnI
 8z9n+rTFTh7u25p8Dib0H4BURPWwX3h8aq6fgCXqwm5FSmnbSJGFtmU2ToO9iPAYmkOlOMbgL4
 vVPixiF1zQL53rcir4UrVGTmvuCcnvfsGB3JE1TmwLurL45cmlhajEpmjVUbddGjutjoMTQw38
 lVfTVVuhz0bnPcHPSyENNyy8
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Sep 2022 20:27:34 -0700
IronPort-SDR: 2PzWZDTbODSc+BAH91BsHZEAIv/S2TzNsjwhYu8BuGcqgREVe9KVAsejricVM7A7JjayyqzhJU
 35eQ15I+QrEONq1K18QrZJ9Kn5gfcJlo3+GKYZ/PaB8lLgId+gLhxE0H2mWDTVNGJw+dYrGLoh
 nnoA8d6k7EJFm82RbqxN7nIbkTn/T7b1+t37bgFAfakLPt4J3Orm5IsZbKuNvJg5W5Z5jOChT9
 K1S8XJT5NsF3kO0XSknoQTLDT+seFd8GcSq+BtO68Di0zCP7LkwXTGH8U/BLbr4P+hh67Wmpqr
 IUM=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Sep 2022 21:07:32 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4MYdsJ15zRz1RwqL
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 21:07:32 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1663906051; x=1666498052; bh=b02/TLq
 gF0kTES/41rCHOv0/nTxWSCUUk8n7CI4Sep4=; b=YQ4HWFw6+uoJ2K9vrwigIuc
 Zcc0q4K74UhbiwwM9+ckX9XxgF/het6O/AlaC6EmiBHfeG4yRvwEtjNeE6wL05df
 ERF3MGwe0JrgZc9/Vc3JkDCPDxfUsDynypsjawUR97htVnc5ML7ZHIKRaiHeBKiT
 z+gChjvTQTYjmjDQGfwtZ8mC+b+OLV+C6DCiu9TZahWwgBVAzlqD0GHz4KjYDUKO
 eyc1eKdpHxI+WnuFtgU/IAACWGBp+98CFF4wSln73v/fFTburG22TB5Qg8v3n+NA
 /wGLUYuteOnCE7HAEFzTEk6SQ+4jlG22nLwrYn/RqPFMEl10SEE5oNSrSG+K3SA=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id km206DJWfQNa for <qemu-devel@nongnu.org>;
 Thu, 22 Sep 2022 21:07:31 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.167.114])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4MYdsG1f2lz1RvTr;
 Thu, 22 Sep 2022 21:07:29 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 08/12] target/riscv: Set the CPU resetvec directly
Date: Fri, 23 Sep 2022 14:07:00 +1000
Message-Id: <20220923040704.428285-9-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220923040704.428285-1-alistair.francis@opensource.wdc.com>
References: <20220923040704.428285-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=2580c328f=alistair.francis@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
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

From: Alistair Francis <alistair.francis@wdc.com>

Instead of using our properties to set a config value which then might
be used to set the resetvec (depending on your timing), let's instead
just set the resetvec directly in the env struct.

This allows us to set the reset vec from the command line with:
    -global driver=3Driscv.hart_array,property=3Dresetvec,value=3D0x20000=
400

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Message-Id: <20220914101108.82571-2-alistair.francis@wdc.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h     |  3 +--
 target/riscv/cpu.c     | 13 +++----------
 target/riscv/machine.c |  6 +++---
 3 files changed, 7 insertions(+), 15 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 06751e1e3e..22344a620b 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -190,7 +190,7 @@ struct CPUArchState {
     /* This contains QEMU specific information about the virt state. */
     target_ulong virt;
     target_ulong geilen;
-    target_ulong resetvec;
+    uint64_t resetvec;
=20
     target_ulong mhartid;
     /*
@@ -474,7 +474,6 @@ struct RISCVCPUConfig {
     bool pmp;
     bool epmp;
     bool debug;
-    uint64_t resetvec;
=20
     bool short_isa_string;
 };
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index aee14a239a..b29c88b9f0 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -228,13 +228,6 @@ static void set_vext_version(CPURISCVState *env, int=
 vext_ver)
     env->vext_ver =3D vext_ver;
 }
=20
-static void set_resetvec(CPURISCVState *env, target_ulong resetvec)
-{
-#ifndef CONFIG_USER_ONLY
-    env->resetvec =3D resetvec;
-#endif
-}
-
 static void riscv_any_cpu_init(Object *obj)
 {
     CPURISCVState *env =3D &RISCV_CPU(obj)->env;
@@ -336,7 +329,6 @@ static void rv32_imafcu_nommu_cpu_init(Object *obj)
=20
     set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVC | RVU);
     set_priv_version(env, PRIV_VERSION_1_10_0);
-    set_resetvec(env, DEFAULT_RSTVEC);
     cpu->cfg.mmu =3D false;
 }
 #endif
@@ -676,7 +668,6 @@ static void riscv_cpu_realize(DeviceState *dev, Error=
 **errp)
         riscv_set_feature(env, RISCV_FEATURE_DEBUG);
     }
=20
-    set_resetvec(env, cpu->cfg.resetvec);
=20
 #ifndef CONFIG_USER_ONLY
     if (cpu->cfg.ext_sstc) {
@@ -1079,7 +1070,9 @@ static Property riscv_cpu_properties[] =3D {
     DEFINE_PROP_UINT64("marchid", RISCVCPU, cfg.marchid, RISCV_CPU_MARCH=
ID),
     DEFINE_PROP_UINT64("mimpid", RISCVCPU, cfg.mimpid, RISCV_CPU_MIMPID)=
,
=20
-    DEFINE_PROP_UINT64("resetvec", RISCVCPU, cfg.resetvec, DEFAULT_RSTVE=
C),
+#ifndef CONFIG_USER_ONLY
+    DEFINE_PROP_UINT64("resetvec", RISCVCPU, env.resetvec, DEFAULT_RSTVE=
C),
+#endif
=20
     DEFINE_PROP_BOOL("short-isa-string", RISCVCPU, cfg.short_isa_string,=
 false),
=20
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index 41098f6ad0..c4e6b3bba4 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -308,8 +308,8 @@ static const VMStateDescription vmstate_pmu_ctr_state=
 =3D {
=20
 const VMStateDescription vmstate_riscv_cpu =3D {
     .name =3D "cpu",
-    .version_id =3D 4,
-    .minimum_version_id =3D 4,
+    .version_id =3D 5,
+    .minimum_version_id =3D 5,
     .post_load =3D riscv_cpu_post_load,
     .fields =3D (VMStateField[]) {
         VMSTATE_UINTTL_ARRAY(env.gpr, RISCVCPU, 32),
@@ -331,7 +331,7 @@ const VMStateDescription vmstate_riscv_cpu =3D {
         VMSTATE_UINT32(env.features, RISCVCPU),
         VMSTATE_UINTTL(env.priv, RISCVCPU),
         VMSTATE_UINTTL(env.virt, RISCVCPU),
-        VMSTATE_UINTTL(env.resetvec, RISCVCPU),
+        VMSTATE_UINT64(env.resetvec, RISCVCPU),
         VMSTATE_UINTTL(env.mhartid, RISCVCPU),
         VMSTATE_UINT64(env.mstatus, RISCVCPU),
         VMSTATE_UINT64(env.mip, RISCVCPU),
--=20
2.37.3


