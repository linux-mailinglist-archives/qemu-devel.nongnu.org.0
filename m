Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0463FD130
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 04:21:03 +0200 (CEST)
Received: from localhost ([::1]:41106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLFs6-0002nf-KH
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 22:21:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=871df42ed=alistair.francis@opensource.wdc.com>)
 id 1mLFiz-0006FB-9S
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 22:11:37 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:3906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=871df42ed=alistair.francis@opensource.wdc.com>)
 id 1mLFiw-0008Fb-6j
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 22:11:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1630462293; x=1661998293;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=w67LCT2lU+qHLX8ArEP0vmCI/g+0p14zU9IM8lbDyVU=;
 b=G5xZXYHpRIXq7WgGWCssZAigM0sUryUwtNTMsrJmVV8fGvId1WnJ2vxe
 juu3RwMp8k+8JzrhjhviQZhmBDeQL2NmZp6OG2SFVmzdmqDs2wHzM0pwq
 CDDLUUarZuVQYN/gZRCOdp/3hO01h+DqBhnGiFVbQzj7ZRzInEp4RQRLn
 nP5HlIUblhskmXTG1m6XYtJDgfUpgq8jIGHGLBo9Sn6b/qudtNK139prM
 HhLPXF0QElCgU1lotEu69bjAktW0fHVwU8VK7JLKuMiiABuRK72b4eS4n
 qkMdZ0mO391lbXkxVoEeX05WnPJ4tqJ+VYqJ+h6Wz34OZtyCwxtA6o4/N g==;
X-IronPort-AV: E=Sophos;i="5.84,368,1620662400"; d="scan'208";a="178910765"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 01 Sep 2021 10:11:17 +0800
IronPort-SDR: Ybys0kk1yWbKoEFITvBjdMRhhLEPyq4hSaAwZhAeql3WYb0iSV/rNI9VYoc88bfZ2rO8LyDuqx
 LkD9ynwrGxIhe+qvEi2XEJSp3ve6DNTYg1C+aRcsIJlTLHUmuv528yt50aMmnu7dQLFzNtMtgu
 ABNfMUvk+bQrnVRg3KhZ9bW5yeJa6l9Gz78d0Nr9XOQslkd0GM24p6B08s6xszsPUxJQejJWtI
 cYgX53oRbAgu6a9QTwovladdh5why11NG6Tp1xZX873x3LQHPAYFlcSYU8rulYWQr5tg8fJnyL
 a6A6Z56Z4kb3U4E6I9tzewtR
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2021 18:46:24 -0700
IronPort-SDR: HowDvM24oB/2U4q9ouhdkoSl4lG0zSUTH5crYxF9WDXtIbQXC+3RZO3bbzCCcoVQmpV8gAycuE
 M6vdmA1KgjIAuxWg4wlQYsU2+g8w4yGhTVdGeiIV1ydUjC9pqjr65UqZSXDhIweD2E74UmXD/T
 qyRo0MMvn5QK6Cyj542pEOrR++PSQsph2c+d49ygZuMx29N+XxrehvvtxSMX1D0EMg3Bc6J4AW
 J+lhifp/U+a2urHeGr8COalKNhErWCBjpZ5IDEWON1JswJGjT6XYSoLVQWZ2a+NMFpGBTFm21u
 Pdg=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2021 19:11:18 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Gznbp2SV1z1RvlZ
 for <qemu-devel@nongnu.org>; Tue, 31 Aug 2021 19:11:18 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1630462277; x=1633054278; bh=w67LCT2lU+qHLX8ArE
 P0vmCI/g+0p14zU9IM8lbDyVU=; b=nsgSPcHOyqaWWCsQrh4hgaaZUTSQI07Kwu
 qFkHUt5ihb1xBa+3pR8KVipLXg6dJM2wsE405wzmtsxxWaVXvp5JZCGLj1t23rwq
 YNviddHpn08JAx3yBfjwXIDRh6/4dQLdUvTEiBnlxlpwbxnaQ/eSZ2d009nc1jaz
 dB8mMUnBHjEtN5RWugcFMoti3VyGuuqbblzImmZ4jf39BXspdlWoJIAYbHi2y/DG
 cAAgw4fYl3hJ0OkxdVTriRW2M49M7MPkPlIrFDKa3DPE2noJFWzEPhKrsQadsxLj
 GVN0MJ6mh90KaamLpsLF6h8BjzDzcQ3o+G0LSFwtHRLt5UH0P8BQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id Gl2kqYLgNHkP for <qemu-devel@nongnu.org>;
 Tue, 31 Aug 2021 19:11:17 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.16])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Gznbj1XPrz1Rvl9;
 Tue, 31 Aug 2021 19:11:12 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 12/33] target/riscv: Clean up division helpers
Date: Wed,  1 Sep 2021 12:09:37 +1000
Message-Id: <20210901020958.458454-13-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210901020958.458454-1-alistair.francis@opensource.wdc.com>
References: <20210901020958.458454-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=871df42ed=alistair.francis@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

From: Richard Henderson <richard.henderson@linaro.org>

Utilize the condition in the movcond more; this allows some of
the setcond that were feeding into movcond to be removed.
Do not write into source1 and source2.  Re-name "condN" to "tempN"
and use the temporaries for more than holding conditions.

Tested-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210823195529.560295-4-richard.henderson@linaro.org
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/translate.c | 174 ++++++++++++++++++++-------------------
 1 file changed, 91 insertions(+), 83 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 20a55c92fb..147b9c2f68 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -213,106 +213,114 @@ static void gen_mulhsu(TCGv ret, TCGv arg1, TCGv =
arg2)
=20
 static void gen_div(TCGv ret, TCGv source1, TCGv source2)
 {
-    TCGv cond1, cond2, zeroreg, resultopt1;
+    TCGv temp1, temp2, zero, one, mone, min;
+
+    temp1 =3D tcg_temp_new();
+    temp2 =3D tcg_temp_new();
+    zero =3D tcg_constant_tl(0);
+    one =3D tcg_constant_tl(1);
+    mone =3D tcg_constant_tl(-1);
+    min =3D tcg_constant_tl(1ull << (TARGET_LONG_BITS - 1));
+
     /*
-     * Handle by altering args to tcg_gen_div to produce req'd results:
-     * For overflow: want source1 in source1 and 1 in source2
-     * For div by zero: want -1 in source1 and 1 in source2 -> -1 result
+     * If overflow, set temp2 to 1, else source2.
+     * This produces the required result of min.
      */
-    cond1 =3D tcg_temp_new();
-    cond2 =3D tcg_temp_new();
-    zeroreg =3D tcg_constant_tl(0);
-    resultopt1 =3D tcg_temp_new();
-
-    tcg_gen_movi_tl(resultopt1, (target_ulong)-1);
-    tcg_gen_setcondi_tl(TCG_COND_EQ, cond2, source2, (target_ulong)(~0L)=
);
-    tcg_gen_setcondi_tl(TCG_COND_EQ, cond1, source1,
-                        ((target_ulong)1) << (TARGET_LONG_BITS - 1));
-    tcg_gen_and_tl(cond1, cond1, cond2); /* cond1 =3D overflow */
-    tcg_gen_setcondi_tl(TCG_COND_EQ, cond2, source2, 0); /* cond2 =3D di=
v 0 */
-    /* if div by zero, set source1 to -1, otherwise don't change */
-    tcg_gen_movcond_tl(TCG_COND_EQ, source1, cond2, zeroreg, source1,
-            resultopt1);
-    /* if overflow or div by zero, set source2 to 1, else don't change *=
/
-    tcg_gen_or_tl(cond1, cond1, cond2);
-    tcg_gen_movi_tl(resultopt1, (target_ulong)1);
-    tcg_gen_movcond_tl(TCG_COND_EQ, source2, cond1, zeroreg, source2,
-            resultopt1);
-    tcg_gen_div_tl(ret, source1, source2);
-
-    tcg_temp_free(cond1);
-    tcg_temp_free(cond2);
-    tcg_temp_free(resultopt1);
+    tcg_gen_setcond_tl(TCG_COND_EQ, temp1, source1, min);
+    tcg_gen_setcond_tl(TCG_COND_EQ, temp2, source2, mone);
+    tcg_gen_and_tl(temp1, temp1, temp2);
+    tcg_gen_movcond_tl(TCG_COND_NE, temp2, temp1, zero, one, source2);
+
+    /*
+     * If div by zero, set temp1 to -1 and temp2 to 1 to
+     * produce the required result of -1.
+     */
+    tcg_gen_movcond_tl(TCG_COND_EQ, temp1, source2, zero, mone, source1)=
;
+    tcg_gen_movcond_tl(TCG_COND_EQ, temp2, source2, zero, one, temp2);
+
+    tcg_gen_div_tl(ret, temp1, temp2);
+
+    tcg_temp_free(temp1);
+    tcg_temp_free(temp2);
 }
=20
 static void gen_divu(TCGv ret, TCGv source1, TCGv source2)
 {
-    TCGv cond1, zeroreg, resultopt1;
-    cond1 =3D tcg_temp_new();
+    TCGv temp1, temp2, zero, one, max;
=20
-    zeroreg =3D tcg_constant_tl(0);
-    resultopt1 =3D tcg_temp_new();
+    temp1 =3D tcg_temp_new();
+    temp2 =3D tcg_temp_new();
+    zero =3D tcg_constant_tl(0);
+    one =3D tcg_constant_tl(1);
+    max =3D tcg_constant_tl(~0);
=20
-    tcg_gen_setcondi_tl(TCG_COND_EQ, cond1, source2, 0);
-    tcg_gen_movi_tl(resultopt1, (target_ulong)-1);
-    tcg_gen_movcond_tl(TCG_COND_EQ, source1, cond1, zeroreg, source1,
-            resultopt1);
-    tcg_gen_movi_tl(resultopt1, (target_ulong)1);
-    tcg_gen_movcond_tl(TCG_COND_EQ, source2, cond1, zeroreg, source2,
-            resultopt1);
-    tcg_gen_divu_tl(ret, source1, source2);
+    /*
+     * If div by zero, set temp1 to max and temp2 to 1 to
+     * produce the required result of max.
+     */
+    tcg_gen_movcond_tl(TCG_COND_EQ, temp1, source2, zero, max, source1);
+    tcg_gen_movcond_tl(TCG_COND_EQ, temp2, source2, zero, one, source2);
+    tcg_gen_divu_tl(ret, temp1, temp2);
=20
-    tcg_temp_free(cond1);
-    tcg_temp_free(resultopt1);
+    tcg_temp_free(temp1);
+    tcg_temp_free(temp2);
 }
=20
 static void gen_rem(TCGv ret, TCGv source1, TCGv source2)
 {
-    TCGv cond1, cond2, zeroreg, resultopt1;
-
-    cond1 =3D tcg_temp_new();
-    cond2 =3D tcg_temp_new();
-    zeroreg =3D tcg_constant_tl(0);
-    resultopt1 =3D tcg_temp_new();
-
-    tcg_gen_movi_tl(resultopt1, 1L);
-    tcg_gen_setcondi_tl(TCG_COND_EQ, cond2, source2, (target_ulong)-1);
-    tcg_gen_setcondi_tl(TCG_COND_EQ, cond1, source1,
-                        (target_ulong)1 << (TARGET_LONG_BITS - 1));
-    tcg_gen_and_tl(cond2, cond1, cond2); /* cond1 =3D overflow */
-    tcg_gen_setcondi_tl(TCG_COND_EQ, cond1, source2, 0); /* cond2 =3D di=
v 0 */
-    /* if overflow or div by zero, set source2 to 1, else don't change *=
/
-    tcg_gen_or_tl(cond2, cond1, cond2);
-    tcg_gen_movcond_tl(TCG_COND_EQ, source2, cond2, zeroreg, source2,
-            resultopt1);
-    tcg_gen_rem_tl(resultopt1, source1, source2);
-    /* if div by zero, just return the original dividend */
-    tcg_gen_movcond_tl(TCG_COND_EQ, ret, cond1, zeroreg, resultopt1,
-            source1);
-
-    tcg_temp_free(cond1);
-    tcg_temp_free(cond2);
-    tcg_temp_free(resultopt1);
+    TCGv temp1, temp2, zero, one, mone, min;
+
+    temp1 =3D tcg_temp_new();
+    temp2 =3D tcg_temp_new();
+    zero =3D tcg_constant_tl(0);
+    one =3D tcg_constant_tl(1);
+    mone =3D tcg_constant_tl(-1);
+    min =3D tcg_constant_tl(1ull << (TARGET_LONG_BITS - 1));
+
+    /*
+     * If overflow, set temp1 to 0, else source1.
+     * This avoids a possible host trap, and produces the required resul=
t of 0.
+     */
+    tcg_gen_setcond_tl(TCG_COND_EQ, temp1, source1, min);
+    tcg_gen_setcond_tl(TCG_COND_EQ, temp2, source2, mone);
+    tcg_gen_and_tl(temp1, temp1, temp2);
+    tcg_gen_movcond_tl(TCG_COND_NE, temp1, temp1, zero, zero, source1);
+
+    /*
+     * If div by zero, set temp2 to 1, else source2.
+     * This avoids a possible host trap, but produces an incorrect resul=
t.
+     */
+    tcg_gen_movcond_tl(TCG_COND_EQ, temp2, source2, zero, one, source2);
+
+    tcg_gen_rem_tl(temp1, temp1, temp2);
+
+    /* If div by zero, the required result is the original dividend. */
+    tcg_gen_movcond_tl(TCG_COND_EQ, ret, source2, zero, source1, temp1);
+
+    tcg_temp_free(temp1);
+    tcg_temp_free(temp2);
 }
=20
 static void gen_remu(TCGv ret, TCGv source1, TCGv source2)
 {
-    TCGv cond1, zeroreg, resultopt1;
-    cond1 =3D tcg_temp_new();
-    zeroreg =3D tcg_constant_tl(0);
-    resultopt1 =3D tcg_temp_new();
-
-    tcg_gen_movi_tl(resultopt1, (target_ulong)1);
-    tcg_gen_setcondi_tl(TCG_COND_EQ, cond1, source2, 0);
-    tcg_gen_movcond_tl(TCG_COND_EQ, source2, cond1, zeroreg, source2,
-            resultopt1);
-    tcg_gen_remu_tl(resultopt1, source1, source2);
-    /* if div by zero, just return the original dividend */
-    tcg_gen_movcond_tl(TCG_COND_EQ, ret, cond1, zeroreg, resultopt1,
-            source1);
-
-    tcg_temp_free(cond1);
-    tcg_temp_free(resultopt1);
+    TCGv temp, zero, one;
+
+    temp =3D tcg_temp_new();
+    zero =3D tcg_constant_tl(0);
+    one =3D tcg_constant_tl(1);
+
+    /*
+     * If div by zero, set temp to 1, else source2.
+     * This avoids a possible host trap, but produces an incorrect resul=
t.
+     */
+    tcg_gen_movcond_tl(TCG_COND_EQ, temp, source2, zero, one, source2);
+
+    tcg_gen_remu_tl(temp, source1, temp);
+
+    /* If div by zero, the required result is the original dividend. */
+    tcg_gen_movcond_tl(TCG_COND_EQ, ret, source2, zero, source1, temp);
+
+    tcg_temp_free(temp);
 }
=20
 static void gen_jal(DisasContext *ctx, int rd, target_ulong imm)
--=20
2.31.1


