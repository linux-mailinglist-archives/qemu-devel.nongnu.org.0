Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18004514182
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 06:42:56 +0200 (CEST)
Received: from localhost ([::1]:49906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkIT1-0003Y0-6u
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 00:42:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=111bf31fc=alistair.francis@opensource.wdc.com>)
 id 1nkIIS-0006Zb-Lx
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 00:32:00 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:13469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=111bf31fc=alistair.francis@opensource.wdc.com>)
 id 1nkIIQ-0002SM-OF
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 00:32:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1651206717; x=1682742717;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/qByz0cm7OrRKJLvYFNPa7gNrufsgRxhvwzDMHK2jGI=;
 b=JGfw1kcMIwJsAl2QPxPukaB7KW9ISoguQbh+FB4fjXYO2gyNrGydJhFc
 +MRlfkT/0gGvSVlt6Ds1+NxGbt5qkZBGCunltbji5+BEksHu/rCJXnYj8
 5pqVbZwyxezRY7rKHxbviVBvplCtfUDkBl/cuoRkkv/F+faldeDJ0IUpN
 JV3nMKSQD1EM0f4CbgVnhradt3ybkhDX0hz84Ks9fiCuWWhVHWqgoJQ2L
 USN4bpqzRjXcs5owdMdZmL7bPghL9uA6Yl1/RuUx6f+3GouICJ9k0zH0P
 sk9qqaWWdlhiZm3ZiObMqMRIjQIetLJaQDc9niu6oZj0BcDk1+zjp67mS g==;
X-IronPort-AV: E=Sophos;i="5.91,297,1647273600"; d="scan'208";a="203995918"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 29 Apr 2022 12:31:56 +0800
IronPort-SDR: fTh/5iJJsqc8HiFwioUw9hjzYlpDlT6QiqTcq10YtgHJgp1r+DzatfGiXdv4DvnOWPzuk0E8Nm
 /2R2AOfEC9U2cPSrP2EnDPbCW4WRZQPBu/3Sq6r2WrV328KnfGocIDkQ1O+e3/tHKUeR1yk21T
 dmgxw2mzfLAZh2JMZh0FPEvQwospVk0ywWlz/CeCgKMexF5E3ChzMgNqo7ZzAJo34on31T9tMg
 DMLCFsxWvdKiQRh9nAbXz+cNBPhRAiFnktZimTvBZShQRr0zoX2L63CRAbza4ByHf7my+fE+y7
 x1n8QSOBDi9fpD4xIhCQNt2s
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Apr 2022 21:02:05 -0700
IronPort-SDR: fHhZoczOt/COTrhatHr+FpUYNGGWR7qTYuALOxoViNcF5N6eyQ35e4tWAP/EFaNqL6m63+/uDt
 w+qQE8hignhDg9UlYomruTJXiXdIkVs8OeNnyuO5LIs/n7eRZKEDWmR8+d9/Q3VoiVhxjSuwRt
 8bZS4rtYeW8x4CdFWDCB+ZAgu3Phe2Dn+wt5Hx9bdCxxqeMlM+oVbrnUV/DgMOhgoMtNTNHQJY
 MKu5eaAbiaHwfcwI+ujSNFolUF57khMtvqGaZ1Z2U8wA64FhVCbS5dzdG4g6yIrpfDyHs4So0i
 37o=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Apr 2022 21:31:58 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KqKMK4FF5z1SVp0
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 21:31:57 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1651206716; x=1653798717; bh=/qByz0cm7OrRKJLvYF
 NPa7gNrufsgRxhvwzDMHK2jGI=; b=HgcDBBhbioSTMWXyHYF1dLKRYg2WuPbCyU
 iJ299MWlcjVuNyMk+OlyUo4OfbnVTucprmISqPR/qsUalJP/+nHX4q+yzuPM49nr
 apG82hR9pK4gPKwSz/9Y09iqYfaBxFFTkLIy6TfHBh0kSydw04fXDEc5kjCBmqrZ
 aXNizzIX9mtt2lonA6AC8NogCyKgLOytPAcVzocFNJcr6J9yFlMOMNG5ebIn6amE
 Jl7KwxMMQDCXfX0Ek3v1Kj0pDg2wOM5YowDOO/2vmSTQQ+669p6yJsp8CTxm6TTI
 QPgo336v0Op9mMQxt0MtEOUGySoLwhuQyShMG4Nhw49JDlIZn9wA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id rSz4v5j4zYVI for <qemu-devel@nongnu.org>;
 Thu, 28 Apr 2022 21:31:56 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.122])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KqKMG27Mdz1Rvlc;
 Thu, 28 Apr 2022 21:31:53 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Weiwei Li <liweiwei@iscas.ac.cn>,
 Junqiang Wang <wangjunqiang@iscas.ac.cn>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 07/25] target/riscv: rvk: add support for zbkx extension
Date: Fri, 29 Apr 2022 14:31:01 +1000
Message-Id: <20220429043119.1478881-8-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429043119.1478881-1-alistair.francis@opensource.wdc.com>
References: <20220429043119.1478881-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=111bf31fc=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
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

From: Weiwei Li <liweiwei@iscas.ac.cn>

 - add xperm4 and xperm8 instructions

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220423023510.30794-5-liweiwei@iscas.ac.cn>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/helper.h                   |  2 ++
 target/riscv/insn32.decode              |  4 ++++
 target/riscv/bitmanip_helper.c          | 27 +++++++++++++++++++++++++
 target/riscv/insn_trans/trans_rvb.c.inc | 18 +++++++++++++++++
 4 files changed, 51 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 8a3a7615f2..cfead7abfc 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -69,6 +69,8 @@ DEF_HELPER_FLAGS_2(clmulr, TCG_CALL_NO_RWG_SE, tl, tl, =
tl)
 DEF_HELPER_FLAGS_1(brev8, TCG_CALL_NO_RWG_SE, tl, tl)
 DEF_HELPER_FLAGS_1(unzip, TCG_CALL_NO_RWG_SE, tl, tl)
 DEF_HELPER_FLAGS_1(zip, TCG_CALL_NO_RWG_SE, tl, tl)
+DEF_HELPER_FLAGS_2(xperm4, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+DEF_HELPER_FLAGS_2(xperm8, TCG_CALL_NO_RWG_SE, tl, tl, tl)
=20
 /* Floating Point - Half Precision */
 DEF_HELPER_FLAGS_3(fadd_h, TCG_CALL_NO_RWG, i64, env, i64, i64)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 3a49acab37..75ffac9c81 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -776,6 +776,10 @@ clmulh     0000101 .......... 011 ..... 0110011 @r
 # *** RV32 extra Zbc Standard Extension ***
 clmulr     0000101 .......... 010 ..... 0110011 @r
=20
+# *** RV32 Zbkx Standard Extension ***
+xperm4     0010100 .......... 010 ..... 0110011 @r
+xperm8     0010100 .......... 100 ..... 0110011 @r
+
 # *** RV32 Zbs Standard Extension ***
 bclr       0100100 .......... 001 ..... 0110011 @r
 bclri      01001. ........... 001 ..... 0010011 @sh
diff --git a/target/riscv/bitmanip_helper.c b/target/riscv/bitmanip_helpe=
r.c
index e003e8b25b..b99c4a39a1 100644
--- a/target/riscv/bitmanip_helper.c
+++ b/target/riscv/bitmanip_helper.c
@@ -102,3 +102,30 @@ target_ulong HELPER(zip)(target_ulong rs1)
     x =3D do_shuf_stage(x, shuf_masks[0], shuf_masks[0] >> 1, 1);
     return x;
 }
+
+static inline target_ulong do_xperm(target_ulong rs1, target_ulong rs2,
+                                    uint32_t sz_log2)
+{
+    target_ulong r =3D 0;
+    target_ulong sz =3D 1LL << sz_log2;
+    target_ulong mask =3D (1LL << sz) - 1;
+    target_ulong pos;
+
+    for (int i =3D 0; i < TARGET_LONG_BITS; i +=3D sz) {
+        pos =3D ((rs2 >> i) & mask) << sz_log2;
+        if (pos < sizeof(target_ulong) * 8) {
+            r |=3D ((rs1 >> pos) & mask) << i;
+        }
+    }
+    return r;
+}
+
+target_ulong HELPER(xperm4)(target_ulong rs1, target_ulong rs2)
+{
+    return do_xperm(rs1, rs2, 2);
+}
+
+target_ulong HELPER(xperm8)(target_ulong rs1, target_ulong rs2)
+{
+    return do_xperm(rs1, rs2, 3);
+}
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_=
trans/trans_rvb.c.inc
index 5a5751557d..e2b8329f1e 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -48,6 +48,12 @@
     }                                            \
 } while (0)
=20
+#define REQUIRE_ZBKX(ctx) do {                   \
+    if (!ctx->cfg_ptr->ext_zbkx) {               \
+        return false;                            \
+    }                                            \
+} while (0)
+
 static void gen_clz(TCGv ret, TCGv arg1)
 {
     tcg_gen_clzi_tl(ret, arg1, TARGET_LONG_BITS);
@@ -574,3 +580,15 @@ static bool trans_zip(DisasContext *ctx, arg_zip *a)
     REQUIRE_ZBKB(ctx);
     return gen_unary(ctx, a, EXT_NONE, gen_helper_zip);
 }
+
+static bool trans_xperm4(DisasContext *ctx, arg_xperm4 *a)
+{
+    REQUIRE_ZBKX(ctx);
+    return gen_arith(ctx, a, EXT_NONE, gen_helper_xperm4, NULL);
+}
+
+static bool trans_xperm8(DisasContext *ctx, arg_xperm8 *a)
+{
+    REQUIRE_ZBKX(ctx);
+    return gen_arith(ctx, a, EXT_NONE, gen_helper_xperm8, NULL);
+}
--=20
2.35.1


