Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B8A495A3C
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 08:00:06 +0100 (CET)
Received: from localhost ([::1]:48064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAnu0-0007r6-W7
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 02:00:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAmy9-0006ti-4G
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 01:00:20 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:60345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAmy3-0004B6-Gk
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 01:00:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1642744811; x=1674280811;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GMLbD5ayFkoErB/IZay1cQB3pe5/0mX/reC7P+tfqJI=;
 b=BixTvZJX//TAUc8oB1dRA/S37OGt7KCZfecucsP0OGTPx1fAdNugXIux
 paOoDeHI/9yiNP8QNvHqnAYkntylBuFpQJZP1e+IaezneNjuJpOylK8uJ
 1wGnOMCPSMR7eY+FIGqg4pNfrgsp71oPanflkRtWVcUCRO/ckGyiMexKu
 XD8t8ElXn3OxmtqNEyeocrtPj8wa2Y1BwjDL9pdXaUFUryBlDjCvDEQRT
 0zy1YbJZg/eACRMulfW4L0vnjsieMcqMFKrsGeBFj8cUaR8I+KXC+7Hof
 ChbzYBAouL2c7nKEv1/D5kPhPkIe4kD9e432vSfSgfarmR4AEKOBfQK5T A==;
X-IronPort-AV: E=Sophos;i="5.88,304,1635177600"; d="scan'208";a="295082892"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 21 Jan 2022 14:00:09 +0800
IronPort-SDR: c7+C9cQwN1iGVOJuUionIfWhK69UzFQZjm1CWJC31h4Xvrp1p58ec0feJdFfBG+h1YL0sdIouI
 ky5SGK6Ci/FyrSmjeFAOsAo98uQe/JOp/yCxWcIPMJ8F6o5G0c2kAo2kuGV5yzOoB57ma4A92H
 dED/6Vn54aUowar7JxYCI3ClI9DJSMntVBsUtO9/U3BgM2OUvPGSIv+651JwvrOfXQIW6MSD6b
 gB3uqvBUyeaAL34GiQUpHkbZ8OUwbJwbj61jS7uNo3xa+FaVZocogAOHXsuJNv17pULiFIndET
 63SfjKzEPUppprL/ocEhIf1d
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 21:33:36 -0800
IronPort-SDR: iU7t9/oNx18I71llRViXCHG4uXrYO1nSpAzfuStpeMX59hexx/EvL1HD/nRt9RlKyidwpRcCP+
 9uZZUrR6bWmz/ctNzlyg68zBc78YjL3LG0soU8kW3AdnLd5Lzus0hSguMQLPDKNekrSxcj1ugB
 DrYW4y/I3b6GLayT/69HGknAd58M+5W8NRW9SPYkhFOMtImtPVCmpEV1/LRwmHeu7m60H2+dlV
 7LWSktW2o3J4zmwEl0yflWrENsF4/KNae7qxuqrSJJ090z8twfk80rf3e/dUDWQejckZCctXmL
 3tU=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 22:00:08 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Jg7yJ54Yrz1Rwrw
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 22:00:08 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1642744808; x=1645336809; bh=GMLbD5ayFkoErB/IZa
 y1cQB3pe5/0mX/reC7P+tfqJI=; b=gLJy4GU0NOqwOhaSyb/PwfNY/mj7NPsxwa
 1bUh4lF5E9T6f5lQqcYzivHiBjrQkM2Ccu84nFkcgFxKHS0xMOTvyO0V8YTb4GxE
 YshN67HXdWIe79bb+AWh+/U3yhWDpzoelbjRlRl6F2rjpK9IF/hzUanqy/wrEMur
 ZUyvJlGhxBiD83AI4ct0lkLdXAaSWl6WmSiBuOSXQIU6eTUHfn5fajX5IeyDzYFp
 huRyHOSGjWIlDshCBK91SWAO9Wkf7eWQbqr/VjWtE5rqta8cNOn/pFKi3ElU8bTD
 2uESMN8vTvNlKjPwXiXINZ+9KjN4qp1DKRqof1MHMPjWusm9+AHA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id fb4NDF_OMFmE for <qemu-devel@nongnu.org>;
 Thu, 20 Jan 2022 22:00:08 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.80])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Jg7yF2LmNz1RvlN;
 Thu, 20 Jan 2022 22:00:04 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 19/61] target/riscv: rvv-1.0: Add Zve64f extension into RISC-V
Date: Fri, 21 Jan 2022 15:57:48 +1000
Message-Id: <20220121055830.3164408-20-alistair.francis@opensource.wdc.com>
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

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20220118014522.13613-2-frank.chang@sifive.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h        | 1 +
 target/riscv/cpu.c        | 4 ++++
 target/riscv/cpu_helper.c | 5 ++++-
 target/riscv/csr.c        | 6 +++++-
 target/riscv/translate.c  | 2 ++
 5 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 22c94d3c57..424bdcc7fa 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -340,6 +340,7 @@ struct RISCVCPU {
         bool ext_icsr;
         bool ext_zfh;
         bool ext_zfhmin;
+        bool ext_zve64f;
=20
         char *priv_spec;
         char *user_spec;
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 32879f1403..cdb893d601 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -609,6 +609,10 @@ static void riscv_cpu_realize(DeviceState *dev, Erro=
r **errp)
             }
             set_vext_version(env, vext_version);
         }
+        if (cpu->cfg.ext_zve64f && !cpu->cfg.ext_f) {
+            error_setg(errp, "Zve64f extension depends upon RVF.");
+            return;
+        }
         if (cpu->cfg.ext_j) {
             ext |=3D RVJ;
         }
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 434a83e66a..43d498aae1 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -69,12 +69,15 @@ static RISCVMXL cpu_get_xl(CPURISCVState *env)
 void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
                           target_ulong *cs_base, uint32_t *pflags)
 {
+    CPUState *cs =3D env_cpu(env);
+    RISCVCPU *cpu =3D RISCV_CPU(cs);
+
     uint32_t flags =3D 0;
=20
     *pc =3D env->pc;
     *cs_base =3D 0;
=20
-    if (riscv_has_ext(env, RVV)) {
+    if (riscv_has_ext(env, RVV) || cpu->cfg.ext_zve64f) {
         /*
          * If env->vl equals to VLMAX, we can use generic vector operati=
on
          * expanders (GVEC) to accerlate the vector operations.
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index adb3d4381d..e9311cfd9d 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -47,7 +47,11 @@ static RISCVException fs(CPURISCVState *env, int csrno=
)
=20
 static RISCVException vs(CPURISCVState *env, int csrno)
 {
-    if (env->misa_ext & RVV) {
+    CPUState *cs =3D env_cpu(env);
+    RISCVCPU *cpu =3D RISCV_CPU(cs);
+
+    if (env->misa_ext & RVV ||
+        cpu->cfg.ext_zve64f) {
 #if !defined(CONFIG_USER_ONLY)
         if (!env->debugger && !riscv_cpu_vector_enabled(env)) {
             return RISCV_EXCP_ILLEGAL_INST;
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 615048ec87..d3c0d44e2e 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -79,6 +79,7 @@ typedef struct DisasContext {
     bool ext_ifencei;
     bool ext_zfh;
     bool ext_zfhmin;
+    bool ext_zve64f;
     bool hlsx;
     /* vector extension */
     bool vill;
@@ -894,6 +895,7 @@ static void riscv_tr_init_disas_context(DisasContextB=
ase *dcbase, CPUState *cs)
     ctx->ext_ifencei =3D cpu->cfg.ext_ifencei;
     ctx->ext_zfh =3D cpu->cfg.ext_zfh;
     ctx->ext_zfhmin =3D cpu->cfg.ext_zfhmin;
+    ctx->ext_zve64f =3D cpu->cfg.ext_zve64f;
     ctx->vlen =3D cpu->cfg.vlen;
     ctx->elen =3D cpu->cfg.elen;
     ctx->mstatus_hs_fs =3D FIELD_EX32(tb_flags, TB_FLAGS, MSTATUS_HS_FS)=
;
--=20
2.31.1


