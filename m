Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 863A7650637
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 03:18:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p75ia-0008Ae-Pr; Sun, 18 Dec 2022 21:17:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=345d64987=alistair.francis@opensource.wdc.com>)
 id 1p75iV-0008A2-Ub
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 21:17:24 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=345d64987=alistair.francis@opensource.wdc.com>)
 id 1p75iS-00013m-FR
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 21:17:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1671416240; x=1702952240;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FRlSMP2b8zsVb4/ZDgFRZe/06W5GBU6yfCP7/T4rVJo=;
 b=GJMlai6IfNW0uUIEdWAqrAkKY5GzDU+4pzdtYg8dCXCEHMYTQQMOeR44
 w5mqv1oiNfTLfPpO2ILTO4j0gUMuthb24piZ37OYDSlEfNxuicxcCr0B4
 AWicHSmsH2bjBCn6tmidaeMU8gzhca0OrMnvp6k6gkiXNNPZCDQRcAQ52
 jIVmHcy0KgbQkO4YKpLbK8Muy+nMwHDK4+K4d+f56yz5ssSyMEQLOfhKT
 XEIk+HW0v86Zrf5b4LPHEGz0Y6gEVV3fVdeQe+kcp5x55xmqk6rzHqUTh
 L+hsg94o1/CFqWciGrbWPkt3NmUccVWUbOcy4OEGqbxF9BlLnrUpClbgT A==;
X-IronPort-AV: E=Sophos;i="5.96,254,1665417600"; d="scan'208";a="217199248"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 19 Dec 2022 10:17:15 +0800
IronPort-SDR: ABwaewP53bgbKD4patGYomEUXiWtnjbpiBc9/spMW728nH5g0BCh8p0oo+wvtd5Bfe9BtmUeu5
 aaiMVDzhFGlb23Xy5Hslw2nLkoFUOg92swFasteOId+wwSpDlCJUbvPDtxummaNcGbqyEhf4eT
 vGc5qsOxUZXosE58k5poZMt4sZaKOQhdUX+xSjbgSCm2ZVwHXPGFkspOHgDf4jDOUKhf0pLhk+
 83d315J6nY9KhN0J02p39hpMHijpfCq0MNf4h1aW7K10t4zE7B1849gbkdzrh3BSfxp8/bl1Fm
 XcM=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Dec 2022 17:29:47 -0800
IronPort-SDR: 6IhbvXvpvMW+HSHorCmcpYPuYv1Bjg5+Jrs38YIVtgBQX+WV5g8bAuXxT+9s+qcrMnkIczLMaB
 IbJMMC0fGrujkkI1Q3FoLFRzLvBUjoFUlL7EdMsRiN7SLLJs1dRADbXeDDTbgI0dGJj3EjxIR6
 UpvvlBiytf9XxIx+m91cw5Z1cDMKdlJW5h3IbaVd3xZKN3QNgJndLIfAp13xxHtWGHxLirnhnL
 lqEseQbQ4PIz4H0u4nyvC3SHFYOIBqQ10p/jvVXfeFWpzGhH4PxzCMnHYL8zrUxjYjGPGqdUEm
 kzA=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Dec 2022 18:17:15 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Nb3Ht48Q5z1RvLy
 for <qemu-devel@nongnu.org>; Sun, 18 Dec 2022 18:17:14 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1671416233; x=1674008234; bh=FRlSMP2b8zsVb4/ZDg
 FRZe/06W5GBU6yfCP7/T4rVJo=; b=qqIkSHR6CzB68bCXJ8gUFmTzGxzwoLP9Np
 Gf0Hr31Xdc9ID+Rk8BTJQE07avHpFRtlLo5L33q34EzYqHvWNsOSk4iw4w4nM35M
 +DNGnkTL4EIpjS77PtRm+CCq1coFfzsfz/1rZ9knQISlovAd9uLrTjkoBD4SplVY
 u3kawAVC70CP+TWhluUShLIoJed4HNQjyyXr1xdNLVBsH4N6MiZjPzNmmqpx6dvC
 jJqbuItpSQgJKEnLy2Jkmwpzd97KP2YV6Ob/V9PMZS/j6HaOacNKmi85NHoe8uI+
 OLxjSRmfFsCFTVVPPYWMF0Um9vNAqtOXB3bKpo+rivHVmufkUAkQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id qRq2WlPgodbt for <qemu-devel@nongnu.org>;
 Sun, 18 Dec 2022 18:17:13 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.4])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Nb3Hq6qs6z1RwqL;
 Sun, 18 Dec 2022 18:17:11 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 01/45] target/riscv: Fix PMP propagation for tlb
Date: Mon, 19 Dec 2022 12:16:19 +1000
Message-Id: <20221219021703.20473-2-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221219021703.20473-1-alistair.francis@opensource.wdc.com>
References: <20221219021703.20473-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=345d64987=alistair.francis@opensource.wdc.com;
 helo=esa4.hgst.iphmx.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Only the pmp index that be checked by pmp_hart_has_privs can be used
by pmp_get_tlb_size to avoid an error pmp index.

Before modification, we may use an error pmp index. For example,
we check address 0x4fc, and the size 0x4 in pmp_hart_has_privs. If there
is an pmp rule, valid range is [0x4fc, 0x500), then pmp_hart_has_privs
will return true;

However, this checked pmp index is discarded as pmp_hart_has_privs
return bool value. In pmp_is_range_in_tlb, it will traverse all pmp
rules. The tlb_sa will be 0x0, and tlb_ea will be 0xfff. If there is
a pmp rule [0x10, 0x14), it will be misused as it is legal in
pmp_get_tlb_size.

As we have already known the correct pmp index, just remove the
remove the pmp_is_range_in_tlb and get tlb size directly from
pmp_get_tlb_size.

Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20221012060016.30856-1-zhiwei_liu@linux.alibaba.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/pmp.h        |  6 +--
 target/riscv/cpu_helper.c | 16 ++++---
 target/riscv/pmp.c        | 90 +++++++++++++--------------------------
 3 files changed, 42 insertions(+), 70 deletions(-)

diff --git a/target/riscv/pmp.h b/target/riscv/pmp.h
index a8dd797476..da32c61c85 100644
--- a/target/riscv/pmp.h
+++ b/target/riscv/pmp.h
@@ -72,11 +72,11 @@ target_ulong mseccfg_csr_read(CPURISCVState *env);
 void pmpaddr_csr_write(CPURISCVState *env, uint32_t addr_index,
     target_ulong val);
 target_ulong pmpaddr_csr_read(CPURISCVState *env, uint32_t addr_index);
-bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
+int pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
     target_ulong size, pmp_priv_t privs, pmp_priv_t *allowed_privs,
     target_ulong mode);
-bool pmp_is_range_in_tlb(CPURISCVState *env, hwaddr tlb_sa,
-                         target_ulong *tlb_size);
+target_ulong pmp_get_tlb_size(CPURISCVState *env, int pmp_index,
+                              target_ulong tlb_sa, target_ulong tlb_ea);
 void pmp_update_rule_addr(CPURISCVState *env, uint32_t pmp_index);
 void pmp_update_rule_nums(CPURISCVState *env);
 uint32_t pmp_get_num_rules(CPURISCVState *env);
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 278d163803..5d66246c2c 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -706,24 +706,26 @@ static int get_physical_address_pmp(CPURISCVState *=
env, int *prot,
                                     int mode)
 {
     pmp_priv_t pmp_priv;
-    target_ulong tlb_size_pmp =3D 0;
+    int pmp_index =3D -1;
=20
     if (!riscv_feature(env, RISCV_FEATURE_PMP)) {
         *prot =3D PAGE_READ | PAGE_WRITE | PAGE_EXEC;
         return TRANSLATE_SUCCESS;
     }
=20
-    if (!pmp_hart_has_privs(env, addr, size, 1 << access_type, &pmp_priv=
,
-                            mode)) {
+    pmp_index =3D pmp_hart_has_privs(env, addr, size, 1 << access_type,
+                                   &pmp_priv, mode);
+    if (pmp_index < 0) {
         *prot =3D 0;
         return TRANSLATE_PMP_FAIL;
     }
=20
     *prot =3D pmp_priv_to_page_prot(pmp_priv);
-    if (tlb_size !=3D NULL) {
-        if (pmp_is_range_in_tlb(env, addr & ~(*tlb_size - 1), &tlb_size_=
pmp)) {
-            *tlb_size =3D tlb_size_pmp;
-        }
+    if ((tlb_size !=3D NULL) && pmp_index !=3D MAX_RISCV_PMPS) {
+        target_ulong tlb_sa =3D addr & ~(TARGET_PAGE_SIZE - 1);
+        target_ulong tlb_ea =3D tlb_sa + TARGET_PAGE_SIZE - 1;
+
+        *tlb_size =3D pmp_get_tlb_size(env, pmp_index, tlb_sa, tlb_ea);
     }
=20
     return TRANSLATE_SUCCESS;
diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index 2b43e399b8..d1126a6066 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -292,8 +292,11 @@ static bool pmp_hart_has_privs_default(CPURISCVState=
 *env, target_ulong addr,
=20
 /*
  * Check if the address has required RWX privs to complete desired opera=
tion
+ * Return PMP rule index if a pmp rule match
+ * Return MAX_RISCV_PMPS if default match
+ * Return negtive value if no match
  */
-bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
+int pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
     target_ulong size, pmp_priv_t privs, pmp_priv_t *allowed_privs,
     target_ulong mode)
 {
@@ -305,8 +308,10 @@ bool pmp_hart_has_privs(CPURISCVState *env, target_u=
long addr,
=20
     /* Short cut if no rules */
     if (0 =3D=3D pmp_get_num_rules(env)) {
-        return pmp_hart_has_privs_default(env, addr, size, privs,
-                                          allowed_privs, mode);
+        if (pmp_hart_has_privs_default(env, addr, size, privs,
+                                       allowed_privs, mode)) {
+            ret =3D MAX_RISCV_PMPS;
+        }
     }
=20
     if (size =3D=3D 0) {
@@ -333,7 +338,7 @@ bool pmp_hart_has_privs(CPURISCVState *env, target_ul=
ong addr,
         if ((s + e) =3D=3D 1) {
             qemu_log_mask(LOG_GUEST_ERROR,
                           "pmp violation - access is partially inside\n"=
);
-            ret =3D 0;
+            ret =3D -1;
             break;
         }
=20
@@ -436,18 +441,22 @@ bool pmp_hart_has_privs(CPURISCVState *env, target_=
ulong addr,
                 }
             }
=20
-            ret =3D ((privs & *allowed_privs) =3D=3D privs);
+            if ((privs & *allowed_privs) =3D=3D privs) {
+                ret =3D i;
+            }
             break;
         }
     }
=20
     /* No rule matched */
     if (ret =3D=3D -1) {
-        return pmp_hart_has_privs_default(env, addr, size, privs,
-                                          allowed_privs, mode);
+        if (pmp_hart_has_privs_default(env, addr, size, privs,
+                                       allowed_privs, mode)) {
+            ret =3D MAX_RISCV_PMPS;
+        }
     }
=20
-    return ret =3D=3D 1 ? true : false;
+    return ret;
 }
=20
 /*
@@ -586,64 +595,25 @@ target_ulong mseccfg_csr_read(CPURISCVState *env)
  * Calculate the TLB size if the start address or the end address of
  * PMP entry is presented in the TLB page.
  */
-static target_ulong pmp_get_tlb_size(CPURISCVState *env, int pmp_index,
-                                     target_ulong tlb_sa, target_ulong t=
lb_ea)
+target_ulong pmp_get_tlb_size(CPURISCVState *env, int pmp_index,
+                              target_ulong tlb_sa, target_ulong tlb_ea)
 {
     target_ulong pmp_sa =3D env->pmp_state.addr[pmp_index].sa;
     target_ulong pmp_ea =3D env->pmp_state.addr[pmp_index].ea;
=20
-    if (pmp_sa >=3D tlb_sa && pmp_ea <=3D tlb_ea) {
-        return pmp_ea - pmp_sa + 1;
-    }
-
-    if (pmp_sa >=3D tlb_sa && pmp_sa <=3D tlb_ea && pmp_ea >=3D tlb_ea) =
{
-        return tlb_ea - pmp_sa + 1;
-    }
-
-    if (pmp_ea <=3D tlb_ea && pmp_ea >=3D tlb_sa && pmp_sa <=3D tlb_sa) =
{
-        return pmp_ea - tlb_sa + 1;
-    }
-
-    return 0;
-}
-
-/*
- * Check is there a PMP entry which range covers this page. If so,
- * try to find the minimum granularity for the TLB size.
- */
-bool pmp_is_range_in_tlb(CPURISCVState *env, hwaddr tlb_sa,
-                         target_ulong *tlb_size)
-{
-    int i;
-    target_ulong val;
-    target_ulong tlb_ea =3D (tlb_sa + TARGET_PAGE_SIZE - 1);
-
-    for (i =3D 0; i < MAX_RISCV_PMPS; i++) {
-        val =3D pmp_get_tlb_size(env, i, tlb_sa, tlb_ea);
-        if (val) {
-            if (*tlb_size =3D=3D 0 || *tlb_size > val) {
-                *tlb_size =3D val;
-            }
-        }
-    }
-
-    if (*tlb_size !=3D 0) {
+    if (pmp_sa <=3D tlb_sa && pmp_ea >=3D tlb_ea) {
+        return TARGET_PAGE_SIZE;
+    } else {
         /*
-         * At this point we have a tlb_size that is the smallest possibl=
e size
-         * That fits within a TARGET_PAGE_SIZE and the PMP region.
-         *
-         * If the size is less then TARGET_PAGE_SIZE we drop the size to=
 1.
-         * This means the result isn't cached in the TLB and is only use=
d for
-         * a single translation.
-         */
-        if (*tlb_size < TARGET_PAGE_SIZE) {
-            *tlb_size =3D 1;
-        }
-
-        return true;
+        * At this point we have a tlb_size that is the smallest possible=
 size
+        * That fits within a TARGET_PAGE_SIZE and the PMP region.
+        *
+        * If the size is less then TARGET_PAGE_SIZE we drop the size to =
1.
+        * This means the result isn't cached in the TLB and is only used=
 for
+        * a single translation.
+        */
+        return 1;
     }
-
-    return false;
 }
=20
 /*
--=20
2.38.1


