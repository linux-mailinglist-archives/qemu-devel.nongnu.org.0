Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6315947A498
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 06:33:37 +0100 (CET)
Received: from localhost ([::1]:54066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzBIm-0003kd-6d
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 00:33:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAlR-0001xf-DT
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 23:59:09 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:51452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAlP-0008Bi-Hv
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 23:59:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639976347; x=1671512347;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=x76UYCYI0xQhM+yS/aQwZsZtYYuKMD+EA0AvkOGUhLU=;
 b=p46ZddD0zxN3lMtuZLoYcZJdJor7BYIbCwD/iKZCaVtNiDn5rBsScNVI
 1XpWw7PEd8y6Ohn+HysZx7EjjKR3wKXHX1miMIgTh7KQHRNm3DbLTPUkD
 JAPI5ilHb0+PUHe/F3kWLtahWdFQICDBb5lcChAdwAj8P6XWZGr8f4J4S
 WtykHz/ITfipg42ZzHrS9Tz9Z3ykmvTjieHy5C513b8WkxO22Da++jvWX
 NcdlVgPhdLkj4gO5CsI7GY3yruzld2B0kTWoB8Z8RBTFO1pFiNal2h2yS
 qnIp5g+W+4TtYGJMphWTJb9M9K2/TMLc0Y7H77HeTvQyxFJsGHvruZ3PY A==;
X-IronPort-AV: E=Sophos;i="5.88,219,1635177600"; d="scan'208";a="292661948"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2021 12:59:06 +0800
IronPort-SDR: GXPMn68CnrfWgpMowEnmTeXMDdVjVurazi4L2o1rFGFipVlFqcoXaQf628cG0GQqgFtGVVxOa6
 lDCwJiYuWKN5pLevplmiYrTrY4gQUvvGvRn98c+O2tBQNLUVNarTiDeXC4JS1hCPvrpWMy0PUQ
 kYLEx8RceqLUb96yn8gIwvabapcW8dc5lrMkv9+nJ4yNrt2nysVdPzZqCExUzmQYfnkNcOzIi5
 FCHL5W6qFql5Im1e6E9eMVlywv998bxcy4xCdTcKPhEGYu+AvqI/PWwXUFPQiqK0hnj/MEDo/x
 QYeR9+8AohbGFPG7Vt0zrIT1
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:31:55 -0800
IronPort-SDR: OJ4/5p7dzZbq5BtpcrWLczMj/IxJC4TOoodS/NzXOAsyAV6GWrXI5o6dPXipKa/ybVH5KcqieW
 MsGN7HgR5m28pkL1hgTypuHYSJ1nX2jF7MFOwESRUqLnh8FA/F2DbeDnlXFEd9pras2CpQraqO
 CC+U6YOD/cPvdLIr8uh+W99l7pkEZrkAuqR5WxBsfEoiQ9OotNFkXDt754aALx2xTe7rAjzOBh
 2UkdDKhEvivclA7J2dmbevnLakJCCW9pBE/syUcFGs8Fr8DkGCSV5O/E7zes6udqa0Q/hpIiVA
 2xQ=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:59:07 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JHS6f0Wszz1RtVG
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 20:59:06 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1639976345; x=1642568346; bh=x76UYCYI0xQhM+yS/a
 QwZsZtYYuKMD+EA0AvkOGUhLU=; b=uXjrAb/Cttown9sy7y/nVt9QnScZ0/0sR/
 2D6mgBmD31zcSzwsYCNl+X96aWYUJkMHuBO2rpZU1fmpTfy58k9tAkQdMo+aLEeJ
 3dV/C5ooSkfN5Q7OsMp2r6TC0LG9szN/0gBpAw3TtaGOa3DUM3qpogOJxlqvFqTS
 kn1KahCs/x37xPOfguppfmrL+/0LUBuD8hhKQDBFybfQ3y4igdeXUrBaYa1gkj48
 xJhvoC/eh+wb3knJ30xJ96tg5I7DSAXpn8tBaMZHHhAzX7ue3SIw+ysnpYHGCZoT
 A88Kdn2RHzU6n2NkGJC0tlGh1ajWx5Eyz0pkNqKZNO5TWQXR4gfQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id Y5cd8-496UWG for <qemu-devel@nongnu.org>;
 Sun, 19 Dec 2021 20:59:05 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.68])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JHS6Z2nM1z1RvTg;
 Sun, 19 Dec 2021 20:59:01 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 25/88] target/riscv: rvv:1.0: add translation-time nan-box
 helper function
Date: Mon, 20 Dec 2021 14:56:02 +1000
Message-Id: <20211220045705.62174-26-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211220045705.62174-1-alistair.francis@opensource.wdc.com>
References: <20211220045705.62174-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=9816edf2f=alistair.francis@opensource.wdc.com;
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

From: Frank Chang <frank.chang@sifive.com>

* Add fp16 nan-box check generator function, if a 16-bit input is not
  properly nanboxed, then the input is replaced with the default qnan.
* Add do_nanbox() helper function to utilize gen_check_nanbox_X() to
  generate the NaN-boxed floating-point values based on SEW setting.
* Apply nanbox helper in opfvf_trans().

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20211210075704.23951-18-frank.chang@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 35 ++++++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_=
trans/trans_rvv.c.inc
index 66273afb53..f9ace6ae41 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2098,6 +2098,33 @@ GEN_OPIVI_NARROW_TRANS(vnclip_vi, IMM_ZX, vnclip_v=
x)
 /*
  *** Vector Float Point Arithmetic Instructions
  */
+
+/*
+ * As RVF-only cpus always have values NaN-boxed to 64-bits,
+ * RVF and RVD can be treated equally.
+ * We don't have to deal with the cases of: SEW > FLEN.
+ *
+ * If SEW < FLEN, check whether input fp register is a valid
+ * NaN-boxed value, in which case the least-significant SEW bits
+ * of the f regsiter are used, else the canonical NaN value is used.
+ */
+static void do_nanbox(DisasContext *s, TCGv_i64 out, TCGv_i64 in)
+{
+    switch (s->sew) {
+    case 1:
+        gen_check_nanbox_h(out, in);
+        break;
+    case 2:
+        gen_check_nanbox_s(out, in);
+        break;
+    case 3:
+        tcg_gen_mov_i64(out, in);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
 /* Vector Single-Width Floating-Point Add/Subtract Instructions */
=20
 /*
@@ -2151,6 +2178,7 @@ static bool opfvf_trans(uint32_t vd, uint32_t rs1, =
uint32_t vs2,
 {
     TCGv_ptr dest, src2, mask;
     TCGv_i32 desc;
+    TCGv_i64 t1;
=20
     TCGLabel *over =3D gen_new_label();
     tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
@@ -2164,11 +2192,16 @@ static bool opfvf_trans(uint32_t vd, uint32_t rs1=
, uint32_t vs2,
     tcg_gen_addi_ptr(src2, cpu_env, vreg_ofs(s, vs2));
     tcg_gen_addi_ptr(mask, cpu_env, vreg_ofs(s, 0));
=20
-    fn(dest, mask, cpu_fpr[rs1], src2, cpu_env, desc);
+    /* NaN-box f[rs1] */
+    t1 =3D tcg_temp_new_i64();
+    do_nanbox(s, t1, cpu_fpr[rs1]);
+
+    fn(dest, mask, t1, src2, cpu_env, desc);
=20
     tcg_temp_free_ptr(dest);
     tcg_temp_free_ptr(mask);
     tcg_temp_free_ptr(src2);
+    tcg_temp_free_i64(t1);
     mark_vs_dirty(s);
     gen_set_label(over);
     return true;
--=20
2.31.1


