Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1725247A4BD
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 06:56:34 +0100 (CET)
Received: from localhost ([::1]:36240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzBez-0005bH-4F
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 00:56:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAng-0004PD-1E
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 00:01:29 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:13394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAnW-0008Lj-Jl
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 00:01:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639976479; x=1671512479;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=97cmQfs/2fcJvAswgAzNN79HMuABD4fRi53Au567gsw=;
 b=Vxy98/pukDwRTlAmPwQ3Xr4po7hnJvG/tU80Q51TykooRtfudbT1lvKc
 h7y8903/JuckqlSWW6uXovw4GkDmbqHS/7GPC4I14RItP5E1A67HK38dw
 /LHMjtjFulzALQJ3Jcu77b+riRH8ILz/41tVbFmguT9kM6DZmmlLDCmAX
 N4O22rC1pxm1DvElLVIlbuGtiZhdxfo/IYNMgKov/f6/1OdrmSW1EKMMf
 1BKx7Rdq5e52qZXIUGFnndEJ+tq2zWIyPorJTwogsHhDdXR6BHB+jJoBH
 1+A9CgtR+e7jNExYR9nwYZiC4492HHDd56h8jr+FOGPUUj6mYxeUjtxV/ w==;
X-IronPort-AV: E=Sophos;i="5.88,219,1635177600"; d="scan'208";a="189680155"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2021 13:00:46 +0800
IronPort-SDR: bKiohe8b9zlDqkr1a6Yalj1LtAogBY64XpfmDRIAikKfppDm9jM+N0YKxyUAvGgzA0w2vEloY0
 Pr8lce9H56GHHF/GsVFeG9Obo0eEsYCq4TwXIILm1h6zul8yziLVVRYjtc3bHrveqPLqiMZc47
 7NwS0FBq5E7kspbk/C9rMzWUFbaJ+d9XMcpT8ZE5ZMtaeY9Ql64+qY7ApAo9nKPpQZ7q+9jqHF
 lNPTR5LmD6Zyl6Cblm+s47Ksh3hY9nbdIWtoIu9pykXijk00CFdJ2uW4k53Qf1vb5pNya5OcIk
 czwqKfK/1VUZu+dUYE/3CAUm
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:33:35 -0800
IronPort-SDR: c0SMpP9Y+3c2D47cz81V1wbCQXj2W8hazvEEysz8gGJNCpGVZCE4kCc7blWDkSgqdVPHAmBi/p
 c5Vn8lH3M0WqObtsq+sMTVgz7kgFThjGtd92d9ir2jQiYxFgFrkg2kuhFz++ZBd+EKWWtkTd1M
 utYDVwFvEoWutxAD+8CE2eEbq1Z0TFP0mS5iziXpk0gNyWkDiPvlN85NZ/gy1Yt94KjDAr65Om
 BkfmdR7IYBpIlS6eqapDOMWBbaax00M1jntSkJU89FYhNdT3rpNL9GBdor61u6C4iZ9BG7tEFM
 CBE=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 21:00:45 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JHS8Y2lT7z1Rvlf
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 21:00:45 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1639976444; x=1642568445; bh=97cmQfs/2fcJvAswgA
 zNN79HMuABD4fRi53Au567gsw=; b=IZV1J8xB5wyUr4FQj5boV2QS1/WGDEBLpv
 LbxFk769hK8FQihMyujmwl0/C1wGDEHwLz2no4I2FeUL+WRdPQauN2VN3IW/CWQD
 hCxe1CvwGdd0MLFaQU5NtCzcUL5MCjnXgVyqfTwClvL4rdm+50YEKOegSaU36v+3
 Co4bIoZTISTdLkZ+bfqM5Em0ft48NP9pgCI4k65vDN7CFgDM1F7OrSGJ6FfyG9P6
 WYtwq16UHAPEm23BjUvMkZAnbKNw3VPA841e43COof61i0CyMI64YHvPD2/5gSOT
 ZHNJA0YeCWJId/3BzhlH4sVEBKdNM4s/VFwM54pALELCxpeAzSvg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id YHmNMsDDaJZ5 for <qemu-devel@nongnu.org>;
 Sun, 19 Dec 2021 21:00:44 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.68])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JHS8V19N5z1RtVG;
 Sun, 19 Dec 2021 21:00:41 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 51/88] target/riscv: rvv-1.0: integer
 add-with-carry/subtract-with-borrow
Date: Mon, 20 Dec 2021 14:56:28 +1000
Message-Id: <20211220045705.62174-52-alistair.francis@opensource.wdc.com>
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

* Only do carry-in or borrow-in if is masked (vm=3D0).
* Remove clear function from helper functions as the tail elements
  are unchanged in RVV 1.0.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20211210075704.23951-44-frank.chang@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn32.decode              | 20 ++++++++++----------
 target/riscv/vector_helper.c            | 21 ++++++---------------
 target/riscv/insn_trans/trans_rvv.c.inc |  2 +-
 3 files changed, 17 insertions(+), 26 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index f83c8daf24..9c4089d7a7 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -378,16 +378,16 @@ vwsubu_wv       110110 . ..... ..... 010 ..... 1010=
111 @r_vm
 vwsubu_wx       110110 . ..... ..... 110 ..... 1010111 @r_vm
 vwsub_wv        110111 . ..... ..... 010 ..... 1010111 @r_vm
 vwsub_wx        110111 . ..... ..... 110 ..... 1010111 @r_vm
-vadc_vvm        010000 1 ..... ..... 000 ..... 1010111 @r_vm_1
-vadc_vxm        010000 1 ..... ..... 100 ..... 1010111 @r_vm_1
-vadc_vim        010000 1 ..... ..... 011 ..... 1010111 @r_vm_1
-vmadc_vvm       010001 1 ..... ..... 000 ..... 1010111 @r_vm_1
-vmadc_vxm       010001 1 ..... ..... 100 ..... 1010111 @r_vm_1
-vmadc_vim       010001 1 ..... ..... 011 ..... 1010111 @r_vm_1
-vsbc_vvm        010010 1 ..... ..... 000 ..... 1010111 @r_vm_1
-vsbc_vxm        010010 1 ..... ..... 100 ..... 1010111 @r_vm_1
-vmsbc_vvm       010011 1 ..... ..... 000 ..... 1010111 @r_vm_1
-vmsbc_vxm       010011 1 ..... ..... 100 ..... 1010111 @r_vm_1
+vadc_vvm        010000 0 ..... ..... 000 ..... 1010111 @r_vm_1
+vadc_vxm        010000 0 ..... ..... 100 ..... 1010111 @r_vm_1
+vadc_vim        010000 0 ..... ..... 011 ..... 1010111 @r_vm_1
+vmadc_vvm       010001 . ..... ..... 000 ..... 1010111 @r_vm
+vmadc_vxm       010001 . ..... ..... 100 ..... 1010111 @r_vm
+vmadc_vim       010001 . ..... ..... 011 ..... 1010111 @r_vm
+vsbc_vvm        010010 0 ..... ..... 000 ..... 1010111 @r_vm_1
+vsbc_vxm        010010 0 ..... ..... 100 ..... 1010111 @r_vm_1
+vmsbc_vvm       010011 . ..... ..... 000 ..... 1010111 @r_vm
+vmsbc_vxm       010011 . ..... ..... 100 ..... 1010111 @r_vm
 vand_vv         001001 . ..... ..... 000 ..... 1010111 @r_vm
 vand_vx         001001 . ..... ..... 100 ..... 1010111 @r_vm
 vand_vi         001001 . ..... ..... 011 ..... 1010111 @r_vm
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 6891f28116..54405d898b 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -944,7 +944,7 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void=
 *vs2,   \
     for (i =3D 0; i < vl; i++) {                                \
         ETYPE s1 =3D *((ETYPE *)vs1 + H(i));                    \
         ETYPE s2 =3D *((ETYPE *)vs2 + H(i));                    \
-        uint8_t carry =3D vext_elem_mask(v0, i);                \
+        ETYPE carry =3D vext_elem_mask(v0, i);                  \
                                                               \
         *((ETYPE *)vd + H(i)) =3D DO_OP(s2, s1, carry);         \
     }                                                         \
@@ -969,7 +969,7 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1=
, void *vs2,        \
                                                                         =
 \
     for (i =3D 0; i < vl; i++) {                                        =
   \
         ETYPE s2 =3D *((ETYPE *)vs2 + H(i));                            =
   \
-        uint8_t carry =3D vext_elem_mask(v0, i);                        =
   \
+        ETYPE carry =3D vext_elem_mask(v0, i);                          =
   \
                                                                         =
 \
         *((ETYPE *)vd + H(i)) =3D DO_OP(s2, (ETYPE)(target_long)s1, carr=
y);\
     }                                                                   =
 \
@@ -994,20 +994,15 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, vo=
id *vs2,   \
                   CPURISCVState *env, uint32_t desc)          \
 {                                                             \
     uint32_t vl =3D env->vl;                                    \
-    uint32_t vlmax =3D vext_max_elems(desc,                     \
-                                    ctzl(sizeof(ETYPE)));     \
+    uint32_t vm =3D vext_vm(desc);                              \
     uint32_t i;                                               \
                                                               \
     for (i =3D 0; i < vl; i++) {                                \
         ETYPE s1 =3D *((ETYPE *)vs1 + H(i));                    \
         ETYPE s2 =3D *((ETYPE *)vs2 + H(i));                    \
-        uint8_t carry =3D vext_elem_mask(v0, i);                \
-                                                              \
+        ETYPE carry =3D !vm && vext_elem_mask(v0, i);           \
         vext_set_elem_mask(vd, i, DO_OP(s2, s1, carry));      \
     }                                                         \
-    for (; i < vlmax; i++) {                                  \
-        vext_set_elem_mask(vd, i, 0);                         \
-    }                                                         \
 }
=20
 GEN_VEXT_VMADC_VVM(vmadc_vvm_b, uint8_t,  H1, DO_MADC)
@@ -1025,19 +1020,15 @@ void HELPER(NAME)(void *vd, void *v0, target_ulon=
g s1,          \
                   void *vs2, CPURISCVState *env, uint32_t desc) \
 {                                                               \
     uint32_t vl =3D env->vl;                                      \
-    uint32_t vlmax =3D vext_max_elems(desc, ctzl(sizeof(ETYPE))); \
+    uint32_t vm =3D vext_vm(desc);                                \
     uint32_t i;                                                 \
                                                                 \
     for (i =3D 0; i < vl; i++) {                                  \
         ETYPE s2 =3D *((ETYPE *)vs2 + H(i));                      \
-        uint8_t carry =3D vext_elem_mask(v0, i);                  \
-                                                                \
+        ETYPE carry =3D !vm && vext_elem_mask(v0, i);             \
         vext_set_elem_mask(vd, i,                               \
                 DO_OP(s2, (ETYPE)(target_long)s1, carry));      \
     }                                                           \
-    for (; i < vlmax; i++) {                                    \
-        vext_set_elem_mask(vd, i, 0);                           \
-    }                                                           \
 }
=20
 GEN_VEXT_VMADC_VXM(vmadc_vxm_b, uint8_t,  H1, DO_MADC)
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_=
trans/trans_rvv.c.inc
index 4894212913..357615a11c 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -1547,7 +1547,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr =
*a)             \
=20
 /*
  * For vadc and vsbc, an illegal instruction exception is raised if the
- * destination vector register is v0 and LMUL > 1. (Section 12.3)
+ * destination vector register is v0 and LMUL > 1. (Section 12.4)
  */
 static bool opivv_vadc_check(DisasContext *s, arg_rmrr *a)
 {
--=20
2.31.1


