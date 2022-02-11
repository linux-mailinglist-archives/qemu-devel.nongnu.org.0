Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8984B31BF
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Feb 2022 01:11:45 +0100 (CET)
Received: from localhost ([::1]:45462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIg0u-0006wP-V0
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 19:11:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=03511bb56=alistair.francis@opensource.wdc.com>)
 id 1nIfr8-0005Pw-Lo
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 19:01:38 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:1876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=03511bb56=alistair.francis@opensource.wdc.com>)
 id 1nIfr5-0000Cz-GL
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 19:01:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1644624095; x=1676160095;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LvOnLpqh0OHiSklef1KLb+8AQDDkHx+78+oM9pbP6k4=;
 b=NZDyALDaqesr4x5peltTn9HNUBQ1i8oaK7domZvEQW2gfesZWOihT0Ty
 OLxyG/N053yXRnze5AK1vNPMtjDtOvlZiO8DGUWrZfXrHl9r9ADI5UovS
 brI9nUNspGO077Mq6nHYGwbmiJbX7mKDmGlLwI8QcFlqNch3AETCk3wRz
 sIUTPB287tQjRnnzDlaKnb9TaEbfbNhHqDlYn5O9oRUVGBcroYAhgtCEQ
 hrHqUHHo030AvdVq0p/FmlAUpybNpWrUlq4F4kcw/LFfhaNtD+fY6Cidg
 RfdRaMUE5IuaQ/QN54IEDhQFZrws83e38KuumZNZqaNtJHjfuQYTCIRJM A==;
X-IronPort-AV: E=Sophos;i="5.88,361,1635177600"; d="scan'208";a="296835696"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 12 Feb 2022 08:01:34 +0800
IronPort-SDR: rbWfuS2yAXtzBqe76RScmWJIgnNT3oVOT+V5tuEwNMFwoojh2X33qRo0XK94QzgN01NYN0XIrA
 p7W9zyWjxjHqXU5/xmz1rSXHC5wwFfVfFLf5P6guUXA1h/f2pTZKR7WPonjEiETx8/GeZyb4NT
 aVjjePUpaa0F98/jB/xx91oSsORTaVTS0J7b0ZKsICAIi9XtA2cDDMVZotk55Boc9YGaxlYFgD
 xZ92jtsjIaImnYTeH7LP++niZ2iVKm/zIjCEQHgSt77XXjz0kov2Co5KYVIlTg3eMWpklvMLfQ
 lgKHTY7Dyks6PHZsR3sJ4GHI
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 15:33:19 -0800
IronPort-SDR: mDgFz6RVBuQ7iG4FgRgiLDKQ+kkSyFQ5ZHIm+ienYqvdYAPx8YADBDIsRezG2Nqm5CyXHD94rl
 jhrXbleEmNJ+eyp3oPMYElCLv+BtajwjJJCSoMORffMRvNhuz2lsMbijZ2VdVq/DKzuNprNiKd
 P4t3NNvuRR23PaTYvZvSmZsSdTbfyy3j6zgI6Imz20u1gPqe1prGbiOCCl4Tngfubfy7uC1Ah9
 sehj5nFDTO3b6obKvkJ/IiPezNbCHV4/q5XLbx060wnVdFQMKUoDF+RfJfVG1X476vt7PJ6wd9
 d+w=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 16:01:34 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JwVyQ0yByz1SVp0
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 16:01:34 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1644624093; x=1647216094; bh=LvOnLpqh0OHiSklef1
 KLb+8AQDDkHx+78+oM9pbP6k4=; b=VEIIjTYOsLly0JxuWciwZoJHag7BcgnT5/
 Pw5MCzEL+MK/kIblRU8AzM3yOP5gHwl8rxkFZn5YKURmVkppIPXuJsgYjJahG/BX
 nrSQiVInmksnYJsGXPqs48zQpl1iY0w1MhwM23lfE6AcPHNotGMOM4EYvGT1he9W
 IkSykT33uYnUHX8R8JCiaj91u217rUidhZvnJa3gev2YhJNYdhMG6WXYMKnc4oS5
 SHT5XW/W9+QJokVvCunEwlR5//1Z8MPipgjCR+VFigGVLp1Qp77Frn3+utKr+JVU
 pEVWm0uN1FMcX6Jyf9kJoXlV2+FLCMV/qGJ4PZIbwGM7EEgLUmbA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id xab8YkHO7oov for <qemu-devel@nongnu.org>;
 Fri, 11 Feb 2022 16:01:33 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.96])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JwVyL4lVnz1Rwrw;
 Fri, 11 Feb 2022 16:01:30 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 08/40] target/riscv: iterate over a table of decoders
Date: Sat, 12 Feb 2022 09:59:59 +1000
Message-Id: <20220212000031.3946524-9-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220212000031.3946524-1-alistair.francis@opensource.wdc.com>
References: <20220212000031.3946524-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=03511bb56=alistair.francis@opensource.wdc.com;
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


