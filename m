Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B286E47A4FA
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 07:24:39 +0100 (CET)
Received: from localhost ([::1]:36182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzC6A-0002hi-Pg
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 01:24:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAnV-0004Mv-AP
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 00:01:18 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:13394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAnB-0008Lj-3G
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 00:01:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639976458; x=1671512458;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zZAxSxREizNj6oG4uH28xDm2L1l2NBsnTFniT5HJ9w0=;
 b=ZnrE3HAmO5ohEtGJ/owCgHYdj2XObqa6S4jpeNaCWN1bee3O1DND8GlZ
 NVjCY2FBlPdoserW0xjZHAxmt6Cft2FlMfPAIbWwxlzS55grH1hr/oQwd
 NjhUtGpsUqGJwt+gnDEzPFVtlKCQ6IWXgZQfY/ACf2fMHlNJafKrfzit3
 GO99C32sW8OJB4jCjMH8R7Xz2esqlu18Kqd/nJVSENLuSZYmATjREocHe
 AXbOQbfZ5x4dTl6Y5csoONxqVpnrMdKOVmQP9WqKUepsUhqr85Gk1QY7h
 DvRkDjapPoZCJl6+UTeEVQAI73Qx6ZlNfybAHTud9U63hH7YGfiOCHf87 w==;
X-IronPort-AV: E=Sophos;i="5.88,219,1635177600"; d="scan'208";a="189680123"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2021 13:00:35 +0800
IronPort-SDR: oad89uW2S9c63ABZGdsUuPcB1m5CJIxqoxiOogc7aIBpyZg/Asp6x1XR5v/IFU2+5veBRDpZyJ
 rU6WSCTrc0i4xepPOydc/KzmhAWLdiWgFjW+q7VRmS626X4ZZi1dkfondWBaHKUFpJsn1CCyeY
 3QEkeOeOvkYziuWEJsEh7JfVcbzyzJPZ3CUaSip/aHz0aU6kv7Kaj1QhVFzBDDrnk/69EJd0re
 w79z5aQRwJZ+yuFhclRhvXPXNX/zmySVo81AsB2ro5YX1vZuQ7ICbEsPcpZ3l07cS/AUUqAV7b
 nUVbc1TUmGYCevXx8jIzaEbt
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:33:23 -0800
IronPort-SDR: SBryWRt1LoOTpO63CRC/FfHmm6voVNyKhQKblwLwufPvjtnL1Lxi6XudMzYU9z4z5vLOCZU3yz
 0USuD64TDWLMBRfkrqPVjmWx/a0nm/awEm+HjY3HRuYZN6VaUmzbHgB0w40IN4U3e9ItykF8nL
 /PeTYRJTBPnDnWtbrT4UbaiZUxDWG/BneSpwcSPv7SqEEnmMbo8eQEBmt2Oi4CVmlDgL/Ka32Y
 PwPEXhWXFugy9/dm40NIcRvGqhnKuq/Ajy3O5uFNJpyby+ru2GNY9hFysoQAqnDptAaB4TZV9C
 p/8=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 21:00:35 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JHS8K6dwyz1RvTg
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 21:00:33 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1639976433; x=1642568434; bh=zZAxSxREizNj6oG4uH
 28xDm2L1l2NBsnTFniT5HJ9w0=; b=fVs2IxQZjC5OFVXj7zHAqV0LxXqaOc6D8P
 wxYzI/UlPeWmnAzaSdonbrNddk2oJd4AIpu4KNxdG+9Y0v50Jy0jPvrHOYn41LDe
 5niMMMknlrwc/TcwtNQlmuVPi1WwSGFpmQeqPxs17hd3hSzi0cffhzoOZR83hNNO
 +1eKPfUl1KvoZjGHQSgTet4XkP1XKDzjQ8khYsGvmblGGbd8QNQerTaIPXpgQc6/
 Mv5RjS6FlP2doabpPOXdyxyaJXwh6SpWO3Ppuu3CiovNelQuhxYsyhCYtsG+LRIM
 IOlBxGSB/UJRpyHvrnO4L+fGRQC1R5mE4P59EXQdKQ8HAs07sgVw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 12pARonuJ3a5 for <qemu-devel@nongnu.org>;
 Sun, 19 Dec 2021 21:00:33 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.68])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JHS8G2PVFz1RtVG;
 Sun, 19 Dec 2021 21:00:29 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 48/88] target/riscv: rvv-1.0: integer extension instructions
Date: Mon, 20 Dec 2021 14:56:25 +1000
Message-Id: <20211220045705.62174-49-alistair.francis@opensource.wdc.com>
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

Add the following instructions:

* vzext.vf2
* vzext.vf4
* vzext.vf8
* vsext.vf2
* vsext.vf4
* vsext.vf8

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211210075704.23951-41-frank.chang@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/helper.h                   | 14 +++++
 target/riscv/insn32.decode              |  8 +++
 target/riscv/vector_helper.c            | 31 ++++++++++
 target/riscv/insn_trans/trans_rvv.c.inc | 80 +++++++++++++++++++++++++
 4 files changed, 133 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index bd0768d048..878d82caf6 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1072,3 +1072,17 @@ DEF_HELPER_6(vcompress_vm_b, void, ptr, ptr, ptr, =
ptr, env, i32)
 DEF_HELPER_6(vcompress_vm_h, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vcompress_vm_w, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vcompress_vm_d, void, ptr, ptr, ptr, ptr, env, i32)
+
+DEF_HELPER_5(vzext_vf2_h, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vzext_vf2_w, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vzext_vf2_d, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vzext_vf4_w, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vzext_vf4_d, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vzext_vf8_d, void, ptr, ptr, ptr, env, i32)
+
+DEF_HELPER_5(vsext_vf2_h, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vsext_vf2_w, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vsext_vf2_d, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vsext_vf4_w, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vsext_vf4_d, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vsext_vf8_d, void, ptr, ptr, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 06a8076311..a6f9e5dcc6 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -655,6 +655,14 @@ vmv2r_v         100111 1 ..... 00001 011 ..... 10101=
11 @r2rd
 vmv4r_v         100111 1 ..... 00011 011 ..... 1010111 @r2rd
 vmv8r_v         100111 1 ..... 00111 011 ..... 1010111 @r2rd
=20
+# Vector Integer Extension
+vzext_vf2       010010 . ..... 00110 010 ..... 1010111 @r2_vm
+vzext_vf4       010010 . ..... 00100 010 ..... 1010111 @r2_vm
+vzext_vf8       010010 . ..... 00010 010 ..... 1010111 @r2_vm
+vsext_vf2       010010 . ..... 00111 010 ..... 1010111 @r2_vm
+vsext_vf4       010010 . ..... 00101 010 ..... 1010111 @r2_vm
+vsext_vf8       010010 . ..... 00011 010 ..... 1010111 @r2_vm
+
 vsetvli         0 ........... ..... 111 ..... 1010111  @r2_zimm
 vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
=20
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 86d03d8e39..58ba2a7d99 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4544,3 +4544,34 @@ GEN_VEXT_VCOMPRESS_VM(vcompress_vm_b, uint8_t,  H1=
)
 GEN_VEXT_VCOMPRESS_VM(vcompress_vm_h, uint16_t, H2)
 GEN_VEXT_VCOMPRESS_VM(vcompress_vm_w, uint32_t, H4)
 GEN_VEXT_VCOMPRESS_VM(vcompress_vm_d, uint64_t, H8)
+
+/* Vector Integer Extension */
+#define GEN_VEXT_INT_EXT(NAME, ETYPE, DTYPE, HD, HS1)            \
+void HELPER(NAME)(void *vd, void *v0, void *vs2,                 \
+                  CPURISCVState *env, uint32_t desc)             \
+{                                                                \
+    uint32_t vl =3D env->vl;                                       \
+    uint32_t vm =3D vext_vm(desc);                                 \
+    uint32_t i;                                                  \
+                                                                 \
+    for (i =3D 0; i < vl; i++) {                                   \
+        if (!vm && !vext_elem_mask(v0, i)) {                     \
+            continue;                                            \
+        }                                                        \
+        *((ETYPE *)vd + HD(i)) =3D *((DTYPE *)vs2 + HS1(i));       \
+    }                                                            \
+}
+
+GEN_VEXT_INT_EXT(vzext_vf2_h, uint16_t, uint8_t,  H2, H1)
+GEN_VEXT_INT_EXT(vzext_vf2_w, uint32_t, uint16_t, H4, H2)
+GEN_VEXT_INT_EXT(vzext_vf2_d, uint64_t, uint32_t, H8, H4)
+GEN_VEXT_INT_EXT(vzext_vf4_w, uint32_t, uint8_t,  H4, H1)
+GEN_VEXT_INT_EXT(vzext_vf4_d, uint64_t, uint16_t, H8, H2)
+GEN_VEXT_INT_EXT(vzext_vf8_d, uint64_t, uint8_t,  H8, H1)
+
+GEN_VEXT_INT_EXT(vsext_vf2_h, int16_t, int8_t,  H2, H1)
+GEN_VEXT_INT_EXT(vsext_vf2_w, int32_t, int16_t, H4, H2)
+GEN_VEXT_INT_EXT(vsext_vf2_d, int64_t, int32_t, H8, H4)
+GEN_VEXT_INT_EXT(vsext_vf4_w, int32_t, int8_t,  H4, H1)
+GEN_VEXT_INT_EXT(vsext_vf4_d, int64_t, int16_t, H8, H2)
+GEN_VEXT_INT_EXT(vsext_vf8_d, int64_t, int8_t,  H8, H1)
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_=
trans/trans_rvv.c.inc
index 91e7c14ec4..5285e21cc0 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -3284,3 +3284,83 @@ GEN_VMV_WHOLE_TRANS(vmv1r_v, 1)
 GEN_VMV_WHOLE_TRANS(vmv2r_v, 2)
 GEN_VMV_WHOLE_TRANS(vmv4r_v, 4)
 GEN_VMV_WHOLE_TRANS(vmv8r_v, 8)
+
+static bool int_ext_check(DisasContext *s, arg_rmr *a, uint8_t div)
+{
+    uint8_t from =3D (s->sew + 3) - div;
+    bool ret =3D require_rvv(s) &&
+        (from >=3D 3 && from <=3D 8) &&
+        (a->rd !=3D a->rs2) &&
+        require_align(a->rd, s->lmul) &&
+        require_align(a->rs2, s->lmul - div) &&
+        require_vm(a->vm, a->rd) &&
+        require_noover(a->rd, s->lmul, a->rs2, s->lmul - div);
+    return ret;
+}
+
+static bool int_ext_op(DisasContext *s, arg_rmr *a, uint8_t seq)
+{
+    uint32_t data =3D 0;
+    gen_helper_gvec_3_ptr *fn;
+    TCGLabel *over =3D gen_new_label();
+    tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
+
+    static gen_helper_gvec_3_ptr * const fns[6][4] =3D {
+        {
+            NULL, gen_helper_vzext_vf2_h,
+            gen_helper_vzext_vf2_w, gen_helper_vzext_vf2_d
+        },
+        {
+            NULL, NULL,
+            gen_helper_vzext_vf4_w, gen_helper_vzext_vf4_d,
+        },
+        {
+            NULL, NULL,
+            NULL, gen_helper_vzext_vf8_d
+        },
+        {
+            NULL, gen_helper_vsext_vf2_h,
+            gen_helper_vsext_vf2_w, gen_helper_vsext_vf2_d
+        },
+        {
+            NULL, NULL,
+            gen_helper_vsext_vf4_w, gen_helper_vsext_vf4_d,
+        },
+        {
+            NULL, NULL,
+            NULL, gen_helper_vsext_vf8_d
+        }
+    };
+
+    fn =3D fns[seq][s->sew];
+    if (fn =3D=3D NULL) {
+        return false;
+    }
+
+    data =3D FIELD_DP32(data, VDATA, VM, a->vm);
+
+    tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
+                       vreg_ofs(s, a->rs2), cpu_env,
+                       s->vlen / 8, s->vlen / 8, data, fn);
+
+    mark_vs_dirty(s);
+    gen_set_label(over);
+    return true;
+}
+
+/* Vector Integer Extension */
+#define GEN_INT_EXT_TRANS(NAME, DIV, SEQ)             \
+static bool trans_##NAME(DisasContext *s, arg_rmr *a) \
+{                                                     \
+    if (int_ext_check(s, a, DIV)) {                   \
+        return int_ext_op(s, a, SEQ);                 \
+    }                                                 \
+    return false;                                     \
+}
+
+GEN_INT_EXT_TRANS(vzext_vf2, 1, 0)
+GEN_INT_EXT_TRANS(vzext_vf4, 2, 1)
+GEN_INT_EXT_TRANS(vzext_vf8, 3, 2)
+GEN_INT_EXT_TRANS(vsext_vf2, 1, 3)
+GEN_INT_EXT_TRANS(vsext_vf4, 2, 4)
+GEN_INT_EXT_TRANS(vsext_vf8, 3, 5)
--=20
2.31.1


