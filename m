Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0BB6538F3
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 23:44:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p87lx-0007RE-6h; Wed, 21 Dec 2022 17:41:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=3472792e2=alistair.francis@opensource.wdc.com>)
 id 1p87lv-0007Qo-PE
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 17:41:11 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=3472792e2=alistair.francis@opensource.wdc.com>)
 id 1p87lu-0000bf-29
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 17:41:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1671662469; x=1703198469;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uKlkFUb7mBvR+Z9R4nsVPc0uLxuES5/f7RwMG/pjwv0=;
 b=KQNNpCgXuYX6IBfiMEFz9NJWXICTCsP0UkbQMSgSQGt40rRj34NL/9wK
 0+MpWU1Dnc/OuBuhP2BuGecG/ebd7WQzExLoVKYTOCVbSVDKiJKsic9iI
 PxVYj8IylRqlFYYY0VqQf0EqVC9t7FY+RGEg3+e0WpmgvDfXpjV4RMk+1
 akqw0buuCZ/yL7v8JQixz38Is80dPdF+Yip0jOf81T4z97TL2UFchGqI7
 dm71TdT9CZiuHBrb60NQSjkHW3G0lNpWrjTF3r3Rqlfp3HqS+vgGt0GsL
 ZcztmhmmphqQSjkitq3iSCxc4dmZchMXUmyq6JAXq21ruzPjkvasMiBTB g==;
X-IronPort-AV: E=Sophos;i="5.96,263,1665417600"; d="scan'208";a="323561313"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 22 Dec 2022 06:40:52 +0800
IronPort-SDR: pO5iRId8tDIOQO4XggLh70ycUtOcHUxlZ9egkymxGb26OVgQexi/DoWcVDxsDPr9T0+/tRDMmF
 FZC9UaV36eH1B00kw3u6LqRmCzrW7MUmLwPC6GGbUHWRC4FBziqEs2uEXj7BTWn4ql7cjiTHD1
 +E2VSasbzjLa39DyPEqYTPubwz9skBw89kVEYvj1BOYo6np2tZAiUGqEk/XzEcjuPQIQSE04PR
 9iASnPxeM3GZh0sg+TJzd6it6DP/jxrXdNdICEoYlT2emm4wKgvCUKeu+fjOHzrEGfuppdHYLd
 +sQ=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Dec 2022 13:53:21 -0800
IronPort-SDR: ZTbExzDjm14y+BCzs1exbfhryULxxS8MeeQZGEP2HqnUzVoCuG80oHsjlYUmcC4iTTzpeEsxdk
 y0KITiuW3TQGQFcBi3Oh/rNnjE3m4NdWvocdUDAs2YlxYTUPEU0OEPuvmApfnKBMTxgmKxjUbs
 EqPd3mV1hI4EMrDqhKx6L0qe/uNuisfLlaVX/k1QTQbL1+KxRWrmHlOqeTSO3rXzcSxoV4Lb1w
 lgXhPsaXKwLqFQsFxJwEydHrb2qLQRvhaDxHIzTOXl34lk0MEiltiPSz5hjdEdqN6lDf1Tvsht
 vMU=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Dec 2022 14:40:53 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4NcpLr5Y24z1RwtC
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 14:40:52 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1671662452; x=1674254453; bh=uKlkFUb7mBvR+Z9R4n
 sVPc0uLxuES5/f7RwMG/pjwv0=; b=BfDWOY6HKLItsbmjokvRlbrWomUnHR/dps
 zXCkb0I5KpXj/zP7USddYal/aC+m39FeOZ1HLcwmdNLEyGQioe2MxAXBJfFrJ7Nv
 DPObhcnecNd68kyXDlzyufpCpK/wx66YxW8Kjf8rWPaATyFsdEbI0CJo0aO6t/tD
 o0pw6SXllmvcRYEkm7BnDS79756FfbeHLpvHRJpsrZZez+OW+6RA0j2Cq7GqDzhE
 jcDpUD6qUGAP49IsZfPsrxuFrzpVVVwQu7iGBPKhpAANCzaUmy7uN5me25izwnM5
 0brtu08D6AO8iea/7bcUmfHqNg4KS/le3NguGbF2uFgJebUWYNYg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id Ifq5mwgrNZRF for <qemu-devel@nongnu.org>;
 Wed, 21 Dec 2022 14:40:52 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.8])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4NcpLp6RJWz1RvLy;
 Wed, 21 Dec 2022 14:40:50 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Mayuresh Chitale <mchitale@ventanamicro.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 11/45] target/riscv: generate virtual instruction exception
Date: Thu, 22 Dec 2022 08:39:48 +1000
Message-Id: <20221221224022.425831-12-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221221224022.425831-1-alistair.francis@opensource.wdc.com>
References: <20221221224022.425831-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=3472792e2=alistair.francis@opensource.wdc.com;
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
2.38.1


