Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8BBB424D9F
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 09:00:47 +0200 (CEST)
Received: from localhost ([::1]:38978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYNOY-0002ZA-LP
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 03:00:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=907902f29=alistair.francis@opensource.wdc.com>)
 id 1mYNDm-0004bD-QE
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 02:49:38 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:53914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=907902f29=alistair.francis@opensource.wdc.com>)
 id 1mYNDh-0006R5-8j
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 02:49:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1633589372; x=1665125372;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HzOH5zU/Z5xyWh7p/0y+2b1dMv0UQNdqjlXAy9yWYow=;
 b=CpiralUIU48JbbKU7E7xcm+NJR0YMyzn/xYRVupv8TQCX+i36kMtXGX2
 2bQM4+rYr45QfDXrH+VOHaZKcKVWaM+4sSYqVr1a6M8+mbnWkm1BtsI+Y
 G5M9OeFx+j8wzoPYlOCCritgjDUtLRzJpLnvPsj8Eh1X8F15Nx6NZsNe/
 4W0TdS8Q5EaVv/8kBFM62Ay3hNNUGwItpAj5vBAuiunsCC7VwDbzqPZAX
 nZMOKSmI437WnkPdqeJ92RSimFe5J+Meugiv0ucBVwL7X3ttd1H8RsCFc
 X4fDhEFj+Td6Tz5b1jzmahVCaMxAhtoY0GKNKVz8pxtf29ygEaSDC5fyu Q==;
X-IronPort-AV: E=Sophos;i="5.85,352,1624291200"; d="scan'208";a="293815499"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 07 Oct 2021 14:49:32 +0800
IronPort-SDR: fFAlNTZSDtecmMNxNp4ZiZVZNYRU5ijUQOeImsz56CB22kd4zm1w3tsaIEO/QpVL5SAgQmowwG
 z4lC0UlZkwqzzHQfvUXrX65SLzPgwYk8zPSXK3/Z3nrr9ZEkpoxtYO0QBVqYBwNc7X/YSwYt9J
 /mjsrckC9EUs3fZvDM/Gu99N2cGiFRQwldbok7i41+/4TQ5USXBZ42Q6DB6h+kg55gvrLC73ua
 sz/lcpBTr2Yfv6mJqQvW3InK/902HBuFxqd9UBKUdOmdYhWKF/pb86RpAdD9F3Ide0iEGrMAVs
 BzAT7GLpWXTbUrNG3Acngqq3
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 23:23:53 -0700
IronPort-SDR: P1jDUJcBOBUwdUKeqOT/srp2yP/5cGj3/EdwWMeDXuO09a8LEpfuRzNV0SiFFPVvHs5noqNjoq
 NnooB1hj8ts91FHqnPa1UIlbgFkrQFDJ+6nYUqnM/z1XYfQuFwcPPOE7pGICmt8QFrPg5etfFB
 sSxrIXYQg+vM/8+IZx2AzjsvoIiey0cJGlKP/u1m8CC8SMF1a5e+U2hJ4+S03zj/sjxlcIQhqi
 HvNdvDrap+ihwvq3s8vaieVd2omGI+3x+yc+Q+RGTlg+mmervHce8TSIlhKygK52StlECm4N2i
 3Mw=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 23:49:33 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HQ24D11Wcz1RvmJ
 for <qemu-devel@nongnu.org>; Wed,  6 Oct 2021 23:49:32 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1633589371; x=1636181372; bh=HzOH5zU/Z5xyWh7p/0
 y+2b1dMv0UQNdqjlXAy9yWYow=; b=lOQDLcwbhtv8HbOu1/TT24YW8lzaBmgk/d
 dl0toc7hVv3ToodMDx9PPB3vkw+NsMUhqplG2SDKZ7q7JS6IclkW1DUmMExfQ0jg
 UD9YdOxgmBMH+W6ZBu93kO7pknN5+wsfpINHlqc7DOSDZ6Nmk2JYB28RamaBj//t
 +SA0/Q5ScaWb9AMvE8z8JKpNBHV+ij2YZlfLrHowj5aDta+5rTTpnUu9mL6l8sg/
 i7unYeBpHKWagqwGyygolRxe1IKmH1/iYBtjxteqCQFZwd2aX1PyJI3MJf1aGnW1
 0t6z+nWcXeDgN44KaCt3T1Yc4Kcb8Q7tPjn6xrzhzK0T3tIi4Uxg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 9dJO54NPQ0Md for <qemu-devel@nongnu.org>;
 Wed,  6 Oct 2021 23:49:31 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.32])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HQ2464TN0z1RvTg;
 Wed,  6 Oct 2021 23:49:26 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [PULL 15/26] target/riscv: Remove RVB (replaced by Zb[abcs])
Date: Thu,  7 Oct 2021 16:47:40 +1000
Message-Id: <20211007064751.608580-16-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211007064751.608580-1-alistair.francis@opensource.wdc.com>
References: <20211007064751.608580-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=907902f29=alistair.francis@opensource.wdc.com;
 helo=esa1.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

From: Philipp Tomsich <philipp.tomsich@vrull.eu>

With everything classified as Zb[abcs] and pre-0.93 draft-B
instructions that are not part of Zb[abcs] removed, we can remove the
remaining support code for RVB.

Note that RVB has been retired for good and misa.B will neither mean
'some' or 'all of' Zb*:
  https://lists.riscv.org/g/tech-bitmanip/message/532

Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-id: 20210911140016.834071-16-philipp.tomsich@vrull.eu
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h         |  3 ---
 target/riscv/insn32.decode |  4 ----
 target/riscv/cpu.c         | 26 --------------------------
 3 files changed, 33 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 1a38723f2c..bd519c9090 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -67,7 +67,6 @@
 #define RVS RV('S')
 #define RVU RV('U')
 #define RVH RV('H')
-#define RVB RV('B')
=20
 /* S extension denotes that Supervisor mode exists, however it is possib=
le
    to have a core that support S mode but does not have an MMU and there
@@ -83,7 +82,6 @@ enum {
 #define PRIV_VERSION_1_10_0 0x00011000
 #define PRIV_VERSION_1_11_0 0x00011100
=20
-#define BEXT_VERSION_0_93_0 0x00009300
 #define VEXT_VERSION_0_07_1 0x00000701
=20
 enum {
@@ -288,7 +286,6 @@ struct RISCVCPU {
         bool ext_f;
         bool ext_d;
         bool ext_c;
-        bool ext_b;
         bool ext_s;
         bool ext_u;
         bool ext_h;
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index affb99b3e6..2f251dac1b 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -712,10 +712,6 @@ rorw       0110000 .......... 101 ..... 0111011 @r
 # instruction, so we use different handler functions to differentiate.
 zext_h_64  0000100 00000 ..... 100 ..... 0111011 @r2
=20
-# *** RV32B Standard Extension ***
-
-# *** RV64B Standard Extension (in addition to RV32B) ***
-
 # *** RV32 Zbc Standard Extension ***
 clmul      0000101 .......... 001 ..... 0110011 @r
 clmulh     0000101 .......... 011 ..... 0110011 @r
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 785a3a8d19..1d69d1887e 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -127,11 +127,6 @@ static void set_priv_version(CPURISCVState *env, int=
 priv_ver)
     env->priv_ver =3D priv_ver;
 }
=20
-static void set_bext_version(CPURISCVState *env, int bext_ver)
-{
-    env->bext_ver =3D bext_ver;
-}
-
 static void set_vext_version(CPURISCVState *env, int vext_ver)
 {
     env->vext_ver =3D vext_ver;
@@ -496,25 +491,6 @@ static void riscv_cpu_realize(DeviceState *dev, Erro=
r **errp)
         if (cpu->cfg.ext_h) {
             target_misa |=3D RVH;
         }
-        if (cpu->cfg.ext_b) {
-            int bext_version =3D BEXT_VERSION_0_93_0;
-            target_misa |=3D RVB;
-
-            if (cpu->cfg.bext_spec) {
-                if (!g_strcmp0(cpu->cfg.bext_spec, "v0.93")) {
-                    bext_version =3D BEXT_VERSION_0_93_0;
-                } else {
-                    error_setg(errp,
-                           "Unsupported bitmanip spec version '%s'",
-                           cpu->cfg.bext_spec);
-                    return;
-                }
-            } else {
-                qemu_log("bitmanip version is not specified, "
-                         "use the default value v0.93\n");
-            }
-            set_bext_version(env, bext_version);
-        }
         if (cpu->cfg.ext_v) {
             int vext_version =3D VEXT_VERSION_0_07_1;
             target_misa |=3D RVV;
@@ -616,7 +592,6 @@ static Property riscv_cpu_properties[] =3D {
     DEFINE_PROP_BOOL("s", RISCVCPU, cfg.ext_s, true),
     DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
     /* This is experimental so mark with 'x-' */
-    DEFINE_PROP_BOOL("x-b", RISCVCPU, cfg.ext_b, false),
     DEFINE_PROP_BOOL("x-zba", RISCVCPU, cfg.ext_zba, false),
     DEFINE_PROP_BOOL("x-zbb", RISCVCPU, cfg.ext_zbb, false),
     DEFINE_PROP_BOOL("x-zbc", RISCVCPU, cfg.ext_zbc, false),
@@ -627,7 +602,6 @@ static Property riscv_cpu_properties[] =3D {
     DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
     DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
     DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
-    DEFINE_PROP_STRING("bext_spec", RISCVCPU, cfg.bext_spec),
     DEFINE_PROP_STRING("vext_spec", RISCVCPU, cfg.vext_spec),
     DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
     DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
--=20
2.31.1


