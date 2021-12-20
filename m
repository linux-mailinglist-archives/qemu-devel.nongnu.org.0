Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4389947A533
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 07:56:42 +0100 (CET)
Received: from localhost ([::1]:44876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzCbA-0003Ah-51
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 01:56:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAob-0004bk-Om
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 00:02:25 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:13394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAoJ-0008Lj-G0
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 00:02:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639976528; x=1671512528;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=v2+jeCFAW716j7tYGXgTTWubyvXUKlQ09yIt57o/4eo=;
 b=is4RfB8CfnSMxKs2OQj/QXDbl7bjcwgQt2SIgqh9gwT+xoGArsmVQWCI
 PCAbbs+B1SH3M1l68a1U/A/v7jPwdWWWWCbl1dCbbTV2F27PBuUItzFAt
 JsHqgYoHHIy+1KzJsaZPxUbqQXtgbO+IGtmOy4/J4syrjJnt878tH5KQq
 JkoBoEGbsCHd7V7E5ciRMIZLgBJaGjslGRw/Ai559ljEZK/VhISUKhEmH
 glyhkX5sFqM8p93Z2ESYoh0HHinSKiGJDFhfVKaR29KwInjN24Aa1nTRX
 1y7xlcHUPzyEPDr935/OOtYZItnRXvbjZNwdKQEpjN1Fe2bzhqOwA4rZD g==;
X-IronPort-AV: E=Sophos;i="5.88,219,1635177600"; d="scan'208";a="189680200"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2021 13:01:17 +0800
IronPort-SDR: hC9R64noNGpdL/ch8N9T6GeS9czfxooRHi/rWgAFueRx78aDq2h0klkLXQ4CoOlnKzy5VxJNl+
 7lqTYmaI0kpAAhhY6/01QeXs3yvBxD7l0es+XWSp8hS9JpaIepZ7cZyoGA/YVy32MirTfyXRxh
 0ZTiCpV+UbJJsleY+yBa3sGUFXp4kZGPFhGY6uAfmRre4pOsuTiG1FCEgQ8BmmzEzdThJEYXT8
 xCGnpB5VSfYp02zWIy2/yBpAVnLd0JG2742KCqb4pwQdX2DUZAd09k+7a1vbc9YFTf3cs1EyZk
 /HwiWoix+o9uWIvlAMV3aZyM
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:34:06 -0800
IronPort-SDR: FQUIB+V2xU2hqGWiVFzmwzL7E8IO7A1/BBMQQO3abLMh6m+L7MAUUNwBx18X5/RQGS5N9Iz4Bw
 zglOgwgpIFzTA56cxbjdjn8b9czC9ZKEtQBC7GZfFjublvt9v5QhLdTmrZ2NFFSHLIg/yaZ6XR
 O120HJGz79J0JLEW7W7tgeYDppDzUcm3+0hiAwRDKAV2mQyvP51PKWKrCkULF8KKNW5TJswaP0
 Xlv1aJZhYL4bIOBixAyKTourtsVNmPNLHkeVZ2WdAxbI6LSadUMqZcJAqcHWafwJriMXYrEf5L
 hjE=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 21:01:16 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JHS983MCzz1RwFN
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 21:01:16 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1639976475; x=1642568476; bh=v2+jeCFAW716j7tYGX
 gTTWubyvXUKlQ09yIt57o/4eo=; b=X9R3371mwAqh3/1AIi/5TkQb1PCoK/SVHY
 Jy3cbAogFQXm+XP2PmZ0WpIMsSm0eSc5fuGsKzWGHJWc/JgAhc2RUTXUmT42mQ4L
 MgYLycTmH4B+e60utR1sOqwodoP6tGW3crSQwhOSBu6aJ1n6SnMZSRLTFYmcw+Of
 Vg387iRcDdI8BfJsm6o9q6uWFOpAE8g8etCB32E11CHxfjySocPw4wUl5WGn1SDj
 rH2O/bFQcexH/ZAzckck4Xa8gXl++VEm86M4dqRCux04kYLEyKhyvJwQElF1v1yO
 sc+0BFfh3uWWpm5s+sumWSpagcOpdF5mwvYq8OtEO08idZFEM0ag==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id a0RWxW6g1jpx for <qemu-devel@nongnu.org>;
 Sun, 19 Dec 2021 21:01:15 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.68])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JHS950RZmz1RtVG;
 Sun, 19 Dec 2021 21:01:12 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 59/88] target/riscv: rvv-1.0: floating-point slide instructions
Date: Mon, 20 Dec 2021 14:56:36 +1000
Message-Id: <20211220045705.62174-60-alistair.francis@opensource.wdc.com>
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

Add the following instructions:

* vfslide1up.vf
* vfslide1down.vf

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20211210075704.23951-52-frank.chang@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/helper.h                   |   7 ++
 target/riscv/insn32.decode              |   2 +
 target/riscv/vector_helper.c            | 141 ++++++++++++++++--------
 target/riscv/insn_trans/trans_rvv.c.inc |  16 +++
 4 files changed, 121 insertions(+), 45 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 304c12494d..012d034377 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1071,6 +1071,13 @@ DEF_HELPER_6(vslide1down_vx_h, void, ptr, ptr, tl,=
 ptr, env, i32)
 DEF_HELPER_6(vslide1down_vx_w, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vslide1down_vx_d, void, ptr, ptr, tl, ptr, env, i32)
=20
+DEF_HELPER_6(vfslide1up_vf_h, void, ptr, ptr, i64, ptr, env, i32)
+DEF_HELPER_6(vfslide1up_vf_w, void, ptr, ptr, i64, ptr, env, i32)
+DEF_HELPER_6(vfslide1up_vf_d, void, ptr, ptr, i64, ptr, env, i32)
+DEF_HELPER_6(vfslide1down_vf_h, void, ptr, ptr, i64, ptr, env, i32)
+DEF_HELPER_6(vfslide1down_vf_w, void, ptr, ptr, i64, ptr, env, i32)
+DEF_HELPER_6(vfslide1down_vf_d, void, ptr, ptr, i64, ptr, env, i32)
+
 DEF_HELPER_6(vrgather_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vrgather_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vrgather_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 7548b71efd..c5cc14c45c 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -577,6 +577,8 @@ vfsgnjn_vv      001001 . ..... ..... 001 ..... 101011=
1 @r_vm
 vfsgnjn_vf      001001 . ..... ..... 101 ..... 1010111 @r_vm
 vfsgnjx_vv      001010 . ..... ..... 001 ..... 1010111 @r_vm
 vfsgnjx_vf      001010 . ..... ..... 101 ..... 1010111 @r_vm
+vfslide1up_vf   001110 . ..... ..... 101 ..... 1010111 @r_vm
+vfslide1down_vf 001111 . ..... ..... 101 ..... 1010111 @r_vm
 vmfeq_vv        011000 . ..... ..... 001 ..... 1010111 @r_vm
 vmfeq_vf        011000 . ..... ..... 101 ..... 1010111 @r_vm
 vmfne_vv        011100 . ..... ..... 001 ..... 1010111 @r_vm
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index d79f59e443..7fa5189af4 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4455,57 +4455,108 @@ GEN_VEXT_VSLIDEDOWN_VX(vslidedown_vx_h, uint16_t=
, H2)
 GEN_VEXT_VSLIDEDOWN_VX(vslidedown_vx_w, uint32_t, H4)
 GEN_VEXT_VSLIDEDOWN_VX(vslidedown_vx_d, uint64_t, H8)
=20
-#define GEN_VEXT_VSLIDE1UP_VX(NAME, ETYPE, H)                           =
  \
-void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,       =
  \
-                  CPURISCVState *env, uint32_t desc)                    =
  \
-{                                                                       =
  \
-    uint32_t vm =3D vext_vm(desc);                                      =
    \
-    uint32_t vl =3D env->vl;                                            =
    \
-    uint32_t i;                                                         =
  \
-                                                                        =
  \
-    for (i =3D 0; i < vl; i++) {                                        =
    \
-        if (!vm && !vext_elem_mask(v0, i)) {                            =
  \
-            continue;                                                   =
  \
-        }                                                               =
  \
-        if (i =3D=3D 0) {                                               =
      \
-            *((ETYPE *)vd + H(i)) =3D s1;                               =
    \
-        } else {                                                        =
  \
-            *((ETYPE *)vd + H(i)) =3D *((ETYPE *)vs2 + H(i - 1));       =
    \
-        }                                                               =
  \
-    }                                                                   =
  \
+#define GEN_VEXT_VSLIE1UP(ESZ, H)                                       =
    \
+static void vslide1up_##ESZ(void *vd, void *v0, target_ulong s1, void *v=
s2, \
+                     CPURISCVState *env, uint32_t desc)                 =
    \
+{                                                                       =
    \
+    typedef uint##ESZ##_t ETYPE;                                        =
    \
+    uint32_t vm =3D vext_vm(desc);                                      =
      \
+    uint32_t vl =3D env->vl;                                            =
      \
+    uint32_t i;                                                         =
    \
+                                                                        =
    \
+    for (i =3D 0; i < vl; i++) {                                        =
      \
+        if (!vm && !vext_elem_mask(v0, i)) {                            =
    \
+            continue;                                                   =
    \
+        }                                                               =
    \
+        if (i =3D=3D 0) {                                               =
        \
+            *((ETYPE *)vd + H(i)) =3D s1;                               =
      \
+        } else {                                                        =
    \
+            *((ETYPE *)vd + H(i)) =3D *((ETYPE *)vs2 + H(i - 1));       =
      \
+        }                                                               =
    \
+    }                                                                   =
    \
+}
+
+GEN_VEXT_VSLIE1UP(8,  H1)
+GEN_VEXT_VSLIE1UP(16, H2)
+GEN_VEXT_VSLIE1UP(32, H4)
+GEN_VEXT_VSLIE1UP(64, H8)
+
+#define GEN_VEXT_VSLIDE1UP_VX(NAME, ESZ)                          \
+void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2, \
+                  CPURISCVState *env, uint32_t desc)              \
+{                                                                 \
+    vslide1up_##ESZ(vd, v0, s1, vs2, env, desc);                  \
 }
=20
 /* vslide1up.vx vd, vs2, rs1, vm # vd[0]=3Dx[rs1], vd[i+1] =3D vs2[i] */
-GEN_VEXT_VSLIDE1UP_VX(vslide1up_vx_b, uint8_t,  H1)
-GEN_VEXT_VSLIDE1UP_VX(vslide1up_vx_h, uint16_t, H2)
-GEN_VEXT_VSLIDE1UP_VX(vslide1up_vx_w, uint32_t, H4)
-GEN_VEXT_VSLIDE1UP_VX(vslide1up_vx_d, uint64_t, H8)
-
-#define GEN_VEXT_VSLIDE1DOWN_VX(NAME, ETYPE, H)                         =
  \
-void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,       =
  \
-                  CPURISCVState *env, uint32_t desc)                    =
  \
-{                                                                       =
  \
-    uint32_t vm =3D vext_vm(desc);                                      =
    \
-    uint32_t vl =3D env->vl;                                            =
    \
-    uint32_t i;                                                         =
  \
-                                                                        =
  \
-    for (i =3D 0; i < vl; i++) {                                        =
    \
-        if (!vm && !vext_elem_mask(v0, i)) {                            =
  \
-            continue;                                                   =
  \
-        }                                                               =
  \
-        if (i =3D=3D vl - 1) {                                          =
      \
-            *((ETYPE *)vd + H(i)) =3D s1;                               =
    \
-        } else {                                                        =
  \
-            *((ETYPE *)vd + H(i)) =3D *((ETYPE *)vs2 + H(i + 1));       =
    \
-        }                                                               =
  \
-    }                                                                   =
  \
+GEN_VEXT_VSLIDE1UP_VX(vslide1up_vx_b, 8)
+GEN_VEXT_VSLIDE1UP_VX(vslide1up_vx_h, 16)
+GEN_VEXT_VSLIDE1UP_VX(vslide1up_vx_w, 32)
+GEN_VEXT_VSLIDE1UP_VX(vslide1up_vx_d, 64)
+
+#define GEN_VEXT_VSLIDE1DOWN(ESZ, H)                                    =
      \
+static void vslide1down_##ESZ(void *vd, void *v0, target_ulong s1, void =
*vs2, \
+                       CPURISCVState *env, uint32_t desc)               =
      \
+{                                                                       =
      \
+    typedef uint##ESZ##_t ETYPE;                                        =
      \
+    uint32_t vm =3D vext_vm(desc);                                      =
        \
+    uint32_t vl =3D env->vl;                                            =
        \
+    uint32_t i;                                                         =
      \
+                                                                        =
      \
+    for (i =3D 0; i < vl; i++) {                                        =
        \
+        if (!vm && !vext_elem_mask(v0, i)) {                            =
      \
+            continue;                                                   =
      \
+        }                                                               =
      \
+        if (i =3D=3D vl - 1) {                                          =
          \
+            *((ETYPE *)vd + H(i)) =3D s1;                               =
        \
+        } else {                                                        =
      \
+            *((ETYPE *)vd + H(i)) =3D *((ETYPE *)vs2 + H(i + 1));       =
        \
+        }                                                               =
      \
+    }                                                                   =
      \
+}
+
+GEN_VEXT_VSLIDE1DOWN(8,  H1)
+GEN_VEXT_VSLIDE1DOWN(16, H2)
+GEN_VEXT_VSLIDE1DOWN(32, H4)
+GEN_VEXT_VSLIDE1DOWN(64, H8)
+
+#define GEN_VEXT_VSLIDE1DOWN_VX(NAME, ESZ)                        \
+void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2, \
+                  CPURISCVState *env, uint32_t desc)              \
+{                                                                 \
+    vslide1down_##ESZ(vd, v0, s1, vs2, env, desc);                \
 }
=20
 /* vslide1down.vx vd, vs2, rs1, vm # vd[i] =3D vs2[i+1], vd[vl-1]=3Dx[rs=
1] */
-GEN_VEXT_VSLIDE1DOWN_VX(vslide1down_vx_b, uint8_t,  H1)
-GEN_VEXT_VSLIDE1DOWN_VX(vslide1down_vx_h, uint16_t, H2)
-GEN_VEXT_VSLIDE1DOWN_VX(vslide1down_vx_w, uint32_t, H4)
-GEN_VEXT_VSLIDE1DOWN_VX(vslide1down_vx_d, uint64_t, H8)
+GEN_VEXT_VSLIDE1DOWN_VX(vslide1down_vx_b, 8)
+GEN_VEXT_VSLIDE1DOWN_VX(vslide1down_vx_h, 16)
+GEN_VEXT_VSLIDE1DOWN_VX(vslide1down_vx_w, 32)
+GEN_VEXT_VSLIDE1DOWN_VX(vslide1down_vx_d, 64)
+
+/* Vector Floating-Point Slide Instructions */
+#define GEN_VEXT_VFSLIDE1UP_VF(NAME, ESZ)                     \
+void HELPER(NAME)(void *vd, void *v0, uint64_t s1, void *vs2, \
+                  CPURISCVState *env, uint32_t desc)          \
+{                                                             \
+    vslide1up_##ESZ(vd, v0, s1, vs2, env, desc);              \
+}
+
+/* vfslide1up.vf vd, vs2, rs1, vm # vd[0]=3Df[rs1], vd[i+1] =3D vs2[i] *=
/
+GEN_VEXT_VFSLIDE1UP_VF(vfslide1up_vf_h, 16)
+GEN_VEXT_VFSLIDE1UP_VF(vfslide1up_vf_w, 32)
+GEN_VEXT_VFSLIDE1UP_VF(vfslide1up_vf_d, 64)
+
+#define GEN_VEXT_VFSLIDE1DOWN_VF(NAME, ESZ)                   \
+void HELPER(NAME)(void *vd, void *v0, uint64_t s1, void *vs2, \
+                  CPURISCVState *env, uint32_t desc)          \
+{                                                             \
+    vslide1down_##ESZ(vd, v0, s1, vs2, env, desc);            \
+}
+
+/* vfslide1down.vf vd, vs2, rs1, vm # vd[i] =3D vs2[i+1], vd[vl-1]=3Df[r=
s1] */
+GEN_VEXT_VFSLIDE1DOWN_VF(vfslide1down_vf_h, 16)
+GEN_VEXT_VFSLIDE1DOWN_VF(vfslide1down_vf_w, 32)
+GEN_VEXT_VFSLIDE1DOWN_VF(vfslide1down_vf_d, 64)
=20
 /* Vector Register Gather Instruction */
 #define GEN_VEXT_VRGATHER_VV(NAME, TS1, TS2, HS1, HS2)                  =
  \
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_=
trans/trans_rvv.c.inc
index 5c0c3d2547..597a367444 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -3121,6 +3121,22 @@ GEN_OPIVX_TRANS(vslidedown_vx, slidedown_check)
 GEN_OPIVX_TRANS(vslide1down_vx, slidedown_check)
 GEN_OPIVI_TRANS(vslidedown_vi, IMM_ZX, vslidedown_vx, slidedown_check)
=20
+/* Vector Floating-Point Slide Instructions */
+static bool fslideup_check(DisasContext *s, arg_rmrr *a)
+{
+    return slideup_check(s, a) &&
+           require_rvf(s);
+}
+
+static bool fslidedown_check(DisasContext *s, arg_rmrr *a)
+{
+    return slidedown_check(s, a) &&
+           require_rvf(s);
+}
+
+GEN_OPFVF_TRANS(vfslide1up_vf, fslideup_check)
+GEN_OPFVF_TRANS(vfslide1down_vf, fslidedown_check)
+
 /* Vector Register Gather Instruction */
 static bool vrgather_vv_check(DisasContext *s, arg_rmrr *a)
 {
--=20
2.31.1


