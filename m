Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A28365FA1F
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 04:25:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDdBe-0001B5-73; Thu, 05 Jan 2023 22:14:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=363443eaf=alistair.francis@opensource.wdc.com>)
 id 1pDdBZ-0001AC-R9
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 22:14:25 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=363443eaf=alistair.francis@opensource.wdc.com>)
 id 1pDdBX-000892-M0
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 22:14:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1672974863; x=1704510863;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VYMLg6lU98vjKDhWRqsGYENtiBbNikB50DN+35gREhU=;
 b=Dr4eKaE9fxY02qn2AZ0op9Fq3ua4BPRWUVrzmQavtKYfpfGZ94RMb4R/
 xpuY1dJ/8I6Ytt19hGLVRTzdB3e4SQRFFEzKbRY5WI8DQHcOPJVQf3M3J
 Xwp9PrPIdiqDqNP/y/o0mRPBIkb3fL7J65k+FwCPyQo3SUCvo3/jmxq9z
 ISkLVk2zG25OYddBl+I8KaBOsvq/sFef4mbi3u7cUP6tDLOf4fzidpln/
 Go092TIKoDq2VApvRHVMbqUJLG7yBCIaXTZIzVgtEapWg9NCy8fWDY4V5
 6GKt+b6gWTCTEY0sIpWU/zM7Y+fq6BQRuS96zzRQMopTdX0l67luyZb6m g==;
X-IronPort-AV: E=Sophos;i="5.96,304,1665417600"; d="scan'208";a="220254759"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 06 Jan 2023 11:14:20 +0800
IronPort-SDR: +sq02o3fNAf3Xl//wjUgRPGrxOIeC5yTCgUzk6h7wnJs3xD1lC/4kr3v4WxyhkJVlYFoNhqfQa
 wwGIDcvTzqJ1c/tNujzKWOOjYBZZehIaGiC40hMoF7RzaMMxbeEugBYjVs7Q6+4KDoqxAySeGH
 fk9Iy5eKZ4G5pXRWeRog/a6G3IwJIn1c547qIUKFQD7rwkEzE55vtcrkXcX1qhhOaU7YIDCg+H
 HwDe3anho9exlbybYD94Nfo4nl/PxJFvy2HqEI8q4l029RUhGxxNjiTXEiUJdXrN6bJuWvLJRZ
 sEE=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jan 2023 18:26:31 -0800
IronPort-SDR: aCuIBHzHvlbausBcK3SIwomHrCIA3kGmWunBClBzXBvFvn+EeSpO8rrXVDaCQLD6u1/Xk3kCKy
 O916s0W07uxiIqqZZqcr5bO+GRYS+hUmmn94NCwPa3Iefl1AUs1lDLzeh22UxcbeW3I7FlCfhq
 TfIuBmo8RAH9G7zIzHDIRaTHWa0iNXlMGPccBOMOwnm8/1e5Y0EO1gfHR/UPuafKZd9Tm1KIex
 xb0FutHiwe+oAHAY+H1sCfus4/f+7yGNrmnECuWWwjxz/hvePPhIl1WJKExKqiYp8s4GvUi5KY
 TZM=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jan 2023 19:14:22 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Np7jS5pPBz1RvTp
 for <qemu-devel@nongnu.org>; Thu,  5 Jan 2023 19:14:20 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1672974860; x=1675566861; bh=VYMLg6lU98vjKDhWRq
 sGYENtiBbNikB50DN+35gREhU=; b=OFaxoHU0j8GJIx41JSpjj15zB27dbNyngX
 mPK4QN5tU8B4uKu6H4gY1FK7KLGAd0vlCWWKWaOojSqQsENbqxa5jvT3kRqlaKA0
 MoK3UkRW5zGz1GsPInCfPhezBfyjLIHELtAqiX/qzkI9WbAyYx921qgWmp8ihHn6
 94RmRIP5LGNfXlI+Es7c/4mOcXqA/Cu+uSf0cLIRKYjMZkrXfjJFDIz8DLTr31ro
 1EIf7HKQWPskka7svnIbRsFh1hrbtLR3kg9AD8U4cMUVHtmWTDgmEA0l05DIn5hy
 s1sL0mFzVpO/ioBJWfHwmszg40ih//JDGUHLdzhYZG+5qyHzYPeA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 2wmrrrQE_1Eq for <qemu-devel@nongnu.org>;
 Thu,  5 Jan 2023 19:14:20 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.167.28])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Np7jQ6zhKz1RvLy;
 Thu,  5 Jan 2023 19:14:18 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Mayuresh Chitale <mchitale@ventanamicro.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v3 09/43] target/riscv: generate virtual instruction exception
Date: Fri,  6 Jan 2023 13:13:23 +1000
Message-Id: <20230106031357.777790-10-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230106031357.777790-1-alistair.francis@opensource.wdc.com>
References: <20230106031357.777790-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=363443eaf=alistair.francis@opensource.wdc.com;
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Mayuresh Chitale <mchitale@ventanamicro.com>

This patch adds a mechanism to generate a virtual instruction
instruction exception instead of an illegal instruction exception
during instruction decode when virt is enabled.

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20221016124726.102129-4-mchitale@ventanamicro.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/translate.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index db123da5ec..8b0bd38bb2 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -76,6 +76,7 @@ typedef struct DisasContext {
        to reset this known value.  */
     int frm;
     RISCVMXL ol;
+    bool virt_inst_excp;
     bool virt_enabled;
     const RISCVCPUConfig *cfg_ptr;
     bool hlsx;
@@ -243,7 +244,11 @@ static void gen_exception_illegal(DisasContext *ctx)
 {
     tcg_gen_st_i32(tcg_constant_i32(ctx->opcode), cpu_env,
                    offsetof(CPURISCVState, bins));
-    generate_exception(ctx, RISCV_EXCP_ILLEGAL_INST);
+    if (ctx->virt_inst_excp) {
+        generate_exception(ctx, RISCV_EXCP_VIRT_INSTRUCTION_FAULT);
+    } else {
+        generate_exception(ctx, RISCV_EXCP_ILLEGAL_INST);
+    }
 }
=20
 static void gen_exception_inst_addr_mis(DisasContext *ctx)
@@ -1062,6 +1067,7 @@ static void decode_opc(CPURISCVState *env, DisasCon=
text *ctx, uint16_t opcode)
         { has_XVentanaCondOps_p,  decode_XVentanaCodeOps },
     };
=20
+    ctx->virt_inst_excp =3D false;
     /* Check for compressed insn */
     if (insn_len(opcode) =3D=3D 2) {
         if (!has_ext(ctx, RVC)) {
--=20
2.39.0


