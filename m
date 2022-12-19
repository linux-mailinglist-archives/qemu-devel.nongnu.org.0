Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A25DB65063C
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 03:18:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p75iw-0008Ht-1z; Sun, 18 Dec 2022 21:17:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=345d64987=alistair.francis@opensource.wdc.com>)
 id 1p75iu-0008He-8h
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 21:17:48 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=345d64987=alistair.francis@opensource.wdc.com>)
 id 1p75ir-00015O-Jq
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 21:17:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1671416265; x=1702952265;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uKlkFUb7mBvR+Z9R4nsVPc0uLxuES5/f7RwMG/pjwv0=;
 b=UaEHi9dAHWUpykQYBQDl7NGHSI6OqGFAj/HxUkEpeLkjrk5kh/ylpb6y
 e+736rljhGvzCAJ/wx0faqFelbcGRKjP5L5+Jw1YQWKtwaMk5KHeyiwiX
 zXaeuz4ZZXouhdL8+X726x3hjtGmdu1eYuV4MPMO1rJWoXzPIL0uRE+21
 s6PyaV9+21/zrL+Jo+YvBWrmt0mM2ouq6Et96+5bjq5Sqqyyyy81HZx9p
 r33f9LMpJ6WAjWP9TA14MvnMwye867LM38xUFeYIWzXZUcvhVd/USgW1T
 ZXaa9yx/IYtk7xJ/N0NfBo2yOeYi+GV5fFb3SOP8IWjHzwcIGqzmYAuSc A==;
X-IronPort-AV: E=Sophos;i="5.96,254,1665417600"; d="scan'208";a="217199312"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 19 Dec 2022 10:17:40 +0800
IronPort-SDR: RwL+bMELJDWi4SoOnAtu3zdtHLTTlbQC+wlSg8opMDJAeJ9D5JkIAiUct8icrK4h4z4VWXXMSV
 E+Gk7srWIV8sR9IniNF1UhxPaRB/q4C4sJcP9tZabxOPNHEFmTeO5/IVGpyoURbMxt5siv0XLa
 pI50n+KUsAwEd2AoxD8azaF/orPMS0hGTDemxrbuSgmqYFOFjuy3/6x+H9tsrlNZPJTOlnTgVo
 547+ZwzKPa3T5Wn4ysYpopHMkhCo+IKlV71aYTLyLQciS2KcXFpbWlTIbLVqmhat+4RuLxrkBH
 IWg=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Dec 2022 17:30:13 -0800
IronPort-SDR: vuC1hRvxNykm1clYVkB20PUOJDx0oKAvGIufpPbo7/gDWDdFZZYQHEKE3pYiWQslCpsU4EeULy
 ryjE7Oc+gu3oibb2YUVRuVw/I8vTLwYGOetwYEKDoRYezCckghW+Ui+skb0zTrSgGSCIhpJ8pF
 +0yCpSSoCN9pIoXBslta/KrT6eYqp5yg7bBEGz8v9APePWNIISSaEbzH0Jt5o21RYrXlDemgL/
 AUoqvJGprgecdm/53a2zuonP54wH98gPFvo6HWe1QwkQ3NEs0cqs924WWVPk1vFIq5d0t1vvoD
 izk=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Dec 2022 18:17:41 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Nb3JN697qz1RvTr
 for <qemu-devel@nongnu.org>; Sun, 18 Dec 2022 18:17:40 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1671416260; x=1674008261; bh=uKlkFUb7mBvR+Z9R4n
 sVPc0uLxuES5/f7RwMG/pjwv0=; b=Q7KRhaBrDz4WAUfc6c2FfDG05EtrUY3DMC
 trThifOcVrQeNqKc84vbDhkwTfIs+NatzeQoEsJePmomr2J4UqKnJpmzVcWKUzYq
 02RY5FZskzHlibBe83F/IO+LDjpU7qrKWpD/+3NFDSNJideY9iHOo7ktzjFS4Qry
 4Mj8zaBOnc5siYIorp+zAfBhBI/O1R6Ha6ZlaftMqY1re+Wd058ev314RwEB6miW
 j4vZrZEwicbIdg0UmjzmY7RnCd4phGHye0j7/QvgFPH4AwsjBN2yJzaLeUHT39HT
 b2R1hNUdo8/F3JlOkJMNKJFYdV7i4yANqe/vSnFQQpv+7+nVV3wg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id kZLrCipQ1BVN for <qemu-devel@nongnu.org>;
 Sun, 18 Dec 2022 18:17:40 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.4])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Nb3JL250Mz1RvLy;
 Sun, 18 Dec 2022 18:17:37 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Mayuresh Chitale <mchitale@ventanamicro.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 11/45] target/riscv: generate virtual instruction exception
Date: Mon, 19 Dec 2022 12:16:29 +1000
Message-Id: <20221219021703.20473-12-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221219021703.20473-1-alistair.francis@opensource.wdc.com>
References: <20221219021703.20473-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=345d64987=alistair.francis@opensource.wdc.com;
 helo=esa4.hgst.iphmx.com
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


