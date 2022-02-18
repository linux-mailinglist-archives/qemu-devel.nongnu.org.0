Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 171724BB7EC
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 12:18:39 +0100 (CET)
Received: from localhost ([::1]:43616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nL1Ha-0007E5-5b
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 06:18:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nL0fr-0001Ec-M4; Fri, 18 Feb 2022 05:39:39 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:2522
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nL0fj-0005kD-MS; Fri, 18 Feb 2022 05:39:39 -0500
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21I8b7g8022381; 
 Fri, 18 Feb 2022 10:39:00 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ea55jp8mt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Feb 2022 10:39:00 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21IAbttw004784;
 Fri, 18 Feb 2022 10:38:58 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03ams.nl.ibm.com with ESMTP id 3e64has7xx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Feb 2022 10:38:58 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21IAcuMR29950238
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Feb 2022 10:38:56 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 05CD64C07A;
 Fri, 18 Feb 2022 10:38:56 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B5E684C072;
 Fri, 18 Feb 2022 10:38:55 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri, 18 Feb 2022 10:38:55 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.87.94])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 0679D2201F1;
 Fri, 18 Feb 2022 11:38:54 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 38/39] target/ppc: cpu_init: Move check_pow and QOM macros to a
 header
Date: Fri, 18 Feb 2022 11:38:26 +0100
Message-Id: <20220218103827.682032-39-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220218103827.682032-1-clg@kaod.org>
References: <20220218103827.682032-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: dtPvo41czHaRk4JOVPbJjumg_ziHMDrl
X-Proofpoint-ORIG-GUID: dtPvo41czHaRk4JOVPbJjumg_ziHMDrl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-18_04,2022-02-18_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999
 priorityscore=1501 spamscore=0 mlxscore=0 phishscore=0 clxscore=1034
 suspectscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2201110000 definitions=main-2202180067
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
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Fabiano Rosas <farosas@linux.ibm.com>

These will need to be accessed from other files once we move the CPUs
code to separate files.

The check_pow_hid0 and check_pow_hid0_74xx are too specific to be
moved to a header so I'll deal with them later when splitting this
code between the multiple CPU families.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Message-Id: <20220216162426.1885923-27-farosas@linux.ibm.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/cpu.h      | 39 +++++++++++++++++++++++++++++++++++++++
 target/ppc/cpu_init.c | 37 -------------------------------------
 2 files changed, 39 insertions(+), 37 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 2baa750729fd..5b01d409b31a 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -2732,4 +2732,43 @@ void dump_mmu(CPUPPCState *env);
 void ppc_maybe_bswap_register(CPUPPCState *env, uint8_t *mem_buf, int le=
n);
 void ppc_store_vscr(CPUPPCState *env, uint32_t vscr);
 uint32_t ppc_get_vscr(CPUPPCState *env);
+
+/***********************************************************************=
******/
+/* Power management enable checks                                       =
     */
+static inline int check_pow_none(CPUPPCState *env)
+{
+    return 0;
+}
+
+static inline int check_pow_nocheck(CPUPPCState *env)
+{
+    return 1;
+}
+
+/***********************************************************************=
******/
+/* PowerPC implementations definitions                                  =
     */
+
+#define POWERPC_FAMILY(_name)                                           =
    \
+    static void                                                         =
    \
+    glue(glue(ppc_, _name), _cpu_family_class_init)(ObjectClass *, void =
*); \
+                                                                        =
    \
+    static const TypeInfo                                               =
    \
+    glue(glue(ppc_, _name), _cpu_family_type_info) =3D {                =
      \
+        .name =3D stringify(_name) "-family-" TYPE_POWERPC_CPU,         =
      \
+        .parent =3D TYPE_POWERPC_CPU,                                   =
      \
+        .abstract =3D true,                                             =
      \
+        .class_init =3D glue(glue(ppc_, _name), _cpu_family_class_init),=
      \
+    };                                                                  =
    \
+                                                                        =
    \
+    static void glue(glue(ppc_, _name), _cpu_family_register_types)(void=
)   \
+    {                                                                   =
    \
+        type_register_static(                                           =
    \
+            &glue(glue(ppc_, _name), _cpu_family_type_info));           =
    \
+    }                                                                   =
    \
+                                                                        =
    \
+    type_init(glue(glue(ppc_, _name), _cpu_family_register_types))      =
    \
+                                                                        =
    \
+    static void glue(glue(ppc_, _name), _cpu_family_class_init)
+
+
 #endif /* PPC_CPU_H */
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index c17994ec5876..a435525ea32f 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -2480,18 +2480,6 @@ static void init_excp_POWER10(CPUPPCState *env)
=20
 #endif
=20
-/***********************************************************************=
******/
-/* Power management enable checks                                       =
     */
-static int check_pow_none(CPUPPCState *env)
-{
-    return 0;
-}
-
-static int check_pow_nocheck(CPUPPCState *env)
-{
-    return 1;
-}
-
 static int check_pow_hid0(CPUPPCState *env)
 {
     if (env->spr[SPR_HID0] & 0x00E00000) {
@@ -2510,31 +2498,6 @@ static int check_pow_hid0_74xx(CPUPPCState *env)
     return 0;
 }
=20
-/***********************************************************************=
******/
-/* PowerPC implementations definitions                                  =
     */
-
-#define POWERPC_FAMILY(_name)                                           =
    \
-    static void                                                         =
    \
-    glue(glue(ppc_, _name), _cpu_family_class_init)(ObjectClass *, void =
*); \
-                                                                        =
    \
-    static const TypeInfo                                               =
    \
-    glue(glue(ppc_, _name), _cpu_family_type_info) =3D {                =
      \
-        .name =3D stringify(_name) "-family-" TYPE_POWERPC_CPU,         =
      \
-        .parent =3D TYPE_POWERPC_CPU,                                   =
      \
-        .abstract =3D true,                                             =
      \
-        .class_init =3D glue(glue(ppc_, _name), _cpu_family_class_init),=
      \
-    };                                                                  =
    \
-                                                                        =
    \
-    static void glue(glue(ppc_, _name), _cpu_family_register_types)(void=
)   \
-    {                                                                   =
    \
-        type_register_static(                                           =
    \
-            &glue(glue(ppc_, _name), _cpu_family_type_info));           =
    \
-    }                                                                   =
    \
-                                                                        =
    \
-    type_init(glue(glue(ppc_, _name), _cpu_family_register_types))      =
    \
-                                                                        =
    \
-    static void glue(glue(ppc_, _name), _cpu_family_class_init)
-
 static void init_proc_405(CPUPPCState *env)
 {
     register_40x_sprs(env);
--=20
2.34.1


