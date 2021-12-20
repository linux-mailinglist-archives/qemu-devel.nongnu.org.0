Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 736D547A500
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 07:27:07 +0100 (CET)
Received: from localhost ([::1]:40162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzC8Y-0005MC-FE
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 01:27:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAoj-0004cz-2W
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 00:03:20 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:13359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAoM-0008G0-1U
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 00:02:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639976531; x=1671512531;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7GLL+JECjmVjn5fQXdE2JAmh/v1dSEjFf5sEm/HdqWE=;
 b=TO2L6xqhE3wRuoeUHMlGYhztwh+ROm2SFKXz+r6MRz6M8YcnDfwbCZEu
 YVZlNeURbgxAixlK3EhCmwwa8dHLDQgWhpaxNk7wZkboQvYNDIcX0epZw
 5xz+zVSC/uXIErCDB2LyrBGAElpFNh/3BdSq0dR2F6Y2Hvdg/o7xPAxfz
 zgF3YdUs7tOYM5NRpqez6VtJ5dAGI2igtxIOUOJ/XuUDwwSm8FypcfSwC
 HczVrcbU1BJ6D7s1J+d1bQDShHu1VTuFD7K+86njS67wc/5iJUAyRCT3D
 em7lqxFUgAOTaLn5xtxC+wbJ3PA/W7LXpamfurO7VYRkklmPLXrUjm3N/ A==;
X-IronPort-AV: E=Sophos;i="5.88,219,1635177600"; d="scan'208";a="189680215"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2021 13:01:21 +0800
IronPort-SDR: bCv/3P0/3BmULqwzunoWzDyk0XXr5iW2flMN8FWcXQRJg8QyEOpLeAjC3FXMV4O9ior7uafXgu
 c0efzAwI5V8LW9VjCbSvm46h97gl2peqlVMqxRYPPyb881UdHmQ/xz3oPn7avpawxFAR6ojQ2G
 rtcxXG1vb5JX91B0kcr/X1Fgx0NsniG8dtlVEfWmLPjItX310ritWM14Ihph+r2h9S1ufjb01w
 bUo95hCpfLbgqpnNoCib2euDGWGkBTHi94FiMnQZVltr+pPKen2YPevUipWv7vOTZhkPTOdQfD
 L+Dd/cxq3Lsl8ERtp5VbGNlQ
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:34:10 -0800
IronPort-SDR: JOxp8T4LbbVGYqrktKWfmfcejdjc+klxzGB+eucdhEUX9L85WhCkZdV8W31wPmgWLUXoGATQq2
 HNIIIf0Kgfuwtbwm8PnDWOPQhQTMIGvBjYKbZ/QMZ4P2onN3YJLMzzJFmJ3dPD/S9Nivo88Eub
 WY3eR8EOous8phOLnQeWgKzUAU64z9c3mSvRUU4BuGIZ5vofZ8a9n1AunIQhn5Da8PPUqjbHur
 eNTXnDvzxUhGlJarhafkveSv/oWams1nQ/SVCqjnYSowhPlnD3BeFdrmpGEvfsMX5LDH3jP8bs
 DiM=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 21:01:20 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JHS9D3p2Cz1RvTg
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 21:01:20 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1639976479; x=1642568480; bh=7GLL+JECjmVjn5fQXd
 E2JAmh/v1dSEjFf5sEm/HdqWE=; b=SeZpgqDK5Veb/3mJIYVpXwG+ZEbV0oaq76
 xGedMuDgf+6pOmoqtsXwVfUrfh0wsg3/oMIvVO0go4tfFJWMaWZwWIMM/QH5U7eo
 WhQHJASOyTCkhpEn4XtP5WG57QWyowKiYqIQ27+P/k1FwBxmASgSfnCmJ4Mq7Pkf
 pSxReYSiw94+gQXRPKvDM+HW1ABBxjeJ2rWYDXO+/cBG8JbRCUyDChjQLKq50dwr
 QjfzyUMkRYKharwUyG/cflsIgC7SZz0nvBt3IRtgDhDlYC4W4NO3/YxWn1wfmWEZ
 4Nb4AjSYUIV3QcFqHrRsQkZHAKUk3je6MCCdD6IljZZhv8pSGDjg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id SyC_Jn8x7tDH for <qemu-devel@nongnu.org>;
 Sun, 19 Dec 2021 21:01:19 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.68])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JHS9859bYz1RtVG;
 Sun, 19 Dec 2021 21:01:16 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 60/88] target/riscv: rvv-1.0: narrowing fixed-point clip
 instructions
Date: Mon, 20 Dec 2021 14:56:37 +1000
Message-Id: <20211220045705.62174-61-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211220045705.62174-1-alistair.francis@opensource.wdc.com>
References: <20211220045705.62174-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=9816edf2f=alistair.francis@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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
Message-Id: <20211210075704.23951-53-frank.chang@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/helper.h                   | 24 ++++++------
 target/riscv/insn32.decode              | 12 +++---
 target/riscv/vector_helper.c            | 52 ++++++++++++-------------
 target/riscv/insn_trans/trans_rvv.c.inc | 12 +++---
 4 files changed, 50 insertions(+), 50 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 012d034377..3ea21b4a57 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -725,18 +725,18 @@ DEF_HELPER_6(vssra_vx_h, void, ptr, ptr, tl, ptr, e=
nv, i32)
 DEF_HELPER_6(vssra_vx_w, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vssra_vx_d, void, ptr, ptr, tl, ptr, env, i32)
=20
-DEF_HELPER_6(vnclip_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
-DEF_HELPER_6(vnclip_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
-DEF_HELPER_6(vnclip_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
-DEF_HELPER_6(vnclipu_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
-DEF_HELPER_6(vnclipu_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
-DEF_HELPER_6(vnclipu_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
-DEF_HELPER_6(vnclipu_vx_b, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vnclipu_vx_h, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vnclipu_vx_w, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vnclip_vx_b, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vnclip_vx_h, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vnclip_vx_w, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vnclip_wv_b, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vnclip_wv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vnclip_wv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vnclipu_wv_b, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vnclipu_wv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vnclipu_wv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vnclipu_wx_b, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vnclipu_wx_h, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vnclipu_wx_w, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vnclip_wx_b, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vnclip_wx_h, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vnclip_wx_w, void, ptr, ptr, tl, ptr, env, i32)
=20
 DEF_HELPER_6(vfadd_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vfadd_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index c5cc14c45c..eeab6b00a1 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -516,12 +516,12 @@ vssrl_vi        101010 . ..... ..... 011 ..... 1010=
111 @r_vm
 vssra_vv        101011 . ..... ..... 000 ..... 1010111 @r_vm
 vssra_vx        101011 . ..... ..... 100 ..... 1010111 @r_vm
 vssra_vi        101011 . ..... ..... 011 ..... 1010111 @r_vm
-vnclipu_vv      101110 . ..... ..... 000 ..... 1010111 @r_vm
-vnclipu_vx      101110 . ..... ..... 100 ..... 1010111 @r_vm
-vnclipu_vi      101110 . ..... ..... 011 ..... 1010111 @r_vm
-vnclip_vv       101111 . ..... ..... 000 ..... 1010111 @r_vm
-vnclip_vx       101111 . ..... ..... 100 ..... 1010111 @r_vm
-vnclip_vi       101111 . ..... ..... 011 ..... 1010111 @r_vm
+vnclipu_wv      101110 . ..... ..... 000 ..... 1010111 @r_vm
+vnclipu_wx      101110 . ..... ..... 100 ..... 1010111 @r_vm
+vnclipu_wi      101110 . ..... ..... 011 ..... 1010111 @r_vm
+vnclip_wv       101111 . ..... ..... 000 ..... 1010111 @r_vm
+vnclip_wx       101111 . ..... ..... 100 ..... 1010111 @r_vm
+vnclip_wi       101111 . ..... ..... 011 ..... 1010111 @r_vm
 vfadd_vv        000000 . ..... ..... 001 ..... 1010111 @r_vm
 vfadd_vf        000000 . ..... ..... 101 ..... 1010111 @r_vm
 vfsub_vv        000010 . ..... ..... 001 ..... 1010111 @r_vm
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 7fa5189af4..c95c8bd9db 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -2875,19 +2875,19 @@ vnclip32(CPURISCVState *env, int vxrm, int64_t a,=
 int32_t b)
     }
 }
=20
-RVVCALL(OPIVV2_RM, vnclip_vv_b, NOP_SSS_B, H1, H2, H1, vnclip8)
-RVVCALL(OPIVV2_RM, vnclip_vv_h, NOP_SSS_H, H2, H4, H2, vnclip16)
-RVVCALL(OPIVV2_RM, vnclip_vv_w, NOP_SSS_W, H4, H8, H4, vnclip32)
-GEN_VEXT_VV_RM(vnclip_vv_b, 1, 1)
-GEN_VEXT_VV_RM(vnclip_vv_h, 2, 2)
-GEN_VEXT_VV_RM(vnclip_vv_w, 4, 4)
-
-RVVCALL(OPIVX2_RM, vnclip_vx_b, NOP_SSS_B, H1, H2, vnclip8)
-RVVCALL(OPIVX2_RM, vnclip_vx_h, NOP_SSS_H, H2, H4, vnclip16)
-RVVCALL(OPIVX2_RM, vnclip_vx_w, NOP_SSS_W, H4, H8, vnclip32)
-GEN_VEXT_VX_RM(vnclip_vx_b, 1, 1)
-GEN_VEXT_VX_RM(vnclip_vx_h, 2, 2)
-GEN_VEXT_VX_RM(vnclip_vx_w, 4, 4)
+RVVCALL(OPIVV2_RM, vnclip_wv_b, NOP_SSS_B, H1, H2, H1, vnclip8)
+RVVCALL(OPIVV2_RM, vnclip_wv_h, NOP_SSS_H, H2, H4, H2, vnclip16)
+RVVCALL(OPIVV2_RM, vnclip_wv_w, NOP_SSS_W, H4, H8, H4, vnclip32)
+GEN_VEXT_VV_RM(vnclip_wv_b, 1, 1)
+GEN_VEXT_VV_RM(vnclip_wv_h, 2, 2)
+GEN_VEXT_VV_RM(vnclip_wv_w, 4, 4)
+
+RVVCALL(OPIVX2_RM, vnclip_wx_b, NOP_SSS_B, H1, H2, vnclip8)
+RVVCALL(OPIVX2_RM, vnclip_wx_h, NOP_SSS_H, H2, H4, vnclip16)
+RVVCALL(OPIVX2_RM, vnclip_wx_w, NOP_SSS_W, H4, H8, vnclip32)
+GEN_VEXT_VX_RM(vnclip_wx_b, 1, 1)
+GEN_VEXT_VX_RM(vnclip_wx_h, 2, 2)
+GEN_VEXT_VX_RM(vnclip_wx_w, 4, 4)
=20
 static inline uint8_t
 vnclipu8(CPURISCVState *env, int vxrm, uint16_t a, uint8_t b)
@@ -2925,7 +2925,7 @@ static inline uint32_t
 vnclipu32(CPURISCVState *env, int vxrm, uint64_t a, uint32_t b)
 {
     uint8_t round, shift =3D b & 0x3f;
-    int64_t res;
+    uint64_t res;
=20
     round =3D get_round(vxrm, a, shift);
     res   =3D (a >> shift)  + round;
@@ -2937,19 +2937,19 @@ vnclipu32(CPURISCVState *env, int vxrm, uint64_t =
a, uint32_t b)
     }
 }
=20
-RVVCALL(OPIVV2_RM, vnclipu_vv_b, NOP_UUU_B, H1, H2, H1, vnclipu8)
-RVVCALL(OPIVV2_RM, vnclipu_vv_h, NOP_UUU_H, H2, H4, H2, vnclipu16)
-RVVCALL(OPIVV2_RM, vnclipu_vv_w, NOP_UUU_W, H4, H8, H4, vnclipu32)
-GEN_VEXT_VV_RM(vnclipu_vv_b, 1, 1)
-GEN_VEXT_VV_RM(vnclipu_vv_h, 2, 2)
-GEN_VEXT_VV_RM(vnclipu_vv_w, 4, 4)
+RVVCALL(OPIVV2_RM, vnclipu_wv_b, NOP_UUU_B, H1, H2, H1, vnclipu8)
+RVVCALL(OPIVV2_RM, vnclipu_wv_h, NOP_UUU_H, H2, H4, H2, vnclipu16)
+RVVCALL(OPIVV2_RM, vnclipu_wv_w, NOP_UUU_W, H4, H8, H4, vnclipu32)
+GEN_VEXT_VV_RM(vnclipu_wv_b, 1, 1)
+GEN_VEXT_VV_RM(vnclipu_wv_h, 2, 2)
+GEN_VEXT_VV_RM(vnclipu_wv_w, 4, 4)
=20
-RVVCALL(OPIVX2_RM, vnclipu_vx_b, NOP_UUU_B, H1, H2, vnclipu8)
-RVVCALL(OPIVX2_RM, vnclipu_vx_h, NOP_UUU_H, H2, H4, vnclipu16)
-RVVCALL(OPIVX2_RM, vnclipu_vx_w, NOP_UUU_W, H4, H8, vnclipu32)
-GEN_VEXT_VX_RM(vnclipu_vx_b, 1, 1)
-GEN_VEXT_VX_RM(vnclipu_vx_h, 2, 2)
-GEN_VEXT_VX_RM(vnclipu_vx_w, 4, 4)
+RVVCALL(OPIVX2_RM, vnclipu_wx_b, NOP_UUU_B, H1, H2, vnclipu8)
+RVVCALL(OPIVX2_RM, vnclipu_wx_h, NOP_UUU_H, H2, H4, vnclipu16)
+RVVCALL(OPIVX2_RM, vnclipu_wx_w, NOP_UUU_W, H4, H8, vnclipu32)
+GEN_VEXT_VX_RM(vnclipu_wx_b, 1, 1)
+GEN_VEXT_VX_RM(vnclipu_wx_h, 2, 2)
+GEN_VEXT_VX_RM(vnclipu_wx_w, 4, 4)
=20
 /*
  *** Vector Float Point Arithmetic Instructions
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_=
trans/trans_rvv.c.inc
index 597a367444..f5588d9832 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2034,12 +2034,12 @@ GEN_OPIVI_TRANS(vssrl_vi, IMM_ZX, vssrl_vx, opivx=
_check)
 GEN_OPIVI_TRANS(vssra_vi, IMM_SX, vssra_vx, opivx_check)
=20
 /* Vector Narrowing Fixed-Point Clip Instructions */
-GEN_OPIWV_NARROW_TRANS(vnclipu_vv)
-GEN_OPIWV_NARROW_TRANS(vnclip_vv)
-GEN_OPIWX_NARROW_TRANS(vnclipu_vx)
-GEN_OPIWX_NARROW_TRANS(vnclip_vx)
-GEN_OPIWI_NARROW_TRANS(vnclipu_vi, IMM_ZX, vnclipu_vx)
-GEN_OPIWI_NARROW_TRANS(vnclip_vi, IMM_ZX, vnclip_vx)
+GEN_OPIWV_NARROW_TRANS(vnclipu_wv)
+GEN_OPIWV_NARROW_TRANS(vnclip_wv)
+GEN_OPIWX_NARROW_TRANS(vnclipu_wx)
+GEN_OPIWX_NARROW_TRANS(vnclip_wx)
+GEN_OPIWI_NARROW_TRANS(vnclipu_wi, IMM_ZX, vnclipu_wx)
+GEN_OPIWI_NARROW_TRANS(vnclip_wi, IMM_ZX, vnclip_wx)
=20
 /*
  *** Vector Float Point Arithmetic Instructions
--=20
2.31.1


