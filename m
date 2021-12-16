Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50BAD477EAF
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 22:23:21 +0100 (CET)
Received: from localhost ([::1]:50704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxyDg-0007fq-Et
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 16:23:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxxLY-0002ij-6U; Thu, 16 Dec 2021 15:27:24 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:53540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxxLQ-0007O5-86; Thu, 16 Dec 2021 15:27:23 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BGJITbV030885; 
 Thu, 16 Dec 2021 20:26:51 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cys71g2qe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Dec 2021 20:26:51 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BGKDC3g004782;
 Thu, 16 Dec 2021 20:26:49 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03ams.nl.ibm.com with ESMTP id 3cy7jravwc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Dec 2021 20:26:48 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1BGKQkBf41419034
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Dec 2021 20:26:46 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 86E8AA4059;
 Thu, 16 Dec 2021 20:26:46 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4C6A6A4053;
 Thu, 16 Dec 2021 20:26:46 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu, 16 Dec 2021 20:26:46 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.48.122])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id A479B2201A0;
 Thu, 16 Dec 2021 21:26:45 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 044/101] target/ppc: Update xsrqpi and xsrqpxp to new flags
Date: Thu, 16 Dec 2021 21:25:17 +0100
Message-Id: <20211216202614.414266-45-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211216202614.414266-1-clg@kaod.org>
References: <20211216202614.414266-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: tGE2PwZVelE5kFx5yIleDLg1IBq58uVo
X-Proofpoint-GUID: tGE2PwZVelE5kFx5yIleDLg1IBq58uVo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-16_08,2021-12-16_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=576 malwarescore=0 clxscore=1034 mlxscore=0 bulkscore=0
 suspectscore=0 phishscore=0 spamscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112160109
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

Use float_flag_invalid_snan instead of recomputing
the snan-ness of the operand.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211119160502.17432-26-richard.henderson@linaro.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/fpu_helper.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index 08f7c8837e17..853e0aad1d4e 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -3138,11 +3138,8 @@ void helper_xsrqpi(CPUPPCState *env, uint32_t opco=
de,
     t.f128 =3D float128_round_to_int(xb->f128, &tstat);
     env->fp_status.float_exception_flags |=3D tstat.float_exception_flag=
s;
=20
-    if (unlikely(tstat.float_exception_flags & float_flag_invalid)) {
-        if (float128_is_signaling_nan(xb->f128, &tstat)) {
-            float_invalid_op_vxsnan(env, GETPC());
-            t.f128 =3D float128_snan_to_qnan(t.f128);
-        }
+    if (unlikely(tstat.float_exception_flags & float_flag_invalid_snan))=
 {
+        float_invalid_op_vxsnan(env, GETPC());
     }
=20
     if (ex =3D=3D 0 && (tstat.float_exception_flags & float_flag_inexact=
)) {
@@ -3196,11 +3193,9 @@ void helper_xsrqpxp(CPUPPCState *env, uint32_t opc=
ode,
     t.f128 =3D floatx80_to_float128(round_res, &tstat);
     env->fp_status.float_exception_flags |=3D tstat.float_exception_flag=
s;
=20
-    if (unlikely(tstat.float_exception_flags & float_flag_invalid)) {
-        if (float128_is_signaling_nan(xb->f128, &tstat)) {
-            float_invalid_op_vxsnan(env, GETPC());
-            t.f128 =3D float128_snan_to_qnan(t.f128);
-        }
+    if (unlikely(tstat.float_exception_flags & float_flag_invalid_snan))=
 {
+        float_invalid_op_vxsnan(env, GETPC());
+        t.f128 =3D float128_snan_to_qnan(t.f128);
     }
=20
     helper_compute_fprf_float128(env, t.f128);
--=20
2.31.1


