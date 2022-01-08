Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B68A4881E0
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 07:38:13 +0100 (CET)
Received: from localhost ([::1]:59284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n65Mi-00042t-BL
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 01:38:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=000118587=alistair.francis@opensource.wdc.com>)
 id 1n64eB-0000T0-Oi
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 00:52:11 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:63856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=000118587=alistair.francis@opensource.wdc.com>)
 id 1n64e9-0006sW-To
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 00:52:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1641621128; x=1673157128;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=y//U4N/6Ko/Gjvo23TbC8u+WvooHOVbxqJpjJvI0QlQ=;
 b=h8vrXDHwEZ1ta+Z+Piy36gDBezvK106s82PAoRyT2a7sGgDSX8x7bcWh
 FZPR8Ms2duMqeLq+kXwlXa85f+U7oGTy9DC6H3Pyba9yPYgFDTzd7Eg0M
 zym4MO6H99i2Dyv6+BSKN3L5Cj91ZmQ/P3xveRLFImmj8P6WH+Qgdmqht
 4MY9JpaadLCXRinsTOCpQwB1KqwTYnzD7PNCvDCf41KXSF/o/exX26Zpu
 sfirdPrytXtN+AUcrsSKsF2cwRc6OIUiMo6u/Lunt/jzXe+ukpbLMBqLh
 arIYROwfcO9uZ5Ns+Tq9WcwI8sqpG2q4f1UKC3acrybfinD9kXputhm4q A==;
X-IronPort-AV: E=Sophos;i="5.88,272,1635177600"; d="scan'208";a="189984912"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 08 Jan 2022 13:52:07 +0800
IronPort-SDR: 4s9+PQU1ximooUWrEL45OKBgIQNGGcwYnBfoSnnwX0LK/93gd4hD8PvC8VwEOMhG5TKXSwcW9b
 UN8kU3/V0AOswMg2yzRHRx9gkEmWkRqzM8z7Zt+vFfezURH86E3WpyyAeM+OvbIhUI8DQCRwSD
 rW3PWc6PfxRZ9oycmHsZlaO9sFSYPYlBjlm/vBGaZYAklac8RcSYWr6AzT+DXVwkXCx5UtP5f1
 NFPit/8ijG9QExNgCTjB5cKQC2MIIFrH4cYl2YhJtYemSJCPw1AkS67B5k/4oobwEyNRCsTT8T
 Ot9pZSohtwxDIqJXRK+RXxXG
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2022 21:25:56 -0800
IronPort-SDR: fHZAuI1C3ZJtbGKeEhKWqyUkVymET7VX3s1O0Rd3D0etVFElxb4cwbLu6dC5ndCXlYyU7a/1RQ
 SsD0HE9Wls58vBQiWjK+w6yqo/07Es8bmmOHb7sMwhaznonkavpKX+S9py/mhWmY1eBJfZNQab
 o14TF2Ik8XkXzY17/C4iFhx+CsseusNSBMP8UoVn1m3qF+fUWh1TxsAtCuGkSLzSLl9xVHzODn
 CubitHi1g66WngAuSJMqj4bCoPzXX5DglVOgj3L70VOyrhijqD/uU/6vFUQ8hdlCIJzoQbEdr1
 mDk=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2022 21:52:10 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JW8P46gnLz1VSkX
 for <qemu-devel@nongnu.org>; Fri,  7 Jan 2022 21:52:08 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1641621128; x=1644213129; bh=y//U4N/6Ko/Gjvo23T
 bC8u+WvooHOVbxqJpjJvI0QlQ=; b=a3ELAQu7O2Rr73XTWLSJUXXjzQKGuT9Sxq
 dXEvNn/luGlAKBQ3lFzFSpGLaFGD2klEa1aR4lXPzwDm1El5Y58GbAkjfZjzzoq7
 UaqfczhOihCcgOBBWM5ZXbZTok/khxFLSrDvk0MNm8GkPvJWSVcbgerwj8bS1NfP
 Rw8DjWgQ+tW3ZvtkGmj05VZMM3WBJnVVv4c2j7LRnm9Bb+w8OpGKK9UeCIce9unM
 TRf96G9jAHSXTde/RCURflI/2Van577q5ngTgV4IMS3yxRblLUCkbQP7KiXqR2rh
 jgLVnod3ynibFHgppf9d0IXuz4FEJwDFlVH+kNamK2ByEHGq48sg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id B8TQ-frEOH9p for <qemu-devel@nongnu.org>;
 Fri,  7 Jan 2022 21:52:08 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.74])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JW8P13D3Tz1VSkV;
 Fri,  7 Jan 2022 21:52:04 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 15/37] target/riscv: rvv-1.0: Call the correct RVF/RVD check
 function for narrowing fp/int type-convert insns
Date: Sat,  8 Jan 2022 15:50:26 +1000
Message-Id: <20220108055048.3512645-16-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220108055048.3512645-1-alistair.francis@opensource.wdc.com>
References: <20220108055048.3512645-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=000118587=alistair.francis@opensource.wdc.com;
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

vfncvt.f.xu.w, vfncvt.f.x.w convert double-width integer to single-width
floating-point. Therefore, should use require_rvf() to check whether
RVF/RVD is enabled.

vfncvt.f.f.w, vfncvt.rod.f.f.w convert double-width floating-point to
single-width integer. Therefore, should use require_scale_rvf() to check
whether RVF/RVD is enabled.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220105022247.21131-4-frank.chang@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 32 ++++++++++++++++++-------
 1 file changed, 24 insertions(+), 8 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_=
trans/trans_rvv.c.inc
index f1b44ccad2..6c285c958b 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2719,17 +2719,29 @@ GEN_OPFXV_WIDEN_TRANS(vfwcvt_f_x_v)
 static bool opfv_narrow_check(DisasContext *s, arg_rmr *a)
 {
     return require_rvv(s) &&
-           require_rvf(s) &&
-           (s->sew !=3D MO_64) &&
            vext_check_isa_ill(s) &&
            /* OPFV narrowing instructions ignore vs1 check */
            vext_check_sd(s, a->rd, a->rs2, a->vm);
 }
=20
-#define GEN_OPFV_NARROW_TRANS(NAME, HELPER, FRM)                   \
+static bool opfxv_narrow_check(DisasContext *s, arg_rmr *a)
+{
+    return opfv_narrow_check(s, a) &&
+           require_rvf(s) &&
+           (s->sew !=3D MO_64);
+}
+
+static bool opffv_narrow_check(DisasContext *s, arg_rmr *a)
+{
+    return opfv_narrow_check(s, a) &&
+           require_scale_rvf(s) &&
+           (s->sew !=3D MO_8);
+}
+
+#define GEN_OPFV_NARROW_TRANS(NAME, CHECK, HELPER, FRM)            \
 static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
 {                                                                  \
-    if (opfv_narrow_check(s, a)) {                                 \
+    if (CHECK(s, a)) {                                             \
         if (FRM !=3D RISCV_FRM_DYN) {                                \
             gen_set_rm(s, RISCV_FRM_DYN);                          \
         }                                                          \
@@ -2756,11 +2768,15 @@ static bool trans_##NAME(DisasContext *s, arg_rmr=
 *a)              \
     return false;                                                  \
 }
=20
-GEN_OPFV_NARROW_TRANS(vfncvt_f_xu_w, vfncvt_f_xu_w, RISCV_FRM_DYN)
-GEN_OPFV_NARROW_TRANS(vfncvt_f_x_w, vfncvt_f_x_w, RISCV_FRM_DYN)
-GEN_OPFV_NARROW_TRANS(vfncvt_f_f_w, vfncvt_f_f_w, RISCV_FRM_DYN)
+GEN_OPFV_NARROW_TRANS(vfncvt_f_xu_w, opfxv_narrow_check, vfncvt_f_xu_w,
+                      RISCV_FRM_DYN)
+GEN_OPFV_NARROW_TRANS(vfncvt_f_x_w, opfxv_narrow_check, vfncvt_f_x_w,
+                      RISCV_FRM_DYN)
+GEN_OPFV_NARROW_TRANS(vfncvt_f_f_w, opffv_narrow_check, vfncvt_f_f_w,
+                      RISCV_FRM_DYN)
 /* Reuse the helper function from vfncvt.f.f.w */
-GEN_OPFV_NARROW_TRANS(vfncvt_rod_f_f_w, vfncvt_f_f_w, RISCV_FRM_ROD)
+GEN_OPFV_NARROW_TRANS(vfncvt_rod_f_f_w, opffv_narrow_check, vfncvt_f_f_w=
,
+                      RISCV_FRM_ROD)
=20
 static bool opxfv_narrow_check(DisasContext *s, arg_rmr *a)
 {
--=20
2.31.1


