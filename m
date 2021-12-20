Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6B847A53F
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 08:00:39 +0100 (CET)
Received: from localhost ([::1]:53936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzCf0-00019M-HV
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 02:00:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAp3-0004eh-5A
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 00:03:20 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:51767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAoy-0000Ga-7v
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 00:02:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639976568; x=1671512568;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yPcUy72ZBr8FIdTehqjz37h3GQhhf3ed2cXTH5LOR8I=;
 b=UW4zpXOn/nMzVWctSNoT5PTTn7RSRmF0Vu8tE5KUqOoz7Is0DK+4BtlW
 UrV/lSZLGMNc2Ud0TpbZsU5h39E1CVyI0UbBtTl83/5xMrm44VsXKop+L
 b+TrY75ohhpGDx2IA+X1KJIY8ylKLfo6T154Y3kigr6uhZnuxXldAPUGf
 0VNBan4dltvnVmTEsOHScO7+KsbHUViTM7+ijiXf4QHk/jXPvEzT4CUq4
 xVn8w8Xvesfue16TESmpnZKd79/menO+Yj5JfreKuBOy1dLOUUFTu5c1N
 7d2Ee0qfkDBQqK/ZLFNAv0quUuxfxmM8VhBctjd4ittdos1YzNgtHDX7J Q==;
X-IronPort-AV: E=Sophos;i="5.88,219,1635177600"; d="scan'208";a="292662344"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2021 13:02:40 +0800
IronPort-SDR: nualIkc9e+485X5G5hi6yodIPASnoVrnVC248qMgbIdvLlqb/n1GGO3q80r1vGAJiLfQtIEZuF
 PqhjHxLabNKZBcJN/xyvSu+9sDwJm16AxSj9SICkz3el5A0OEVRWM/8ltuTcU5RModFDLt0+n7
 QFOuTfyKEbZsmp47svQFkznn8L+RRWBirWfyUP6AlBftn9Dd+tXjOLk3csbff/ptEVBBd6wbNP
 nrBXy+R98xoZUUCTxYiQRAwtQg+y33HKrobwMhaccWwW1ru3J3s8M+nMVEqC1sH1JfmBAcwBw0
 LEQf5+lRZZY7w4TMA1pRu0F9
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:35:30 -0800
IronPort-SDR: rgEDySE51yh/SZPzjfN1PE7ZGil3pwn2u6b3Z218ZlpyQxvgC3iEpuycqe6TAkZDU6epihsawV
 /LbKsuhwvV5Qpg8dd4NhiUb4db6y67kpGLyyWD3udY+V+q2vlcZ9kOB81hXnyg6mXtP28JzYGt
 wlV9x1f6UCdVM6PBuPHgad2zgZamDJn/+jXELxMUFIZPY3D1fXQgvlQrw4GJR+vvo+gL+Kwa6T
 TX8LjVHqCJj8z7kp+sbFLpTF8h5iAKC+kdQumRhpg044yBka8Q5PesuHTncmtjWG5WnGCEqqs/
 HNw=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 21:02:40 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JHSBm5kxfz1RvTh
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 21:02:40 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1639976560; x=1642568561; bh=yPcUy72ZBr8FIdTehq
 jz37h3GQhhf3ed2cXTH5LOR8I=; b=ALzgdmThsmqxzuy+hEwfLDs+nfbpAyQQQG
 mNnKYq3ka4iYmKRcGXwhZxYY2P6RFj+9gTQ8KvOi//gCQbN8O3QGnmSaaIlbzYXy
 Sx0hn4XMl9ARiKwQigeMksadd6FFO9dOaIeG7Ibymx572/UIphQa720T69AhAehf
 IAumA/UWOSJV9lSVMPv8HvipXwjBmAaOYc0W8SLQBgPTh4dvGPx3dgsP2nUDUhGh
 rJDJA0Mnx2Gbqs3p+IjDKyoAi3O7fdGIg+8uKsxoda8bOZeS2CALvB1IqW8wjnGL
 obEHElagza+JCdoasIv+iQjRewh13hcQrp42pLAdmhJyUVV67TEQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id lO88mbWHrmLq for <qemu-devel@nongnu.org>;
 Sun, 19 Dec 2021 21:02:40 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.68])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JHSBj0sR5z1RtVG;
 Sun, 19 Dec 2021 21:02:36 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 81/88] target/riscv: rvv-1.0: add evl parameter to
 vext_ldst_us()
Date: Mon, 20 Dec 2021 14:56:58 +1000
Message-Id: <20211220045705.62174-82-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211220045705.62174-1-alistair.francis@opensource.wdc.com>
References: <20211220045705.62174-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=9816edf2f=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
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

Add supports of Vector unit-stride mask load/store instructions
(vlm.v, vsm.v), which has:
    evl (effective vector length) =3D ceil(env->vl / 8).

The new instructions operate the same as unmasked byte loads and stores.
Add evl parameter to reuse vext_ldst_us().

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20211210075704.23951-74-frank.chang@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/vector_helper.c | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 946dca53ff..83373ca6fc 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -279,15 +279,15 @@ GEN_VEXT_ST_STRIDE(vsse64_v, int64_t, ste_d)
 /* unmasked unit-stride load and store operation*/
 static void
 vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env, uint32_t d=
esc,
-             vext_ldst_elem_fn *ldst_elem,
-             uint32_t esz, uintptr_t ra, MMUAccessType access_type)
+             vext_ldst_elem_fn *ldst_elem, uint32_t esz, uint32_t evl,
+             uintptr_t ra, MMUAccessType access_type)
 {
     uint32_t i, k;
     uint32_t nf =3D vext_nf(desc);
     uint32_t max_elems =3D vext_max_elems(desc, esz);
=20
     /* load bytes from guest memory */
-    for (i =3D env->vstart; i < env->vl; i++, env->vstart++) {
+    for (i =3D env->vstart; i < evl; i++, env->vstart++) {
         k =3D 0;
         while (k < nf) {
             target_ulong addr =3D base + ((i * nf + k) << esz);
@@ -316,7 +316,7 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong ba=
se,                \
                   CPURISCVState *env, uint32_t desc)                    =
\
 {                                                                       =
\
     vext_ldst_us(vd, base, env, desc, LOAD_FN,                          =
\
-                 ctzl(sizeof(ETYPE)), GETPC(), MMU_DATA_LOAD);          =
\
+                 ctzl(sizeof(ETYPE)), env->vl, GETPC(), MMU_DATA_LOAD); =
\
 }
=20
 GEN_VEXT_LD_US(vle8_v,  int8_t,  lde_b)
@@ -324,20 +324,20 @@ GEN_VEXT_LD_US(vle16_v, int16_t, lde_h)
 GEN_VEXT_LD_US(vle32_v, int32_t, lde_w)
 GEN_VEXT_LD_US(vle64_v, int64_t, lde_d)
=20
-#define GEN_VEXT_ST_US(NAME, ETYPE, STORE_FN)                           =
\
-void HELPER(NAME##_mask)(void *vd, void *v0, target_ulong base,         =
\
-                         CPURISCVState *env, uint32_t desc)             =
\
-{                                                                       =
\
-    uint32_t stride =3D vext_nf(desc) << ctzl(sizeof(ETYPE));           =
  \
-    vext_ldst_stride(vd, v0, base, stride, env, desc, false, STORE_FN,  =
\
-                     ctzl(sizeof(ETYPE)), GETPC(), MMU_DATA_STORE);     =
\
-}                                                                       =
\
-                                                                        =
\
-void HELPER(NAME)(void *vd, void *v0, target_ulong base,                =
\
-                  CPURISCVState *env, uint32_t desc)                    =
\
-{                                                                       =
\
-    vext_ldst_us(vd, base, env, desc, STORE_FN,                         =
\
-                 ctzl(sizeof(ETYPE)), GETPC(), MMU_DATA_STORE);         =
\
+#define GEN_VEXT_ST_US(NAME, ETYPE, STORE_FN)                           =
 \
+void HELPER(NAME##_mask)(void *vd, void *v0, target_ulong base,         =
 \
+                         CPURISCVState *env, uint32_t desc)             =
 \
+{                                                                       =
 \
+    uint32_t stride =3D vext_nf(desc) << ctzl(sizeof(ETYPE));           =
   \
+    vext_ldst_stride(vd, v0, base, stride, env, desc, false, STORE_FN,  =
 \
+                     ctzl(sizeof(ETYPE)), GETPC(), MMU_DATA_STORE);     =
 \
+}                                                                       =
 \
+                                                                        =
 \
+void HELPER(NAME)(void *vd, void *v0, target_ulong base,                =
 \
+                  CPURISCVState *env, uint32_t desc)                    =
 \
+{                                                                       =
 \
+    vext_ldst_us(vd, base, env, desc, STORE_FN,                         =
 \
+                 ctzl(sizeof(ETYPE)), env->vl, GETPC(), MMU_DATA_STORE);=
 \
 }
=20
 GEN_VEXT_ST_US(vse8_v,  int8_t,  ste_b)
--=20
2.31.1


