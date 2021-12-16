Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D17AC477E7F
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 22:11:58 +0100 (CET)
Received: from localhost ([::1]:55798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxy2f-0000EC-Ud
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 16:11:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxxLV-0002Vp-Ga; Thu, 16 Dec 2021 15:27:21 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:18228)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxxLL-0007N2-HL; Thu, 16 Dec 2021 15:27:21 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BGK3bR0017574; 
 Thu, 16 Dec 2021 20:26:47 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cynfwpc01-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Dec 2021 20:26:46 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BGKDDn1004788;
 Thu, 16 Dec 2021 20:26:44 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03ams.nl.ibm.com with ESMTP id 3cy7jravw1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Dec 2021 20:26:44 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BGKQfxZ46137654
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Dec 2021 20:26:42 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CB80BA405C;
 Thu, 16 Dec 2021 20:26:41 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 91D6CA4054;
 Thu, 16 Dec 2021 20:26:41 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu, 16 Dec 2021 20:26:41 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.48.122])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id EA61F2201A0;
 Thu, 16 Dec 2021 21:26:40 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 036/101] target/ppc: Clean up do_fri
Date: Thu, 16 Dec 2021 21:25:09 +0100
Message-Id: <20211216202614.414266-37-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211216202614.414266-1-clg@kaod.org>
References: <20211216202614.414266-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 6Dt1WXtoT5OnXeoZ5t9Swl_vlBXg3cw5
X-Proofpoint-ORIG-GUID: 6Dt1WXtoT5OnXeoZ5t9Swl_vlBXg3cw5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-16_08,2021-12-16_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1034 mlxscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 mlxlogscore=511 malwarescore=0
 suspectscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2112160109
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

Let float64_round_to_int detect and silence snans.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211119160502.17432-18-richard.henderson@linaro.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/fpu_helper.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index d4f72c296fad..7716bb15b1d2 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -644,25 +644,23 @@ FPU_FCFI(fcfidus, uint64_to_float32, 1)
 static uint64_t do_fri(CPUPPCState *env, uint64_t arg,
                        FloatRoundMode rounding_mode)
 {
-    CPU_DoubleU farg;
     FloatRoundMode old_rounding_mode =3D get_float_rounding_mode(&env->f=
p_status);
+    int flags;
=20
-    farg.ll =3D arg;
+    set_float_rounding_mode(rounding_mode, &env->fp_status);
+    arg =3D float64_round_to_int(arg, &env->fp_status);
+    set_float_rounding_mode(old_rounding_mode, &env->fp_status);
=20
-    if (unlikely(float64_is_signaling_nan(farg.d, &env->fp_status))) {
-        /* sNaN round */
+    flags =3D get_float_exception_flags(&env->fp_status);
+    if (flags & float_flag_invalid_snan) {
         float_invalid_op_vxsnan(env, GETPC());
-        farg.ll =3D arg | 0x0008000000000000ULL;
-    } else {
-        set_float_rounding_mode(rounding_mode, &env->fp_status);
-        farg.ll =3D float64_round_to_int(farg.d, &env->fp_status);
-        set_float_rounding_mode(old_rounding_mode, &env->fp_status);
-
-        /* fri* does not set FPSCR[XX] */
-        env->fp_status.float_exception_flags &=3D ~float_flag_inexact;
     }
+
+    /* fri* does not set FPSCR[XX] */
+    set_float_exception_flags(flags & ~float_flag_inexact, &env->fp_stat=
us);
     do_float_check_status(env, GETPC());
-    return farg.ll;
+
+    return arg;
 }
=20
 uint64_t helper_frin(CPUPPCState *env, uint64_t arg)
--=20
2.31.1


