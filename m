Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 780BC92338
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Aug 2019 14:15:01 +0200 (CEST)
Received: from localhost ([::1]:48972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hzgYu-0007YZ-44
	for lists+qemu-devel@lfdr.de; Mon, 19 Aug 2019 08:15:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36172)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hzgTd-0001tH-Qj
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 08:09:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hzgTb-0002bC-2j
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 08:09:33 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:57771 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1hzgTa-0002ZX-Ir
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 08:09:30 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 5C3371A2089;
 Mon, 19 Aug 2019 14:08:24 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.43])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 05AEC1A208C;
 Mon, 19 Aug 2019 14:08:24 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Mon, 19 Aug 2019 14:07:47 +0200
Message-Id: <1566216496-17375-9-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1566216496-17375-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1566216496-17375-1-git-send-email-aleksandar.markovic@rt-rk.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH v8 08/37] target/mips: Style improvements in
 internal.h
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: arikalo@wavecomp.com, philmd@redhat.com, amarkovic@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aleksandar Markovic <amarkovic@wavecomp.com>

Fixes mostly errors and warnings reported by 'checkpatch.pl -f'.

Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 target/mips/internal.h | 57 +++++++++++++++++++++++++++++++-------------=
------
 1 file changed, 35 insertions(+), 22 deletions(-)

diff --git a/target/mips/internal.h b/target/mips/internal.h
index d9216fb..836de7a 100644
--- a/target/mips/internal.h
+++ b/target/mips/internal.h
@@ -1,4 +1,5 @@
-/* mips internal definitions and helpers
+/*
+ * MIPS internal definitions and helpers
  *
  * This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
  * See the COPYING file in the top-level directory.
@@ -8,8 +9,10 @@
 #define MIPS_INTERNAL_H
=20
=20
-/* MMU types, the first four entries have the same layout as the
-   CP0C0_MT field.  */
+/*
+ * MMU types, the first four entries have the same layout as the
+ * CP0C0_MT field.
+ */
 enum mips_mmu_types {
     MMU_TYPE_NONE,
     MMU_TYPE_R4000,
@@ -159,9 +162,11 @@ static inline bool cpu_mips_hw_interrupts_enabled(CP=
UMIPSState *env)
         !(env->CP0_Status & (1 << CP0St_EXL)) &&
         !(env->CP0_Status & (1 << CP0St_ERL)) &&
         !(env->hflags & MIPS_HFLAG_DM) &&
-        /* Note that the TCStatus IXMT field is initialized to zero,
-           and only MT capable cores can set it to one. So we don't
-           need to check for MT capabilities here.  */
+        /*
+         * Note that the TCStatus IXMT field is initialized to zero,
+         * and only MT capable cores can set it to one. So we don't
+         * need to check for MT capabilities here.
+         */
         !(env->active_tc.CP0_TCStatus & (1 << CP0TCSt_IXMT));
 }
=20
@@ -176,14 +181,18 @@ static inline bool cpu_mips_hw_interrupts_pending(C=
PUMIPSState *env)
     status =3D env->CP0_Status & CP0Ca_IP_mask;
=20
     if (env->CP0_Config3 & (1 << CP0C3_VEIC)) {
-        /* A MIPS configured with a vectorizing external interrupt contr=
oller
-           will feed a vector into the Cause pending lines. The core tre=
ats
-           the status lines as a vector level, not as indiviual masks.  =
*/
+        /*
+         * A MIPS configured with a vectorizing external interrupt contr=
oller
+         * will feed a vector into the Cause pending lines. The core tre=
ats
+         * the status lines as a vector level, not as indiviual masks.
+         */
         r =3D pending > status;
     } else {
-        /* A MIPS configured with compatibility or VInt (Vectored Interr=
upts)
-           treats the pending lines as individual interrupt lines, the s=
tatus
-           lines are individual masks.  */
+        /*
+         * A MIPS configured with compatibility or VInt (Vectored Interr=
upts)
+         * treats the pending lines as individual interrupt lines, the s=
tatus
+         * lines are individual masks.
+         */
         r =3D (pending & status) !=3D 0;
     }
     return r;
@@ -268,12 +277,14 @@ static inline int mips_vpe_active(CPUMIPSState *env=
)
         active =3D 0;
     }
=20
-    /* Now verify that there are active thread contexts in the VPE.
-
-       This assumes the CPU model will internally reschedule threads
-       if the active one goes to sleep. If there are no threads availabl=
e
-       the active one will be in a sleeping state, and we can turn off
-       the entire VPE.  */
+    /*
+     * Now verify that there are active thread contexts in the VPE.
+     *
+     * This assumes the CPU model will internally reschedule threads
+     * if the active one goes to sleep. If there are no threads availabl=
e
+     * the active one will be in a sleeping state, and we can turn off
+     * the entire VPE.
+     */
     if (!(env->active_tc.CP0_TCStatus & (1 << CP0TCSt_A))) {
         /* TC is not activated.  */
         active =3D 0;
@@ -396,10 +407,12 @@ static inline void compute_hflags(CPUMIPSState *env=
)
             env->hflags |=3D MIPS_HFLAG_COP1X;
         }
     } else if (env->insn_flags & ISA_MIPS4) {
-        /* All supported MIPS IV CPUs use the XX (CU3) to enable
-           and disable the MIPS IV extensions to the MIPS III ISA.
-           Some other MIPS IV CPUs ignore the bit, so the check here
-           would be too restrictive for them.  */
+        /*
+         * All supported MIPS IV CPUs use the XX (CU3) to enable
+         * and disable the MIPS IV extensions to the MIPS III ISA.
+         * Some other MIPS IV CPUs ignore the bit, so the check here
+         * would be too restrictive for them.
+         */
         if (env->CP0_Status & (1U << CP0St_CU3)) {
             env->hflags |=3D MIPS_HFLAG_COP1X;
         }
--=20
2.7.4


