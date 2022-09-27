Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5365EBBF0
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 09:49:54 +0200 (CEST)
Received: from localhost ([::1]:37550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od5Lm-000581-1c
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 03:49:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=262caef14=alistair.francis@opensource.wdc.com>)
 id 1od48o-0005rk-EH
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 02:32:26 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:44581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=262caef14=alistair.francis@opensource.wdc.com>)
 id 1od48l-0001I9-B8
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 02:32:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1664260343; x=1695796343;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0RgDjweyHhiIfDehhBNmhQuVoHYY6d2wYe17OwaOTAE=;
 b=J/pOL23bRCWN8dF3ZOoJgQnaJc4GNCQAjFRJKBchZe9YBHRrQoHwUn4i
 0PW+/iJg10EZF/cMIorImQqx0keqWnWtGRsEu4xth6wmBAlQK5aWwQ7tr
 inFW8bzYdTtOWXTk2aezD/eUG8NT37EnBJ6t6RjymRauerD0VmsRopkcs
 cmplH3eNzvdeIIfOb5ALpEiyFq69Dpk12o2G7YBK3XOYzlXykQt2au3zw
 XhOogZbiCyy9W0aHeyHpZUm9AJffmYeK7uhJ8xZfmnH1mM9anuJ2Yn7xQ
 3xG1n7pEYQEHdenDnyZRcBddcVP9q7KSSKGkQd2R25IC73XCc0MWHciOG g==;
X-IronPort-AV: E=Sophos;i="5.93,348,1654531200"; d="scan'208";a="217530938"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 27 Sep 2022 14:31:47 +0800
IronPort-SDR: 7qsIzwtzCr+hUlrbn31wS6SYmLRHcBUS6E6OUt2/hKr/Rvuvn63KYQKJ+sgnQMCJmi02izb9yG
 g22AxKTn55PtXK6hzKAj2PZsk4OWNcrGl/jZGRP4i1+9F+Ifdvj88+gSoWqSzzwGDqG2WfMzia
 lzpoR+u7nIUp+TVo1S+Z8Xp/HIFctRnpv6IF0vQ+JhUPxSfIhfAwCPPjIvNRjsvjaIh5qFQlWD
 YnUc0i28Du8fwwCBmeKSs5OwBbC+iQTR2CvM0G451uPgOWXwTA34e/XTPMCearcmfFYJ56Je4W
 gnuc2VcaYUhvEQcQrjVw7Md5
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Sep 2022 22:51:44 -0700
IronPort-SDR: /wyB0GcRSpMF5RQhThl6cQPQyabKx0t3eLl0Hcz54qIsL9LDZtrxSgQSa7IXBSc+Zw8avH5l6D
 wifNjOWkKr2SxHF1ODWH8mRqpK+l73ihcDgtgnjR0XmRONIF0x63hAA+/G+kItDyNla818eaJN
 hfU0xcs5R1/risPmGZQWIK5cf4y1vUPQy/VhHFpsq7d8HqpSzkRSiJ88Tclp/rAecu6KJPmJrv
 pcZ57+aAmH8SIzImGmW+TZPK6mpZfRXcvU342Q16ujQw4wDaouCptB57Jg6QEsoaHpmjSgAlu5
 kbg=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Sep 2022 23:31:47 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Mc8st6Svlz1Rwt8
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 23:31:46 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1664260306; x=1666852307; bh=0RgDjweyHhiIfDehhB
 NmhQuVoHYY6d2wYe17OwaOTAE=; b=aOrgKq5P8JaE8tmD1UUSovUM/fQ7ZwUs+V
 1syLCb4D8ENBR/3YjIg1DaLUtCU9vox7tKKYTe65tZW9ZT+CxGkWDHmq/J4kdiRP
 2x+Qq4taIvUtZ3XKq+Im0E3s89YFeLDcWU9IH4y31tX14i1qQjE80zzuuoJ80olh
 IHuGtteVFwZloj9JjkHc9HThITaLR+fRez0EaNHTQfiqr39Mi/yizxnVgxQr2Vng
 ase6/Vkc5p3t/hAjEX3j4HkKnXPgzrm+TEOEscX6IBe04upmWU695X1PrAoskebc
 gHf0uf2FUNsACDVe2zxpBCvC8JtcRfhZ3JulcI9rNKpdKuWesoCg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id tLLMYJLOV5JG for <qemu-devel@nongnu.org>;
 Mon, 26 Sep 2022 23:31:46 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.167.123])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Mc8ss0Rztz1RvLy;
 Mon, 26 Sep 2022 23:31:44 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Yang Liu <liuyang22@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Frank Chang <frank.chang@sifive.com>
Subject: [PULL v2 21/22] target/riscv: rvv-1.0: Simplify vfwredsum code
Date: Tue, 27 Sep 2022 16:31:03 +1000
Message-Id: <20220927063104.2846825-22-alistair.francis@opensource.wdc.com>
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

Remove duplicate code by wrapping vfwredsum_vs's OP function.

Signed-off-by: Yang Liu <liuyang22@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Message-Id: <20220817074802.20765-1-liuyang22@iscas.ac.cn>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/vector_helper.c | 56 +++++++-----------------------------
 1 file changed, 10 insertions(+), 46 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index d224861c2c..2828073497 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4728,58 +4728,22 @@ GEN_VEXT_FRED(vfredmin_vs_h, uint16_t, uint16_t, =
H2, H2, float16_minimum_number)
 GEN_VEXT_FRED(vfredmin_vs_w, uint32_t, uint32_t, H4, H4, float32_minimum=
_number)
 GEN_VEXT_FRED(vfredmin_vs_d, uint64_t, uint64_t, H8, H8, float64_minimum=
_number)
=20
-/* Vector Widening Floating-Point Reduction Instructions */
-/* Unordered reduce 2*SEW =3D 2*SEW + sum(promote(SEW)) */
-void HELPER(vfwredsum_vs_h)(void *vd, void *v0, void *vs1,
-                            void *vs2, CPURISCVState *env, uint32_t desc=
)
+/* Vector Widening Floating-Point Add Instructions */
+static uint32_t fwadd16(uint32_t a, uint16_t b, float_status *s)
 {
-    uint32_t vm =3D vext_vm(desc);
-    uint32_t vl =3D env->vl;
-    uint32_t esz =3D sizeof(uint32_t);
-    uint32_t vlenb =3D simd_maxsz(desc);
-    uint32_t vta =3D vext_vta(desc);
-    uint32_t i;
-    uint32_t s1 =3D  *((uint32_t *)vs1 + H4(0));
-
-    for (i =3D env->vstart; i < vl; i++) {
-        uint16_t s2 =3D *((uint16_t *)vs2 + H2(i));
-        if (!vm && !vext_elem_mask(v0, i)) {
-            continue;
-        }
-        s1 =3D float32_add(s1, float16_to_float32(s2, true, &env->fp_sta=
tus),
-                         &env->fp_status);
-    }
-    *((uint32_t *)vd + H4(0)) =3D s1;
-    env->vstart =3D 0;
-    /* set tail elements to 1s */
-    vext_set_elems_1s(vd, vta, esz, vlenb);
+    return float32_add(a, float16_to_float32(b, true, s), s);
 }
=20
-void HELPER(vfwredsum_vs_w)(void *vd, void *v0, void *vs1,
-                            void *vs2, CPURISCVState *env, uint32_t desc=
)
+static uint64_t fwadd32(uint64_t a, uint32_t b, float_status *s)
 {
-    uint32_t vm =3D vext_vm(desc);
-    uint32_t vl =3D env->vl;
-    uint32_t esz =3D sizeof(uint64_t);
-    uint32_t vlenb =3D simd_maxsz(desc);
-    uint32_t vta =3D vext_vta(desc);
-    uint32_t i;
-    uint64_t s1 =3D  *((uint64_t *)vs1);
-
-    for (i =3D env->vstart; i < vl; i++) {
-        uint32_t s2 =3D *((uint32_t *)vs2 + H4(i));
-        if (!vm && !vext_elem_mask(v0, i)) {
-            continue;
-        }
-        s1 =3D float64_add(s1, float32_to_float64(s2, &env->fp_status),
-                         &env->fp_status);
-    }
-    *((uint64_t *)vd) =3D s1;
-    env->vstart =3D 0;
-    /* set tail elements to 1s */
-    vext_set_elems_1s(vd, vta, esz, vlenb);
+    return float64_add(a, float32_to_float64(b, s), s);
 }
=20
+/* Vector Widening Floating-Point Reduction Instructions */
+/* Unordered reduce 2*SEW =3D 2*SEW + sum(promote(SEW)) */
+GEN_VEXT_FRED(vfwredsum_vs_h, uint32_t, uint16_t, H4, H2, fwadd16)
+GEN_VEXT_FRED(vfwredsum_vs_w, uint64_t, uint32_t, H8, H4, fwadd32)
+
 /*
  *** Vector Mask Operations
  */
--=20
2.37.3


