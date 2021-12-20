Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CFF447A52F
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 07:55:19 +0100 (CET)
Received: from localhost ([::1]:42972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzCZq-0001tI-40
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 01:55:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAp0-0004du-3H
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 00:02:50 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:13399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAot-0008MN-BJ
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 00:02:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639976564; x=1671512564;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Es6frg4kQsRdhrwwEh2OsnvjogKfzVvkHNHnsn/RrBI=;
 b=JfniKSkkHEp5M0kpwLFl6BDcCL3RVpq5l7h0LquDzcRCVU/pI2wLHE2d
 3HoeWX7FPJp8qo+oZR2AjjAfBbeqJKdshuZJW7itVhq/UlvLSdL4PoHiG
 le55TTWOv/0K6Kwju7CAiUqFigG8apVYckBItp3oC+BQPkt291U95CVa9
 JFSnuJLdPGgSwDOif7DpPrx/h3sFJeIbGSRVt5SmrZK2fyj4z7KVEGw9j
 YW1Pg4hSsOZ1TADs33P/+iS6xfKJBWQ2Qxc91rApZMPhad74L39/yPwFN
 3oG0Jjc23iZyrKP2EeW5YpbzHQVjqsGF2G10FPZ6JnjyXnTwKvF2SqN8d w==;
X-IronPort-AV: E=Sophos;i="5.88,219,1635177600"; d="scan'208";a="189680258"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2021 13:01:40 +0800
IronPort-SDR: gunxI92ybXSCWB61kpZxPpGrmZKJI+HDniBf1IWFLkOeghYJWswc+xFqssBD06/e9MFI95WBrb
 aX8CUUzg7tR3TeswYXKmPFiQHiNXCRfECQF21mdLJTbuYNCVqPmFgFy0iuzPbIwRtiSGY4Z2jJ
 xMLu5Gw+5A3kWQQTd0tZHkj3zySSf45hrRe0rJ9korrqaa3Hdu2hsc+h0xRKG5ReTbTG3tI2kw
 2Iea0y87CU1GaKTt/w3JnzLjHehmB7V07J8ODtF6zW51PxLy+5anLNyQQIFhipOVTRoKXwPF2f
 UYn3A7NAvT5DOEuqf1jIv0WU
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:34:29 -0800
IronPort-SDR: nz32X0JxgCRca+qg/3Hd2npavtCBY0Y5F33ti/IyHsgVVnB+Fth3b6+8ZldcDuDg3SYXgrWvQA
 AYQ4IZjEOu2gX3DvKc+v0ZUx7iq0BugeaPC62uztB0UGSUwexaBooDCXh9r8Qgk/DdrcCw4Tbu
 sbi50FT/TPsH+Z4gasrzwq4XfUmblUqdiysbVQHLsCrPrGJEFZ6BoYd61gcGX6klvNLHPpwcLz
 5eT3sRMCi7ymKYcIynHPzStcPMX/X+DSmnTbtHp4a+1InQDy3fzNkzCxLDJsWhF6Devrfz6Y4h
 +pU=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 21:01:40 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JHS9b6Nkzz1RtVG
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 21:01:39 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1639976499; x=1642568500; bh=Es6frg4kQsRdhrwwEh
 2OsnvjogKfzVvkHNHnsn/RrBI=; b=klzjalIGnnCYz+dsYhjPCf//zUJEG2r12A
 NM9E1/4U6QDayo2ySF8pSDVZ1idQKiXVx8k64T2z+NtVIpmDRa2U+9PvpaZ6GEW5
 AmNk74ySTg0iJNZ0o82d5aTq4rS7Hg772xfre290305JoV3RHzWw9dr3tR3o8H7r
 UIC8BapZI+KVx4dxkrZBr9IOB3pqOS3XRyWEtynnqQHwle1JkQUBLt/P/ZP9Ro33
 DL+Txso/NOK8PJEEYYgvqBjsIhXKYdL6hXOlNKCwrxm2uSZU2woHoh8NL9cw4eSU
 0CXenCTQ/JV1cgEacyJnqoAfwqlyT1dgQcCOBhhz218OVLXAPXbQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id DOPiQ8gf418I for <qemu-devel@nongnu.org>;
 Sun, 19 Dec 2021 21:01:39 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.68])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JHS9X2FVVz1Rvlf;
 Sun, 19 Dec 2021 21:01:35 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 65/88] target/riscv: rvv-1.0: remove vmford.vv and vmford.vf
Date: Mon, 20 Dec 2021 14:56:42 +1000
Message-Id: <20211220045705.62174-66-alistair.francis@opensource.wdc.com>
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
Message-Id: <20211210075704.23951-58-frank.chang@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/helper.h                   | 6 ------
 target/riscv/insn32.decode              | 2 --
 target/riscv/vector_helper.c            | 7 -------
 target/riscv/insn_trans/trans_rvv.c.inc | 2 --
 4 files changed, 17 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index af79570da8..1727075dce 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -902,12 +902,6 @@ DEF_HELPER_6(vmfgt_vf_d, void, ptr, ptr, i64, ptr, e=
nv, i32)
 DEF_HELPER_6(vmfge_vf_h, void, ptr, ptr, i64, ptr, env, i32)
 DEF_HELPER_6(vmfge_vf_w, void, ptr, ptr, i64, ptr, env, i32)
 DEF_HELPER_6(vmfge_vf_d, void, ptr, ptr, i64, ptr, env, i32)
-DEF_HELPER_6(vmford_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
-DEF_HELPER_6(vmford_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
-DEF_HELPER_6(vmford_vv_d, void, ptr, ptr, ptr, ptr, env, i32)
-DEF_HELPER_6(vmford_vf_h, void, ptr, ptr, i64, ptr, env, i32)
-DEF_HELPER_6(vmford_vf_w, void, ptr, ptr, i64, ptr, env, i32)
-DEF_HELPER_6(vmford_vf_d, void, ptr, ptr, i64, ptr, env, i32)
=20
 DEF_HELPER_5(vfclass_v_h, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_5(vfclass_v_w, void, ptr, ptr, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index aee3a6cd01..82484fda75 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -582,8 +582,6 @@ vmfle_vv        011001 . ..... ..... 001 ..... 101011=
1 @r_vm
 vmfle_vf        011001 . ..... ..... 101 ..... 1010111 @r_vm
 vmfgt_vf        011101 . ..... ..... 101 ..... 1010111 @r_vm
 vmfge_vf        011111 . ..... ..... 101 ..... 1010111 @r_vm
-vmford_vv       011010 . ..... ..... 001 ..... 1010111 @r_vm
-vmford_vf       011010 . ..... ..... 101 ..... 1010111 @r_vm
 vfclass_v       010011 . ..... 10000 001 ..... 1010111 @r2_vm
 vfmerge_vfm     010111 0 ..... ..... 101 ..... 1010111 @r_vm_0
 vfmv_v_f        010111 1 00000 ..... 101 ..... 1010111 @r2
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 128406aa78..aed230e1ad 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -3630,13 +3630,6 @@ GEN_VEXT_CMP_VF(vmfge_vf_h, uint16_t, H2, vmfge16)
 GEN_VEXT_CMP_VF(vmfge_vf_w, uint32_t, H4, vmfge32)
 GEN_VEXT_CMP_VF(vmfge_vf_d, uint64_t, H8, vmfge64)
=20
-GEN_VEXT_CMP_VV_ENV(vmford_vv_h, uint16_t, H2, !float16_unordered_quiet)
-GEN_VEXT_CMP_VV_ENV(vmford_vv_w, uint32_t, H4, !float32_unordered_quiet)
-GEN_VEXT_CMP_VV_ENV(vmford_vv_d, uint64_t, H8, !float64_unordered_quiet)
-GEN_VEXT_CMP_VF(vmford_vf_h, uint16_t, H2, !float16_unordered_quiet)
-GEN_VEXT_CMP_VF(vmford_vf_w, uint32_t, H4, !float32_unordered_quiet)
-GEN_VEXT_CMP_VF(vmford_vf_d, uint64_t, H8, !float64_unordered_quiet)
-
 /* Vector Floating-Point Classify Instruction */
 #define OPIVV1(NAME, TD, T2, TX2, HD, HS2, OP)         \
 static void do_##NAME(void *vd, void *vs2, int i)      \
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_=
trans/trans_rvv.c.inc
index 119c82ca47..4c5f813ccf 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2425,7 +2425,6 @@ GEN_OPFVV_TRANS(vmfeq_vv, opfvv_cmp_check)
 GEN_OPFVV_TRANS(vmfne_vv, opfvv_cmp_check)
 GEN_OPFVV_TRANS(vmflt_vv, opfvv_cmp_check)
 GEN_OPFVV_TRANS(vmfle_vv, opfvv_cmp_check)
-GEN_OPFVV_TRANS(vmford_vv, opfvv_cmp_check)
=20
 static bool opfvf_cmp_check(DisasContext *s, arg_rmrr *a)
 {
@@ -2441,7 +2440,6 @@ GEN_OPFVF_TRANS(vmflt_vf, opfvf_cmp_check)
 GEN_OPFVF_TRANS(vmfle_vf, opfvf_cmp_check)
 GEN_OPFVF_TRANS(vmfgt_vf, opfvf_cmp_check)
 GEN_OPFVF_TRANS(vmfge_vf, opfvf_cmp_check)
-GEN_OPFVF_TRANS(vmford_vf, opfvf_cmp_check)
=20
 /* Vector Floating-Point Classify Instruction */
 GEN_OPFV_TRANS(vfclass_v, opfv_check)
--=20
2.31.1


