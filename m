Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF8147A4ED
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 07:20:21 +0100 (CET)
Received: from localhost ([::1]:57264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzC20-0006Ey-2L
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 01:20:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAp0-0004dt-2Z
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 00:02:50 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:13359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAot-0008G0-Bu
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 00:02:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639976564; x=1671512564;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wEMlST9zy0WnmLl2ti7IzJlznAmrUDdgEMySSHxu1VI=;
 b=mJWmWl85w124yJ/tFDKvLEbezdyheuWpK+fRl8N2xwteQc09IW3+ndJd
 7dcYJI17XFpLmjoDwoohLWxA5tpDl1X5hnzML5Vwu/p6AoF7YxuQF36uP
 8JgbX6k8PPzUusUqRYnMOBy7pEt+kT6DVZTHO+0ZwI1/Jq3OUHtSw+KoY
 wXzFrac9xAdpRfnjLyxhhWWuwuU4E851JPOfha8c8DDD4/T/qAJSIgjA2
 DwC7dx+ETes5P3sxae+zZZAGfARYEhMgZZwVH8MweHMyNrfSkc5HlGZYe
 Oewyh6kgPB/GtJw7exiE0cf+gK/3MoUSJDUOsrj7cEPJygDbuKXdAV7Pm g==;
X-IronPort-AV: E=Sophos;i="5.88,219,1635177600"; d="scan'208";a="189680267"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2021 13:01:45 +0800
IronPort-SDR: tM2RiiDhBoZEpZsTGDFSaRE/yRZJjc0kPcc+dU0qZsSfDasSVZcBQTf6fU1LQRnHBqRZj9qzU9
 4v3C1QEB2aA8VQeOsPUM9HviXo0CVlWRUQR76BnbZYZI2BqcIPUHF4YMjF+z4XtU1006jxMJTH
 wXMMZGdnTUA1PDdG1Ctb5MtZ7xPSyI9gfIaF0XevHLh9PQE6nrzvNaKfA1q9gdB25wHxazqc1w
 Rk6AWV6fxPy8wVbOZ7jdj/g3n1tv5LtSfynG0ysXMgNMYS1u1hvHDeBNFK997/T1Ohit9xGI7l
 cB/JZvayMi5sf+ZJeXLrwALj
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:34:34 -0800
IronPort-SDR: Z0YOY/5Gbopv9xorLCqtlxt8p28F1iwopBReZz6YMJub4sEzVSwV/VamL6io10sHPQ8+8x9o+x
 5B3wqb6cjF8toVbe9F6Qysq/IM4AwJ7evG90sDSb+H/ZnXkaygPMyxKNSPaLUYFBnHgUXTMuf6
 WWDvy8J/Xi9yQs2avVntbo+xgWxox2Maz8sjrI/jcJAZuKByZPSamQz+5zIodGKqGhRz/c2yD5
 WjMCCT6S1bslYdOb/vbE/g1vjzqD5EWy/MyJuxc/+yTo47eHqMD++Ifr6pNBgBS9HJn8GlD2FF
 YOo=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 21:01:44 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JHS9h0CDJz1RvTg
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 21:01:44 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1639976503; x=1642568504; bh=wEMlST9zy0WnmLl2ti
 7IzJlznAmrUDdgEMySSHxu1VI=; b=sPmduT38QfL3MOViCKnaHobbqeweTp+yKm
 a6mCwwnOK2gou2VzRy8KtoqdNprl0RqM3j4EMur9U6la6iApyENCSC3kisn5ZWm2
 YSMY02XfAOitDSQ8xvmx76wTwnIxef+zHAOyRIcEymiuMiYv6f8MNxJbQGWX93O3
 PCNwbnF83Oagzykknyu/hbgamz+tdeud942+4E99iTtU0864pKFitkzEUlYkkWN5
 hS9VzXOsKzMo6Ya4EiY6b14pvqVgSLdlc9HsKY50nzMmQIOfF9BhwcVHzkjfra74
 1rkUU0ljUWUG4BBdK2HtujqL65EViTXf5rm6qhwC4A8SSRQlSCcQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id AjvuPqrkCm9L for <qemu-devel@nongnu.org>;
 Sun, 19 Dec 2021 21:01:43 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.68])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JHS9c21hwz1RtVG;
 Sun, 19 Dec 2021 21:01:39 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 66/88] target/riscv: rvv-1.0: remove integer extract instruction
Date: Mon, 20 Dec 2021 14:56:43 +1000
Message-Id: <20211220045705.62174-67-alistair.francis@opensource.wdc.com>
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
Message-Id: <20211210075704.23951-59-frank.chang@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn32.decode              |  1 -
 target/riscv/insn_trans/trans_rvv.c.inc | 23 -----------------------
 2 files changed, 24 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 82484fda75..20b3095f56 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -632,7 +632,6 @@ viota_m         010100 . ..... 10000 010 ..... 101011=
1 @r2_vm
 vid_v           010100 . 00000 10001 010 ..... 1010111 @r1_vm
 vmv_x_s         010000 1 ..... 00000 010 ..... 1010111 @r2rd
 vmv_s_x         010000 1 00000 ..... 110 ..... 1010111 @r2
-vext_x_v        001100 1 ..... ..... 010 ..... 1010111 @r
 vfmv_f_s        010000 1 ..... 00000 001 ..... 1010111 @r2rd
 vfmv_s_f        010000 1 00000 ..... 101 ..... 1010111 @r2
 vslideup_vx     001110 . ..... ..... 100 ..... 1010111 @r_vm
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_=
trans/trans_rvv.c.inc
index 4c5f813ccf..1ce5a10b6a 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2840,8 +2840,6 @@ static bool trans_vid_v(DisasContext *s, arg_vid_v =
*a)
  *** Vector Permutation Instructions
  */
=20
-/* Integer Extract Instruction */
-
 static void load_element(TCGv_i64 dest, TCGv_ptr base,
                          int ofs, int sew, bool sign)
 {
@@ -2941,27 +2939,6 @@ static void vec_element_loadi(DisasContext *s, TCG=
v_i64 dest,
     load_element(dest, cpu_env, endian_ofs(s, vreg, idx), s->sew, sign);
 }
=20
-static bool trans_vext_x_v(DisasContext *s, arg_r *a)
-{
-    TCGv_i64 tmp =3D tcg_temp_new_i64();
-    TCGv dest =3D dest_gpr(s, a->rd);
-
-    if (a->rs1 =3D=3D 0) {
-        /* Special case vmv.x.s rd, vs2. */
-        vec_element_loadi(s, tmp, a->rs2, 0, false);
-    } else {
-        /* This instruction ignores LMUL and vector register groups */
-        int vlmax =3D s->vlen >> (3 + s->sew);
-        vec_element_loadx(s, tmp, a->rs2, cpu_gpr[a->rs1], vlmax);
-    }
-
-    tcg_gen_trunc_i64_tl(dest, tmp);
-    gen_set_gpr(s, a->rd, dest);
-
-    tcg_temp_free_i64(tmp);
-    return true;
-}
-
 /* Integer Scalar Move Instruction */
=20
 static void store_element(TCGv_i64 val, TCGv_ptr base,
--=20
2.31.1


