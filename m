Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3DAE19F01A
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Apr 2020 07:26:16 +0200 (CEST)
Received: from localhost ([::1]:54808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jLKH1-0006Rp-8A
	for lists+qemu-devel@lfdr.de; Mon, 06 Apr 2020 01:26:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44354)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <keithp@keithp.com>) id 1jLKFr-0005du-98
 for qemu-devel@nongnu.org; Mon, 06 Apr 2020 01:25:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <keithp@keithp.com>) id 1jLKFm-0003fu-2c
 for qemu-devel@nongnu.org; Mon, 06 Apr 2020 01:25:02 -0400
Received: from home.keithp.com ([63.227.221.253]:46062 helo=elaine.keithp.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <keithp@keithp.com>)
 id 1jLKFl-0003cK-9W; Mon, 06 Apr 2020 01:24:58 -0400
Received: from localhost (localhost [127.0.0.1])
 by elaine.keithp.com (Postfix) with ESMTP id EB3603F2A0DC;
 Sun,  5 Apr 2020 22:24:53 -0700 (PDT)
X-Virus-Scanned: Debian amavisd-new at keithp.com
Received: from elaine.keithp.com ([127.0.0.1])
 by localhost (elaine.keithp.com [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id mOm7EwO5WgD0; Sun,  5 Apr 2020 22:24:52 -0700 (PDT)
Received: from keithp.com (koto.keithp.com [10.0.0.2])
 by elaine.keithp.com (Postfix) with ESMTPSA id 8690C3F2A0D9;
 Sun,  5 Apr 2020 22:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
 t=1586150692; bh=FhQJ7V7+hDaexErsqDDmpG2Bid21lEoyZ68AMhNo3xI=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=QsAoyr3KkRI8wAR+FC6I1RLqeA4oem4A6/sRVe67WLsEUpm2bCqnYexVo3g7xGdL2
 bnJJNEX/w+xWYLkW85/U2u4d7T3d5fxuR5qIJYMYdafVF3l1J6+zjJlBkNY/HZ2DmF
 4+PBScT/avsYXSlC97L40wOTVeTkkLxXSiJQJY8kUej+dQLRb7+6lT/fRRsqbtsbyd
 ytXHO2WpjjGNRE6dmOkz9USARDqGVw6aCS9/kSLvIn1YBjGKBqIS74hVYNyt7SKwLm
 FxOTj2DeVC/i0+aKv7/cbZ8sQTlIFJFFICpNKo/BwXHzUIGPrDCrWYD0Lju79i9TNv
 38ELkrnQvaBXw==
Received: by keithp.com (Postfix, from userid 1000)
 id 313091582127; Sun,  5 Apr 2020 22:24:51 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Riku Voipio <riku.voipio@iki.fi>,
 Laurent Vivier <laurent@vivier.eu>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 "open list\:RISC-V" <qemu-riscv@nongnu.org>
Subject: Re: [PATCH] riscv: Add semihosting support [v5]
In-Reply-To: <CAFEAcA_df6Uc_kqAvbELOQyUSnv-n+bDvJtYf2s5wCxwNXm-eg@mail.gmail.com>
References: <20200128233224.515233-1-keithp@keithp.com>
 <CAFEAcA_dD3eAfKvOGOoXe3NWKg1PiW8=s2Xk41w19Tk67R-R4A@mail.gmail.com>
 <877e1arz2w.fsf@keithp.org>
 <CAFEAcA8Vs5Bp7tPgxLOG_T0350-Y_w7SitNzNuvHZN6AB=b0gg@mail.gmail.com>
 <mhng-e399eb36-5106-485c-972c-db2610e42dff@palmerdabbelt-glaptop1>
 <CAFEAcA_df6Uc_kqAvbELOQyUSnv-n+bDvJtYf2s5wCxwNXm-eg@mail.gmail.com>
Date: Sun, 05 Apr 2020 22:24:50 -0700
Message-ID: <87mu7ptcd9.fsf@keithp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="==-=-=";
 micalg=pgp-sha256; protocol="application/pgp-signature"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 63.227.221.253
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: "Keith Packard" <keithp@keithp.com>
From: "Keith Packard" via <qemu-devel@nongnu.org>

--==-=-=
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=
Content-Type: text/plain

Peter Maydell <peter.maydell@linaro.org> writes:

> I don't think a semihosting specification for RISC-V needs
> necessarily to be a very heavyweight thing -- it is, after
> all, a debug API at heart -- but I do agree that you should
> have one.

We've had a couple of weeks of discussion in the RISC-V sw-dev group and
have created a new specification for RISC-V semihosting. It is located
within the RISC-V consortium github account here:

        https://github.com/riscv/riscv-semihosting-spec

The current version is 0.2, and this patch to QEMU implements that
version.


--=-=-=
Content-Type: text/x-diff; charset=utf-8
Content-Disposition: inline;
 filename=0001-riscv-Add-semihosting-support-v5.patch
Content-Transfer-Encoding: quoted-printable

From=20404ff408fa00ab7f65d1842966854824c418020c Mon Sep 17 00:00:00 2001
From: Keith Packard <keithp@keithp.com>
Date: Mon, 21 Oct 2019 01:12:13 -0700
Subject: [PATCH] riscv: Add semihosting support [v5]

Adapt the arm semihosting support code for RISCV. This implementation
is based on the standard for RISC-V semihosting version 0.2 as
documented in

   https://github.com/riscv/riscv-semihosting-spec/releases/tag/0.2

Signed-off-by: Keith Packard <keithp@keithp.com>

=2D--

v2:
	Update PC after exception is handled to follow
	change in the ARM version for SYS_READC

v3:
	Disallow semihosting in user mode; report a regular
	breakpoint in that case.

v4:
	Fix errors reported by checkpatch

v5:
	Reference current RISC-V semihosting specification
=2D--
 default-configs/riscv32-softmmu.mak           |    1 +
 linux-user/qemu.h                             |    2 +
 qemu-options.hx                               |   10 +-
 target/riscv/Makefile.objs                    |    2 +-
 target/riscv/cpu.h                            |    2 +
 target/riscv/cpu_bits.h                       |    1 +
 target/riscv/cpu_helper.c                     |    9 +
 .../riscv/insn_trans/trans_privileged.inc.c   |   24 +-
 target/riscv/riscv-semi.c                     | 1084 +++++++++++++++++
 target/riscv/translate.c                      |   11 +
 10 files changed, 1140 insertions(+), 6 deletions(-)
 create mode 100644 target/riscv/riscv-semi.c

diff --git a/default-configs/riscv32-softmmu.mak b/default-configs/riscv32-=
softmmu.mak
index 1ae077ed87..21b7bedf19 100644
=2D-- a/default-configs/riscv32-softmmu.mak
+++ b/default-configs/riscv32-softmmu.mak
@@ -3,6 +3,7 @@
 # Uncomment the following lines to disable these optional devices:
 #
 #CONFIG_PCI_DEVICES=3Dn
+CONFIG_SEMIHOSTING=3Dy
=20
 # Boards:
 #
diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index 792c74290f..fb59776a34 100644
=2D-- a/linux-user/qemu.h
+++ b/linux-user/qemu.h
@@ -105,6 +105,8 @@ typedef struct TaskState {
     /* FPA state */
     FPA11 fpa;
 # endif
+#endif
+#if defined(TARGET_ARM) || defined(TARGET_RISCV)
     int swi_errno;
 #endif
 #if defined(TARGET_I386) && !defined(TARGET_X86_64)
diff --git a/qemu-options.hx b/qemu-options.hx
index 16debd03cb..917b32ef32 100644
=2D-- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -4103,10 +4103,10 @@ ERST
 DEF("semihosting", 0, QEMU_OPTION_semihosting,
     "-semihosting    semihosting mode\n",
     QEMU_ARCH_ARM | QEMU_ARCH_M68K | QEMU_ARCH_XTENSA | QEMU_ARCH_LM32 |
=2D    QEMU_ARCH_MIPS | QEMU_ARCH_NIOS2)
+    QEMU_ARCH_MIPS | QEMU_ARCH_NIOS2 | QEMU_ARCH_RISCV)
 SRST
 ``-semihosting``
=2D    Enable semihosting mode (ARM, M68K, Xtensa, MIPS, Nios II only).
+    Enable semihosting mode (ARM, M68K, Xtensa, MIPS, Nios II only, RISC-V=
).
=20
     Note that this allows guest direct access to the host filesystem, so
     should only be used with a trusted guest OS.
@@ -4118,10 +4118,10 @@ DEF("semihosting-config", HAS_ARG, QEMU_OPTION_semi=
hosting_config,
     "-semihosting-config [enable=3Don|off][,target=3Dnative|gdb|auto][,cha=
rdev=3Did][,arg=3Dstr[,...]]\n" \
     "                semihosting configuration\n",
 QEMU_ARCH_ARM | QEMU_ARCH_M68K | QEMU_ARCH_XTENSA | QEMU_ARCH_LM32 |
=2DQEMU_ARCH_MIPS | QEMU_ARCH_NIOS2)
+QEMU_ARCH_MIPS | QEMU_ARCH_NIOS2 | QEMU_ARCH_RISCV)
 SRST
 ``-semihosting-config [enable=3Don|off][,target=3Dnative|gdb|auto][,charde=
v=3Did][,arg=3Dstr[,...]]``
=2D    Enable and configure semihosting (ARM, M68K, Xtensa, MIPS, Nios II
+    Enable and configure semihosting (ARM, M68K, Xtensa, MIPS, Nios II, RI=
SC-V
     only).
=20
     Note that this allows guest direct access to the host filesystem, so
@@ -4136,6 +4136,8 @@ SRST
     open/read/write/seek/select. Tensilica baremetal libc for ISS and
     linux platform "sim" use this interface.
=20
+    On RISC-V this implements the standard semihosting API, version 0.2.
+
     ``target=3Dnative|gdb|auto``
         Defines where the semihosting calls will be addressed, to QEMU
         (``native``) or to GDB (``gdb``). The default is ``auto``, which
diff --git a/target/riscv/Makefile.objs b/target/riscv/Makefile.objs
index ff651f69f6..6fd7f40e29 100644
=2D-- a/target/riscv/Makefile.objs
+++ b/target/riscv/Makefile.objs
@@ -1,4 +1,4 @@
=2Dobj-y +=3D translate.o op_helper.o cpu_helper.o cpu.o csr.o fpu_helper.o=
 gdbstub.o
+obj-y +=3D translate.o op_helper.o cpu_helper.o cpu.o csr.o fpu_helper.o g=
dbstub.o riscv-semi.o
 obj-$(CONFIG_SOFTMMU) +=3D pmp.o
=20
 ifeq ($(CONFIG_SOFTMMU),y)
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 7d21addbab..f605f6b70a 100644
=2D-- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -397,6 +397,8 @@ void riscv_cpu_register_gdb_regs_for_features(CPUState =
*cs);
 typedef CPURISCVState CPUArchState;
 typedef RISCVCPU ArchCPU;
=20
+target_ulong do_riscv_semihosting(CPURISCVState *env);
+
 #include "exec/cpu-all.h"
=20
 #endif /* RISCV_CPU_H */
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 7f64ee1174..b100f79044 100644
=2D-- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -527,6 +527,7 @@
 #define RISCV_EXCP_INST_PAGE_FAULT               0xc /* since: priv-1.10.0=
 */
 #define RISCV_EXCP_LOAD_PAGE_FAULT               0xd /* since: priv-1.10.0=
 */
 #define RISCV_EXCP_STORE_PAGE_FAULT              0xf /* since: priv-1.10.0=
 */
+#define RISCV_EXCP_SEMIHOST                      0x10
 #define RISCV_EXCP_INST_GUEST_PAGE_FAULT         0x14
 #define RISCV_EXCP_LOAD_GUEST_ACCESS_FAULT       0x15
 #define RISCV_EXCP_STORE_GUEST_AMO_ACCESS_FAULT  0x17
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index d3ba9efb02..96776a97dc 100644
=2D-- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -858,6 +858,15 @@ void riscv_cpu_do_interrupt(CPUState *cs)
     target_ulong htval =3D 0;
     target_ulong mtval2 =3D 0;
=20
+    if  (cause =3D=3D RISCV_EXCP_SEMIHOST) {
+        if (env->priv >=3D PRV_S) {
+            env->gpr[xA0] =3D do_riscv_semihosting(env);
+            env->pc +=3D 4;
+            return;
+        }
+        cause =3D RISCV_EXCP_BREAKPOINT;
+    }
+
     if (!async) {
         /* set tval to badaddr for traps with address information */
         switch (cause) {
diff --git a/target/riscv/insn_trans/trans_privileged.inc.c b/target/riscv/=
insn_trans/trans_privileged.inc.c
index 76c2fad71c..57f393847f 100644
=2D-- a/target/riscv/insn_trans/trans_privileged.inc.c
+++ b/target/riscv/insn_trans/trans_privileged.inc.c
@@ -29,7 +29,29 @@ static bool trans_ecall(DisasContext *ctx, arg_ecall *a)
=20
 static bool trans_ebreak(DisasContext *ctx, arg_ebreak *a)
 {
=2D    generate_exception(ctx, RISCV_EXCP_BREAKPOINT);
+    uint32_t pre    =3D opcode_at(&ctx->base, ctx->base.pc_next - 4);
+    uint32_t ebreak =3D opcode_at(&ctx->base, ctx->base.pc_next);
+    uint32_t post   =3D opcode_at(&ctx->base, ctx->base.pc_next + 4);
+
+    /*
+     * The RISC-V semihosting spec specifies the following
+     * three-instruction sequence to flag a semihosting call:
+     *
+     *      slli zero, zero, 0x1f       0x01f01013
+     *      ebreak                      0x00100073
+     *      srai zero, zero, 0x7        0x40705013
+     *
+     * The two shift operations on the zero register are no-ops, used
+     * here to signify a semihosting exception, rather than a breakpoint.
+     *
+     * Uncompressed instructions are used so that the sequence is easy
+     * to validate.
+     */
+    if  (pre =3D=3D 0x01f01013 && ebreak =3D=3D 0x00100073 && post =3D=3D =
0x40705013) {
+        generate_exception(ctx, RISCV_EXCP_SEMIHOST);
+    } else {
+        generate_exception(ctx, RISCV_EXCP_BREAKPOINT);
+    }
     exit_tb(ctx); /* no chaining */
     ctx->base.is_jmp =3D DISAS_NORETURN;
     return true;
diff --git a/target/riscv/riscv-semi.c b/target/riscv/riscv-semi.c
new file mode 100644
index 0000000000..18707f32c5
=2D-- /dev/null
+++ b/target/riscv/riscv-semi.c
@@ -0,0 +1,1084 @@
+/*
+ *  RISC-V semihosting syscalls
+ *
+ *  Copyright (c) 2005, 2007 CodeSourcery.
+ *  Copyright (c) 2019 Linaro
+ *  Copyright =C2=A9 2019 Keith Packard
+ *  Written by Paul Brook.
+ *  Adapted for RISC-V by Keith Packard
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ *
+ *  ARM Semihosting is documented in:
+ *     Semihosting for AArch32 and AArch64 Release 2.0
+ *     https://static.docs.arm.com/100863/0200/semihosting.pdf
+ */
+
+#include "qemu/osdep.h"
+
+#include "cpu.h"
+#include "hw/semihosting/semihost.h"
+#include "hw/semihosting/console.h"
+#include "qemu/log.h"
+#ifdef CONFIG_USER_ONLY
+#include "qemu.h"
+
+#define RISCV_HEAP_SIZE (128 * 1024 * 1024)
+#else
+#include "exec/gdbstub.h"
+#include "qemu/cutils.h"
+#endif
+
+#define TARGET_SYS_OPEN        0x01
+#define TARGET_SYS_CLOSE       0x02
+#define TARGET_SYS_WRITEC      0x03
+#define TARGET_SYS_WRITE0      0x04
+#define TARGET_SYS_WRITE       0x05
+#define TARGET_SYS_READ        0x06
+#define TARGET_SYS_READC       0x07
+#define TARGET_SYS_ISTTY       0x09
+#define TARGET_SYS_SEEK        0x0a
+#define TARGET_SYS_FLEN        0x0c
+#define TARGET_SYS_TMPNAM      0x0d
+#define TARGET_SYS_REMOVE      0x0e
+#define TARGET_SYS_RENAME      0x0f
+#define TARGET_SYS_CLOCK       0x10
+#define TARGET_SYS_TIME        0x11
+#define TARGET_SYS_SYSTEM      0x12
+#define TARGET_SYS_ERRNO       0x13
+#define TARGET_SYS_GET_CMDLINE 0x15
+#define TARGET_SYS_HEAPINFO    0x16
+#define TARGET_SYS_EXIT        0x18
+#define TARGET_SYS_SYNCCACHE   0x19
+#define TARGET_SYS_EXIT_EXTENDED 0x20
+
+/*
+ * ADP_Stopped_ApplicationExit is used for exit(0),
+ * anything else is implemented as exit(1)
+ */
+#define ADP_Stopped_ApplicationExit     (0x20026)
+
+#ifndef O_BINARY
+#define O_BINARY 0
+#endif
+
+#define GDB_O_RDONLY  0x000
+#define GDB_O_WRONLY  0x001
+#define GDB_O_RDWR    0x002
+#define GDB_O_APPEND  0x008
+#define GDB_O_CREAT   0x200
+#define GDB_O_TRUNC   0x400
+#define GDB_O_BINARY  0
+
+static int gdb_open_modeflags[12] =3D {
+    GDB_O_RDONLY,
+    GDB_O_RDONLY | GDB_O_BINARY,
+    GDB_O_RDWR,
+    GDB_O_RDWR | GDB_O_BINARY,
+    GDB_O_WRONLY | GDB_O_CREAT | GDB_O_TRUNC,
+    GDB_O_WRONLY | GDB_O_CREAT | GDB_O_TRUNC | GDB_O_BINARY,
+    GDB_O_RDWR | GDB_O_CREAT | GDB_O_TRUNC,
+    GDB_O_RDWR | GDB_O_CREAT | GDB_O_TRUNC | GDB_O_BINARY,
+    GDB_O_WRONLY | GDB_O_CREAT | GDB_O_APPEND,
+    GDB_O_WRONLY | GDB_O_CREAT | GDB_O_APPEND | GDB_O_BINARY,
+    GDB_O_RDWR | GDB_O_CREAT | GDB_O_APPEND,
+    GDB_O_RDWR | GDB_O_CREAT | GDB_O_APPEND | GDB_O_BINARY
+};
+
+static int open_modeflags[12] =3D {
+    O_RDONLY,
+    O_RDONLY | O_BINARY,
+    O_RDWR,
+    O_RDWR | O_BINARY,
+    O_WRONLY | O_CREAT | O_TRUNC,
+    O_WRONLY | O_CREAT | O_TRUNC | O_BINARY,
+    O_RDWR | O_CREAT | O_TRUNC,
+    O_RDWR | O_CREAT | O_TRUNC | O_BINARY,
+    O_WRONLY | O_CREAT | O_APPEND,
+    O_WRONLY | O_CREAT | O_APPEND | O_BINARY,
+    O_RDWR | O_CREAT | O_APPEND,
+    O_RDWR | O_CREAT | O_APPEND | O_BINARY
+};
+
+typedef enum GuestFDType {
+    GuestFDUnused =3D 0,
+    GuestFDHost =3D 1,
+    GuestFDGDB =3D 2,
+    GuestFDFeatureFile =3D 3,
+} GuestFDType;
+
+/*
+ * Guest file descriptors are integer indexes into an array of
+ * these structures (we will dynamically resize as necessary).
+ */
+typedef struct GuestFD {
+    GuestFDType type;
+    union {
+        int hostfd;
+        target_ulong featurefile_offset;
+    };
+} GuestFD;
+
+static GArray *guestfd_array;
+
+/*
+ * Allocate a new guest file descriptor and return it; if we
+ * couldn't allocate a new fd then return -1.
+ * This is a fairly simplistic implementation because we don't
+ * expect that most semihosting guest programs will make very
+ * heavy use of opening and closing fds.
+ */
+static int alloc_guestfd(void)
+{
+    guint i;
+
+    if (!guestfd_array) {
+        /* New entries zero-initialized, i.e. type GuestFDUnused */
+        guestfd_array =3D g_array_new(FALSE, TRUE, sizeof(GuestFD));
+    }
+
+    for (i =3D 0; i < guestfd_array->len; i++) {
+        GuestFD *gf =3D &g_array_index(guestfd_array, GuestFD, i);
+
+        if (gf->type =3D=3D GuestFDUnused) {
+            return i;
+        }
+    }
+
+    /* All elements already in use: expand the array */
+    g_array_set_size(guestfd_array, i + 1);
+    return i;
+}
+
+/*
+ * Look up the guestfd in the data structure; return NULL
+ * for out of bounds, but don't check whether the slot is unused.
+ * This is used internally by the other guestfd functions.
+ */
+static GuestFD *do_get_guestfd(int guestfd)
+{
+    if (!guestfd_array) {
+        return NULL;
+    }
+
+    if (guestfd < 0 || guestfd >=3D guestfd_array->len) {
+        return NULL;
+    }
+
+    return &g_array_index(guestfd_array, GuestFD, guestfd);
+}
+
+/*
+ * Associate the specified guest fd (which must have been
+ * allocated via alloc_fd() and not previously used) with
+ * the specified host/gdb fd.
+ */
+static void associate_guestfd(int guestfd, int hostfd)
+{
+    GuestFD *gf =3D do_get_guestfd(guestfd);
+
+    assert(gf);
+    gf->type =3D use_gdb_syscalls() ? GuestFDGDB : GuestFDHost;
+    gf->hostfd =3D hostfd;
+}
+
+/*
+ * Deallocate the specified guest file descriptor. This doesn't
+ * close the host fd, it merely undoes the work of alloc_fd().
+ */
+static void dealloc_guestfd(int guestfd)
+{
+    GuestFD *gf =3D do_get_guestfd(guestfd);
+
+    assert(gf);
+    gf->type =3D GuestFDUnused;
+}
+
+/*
+ * Given a guest file descriptor, get the associated struct.
+ * If the fd is not valid, return NULL. This is the function
+ * used by the various semihosting calls to validate a handle
+ * from the guest.
+ * Note: calling alloc_guestfd() or dealloc_guestfd() will
+ * invalidate any GuestFD* obtained by calling this function.
+ */
+static GuestFD *get_guestfd(int guestfd)
+{
+    GuestFD *gf =3D do_get_guestfd(guestfd);
+
+    if (!gf || gf->type =3D=3D GuestFDUnused) {
+        return NULL;
+    }
+    return gf;
+}
+
+/*
+ * The semihosting API has no concept of its errno being thread-safe,
+ * as the API design predates SMP CPUs and was intended as a simple
+ * real-hardware set of debug functionality. For QEMU, we make the
+ * errno be per-thread in linux-user mode; in softmmu it is a simple
+ * global, and we assume that the guest takes care of avoiding any races.
+ */
+#ifndef CONFIG_USER_ONLY
+static target_ulong syscall_err;
+
+#include "exec/softmmu-semi.h"
+#endif
+
+static inline uint32_t set_swi_errno(CPURISCVState *env, uint32_t code)
+{
+    if (code =3D=3D (uint32_t)-1) {
+#ifdef CONFIG_USER_ONLY
+        CPUState *cs =3D env_cpu(env);
+        TaskState *ts =3D cs->opaque;
+
+        ts->swi_errno =3D errno;
+#else
+        syscall_err =3D errno;
+#endif
+    }
+    return code;
+}
+
+static inline uint32_t get_swi_errno(CPURISCVState *env)
+{
+#ifdef CONFIG_USER_ONLY
+    CPUState *cs =3D env_cpu(env);
+    TaskState *ts =3D cs->opaque;
+
+    return ts->swi_errno;
+#else
+    return syscall_err;
+#endif
+}
+
+static target_ulong riscv_semi_syscall_len;
+
+static void riscv_semi_cb(CPUState *cs, target_ulong ret, target_ulong err)
+{
+    RISCVCPU *cpu =3D RISCV_CPU(cs);
+    CPURISCVState *env =3D &cpu->env;
+    target_ulong reg0 =3D env->gpr[xA0];
+
+    if (ret =3D=3D (target_ulong)-1) {
+        errno =3D err;
+        set_swi_errno(env, -1);
+        reg0 =3D ret;
+    } else {
+        /* Fixup syscalls that use nonstardard return conventions.  */
+        switch (reg0) {
+        case TARGET_SYS_WRITE:
+        case TARGET_SYS_READ:
+            reg0 =3D riscv_semi_syscall_len - ret;
+            break;
+        case TARGET_SYS_SEEK:
+            reg0 =3D 0;
+            break;
+        default:
+            reg0 =3D ret;
+            break;
+        }
+    }
+    env->gpr[xA0] =3D reg0;
+}
+
+static target_ulong riscv_flen_buf(RISCVCPU *cpu)
+{
+    /*
+     * Return an address in target memory of 64 bytes where the remote
+     * gdb should write its stat struct. (The format of this structure
+     * is defined by GDB's remote protocol and is not target-specific.)
+     * We put this on the guest's stack just below SP.
+     */
+    CPURISCVState *env =3D &cpu->env;
+    target_ulong sp;
+
+    sp =3D env->gpr[xSP];
+
+    return sp - 64;
+}
+
+static void riscv_semi_flen_cb(CPUState *cs, target_ulong ret, target_ulon=
g err)
+{
+    RISCVCPU *cpu =3D RISCV_CPU(cs);
+    CPURISCVState *env =3D &cpu->env;
+    /*
+     * The size is always stored in big-endian order, extract
+     *  the value. We assume the size always fit in 32 bits.
+     */
+    uint32_t size;
+    cpu_memory_rw_debug(cs, riscv_flen_buf(cpu) + 32, (uint8_t *)&size, 4,=
 0);
+    size =3D be32_to_cpu(size);
+    env->gpr[xA0] =3D size;
+    errno =3D err;
+    set_swi_errno(env, -1);
+}
+
+static int riscv_semi_open_guestfd;
+
+static void riscv_semi_open_cb(CPUState *cs, target_ulong ret, target_ulon=
g err)
+{
+    RISCVCPU *cpu =3D RISCV_CPU(cs);
+    CPURISCVState *env =3D &cpu->env;
+    if (ret =3D=3D (target_ulong)-1) {
+        errno =3D err;
+        set_swi_errno(env, -1);
+        dealloc_guestfd(riscv_semi_open_guestfd);
+    } else {
+        associate_guestfd(riscv_semi_open_guestfd, ret);
+        ret =3D riscv_semi_open_guestfd;
+    }
+
+    env->gpr[xA0] =3D ret;
+}
+
+static target_ulong riscv_gdb_syscall(RISCVCPU *cpu, gdb_syscall_complete_=
cb cb,
+                                    const char *fmt, ...)
+{
+    va_list va;
+    CPURISCVState *env =3D &cpu->env;
+
+    va_start(va, fmt);
+    gdb_do_syscallv(cb, fmt, va);
+    va_end(va);
+
+    /*
+     * FIXME: in softmmu mode, the gdbstub will schedule our callback
+     * to occur, but will not actually call it to complete the syscall
+     * until after this function has returned and we are back in the
+     * CPU main loop. Therefore callers to this function must not
+     * do anything with its return value, because it is not necessarily
+     * the result of the syscall, but could just be the old value of X0.
+     * The only thing safe to do with this is that the callers of
+     * do_riscv_semihosting() will write it straight back into X0.
+     * (In linux-user mode, the callback will have happened before
+     * gdb_do_syscallv() returns.)
+     *
+     * We should tidy this up so neither this function nor
+     * do_riscv_semihosting() return a value, so the mistake of
+     * doing something with the return value is not possible to make.
+     */
+
+    return env->gpr[xA0];
+}
+
+/*
+ * Types for functions implementing various semihosting calls
+ * for specific types of guest file descriptor. These must all
+ * do the work and return the required return value for the guest,
+ * setting the guest errno if appropriate.
+ */
+typedef uint32_t sys_closefn(RISCVCPU *cpu, GuestFD *gf);
+typedef uint32_t sys_writefn(RISCVCPU *cpu, GuestFD *gf,
+                             target_ulong buf, uint32_t len);
+typedef uint32_t sys_readfn(RISCVCPU *cpu, GuestFD *gf,
+                            target_ulong buf, uint32_t len);
+typedef uint32_t sys_isattyfn(RISCVCPU *cpu, GuestFD *gf);
+typedef uint32_t sys_seekfn(RISCVCPU *cpu, GuestFD *gf,
+                            target_ulong offset);
+typedef uint32_t sys_flenfn(RISCVCPU *cpu, GuestFD *gf);
+
+static uint32_t host_closefn(RISCVCPU *cpu, GuestFD *gf)
+{
+    CPURISCVState *env =3D &cpu->env;
+
+    return set_swi_errno(env, close(gf->hostfd));
+}
+
+static uint32_t host_writefn(RISCVCPU *cpu, GuestFD *gf,
+                             target_ulong buf, uint32_t len)
+{
+    uint32_t ret;
+    CPURISCVState *env =3D &cpu->env;
+    char *s =3D lock_user(VERIFY_READ, buf, len, 1);
+    if (!s) {
+        /* Return bytes not written on error */
+        return len;
+    }
+    ret =3D set_swi_errno(env, write(gf->hostfd, s, len));
+    unlock_user(s, buf, 0);
+    if (ret =3D=3D (uint32_t)-1) {
+        ret =3D 0;
+    }
+    /* Return bytes not written */
+    return len - ret;
+}
+
+static uint32_t host_readfn(RISCVCPU *cpu, GuestFD *gf,
+                            target_ulong buf, uint32_t len)
+{
+    uint32_t ret;
+    CPURISCVState *env =3D &cpu->env;
+    char *s =3D lock_user(VERIFY_WRITE, buf, len, 0);
+    if (!s) {
+        /* return bytes not read */
+        return len;
+    }
+    do {
+        ret =3D set_swi_errno(env, read(gf->hostfd, s, len));
+    } while (ret =3D=3D -1 && errno =3D=3D EINTR);
+    unlock_user(s, buf, len);
+    if (ret =3D=3D (uint32_t)-1) {
+        ret =3D 0;
+    }
+    /* Return bytes not read */
+    return len - ret;
+}
+
+static uint32_t host_isattyfn(RISCVCPU *cpu, GuestFD *gf)
+{
+    return isatty(gf->hostfd);
+}
+
+static uint32_t host_seekfn(RISCVCPU *cpu, GuestFD *gf, target_ulong offse=
t)
+{
+    CPURISCVState *env =3D &cpu->env;
+    uint32_t ret =3D set_swi_errno(env, lseek(gf->hostfd, offset, SEEK_SET=
));
+    if (ret =3D=3D (uint32_t)-1) {
+        return -1;
+    }
+    return 0;
+}
+
+static uint32_t host_flenfn(RISCVCPU *cpu, GuestFD *gf)
+{
+    CPURISCVState *env =3D &cpu->env;
+    struct stat buf;
+    uint32_t ret =3D set_swi_errno(env, fstat(gf->hostfd, &buf));
+    if (ret =3D=3D (uint32_t)-1) {
+        return -1;
+    }
+    return buf.st_size;
+}
+
+static uint32_t gdb_closefn(RISCVCPU *cpu, GuestFD *gf)
+{
+    return riscv_gdb_syscall(cpu, riscv_semi_cb, "close,%x", gf->hostfd);
+}
+
+static uint32_t gdb_writefn(RISCVCPU *cpu, GuestFD *gf,
+                            target_ulong buf, uint32_t len)
+{
+    riscv_semi_syscall_len =3D len;
+    return riscv_gdb_syscall(cpu, riscv_semi_cb, "write,%x,%x,%x",
+                           gf->hostfd, buf, len);
+}
+
+static uint32_t gdb_readfn(RISCVCPU *cpu, GuestFD *gf,
+                           target_ulong buf, uint32_t len)
+{
+    riscv_semi_syscall_len =3D len;
+    return riscv_gdb_syscall(cpu, riscv_semi_cb, "read,%x,%x,%x",
+                           gf->hostfd, buf, len);
+}
+
+static uint32_t gdb_isattyfn(RISCVCPU *cpu, GuestFD *gf)
+{
+    return riscv_gdb_syscall(cpu, riscv_semi_cb, "isatty,%x", gf->hostfd);
+}
+
+static uint32_t gdb_seekfn(RISCVCPU *cpu, GuestFD *gf, target_ulong offset)
+{
+    return riscv_gdb_syscall(cpu, riscv_semi_cb, "lseek,%x,%x,0",
+                           gf->hostfd, offset);
+}
+
+static uint32_t gdb_flenfn(RISCVCPU *cpu, GuestFD *gf)
+{
+    return riscv_gdb_syscall(cpu, riscv_semi_flen_cb, "fstat,%x,%x",
+                           gf->hostfd, riscv_flen_buf(cpu));
+}
+
+#define SHFB_MAGIC_0 0x53
+#define SHFB_MAGIC_1 0x48
+#define SHFB_MAGIC_2 0x46
+#define SHFB_MAGIC_3 0x42
+
+/* Feature bits reportable in feature byte 0 */
+#define SH_EXT_EXIT_EXTENDED (1 << 0)
+#define SH_EXT_STDOUT_STDERR (1 << 1)
+
+static const uint8_t featurefile_data[] =3D {
+    SHFB_MAGIC_0,
+    SHFB_MAGIC_1,
+    SHFB_MAGIC_2,
+    SHFB_MAGIC_3,
+    SH_EXT_EXIT_EXTENDED | SH_EXT_STDOUT_STDERR, /* Feature byte 0 */
+};
+
+static void init_featurefile_guestfd(int guestfd)
+{
+    GuestFD *gf =3D do_get_guestfd(guestfd);
+
+    assert(gf);
+    gf->type =3D GuestFDFeatureFile;
+    gf->featurefile_offset =3D 0;
+}
+
+static uint32_t featurefile_closefn(RISCVCPU *cpu, GuestFD *gf)
+{
+    /* Nothing to do */
+    return 0;
+}
+
+static uint32_t featurefile_writefn(RISCVCPU *cpu, GuestFD *gf,
+                                    target_ulong buf, uint32_t len)
+{
+    /* This fd can never be open for writing */
+    CPURISCVState *env =3D &cpu->env;
+
+    errno =3D EBADF;
+    return set_swi_errno(env, -1);
+}
+
+static uint32_t featurefile_readfn(RISCVCPU *cpu, GuestFD *gf,
+                                   target_ulong buf, uint32_t len)
+{
+    uint32_t i;
+#ifndef CONFIG_USER_ONLY
+    CPURISCVState *env =3D &cpu->env;
+#endif
+    char *s;
+
+    s =3D lock_user(VERIFY_WRITE, buf, len, 0);
+    if (!s) {
+        return len;
+    }
+
+    for (i =3D 0; i < len; i++) {
+        if (gf->featurefile_offset >=3D sizeof(featurefile_data)) {
+            break;
+        }
+        s[i] =3D featurefile_data[gf->featurefile_offset];
+        gf->featurefile_offset++;
+    }
+
+    unlock_user(s, buf, len);
+
+    /* Return number of bytes not read */
+    return len - i;
+}
+
+static uint32_t featurefile_isattyfn(RISCVCPU *cpu, GuestFD *gf)
+{
+    return 0;
+}
+
+static uint32_t featurefile_seekfn(RISCVCPU *cpu, GuestFD *gf,
+                                   target_ulong offset)
+{
+    gf->featurefile_offset =3D offset;
+    return 0;
+}
+
+static uint32_t featurefile_flenfn(RISCVCPU *cpu, GuestFD *gf)
+{
+    return sizeof(featurefile_data);
+}
+
+typedef struct GuestFDFunctions {
+    sys_closefn *closefn;
+    sys_writefn *writefn;
+    sys_readfn *readfn;
+    sys_isattyfn *isattyfn;
+    sys_seekfn *seekfn;
+    sys_flenfn *flenfn;
+} GuestFDFunctions;
+
+static const GuestFDFunctions guestfd_fns[] =3D {
+    [GuestFDHost] =3D {
+        .closefn =3D host_closefn,
+        .writefn =3D host_writefn,
+        .readfn =3D host_readfn,
+        .isattyfn =3D host_isattyfn,
+        .seekfn =3D host_seekfn,
+        .flenfn =3D host_flenfn,
+    },
+    [GuestFDGDB] =3D {
+        .closefn =3D gdb_closefn,
+        .writefn =3D gdb_writefn,
+        .readfn =3D gdb_readfn,
+        .isattyfn =3D gdb_isattyfn,
+        .seekfn =3D gdb_seekfn,
+        .flenfn =3D gdb_flenfn,
+    },
+    [GuestFDFeatureFile] =3D {
+        .closefn =3D featurefile_closefn,
+        .writefn =3D featurefile_writefn,
+        .readfn =3D featurefile_readfn,
+        .isattyfn =3D featurefile_isattyfn,
+        .seekfn =3D featurefile_seekfn,
+        .flenfn =3D featurefile_flenfn,
+    },
+};
+
+/*
+ * Read the input value from the argument block; fail the semihosting
+ * call if the memory read fails.
+ */
+#define GET_ARG(n) do {                                                 \
+        if (get_user_ual(arg ## n, args + (n) * sizeof(target_ulong))) { \
+            errno =3D EFAULT;                                             \
+            return set_swi_errno(env, -1);                              \
+        }                                                               \
+    } while (0)
+
+#define SET_ARG(n, val)                                 \
+    put_user_ual(val, args + (n) * sizeof(target_ulong))
+
+/*
+ * Do a semihosting call.
+ *
+ * The specification always says that the "return register" either
+ * returns a specific value or is corrupted, so we don't need to
+ * report to our caller whether we are returning a value or trying to
+ * leave the register unchanged. We use 0xdeadbeef as the return value
+ * when there isn't a defined return value for the call.
+ */
+target_ulong do_riscv_semihosting(CPURISCVState *env)
+{
+    RISCVCPU *cpu =3D env_archcpu(env);
+    CPUState *cs =3D env_cpu(env);
+    target_ulong args;
+    target_ulong arg0, arg1, arg2, arg3;
+    char *s;
+    int nr;
+    uint32_t ret;
+    uint32_t len;
+    GuestFD *gf;
+
+    nr =3D env->gpr[xA0] & 0xffffffffU;
+    args =3D env->gpr[xA1];
+
+    switch (nr) {
+    case TARGET_SYS_OPEN:
+    {
+        int guestfd;
+
+        GET_ARG(0);
+        GET_ARG(1);
+        GET_ARG(2);
+        s =3D lock_user_string(arg0);
+        if (!s) {
+            errno =3D EFAULT;
+            return set_swi_errno(env, -1);
+        }
+        if (arg1 >=3D 12) {
+            unlock_user(s, arg0, 0);
+            errno =3D EINVAL;
+            return set_swi_errno(env, -1);
+        }
+
+        guestfd =3D alloc_guestfd();
+        if (guestfd < 0) {
+            unlock_user(s, arg0, 0);
+            errno =3D EMFILE;
+            return set_swi_errno(env, -1);
+        }
+
+        if (strcmp(s, ":tt") =3D=3D 0) {
+            int result_fileno;
+
+            /*
+             * We implement SH_EXT_STDOUT_STDERR, so:
+             *  open for read =3D=3D stdin
+             *  open for write =3D=3D stdout
+             *  open for append =3D=3D stderr
+             */
+            if (arg1 < 4) {
+                result_fileno =3D STDIN_FILENO;
+            } else if (arg1 < 8) {
+                result_fileno =3D STDOUT_FILENO;
+            } else {
+                result_fileno =3D STDERR_FILENO;
+            }
+            associate_guestfd(guestfd, result_fileno);
+            unlock_user(s, arg0, 0);
+            return guestfd;
+        }
+        if (strcmp(s, ":semihosting-features") =3D=3D 0) {
+            unlock_user(s, arg0, 0);
+            /* We must fail opens for modes other than 0 ('r') or 1 ('rb')=
 */
+            if (arg1 !=3D 0 && arg1 !=3D 1) {
+                dealloc_guestfd(guestfd);
+                errno =3D EACCES;
+                return set_swi_errno(env, -1);
+            }
+            init_featurefile_guestfd(guestfd);
+            return guestfd;
+        }
+
+        if (use_gdb_syscalls()) {
+            riscv_semi_open_guestfd =3D guestfd;
+            ret =3D riscv_gdb_syscall(cpu, riscv_semi_open_cb,
+                                    "open,%s,%x,1a4", arg0,
+                                    (int)arg2 + 1, gdb_open_modeflags[arg1=
]);
+        } else {
+            ret =3D set_swi_errno(env, open(s, open_modeflags[arg1], 0644)=
);
+            if (ret =3D=3D (uint32_t)-1) {
+                dealloc_guestfd(guestfd);
+            } else {
+                associate_guestfd(guestfd, ret);
+                ret =3D guestfd;
+            }
+        }
+        unlock_user(s, arg0, 0);
+        return ret;
+    }
+    case TARGET_SYS_CLOSE:
+        GET_ARG(0);
+
+        gf =3D get_guestfd(arg0);
+        if (!gf) {
+            errno =3D EBADF;
+            return set_swi_errno(env, -1);
+        }
+
+        ret =3D guestfd_fns[gf->type].closefn(cpu, gf);
+        dealloc_guestfd(arg0);
+        return ret;
+    case TARGET_SYS_WRITEC:
+        qemu_semihosting_console_outc(env, args);
+        return 0xdeadbeef;
+    case TARGET_SYS_WRITE0:
+        return qemu_semihosting_console_outs(env, args);
+    case TARGET_SYS_WRITE:
+        GET_ARG(0);
+        GET_ARG(1);
+        GET_ARG(2);
+        len =3D arg2;
+
+        gf =3D get_guestfd(arg0);
+        if (!gf) {
+            errno =3D EBADF;
+            return set_swi_errno(env, -1);
+        }
+
+        return guestfd_fns[gf->type].writefn(cpu, gf, arg1, len);
+    case TARGET_SYS_READ:
+        GET_ARG(0);
+        GET_ARG(1);
+        GET_ARG(2);
+        len =3D arg2;
+
+        gf =3D get_guestfd(arg0);
+        if (!gf) {
+            errno =3D EBADF;
+            return set_swi_errno(env, -1);
+        }
+
+        return guestfd_fns[gf->type].readfn(cpu, gf, arg1, len);
+    case TARGET_SYS_READC:
+        return qemu_semihosting_console_inc(env);
+    case TARGET_SYS_ISTTY:
+        GET_ARG(0);
+
+        gf =3D get_guestfd(arg0);
+        if (!gf) {
+            errno =3D EBADF;
+            return set_swi_errno(env, -1);
+        }
+
+        return guestfd_fns[gf->type].isattyfn(cpu, gf);
+    case TARGET_SYS_SEEK:
+        GET_ARG(0);
+        GET_ARG(1);
+
+        gf =3D get_guestfd(arg0);
+        if (!gf) {
+            errno =3D EBADF;
+            return set_swi_errno(env, -1);
+        }
+
+        return guestfd_fns[gf->type].seekfn(cpu, gf, arg1);
+    case TARGET_SYS_FLEN:
+        GET_ARG(0);
+
+        gf =3D get_guestfd(arg0);
+        if (!gf) {
+            errno =3D EBADF;
+            return set_swi_errno(env, -1);
+        }
+
+        return guestfd_fns[gf->type].flenfn(cpu, gf);
+    case TARGET_SYS_TMPNAM:
+        qemu_log_mask(LOG_UNIMP, "%s: SYS_TMPNAM not implemented", __func_=
_);
+        return -1;
+    case TARGET_SYS_REMOVE:
+        GET_ARG(0);
+        GET_ARG(1);
+        if (use_gdb_syscalls()) {
+            ret =3D riscv_gdb_syscall(cpu, riscv_semi_cb, "unlink,%s",
+                                  arg0, (int)arg1 + 1);
+        } else {
+            s =3D lock_user_string(arg0);
+            if (!s) {
+                errno =3D EFAULT;
+                return set_swi_errno(env, -1);
+            }
+            ret =3D  set_swi_errno(env, remove(s));
+            unlock_user(s, arg0, 0);
+        }
+        return ret;
+    case TARGET_SYS_RENAME:
+        GET_ARG(0);
+        GET_ARG(1);
+        GET_ARG(2);
+        GET_ARG(3);
+        if (use_gdb_syscalls()) {
+            return riscv_gdb_syscall(cpu, riscv_semi_cb, "rename,%s,%s",
+                                   arg0, (int)arg1 + 1, arg2, (int)arg3 + =
1);
+        } else {
+            char *s2;
+            s =3D lock_user_string(arg0);
+            s2 =3D lock_user_string(arg2);
+            if (!s || !s2) {
+                errno =3D EFAULT;
+                ret =3D set_swi_errno(env, -1);
+            } else {
+                ret =3D set_swi_errno(env, rename(s, s2));
+            }
+            if (s2) {
+                unlock_user(s2, arg2, 0);
+            }
+            if (s) {
+                unlock_user(s, arg0, 0);
+            }
+            return ret;
+        }
+    case TARGET_SYS_CLOCK:
+        return clock() / (CLOCKS_PER_SEC / 100);
+    case TARGET_SYS_TIME:
+        return set_swi_errno(env, time(NULL));
+    case TARGET_SYS_SYSTEM:
+        GET_ARG(0);
+        GET_ARG(1);
+        if (use_gdb_syscalls()) {
+            return riscv_gdb_syscall(cpu, riscv_semi_cb, "system,%s",
+                                   arg0, (int)arg1 + 1);
+        } else {
+            s =3D lock_user_string(arg0);
+            if (!s) {
+                errno =3D EFAULT;
+                return set_swi_errno(env, -1);
+            }
+            ret =3D set_swi_errno(env, system(s));
+            unlock_user(s, arg0, 0);
+            return ret;
+        }
+    case TARGET_SYS_ERRNO:
+        return get_swi_errno(env);
+    case TARGET_SYS_GET_CMDLINE:
+        {
+            /*
+             * Build a command-line from the original argv.
+             *
+             * The inputs are:
+             *     * arg0, pointer to a buffer of at least the size
+             *               specified in arg1.
+             *     * arg1, size of the buffer pointed to by arg0 in
+             *               bytes.
+             *
+             * The outputs are:
+             *     * arg0, pointer to null-terminated string of the
+             *               command line.
+             *     * arg1, length of the string pointed to by arg0.
+             */
+
+            char *output_buffer;
+            size_t input_size;
+            size_t output_size;
+            int status =3D 0;
+#if !defined(CONFIG_USER_ONLY)
+            const char *cmdline;
+#else
+            TaskState *ts =3D cs->opaque;
+#endif
+            GET_ARG(0);
+            GET_ARG(1);
+            input_size =3D arg1;
+            /* Compute the size of the output string.  */
+#if !defined(CONFIG_USER_ONLY)
+            cmdline =3D semihosting_get_cmdline();
+            if (cmdline =3D=3D NULL) {
+                cmdline =3D ""; /* Default to an empty line. */
+            }
+            output_size =3D strlen(cmdline) + 1; /* Count terminating 0. */
+#else
+            unsigned int i;
+
+            output_size =3D ts->info->arg_end - ts->info->arg_start;
+            if (!output_size) {
+                /*
+                 * We special-case the "empty command line" case (argc=3D=
=3D0).
+                 * Just provide the terminating 0.
+                 */
+                output_size =3D 1;
+            }
+#endif
+
+            if (output_size > input_size) {
+                /* Not enough space to store command-line arguments.  */
+                errno =3D E2BIG;
+                return set_swi_errno(env, -1);
+            }
+
+            /* Adjust the command-line length.  */
+            if (SET_ARG(1, output_size - 1)) {
+                /* Couldn't write back to argument block */
+                errno =3D EFAULT;
+                return set_swi_errno(env, -1);
+            }
+
+            /* Lock the buffer on the RISC-V side.  */
+            output_buffer =3D lock_user(VERIFY_WRITE, arg0, output_size, 0=
);
+            if (!output_buffer) {
+                errno =3D EFAULT;
+                return set_swi_errno(env, -1);
+            }
+
+            /* Copy the command-line arguments.  */
+#if !defined(CONFIG_USER_ONLY)
+            pstrcpy(output_buffer, output_size, cmdline);
+#else
+            if (output_size =3D=3D 1) {
+                /* Empty command-line.  */
+                output_buffer[0] =3D '\0';
+                goto out;
+            }
+
+            if (copy_from_user(output_buffer, ts->info->arg_start,
+                               output_size)) {
+                errno =3D EFAULT;
+                status =3D set_swi_errno(env, -1);
+                goto out;
+            }
+
+            /* Separate arguments by white spaces.  */
+            for (i =3D 0; i < output_size - 1; i++) {
+                if (output_buffer[i] =3D=3D 0) {
+                    output_buffer[i] =3D ' ';
+                }
+            }
+        out:
+#endif
+            /* Unlock the buffer on the RISC-V side.  */
+            unlock_user(output_buffer, arg0, output_size);
+
+            return status;
+        }
+    case TARGET_SYS_HEAPINFO:
+        {
+            target_ulong retvals[4];
+            target_ulong limit;
+            int i;
+#ifdef CONFIG_USER_ONLY
+            TaskState *ts =3D cs->opaque;
+#endif
+
+            GET_ARG(0);
+
+#ifdef CONFIG_USER_ONLY
+            /*
+             * Some C libraries assume the heap immediately follows .bss, =
so
+             * allocate it using sbrk.
+             */
+            if (!ts->heap_limit) {
+                abi_ulong ret;
+
+                ts->heap_base =3D do_brk(0);
+                limit =3D ts->heap_base + RISCV_HEAP_SIZE;
+                /* Try a big heap, and reduce the size if that fails.  */
+                for (;;) {
+                    ret =3D do_brk(limit);
+                    if (ret >=3D limit) {
+                        break;
+                    }
+                    limit =3D (ts->heap_base >> 1) + (limit >> 1);
+                }
+                ts->heap_limit =3D limit;
+            }
+
+            retvals[0] =3D ts->heap_base;
+            retvals[1] =3D ts->heap_limit;
+            retvals[2] =3D ts->stack_base;
+            retvals[3] =3D 0; /* Stack limit.  */
+#else
+            limit =3D ram_size;
+            /* TODO: Make this use the limit of the loaded application.  */
+            retvals[0] =3D limit / 2;
+            retvals[1] =3D limit;
+            retvals[2] =3D limit; /* Stack base */
+            retvals[3] =3D 0; /* Stack limit.  */
+#endif
+
+            for (i =3D 0; i < ARRAY_SIZE(retvals); i++) {
+                bool fail;
+
+                fail =3D put_user_ual(retvals[i],
+                                    arg0 + i * sizeof(target_ulong));
+
+                if (fail) {
+                    /* Couldn't write back to argument block */
+                    errno =3D EFAULT;
+                    return set_swi_errno(env, -1);
+                }
+            }
+            return 0;
+        }
+    case TARGET_SYS_EXIT:
+    case TARGET_SYS_EXIT_EXTENDED:
+        if (nr =3D=3D TARGET_SYS_EXIT_EXTENDED || sizeof(target_ulong) =3D=
=3D 0) {
+            /*
+             * The A64 version of SYS_EXIT takes a parameter block,
+             * so the application-exit type can return a subcode which
+             * is the exit status code from the application.
+             * SYS_EXIT_EXTENDED is an a new-in-v2.0 optional function
+             * which allows A32/T32 guests to also provide a status code.
+             */
+            GET_ARG(0);
+            GET_ARG(1);
+
+            if (arg0 =3D=3D ADP_Stopped_ApplicationExit) {
+                ret =3D arg1;
+            } else {
+                ret =3D 1;
+            }
+        } else {
+            /*
+             * The A32/T32 version of SYS_EXIT specifies only
+             * Stopped_ApplicationExit as normal exit, but does not
+             * allow the guest to specify the exit status code.
+             * Everything else is considered an error.
+             */
+            ret =3D (args =3D=3D ADP_Stopped_ApplicationExit) ? 0 : 1;
+        }
+        gdb_exit(env, ret);
+        exit(ret);
+    case TARGET_SYS_SYNCCACHE:
+        /*
+         * Clean the D-cache and invalidate the I-cache for the specified
+         * virtual address range. This is a nop for us since we don't
+         * implement caches. This is only present on A64.
+         */
+        if (sizeof(target_ulong) =3D=3D 8) {
+            return 0;
+        }
+        /* fall through -- invalid for A32/T32 */
+    default:
+        fprintf(stderr, "qemu: Unsupported SemiHosting SWI 0x%02x\n", nr);
+        cpu_dump_state(cs, stderr, 0);
+        abort();
+    }
+}
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 43bf7e39a6..eb65ace367 100644
=2D-- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -56,6 +56,7 @@ typedef struct DisasContext {
        to reset this known value.  */
     int frm;
     bool ext_ifencei;
+    CPUState *cs;
 } DisasContext;
=20
 #ifdef TARGET_RISCV64
@@ -705,6 +706,15 @@ static bool gen_shift(DisasContext *ctx, arg_r *a,
     return true;
 }
=20
+static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
+{
+    DisasContext *ctx =3D container_of(dcbase, DisasContext, base);
+    CPUState *cpu =3D ctx->cs;
+    CPURISCVState *env =3D cpu->env_ptr;
+
+    return cpu_ldl_code(env, pc);
+}
+
 /* Include insn module translation function */
 #include "insn_trans/trans_rvi.inc.c"
 #include "insn_trans/trans_rvm.inc.c"
@@ -772,6 +782,7 @@ static void riscv_tr_init_disas_context(DisasContextBas=
e *dcbase, CPUState *cs)
     ctx->misa =3D env->misa;
     ctx->frm =3D -1;  /* unknown rounding mode */
     ctx->ext_ifencei =3D cpu->cfg.ext_ifencei;
+    ctx->cs =3D cs;
 }
=20
 static void riscv_tr_tb_start(DisasContextBase *db, CPUState *cpu)
=2D-=20
2.25.1


--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


=2D-=20
=2Dkeith

--=-=-=--

--==-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEw4O3eCVWE9/bQJ2R2yIaaQAAABEFAl6KvSIACgkQ2yIaaQAA
ABGMDQ/+MU9W82GU8/mgTFPa9u7TGls8CJHzv3X5qcfW/2howR1+9yFV757+QJe4
38T4fX2Ax0aMbDbVoQmHUwPsgYQkllfqL9ikRb4DscpjCtIJPJbPZxs8MPv50hgt
vF20cvDiJeCg5eHT5usVi3mU+cSyXfu4NZK274ijpPrGKU/CGw7of6EZe1nNZXtU
e2VYRMEy+1KTv4Bj06otJ+J6jiBT1KetqBJoNtdt0IodcelIwtVkagSsIeCA/ltx
W7E5v5ll9Oud5XhlvtiFYAbEGq0EepcAiMzKps52+OmBdZRW4LBXF/1vwhe393mP
7qPPU4+9ZdfLXznxIBg4sJGZdH4HxlRY9Vy7o0MyBw29Bzoe0z9cg12HU3wOEzNp
PHK5EXeuUYxtmG/UE1QD9yQ4+kLKRGFbu4PhS9maD9tmRUZ9DtZKXbFramAIrMdP
bUJZyQjYRhot8YFA8myOPV8/DxHhTv9Fs7gfmkwK8CO1eliCJg2Uqobt0/pN+GMV
zM7ZbFMm3/yKmZD4w8xXeTgfjHVqkF5cpIVfyk5BTN/sTq9YSimuQKofzpJdqott
ANhwZmx4UEVEp9q6LlJAe+E5yBPK4lye2XNjb9LiAl51XekwIoX7fjvNzUwRmXO2
GoSP7/bnDydqgaC4lfkxq/e4v/nHHo5yrQkQW8jwapHfHmh36Jk=
=hJDQ
-----END PGP SIGNATURE-----
--==-=-=--


