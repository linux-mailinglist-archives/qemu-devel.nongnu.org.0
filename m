Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7AF475E7B
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 18:22:56 +0100 (CET)
Received: from localhost ([::1]:37972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxXzT-0004Ag-Es
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 12:22:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mxXcQ-0005Lf-Ko
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 11:59:06 -0500
Received: from smtpout3.mo529.mail-out.ovh.net ([46.105.54.81]:41065)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mxXcG-0003U5-TS
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 11:59:06 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.62])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id BC5BDD22657D;
 Wed, 15 Dec 2021 17:58:54 +0100 (CET)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 15 Dec
 2021 17:58:54 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G0016449e6e2-00ec-4fa1-b4a5-a3fc78145e78,
 DB2000250E14A505ED1736C7348301D5E40ED0AA) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.76.172.47
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: <qemu-ppc@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [PULL 004/102] test/tcg/ppc64le: test mtfsf
Date: Wed, 15 Dec 2021 17:57:09 +0100
Message-ID: <20211215165847.321042-5-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211215165847.321042-1-clg@kaod.org>
References: <20211215165847.321042-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: ba9db1e9-8d1b-4ad9-8b49-e6bfd4345aea
X-Ovh-Tracer-Id: 2219711670442625830
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrledvgdeljecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout3.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
Message-Id: <20211201163808.440385-3-lucas.araujo@eldorado.org.br>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
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
+#define FPSCR_VE     7  /* Floating-point invalid operation exception enable */
+#define FPSCR_VXSOFT 10 /* Floating-point invalid operation exception (soft) */
+#define FPSCR_FI     17 /* Floating-point fraction inexact                   */
+
+#define FP_VE           (1ull << FPSCR_VE)
+#define FP_VXSOFT       (1ull << FPSCR_VXSOFT)
+#define FP_FI           (1ull << FPSCR_FI)
+
+void sigfpe_handler(int sig, siginfo_t *si, void *ucontext)
+{
+    if (si->si_code == FPE_FLTINV) {
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
+    struct sigaction sa = {
+        .sa_sigaction = sigfpe_handler,
+        .sa_flags = SA_SIGINFO
+    };
+
+    /*
+     * Enable the MSR bits F0 and F1 to enable exceptions.
+     * This shouldn't be needed in linux-user as these bits are enabled by
+     * default, but this allows to execute either in a VM or a real machine
+     * to compare the behaviors.
+     */
+    prctl(PR_SET_FPEXC, PR_FP_EXC_PRECISE);
+
+    /* First test if the FI bit is being set correctly */
+    fpscr.ll = FP_FI;
+    __builtin_mtfsf(0b11111111, fpscr.d);
+    fpscr.d = __builtin_mffs();
+    assert((fpscr.ll & FP_FI) != 0);
+
+    /* Then test if the deferred exception is being called correctly */
+    sigaction(SIGFPE, &sa, NULL);
+
+    /*
+     * Although the VXSOFT exception has been chosen, based on test in a Power9
+     * any combination of exception bit + its enabling bit should work.
+     * But if a different exception is chosen si_code check should
+     * change accordingly.
+     */
+    fpscr.ll = FP_VE | FP_VXSOFT;
+    __builtin_mtfsf(0b11111111, fpscr.d);
+
+    return 1;
+}
diff --git a/tests/tcg/ppc64/Makefile.target b/tests/tcg/ppc64/Makefile.target
index 6ab7934fdff9..8f4c7ac4ed7d 100644
--- a/tests/tcg/ppc64/Makefile.target
+++ b/tests/tcg/ppc64/Makefile.target
@@ -11,6 +11,7 @@ endif
 bcdsub: CFLAGS += -mpower8-vector
 
 PPC64_TESTS += byte_reverse
+PPC64_TESTS += mtfsf
 ifneq ($(DOCKER_IMAGE)$(CROSS_CC_HAS_POWER10),)
 run-byte_reverse: QEMU_OPTS+=-cpu POWER10
 run-plugin-byte_reverse-with-%: QEMU_OPTS+=-cpu POWER10
diff --git a/tests/tcg/ppc64le/Makefile.target b/tests/tcg/ppc64le/Makefile.target
index ba2fde5ff1c3..e031f65adcb3 100644
--- a/tests/tcg/ppc64le/Makefile.target
+++ b/tests/tcg/ppc64le/Makefile.target
@@ -16,6 +16,7 @@ byte_reverse: CFLAGS += -mcpu=power10
 run-byte_reverse: QEMU_OPTS+=-cpu POWER10
 run-plugin-byte_reverse-with-%: QEMU_OPTS+=-cpu POWER10
 
+PPC64LE_TESTS += mtfsf
 PPC64LE_TESTS += signal_save_restore_xer
 
 TESTS += $(PPC64LE_TESTS)
-- 
2.31.1


