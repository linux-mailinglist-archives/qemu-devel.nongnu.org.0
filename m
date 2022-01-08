Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D024881C9
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 07:10:25 +0100 (CET)
Received: from localhost ([::1]:45822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n64vo-0006dW-IS
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 01:10:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=000118587=alistair.francis@opensource.wdc.com>)
 id 1n64eg-000113-AI
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 00:52:42 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:26474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=000118587=alistair.francis@opensource.wdc.com>)
 id 1n64ee-0006td-7w
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 00:52:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1641621160; x=1673157160;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RbJ2fVhdBU5Ql09QzW7PIGKlogeosiRqyd3jTXJElHo=;
 b=Bke2OuFJhZMOxLOnVlB26Ko3p9KpkCkswPciE3m+7esoMfvBnU6QQ3D9
 VSasaumpe7olSCiWEc6Cvb32oYS4yvuHMoRrP9Y12szgqeesrmFiyJZPl
 DO+K93Ff+52jVGoaQhQV6wVXu/2cnTwkhKEhKFU3qVRBXCLlYp6Fk1nM5
 0kLIZI4Zd7SvvXB3FH5W/DUyUZc8FO91UNnad334tDH+i/i6fL6c7JPmt
 /Z/fRulKRbXBywTcRXm0CKRLzEi8ka2yHdLvufeQ9yh93ZvKVNRDuJ1Zx
 jNU4KHl68ODo5ePvJD2oiGqST7b41F9xt3KLrHY4pK4qXk2EJcDIWarch A==;
X-IronPort-AV: E=Sophos;i="5.88,272,1635177600"; d="scan'208";a="294027391"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 08 Jan 2022 13:52:38 +0800
IronPort-SDR: ieE4DumljoviDK+8hWG+4QxLU4OntBwiOle5bvn4QifgVDmux1gI/IX8DZ5t18E2LSckIqPOMu
 4cmmWiI4xkt56Pm9Pr2RECHWieuGR70WKd6qJ5na4XV7T4AlS41/tFOzIOuVcadSfxhG1xH88/
 tRgpY9L0WJ7InVfCYKZH+W0p7EXEyBrWkcEE2lJPYscnblfttp8yguN5JTmU6VBCwwFoYtgSpG
 nITXTgavAL4Qg6/XZkBsLeWSmWNOpHMElDii8pNVPD85cWf9VuKZJO8HfSEl+v5pf1KOIOnx72
 VZtALz2ST2XNF1GTaY3/TlW7
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2022 21:25:05 -0800
IronPort-SDR: Wu05Pc/Nf+GWUPC6n72wA/9rfs8Qpgr5iuwpD3kTPutKGiKE6C6AKEauZoLGpfko5J8DN6Zre3
 ALstRpVoF8H1XcSS1RcP7ns5eVTLQCyGqfKs2dS7EGFvSKdkbkK2LWP31bcxCQXAxDUtCnglx8
 rEcrRkQxL5rG6Py9/6Ocnqu6t+8etjNAtNXIVXmERqYo3SJepv/vBtBYg3f8+w6CZObRfBZFBG
 fq7QpT6O1AdmrdYSlIgYhgQlNe2DhgYGr3d9/262faQh42sbgctDjk2VyZ5ssrhGxvN+zFWVxs
 qog=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2022 21:52:39 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JW8Pf1LJpz1VSkg
 for <qemu-devel@nongnu.org>; Fri,  7 Jan 2022 21:52:38 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1641621157; x=1644213158; bh=RbJ2fVh
 dBU5Ql09QzW7PIGKlogeosiRqyd3jTXJElHo=; b=dEUpfO3LLoUpYw8cYIsP2KK
 V5y7ACxMgk360XVyAIzUQ9dYuUEEX2V9/8oKjYqLC5HXvEWhQywBdjVjJ95+6mXq
 uoqZqk1IbZAQeWMaMu+vctmV6/GMoDb37NYRiSJbCuLJJtKzWeNwyGKzpxeaDiyc
 yHsMd1UN6MEQvNoSKD6rLHRQJZQe65ZX4Y99WduebV412aiWOvAvH7Qts/iJuUVp
 FcSAavF+ZRdtN3uYiZ6RrlyDfT7bmD0/bS4KFhO3al1cwHyAOeJ7hkyY0xlAgmNp
 XufkUR8u7d89tRE5egtWHuh/RFea04dFWN6qmZqwYNZhxbYmS8S85C3ePrCoFeQ=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id EeESUtwdrBAF for <qemu-devel@nongnu.org>;
 Fri,  7 Jan 2022 21:52:37 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.74])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JW8PY6lW2z1VSkW;
 Fri,  7 Jan 2022 21:52:33 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>, 
 Fabien Portas <fabien.portas@grenoble-inp.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 21/37] target/riscv: separation of bitwise logic and arithmetic
 helpers
Date: Sat,  8 Jan 2022 15:50:32 +1000
Message-Id: <20220108055048.3512645-22-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220108055048.3512645-1-alistair.francis@opensource.wdc.com>
References: <20220108055048.3512645-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=000118587=alistair.francis@opensource.wdc.com;
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

From: Fr=C3=A9d=C3=A9ric P=C3=A9trot <frederic.petrot@univ-grenoble-alpes=
.fr>

Introduction of a gen_logic function for bitwise logic to implement
instructions in which no propagation of information occurs between bits a=
nd
use of this function on the bitwise instructions.

Signed-off-by: Fr=C3=A9d=C3=A9ric P=C3=A9trot <frederic.petrot@univ-greno=
ble-alpes.fr>
Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20220106210108.138226-6-frederic.petrot@univ-grenoble-alpes.f=
r
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/translate.c                | 27 +++++++++++++++++++++++++
 target/riscv/insn_trans/trans_rvb.c.inc |  6 +++---
 target/riscv/insn_trans/trans_rvi.c.inc | 12 +++++------
 3 files changed, 36 insertions(+), 9 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 502bf0d009..c3b4950ad0 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -475,6 +475,33 @@ static int ex_rvc_shifti(DisasContext *ctx, int imm)
 /* Include the auto-generated decoder for 32 bit insn */
 #include "decode-insn32.c.inc"
=20
+static bool gen_logic_imm_fn(DisasContext *ctx, arg_i *a,
+                             void (*func)(TCGv, TCGv, target_long))
+{
+    TCGv dest =3D dest_gpr(ctx, a->rd);
+    TCGv src1 =3D get_gpr(ctx, a->rs1, EXT_NONE);
+
+    func(dest, src1, a->imm);
+
+    gen_set_gpr(ctx, a->rd, dest);
+
+    return true;
+}
+
+static bool gen_logic(DisasContext *ctx, arg_r *a,
+                      void (*func)(TCGv, TCGv, TCGv))
+{
+    TCGv dest =3D dest_gpr(ctx, a->rd);
+    TCGv src1 =3D get_gpr(ctx, a->rs1, EXT_NONE);
+    TCGv src2 =3D get_gpr(ctx, a->rs2, EXT_NONE);
+
+    func(dest, src1, src2);
+
+    gen_set_gpr(ctx, a->rd, dest);
+
+    return true;
+}
+
 static bool gen_arith_imm_fn(DisasContext *ctx, arg_i *a, DisasExtend ex=
t,
                              void (*func)(TCGv, TCGv, target_long))
 {
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_=
trans/trans_rvb.c.inc
index c8d31907c5..de2cd613b1 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -86,19 +86,19 @@ static bool trans_cpop(DisasContext *ctx, arg_cpop *a=
)
 static bool trans_andn(DisasContext *ctx, arg_andn *a)
 {
     REQUIRE_ZBB(ctx);
-    return gen_arith(ctx, a, EXT_NONE, tcg_gen_andc_tl);
+    return gen_logic(ctx, a, tcg_gen_andc_tl);
 }
=20
 static bool trans_orn(DisasContext *ctx, arg_orn *a)
 {
     REQUIRE_ZBB(ctx);
-    return gen_arith(ctx, a, EXT_NONE, tcg_gen_orc_tl);
+    return gen_logic(ctx, a, tcg_gen_orc_tl);
 }
=20
 static bool trans_xnor(DisasContext *ctx, arg_xnor *a)
 {
     REQUIRE_ZBB(ctx);
-    return gen_arith(ctx, a, EXT_NONE, tcg_gen_eqv_tl);
+    return gen_logic(ctx, a, tcg_gen_eqv_tl);
 }
=20
 static bool trans_min(DisasContext *ctx, arg_min *a)
diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_=
trans/trans_rvi.c.inc
index 4a2aefe3a5..51607b3d40 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -252,17 +252,17 @@ static bool trans_sltiu(DisasContext *ctx, arg_slti=
u *a)
=20
 static bool trans_xori(DisasContext *ctx, arg_xori *a)
 {
-    return gen_arith_imm_fn(ctx, a, EXT_NONE, tcg_gen_xori_tl);
+    return gen_logic_imm_fn(ctx, a, tcg_gen_xori_tl);
 }
=20
 static bool trans_ori(DisasContext *ctx, arg_ori *a)
 {
-    return gen_arith_imm_fn(ctx, a, EXT_NONE, tcg_gen_ori_tl);
+    return gen_logic_imm_fn(ctx, a, tcg_gen_ori_tl);
 }
=20
 static bool trans_andi(DisasContext *ctx, arg_andi *a)
 {
-    return gen_arith_imm_fn(ctx, a, EXT_NONE, tcg_gen_andi_tl);
+    return gen_logic_imm_fn(ctx, a, tcg_gen_andi_tl);
 }
=20
 static bool trans_slli(DisasContext *ctx, arg_slli *a)
@@ -319,7 +319,7 @@ static bool trans_sltu(DisasContext *ctx, arg_sltu *a=
)
=20
 static bool trans_xor(DisasContext *ctx, arg_xor *a)
 {
-    return gen_arith(ctx, a, EXT_NONE, tcg_gen_xor_tl);
+    return gen_logic(ctx, a, tcg_gen_xor_tl);
 }
=20
 static bool trans_srl(DisasContext *ctx, arg_srl *a)
@@ -334,12 +334,12 @@ static bool trans_sra(DisasContext *ctx, arg_sra *a=
)
=20
 static bool trans_or(DisasContext *ctx, arg_or *a)
 {
-    return gen_arith(ctx, a, EXT_NONE, tcg_gen_or_tl);
+    return gen_logic(ctx, a, tcg_gen_or_tl);
 }
=20
 static bool trans_and(DisasContext *ctx, arg_and *a)
 {
-    return gen_arith(ctx, a, EXT_NONE, tcg_gen_and_tl);
+    return gen_logic(ctx, a, tcg_gen_and_tl);
 }
=20
 static bool trans_addiw(DisasContext *ctx, arg_addiw *a)
--=20
2.31.1


