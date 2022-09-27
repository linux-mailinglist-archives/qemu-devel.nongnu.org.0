Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2B85EBB64
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 09:20:49 +0200 (CEST)
Received: from localhost ([::1]:54942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od4tb-0002q4-83
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 03:20:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=262caef14=alistair.francis@opensource.wdc.com>)
 id 1od47r-00055Z-CH
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 02:31:27 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:44546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=262caef14=alistair.francis@opensource.wdc.com>)
 id 1od47o-0001Eu-Iq
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 02:31:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1664260284; x=1695796284;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=b02/TLqgF0kTES/41rCHOv0/nTxWSCUUk8n7CI4Sep4=;
 b=AtiesBOmznpfclccTtSmt/c7+ntk31BwPPfOhfI6ojN4EsrgJo0rTpwu
 apsJluDh0hCAcDa8/kBJl9FDwx+XsEEYJKaXNqpaQEy5FnYd3TqGi2tGG
 xan5aKVga2FiJH2D+yy8lHtoUQDoAtDrkPUEYbzL4GQpt+YuDquRtgkgE
 3qIDd/jHMxHJmfktp0qDoP4u8NvmDsvANmAuQYHYsooVvcBKcEDif1kQi
 Cvol5wlVMK9eYzNubM01dX2ORGKVtSli6phsqnILUGCzzgjkEgXyegPN9
 WGYsAPxtUtWZD2n1yuqc8juzABzYFUwzwGHt9mXrHNbvDEWxG1/h0ArpQ A==;
X-IronPort-AV: E=Sophos;i="5.93,348,1654531200"; d="scan'208";a="217530852"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 27 Sep 2022 14:31:23 +0800
IronPort-SDR: HyTT09ys2uNQl8w5PN6GZulkHH37ItNphW19nkUCR0wu3D2QVbbEnrfx+10Rcwt03/rlu2ZhJO
 +jUIUOMXpJJweKy07Hodyn9n0Cnq/W0EhXn7qv0mV/RTPhlkXg86p7JrXzG1cUL5xQ6vr0t+Gv
 XShLQ0x81E6t46hpkLyxXCHo5/GjPJQArnWz0ecq7xZ6NxToFW5paoeMN6g0OjLfXL64Yw/eYU
 DO9/its0zKfkqf9O3fb3hpTvE4vKH44mZBdftZfNz/d+nc3H6N5kw5mJvSsLhOdEOmU29olxW2
 QJb20yxcQPl77AryDhOaIreN
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Sep 2022 22:51:19 -0700
IronPort-SDR: e3ORU6wYpJBgmcsP68lsoAQFQ4O0wV3PJ9RQkLB/AHP7r7PifzCiJAUvrfgNp9auFHm9NVt/Jp
 31vf4BPOU9znjtIynxiIDnSOb1lh8Rv+MHLoXj3y0u0utj1h/DXGiGu+Xk3Sqzez0XMBBIBCd+
 XPG2yPaVtH9/ZqERgoEndalYT5VH6BVvM547mDf+jcd4XNfItbHldhxyEuFBh4uJ/gBlqIQRDp
 BTVwHpqvKhgR1f0nOONzE89IWP6CDxfL1UhBzTxgtTZu+pNPxDsCVq8UEw0M5IoRhXKNL7AduI
 fLs=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Sep 2022 23:31:23 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Mc8sQ47YNz1RvTr
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 23:31:22 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1664260282; x=1666852283; bh=b02/TLq
 gF0kTES/41rCHOv0/nTxWSCUUk8n7CI4Sep4=; b=h96xVQNTizjHM5h1V1HO+gk
 UHdrs7uT+eR5q3HFXYrKiPq+RnxVI5musvPpAjl8s47K1vNNFH+gwLO/LQ0S2PRJ
 tMBuG+gk2VdRRXfwi+mlPJrjkb//9gkWYhg5hrTy89V+9/ZtYBRSHrY9Z8HxsQGn
 Ep90G6kVIZRRQXczfHCfy0lwxQgv2IrK7S5sOTHTjCuaxeP9tCDLtZj1u2eKySei
 e05UjTFUj8gVQTyKytUtdndbcqVgvSbev9+0+AbjKHvuxxjiW/n3vgOV6d/6a8Ko
 zIdk4pxVnWlXUa9sF26e64jJWtfa7qlDvbgPpS40QhzsJmKWAfRgs0F/CvhuuNQ=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 7mUAZlddw8m1 for <qemu-devel@nongnu.org>;
 Mon, 26 Sep 2022 23:31:22 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.167.123])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Mc8sN6Cnvz1RvTp;
 Mon, 26 Sep 2022 23:31:20 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL v2 08/22] target/riscv: Set the CPU resetvec directly
Date: Tue, 27 Sep 2022 16:30:50 +1000
Message-Id: <20220927063104.2846825-9-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220927063104.2846825-1-alistair.francis@opensource.wdc.com>
References: <20220927063104.2846825-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=262caef14=alistair.francis@opensource.wdc.com;
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


