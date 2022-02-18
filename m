Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1724BB735
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 11:47:56 +0100 (CET)
Received: from localhost ([::1]:47480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nL0nr-0003Tz-5f
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 05:47:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nL0fP-00011V-MD; Fri, 18 Feb 2022 05:39:14 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:9262
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nL0fN-0005hq-3q; Fri, 18 Feb 2022 05:39:11 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21IAH4Z8011857; 
 Fri, 18 Feb 2022 10:38:59 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ea9jqgdhk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Feb 2022 10:38:59 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21IAc5rL006016;
 Fri, 18 Feb 2022 10:38:57 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06fra.de.ibm.com with ESMTP id 3e645kes7a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Feb 2022 10:38:57 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21IActRr43581846
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Feb 2022 10:38:55 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4E8C1AE057;
 Fri, 18 Feb 2022 10:38:55 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 14C70AE051;
 Fri, 18 Feb 2022 10:38:55 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri, 18 Feb 2022 10:38:55 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.87.94])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 5B463220294;
 Fri, 18 Feb 2022 11:38:54 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 37/39] target/ppc: cpu_init: Move SPR registration macros to a
 header
Date: Fri, 18 Feb 2022 11:38:25 +0100
Message-Id: <20220218103827.682032-38-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220218103827.682032-1-clg@kaod.org>
References: <20220218103827.682032-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: iLqRxozc1pOhqc-4I-tFfatNd4IpnOpM
X-Proofpoint-ORIG-GUID: iLqRxozc1pOhqc-4I-tFfatNd4IpnOpM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-18_04,2022-02-18_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1034 malwarescore=0
 spamscore=0 phishscore=0 mlxlogscore=999 mlxscore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202180067
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

Put the SPR registration macros in a header that is accessible outside
of cpu_init.c. The following patches will move CPU-specific code to
separate files and will need to access it.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Message-Id: <20220216162426.1885923-26-farosas@linux.ibm.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/spr_common.h | 56 +++++++++++++++++++++++++++++++++++
 target/ppc/cpu_init.c   | 65 ++++++-----------------------------------
 2 files changed, 65 insertions(+), 56 deletions(-)

diff --git a/target/ppc/spr_common.h b/target/ppc/spr_common.h
index 329b7e91a23a..a243c14a11d9 100644
--- a/target/ppc/spr_common.h
+++ b/target/ppc/spr_common.h
@@ -21,6 +21,62 @@
=20
 #define SPR_NOACCESS (&spr_noaccess)
=20
+#ifdef CONFIG_TCG
+# define USR_ARG(X)    X,
+# ifdef CONFIG_USER_ONLY
+#  define SYS_ARG(X)
+# else
+#  define SYS_ARG(X)   X,
+# endif
+#else
+# define USR_ARG(X)
+# define SYS_ARG(X)
+#endif
+#ifdef CONFIG_KVM
+# define KVM_ARG(X)    X,
+#else
+# define KVM_ARG(X)
+#endif
+
+typedef void spr_callback(DisasContext *, int, int);
+
+void _spr_register(CPUPPCState *env, int num, const char *name,
+                   USR_ARG(spr_callback *uea_read)
+                   USR_ARG(spr_callback *uea_write)
+                   SYS_ARG(spr_callback *oea_read)
+                   SYS_ARG(spr_callback *oea_write)
+                   SYS_ARG(spr_callback *hea_read)
+                   SYS_ARG(spr_callback *hea_write)
+                   KVM_ARG(uint64_t one_reg_id)
+                   target_ulong initial_value);
+
+/* spr_register_kvm_hv passes all required arguments. */
+#define spr_register_kvm_hv(env, num, name, uea_read, uea_write,        =
     \
+                            oea_read, oea_write, hea_read, hea_write,   =
     \
+                            one_reg_id, initial_value)                  =
     \
+    _spr_register(env, num, name,                                       =
     \
+                  USR_ARG(uea_read) USR_ARG(uea_write)                  =
     \
+                  SYS_ARG(oea_read) SYS_ARG(oea_write)                  =
     \
+                  SYS_ARG(hea_read) SYS_ARG(hea_write)                  =
     \
+                  KVM_ARG(one_reg_id) initial_value)
+
+/* spr_register_kvm duplicates the oea callbacks to the hea callbacks. *=
/
+#define spr_register_kvm(env, num, name, uea_read, uea_write,           =
     \
+                         oea_read, oea_write, one_reg_id, ival)         =
     \
+    spr_register_kvm_hv(env, num, name, uea_read, uea_write, oea_read,  =
     \
+                        oea_write, oea_read, oea_write, one_reg_id, ival=
)
+
+/* spr_register_hv and spr_register are similar, except there is no kvm =
id. */
+#define spr_register_hv(env, num, name, uea_read, uea_write,            =
     \
+                        oea_read, oea_write, hea_read, hea_write, ival) =
     \
+    spr_register_kvm_hv(env, num, name, uea_read, uea_write, oea_read,  =
     \
+                        oea_write, hea_read, hea_write, 0, ival)
+
+#define spr_register(env, num, name, uea_read, uea_write,               =
     \
+                     oea_read, oea_write, ival)                         =
     \
+    spr_register_kvm(env, num, name, uea_read, uea_write,               =
     \
+                     oea_read, oea_write, 0, ival)
+
 /* prototypes for readers and writers for SPRs */
 void spr_noaccess(DisasContext *ctx, int gprn, int sprn);
 void spr_read_generic(DisasContext *ctx, int gprn, int sprn);
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 40dd2c0fd813..c17994ec5876 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -67,35 +67,15 @@ static inline void vscr_init(CPUPPCState *env, uint32=
_t val)
  * may be compiled out, and the system kvm header may not be available
  * for supplying the ID numbers.  This is ugly, but the best we can do.
  */
-
-#ifdef CONFIG_TCG
-# define USR_ARG(X)    X,
-# ifdef CONFIG_USER_ONLY
-#  define SYS_ARG(X)
-# else
-#  define SYS_ARG(X)   X,
-# endif
-#else
-# define USR_ARG(X)
-# define SYS_ARG(X)
-#endif
-#ifdef CONFIG_KVM
-# define KVM_ARG(X)    X,
-#else
-# define KVM_ARG(X)
-#endif
-
-typedef void spr_callback(DisasContext *, int, int);
-
-static void _spr_register(CPUPPCState *env, int num, const char *name,
-                          USR_ARG(spr_callback *uea_read)
-                          USR_ARG(spr_callback *uea_write)
-                          SYS_ARG(spr_callback *oea_read)
-                          SYS_ARG(spr_callback *oea_write)
-                          SYS_ARG(spr_callback *hea_read)
-                          SYS_ARG(spr_callback *hea_write)
-                          KVM_ARG(uint64_t one_reg_id)
-                          target_ulong initial_value)
+void _spr_register(CPUPPCState *env, int num, const char *name,
+                   USR_ARG(spr_callback *uea_read)
+                   USR_ARG(spr_callback *uea_write)
+                   SYS_ARG(spr_callback *oea_read)
+                   SYS_ARG(spr_callback *oea_write)
+                   SYS_ARG(spr_callback *hea_read)
+                   SYS_ARG(spr_callback *hea_write)
+                   KVM_ARG(uint64_t one_reg_id)
+                   target_ulong initial_value)
 {
     ppc_spr_t *spr =3D &env->spr_cb[num];
=20
@@ -122,33 +102,6 @@ static void _spr_register(CPUPPCState *env, int num,=
 const char *name,
 #endif
 }
=20
-/* spr_register_kvm_hv passes all required arguments. */
-#define spr_register_kvm_hv(env, num, name, uea_read, uea_write,        =
     \
-                            oea_read, oea_write, hea_read, hea_write,   =
     \
-                            one_reg_id, initial_value)                  =
     \
-    _spr_register(env, num, name,                                       =
     \
-                  USR_ARG(uea_read) USR_ARG(uea_write)                  =
     \
-                  SYS_ARG(oea_read) SYS_ARG(oea_write)                  =
     \
-                  SYS_ARG(hea_read) SYS_ARG(hea_write)                  =
     \
-                  KVM_ARG(one_reg_id) initial_value)
-
-/* spr_register_kvm duplicates the oea callbacks to the hea callbacks. *=
/
-#define spr_register_kvm(env, num, name, uea_read, uea_write,           =
     \
-                         oea_read, oea_write, one_reg_id, ival)         =
     \
-    spr_register_kvm_hv(env, num, name, uea_read, uea_write, oea_read,  =
     \
-                        oea_write, oea_read, oea_write, one_reg_id, ival=
)
-
-/* spr_register_hv and spr_register are similar, except there is no kvm =
id. */
-#define spr_register_hv(env, num, name, uea_read, uea_write,            =
     \
-                        oea_read, oea_write, hea_read, hea_write, ival) =
     \
-    spr_register_kvm_hv(env, num, name, uea_read, uea_write, oea_read,  =
     \
-                        oea_write, hea_read, hea_write, 0, ival)
-
-#define spr_register(env, num, name, uea_read, uea_write,               =
     \
-                     oea_read, oea_write, ival)                         =
     \
-    spr_register_kvm(env, num, name, uea_read, uea_write,               =
     \
-                     oea_read, oea_write, 0, ival)
-
 /* Generic PowerPC SPRs */
 static void register_generic_sprs(PowerPCCPU *cpu)
 {
--=20
2.34.1


