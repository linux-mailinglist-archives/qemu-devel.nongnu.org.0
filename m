Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49CAB5EBB6B
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 09:23:34 +0200 (CEST)
Received: from localhost ([::1]:56048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od4wH-00063D-CF
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 03:23:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=262caef14=alistair.francis@opensource.wdc.com>)
 id 1od48p-0005uH-D5
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 02:32:27 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:44585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=262caef14=alistair.francis@opensource.wdc.com>)
 id 1od48n-0001Ix-9f
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 02:32:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1664260345; x=1695796345;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JTSMLkxcYCzyxXWNrOTbqqMrysZ7unMLjmz7dj6Id2g=;
 b=I+DxeOIZok3IJq6gPM5vQkWhG8rHhfKtiRsjFcyOcAAf82tMOhinbDU9
 PzZ5zLC88KiXU02uxWx74R/6uoNwKZPyEnCvoSodqZCzJdhxHBcIXB5zm
 JIPwc2ChKEUpy1qp9yEWIF+e2rVMFmAacrwW0HtGJzV9h6RPMFPjEKPmy
 GPdm5bc1QNXSZcDEh3zmN3x9RLi9dKRwOb1Zwn2RrtPFI1EfXpKSJVboy
 0C8xFsE4HuFcyZN8Xb44SZ+xZ4+eU6riQFUU6aLjmq6hwKsn6AA6DwXxA
 CRNGwhDc4uPryWjffIGgkn/618/NAgslQx2E140eQFMykfrYRPNi8uXlP g==;
X-IronPort-AV: E=Sophos;i="5.93,348,1654531200"; d="scan'208";a="217530942"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 27 Sep 2022 14:31:49 +0800
IronPort-SDR: /hriwk+TII0Fzi2MSL9pqj4bFLfhqEjQtwMr5a9BWysZizvSWfsifQHqwuK34grrctX6Eqa8fl
 qPPVn63ukqvPT+68Azl+QBtvAta8OBekae1/qs1FV39APT8xlyBVQtgz81zEnZ8/vR0kd2nyra
 fLFOpaz06lcP5RigOH6H3GWYFXbefDeDgfWjVH19X3vs79dVmOefP6jMRhPLdbM4ZyslI8jMiZ
 8xsN34D71pqTZvRwDGdArDxENlELoDlFGr9NIgMz2vOIhaLbgKMGjAVBnaVylnpEZv7uxsR1Gc
 sEkpbfLFfaplDnXF2DhI7iGS
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Sep 2022 22:51:46 -0700
IronPort-SDR: qxarEGhI+j0Xp48rWcEYDSiBfdaKIF/LV6hPnm/WO4iPMgHv/lu9wgdmSbDQsE0ePlpQqaPr3C
 cG3Lvi5b+YEQofGAKZyqSN9rMG9RzIbohNQWrvuJvmK4MSWBqyxwvslO1lEuWM31cc088YsKCG
 n0YEKLbo6e07YKQzkU5aZOgM3+GUMuL3Td12Y5fS07HKaITMxZUsY+G/iwB3WcPqiK0H3K5UXc
 Z/1qWWesZCkXDsCJKXNTWPT3Wvb7eW+2TMzIiChVv8UtTDWhYvw84JNlLKqXMIQdxr6U7oemeO
 f/4=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Sep 2022 23:31:49 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Mc8sw6zf6z1Rwrq
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 23:31:48 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1664260308; x=1666852309; bh=JTSMLkxcYCzyxXWNrO
 TbqqMrysZ7unMLjmz7dj6Id2g=; b=S6ppP47X8j1ySUeZZFCprnRV/VYOyZy7nP
 H54Da4svOUAi+gYUgP9ykqHwCl6YC0O9+Wn5Ueo+kDfMAm+L95e7hKfitHDa09/K
 x8cVAsxtrJbRzyv1u2fxcZ9N5Dc6w2ADz8NgMjb9secjj1WQFOxwVL+McB/erkFu
 uDJlVF36ZE5h0p9gmT1anax5JhdVmWqO6psv08QIXrZl3YnWG3dW+fX/3F3w5LUJ
 Wwg4WROwIVb2xR2GVu3UWV11l8b3s57tB25+n7W0Is4MLOfP3QqT0GPmM6vEaSJ0
 3WacC2LSjDxFUqxsfoZWsVDk0ZvdR0Yjih6xeELSJOUQ5qjDcRGQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id CiqK49PptpIG for <qemu-devel@nongnu.org>;
 Mon, 26 Sep 2022 23:31:48 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.167.123])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Mc8st5nysz1RvTr;
 Mon, 26 Sep 2022 23:31:46 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Yang Liu <liuyang22@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Frank Chang <frank.chang@sifive.com>
Subject: [PULL v2 22/22] target/riscv: rvv-1.0: vf[w]redsum distinguish
 between ordered/unordered
Date: Tue, 27 Sep 2022 16:31:04 +1000
Message-Id: <20220927063104.2846825-23-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220927063104.2846825-1-alistair.francis@opensource.wdc.com>
References: <20220927063104.2846825-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=262caef14=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
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

From: Yang Liu <liuyang22@iscas.ac.cn>

Starting with RVV1.0, the original vf[w]redsum_vs instruction was renamed
to vf[w]redusum_vs. The distinction between ordered and unordered is also
more consistent with other instructions, although there is no difference
in implementation between the two for QEMU.

Signed-off-by: Yang Liu <liuyang22@iscas.ac.cn>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Message-Id: <20220817074802.20765-2-liuyang22@iscas.ac.cn>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/helper.h                   | 15 ++++++++++-----
 target/riscv/insn32.decode              |  6 ++++--
 target/riscv/vector_helper.c            | 19 +++++++++++++------
 target/riscv/insn_trans/trans_rvv.c.inc |  6 ++++--
 4 files changed, 31 insertions(+), 15 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 4ef3b2251d..a03014fe67 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1009,9 +1009,12 @@ DEF_HELPER_6(vwredsum_vs_b, void, ptr, ptr, ptr, p=
tr, env, i32)
 DEF_HELPER_6(vwredsum_vs_h, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vwredsum_vs_w, void, ptr, ptr, ptr, ptr, env, i32)
=20
-DEF_HELPER_6(vfredsum_vs_h, void, ptr, ptr, ptr, ptr, env, i32)
-DEF_HELPER_6(vfredsum_vs_w, void, ptr, ptr, ptr, ptr, env, i32)
-DEF_HELPER_6(vfredsum_vs_d, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vfredusum_vs_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vfredusum_vs_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vfredusum_vs_d, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vfredosum_vs_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vfredosum_vs_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vfredosum_vs_d, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vfredmax_vs_h, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vfredmax_vs_w, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vfredmax_vs_d, void, ptr, ptr, ptr, ptr, env, i32)
@@ -1019,8 +1022,10 @@ DEF_HELPER_6(vfredmin_vs_h, void, ptr, ptr, ptr, p=
tr, env, i32)
 DEF_HELPER_6(vfredmin_vs_w, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vfredmin_vs_d, void, ptr, ptr, ptr, ptr, env, i32)
=20
-DEF_HELPER_6(vfwredsum_vs_h, void, ptr, ptr, ptr, ptr, env, i32)
-DEF_HELPER_6(vfwredsum_vs_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vfwredusum_vs_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vfwredusum_vs_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vfwredosum_vs_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vfwredosum_vs_w, void, ptr, ptr, ptr, ptr, env, i32)
=20
 DEF_HELPER_6(vmand_mm, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vmnand_mm, void, ptr, ptr, ptr, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 595fdcdad8..d0253b8104 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -664,11 +664,13 @@ vredmax_vs      000111 . ..... ..... 010 ..... 1010=
111 @r_vm
 vwredsumu_vs    110000 . ..... ..... 000 ..... 1010111 @r_vm
 vwredsum_vs     110001 . ..... ..... 000 ..... 1010111 @r_vm
 # Vector ordered and unordered reduction sum
-vfredsum_vs     0000-1 . ..... ..... 001 ..... 1010111 @r_vm
+vfredusum_vs    000001 . ..... ..... 001 ..... 1010111 @r_vm
+vfredosum_vs    000011 . ..... ..... 001 ..... 1010111 @r_vm
 vfredmin_vs     000101 . ..... ..... 001 ..... 1010111 @r_vm
 vfredmax_vs     000111 . ..... ..... 001 ..... 1010111 @r_vm
 # Vector widening ordered and unordered float reduction sum
-vfwredsum_vs    1100-1 . ..... ..... 001 ..... 1010111 @r_vm
+vfwredusum_vs   110001 . ..... ..... 001 ..... 1010111 @r_vm
+vfwredosum_vs   110011 . ..... ..... 001 ..... 1010111 @r_vm
 vmand_mm        011001 - ..... ..... 010 ..... 1010111 @r
 vmnand_mm       011101 - ..... ..... 010 ..... 1010111 @r
 vmandn_mm       011000 - ..... ..... 010 ..... 1010111 @r
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 2828073497..b94f809eb3 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4714,9 +4714,14 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,  =
         \
 }
=20
 /* Unordered sum */
-GEN_VEXT_FRED(vfredsum_vs_h, uint16_t, uint16_t, H2, H2, float16_add)
-GEN_VEXT_FRED(vfredsum_vs_w, uint32_t, uint32_t, H4, H4, float32_add)
-GEN_VEXT_FRED(vfredsum_vs_d, uint64_t, uint64_t, H8, H8, float64_add)
+GEN_VEXT_FRED(vfredusum_vs_h, uint16_t, uint16_t, H2, H2, float16_add)
+GEN_VEXT_FRED(vfredusum_vs_w, uint32_t, uint32_t, H4, H4, float32_add)
+GEN_VEXT_FRED(vfredusum_vs_d, uint64_t, uint64_t, H8, H8, float64_add)
+
+/* Ordered sum */
+GEN_VEXT_FRED(vfredosum_vs_h, uint16_t, uint16_t, H2, H2, float16_add)
+GEN_VEXT_FRED(vfredosum_vs_w, uint32_t, uint32_t, H4, H4, float32_add)
+GEN_VEXT_FRED(vfredosum_vs_d, uint64_t, uint64_t, H8, H8, float64_add)
=20
 /* Maximum value */
 GEN_VEXT_FRED(vfredmax_vs_h, uint16_t, uint16_t, H2, H2, float16_maximum=
_number)
@@ -4740,9 +4745,11 @@ static uint64_t fwadd32(uint64_t a, uint32_t b, fl=
oat_status *s)
 }
=20
 /* Vector Widening Floating-Point Reduction Instructions */
-/* Unordered reduce 2*SEW =3D 2*SEW + sum(promote(SEW)) */
-GEN_VEXT_FRED(vfwredsum_vs_h, uint32_t, uint16_t, H4, H2, fwadd16)
-GEN_VEXT_FRED(vfwredsum_vs_w, uint64_t, uint32_t, H8, H4, fwadd32)
+/* Ordered/unordered reduce 2*SEW =3D 2*SEW + sum(promote(SEW)) */
+GEN_VEXT_FRED(vfwredusum_vs_h, uint32_t, uint16_t, H4, H2, fwadd16)
+GEN_VEXT_FRED(vfwredusum_vs_w, uint64_t, uint32_t, H8, H4, fwadd32)
+GEN_VEXT_FRED(vfwredosum_vs_h, uint32_t, uint16_t, H4, H2, fwadd16)
+GEN_VEXT_FRED(vfwredosum_vs_w, uint64_t, uint32_t, H8, H4, fwadd32)
=20
 /*
  *** Vector Mask Operations
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_=
trans/trans_rvv.c.inc
index e58208f363..4dea4413ae 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -3136,7 +3136,8 @@ static bool freduction_check(DisasContext *s, arg_r=
mrr *a)
            require_zve64f(s);
 }
=20
-GEN_OPFVV_TRANS(vfredsum_vs, freduction_check)
+GEN_OPFVV_TRANS(vfredusum_vs, freduction_check)
+GEN_OPFVV_TRANS(vfredosum_vs, freduction_check)
 GEN_OPFVV_TRANS(vfredmax_vs, freduction_check)
 GEN_OPFVV_TRANS(vfredmin_vs, freduction_check)
=20
@@ -3148,7 +3149,8 @@ static bool freduction_widen_check(DisasContext *s,=
 arg_rmrr *a)
            (s->sew !=3D MO_8);
 }
=20
-GEN_OPFVV_WIDEN_TRANS(vfwredsum_vs, freduction_widen_check)
+GEN_OPFVV_WIDEN_TRANS(vfwredusum_vs, freduction_widen_check)
+GEN_OPFVV_WIDEN_TRANS(vfwredosum_vs, freduction_widen_check)
=20
 /*
  *** Vector Mask Operations
--=20
2.37.3


