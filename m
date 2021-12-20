Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 090F447A4D1
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 07:03:05 +0100 (CET)
Received: from localhost ([::1]:49846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzBlI-0007ES-2H
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 01:03:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAmD-0003xe-Ep
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 23:59:57 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:13362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAm9-0008HP-4k
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 23:59:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639976394; x=1671512394;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ud8Y0fnGXirDFSXN0fCyyB/IsH0IW4rtkGuJ02FTd/s=;
 b=NidLFml5JglRVvt/wFwtA/y+lfJEMiWhXT3ij5KtX4M7Qxj4tJLCanU8
 WsRNQ+vNylWpbL7HBgGtuy9rvYd5TS/vl8mVVTsUkBz8g9+c1TKBa6NWg
 4F3m+tjjwsJxSMKyA3AfOayOdoTNaCstxhBJJOa9/QYqs0Hw8yVLC0bfz
 9MM9E/Trp91nIDknKA7aFGGTQi08uZqB0Z5uZnauk1vKgQVVnPUvutrfK
 Vkj3zPqMHi+eN98JuP255thasCif4GuLbIAmFziGGob9dIBnHFWpQACMX
 YArwrKNMNDXjCEzz8NW7lYt/d9ExLe80WTCd/eoYlOnUHMWNkT3a74eUp Q==;
X-IronPort-AV: E=Sophos;i="5.88,219,1635177600"; d="scan'208";a="189680067"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2021 12:59:53 +0800
IronPort-SDR: qspmDs7OOjhXI5ZcGOtKh1vCWQ2BbqAad4QzpZrjft1YRfsirk8xtW+s6xKGeWGzyks/RzD3yn
 mBA3rF9sqODiPOBpz8Qkw67R91FVmO6k09d/EPicuNoabJgm11vDW+gYK2P+D3Y0n7Vp0whAH6
 X/gxzvbmqnm6RfY+YFegf8PuNApmbz6huSyyHZ3xQ46oVzbf+C1/+JprbaWWjdvAQkOMOzteUE
 lzeqsPY4p3jwu12DLQi52R5dZFlgwSEcAlcCQRT3JAQABV+m7InPrEOeTQN5M1QUa95xl7fcFp
 RkHtW7WQaIT2nFGzVEKlAuVf
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:32:41 -0800
IronPort-SDR: 4TDOJfZ7HoVk/6BxfOpKP0RruhcAio5iUpJkbso6+8akbMWvLLXJawMZvByyPFg4aOD1pBwTZS
 6vmOY9Me1eF2A96T87U/m8IuJWTJddXTnXMIFnjxXPeuXjaL7eUBiQJpqhZ85lUl5zvCZUD/eB
 POvFBws40Bztwj1I5gbllev3ShF1XOPCZr/woU7N4JVDE36KusRh7Nw5MfRZQMj5+QMNqrffBz
 0tQfx+AYmFo9h2dN8ngWYYPOMm6mf9S4d+WICyPPs6+kKcTzF5nGLsV9NpJT5fICSVKKezNKrh
 Viw=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:59:53 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JHS7X10jzz1Rwns
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 20:59:52 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1639976391; x=1642568392; bh=Ud8Y0fnGXirDFSXN0f
 CyyB/IsH0IW4rtkGuJ02FTd/s=; b=aGuqR5229khEEqo5LF9bZnQ94ux0dnZBwN
 bqRhnsx4YP2Ez/BvqPJjy1o4q9wwfx+9R7o0o7Kb0bkACAblNTbza+prbqPW9J9Q
 wYwyQDwibdiCEwVO5d0c2WEr+bu/TdxkXH0VZIvEH402g1VSUt0qqQlcqpxechSL
 zp6Bsh/Cg6nsSKAaoddPlpgpN+H+w1tXLS4mbd8XAmuhfW67gD+QCn76RR8guQF7
 lO+7J83zsmPX4JHpYFnVIe8nG8mFleGZv68Y/TjMg3VFZ10O7l8aaXJbB9cGaJ2p
 OMIbvkYW9YXAv7RzSAHDjHzjx2fVJ+sAbMAdSXR+W7p+iJKfMIfA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id wUWiX6CLndNg for <qemu-devel@nongnu.org>;
 Sun, 19 Dec 2021 20:59:51 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.68])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JHS7S4hNqz1RtVG;
 Sun, 19 Dec 2021 20:59:48 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 37/88] target/riscv: rvv-1.0: count population in mask
 instruction
Date: Mon, 20 Dec 2021 14:56:14 +1000
Message-Id: <20211220045705.62174-38-alistair.francis@opensource.wdc.com>
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
Message-Id: <20211210075704.23951-30-frank.chang@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/helper.h                   | 2 +-
 target/riscv/insn32.decode              | 2 +-
 target/riscv/vector_helper.c            | 6 +++---
 target/riscv/insn_trans/trans_rvv.c.inc | 7 ++++---
 4 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index b8894d6151..3f30882aec 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1020,7 +1020,7 @@ DEF_HELPER_6(vmnor_mm, void, ptr, ptr, ptr, ptr, en=
v, i32)
 DEF_HELPER_6(vmornot_mm, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vmxnor_mm, void, ptr, ptr, ptr, ptr, env, i32)
=20
-DEF_HELPER_4(vmpopc_m, tl, ptr, ptr, env, i32)
+DEF_HELPER_4(vcpop_m, tl, ptr, ptr, env, i32)
=20
 DEF_HELPER_4(vmfirst_m, tl, ptr, ptr, env, i32)
=20
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index f61eaf7c6b..e748f7ca71 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -627,7 +627,7 @@ vmor_mm         011010 - ..... ..... 010 ..... 101011=
1 @r
 vmnor_mm        011110 - ..... ..... 010 ..... 1010111 @r
 vmornot_mm      011100 - ..... ..... 010 ..... 1010111 @r
 vmxnor_mm       011111 - ..... ..... 010 ..... 1010111 @r
-vmpopc_m        010100 . ..... ----- 010 ..... 1010111 @r2_vm
+vcpop_m         010000 . ..... 10000 010 ..... 1010111 @r2_vm
 vmfirst_m       010101 . ..... ----- 010 ..... 1010111 @r2_vm
 vmsbf_m         010110 . ..... 00001 010 ..... 1010111 @r2_vm
 vmsif_m         010110 . ..... 00011 010 ..... 1010111 @r2_vm
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index f9919273dc..9451112b3d 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4214,9 +4214,9 @@ GEN_VEXT_MASK_VV(vmnor_mm, DO_NOR)
 GEN_VEXT_MASK_VV(vmornot_mm, DO_ORNOT)
 GEN_VEXT_MASK_VV(vmxnor_mm, DO_XNOR)
=20
-/* Vector mask population count vmpopc */
-target_ulong HELPER(vmpopc_m)(void *v0, void *vs2, CPURISCVState *env,
-                              uint32_t desc)
+/* Vector count population in mask vcpop */
+target_ulong HELPER(vcpop_m)(void *v0, void *vs2, CPURISCVState *env,
+                             uint32_t desc)
 {
     target_ulong cnt =3D 0;
     uint32_t vm =3D vext_vm(desc);
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_=
trans/trans_rvv.c.inc
index 5c04ac90da..b53cd2e6f3 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2664,8 +2664,8 @@ GEN_MM_TRANS(vmnor_mm)
 GEN_MM_TRANS(vmornot_mm)
 GEN_MM_TRANS(vmxnor_mm)
=20
-/* Vector mask population count vmpopc */
-static bool trans_vmpopc_m(DisasContext *s, arg_rmr *a)
+/* Vector count population in mask vcpop */
+static bool trans_vcpop_m(DisasContext *s, arg_rmr *a)
 {
     if (require_rvv(s) &&
         vext_check_isa_ill(s)) {
@@ -2684,11 +2684,12 @@ static bool trans_vmpopc_m(DisasContext *s, arg_r=
mr *a)
         tcg_gen_addi_ptr(src2, cpu_env, vreg_ofs(s, a->rs2));
         tcg_gen_addi_ptr(mask, cpu_env, vreg_ofs(s, 0));
=20
-        gen_helper_vmpopc_m(dst, mask, src2, cpu_env, desc);
+        gen_helper_vcpop_m(dst, mask, src2, cpu_env, desc);
         gen_set_gpr(s, a->rd, dst);
=20
         tcg_temp_free_ptr(mask);
         tcg_temp_free_ptr(src2);
+
         return true;
     }
     return false;
--=20
2.31.1


