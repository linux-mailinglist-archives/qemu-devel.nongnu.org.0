Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 155EE47A492
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 06:29:39 +0100 (CET)
Received: from localhost ([::1]:47676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzBEv-0007cD-P0
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 00:29:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAlt-00034m-9F
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 23:59:37 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:13345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAlq-0008EU-P0
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 23:59:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639976375; x=1671512375;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PZfnV7oLu8KKTzP/4AhXWa+yHX6sSYpbKddDPRLBipE=;
 b=BnbGEFXF3z0NLqLf70BxH1QYHB3oy/ohZt1RywdyobX0z2Y5/AQzZHf2
 KALp8vAUUmQQAo6vJ4C9J9CXSuv95pO3ukjEOlixzGvU1+xXm/0SjnT1D
 Uzc6BpjxnYylaSMw2Jdn44x3b5ww44svxgJd37IZEM+5Dy9l9u1BUmART
 Pubb7Z0EMZ0rBiZpakwEgvST7CNNocTTbGN+DUaus8Bv475FFuSYG/rWB
 ZIbzoyZRRu1VqCzsf/7cOOcgXM/QscIT58mts4lYZ2uXFpl7ii/146wAc
 WwcO4PzAITMqaEiYUuOQsyiYUW5n5W3RUMXmiJNr1mF8sx++zVAnsMVcB Q==;
X-IronPort-AV: E=Sophos;i="5.88,219,1635177600"; d="scan'208";a="189680051"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2021 12:59:33 +0800
IronPort-SDR: jcNxvYzvnqhmVQu31ubQvcnU/HQMr9JksDqssGglndn0lN0t+RRnMb14/jChCastv3hbco1d2g
 51aAV5MX8NH51KzACQ1DU4X92pyaSz79C6YDhYEf2cT9vkZJAvEjuefLlB2KxHf8Y9PU6hZfam
 x7V8mzrN1SWcYLiWFI25RFIE4Qxhi4+S9kRdM3EbX9UWfbqI2CR6og67TZzATMrdBqcPsLkgC4
 dtIoFHsgXNzRnRD/sC5jGA0tN3QX43rt2zB/1ZgPIXAGwniGYUkpCqsb2dFvQMSY0QNza8+0HH
 oLT7Z8p5jIh0qZDP+/+Fyhb4
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:32:22 -0800
IronPort-SDR: VL2C1oRIFshhyrZXyaNHESNBxQsTdIC+tHnKOSDfjFJmuUW/Ngc3dmZzPFoxdMTp78XJXBiYD3
 R7OUdqCd6nTOB9w02wrvg+hysMxeUnTGVt19BEVXqb/UiM6I8f4i5O7mZx8obAIp9SorQw89BB
 wArmIM82xbfH9Fyi4bG45tqlbSstGA/UQaCAhjHbrwmupl1m0SqJVM7W6x+UV2EPak62lyXOsY
 45c4EZX4FWWJYX/Man1GRAeifFpHjQlfuYEpT0AtmKxAU6aW3eFza7F6/aSvwll2sDRlWSkntc
 XiA=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:59:34 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JHS786cwsz1RtVG
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 20:59:32 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1639976372; x=1642568373; bh=PZfnV7oLu8KKTzP/4A
 hXWa+yHX6sSYpbKddDPRLBipE=; b=MUg8omwQpLybT1ljTf0LkgeZGUJ64BIq65
 XUIZ7b3SvxrAveUCXUx98nHOywucTqWzV98rCYp7XEwibQY4O9dZUgKY8DNpC7lH
 faLTmOcNIulgAxO0QIOPMnI+JHjwgCPxVIRY0EygE9FBidsHGGID0ysQKV3tZS/B
 pDQ/hWeP7xYRN0j/kZH0RVzF6fc2fU1zQeaXVXB0cYXRGKIXMCbys9/Fpw0Dy5WH
 3r4iwhrkuDhkrxsd1FSF+Di/XOsY2ZvdyTkjDzePcw1KPj+xnK/Y23v1jk9kLPbT
 f8LrELfBoJ3VilgMa7EhUlna7Mh7wpbY+B5ee/IHvez9qqLs0uRg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id C-X3QwBPbL-X for <qemu-devel@nongnu.org>;
 Sun, 19 Dec 2021 20:59:32 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.68])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JHS755TQlz1RwFN;
 Sun, 19 Dec 2021 20:59:29 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 32/88] target/riscv: rvv-1.0: load/store whole register
 instructions
Date: Mon, 20 Dec 2021 14:56:09 +1000
Message-Id: <20211220045705.62174-33-alistair.francis@opensource.wdc.com>
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

* vl<nf>re<eew>.v
* vs<nf>r.v

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20211210075704.23951-25-frank.chang@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/helper.h                   | 21 ++++++++
 target/riscv/insn32.decode              | 22 ++++++++
 target/riscv/vector_helper.c            | 65 +++++++++++++++++++++++
 target/riscv/insn_trans/trans_rvv.c.inc | 68 +++++++++++++++++++++++++
 4 files changed, 176 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 57560b8c04..b8894d6151 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -173,6 +173,27 @@ DEF_HELPER_5(vle16ff_v, void, ptr, ptr, tl, env, i32=
)
 DEF_HELPER_5(vle32ff_v, void, ptr, ptr, tl, env, i32)
 DEF_HELPER_5(vle64ff_v, void, ptr, ptr, tl, env, i32)
=20
+DEF_HELPER_4(vl1re8_v, void, ptr, tl, env, i32)
+DEF_HELPER_4(vl1re16_v, void, ptr, tl, env, i32)
+DEF_HELPER_4(vl1re32_v, void, ptr, tl, env, i32)
+DEF_HELPER_4(vl1re64_v, void, ptr, tl, env, i32)
+DEF_HELPER_4(vl2re8_v, void, ptr, tl, env, i32)
+DEF_HELPER_4(vl2re16_v, void, ptr, tl, env, i32)
+DEF_HELPER_4(vl2re32_v, void, ptr, tl, env, i32)
+DEF_HELPER_4(vl2re64_v, void, ptr, tl, env, i32)
+DEF_HELPER_4(vl4re8_v, void, ptr, tl, env, i32)
+DEF_HELPER_4(vl4re16_v, void, ptr, tl, env, i32)
+DEF_HELPER_4(vl4re32_v, void, ptr, tl, env, i32)
+DEF_HELPER_4(vl4re64_v, void, ptr, tl, env, i32)
+DEF_HELPER_4(vl8re8_v, void, ptr, tl, env, i32)
+DEF_HELPER_4(vl8re16_v, void, ptr, tl, env, i32)
+DEF_HELPER_4(vl8re32_v, void, ptr, tl, env, i32)
+DEF_HELPER_4(vl8re64_v, void, ptr, tl, env, i32)
+DEF_HELPER_4(vs1r_v, void, ptr, tl, env, i32)
+DEF_HELPER_4(vs2r_v, void, ptr, tl, env, i32)
+DEF_HELPER_4(vs4r_v, void, ptr, tl, env, i32)
+DEF_HELPER_4(vs8r_v, void, ptr, tl, env, i32)
+
 DEF_HELPER_6(vadd_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vadd_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vadd_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 180d97ecba..7d8441d1f2 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -332,6 +332,28 @@ vle16ff_v     ... 000 . 10000 ..... 101 ..... 000011=
1 @r2_nfvm
 vle32ff_v     ... 000 . 10000 ..... 110 ..... 0000111 @r2_nfvm
 vle64ff_v     ... 000 . 10000 ..... 111 ..... 0000111 @r2_nfvm
=20
+# Vector whole register insns
+vl1re8_v      000 000 1 01000 ..... 000 ..... 0000111 @r2
+vl1re16_v     000 000 1 01000 ..... 101 ..... 0000111 @r2
+vl1re32_v     000 000 1 01000 ..... 110 ..... 0000111 @r2
+vl1re64_v     000 000 1 01000 ..... 111 ..... 0000111 @r2
+vl2re8_v      001 000 1 01000 ..... 000 ..... 0000111 @r2
+vl2re16_v     001 000 1 01000 ..... 101 ..... 0000111 @r2
+vl2re32_v     001 000 1 01000 ..... 110 ..... 0000111 @r2
+vl2re64_v     001 000 1 01000 ..... 111 ..... 0000111 @r2
+vl4re8_v      011 000 1 01000 ..... 000 ..... 0000111 @r2
+vl4re16_v     011 000 1 01000 ..... 101 ..... 0000111 @r2
+vl4re32_v     011 000 1 01000 ..... 110 ..... 0000111 @r2
+vl4re64_v     011 000 1 01000 ..... 111 ..... 0000111 @r2
+vl8re8_v      111 000 1 01000 ..... 000 ..... 0000111 @r2
+vl8re16_v     111 000 1 01000 ..... 101 ..... 0000111 @r2
+vl8re32_v     111 000 1 01000 ..... 110 ..... 0000111 @r2
+vl8re64_v     111 000 1 01000 ..... 111 ..... 0000111 @r2
+vs1r_v        000 000 1 01000 ..... 000 ..... 0100111 @r2
+vs2r_v        001 000 1 01000 ..... 000 ..... 0100111 @r2
+vs4r_v        011 000 1 01000 ..... 000 ..... 0100111 @r2
+vs8r_v        111 000 1 01000 ..... 000 ..... 0100111 @r2
+
 # *** new major opcode OP-V ***
 vadd_vv         000000 . ..... ..... 000 ..... 1010111 @r_vm
 vadd_vx         000000 . ..... ..... 100 ..... 1010111 @r_vm
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 0e7bf5d27f..9a39a0e2d2 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -543,6 +543,71 @@ GEN_VEXT_LDFF(vle64ff_v, int64_t, lde_d)
 #define DO_MAXU(N, M) DO_MAX((UMTYPE)N, (UMTYPE)M)
 #define DO_MINU(N, M) DO_MIN((UMTYPE)N, (UMTYPE)M)
=20
+/*
+ *** load and store whole register instructions
+ */
+static void
+vext_ldst_whole(void *vd, target_ulong base, CPURISCVState *env, uint32_=
t desc,
+                vext_ldst_elem_fn *ldst_elem, uint32_t esz, uintptr_t ra=
,
+                MMUAccessType access_type)
+{
+    uint32_t i, k;
+    uint32_t nf =3D vext_nf(desc);
+    uint32_t vlenb =3D env_archcpu(env)->cfg.vlen >> 3;
+    uint32_t max_elems =3D vlenb >> esz;
+
+    /* probe every access */
+    probe_pages(env, base, vlenb * nf, ra, access_type);
+
+    /* load bytes from guest memory */
+    for (k =3D 0; k < nf; k++) {
+        for (i =3D 0; i < max_elems; i++) {
+            target_ulong addr =3D base + ((i + k * max_elems) << esz);
+            ldst_elem(env, addr, i + k * max_elems, vd, ra);
+        }
+    }
+}
+
+#define GEN_VEXT_LD_WHOLE(NAME, ETYPE, LOAD_FN)      \
+void HELPER(NAME)(void *vd, target_ulong base,       \
+                  CPURISCVState *env, uint32_t desc) \
+{                                                    \
+    vext_ldst_whole(vd, base, env, desc, LOAD_FN,    \
+                    ctzl(sizeof(ETYPE)), GETPC(),    \
+                    MMU_DATA_LOAD);                  \
+}
+
+GEN_VEXT_LD_WHOLE(vl1re8_v,  int8_t,  lde_b)
+GEN_VEXT_LD_WHOLE(vl1re16_v, int16_t, lde_h)
+GEN_VEXT_LD_WHOLE(vl1re32_v, int32_t, lde_w)
+GEN_VEXT_LD_WHOLE(vl1re64_v, int64_t, lde_d)
+GEN_VEXT_LD_WHOLE(vl2re8_v,  int8_t,  lde_b)
+GEN_VEXT_LD_WHOLE(vl2re16_v, int16_t, lde_h)
+GEN_VEXT_LD_WHOLE(vl2re32_v, int32_t, lde_w)
+GEN_VEXT_LD_WHOLE(vl2re64_v, int64_t, lde_d)
+GEN_VEXT_LD_WHOLE(vl4re8_v,  int8_t,  lde_b)
+GEN_VEXT_LD_WHOLE(vl4re16_v, int16_t, lde_h)
+GEN_VEXT_LD_WHOLE(vl4re32_v, int32_t, lde_w)
+GEN_VEXT_LD_WHOLE(vl4re64_v, int64_t, lde_d)
+GEN_VEXT_LD_WHOLE(vl8re8_v,  int8_t,  lde_b)
+GEN_VEXT_LD_WHOLE(vl8re16_v, int16_t, lde_h)
+GEN_VEXT_LD_WHOLE(vl8re32_v, int32_t, lde_w)
+GEN_VEXT_LD_WHOLE(vl8re64_v, int64_t, lde_d)
+
+#define GEN_VEXT_ST_WHOLE(NAME, ETYPE, STORE_FN)     \
+void HELPER(NAME)(void *vd, target_ulong base,       \
+                  CPURISCVState *env, uint32_t desc) \
+{                                                    \
+    vext_ldst_whole(vd, base, env, desc, STORE_FN,   \
+                    ctzl(sizeof(ETYPE)), GETPC(),    \
+                    MMU_DATA_STORE);                 \
+}
+
+GEN_VEXT_ST_WHOLE(vs1r_v, int8_t, ste_b)
+GEN_VEXT_ST_WHOLE(vs2r_v, int8_t, ste_b)
+GEN_VEXT_ST_WHOLE(vs4r_v, int8_t, ste_b)
+GEN_VEXT_ST_WHOLE(vs8r_v, int8_t, ste_b)
+
 /*
  *** Vector Integer Arithmetic Instructions
  */
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_=
trans/trans_rvv.c.inc
index 5b5285b33f..5e8e49d43f 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -960,6 +960,74 @@ GEN_VEXT_TRANS(vle16ff_v, MO_16, r2nfvm, ldff_op, ld=
_us_check)
 GEN_VEXT_TRANS(vle32ff_v, MO_32, r2nfvm, ldff_op, ld_us_check)
 GEN_VEXT_TRANS(vle64ff_v, MO_64, r2nfvm, ldff_op, ld_us_check)
=20
+/*
+ * load and store whole register instructions
+ */
+typedef void gen_helper_ldst_whole(TCGv_ptr, TCGv, TCGv_env, TCGv_i32);
+
+static bool ldst_whole_trans(uint32_t vd, uint32_t rs1, uint32_t nf,
+                             gen_helper_ldst_whole *fn, DisasContext *s,
+                             bool is_store)
+{
+    TCGv_ptr dest;
+    TCGv base;
+    TCGv_i32 desc;
+
+    uint32_t data =3D FIELD_DP32(0, VDATA, NF, nf);
+    dest =3D tcg_temp_new_ptr();
+    desc =3D tcg_constant_i32(simd_desc(s->vlen / 8, s->vlen / 8, data))=
;
+
+    base =3D get_gpr(s, rs1, EXT_NONE);
+    tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, vd));
+
+    fn(dest, base, cpu_env, desc);
+
+    tcg_temp_free_ptr(dest);
+
+    if (!is_store) {
+        mark_vs_dirty(s);
+    }
+
+    return true;
+}
+
+/*
+ * load and store whole register instructions ignore vtype and vl settin=
g.
+ * Thus, we don't need to check vill bit. (Section 7.9)
+ */
+#define GEN_LDST_WHOLE_TRANS(NAME, ARG_NF, IS_STORE)                    =
  \
+static bool trans_##NAME(DisasContext *s, arg_##NAME * a)               =
  \
+{                                                                       =
  \
+    if (require_rvv(s) &&                                               =
  \
+        QEMU_IS_ALIGNED(a->rd, ARG_NF)) {                               =
  \
+        return ldst_whole_trans(a->rd, a->rs1, ARG_NF, gen_helper_##NAME=
, \
+                                s, IS_STORE);                           =
  \
+    }                                                                   =
  \
+    return false;                                                       =
  \
+}
+
+GEN_LDST_WHOLE_TRANS(vl1re8_v,  1, false)
+GEN_LDST_WHOLE_TRANS(vl1re16_v, 1, false)
+GEN_LDST_WHOLE_TRANS(vl1re32_v, 1, false)
+GEN_LDST_WHOLE_TRANS(vl1re64_v, 1, false)
+GEN_LDST_WHOLE_TRANS(vl2re8_v,  2, false)
+GEN_LDST_WHOLE_TRANS(vl2re16_v, 2, false)
+GEN_LDST_WHOLE_TRANS(vl2re32_v, 2, false)
+GEN_LDST_WHOLE_TRANS(vl2re64_v, 2, false)
+GEN_LDST_WHOLE_TRANS(vl4re8_v,  4, false)
+GEN_LDST_WHOLE_TRANS(vl4re16_v, 4, false)
+GEN_LDST_WHOLE_TRANS(vl4re32_v, 4, false)
+GEN_LDST_WHOLE_TRANS(vl4re64_v, 4, false)
+GEN_LDST_WHOLE_TRANS(vl8re8_v,  8, false)
+GEN_LDST_WHOLE_TRANS(vl8re16_v, 8, false)
+GEN_LDST_WHOLE_TRANS(vl8re32_v, 8, false)
+GEN_LDST_WHOLE_TRANS(vl8re64_v, 8, false)
+
+GEN_LDST_WHOLE_TRANS(vs1r_v, 1, true)
+GEN_LDST_WHOLE_TRANS(vs2r_v, 2, true)
+GEN_LDST_WHOLE_TRANS(vs4r_v, 4, true)
+GEN_LDST_WHOLE_TRANS(vs8r_v, 8, true)
+
 /*
  *** Vector Integer Arithmetic Instructions
  */
--=20
2.31.1


