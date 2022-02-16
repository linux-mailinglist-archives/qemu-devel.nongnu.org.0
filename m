Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB4B4B811D
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 08:12:46 +0100 (CET)
Received: from localhost ([::1]:47674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKEUX-0003BT-PZ
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 02:12:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=039576d22=alistair.francis@opensource.wdc.com>)
 id 1nKDpA-0005BG-Oi
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:30:00 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:61649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=039576d22=alistair.francis@opensource.wdc.com>)
 id 1nKDp8-0006K3-Hp
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:30:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1644992998; x=1676528998;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LvOnLpqh0OHiSklef1KLb+8AQDDkHx+78+oM9pbP6k4=;
 b=cE/H1x7SJEZ6sF3Brd0MDt7yKt/tcPWGVDiVQ7qOEuQUNl6B0UB5CR2V
 iLpYX0WUd6AaNLAey7aAbWbeq0TZawM5IstRnurW9DtSQZYe6EEmSaLwI
 9lcJd10x9VG7VucMjJ+y4BDe4qjKJhlcX+d575U9+D6q7+jXpY0KyePG+
 VJghU0jeqGfM8GWdomCf5zrg4JFN7BFW24pUe7aDNMszGqxPt1YcBIVYb
 KwH7F6kZJrCt+kUkYd2iKgc3nUT3sE29I1WjMoyrNWlYInl7EgPZxIP5I
 gKZhfuwxtmG96Mvcb+Fsn4ZkOyfCdmuCBnzJ2+f/N0K97gArWWBYqUxDw w==;
X-IronPort-AV: E=Sophos;i="5.88,373,1635177600"; d="scan'208";a="297181714"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 16 Feb 2022 14:29:57 +0800
IronPort-SDR: NrJcImrAg8wx8OIbF7aRMnLd76xjIGryjNx3huOA4I8EcM0WzfhX5SL26zaebrfgknl6mWX9lg
 mpAYedFFvSNueYyIJ/gNdO+lWd9cLkg31YCctM1thhqeX62yiNiClW/xwvti/m9ODXOM5Y1PzO
 hV0xJ3Ki8Zzcic9uwdDHJkHIIl7/6NkHJwOhmii8Rtku58ouF5dPS+ucGoFQZXpEIuGwHZsK6q
 yO7xWhMHUwKoL0X9PVR5jzmicEGQkdiMoTPbbpKTLKXYUxkHt6/aV74KoDsiWx8gCoLfnNaizX
 vyWdLOvfBP8VM0JAydB3urKC
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 22:02:45 -0800
IronPort-SDR: aSDglZdaRCaQisGigoh5lrP9XfufNA8vGW43rZDVQCt3VVHPcHF6Amxs3d1VmjxwfLqm6RdS3a
 RAPM/L8qrgd/viQMsILwbvLlj1qUx0MiyUpybGRehr4uX9tzfYwyol7E+Da9QK33TxK32Mq3IL
 GnTWWv4psJZot361OgOYa7PXzgBi8fxZkXomtjQcQRVTYm4jc7Ltga3z9pYYZnbSUQFTWWTc4Y
 NBasHou47BZjSfWv8ut/F2Xiudn+shuptkFRxGMeJvBY7b/xRpz08nt19amlsdFbZY3yzgYSP3
 bH8=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 22:29:57 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Jz7Nj1CXtz1SVp0
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 22:29:57 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1644992996; x=1647584997; bh=LvOnLpqh0OHiSklef1
 KLb+8AQDDkHx+78+oM9pbP6k4=; b=r0HX7tNwHaAltbnLO1IryN2mrIG+dusVo+
 1Uu7Umdi1fOuMrNCma0kwbSEj3NdpEHK12tk3j/SP1HlpmubjS7j60FbdlogPzhD
 SEhguHPx+Ox/ih1IlOQ5c1gbvYakT6/V6lI0juPfWndpuBJOVKjJUDM/Vb/Au+QD
 JARrNM6dhCHsFDNyA4gNJ62j+mrG0qtcEKS5to0Dg35QeM0iiGyOdk6tu15mtnMM
 UpyyTsIqxXz169eg4dUuD2op9ASiSS5vJXJ3tC+OnvMmxd505iphwBbesjX86at2
 9vaP5aAybJvlf1i9X6t3gZxFwtXBDrKaJLXDck4Ik6zy+r9JjcUA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id uvqCYM0flvwC for <qemu-devel@nongnu.org>;
 Tue, 15 Feb 2022 22:29:56 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.97])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Jz7Nd3NMKz1SHwl;
 Tue, 15 Feb 2022 22:29:53 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 08/35] target/riscv: iterate over a table of decoders
Date: Wed, 16 Feb 2022 16:28:45 +1000
Message-Id: <20220216062912.319738-9-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220216062912.319738-1-alistair.francis@opensource.wdc.com>
References: <20220216062912.319738-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=039576d22=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
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

From: Philipp Tomsich <philipp.tomsich@vrull.eu>

To split up the decoder into multiple functions (both to support
vendor-specific opcodes in separate files and to simplify maintenance
of orthogonal extensions), this changes decode_op to iterate over a
table of decoders predicated on guard functions.

This commit only adds the new structure and the table, allowing for
the easy addition of additional decoders in the future.

Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220202005249.3566542-6-philipp.tomsich@vrull.eu>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/translate.c | 32 +++++++++++++++++++++++++++-----
 1 file changed, 27 insertions(+), 5 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index f19d5cd0c0..30b1b68341 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -111,6 +111,11 @@ static inline bool has_ext(DisasContext *ctx, uint32=
_t ext)
     return ctx->misa_ext & ext;
 }
=20
+static bool always_true_p(DisasContext *ctx  __attribute__((__unused__))=
)
+{
+    return true;
+}
+
 #ifdef TARGET_RISCV32
 #define get_xl(ctx)    MXL_RV32
 #elif defined(CONFIG_USER_ONLY)
@@ -855,15 +860,26 @@ static uint32_t opcode_at(DisasContextBase *dcbase,=
 target_ulong pc)
=20
 static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t o=
pcode)
 {
-    /* check for compressed insn */
+    /*
+     * A table with predicate (i.e., guard) functions and decoder functi=
ons
+     * that are tested in-order until a decoder matches onto the opcode.
+     */
+    static const struct {
+        bool (*guard_func)(DisasContext *);
+        bool (*decode_func)(DisasContext *, uint32_t);
+    } decoders[] =3D {
+        { always_true_p,  decode_insn32 },
+    };
+
+    /* Check for compressed insn */
     if (extract16(opcode, 0, 2) !=3D 3) {
         if (!has_ext(ctx, RVC)) {
             gen_exception_illegal(ctx);
         } else {
             ctx->opcode =3D opcode;
             ctx->pc_succ_insn =3D ctx->base.pc_next + 2;
-            if (!decode_insn16(ctx, opcode)) {
-                gen_exception_illegal(ctx);
+            if (decode_insn16(ctx, opcode)) {
+                return;
             }
         }
     } else {
@@ -873,10 +889,16 @@ static void decode_opc(CPURISCVState *env, DisasCon=
text *ctx, uint16_t opcode)
                                              ctx->base.pc_next + 2));
         ctx->opcode =3D opcode32;
         ctx->pc_succ_insn =3D ctx->base.pc_next + 4;
-        if (!decode_insn32(ctx, opcode32)) {
-            gen_exception_illegal(ctx);
+
+        for (size_t i =3D 0; i < ARRAY_SIZE(decoders); ++i) {
+            if (decoders[i].guard_func(ctx) &&
+                decoders[i].decode_func(ctx, opcode32)) {
+                return;
+            }
         }
     }
+
+    gen_exception_illegal(ctx);
 }
=20
 static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUSta=
te *cs)
--=20
2.34.1


