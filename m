Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94AB0495C12
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 09:39:23 +0100 (CET)
Received: from localhost ([::1]:58826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nApS6-00071y-Jh
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 03:39:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAn1X-0000Hy-C2
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 01:03:47 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:60359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAn1N-0004KU-B4
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 01:03:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1642745017; x=1674281017;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PAyoT20kHvwRg/KH2k/HEDq4C35SRUt6ucL5LDZr84o=;
 b=BKCSVNfMwSAOVbeMh2WKcdaikHeljMV4gIboWCkSdcTPHJOpKGpuQfg9
 aPZ+WvM6TDPPuJWef3sYUxzEFGsI7P62FVA3e7No1MdQV/1ughRjrq6im
 sKaZ4c1J65kkqFgQM0ty1jbAPaWX4MOLx919CNzd0oqufk047FVlzDy5O
 BoJp0Ed+93PYo8hbe9rQRW2RP4YFeZ0dUakcZtblqfbVJIftVTL2YK+Lt
 fRIsg9atEUqdJC2emBOmqrXPUPv0940Nz2RSL8rp7NY/8AZc/xVauCLOW
 WHg3IDHrG0oN7rZm4zPcTuFPBG+sPnWDSX1s3IvHKjR+XiyeDbBsNKJSR w==;
X-IronPort-AV: E=Sophos;i="5.88,304,1635177600"; d="scan'208";a="295083167"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 21 Jan 2022 14:02:40 +0800
IronPort-SDR: 96TyCgXRXWNKrsjJEUyrv7c5W/TKWTboY4Ny16s2EEDkmv7RGTyrvYwMw83gNoioPlMDFKCADM
 dY9TVOpPvORM0BZp+/oe3cYOjPyzZUOxdqIdafdXGKw8IO68mgybjO7kDIT9a+HgFWNmYANje+
 yXPGF+WC0m7sEC7FvU0BhWTiSdHivkYs7CxeA5MTWGHerlxLif1hFtaeL3pAiI77f/r/wFvIj1
 Ptgh/xV5vN4ZzVSeF3uDz8a4HBcDdws6m2/cQDYhY7/9Jr5q8Z0mP2LZd8c1Zr4NVmAmRDgdfZ
 YqDXUaQmO0wp+wHobEDau0v7
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 21:36:08 -0800
IronPort-SDR: 6bsIFqmNyaZuCd+q0KZ4uzPLNVz3YFkfZBctQ9HnuyGrq/NQ/oD6aXhq4H91JqIBKo9Qo7TV1X
 2Rj8osDrd8TlOU6oslrBy+4NlgKZ4bM0yxBNeBHlpS2FdIxqnIFjmSc4PwPTclCjDaezxTBAg7
 IEttYApSFUV5RjZfqaljlxW4qSRMqXlMiFwzRqHQetwrB0/9dHg7V3ELwuY/6Tbdx8DMhm94pk
 +caW9q0zQ2nm7T/5tM/CfdA/plqKRA87gIA51+/HywgrF0zR7Q7hCbqUUq5u30TRxpxB33f4nX
 QwE=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 22:02:40 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Jg81D4KfGz1SVp7
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 22:02:40 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1642744959; x=1645336960; bh=PAyoT20kHvwRg/KH2k
 /HEDq4C35SRUt6ucL5LDZr84o=; b=OYJEkPrmiq57jfP/rAG39elAMPws/gZZP6
 n30CLVgmgaavGYRXOSrvg0snl1WzEyVtIUzm2+kfod2CKEpZC11dz5Mw/GNBDnhy
 dhN+HJTM1eiadL7Lhi30s+A98nZtCisN2flHp+WlhrVlZ3dsFD4GJqWD8A6GQlSm
 XlZZaDpeiTW6VwbDTpy8V0xzcP28hgg6oxwdeGgIrm4IBSi5ZLVKs7bECp7SxBDh
 81Knw29LFoWdiDrV91BXcCOwUmcMTBBojJdEKn8rxXAspdh3Bh19VjfX5J3Fev2r
 Ud8pseW6OdfHE+Sl9zHbPtFqat9A+KSCtlx23yJJ4VCL4+X/oDzA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id KiT_qmc3Pd3r for <qemu-devel@nongnu.org>;
 Thu, 20 Jan 2022 22:02:39 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.80])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Jg8186PGcz1RvlN;
 Thu, 20 Jan 2022 22:02:36 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 57/61] target/riscv: Adjust vector address with mask
Date: Fri, 21 Jan 2022 15:58:26 +1000
Message-Id: <20220121055830.3164408-58-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220121055830.3164408-1-alistair.francis@opensource.wdc.com>
References: <20220121055830.3164408-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=0135fdaf6=alistair.francis@opensource.wdc.com;
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

From: LIU Zhiwei <zhiwei_liu@c-sky.com>

The mask comes from the pointer masking extension, or the max value
corresponding to XLEN bits.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220120122050.41546-20-zhiwei_liu@c-sky.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/vector_helper.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index efb3129532..020d2e841f 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -139,6 +139,11 @@ static inline uint32_t vext_max_elems(uint32_t desc,=
 uint32_t esz)
     return scale < 0 ? vlenb >> -scale : vlenb << scale;
 }
=20
+static inline target_ulong adjust_addr(CPURISCVState *env, target_ulong =
addr)
+{
+    return (addr & env->cur_pmmask) | env->cur_pmbase;
+}
+
 /*
  * This function checks watchpoint before real load operation.
  *
@@ -156,12 +161,12 @@ static void probe_pages(CPURISCVState *env, target_=
ulong addr,
     target_ulong pagelen =3D -(addr | TARGET_PAGE_MASK);
     target_ulong curlen =3D MIN(pagelen, len);
=20
-    probe_access(env, addr, curlen, access_type,
+    probe_access(env, adjust_addr(env, addr), curlen, access_type,
                  cpu_mmu_index(env, false), ra);
     if (len > curlen) {
         addr +=3D curlen;
         curlen =3D len - curlen;
-        probe_access(env, addr, curlen, access_type,
+        probe_access(env, adjust_addr(env, addr), curlen, access_type,
                      cpu_mmu_index(env, false), ra);
     }
 }
@@ -239,7 +244,7 @@ vext_ldst_stride(void *vd, void *v0, target_ulong bas=
e,
         k =3D 0;
         while (k < nf) {
             target_ulong addr =3D base + stride * i + (k << esz);
-            ldst_elem(env, addr, i + k * max_elems, vd, ra);
+            ldst_elem(env, adjust_addr(env, addr), i + k * max_elems, vd=
, ra);
             k++;
         }
     }
@@ -295,7 +300,7 @@ vext_ldst_us(void *vd, target_ulong base, CPURISCVSta=
te *env, uint32_t desc,
         k =3D 0;
         while (k < nf) {
             target_ulong addr =3D base + ((i * nf + k) << esz);
-            ldst_elem(env, addr, i + k * max_elems, vd, ra);
+            ldst_elem(env, adjust_addr(env, addr), i + k * max_elems, vd=
, ra);
             k++;
         }
     }
@@ -409,7 +414,7 @@ vext_ldst_index(void *vd, void *v0, target_ulong base=
,
         k =3D 0;
         while (k < nf) {
             abi_ptr addr =3D get_index_addr(base, i, vs2) + (k << esz);
-            ldst_elem(env, addr, i + k * max_elems, vd, ra);
+            ldst_elem(env, adjust_addr(env, addr), i + k * max_elems, vd=
, ra);
             k++;
         }
     }
@@ -488,7 +493,7 @@ vext_ldff(void *vd, void *v0, target_ulong base,
         if (!vm && !vext_elem_mask(v0, i)) {
             continue;
         }
-        addr =3D base + i * (nf << esz);
+        addr =3D adjust_addr(env, base + i * (nf << esz));
         if (i =3D=3D 0) {
             probe_pages(env, addr, nf << esz, ra, MMU_DATA_LOAD);
         } else {
@@ -515,7 +520,7 @@ vext_ldff(void *vd, void *v0, target_ulong base,
                     break;
                 }
                 remain -=3D offset;
-                addr +=3D offset;
+                addr =3D adjust_addr(env, addr + offset);
             }
         }
     }
@@ -531,7 +536,7 @@ ProbeSuccess:
         }
         while (k < nf) {
             target_ulong addr =3D base + ((i * nf + k) << esz);
-            ldst_elem(env, addr, i + k * max_elems, vd, ra);
+            ldst_elem(env, adjust_addr(env, addr), i + k * max_elems, vd=
, ra);
             k++;
         }
     }
@@ -585,7 +590,7 @@ vext_ldst_whole(void *vd, target_ulong base, CPURISCV=
State *env, uint32_t desc,
         /* load/store rest of elements of current segment pointed by vst=
art */
         for (pos =3D off; pos < max_elems; pos++, env->vstart++) {
             target_ulong addr =3D base + ((pos + k * max_elems) << esz);
-            ldst_elem(env, addr, pos + k * max_elems, vd, ra);
+            ldst_elem(env, adjust_addr(env, addr), pos + k * max_elems, =
vd, ra);
         }
         k++;
     }
@@ -594,7 +599,7 @@ vext_ldst_whole(void *vd, target_ulong base, CPURISCV=
State *env, uint32_t desc,
     for (; k < nf; k++) {
         for (i =3D 0; i < max_elems; i++, env->vstart++) {
             target_ulong addr =3D base + ((i + k * max_elems) << esz);
-            ldst_elem(env, addr, i + k * max_elems, vd, ra);
+            ldst_elem(env, adjust_addr(env, addr), i + k * max_elems, vd=
, ra);
         }
     }
=20
--=20
2.31.1


