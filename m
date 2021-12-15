Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68642475FBE
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 18:49:14 +0100 (CET)
Received: from localhost ([::1]:36010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxYOv-0001eK-67
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 12:49:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxXhz-0004RE-Q4; Wed, 15 Dec 2021 12:04:51 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:44444
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxXhx-0004cn-Kd; Wed, 15 Dec 2021 12:04:51 -0500
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BFGfa7F019462; 
 Wed, 15 Dec 2021 17:04:21 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cym1w0k2b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 17:04:20 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BFH42xT024542;
 Wed, 15 Dec 2021 17:04:19 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma05fra.de.ibm.com with ESMTP id 3cy78h78t7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 17:04:19 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1BFGuHWF49938794
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 16:56:17 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B9F664C040;
 Wed, 15 Dec 2021 17:04:16 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 89B414C05E;
 Wed, 15 Dec 2021 17:04:16 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 15 Dec 2021 17:04:16 +0000 (GMT)
Received: from yukon.home (unknown [9.171.19.61])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id D4009220295;
 Wed, 15 Dec 2021 18:04:15 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 032/102] target/ppc: Fix VXCVI return value
Date: Wed, 15 Dec 2021 18:02:47 +0100
Message-Id: <20211215170357.321643-20-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211215170357.321643-1-clg@kaod.org>
References: <20211215165847.321042-1-clg@kaod.org>
 <20211215170357.321643-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: -1obeDvxK6bEjDg2JRPgtHxzYv36dZzf
X-Proofpoint-GUID: -1obeDvxK6bEjDg2JRPgtHxzYv36dZzf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-15_10,2021-12-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=808 adultscore=0
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1034 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112150098
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.399,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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

We were returning nanval for any instance of invalid being set,
but that is an incorrect for VXCVI.  This failure can be seen
in the float_convs tests.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211119160502.17432-14-richard.henderson@linaro.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/fpu_helper.c | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index be460cc74451..d471a0a1b89b 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -585,13 +585,20 @@ float64 helper_fdiv(CPUPPCState *env, float64 arg1,=
 float64 arg2)
     return ret;
 }
=20
-static void float_invalid_cvt(CPUPPCState *env, int flags,
-                              bool set_fprc, uintptr_t retaddr)
-{
-    float_invalid_op_vxcvi(env, set_fprc, retaddr);
+static uint64_t float_invalid_cvt(CPUPPCState *env, int flags,
+                                  uint64_t ret, uint64_t ret_nan,
+                                  bool set_fprc, uintptr_t retaddr)
+{
+    /*
+     * VXCVI is different from most in that it sets two exception bits,
+     * VXCVI and VXSNAN for an SNaN input.
+     */
     if (flags & float_flag_invalid_snan) {
-        float_invalid_op_vxsnan(env, retaddr);
+        env->fpscr |=3D FP_VXSNAN;
     }
+    float_invalid_op_vxcvi(env, set_fprc, retaddr);
+
+    return flags & float_flag_invalid_cvti ? ret : ret_nan;
 }
=20
 #define FPU_FCTI(op, cvt, nanval)                                      \
@@ -599,10 +606,8 @@ uint64_t helper_##op(CPUPPCState *env, float64 arg) =
                   \
 {                                                                      \
     uint64_t ret =3D float64_to_##cvt(arg, &env->fp_status);            =
 \
     int flags =3D get_float_exception_flags(&env->fp_status);           =
 \
-                                                                       \
     if (unlikely(flags & float_flag_invalid)) {                        \
-        float_invalid_cvt(env, flags, 1, GETPC());                     \
-        ret =3D nanval;                                                 =
 \
+        ret =3D float_invalid_cvt(env, flags, ret, nanval, 1, GETPC()); =
 \
     }                                                                  \
     return ret;                                                        \
 }
@@ -2794,8 +2799,7 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, p=
pc_vsr_t *xb)             \
         t.tfld =3D stp##_to_##ttp##_round_to_zero(xb->sfld, &env->fp_sta=
tus);  \
         flags =3D env->fp_status.float_exception_flags;                 =
       \
         if (unlikely(flags & float_flag_invalid)) {                     =
     \
-            float_invalid_cvt(env, flags, 0, GETPC());                  =
     \
-            t.tfld =3D rnan;                                            =
       \
+            t.tfld =3D float_invalid_cvt(env, flags, t.tfld, rnan, 0, GE=
TPC());\
         }                                                               =
     \
         all_flags |=3D flags;                                           =
       \
     }                                                                   =
     \
@@ -2842,8 +2846,7 @@ void helper_##op(CPUPPCState *env, uint32_t opcode,=
                          \
     t.tfld =3D stp##_to_##ttp##_round_to_zero(xb->sfld, &env->fp_status)=
;      \
     flags =3D get_float_exception_flags(&env->fp_status);               =
       \
     if (flags & float_flag_invalid) {                                   =
     \
-        float_invalid_cvt(env, flags, 0, GETPC());                      =
     \
-        t.tfld =3D rnan;                                                =
       \
+        t.tfld =3D float_invalid_cvt(env, flags, t.tfld, rnan, 0, GETPC(=
));    \
     }                                                                   =
     \
                                                                         =
     \
     *xt =3D t;                                                          =
       \
--=20
2.31.1


