Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D214A78E2
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 20:47:40 +0100 (CET)
Received: from localhost ([::1]:59788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFLbP-0002Lp-Tk
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 14:47:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1nFK6f-0006se-C6
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 13:11:50 -0500
Received: from mout.gmx.net ([212.227.17.20]:37577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1nFK6c-0007CC-H8
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 13:11:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1643825502;
 bh=+bjlQRKildeSSXYeNLNggSy+frmkG7gRprVaAmJPm3I=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=VPGOo50ePUFqWlekLLqupB/qQPG0G3DoVSVuihP/eeV1fbRrmaufB3IxdQz1OLxUp
 9edt190i/Xouizqak0DoSSnfQM+e/Tny4WbT9GDiUDNQQowwZlXpGW+2/o1xuJkz+s
 R8vfuAhR7LFrmVu2hRAexPtlchafwf+/3RexdlGk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.163.171]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MJE6F-1mvAms3WzT-00KgDi; Wed, 02
 Feb 2022 19:11:41 +0100
From: Helge Deller <deller@gmx.de>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 3/6] hppa: Add support for an emulated TOC/NMI button.
Date: Wed,  2 Feb 2022 19:11:36 +0100
Message-Id: <20220202181139.124485-4-deller@gmx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220202181139.124485-1-deller@gmx.de>
References: <20220202181139.124485-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:JFP9YTIpuRkUQc75R9MiTmu3uMqerH+aoJhQgkCG+rKeK/c7W1I
 m4lcgTQgmJhp8MJRKQbV0aRaqpksY/8ICmvCplVTVAy/odSpE0h94DTy1yH6jKmfFZIGjtZ
 qvZM9chm6cpfBuMB1sGOR4cP32BJNC5u16fXGsB7f4cFk7JyENaFI8IRLn4CKYfPb188aMB
 YOZpARaIYC/cdKro4GOEw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:3goAh661L8k=:uNnS+Nwf9IwEnIhi7QGpzv
 Wbjm1ACcBaXvm16GZrcVZ8nvoOwtutapadVLqtlJ3YU4japrelB8V5E0mbDQxT2C8S1atjMrn
 lo4e/2eQS0+N0hwgdc4ZI22gpI6bET7Gk83iQgzHHs+mW+4xwt5Z91ZW+OukQpIVtbeNptp2p
 ana2m9xVu69qUHi5v24mN8J9mtjkgPs8Um49FYSuTIdnk1ewID+v+iZ+yS0zjJSQbC4qfOfKF
 aZK7HnD06YK3ZtvDfRx1lAXzA1k6SB624bSqZBMHQQ86vFfnByoZSuUvkxppZCmHHCb83sc14
 STp6Ep3bt5a1O39bCBl3bnbdmvO1l35We6JK3yU7sRdaJbjodJfm8tzSeRT5fMXc3ZmuNTaE1
 WwuEj5ONAnXVRz9kUbubm0D6WQFlIVPAHrSnlUxg/wgMT+CmF1gmXyFLdKmzNObv/cTTu9LzL
 8kNCUkwh9/na8fVNoYIpKYzFIPjDQauGqfK8KQT0YQDLq1uUc1m1e6WemPJOdqbDFqsQg3a8C
 iccBadXTrrL7jWxX7465KFplvC6Ff/Mc3dg9VycGIfyiuEtlZIgGR8QRBEGSVox/3ekbtoCMK
 DX8tpI4mjB0CX472QcqrXMV6taRek8Kvdt7yGr6XZ9aD/nTs/yP6R+SgnUBIAegJHowDr/3uB
 G7Cs/aOHlU2k4ur5d2MWSNM0mnFEm5tpAuffWFeANYYf/pufYQhbyy7EPIo0PYPrWxrLo9H+Z
 QHVhIPsWL9pR7W0SqF8zh5AbTsSKVZTKqHUNPt+j7xyMw7VLe/6A9BCJyoRa96cahjDXGfwiK
 GBAnVR2rHmeWIum5lUFYTc1MEAzdYf06lO75Edwm9Rcnzq+w4H5+o+WZVVP1O99zJvLIe0La5
 3/6cSKUBlDax1q2AKSNTPJ1Enr4UbTAKfp5q6HlUIWpls5NVHtJvAPtacuf3TyVpelz3kxwFN
 /Lox/EoBhEx7V062WWF9JZ/QHAzsv68coz2bIE5ekwcciZoM4jmk5P4pR5gQ4NXYk62VJ3R4D
 lcf+2LILX2mLPwtqeJhoU+5ogJEu0wcAqBCy/dxQSjC6kIlUbvYJ/iMui813P0jhv0AwfgE9c
 OhmuVaLxtDsuO4=
Received-SPF: pass client-ip=212.227.17.20; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Helge Deller <deller@gmx.de>, Sven Schnelle <svens@stackframe.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Almost all PA-RISC machines have either a button that is labeled with 'TOC=
' or
a BMC/GSP function to trigger a TOC.  TOC is a non-maskable interrupt that=
 is
sent to the processor.  This can be used for diagnostic purposes like obta=
ining
a stack trace/register dump or to enter KDB/KGDB in Linux.

This patch adds support for such an emulated TOC button.

It wires up the qemu monitor "nmi" command to trigger a TOC.  For that it
provides the hppa_nmi function which is assigned to the nmi_monitor_handle=
r
function pointer.  When called it raises the EXCP_TOC hardware interrupt i=
n the
hppa_cpu_do_interrupt() function.  The interrupt function then calls the
architecturally defined TOC function in SeaBIOS-hppa firmware (at fixed ad=
dress
0xf0000000).

According to the PA-RISC PDC specification, the SeaBIOS firmware then writ=
es
the CPU registers into PIM (processor internal memmory) for later analysis=
.  In
order to write all registers it needs to know the contents of the CPU "sha=
dow
registers" and the IASQ- and IAOQ-back values. The IAOQ/IASQ values are
provided by qemu in shadow registers when entering the SeaBIOS TOC functio=
n.
This patch adds a new aritificial opcode "getshadowregs" (0xfffdead2) whic=
h
restores the original values of the shadow registers. With this opcode Sea=
BIOS
can store those registers as well into PIM before calling an OS-provided T=
OC
handler.

To trigger a TOC, switch to the qemu monitor with Ctrl-A C, and type in th=
e
command "nmi".  After the TOC started the OS-debugger, exit the qemu monit=
or
with Ctrl-A C.

Signed-off-by: Helge Deller <deller@gmx.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
=2D--
 hw/hppa/machine.c        | 35 ++++++++++++++++++++++++++++++++++-
 target/hppa/cpu.c        |  2 +-
 target/hppa/cpu.h        |  5 +++++
 target/hppa/helper.h     |  1 +
 target/hppa/insns.decode |  1 +
 target/hppa/int_helper.c | 19 ++++++++++++++++++-
 target/hppa/op_helper.c  |  7 ++++++-
 target/hppa/translate.c  | 10 ++++++++++
 8 files changed, 76 insertions(+), 4 deletions(-)

diff --git a/hw/hppa/machine.c b/hw/hppa/machine.c
index 2a46af5bc9..98b30e0395 100644
=2D-- a/hw/hppa/machine.c
+++ b/hw/hppa/machine.c
@@ -17,6 +17,7 @@
 #include "hw/timer/i8254.h"
 #include "hw/char/serial.h"
 #include "hw/net/lasi_82596.h"
+#include "hw/nmi.h"
 #include "hppa_sys.h"
 #include "qemu/units.h"
 #include "qapi/error.h"
@@ -355,6 +356,14 @@ static void hppa_machine_reset(MachineState *ms)
     cpu[0]->env.gr[19] =3D FW_CFG_IO_BASE;
 }

+static void hppa_nmi(NMIState *n, int cpu_index, Error **errp)
+{
+    CPUState *cs;
+
+    CPU_FOREACH(cs) {
+        cpu_interrupt(cs, CPU_INTERRUPT_NMI);
+    }
+}

 static void machine_hppa_machine_init(MachineClass *mc)
 {
@@ -371,4 +380,28 @@ static void machine_hppa_machine_init(MachineClass *m=
c)
     mc->default_ram_id =3D "ram";
 }

-DEFINE_MACHINE("hppa", machine_hppa_machine_init)
+static void machine_hppa_machine_init_class_init(ObjectClass *oc, void *d=
ata)
+{
+    MachineClass *mc =3D MACHINE_CLASS(oc);
+    machine_hppa_machine_init(mc);
+
+    NMIClass *nc =3D NMI_CLASS(oc);
+    nc->nmi_monitor_handler =3D hppa_nmi;
+}
+
+static const TypeInfo machine_hppa_machine_init_typeinfo =3D {
+    .name =3D ("hppa" "-machine"),
+    .parent =3D "machine",
+    .class_init =3D machine_hppa_machine_init_class_init,
+    .interfaces =3D (InterfaceInfo[]) {
+        { TYPE_NMI },
+        { }
+    },
+};
+
+static void machine_hppa_machine_init_register_types(void)
+{
+    type_register_static(&machine_hppa_machine_init_typeinfo);
+}
+
+type_init(machine_hppa_machine_init_register_types)
diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
index 23eb254228..37b763fca0 100644
=2D-- a/target/hppa/cpu.c
+++ b/target/hppa/cpu.c
@@ -62,7 +62,7 @@ static void hppa_cpu_synchronize_from_tb(CPUState *cs,

 static bool hppa_cpu_has_work(CPUState *cs)
 {
-    return cs->interrupt_request & CPU_INTERRUPT_HARD;
+    return cs->interrupt_request & (CPU_INTERRUPT_HARD | CPU_INTERRUPT_NM=
I);
 }

 static void hppa_cpu_disas_set_info(CPUState *cs, disassemble_info *info)
diff --git a/target/hppa/cpu.h b/target/hppa/cpu.h
index 45fd338b02..93c119532a 100644
=2D-- a/target/hppa/cpu.h
+++ b/target/hppa/cpu.h
@@ -69,6 +69,11 @@
 #define EXCP_SYSCALL             30
 #define EXCP_SYSCALL_LWS         31

+/* Emulated hardware TOC button */
+#define EXCP_TOC                 32 /* TOC =3D Transfer of control (NMI) =
*/
+
+#define CPU_INTERRUPT_NMI       CPU_INTERRUPT_TGT_EXT_3         /* TOC */
+
 /* Taken from Linux kernel: arch/parisc/include/asm/psw.h */
 #define PSW_I            0x00000001
 #define PSW_D            0x00000002
diff --git a/target/hppa/helper.h b/target/hppa/helper.h
index 0a629ffa7c..fe8a9ce493 100644
=2D-- a/target/hppa/helper.h
+++ b/target/hppa/helper.h
@@ -80,6 +80,7 @@ DEF_HELPER_FLAGS_0(read_interval_timer, TCG_CALL_NO_RWG,=
 tr)
 #ifndef CONFIG_USER_ONLY
 DEF_HELPER_1(halt, noreturn, env)
 DEF_HELPER_1(reset, noreturn, env)
+DEF_HELPER_1(getshadowregs, void, env)
 DEF_HELPER_1(rfi, void, env)
 DEF_HELPER_1(rfi_r, void, env)
 DEF_HELPER_FLAGS_2(write_interval_timer, TCG_CALL_NO_RWG, void, env, tr)
diff --git a/target/hppa/insns.decode b/target/hppa/insns.decode
index d4eefc0d48..c7a7e997f9 100644
=2D-- a/target/hppa/insns.decode
+++ b/target/hppa/insns.decode
@@ -111,6 +111,7 @@ rfi_r           000000 ----- ----- --- 01100101 00000
 # They are allocated from the unassigned instruction space.
 halt            1111 1111 1111 1101 1110 1010 1101 0000
 reset           1111 1111 1111 1101 1110 1010 1101 0001
+getshadowregs   1111 1111 1111 1101 1110 1010 1101 0010

 ####
 # Memory Management
diff --git a/target/hppa/int_helper.c b/target/hppa/int_helper.c
index 13073ae2bd..f599dccfff 100644
=2D-- a/target/hppa/int_helper.c
+++ b/target/hppa/int_helper.c
@@ -23,6 +23,7 @@
 #include "cpu.h"
 #include "exec/helper-proto.h"
 #include "hw/core/cpu.h"
+#include "hw/hppa/hppa_hardware.h"

 #ifndef CONFIG_USER_ONLY
 static void eval_interrupt(HPPACPU *cpu)
@@ -181,7 +182,14 @@ void hppa_cpu_do_interrupt(CPUState *cs)
     }

     /* step 7 */
-    env->iaoq_f =3D env->cr[CR_IVA] + 32 * i;
+    if (i =3D=3D EXCP_TOC) {
+        env->iaoq_f =3D FIRMWARE_START;
+        /* help SeaBIOS and provide iaoq_b and iasq_back in shadow regs *=
/
+        env->gr[24] =3D env->cr_back[0];
+        env->gr[25] =3D env->cr_back[1];
+    } else {
+        env->iaoq_f =3D env->cr[CR_IVA] + 32 * i;
+    }
     env->iaoq_b =3D env->iaoq_f + 4;
     env->iasq_f =3D 0;
     env->iasq_b =3D 0;
@@ -219,6 +227,7 @@ void hppa_cpu_do_interrupt(CPUState *cs)
             [EXCP_PER_INTERRUPT] =3D "performance monitor interrupt",
             [EXCP_SYSCALL]       =3D "syscall",
             [EXCP_SYSCALL_LWS]   =3D "syscall-lws",
+            [EXCP_TOC]           =3D "TOC (transfer of control)",
         };
         static int count;
         const char *name =3D NULL;
@@ -248,6 +257,14 @@ bool hppa_cpu_exec_interrupt(CPUState *cs, int interr=
upt_request)
     HPPACPU *cpu =3D HPPA_CPU(cs);
     CPUHPPAState *env =3D &cpu->env;

+    if (interrupt_request & CPU_INTERRUPT_NMI) {
+        /* Raise TOC (NMI) interrupt */
+        cpu_reset_interrupt(cs, CPU_INTERRUPT_NMI);
+        cs->exception_index =3D EXCP_TOC;
+        hppa_cpu_do_interrupt(cs);
+        return true;
+    }
+
     /* If interrupts are requested and enabled, raise them.  */
     if ((env->psw & PSW_I) && (interrupt_request & CPU_INTERRUPT_HARD)) {
         cs->exception_index =3D EXCP_EXT_INTERRUPT;
diff --git a/target/hppa/op_helper.c b/target/hppa/op_helper.c
index 1b86557d5d..b0dec4ebf4 100644
=2D-- a/target/hppa/op_helper.c
+++ b/target/hppa/op_helper.c
@@ -694,7 +694,7 @@ void HELPER(rfi)(CPUHPPAState *env)
     cpu_hppa_put_psw(env, env->cr[CR_IPSW]);
 }

-void HELPER(rfi_r)(CPUHPPAState *env)
+void HELPER(getshadowregs)(CPUHPPAState *env)
 {
     env->gr[1] =3D env->shadow[0];
     env->gr[8] =3D env->shadow[1];
@@ -703,6 +703,11 @@ void HELPER(rfi_r)(CPUHPPAState *env)
     env->gr[17] =3D env->shadow[4];
     env->gr[24] =3D env->shadow[5];
     env->gr[25] =3D env->shadow[6];
+}
+
+void HELPER(rfi_r)(CPUHPPAState *env)
+{
+    helper_getshadowregs(env);
     helper_rfi(env);
 }
 #endif
diff --git a/target/hppa/translate.c b/target/hppa/translate.c
index c6195590f8..5c0b1eb274 100644
=2D-- a/target/hppa/translate.c
+++ b/target/hppa/translate.c
@@ -2393,6 +2393,16 @@ static bool trans_reset(DisasContext *ctx, arg_rese=
t *a)
 #endif
 }

+static bool trans_getshadowregs(DisasContext *ctx, arg_getshadowregs *a)
+{
+    CHECK_MOST_PRIVILEGED(EXCP_PRIV_OPR);
+#ifndef CONFIG_USER_ONLY
+    nullify_over(ctx);
+    gen_helper_getshadowregs(cpu_env);
+    return nullify_end(ctx);
+#endif
+}
+
 static bool trans_nop_addrx(DisasContext *ctx, arg_ldst *a)
 {
     if (a->m) {
=2D-
2.34.1


