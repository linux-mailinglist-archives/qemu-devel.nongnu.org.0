Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4335C477DAE
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 21:33:29 +0100 (CET)
Received: from localhost ([::1]:58070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxxRQ-0003Oj-Bl
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 15:33:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxxKq-00019J-2C; Thu, 16 Dec 2021 15:26:40 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:42286
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxxKo-0007HN-4M; Thu, 16 Dec 2021 15:26:39 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BGJu3wf005095; 
 Thu, 16 Dec 2021 20:26:25 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cye12hs1m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Dec 2021 20:26:24 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BGKDDmo004788;
 Thu, 16 Dec 2021 20:26:23 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03ams.nl.ibm.com with ESMTP id 3cy7jravuj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Dec 2021 20:26:22 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BGKQKs344499374
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Dec 2021 20:26:20 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8C23B11C04A;
 Thu, 16 Dec 2021 20:26:20 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4B87F11C052;
 Thu, 16 Dec 2021 20:26:20 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu, 16 Dec 2021 20:26:20 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.48.122])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 92BB22201A0;
 Thu, 16 Dec 2021 21:26:19 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 004/101] test/tcg/ppc64le: test mtfsf
Date: Thu, 16 Dec 2021 21:24:37 +0100
Message-Id: <20211216202614.414266-5-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211216202614.414266-1-clg@kaod.org>
References: <20211216202614.414266-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ezGb3fZKkwKX_pQjXay3arNS_c5npvkG
X-Proofpoint-ORIG-GUID: ezGb3fZKkwKX_pQjXay3arNS_c5npvkG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-16_08,2021-12-16_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0 clxscore=1034
 adultscore=0 mlxscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 mlxlogscore=409 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112160109
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.399,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
 "Lucas Mateus Castro \(alqotel\)" <lucas.araujo@eldorado.org.br>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>

Added tests for the mtfsf to check if FI bit of FPSCR is being set
and if exception calls are being made correctly.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.b=
r>
Message-Id: <20211201163808.440385-3-lucas.araujo@eldorado.org.br>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 tests/tcg/ppc64le/mtfsf.c         | 61 +++++++++++++++++++++++++++++++
 tests/tcg/ppc64/Makefile.target   |  1 +
 tests/tcg/ppc64le/Makefile.target |  1 +
 3 files changed, 63 insertions(+)
 create mode 100644 tests/tcg/ppc64le/mtfsf.c

diff --git a/tests/tcg/ppc64le/mtfsf.c b/tests/tcg/ppc64le/mtfsf.c
new file mode 100644
index 000000000000..b3d31f3637d9
--- /dev/null
+++ b/tests/tcg/ppc64le/mtfsf.c
@@ -0,0 +1,61 @@
+#include <stdlib.h>
+#include <assert.h>
+#include <signal.h>
+#include <sys/prctl.h>
+
+#define FPSCR_VE     7  /* Floating-point invalid operation exception en=
able */
+#define FPSCR_VXSOFT 10 /* Floating-point invalid operation exception (s=
oft) */
+#define FPSCR_FI     17 /* Floating-point fraction inexact              =
     */
+
+#define FP_VE           (1ull << FPSCR_VE)
+#define FP_VXSOFT       (1ull << FPSCR_VXSOFT)
+#define FP_FI           (1ull << FPSCR_FI)
+
+void sigfpe_handler(int sig, siginfo_t *si, void *ucontext)
+{
+    if (si->si_code =3D=3D FPE_FLTINV) {
+        exit(0);
+    }
+    exit(1);
+}
+
+int main(void)
+{
+    union {
+        double d;
+        long long ll;
+    } fpscr;
+
+    struct sigaction sa =3D {
+        .sa_sigaction =3D sigfpe_handler,
+        .sa_flags =3D SA_SIGINFO
+    };
+
+    /*
+     * Enable the MSR bits F0 and F1 to enable exceptions.
+     * This shouldn't be needed in linux-user as these bits are enabled =
by
+     * default, but this allows to execute either in a VM or a real mach=
ine
+     * to compare the behaviors.
+     */
+    prctl(PR_SET_FPEXC, PR_FP_EXC_PRECISE);
+
+    /* First test if the FI bit is being set correctly */
+    fpscr.ll =3D FP_FI;
+    __builtin_mtfsf(0b11111111, fpscr.d);
+    fpscr.d =3D __builtin_mffs();
+    assert((fpscr.ll & FP_FI) !=3D 0);
+
+    /* Then test if the deferred exception is being called correctly */
+    sigaction(SIGFPE, &sa, NULL);
+
+    /*
+     * Although the VXSOFT exception has been chosen, based on test in a=
 Power9
+     * any combination of exception bit + its enabling bit should work.
+     * But if a different exception is chosen si_code check should
+     * change accordingly.
+     */
+    fpscr.ll =3D FP_VE | FP_VXSOFT;
+    __builtin_mtfsf(0b11111111, fpscr.d);
+
+    return 1;
+}
diff --git a/tests/tcg/ppc64/Makefile.target b/tests/tcg/ppc64/Makefile.t=
arget
index 6ab7934fdff9..8f4c7ac4ed7d 100644
--- a/tests/tcg/ppc64/Makefile.target
+++ b/tests/tcg/ppc64/Makefile.target
@@ -11,6 +11,7 @@ endif
 bcdsub: CFLAGS +=3D -mpower8-vector
=20
 PPC64_TESTS +=3D byte_reverse
+PPC64_TESTS +=3D mtfsf
 ifneq ($(DOCKER_IMAGE)$(CROSS_CC_HAS_POWER10),)
 run-byte_reverse: QEMU_OPTS+=3D-cpu POWER10
 run-plugin-byte_reverse-with-%: QEMU_OPTS+=3D-cpu POWER10
diff --git a/tests/tcg/ppc64le/Makefile.target b/tests/tcg/ppc64le/Makefi=
le.target
index ba2fde5ff1c3..e031f65adcb3 100644
--- a/tests/tcg/ppc64le/Makefile.target
+++ b/tests/tcg/ppc64le/Makefile.target
@@ -16,6 +16,7 @@ byte_reverse: CFLAGS +=3D -mcpu=3Dpower10
 run-byte_reverse: QEMU_OPTS+=3D-cpu POWER10
 run-plugin-byte_reverse-with-%: QEMU_OPTS+=3D-cpu POWER10
=20
+PPC64LE_TESTS +=3D mtfsf
 PPC64LE_TESTS +=3D signal_save_restore_xer
=20
 TESTS +=3D $(PPC64LE_TESTS)
--=20
2.31.1


