Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 518B7514186
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 06:45:56 +0200 (CEST)
Received: from localhost ([::1]:56274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkIVv-0007kt-D1
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 00:45:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=111bf31fc=alistair.francis@opensource.wdc.com>)
 id 1nkIIh-00077g-FK
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 00:32:15 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:13514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=111bf31fc=alistair.francis@opensource.wdc.com>)
 id 1nkIId-0002VB-RC
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 00:32:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1651206730; x=1682742730;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9sNZ1Y+714+S9MkJlUSjD0OfM/BEcKdzkKWLGdW+o64=;
 b=EVyD1HoMRC4LdtagRH5HECxAZ4/ovMI9oPm2ZdTkj7gji0t90e9/MxwA
 alnP3VWfAkw7NEGAiw6uRwdCda2zgQiC0k8EUcNVY3jt8kC10YNkGkujS
 7vS87p/MU9fHkRG1AB7h1LzD47YjOQ8EIDnhW4D8DwPJdGNl3mdI202Vh
 SDXlSejr5xxEbNn8wTciuJowpYBFfNbz5hRxsevwrtYTP7asHDjzmQif5
 95oVdeCFObhcZ1mOHZua/m+WNhBiD/scWkAfmw1YPt21QVIKIDCjZbWb4
 /3JECIYx2A4T3XFnd13FBrYYm7qeV0dGALAUqx5biX+o7gtwYL7ergZhf A==;
X-IronPort-AV: E=Sophos;i="5.91,297,1647273600"; d="scan'208";a="203995934"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 29 Apr 2022 12:32:08 +0800
IronPort-SDR: sPpPvnyJLySZCEtz/qjyMZncmSbLYI22Ppf7CCIgGoQRSRbvzRlLc7jkkslqh5joYbd1DrcXUv
 2p4kql+H8JLt2AHRDKhJyOWw00KySXwtQtMdj3QGJXXmJRG9yOB/jn/0B3Q/9yer6pWyTbTaZT
 7KVJmw7xc0D40e7BxjUtPxKPq6c1OWsT3SUYqK9gl/eiLse+JSy3JlqbMhsAW0ENkQhmNgipMS
 YUaQQfZKpGzKHIhYev8+WhDtxq+3PBMVRVZtgSW7Ciszmy7eXCxHd8pnBV5t90RDEO7yYt8i7u
 smnxl2bsAei10XSksjtngO0m
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Apr 2022 21:02:17 -0700
IronPort-SDR: ZZCeH0Xy8dJhoWVrt2G160M+9GikQkD3RC80PfpHVOkjaTXwTslLji8sXBibY5pNNHRpo8DR0m
 kxjrjNzGsO39pappaNjM+O6kYm9yZ+nm17TlA6Wpf1T8B2X4yHH/+fZEJ7P8dkYPRDt7/xvDiM
 Hng7ne6jJacEBPpWDbvBLQVSzZeoPe1v28Sx/CEetUHA6gw1kWtuU7h4h2aE+KEnw8ACUkvf97
 CYg33ydtTsDEu+sTM567tNm3w5CWmIv6xNSYOjWE6/yyG04C0UDG8HrqNazottTs4te6rH0WsY
 0K4=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Apr 2022 21:32:10 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KqKMY4Krrz1SVnx
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 21:32:09 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1651206728; x=1653798729; bh=9sNZ1Y+714+S9MkJlU
 SjD0OfM/BEcKdzkKWLGdW+o64=; b=C0n2CTzJwI4VFK9lHtDEI/hvIEMY/0Nlkd
 f1hOB0rJtkaauY21D5PXgZbc+SyxWciMnkq0ngggN4DdMK0OPnJLpW/0ByDPjuyW
 uXlPn12pL5GPzOEdx/XgJtUV4zZkTYFBVi8L1R4IPrvYxKn5lqfGuWQII8rshyPB
 t4tcLlAqgOhyuAkTq6fzFdu5X19gt6IuFo4ro2V0wvxTkJ5G5c+BfFnkhs06ar6f
 dmYuJIJvw4fRM1EFV2PngqyTGBpNRWyYuN5BDa0ljCsXUOMJdnIcNLwN5WsmCAEl
 bJQAghA+J3wCwuj+0CWEuh8dbhZ4UmOmQB+pr5hdegPl+ZnDHDGw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 3OhPbilbkd2S for <qemu-devel@nongnu.org>;
 Thu, 28 Apr 2022 21:32:08 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.122])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KqKMT1dc1z1Rvlx;
 Thu, 28 Apr 2022 21:32:04 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Weiwei Li <liweiwei@iscas.ac.cn>,
 Ruibo Lu <luruibo2000@163.com>, Zewen Ye <lustrew@foxmail.com>,
 Junqiang Wang <wangjunqiang@iscas.ac.cn>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 10/25] target/riscv: rvk: add support for zkne/zknd extension
 in RV64
Date: Fri, 29 Apr 2022 14:31:04 +1000
Message-Id: <20220429043119.1478881-11-alistair.francis@opensource.wdc.com>
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

 - add aes64dsm, aes64ds, aes64im, aes64es, aes64esm, aes64ks2, aes64ks1i=
 instructions

Co-authored-by: Ruibo Lu <luruibo2000@163.com>
Co-authored-by: Zewen Ye <lustrew@foxmail.com>
Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220423023510.30794-8-liweiwei@iscas.ac.cn>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/helper.h                   |   8 ++
 target/riscv/insn32.decode              |  12 ++
 target/riscv/crypto_helper.c            | 169 ++++++++++++++++++++++++
 target/riscv/insn_trans/trans_rvk.c.inc |  54 ++++++++
 4 files changed, 243 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 3c4e7e6113..56519fcc26 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1118,3 +1118,11 @@ DEF_HELPER_FLAGS_3(aes32esmi, TCG_CALL_NO_RWG_SE, =
tl, tl, tl, tl)
 DEF_HELPER_FLAGS_3(aes32esi, TCG_CALL_NO_RWG_SE, tl, tl, tl, tl)
 DEF_HELPER_FLAGS_3(aes32dsmi, TCG_CALL_NO_RWG_SE, tl, tl, tl, tl)
 DEF_HELPER_FLAGS_3(aes32dsi, TCG_CALL_NO_RWG_SE, tl, tl, tl, tl)
+
+DEF_HELPER_FLAGS_2(aes64esm, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+DEF_HELPER_FLAGS_2(aes64es, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+DEF_HELPER_FLAGS_2(aes64ds, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+DEF_HELPER_FLAGS_2(aes64dsm, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+DEF_HELPER_FLAGS_2(aes64ks2, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+DEF_HELPER_FLAGS_2(aes64ks1i, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+DEF_HELPER_FLAGS_1(aes64im, TCG_CALL_NO_RWG_SE, tl, tl)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 0f2e661583..0b800b4093 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -36,6 +36,7 @@
 %imm_j    31:s1 12:8 20:1 21:10  !function=3Dex_shift_1
 %imm_u    12:s20                 !function=3Dex_shift_12
 %imm_bs   30:2                   !function=3Dex_shift_3
+%imm_rnum 20:4
=20
 # Argument sets:
 &empty
@@ -92,6 +93,7 @@
 @sfence_vm  ....... ..... .....   ... ..... ....... %rs1
=20
 @k_aes   .. ..... ..... .....  ... ..... ....... &k_aes  shamt=3D%imm_bs=
   %rs2 %rs1 %rd
+@i_aes   .. ..... ..... .....  ... ..... ....... &i      imm=3D%imm_rnum=
        %rs1 %rd
=20
 # Formats 64:
 @sh5     .......  ..... .....  ... ..... ....... &shift  shamt=3D%sh5   =
   %rs1 %rd
@@ -842,6 +844,16 @@ hinval_gvma       0110011 ..... ..... 000 00000 1110=
011 @hfence_gvma
 # *** RV32 Zknd Standard Extension ***
 aes32dsmi   .. 10111 ..... ..... 000 ..... 0110011 @k_aes
 aes32dsi    .. 10101 ..... ..... 000 ..... 0110011 @k_aes
+# *** RV64 Zknd Standard Extension ***
+aes64dsm    00 11111 ..... ..... 000 ..... 0110011 @r
+aes64ds     00 11101 ..... ..... 000 ..... 0110011 @r
+aes64im     00 11000 00000 ..... 001 ..... 0010011 @r2
 # *** RV32 Zkne Standard Extension ***
 aes32esmi   .. 10011 ..... ..... 000 ..... 0110011 @k_aes
 aes32esi    .. 10001 ..... ..... 000 ..... 0110011 @k_aes
+# *** RV64 Zkne Standard Extension ***
+aes64es     00 11001 ..... ..... 000 ..... 0110011 @r
+aes64esm    00 11011 ..... ..... 000 ..... 0110011 @r
+# *** RV64 Zkne/zknd Standard Extension ***
+aes64ks2    01 11111 ..... ..... 000 ..... 0110011 @r
+aes64ks1i   00 11000 1.... ..... 001 ..... 0010011 @i_aes
diff --git a/target/riscv/crypto_helper.c b/target/riscv/crypto_helper.c
index 220d51c742..cb4783a1e9 100644
--- a/target/riscv/crypto_helper.c
+++ b/target/riscv/crypto_helper.c
@@ -102,4 +102,173 @@ target_ulong HELPER(aes32dsi)(target_ulong rs1, tar=
get_ulong rs2,
 {
     return aes32_operation(shamt, rs1, rs2, false, false);
 }
+
+#define BY(X, I) ((X >> (8 * I)) & 0xFF)
+
+#define AES_SHIFROWS_LO(RS1, RS2) ( \
+    (((RS1 >> 24) & 0xFF) << 56) | (((RS2 >> 48) & 0xFF) << 48) | \
+    (((RS2 >> 8) & 0xFF) << 40) | (((RS1 >> 32) & 0xFF) << 32) | \
+    (((RS2 >> 56) & 0xFF) << 24) | (((RS2 >> 16) & 0xFF) << 16) | \
+    (((RS1 >> 40) & 0xFF) << 8) | (((RS1 >> 0) & 0xFF) << 0))
+
+#define AES_INVSHIFROWS_LO(RS1, RS2) ( \
+    (((RS2 >> 24) & 0xFF) << 56) | (((RS2 >> 48) & 0xFF) << 48) | \
+    (((RS1 >> 8) & 0xFF) << 40) | (((RS1 >> 32) & 0xFF) << 32) | \
+    (((RS1 >> 56) & 0xFF) << 24) | (((RS2 >> 16) & 0xFF) << 16) | \
+    (((RS2 >> 40) & 0xFF) << 8) | (((RS1 >> 0) & 0xFF) << 0))
+
+#define AES_MIXBYTE(COL, B0, B1, B2, B3) ( \
+    BY(COL, B3) ^ BY(COL, B2) ^ AES_GFMUL(BY(COL, B1), 3) ^ \
+    AES_GFMUL(BY(COL, B0), 2))
+
+#define AES_MIXCOLUMN(COL) ( \
+    AES_MIXBYTE(COL, 3, 0, 1, 2) << 24 | \
+    AES_MIXBYTE(COL, 2, 3, 0, 1) << 16 | \
+    AES_MIXBYTE(COL, 1, 2, 3, 0) << 8 | AES_MIXBYTE(COL, 0, 1, 2, 3) << =
0)
+
+#define AES_INVMIXBYTE(COL, B0, B1, B2, B3) ( \
+    AES_GFMUL(BY(COL, B3), 0x9) ^ AES_GFMUL(BY(COL, B2), 0xd) ^ \
+    AES_GFMUL(BY(COL, B1), 0xb) ^ AES_GFMUL(BY(COL, B0), 0xe))
+
+#define AES_INVMIXCOLUMN(COL) ( \
+    AES_INVMIXBYTE(COL, 3, 0, 1, 2) << 24 | \
+    AES_INVMIXBYTE(COL, 2, 3, 0, 1) << 16 | \
+    AES_INVMIXBYTE(COL, 1, 2, 3, 0) << 8 | \
+    AES_INVMIXBYTE(COL, 0, 1, 2, 3) << 0)
+
+static inline target_ulong aes64_operation(target_ulong rs1, target_ulon=
g rs2,
+                                           bool enc, bool mix)
+{
+    uint64_t RS1 =3D rs1;
+    uint64_t RS2 =3D rs2;
+    uint64_t result;
+    uint64_t temp;
+    uint32_t col_0;
+    uint32_t col_1;
+
+    if (enc) {
+        temp =3D AES_SHIFROWS_LO(RS1, RS2);
+        temp =3D (((uint64_t)AES_sbox[(temp >> 0) & 0xFF] << 0) |
+                ((uint64_t)AES_sbox[(temp >> 8) & 0xFF] << 8) |
+                ((uint64_t)AES_sbox[(temp >> 16) & 0xFF] << 16) |
+                ((uint64_t)AES_sbox[(temp >> 24) & 0xFF] << 24) |
+                ((uint64_t)AES_sbox[(temp >> 32) & 0xFF] << 32) |
+                ((uint64_t)AES_sbox[(temp >> 40) & 0xFF] << 40) |
+                ((uint64_t)AES_sbox[(temp >> 48) & 0xFF] << 48) |
+                ((uint64_t)AES_sbox[(temp >> 56) & 0xFF] << 56));
+        if (mix) {
+            col_0 =3D temp & 0xFFFFFFFF;
+            col_1 =3D temp >> 32;
+
+            col_0 =3D AES_MIXCOLUMN(col_0);
+            col_1 =3D AES_MIXCOLUMN(col_1);
+
+            result =3D ((uint64_t)col_1 << 32) | col_0;
+        } else {
+            result =3D temp;
+        }
+    } else {
+        temp =3D AES_INVSHIFROWS_LO(RS1, RS2);
+        temp =3D (((uint64_t)AES_isbox[(temp >> 0) & 0xFF] << 0) |
+                ((uint64_t)AES_isbox[(temp >> 8) & 0xFF] << 8) |
+                ((uint64_t)AES_isbox[(temp >> 16) & 0xFF] << 16) |
+                ((uint64_t)AES_isbox[(temp >> 24) & 0xFF] << 24) |
+                ((uint64_t)AES_isbox[(temp >> 32) & 0xFF] << 32) |
+                ((uint64_t)AES_isbox[(temp >> 40) & 0xFF] << 40) |
+                ((uint64_t)AES_isbox[(temp >> 48) & 0xFF] << 48) |
+                ((uint64_t)AES_isbox[(temp >> 56) & 0xFF] << 56));
+        if (mix) {
+            col_0 =3D temp & 0xFFFFFFFF;
+            col_1 =3D temp >> 32;
+
+            col_0 =3D AES_INVMIXCOLUMN(col_0);
+            col_1 =3D AES_INVMIXCOLUMN(col_1);
+
+            result =3D ((uint64_t)col_1 << 32) | col_0;
+        } else {
+            result =3D temp;
+        }
+    }
+
+    return result;
+}
+
+target_ulong HELPER(aes64esm)(target_ulong rs1, target_ulong rs2)
+{
+    return aes64_operation(rs1, rs2, true, true);
+}
+
+target_ulong HELPER(aes64es)(target_ulong rs1, target_ulong rs2)
+{
+    return aes64_operation(rs1, rs2, true, false);
+}
+
+target_ulong HELPER(aes64ds)(target_ulong rs1, target_ulong rs2)
+{
+    return aes64_operation(rs1, rs2, false, false);
+}
+
+target_ulong HELPER(aes64dsm)(target_ulong rs1, target_ulong rs2)
+{
+    return aes64_operation(rs1, rs2, false, true);
+}
+
+target_ulong HELPER(aes64ks2)(target_ulong rs1, target_ulong rs2)
+{
+    uint64_t RS1 =3D rs1;
+    uint64_t RS2 =3D rs2;
+    uint32_t rs1_hi =3D RS1 >> 32;
+    uint32_t rs2_lo =3D RS2;
+    uint32_t rs2_hi =3D RS2 >> 32;
+
+    uint32_t r_lo =3D (rs1_hi ^ rs2_lo);
+    uint32_t r_hi =3D (rs1_hi ^ rs2_lo ^ rs2_hi);
+    target_ulong result =3D ((uint64_t)r_hi << 32) | r_lo;
+
+    return result;
+}
+
+target_ulong HELPER(aes64ks1i)(target_ulong rs1, target_ulong rnum)
+{
+    uint64_t RS1 =3D rs1;
+    static const uint8_t round_consts[10] =3D {
+        0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80, 0x1b, 0x36
+    };
+
+    uint8_t enc_rnum =3D rnum;
+    uint32_t temp =3D (RS1 >> 32) & 0xFFFFFFFF;
+    uint8_t rcon_ =3D 0;
+    target_ulong result;
+
+    if (enc_rnum !=3D 0xA) {
+        temp =3D ror32(temp, 8); /* Rotate right by 8 */
+        rcon_ =3D round_consts[enc_rnum];
+    }
+
+    temp =3D ((uint32_t)AES_sbox[(temp >> 24) & 0xFF] << 24) |
+           ((uint32_t)AES_sbox[(temp >> 16) & 0xFF] << 16) |
+           ((uint32_t)AES_sbox[(temp >> 8) & 0xFF] << 8) |
+           ((uint32_t)AES_sbox[(temp >> 0) & 0xFF] << 0);
+
+    temp ^=3D rcon_;
+
+    result =3D ((uint64_t)temp << 32) | temp;
+
+    return result;
+}
+
+target_ulong HELPER(aes64im)(target_ulong rs1)
+{
+    uint64_t RS1 =3D rs1;
+    uint32_t col_0 =3D RS1 & 0xFFFFFFFF;
+    uint32_t col_1 =3D RS1 >> 32;
+    target_ulong result;
+
+    col_0 =3D AES_INVMIXCOLUMN(col_0);
+    col_1 =3D AES_INVMIXCOLUMN(col_1);
+
+    result =3D ((uint64_t)col_1 << 32) | col_0;
+
+    return result;
+}
 #undef sext32_xlen
diff --git a/target/riscv/insn_trans/trans_rvk.c.inc b/target/riscv/insn_=
trans/trans_rvk.c.inc
index 8d0b42106f..6336b48cb5 100644
--- a/target/riscv/insn_trans/trans_rvk.c.inc
+++ b/target/riscv/insn_trans/trans_rvk.c.inc
@@ -69,3 +69,57 @@ static bool trans_aes32dsi(DisasContext *ctx, arg_aes3=
2dsi *a)
     REQUIRE_ZKND(ctx);
     return gen_aes32_sm4(ctx, a, gen_helper_aes32dsi);
 }
+
+static bool trans_aes64es(DisasContext *ctx, arg_aes64es *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_ZKNE(ctx);
+    return gen_arith(ctx, a, EXT_NONE, gen_helper_aes64es, NULL);
+}
+
+static bool trans_aes64esm(DisasContext *ctx, arg_aes64esm *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_ZKNE(ctx);
+    return gen_arith(ctx, a, EXT_NONE, gen_helper_aes64esm, NULL);
+}
+
+static bool trans_aes64ds(DisasContext *ctx, arg_aes64ds *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_ZKND(ctx);
+    return gen_arith(ctx, a, EXT_NONE, gen_helper_aes64ds, NULL);
+}
+
+static bool trans_aes64dsm(DisasContext *ctx, arg_aes64dsm *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_ZKND(ctx);
+    return gen_arith(ctx, a, EXT_NONE, gen_helper_aes64dsm, NULL);
+}
+
+static bool trans_aes64ks2(DisasContext *ctx, arg_aes64ks2 *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_EITHER_EXT(ctx, zknd, zkne);
+    return gen_arith(ctx, a, EXT_NONE, gen_helper_aes64ks2, NULL);
+}
+
+static bool trans_aes64ks1i(DisasContext *ctx, arg_aes64ks1i *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_EITHER_EXT(ctx, zknd, zkne);
+
+    if (a->imm > 0xA) {
+        return false;
+    }
+
+    return gen_arith_imm_tl(ctx, a, EXT_NONE, gen_helper_aes64ks1i, NULL=
);
+}
+
+static bool trans_aes64im(DisasContext *ctx, arg_aes64im *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_ZKND(ctx);
+    return gen_unary(ctx, a, EXT_NONE, gen_helper_aes64im);
+}
--=20
2.35.1


