Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24DDC495A9F
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 08:27:39 +0100 (CET)
Received: from localhost ([::1]:37364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAoKf-00045O-To
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 02:27:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAmzH-0007Dc-Ut
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 01:01:28 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:60338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAmyx-0004AK-Sz
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 01:01:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1642744867; x=1674280867;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ggoBLKSLTPQzTdQI6Vw7EvyAhdqKFm3uWOomLdg+1XY=;
 b=nveKBwxQKvnttAShaIQnA4u9j4M596fEow9LEH2xzbjJIA1dc8EwSywQ
 gCRhxRGEPkZpET73ppEdNU/wwZ7la01HZLQIKWTcEhlQVJTM2qfJSKQaK
 4Fk48IW/NzeUpYY2HI6vMHqFlYV7RUb4RLvavAaqTLAtqZ82g92mzd0as
 9EnxdQ9XPm8osVK7a0+URdVBOpT/4dXweDwB5Nk/2NF8YUy/xM3+DnODO
 or/vjVKv8PP0lABcvDV6wVBJ8BCM5NQw8Gbkc7pQMuFIe7PEeOGjEgTiE
 peVOE6AIW4HoTZMW7IESLbDG31II84vsZheigXJFIQZmQK/4V7tnedk5y A==;
X-IronPort-AV: E=Sophos;i="5.88,304,1635177600"; d="scan'208";a="295082969"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 21 Jan 2022 14:00:45 +0800
IronPort-SDR: neP0X3XEt1TYKRRiCGM3Uzivqoo8toUwaCmOavPIu//pEOaV+SJcNcpvIjt2n61ebXsEzrvEam
 4PepDr6Ga2KAjRWDWpl7dyZryjmxNENK3DwYxtuKRcYA8005cWKw5cWke8rL0bJodhYPuKZ8J5
 EplWDzTVYwYjjy4GFrtP8VCIQKsKFyNERG+/Jo6Q/Xmx854XDCZX4h4tGsm8Ii0hWLdGcJQ5xn
 hrZrFda/nwwMnxvYw0nUlhRKSl0Q5BEVYTil+Ejk8QV5NcG13WyV5BAffkQ+RmqTe33Zwbw6Rj
 5StkO1yUXRZdJT4RS+dL+JBp
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 21:34:12 -0800
IronPort-SDR: BigU+5iIDM+G0NBnVZ7EIrQA8ZzyghpZuXtPcBf5UVMDD8pI282wTIBpgpKCb+7N1E0N77dh0w
 4qlm5efOsPKgyUxujnLF3qaZUvfFVVZwOVIkYt4YxrwCmTxf6ubS++qTO/93ish1Hvj3uc9Icl
 Yj0JTkNt1fpq7T/GqlawKfgsNkLpILeYRqARWNndPykJzhIfaSwR7mAGJ6GOmSMkD8H+UIQuRa
 D+H0iupYRaAQfqmWyXCvuMHO2ruoq9uxd4IrPnJ5SAyN2eljs7Cj7c4XwW8G/5tEu7hrldn1lG
 4ro=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 22:00:45 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Jg7z06c00z1Rwrw
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 22:00:44 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1642744844; x=1645336845; bh=ggoBLKSLTPQzTdQI6V
 w7EvyAhdqKFm3uWOomLdg+1XY=; b=PDEOmfZPOC5wW/eoLfCTOC3uzccXxWK0we
 iPK2SNod2z+2CAFUomTxR/Y0Jmb8PQwjEDe4zHVMrmjnC5lpe9ZcTB8iwa9NZ0Lr
 cr4+gHO9budiGosi5YaiFZv9az4a2F7vfjk7RPrrJzq2B+/5/OHuUy1XV1iAOjlx
 FJ6qTAu3Irmn/prII1Cn4MHCIaKES9dptE9Sz94UXumaaF0r1pLKpXA0OYYmL7x0
 CJ5dKUf7Q8DOJixRbt2yyNbtYr/9KPLVmDuN8vLnBdmK6A9NFCrkhxkuyZy0J+zB
 C7LR6lqyKqiCjpcUMxBjGEEiGu3q2x73LDXALtu1DloET8CrvtZw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 6Hx1VD82xRwO for <qemu-devel@nongnu.org>;
 Thu, 20 Jan 2022 22:00:44 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.80])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Jg7yx4V2Dz1RvlN;
 Thu, 20 Jan 2022 22:00:41 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 29/61] target/riscv: rvv-1.0: Add Zve32f extension into RISC-V
Date: Fri, 21 Jan 2022 15:57:58 +1000
Message-Id: <20220121055830.3164408-30-alistair.francis@opensource.wdc.com>
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
Message-id: 20220118014522.13613-12-frank.chang@sifive.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h        | 1 +
 target/riscv/cpu.c        | 4 ++--
 target/riscv/cpu_helper.c | 2 +-
 target/riscv/csr.c        | 2 +-
 target/riscv/translate.c  | 2 ++
 5 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 424bdcc7fa..03552f4aaa 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -340,6 +340,7 @@ struct RISCVCPU {
         bool ext_icsr;
         bool ext_zfh;
         bool ext_zfhmin;
+        bool ext_zve32f;
         bool ext_zve64f;
=20
         char *priv_spec;
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 4f3d733db4..ef269378de 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -609,8 +609,8 @@ static void riscv_cpu_realize(DeviceState *dev, Error=
 **errp)
             }
             set_vext_version(env, vext_version);
         }
-        if (cpu->cfg.ext_zve64f && !cpu->cfg.ext_f) {
-            error_setg(errp, "Zve64f extension depends upon RVF.");
+        if ((cpu->cfg.ext_zve32f || cpu->cfg.ext_zve64f) && !cpu->cfg.ex=
t_f) {
+            error_setg(errp, "Zve32f/Zve64f extension depends upon RVF."=
);
             return;
         }
         if (cpu->cfg.ext_j) {
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 43d498aae1..afee770951 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -77,7 +77,7 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ul=
ong *pc,
     *pc =3D env->pc;
     *cs_base =3D 0;
=20
-    if (riscv_has_ext(env, RVV) || cpu->cfg.ext_zve64f) {
+    if (riscv_has_ext(env, RVV) || cpu->cfg.ext_zve32f || cpu->cfg.ext_z=
ve64f) {
         /*
          * If env->vl equals to VLMAX, we can use generic vector operati=
on
          * expanders (GVEC) to accerlate the vector operations.
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index e9311cfd9d..a9e7ac903b 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -51,7 +51,7 @@ static RISCVException vs(CPURISCVState *env, int csrno)
     RISCVCPU *cpu =3D RISCV_CPU(cs);
=20
     if (env->misa_ext & RVV ||
-        cpu->cfg.ext_zve64f) {
+        cpu->cfg.ext_zve32f || cpu->cfg.ext_zve64f) {
 #if !defined(CONFIG_USER_ONLY)
         if (!env->debugger && !riscv_cpu_vector_enabled(env)) {
             return RISCV_EXCP_ILLEGAL_INST;
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index d3c0d44e2e..330904265e 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -79,6 +79,7 @@ typedef struct DisasContext {
     bool ext_ifencei;
     bool ext_zfh;
     bool ext_zfhmin;
+    bool ext_zve32f;
     bool ext_zve64f;
     bool hlsx;
     /* vector extension */
@@ -895,6 +896,7 @@ static void riscv_tr_init_disas_context(DisasContextB=
ase *dcbase, CPUState *cs)
     ctx->ext_ifencei =3D cpu->cfg.ext_ifencei;
     ctx->ext_zfh =3D cpu->cfg.ext_zfh;
     ctx->ext_zfhmin =3D cpu->cfg.ext_zfhmin;
+    ctx->ext_zve32f =3D cpu->cfg.ext_zve32f;
     ctx->ext_zve64f =3D cpu->cfg.ext_zve64f;
     ctx->vlen =3D cpu->cfg.vlen;
     ctx->elen =3D cpu->cfg.elen;
--=20
2.31.1


