Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01BF24CE479
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Mar 2022 12:17:51 +0100 (CET)
Received: from localhost ([::1]:33008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQSQ1-0008Gi-6s
	for lists+qemu-devel@lfdr.de; Sat, 05 Mar 2022 06:17:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nQS9Z-0001jV-Cw; Sat, 05 Mar 2022 06:00:49 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:17114)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nQS9X-00032i-H7; Sat, 05 Mar 2022 06:00:49 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2254SvgT017661; 
 Sat, 5 Mar 2022 11:00:25 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3em0vfv2ut-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 05 Mar 2022 11:00:25 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 225Arr8X029532;
 Sat, 5 Mar 2022 11:00:23 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04fra.de.ibm.com with ESMTP id 3ekyg90m9v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 05 Mar 2022 11:00:22 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 225B0KNY40370468
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 5 Mar 2022 11:00:20 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 69B4CA405F;
 Sat,  5 Mar 2022 11:00:20 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 26A69A405C;
 Sat,  5 Mar 2022 11:00:20 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Sat,  5 Mar 2022 11:00:20 +0000 (GMT)
Received: from yukon.home (unknown [9.171.13.194])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 6353322027F;
 Sat,  5 Mar 2022 12:00:19 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 04/13] tests/tcg/ppc64le: drop __int128 usage in bcdsub
Date: Sat,  5 Mar 2022 12:00:01 +0100
Message-Id: <20220305110010.1283654-5-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220305110010.1283654-1-clg@kaod.org>
References: <20220305110010.1283654-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: NuYpGiyafcMk0rEhduo-UYT00uLANKWT
X-Proofpoint-ORIG-GUID: NuYpGiyafcMk0rEhduo-UYT00uLANKWT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-05_03,2022-03-04_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 mlxscore=0 phishscore=0 lowpriorityscore=0
 mlxlogscore=884 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 impostorscore=0 clxscore=1034 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2202240000 definitions=main-2203050057
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Using __int128 with inline asm constraints like "v" generates incorrect
code when compiling with LLVM/Clang (e.g., only one doubleword of the
VSR is loaded). Instead, use a GPR pair to pass the 128-bits value and
load the VSR with mtvsrd/xxmrghd.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20220304165417.1981159-4-matheus.ferst@eldorado.org.br>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 tests/tcg/ppc64le/bcdsub.c | 129 ++++++++++++++++++-------------------
 1 file changed, 61 insertions(+), 68 deletions(-)

diff --git a/tests/tcg/ppc64le/bcdsub.c b/tests/tcg/ppc64le/bcdsub.c
index 8c188cae6d28..12da19b78ef3 100644
--- a/tests/tcg/ppc64le/bcdsub.c
+++ b/tests/tcg/ppc64le/bcdsub.c
@@ -1,6 +1,7 @@
 #include <assert.h>
 #include <unistd.h>
 #include <signal.h>
+#include <stdint.h>
=20
 #define CRF_LT  (1 << 3)
 #define CRF_GT  (1 << 2)
@@ -8,24 +9,39 @@
 #define CRF_SO  (1 << 0)
 #define UNDEF   0
=20
-#define BCDSUB(vra, vrb, ps)                    \
-    asm ("bcdsub. %1,%2,%3,%4;"                 \
-         "mfocrf %0,0b10;"                      \
-         : "=3Dr" (cr), "=3Dv" (vrt)                \
-         : "v" (vra), "v" (vrb), "i" (ps)       \
-         : );
-
-#define TEST(vra, vrb, ps, exp_res, exp_cr6)    \
+/*
+ * Use GPR pairs to load the VSR values and place the resulting VSR and =
CR6 in
+ * th, tl, and cr. Note that we avoid newer instructions (e.g., mtvsrdd/=
mfvsrld)
+ * so we can run this test on POWER8 machines.
+ */
+#define BCDSUB(AH, AL, BH, BL, PS)                          \
+    asm ("mtvsrd 32, %3\n\t"                                \
+         "mtvsrd 33, %4\n\t"                                \
+         "xxmrghd 32, 32, 33\n\t"                           \
+         "mtvsrd 33, %5\n\t"                                \
+         "mtvsrd 34, %6\n\t"                                \
+         "xxmrghd 33, 33, 34\n\t"                           \
+         "bcdsub. 0, 0, 1, %7\n\t"                          \
+         "mfocrf %0, 0b10\n\t"                              \
+         "mfvsrd %1, 32\n\t"                                \
+         "xxswapd 32, 32\n\t"                               \
+         "mfvsrd %2, 32\n\t"                                \
+         : "=3Dr" (cr), "=3Dr" (th), "=3Dr" (tl)                  \
+         : "r" (AH), "r" (AL), "r" (BH), "r" (BL), "i" (PS) \
+         : "v0", "v1", "v2");
+
+#define TEST(AH, AL, BH, BL, PS, TH, TL, CR6)   \
     do {                                        \
-        __int128 vrt =3D 0;                       \
         int cr =3D 0;                             \
-        BCDSUB(vra, vrb, ps);                   \
-        if (exp_res)                            \
-            assert(vrt =3D=3D exp_res);             \
-        assert((cr >> 4) =3D=3D exp_cr6);           \
+        uint64_t th, tl;                        \
+        BCDSUB(AH, AL, BH, BL, PS);             \
+        if (TH !=3D UNDEF || TL !=3D UNDEF) {       \
+            assert(tl =3D=3D TL);                   \
+            assert(th =3D=3D TH);                   \
+        }                                       \
+        assert((cr >> 4) =3D=3D CR6);               \
     } while (0)
=20
-
 /*
  * Unbounded result is equal to zero:
  *   sign =3D (PS) ? 0b1111 : 0b1100
@@ -33,13 +49,13 @@
  */
 void test_bcdsub_eq(void)
 {
-    __int128 a, b;
-
     /* maximum positive BCD value */
-    a =3D b =3D (((__int128) 0x9999999999999999) << 64 | 0x9999999999999=
99c);
-
-    TEST(a, b, 0, 0xc, CRF_EQ);
-    TEST(a, b, 1, 0xf, CRF_EQ);
+    TEST(0x9999999999999999, 0x999999999999999c,
+         0x9999999999999999, 0x999999999999999c,
+         0, 0x0, 0xc, CRF_EQ);
+    TEST(0x9999999999999999, 0x999999999999999c,
+         0x9999999999999999, 0x999999999999999c,
+         1, 0x0, 0xf, CRF_EQ);
 }
=20
 /*
@@ -49,21 +65,16 @@ void test_bcdsub_eq(void)
  */
 void test_bcdsub_gt(void)
 {
-    __int128 a, b, c;
-
-    /* maximum positive BCD value */
-    a =3D (((__int128) 0x9999999999999999) << 64 | 0x999999999999999c);
-
-    /* negative one BCD value */
-    b =3D (__int128) 0x1d;
-
-    TEST(a, b, 0, 0xc, (CRF_GT | CRF_SO));
-    TEST(a, b, 1, 0xf, (CRF_GT | CRF_SO));
-
-    c =3D (((__int128) 0x9999999999999999) << 64 | 0x999999999999998c);
-
-    TEST(c, b, 0, a, CRF_GT);
-    TEST(c, b, 1, (a | 0x3), CRF_GT);
+    /* maximum positive and negative one BCD values */
+    TEST(0x9999999999999999, 0x999999999999999c, 0x0, 0x1d, 0,
+         0x0, 0xc, (CRF_GT | CRF_SO));
+    TEST(0x9999999999999999, 0x999999999999999c, 0x0, 0x1d, 1,
+         0x0, 0xf, (CRF_GT | CRF_SO));
+
+    TEST(0x9999999999999999, 0x999999999999998c, 0x0, 0x1d, 0,
+         0x9999999999999999, 0x999999999999999c, CRF_GT);
+    TEST(0x9999999999999999, 0x999999999999998c, 0x0, 0x1d, 1,
+         0x9999999999999999, 0x999999999999999f, CRF_GT);
 }
=20
 /*
@@ -73,45 +84,27 @@ void test_bcdsub_gt(void)
  */
 void test_bcdsub_lt(void)
 {
-    __int128 a, b;
-
-    /* positive zero BCD value */
-    a =3D (__int128) 0xc;
-
-    /* positive one BCD value */
-    b =3D (__int128) 0x1c;
-
-    TEST(a, b, 0, 0x1d, CRF_LT);
-    TEST(a, b, 1, 0x1d, CRF_LT);
-
-    /* maximum negative BCD value */
-    a =3D (((__int128) 0x9999999999999999) << 64 | 0x999999999999999d);
-
-    /* positive one BCD value */
-    b =3D (__int128) 0x1c;
-
-    TEST(a, b, 0, 0xd, (CRF_LT | CRF_SO));
-    TEST(a, b, 1, 0xd, (CRF_LT | CRF_SO));
+    /* positive zero and positive one BCD values */
+    TEST(0x0, 0xc, 0x0, 0x1c, 0, 0x0, 0x1d, CRF_LT);
+    TEST(0x0, 0xc, 0x0, 0x1c, 1, 0x0, 0x1d, CRF_LT);
+
+    /* maximum negative and positive one BCD values */
+    TEST(0x9999999999999999, 0x999999999999999d, 0x0, 0x1c, 0,
+         0x0, 0xd, (CRF_LT | CRF_SO));
+    TEST(0x9999999999999999, 0x999999999999999d, 0x0, 0x1c, 1,
+         0x0, 0xd, (CRF_LT | CRF_SO));
 }
=20
 void test_bcdsub_invalid(void)
 {
-    __int128 a, b;
-
-    /* positive one BCD value */
-    a =3D (__int128) 0x1c;
-    b =3D 0xf00;
-
-    TEST(a, b, 0, UNDEF, CRF_SO);
-    TEST(a, b, 1, UNDEF, CRF_SO);
-
-    TEST(b, a, 0, UNDEF, CRF_SO);
-    TEST(b, a, 1, UNDEF, CRF_SO);
+    TEST(0x0, 0x1c, 0x0, 0xf00, 0, UNDEF, UNDEF, CRF_SO);
+    TEST(0x0, 0x1c, 0x0, 0xf00, 1, UNDEF, UNDEF, CRF_SO);
=20
-    a =3D 0xbad;
+    TEST(0x0, 0xf00, 0x0, 0x1c, 0, UNDEF, UNDEF, CRF_SO);
+    TEST(0x0, 0xf00, 0x0, 0x1c, 1, UNDEF, UNDEF, CRF_SO);
=20
-    TEST(a, b, 0, UNDEF, CRF_SO);
-    TEST(a, b, 1, UNDEF, CRF_SO);
+    TEST(0x0, 0xbad, 0x0, 0xf00, 0, UNDEF, UNDEF, CRF_SO);
+    TEST(0x0, 0xbad, 0x0, 0xf00, 1, UNDEF, UNDEF, CRF_SO);
 }
=20
 int main(void)
--=20
2.34.1


