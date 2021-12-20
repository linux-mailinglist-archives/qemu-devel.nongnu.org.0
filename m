Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDEDC47A4B6
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 06:50:35 +0100 (CET)
Received: from localhost ([::1]:53608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzBZC-0006fu-Tp
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 00:50:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAmO-0004B2-J3
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 00:00:09 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:13367)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAmI-0008I4-Fw
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 00:00:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639976403; x=1671512403;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gJ2/DTBUXJvC5jtBwUgJJDw6WrLEJZCaCuHvQtVCVAQ=;
 b=CTrLBw5oVPXPICfhfZ+KDF7IPQ9fxchfRXAoIW1eGMtdipcCpe/atn4a
 ttgedy0GRtImjB3nStMnPMB5iUfOOQErKGBSkn0HaRyvKu1Cp+Bb7jStM
 vwsg45Ao1ZDvDjlwQkzVaWWS/r4CNrEqZzdSwHr6iqHzZ0ncVVf9t41Ns
 pQVeUCagYj9F5O2YIGDJP1YICju/hYsbsl19cC56dX49GXdmQ5CNFahyd
 6ONalMW68cCcE9AWFquBQ3VkZ9dCh/ao4UCgLOKF3nTpmhgJwZKqTOm0l
 UiGh5aTJx/0+9IErF9vXKsEtWvP4Q1cxQg7vT26Vprrq/MN6ET63N10DJ w==;
X-IronPort-AV: E=Sophos;i="5.88,219,1635177600"; d="scan'208";a="189680073"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2021 13:00:01 +0800
IronPort-SDR: lwl60ZHY40JtNMPW9gKkaS6Y5l0u4CRfVfzVQCgeME48VmfN0sHV0IDHqzCkoTUR6gvLLz+vPk
 hCU0+ZtmFHkIFV6hH3UOJJFszLJIJZSF6jP3wPpfmdx3oKoRIbM3MdxcL8HreRLngMbAmfdmHs
 yJIdfIxBn7KaSnVswg9607693ExcNC3h2cg/f3cUxhTujTSHNE4rTjQNiZKL7vSZOPJL4RrVI4
 aS8ec1nc1JJDNdRt+l2UfEgbydkl7reHjKUgdLgSq484G6eBaIBo6XMr1ZObb5zINX4Y70omyQ
 +Scf2wAmiW7kDWL9w52LSOcf
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:32:49 -0800
IronPort-SDR: /xKUaRnCmb3UgDmqcFqRAl6Qi0Aacdbyn5rfFu8/e+BdLe0mItf6N0p343uJhoOW6Vf9br0Tc/
 UKpJh7nIDdUrZ7Nk8EipuT19ALIabeYUe+2t7YU/kClsAKk0cCsI606QKfgYZ+EH9qimOxCFZ7
 qJL+FYiiF9m0s+CIgw4Jll+bnobPt/OtUPEYc7deVXznRPRG3RqxQUDoOY79k1BWYj36edf/5n
 zMtUi1Z6+uRoD1HbUwx2SL1IP0fhlMjWJUCA6TxsnJTBHkwuaYPFJEspeKxvAO8eWn7a0DBACH
 3lY=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 21:00:01 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JHS7h1FqTz1Rvlf
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 21:00:00 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1639976399; x=1642568400; bh=gJ2/DTBUXJvC5jtBwU
 gJJDw6WrLEJZCaCuHvQtVCVAQ=; b=CzA103SqrsyRe2yXCeCgvBfh3ZXAD57hFX
 wWgzzPmMiyvzQxhkrwFQKvP2+eGJA/KECRx9OhXELXtL5qT4t8SktK9BbdL6Xh2d
 YPvUJLhRe00zdW72ogtIkefjxLibjpT/ugdtxSbIRC/adXUAhUimemxLZRLZSvSe
 UOiKAD+eina1Jue0ENUgtP/oBVC+bgAzTIy+A1hu/rEp7B2Vg49+8I7Ir0W19V/D
 IL9PnreLxb9RjRZhMOKYO47N64btG1UsrKXqSl2M7rXsWzqqPEfnT05L8Vif8SDF
 GwzRcX2T/k1GtUJjrY/4XRe1D0sI9+jzRnZrtY73PqdMZLCDHQRQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id kS5Dzsg8ucby for <qemu-devel@nongnu.org>;
 Sun, 19 Dec 2021 20:59:59 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.68])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JHS7c3vR0z1RtVG;
 Sun, 19 Dec 2021 20:59:56 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 39/88] target/riscv: rvv-1.0: set-X-first mask bit instructions
Date: Mon, 20 Dec 2021 14:56:16 +1000
Message-Id: <20211220045705.62174-40-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211220045705.62174-1-alistair.francis@opensource.wdc.com>
References: <20211220045705.62174-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=9816edf2f=alistair.francis@opensource.wdc.com;
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20211210075704.23951-32-frank.chang@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn32.decode              | 6 +++---
 target/riscv/vector_helper.c            | 4 ----
 target/riscv/insn_trans/trans_rvv.c.inc | 5 ++++-
 3 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 4df2aa9cdd..d139c0aade 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -629,9 +629,9 @@ vmornot_mm      011100 - ..... ..... 010 ..... 101011=
1 @r
 vmxnor_mm       011111 - ..... ..... 010 ..... 1010111 @r
 vcpop_m         010000 . ..... 10000 010 ..... 1010111 @r2_vm
 vfirst_m        010000 . ..... 10001 010 ..... 1010111 @r2_vm
-vmsbf_m         010110 . ..... 00001 010 ..... 1010111 @r2_vm
-vmsif_m         010110 . ..... 00011 010 ..... 1010111 @r2_vm
-vmsof_m         010110 . ..... 00010 010 ..... 1010111 @r2_vm
+vmsbf_m         010100 . ..... 00001 010 ..... 1010111 @r2_vm
+vmsif_m         010100 . ..... 00011 010 ..... 1010111 @r2_vm
+vmsof_m         010100 . ..... 00010 010 ..... 1010111 @r2_vm
 viota_m         010110 . ..... 10000 010 ..... 1010111 @r2_vm
 vid_v           010110 . 00000 10001 010 ..... 1010111 @r1_vm
 vext_x_v        001100 1 ..... ..... 010 ..... 1010111 @r
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index f97783acf0..b0dc971a86 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4260,7 +4260,6 @@ enum set_mask_type {
 static void vmsetm(void *vd, void *v0, void *vs2, CPURISCVState *env,
                    uint32_t desc, enum set_mask_type type)
 {
-    uint32_t vlmax =3D env_archcpu(env)->cfg.vlen;
     uint32_t vm =3D vext_vm(desc);
     uint32_t vl =3D env->vl;
     int i;
@@ -4290,9 +4289,6 @@ static void vmsetm(void *vd, void *v0, void *vs2, C=
PURISCVState *env,
             }
         }
     }
-    for (; i < vlmax; i++) {
-        vext_set_elem_mask(vd, i, 0);
-    }
 }
=20
 void HELPER(vmsbf_m)(void *vd, void *v0, void *vs2, CPURISCVState *env,
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_=
trans/trans_rvv.c.inc
index 3645bb9635..9206e6f06c 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2731,7 +2731,10 @@ static bool trans_vfirst_m(DisasContext *s, arg_rm=
r *a)
 #define GEN_M_TRANS(NAME)                                          \
 static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
 {                                                                  \
-    if (vext_check_isa_ill(s)) {                                   \
+    if (require_rvv(s) &&                                          \
+        vext_check_isa_ill(s) &&                                   \
+        require_vm(a->vm, a->rd) &&                                \
+        (a->rd !=3D a->rs2)) {                                       \
         uint32_t data =3D 0;                                         \
         gen_helper_gvec_3_ptr *fn =3D gen_helper_##NAME;             \
         TCGLabel *over =3D gen_new_label();                          \
--=20
2.31.1


