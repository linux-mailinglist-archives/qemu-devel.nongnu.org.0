Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2092475FE9
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 18:54:31 +0100 (CET)
Received: from localhost ([::1]:54832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxYU2-0005pB-VT
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 12:54:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxXiA-0004dL-Vz; Wed, 15 Dec 2021 12:05:03 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:32492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxXi9-0004gz-3U; Wed, 15 Dec 2021 12:05:02 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BFGfaCf010472; 
 Wed, 15 Dec 2021 17:04:31 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cye72sntf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 17:04:30 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BFH2kAt004398;
 Wed, 15 Dec 2021 17:04:28 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03ams.nl.ibm.com with ESMTP id 3cy7jqyfdn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 17:04:28 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1BFH4Qgx46924146
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 17:04:26 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5210611C058;
 Wed, 15 Dec 2021 17:04:26 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1916111C04C;
 Wed, 15 Dec 2021 17:04:26 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 15 Dec 2021 17:04:26 +0000 (GMT)
Received: from yukon.home (unknown [9.171.19.61])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 6207C220295;
 Wed, 15 Dec 2021 18:04:25 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 046/102] softfloat: Add float64r32 arithmetic routines
Date: Wed, 15 Dec 2021 18:03:01 +0100
Message-Id: <20211215170357.321643-34-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211215170357.321643-1-clg@kaod.org>
References: <20211215165847.321042-1-clg@kaod.org>
 <20211215170357.321643-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Km0ygSCY316eprjboF1cQ1bBDvZSzfxz
X-Proofpoint-ORIG-GUID: Km0ygSCY316eprjboF1cQ1bBDvZSzfxz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-15_10,2021-12-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1034 bulkscore=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 mlxscore=0 suspectscore=0 spamscore=0 malwarescore=0 mlxlogscore=782
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112150098
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

These variants take a float64 as input, compute the result to
infinite precision (as we do with FloatParts), round the result
to the precision and dynamic range of float32, and then return
the result in the format of float64.

This is the operation PowerPC requires for its float32 operations.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211119160502.17432-28-richard.henderson@linaro.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/fpu/softfloat.h |  12 +++++
 fpu/softfloat.c         | 110 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 122 insertions(+)

diff --git a/include/fpu/softfloat.h b/include/fpu/softfloat.h
index 0d3b40780762..d34b2c44d256 100644
--- a/include/fpu/softfloat.h
+++ b/include/fpu/softfloat.h
@@ -908,6 +908,18 @@ static inline bool float64_unordered_quiet(float64 a=
, float64 b,
 *-----------------------------------------------------------------------=
-----*/
 float64 float64_default_nan(float_status *status);
=20
+/*----------------------------------------------------------------------=
------
+| Software IEC/IEEE double-precision operations, rounding to single prec=
ision,
+| returning a result in double precision, with only one rounding step.
+*-----------------------------------------------------------------------=
-----*/
+
+float64 float64r32_add(float64, float64, float_status *status);
+float64 float64r32_sub(float64, float64, float_status *status);
+float64 float64r32_mul(float64, float64, float_status *status);
+float64 float64r32_div(float64, float64, float_status *status);
+float64 float64r32_muladd(float64, float64, float64, int, float_status *=
status);
+float64 float64r32_sqrt(float64, float_status *status);
+
 /*----------------------------------------------------------------------=
------
 | Software IEC/IEEE extended double-precision conversion routines.
 *-----------------------------------------------------------------------=
-----*/
diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 834ed3a054f7..7f524d437767 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -1693,6 +1693,50 @@ static float64 float64_round_pack_canonical(FloatP=
arts64 *p,
     return float64_pack_raw(p);
 }
=20
+static float64 float64r32_round_pack_canonical(FloatParts64 *p,
+                                               float_status *s)
+{
+    parts_uncanon(p, s, &float32_params);
+
+    /*
+     * In parts_uncanon, we placed the fraction for float32 at the lsb.
+     * We need to adjust the fraction higher so that the least N bits ar=
e
+     * zero, and the fraction is adjacent to the float64 implicit bit.
+     */
+    switch (p->cls) {
+    case float_class_normal:
+        if (unlikely(p->exp =3D=3D 0)) {
+            /*
+             * The result is denormal for float32, but can be represente=
d
+             * in normalized form for float64.  Adjust, per canonicalize=
.
+             */
+            int shift =3D frac_normalize(p);
+            p->exp =3D (float32_params.frac_shift -
+                      float32_params.exp_bias - shift + 1 +
+                      float64_params.exp_bias);
+            frac_shr(p, float64_params.frac_shift);
+        } else {
+            frac_shl(p, float32_params.frac_shift - float64_params.frac_=
shift);
+            p->exp +=3D float64_params.exp_bias - float32_params.exp_bia=
s;
+        }
+        break;
+    case float_class_snan:
+    case float_class_qnan:
+        frac_shl(p, float32_params.frac_shift - float64_params.frac_shif=
t);
+        p->exp =3D float64_params.exp_max;
+        break;
+    case float_class_inf:
+        p->exp =3D float64_params.exp_max;
+        break;
+    case float_class_zero:
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    return float64_pack_raw(p);
+}
+
 static void float128_unpack_canonical(FloatParts128 *p, float128 f,
                                       float_status *s)
 {
@@ -1938,6 +1982,28 @@ float64_sub(float64 a, float64 b, float_status *s)
     return float64_addsub(a, b, s, hard_f64_sub, soft_f64_sub);
 }
=20
+static float64 float64r32_addsub(float64 a, float64 b, float_status *sta=
tus,
+                                 bool subtract)
+{
+    FloatParts64 pa, pb, *pr;
+
+    float64_unpack_canonical(&pa, a, status);
+    float64_unpack_canonical(&pb, b, status);
+    pr =3D parts_addsub(&pa, &pb, status, subtract);
+
+    return float64r32_round_pack_canonical(pr, status);
+}
+
+float64 float64r32_add(float64 a, float64 b, float_status *status)
+{
+    return float64r32_addsub(a, b, status, false);
+}
+
+float64 float64r32_sub(float64 a, float64 b, float_status *status)
+{
+    return float64r32_addsub(a, b, status, true);
+}
+
 static bfloat16 QEMU_FLATTEN
 bfloat16_addsub(bfloat16 a, bfloat16 b, float_status *status, bool subtr=
act)
 {
@@ -2069,6 +2135,17 @@ float64_mul(float64 a, float64 b, float_status *s)
                         f64_is_zon2, f64_addsubmul_post);
 }
=20
+float64 float64r32_mul(float64 a, float64 b, float_status *status)
+{
+    FloatParts64 pa, pb, *pr;
+
+    float64_unpack_canonical(&pa, a, status);
+    float64_unpack_canonical(&pb, b, status);
+    pr =3D parts_mul(&pa, &pb, status);
+
+    return float64r32_round_pack_canonical(pr, status);
+}
+
 bfloat16 QEMU_FLATTEN
 bfloat16_mul(bfloat16 a, bfloat16 b, float_status *status)
 {
@@ -2296,6 +2373,19 @@ float64_muladd(float64 xa, float64 xb, float64 xc,=
 int flags, float_status *s)
     return soft_f64_muladd(ua.s, ub.s, uc.s, flags, s);
 }
=20
+float64 float64r32_muladd(float64 a, float64 b, float64 c,
+                          int flags, float_status *status)
+{
+    FloatParts64 pa, pb, pc, *pr;
+
+    float64_unpack_canonical(&pa, a, status);
+    float64_unpack_canonical(&pb, b, status);
+    float64_unpack_canonical(&pc, c, status);
+    pr =3D parts_muladd(&pa, &pb, &pc, flags, status);
+
+    return float64r32_round_pack_canonical(pr, status);
+}
+
 bfloat16 QEMU_FLATTEN bfloat16_muladd(bfloat16 a, bfloat16 b, bfloat16 c=
,
                                       int flags, float_status *status)
 {
@@ -2419,6 +2509,17 @@ float64_div(float64 a, float64 b, float_status *s)
                         f64_div_pre, f64_div_post);
 }
=20
+float64 float64r32_div(float64 a, float64 b, float_status *status)
+{
+    FloatParts64 pa, pb, *pr;
+
+    float64_unpack_canonical(&pa, a, status);
+    float64_unpack_canonical(&pb, b, status);
+    pr =3D parts_div(&pa, &pb, status);
+
+    return float64r32_round_pack_canonical(pr, status);
+}
+
 bfloat16 QEMU_FLATTEN
 bfloat16_div(bfloat16 a, bfloat16 b, float_status *status)
 {
@@ -4285,6 +4386,15 @@ float64 QEMU_FLATTEN float64_sqrt(float64 xa, floa=
t_status *s)
     return soft_f64_sqrt(ua.s, s);
 }
=20
+float64 float64r32_sqrt(float64 a, float_status *status)
+{
+    FloatParts64 p;
+
+    float64_unpack_canonical(&p, a, status);
+    parts_sqrt(&p, status, &float64_params);
+    return float64r32_round_pack_canonical(&p, status);
+}
+
 bfloat16 QEMU_FLATTEN bfloat16_sqrt(bfloat16 a, float_status *status)
 {
     FloatParts64 p;
--=20
2.31.1


