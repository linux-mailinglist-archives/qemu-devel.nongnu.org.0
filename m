Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A0D4CE466
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Mar 2022 12:08:50 +0100 (CET)
Received: from localhost ([::1]:47864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQSHJ-00073H-Gg
	for lists+qemu-devel@lfdr.de; Sat, 05 Mar 2022 06:08:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nQS9Y-0001f2-4u; Sat, 05 Mar 2022 06:00:48 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:41588
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nQS9V-00031x-QZ; Sat, 05 Mar 2022 06:00:47 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2259gnvT026042; 
 Sat, 5 Mar 2022 11:00:26 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3em5f18st3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 05 Mar 2022 11:00:25 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 225As7CN023363;
 Sat, 5 Mar 2022 11:00:24 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04ams.nl.ibm.com with ESMTP id 3ekyg90qbn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 05 Mar 2022 11:00:23 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 225B0L2Z52363586
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 5 Mar 2022 11:00:21 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C784552067;
 Sat,  5 Mar 2022 11:00:21 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id 864C852057;
 Sat,  5 Mar 2022 11:00:21 +0000 (GMT)
Received: from yukon.home (unknown [9.171.13.194])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id C8DB822027F;
 Sat,  5 Mar 2022 12:00:20 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 06/13] tests/tcg/ppc64le: Use Altivec register names in clobber
 list
Date: Sat,  5 Mar 2022 12:00:03 +0100
Message-Id: <20220305110010.1283654-7-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220305110010.1283654-1-clg@kaod.org>
References: <20220305110010.1283654-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: J_gszW2ATKkLzf55KluDdrqNzFXkSEeX
X-Proofpoint-GUID: J_gszW2ATKkLzf55KluDdrqNzFXkSEeX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-05_03,2022-03-04_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1034
 mlxscore=0 mlxlogscore=741 bulkscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203050057
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.187,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

LLVM/Clang doesn't know the VSX registers when compiling with
-mabi=3Delfv1. Use only registers >=3D 32 and list them with their Altive=
c
name.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20220304165417.1981159-6-matheus.ferst@eldorado.org.br>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 tests/tcg/ppc64le/non_signalling_xscv.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/tests/tcg/ppc64le/non_signalling_xscv.c b/tests/tcg/ppc64le/=
non_signalling_xscv.c
index 91e25cad4681..836df71ef092 100644
--- a/tests/tcg/ppc64le/non_signalling_xscv.c
+++ b/tests/tcg/ppc64le/non_signalling_xscv.c
@@ -6,16 +6,16 @@
 #define TEST(INSN, B_HI, B_LO, T_HI, T_LO) \
     do {                                                                =
\
         uint64_t th, tl, bh =3D B_HI, bl =3D B_LO;                      =
    \
-        asm("mtvsrd 0, %2\n\t"                                          =
\
-            "mtvsrd 1, %3\n\t"                                          =
\
-            "xxmrghd 0, 0, 1\n\t"                                       =
\
-            INSN " 0, 0\n\t"                                            =
\
-            "mfvsrd %0, 0\n\t"                                          =
\
-            "xxswapd 0, 0\n\t"                                          =
\
-            "mfvsrd %1, 0\n\t"                                          =
\
+        asm("mtvsrd 32, %2\n\t"                                         =
\
+            "mtvsrd 33, %3\n\t"                                         =
\
+            "xxmrghd 32, 32, 33\n\t"                                    =
\
+            INSN " 32, 32\n\t"                                          =
\
+            "mfvsrd %0, 32\n\t"                                         =
\
+            "xxswapd 32, 32\n\t"                                        =
\
+            "mfvsrd %1, 32\n\t"                                         =
\
             : "=3Dr" (th), "=3Dr" (tl)                                  =
    \
             : "r" (bh), "r" (bl)                                        =
\
-            : "vs0", "vs1");                                            =
\
+            : "v0", "v1");                                              =
\
         printf(INSN "(0x%016" PRIx64 "%016" PRIx64 ") =3D 0x%016" PRIx64=
  \
                "%016" PRIx64 "\n", bh, bl, th, tl);                     =
\
         assert(th =3D=3D T_HI && tl =3D=3D T_LO);                       =
        \
--=20
2.34.1


