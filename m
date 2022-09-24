Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A11545E8D46
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Sep 2022 16:22:58 +0200 (CEST)
Received: from localhost ([::1]:33610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oc63V-00025s-8Y
	for lists+qemu-devel@lfdr.de; Sat, 24 Sep 2022 10:22:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oc5z1-0004nb-6C
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 10:18:19 -0400
Received: from mout.gmx.net ([212.227.15.19]:55851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oc5yz-0000XA-Bx
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 10:18:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1664029095;
 bh=OYML1eP6cdxRexl6JHswEdPWO+yQdYanHxQOR+3La1Q=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject;
 b=HTMEJRx7JGeYwhFaBc5E4MwNUxeRnFSDyN6+bMHYBF5JhZxDA1IsI7jW8tNMDoM8E
 Zq2PVTPDwbz317z2gbf3SLF+8t4CaUFBA74sfyIq2tQCt4K9GohQVLNgiP2YIoHBlJ
 HaYiMzQ5lxsTuDS+aBG8WgNgu4GHm/p8KOiRSuBU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100 ([92.116.155.187]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M2f5Z-1oXz7B3kMR-004BOP; Sat, 24
 Sep 2022 16:18:14 +0200
Date: Sat, 24 Sep 2022 16:18:13 +0200
From: Helge Deller <deller@gmx.de>
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Cc: Helge Deller <deller@gmx.de>
Subject: [RFC][PATCH] linux-user: Add guest memory layout to exception dump
Message-ID: <Yy8RpXdKvTjKMPzx@p100>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:ws4LOL8m+dUs/Jx/Oe8JvjrnPcE2Ca63kb2pf28fjsXEYu3fYuF
 DhaJdo3NMHD3yGZ5QarAYxk4I6pRQ6BUpHhjvBEv0dwskC1EDQ/HrkPKGDp1TOynY8evd1Z
 4sF5L3QexOFUe+1Fv9FGz9c/AVKjf1siQ5E7qiOMImdjlSKJ6Z16unsPOHeHg61l5zbdif9
 VG+MrOLG7CtvtJuLmYk0A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:qR5UbZ/Rk7E=:PIOKWEU1Q7JggjF60wU5sQ
 s9JZvIhPZmiXELmlN6eRUXy1RQvnPtU20yJT3NBdDjcKtRO5wGNZ1S6CybcoJopPp6I2/DEqH
 BPQf+EnWDiyUOeHBmntnyvgwhlqun0pP4t+0kE9PzANZ+a99HkQO98K5YlN2x0ww0KTuK8cxu
 UXxGXSSJjISVUAxGqfGFWQZMAjjAdLXbBoQMPmj3ry4UsGW6JuIL34ziTh7CRkkTEVBU0bw7Z
 mi7R+hMnrWSVpuwxfr4NdN0DTsqFhhkcGQdPeaKmZQA4dv+Jwna8uj1W7vVQdFOI5BAlv8GhH
 ncInPNLhX9vwzb+erSxxn2jrNvfGSkzgGZ8U887aP92FeYC4UrsMsZ7990hPo0CDwSm/2xbbZ
 iGDVUpKbImWHTMA6M8QHvBbD+ZmAA8F3fMvwvdzYCmyCiA0U4bPy2EnHfDPFXgBA4WZciJqvE
 bM7cUrC6+5CSAU95o4hbvbi/ZWcxpn/+9JbtgbgUnsM+AZVhvKrk5GxlmprCUUYEhTisd9RyZ
 ODoISd2zRdf2XPiOsygM6MOryvBWjNWGzlE6pb+zqMzQ7gMdtnjEEp1vvMiyKElFubSnm/iy3
 EKup4k8zZWxd65IALe+qTFw4JoBRBInx8CcwIME9aTLoVQGmWr9BTQXVo/xY2JmZ8inmZtnxL
 DpYHWMVnTXTyCFdV5/REwVHeBlfXib0NjfemIgINFWDijg8CC3GiKEAdomgjSxQzCrdiH2M3k
 GvWi95X1aGhDK1oKS6m4qc+QHkiY9GPqHVdoQ7553/X3s9G+d7qRjw7KDyI7EH1ARc99LPMKr
 7pQfrrj/YdzImgK78DAR33+edmZ7S9Uv07d6e9RqTvufBtPi/4i23sS9IOaTreiOaA1nxEWDk
 kcjpw+uggmMeTRubbvVdkfDNZtrYP5gFWQEllTlfP3mlVyvmdyAXsT2BVODPcarSpopyQaKN/
 pngZdsNwcJL8214yrHEvMNeyTdCK32KpZqQFEo6AxKiSxr8oQO123ikulkuSq5QGdG6qphv6p
 oTgtGJCL0NVrhBDv2bMIfGGgBI49/i8NyNAQ5rkOH1D7OhBZApJI0IJBRCeJ2wAdIMpdbiThN
 OFWgyVE3J1s5wVo209E7iTYKhuikireWp8IT9ZLMBGHDqTB2yTk1HpvrqUAKjYU/z4h9zB+Tr
 bil+awIhlZPEYFIpmKlDpv0ACL
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=212.227.15.19; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When the emulation stops with a hard exception it's very useful for
debugging purposes to dump the current guest memory layout (like
/proc/self/maps) beside the CPU registers.

The open_self_maps() function provides such a memory dump, but since
it's located in the syscall.c file various changes (add #includes, make
this function externally visible) are needed to call it from the
existing EXCP_DUMP() macro.

This patch takes another approach by un-macronizing EXCP_DUMP() and turn
it into a function inside syscall.c.
Beside a reduced code footprint this approach allows to use the same
functions to print to console and log file.

This patch applies on top of my previous patch series.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/linux-user/cpu_loop-common.h b/linux-user/cpu_loop-common.h
index 36ff5b14f2..0b26b56915 100644
=2D-- a/linux-user/cpu_loop-common.h
+++ b/linux-user/cpu_loop-common.h
@@ -23,18 +23,7 @@
 #include "exec/log.h"
 #include "special-errno.h"

-#define EXCP_DUMP(env, fmt, ...)                                        \
-do {                                                                    \
-    CPUState *cs =3D env_cpu(env);                                       =
 \
-    fprintf(stderr, fmt , ## __VA_ARGS__);                              \
-    fprintf(stderr, "Failing executable: %s\n", exec_path);             \
-    cpu_dump_state(cs, stderr, 0);                                      \
-    if (qemu_log_separate()) {                                          \
-        qemu_log(fmt, ## __VA_ARGS__);                                  \
-        qemu_log("Failing executable: %s\n", exec_path);                \
-        log_cpu_state(cs, 0);                                           \
-    }                                                                   \
-} while (0)
+void EXCP_DUMP(CPUArchState *env, const char *fmt, int code);

 void target_cpu_copy_regs(CPUArchState *env, struct target_pt_regs *regs)=
;
 #endif
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index d17f5d1c66..00861e9351 100644
=2D-- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -158,6 +158,7 @@
 #include "qapi/error.h"
 #include "fd-trans.h"
 #include "tcg/tcg.h"
+#include "cpu_loop-common.h"

 #ifndef CLONE_IO
 #define CLONE_IO                0x80000000      /* Clone io context */
@@ -8177,6 +8178,33 @@ static int is_proc_myself(const char *filename, con=
st char *entry)
     return 0;
 }

+static void excp_dump(FILE *logfile, CPUArchState *env,
+                      const char *fmt, int code)
+{
+    if (logfile) {
+        CPUState *cs =3D env_cpu(env);
+
+        fprintf(logfile, fmt, code);
+        fprintf(logfile, "Failing executable: %s\n", exec_path);
+        cpu_dump_state(cs, logfile, 0);
+        open_self_maps(env, fileno(logfile));
+    }
+}
+
+void EXCP_DUMP(CPUArchState *env, const char *fmt, int code)
+{
+    /* dump to console */
+    excp_dump(stderr, env, fmt, code);
+
+    /* dump to log file */
+    if (qemu_log_separate()) {
+        FILE *logfile =3D qemu_log_trylock();
+
+        excp_dump(logfile, env, fmt, code);
+        qemu_log_unlock(logfile);
+    }
+}
+
 #if HOST_BIG_ENDIAN !=3D TARGET_BIG_ENDIAN || \
     defined(TARGET_SPARC) || defined(TARGET_M68K) || defined(TARGET_HPPA)
 static int is_proc(const char *filename, const char *entry)

