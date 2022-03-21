Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62DCF4E20B9
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 07:54:02 +0100 (CET)
Received: from localhost ([::1]:44470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWBvV-0006BZ-C1
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 02:54:01 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nWBnH-0002q1-H8; Mon, 21 Mar 2022 02:45:35 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:21890
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nWBnF-0006so-Ps; Mon, 21 Mar 2022 02:45:31 -0400
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22L6amN9016894; 
 Mon, 21 Mar 2022 06:45:06 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3exf1umkry-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Mar 2022 06:45:06 +0000
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22L6eJaA006335;
 Mon, 21 Mar 2022 06:45:05 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3exf1umkrf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Mar 2022 06:45:05 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22L6gahJ011809;
 Mon, 21 Mar 2022 06:45:03 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma02fra.de.ibm.com with ESMTP id 3ew6t8jr41-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Mar 2022 06:45:03 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22L6j1aZ29360524
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 21 Mar 2022 06:45:01 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3A7D1A404D;
 Mon, 21 Mar 2022 06:45:01 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E13FFA4055;
 Mon, 21 Mar 2022 06:45:00 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon, 21 Mar 2022 06:45:00 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.82.112])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 1BDF5220383;
 Mon, 21 Mar 2022 07:45:00 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 1/3] ppc64: Avoid pt_regs struct definition
Date: Mon, 21 Mar 2022 07:44:56 +0100
Message-Id: <20220321064458.1517999-2-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220321064458.1517999-1-clg@kaod.org>
References: <20220321064458.1517999-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: g7MgO0onKv9n0YTShH86etVYcxMLrOKL
X-Proofpoint-GUID: UCApIzt-P9mOn0WEOe0EJ8rZUsktZXwC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-21_02,2022-03-15_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=727
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 mlxscore=0 malwarescore=0 clxscore=1034
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203210042
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.187,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Khem Raj <raj.khem@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Khem Raj <raj.khem@gmail.com>

Remove pt_regs indirection and instead reference gp_regs directly, this
makes it portable across musl/glibc

Use PT_* constants defined in asm/ptrace.h

Move the file to ppc64 subdir and leave ppc empty

Fixes
../qemu-6.2.0/linux-user/host/ppc64/../ppc/host-signal.h:16:32: error: in=
complete definition of type 'struct pt_regs'
    return uc->uc_mcontext.regs->nip;
           ~~~~~~~~~~~~~~~~~~~~^

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Cc: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220315015740.847370-1-raj.khem@gmail.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 linux-user/include/host/ppc/host-signal.h   | 38 -------------------
 linux-user/include/host/ppc64/host-signal.h | 42 ++++++++++++++++++++-
 2 files changed, 41 insertions(+), 39 deletions(-)
 delete mode 100644 linux-user/include/host/ppc/host-signal.h

diff --git a/linux-user/include/host/ppc/host-signal.h b/linux-user/inclu=
de/host/ppc/host-signal.h
deleted file mode 100644
index b80384d1356d..000000000000
--- a/linux-user/include/host/ppc/host-signal.h
+++ /dev/null
@@ -1,38 +0,0 @@
-/*
- * host-signal.h: signal info dependent on the host architecture
- *
- * Copyright (c) 2003-2005 Fabrice Bellard
- * Copyright (c) 2021 Linaro Limited
- *
- * This work is licensed under the terms of the GNU LGPL, version 2.1 or=
 later.
- * See the COPYING file in the top-level directory.
- */
-
-#ifndef PPC_HOST_SIGNAL_H
-#define PPC_HOST_SIGNAL_H
-
-/* The third argument to a SA_SIGINFO handler is ucontext_t. */
-typedef ucontext_t host_sigcontext;
-
-static inline uintptr_t host_signal_pc(host_sigcontext *uc)
-{
-    return uc->uc_mcontext.regs->nip;
-}
-
-static inline void host_signal_set_pc(host_sigcontext *uc, uintptr_t pc)
-{
-    uc->uc_mcontext.regs->nip =3D pc;
-}
-
-static inline void *host_signal_mask(host_sigcontext *uc)
-{
-    return &uc->uc_sigmask;
-}
-
-static inline bool host_signal_write(siginfo_t *info, host_sigcontext *u=
c)
-{
-    return uc->uc_mcontext.regs->trap !=3D 0x400
-        && (uc->uc_mcontext.regs->dsisr & 0x02000000);
-}
-
-#endif
diff --git a/linux-user/include/host/ppc64/host-signal.h b/linux-user/inc=
lude/host/ppc64/host-signal.h
index a353c22a908c..c4ea86647291 100644
--- a/linux-user/include/host/ppc64/host-signal.h
+++ b/linux-user/include/host/ppc64/host-signal.h
@@ -1 +1,41 @@
-#include "../ppc/host-signal.h"
+/*
+ * host-signal.h: signal info dependent on the host architecture
+ *
+ * Copyright (c) 2003-2005 Fabrice Bellard
+ * Copyright (c) 2021 Linaro Limited
+ *
+ * This work is licensed under the terms of the GNU LGPL, version 2.1 or=
 later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef PPC_HOST_SIGNAL_H
+#define PPC_HOST_SIGNAL_H
+
+/* Needed for PT_* constants */
+#include <asm/ptrace.h>
+
+/* The third argument to a SA_SIGINFO handler is ucontext_t. */
+typedef ucontext_t host_sigcontext;
+
+static inline uintptr_t host_signal_pc(host_sigcontext *uc)
+{
+    return uc->uc_mcontext.gp_regs[PT_NIP];
+}
+
+static inline void host_signal_set_pc(host_sigcontext *uc, uintptr_t pc)
+{
+    uc->uc_mcontext.gp_regs[PT_NIP] =3D pc;
+}
+
+static inline void *host_signal_mask(host_sigcontext *uc)
+{
+    return &uc->uc_sigmask;
+}
+
+static inline bool host_signal_write(siginfo_t *info, host_sigcontext *u=
c)
+{
+    return uc->uc_mcontext.gp_regs[PT_TRAP] !=3D 0x400
+        && (uc->uc_mcontext.gp_regs[PT_DSISR] & 0x02000000);
+}
+
+#endif
--=20
2.34.1


