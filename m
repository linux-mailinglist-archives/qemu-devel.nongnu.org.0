Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3716848634D
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 11:58:22 +0100 (CET)
Received: from localhost ([::1]:33790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5QTN-0002vX-94
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 05:58:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n5QDc-0007r2-2C
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 05:42:05 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:51613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n5QDV-0004lA-D0
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 05:42:03 -0500
Received: from quad ([82.142.12.178]) by mrelayeu.kundenserver.de (mreue009
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MXp1Q-1mtJF439pM-00YCJq; Thu, 06
 Jan 2022 11:41:43 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 05/27] linux-user: target_syscall.h remove definition
 TARGET_MINSIGSTKSZ
Date: Thu,  6 Jan 2022 11:41:15 +0100
Message-Id: <20220106104137.732883-6-laurent@vivier.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220106104137.732883-1-laurent@vivier.eu>
References: <20220106104137.732883-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:P+4YYXvdr8TVSFDawjtIrjcFujhs4NDGSefD2EvQL77pC/XqpOQ
 l6HHNmXe8StbTefbdvx8/WmgIcqVec7JSuIlqeR7nhR0HUNpSTVmV5p2DFWG/WUPlyLauNr
 DvuVFV55DBJLzmf7Vgo0R20RnsWSqsMkeSrH+oWITSE0iSnjobxlU6AT6e9+WdaGopOJoeh
 YptRl2o5RJivpvryAQRdg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:BcoB8/0vNNI=:o9IzJNNgTKcd8lFFLDSJWd
 zHUfZYbkkdn9XxmQepbe5HP55Yw4hzdoFYM1fvjG0Jt7T2GHXFNa9oAKwOizYKGBdMDKL4Kkj
 Bpw/O+3LP68eW4wjkNjWSvlp+5fzrwLmkkxiPSc4O0+V0eanOFVA+tYuegPDNaQdczlwNb7Yp
 GfdGZfYKbvrAkPz+8nd8uHF184U5qpsTdbqqsu4wEGNHl/3sjdOOLmSRGIGGJlJ5wy7j3Tiuv
 jkIbZDJQXoWz95LPKgmBT81DJf93OtCCBWHASo0tW7IIpwK8eahZ54YseXNufgTVNSSZFhaON
 avaLdl+ll0bOPieYCunJgYTH5d96/ickb6mPdA21uGOpbjUI266/u3ukeDspiJckhrAmvZGZi
 Z2Zl16wIO0WbNonvGvdC9KuoqCwX0OI3fWpWRFi8KQOyHsB4ndi75ycicewtdXT0Wp3PqJLfd
 0W9TZyfDfaOI0v8dBxgvtjDr5aa/dvvF6MRH93+ttmzap0S5YIGMWn8/vv9KnL4cA2AlrPJh7
 7RiJ0Qasc/wWkRwWwCfrmHiIzCXTafAMpVsXRFH2LgzVN25/vK4f2E8A+hc5U+JGHeqqQxjb9
 s5pDeRFQ3vvaKih7q4AeoQ7OJoA/amWYxOUDTTK8e2em9aE1SYN3/26ZSlwVDDIS0kNDEAhru
 qSKJMIJfatu8kibjmxsscU3/OCCsv40UjMw13rEQl8hkokelILydBD0AymBlikx+9tI4=
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Song Gao <gaosong@loongson.cn>

TARGET_MINSIGSTKSZ has been defined in generic/signal.h
or target_signal.h, We don't need to define it again.

Signed-off-by: Song Gao <gaosong@loongson.cn>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <1637893388-10282-3-git-send-email-gaosong@loongson.cn>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/aarch64/target_syscall.h    | 1 -
 linux-user/alpha/target_syscall.h      | 1 -
 linux-user/arm/target_syscall.h        | 1 -
 linux-user/cris/target_syscall.h       | 1 -
 linux-user/hppa/target_syscall.h       | 1 -
 linux-user/i386/target_syscall.h       | 1 -
 linux-user/m68k/target_syscall.h       | 1 -
 linux-user/microblaze/target_syscall.h | 1 -
 linux-user/mips/target_syscall.h       | 1 -
 linux-user/mips64/target_syscall.h     | 1 -
 linux-user/nios2/target_syscall.h      | 1 -
 linux-user/openrisc/target_syscall.h   | 1 -
 linux-user/ppc/target_syscall.h        | 1 -
 linux-user/riscv/target_syscall.h      | 1 -
 linux-user/s390x/target_syscall.h      | 1 -
 linux-user/sh4/target_syscall.h        | 1 -
 linux-user/sparc/target_syscall.h      | 1 -
 linux-user/x86_64/target_syscall.h     | 1 -
 18 files changed, 18 deletions(-)

diff --git a/linux-user/aarch64/target_syscall.h b/linux-user/aarch64/target_syscall.h
index 76f6c3391d33..508219d62aba 100644
--- a/linux-user/aarch64/target_syscall.h
+++ b/linux-user/aarch64/target_syscall.h
@@ -15,7 +15,6 @@ struct target_pt_regs {
 #endif
 #define UNAME_MINIMUM_RELEASE "3.8.0"
 #define TARGET_CLONE_BACKWARDS
-#define TARGET_MINSIGSTKSZ       2048
 #define TARGET_MCL_CURRENT 1
 #define TARGET_MCL_FUTURE  2
 #define TARGET_MCL_ONFAULT 4
diff --git a/linux-user/alpha/target_syscall.h b/linux-user/alpha/target_syscall.h
index 03091bf0a826..fda3a49f29be 100644
--- a/linux-user/alpha/target_syscall.h
+++ b/linux-user/alpha/target_syscall.h
@@ -63,7 +63,6 @@ struct target_pt_regs {
 #define TARGET_UAC_NOPRINT		1
 #define TARGET_UAC_NOFIX		2
 #define TARGET_UAC_SIGBUS		4
-#define TARGET_MINSIGSTKSZ              4096
 #define TARGET_MCL_CURRENT     0x2000
 #define TARGET_MCL_FUTURE      0x4000
 #define TARGET_MCL_ONFAULT     0x8000
diff --git a/linux-user/arm/target_syscall.h b/linux-user/arm/target_syscall.h
index e870ed7a5468..f04f9c9e3d75 100644
--- a/linux-user/arm/target_syscall.h
+++ b/linux-user/arm/target_syscall.h
@@ -27,7 +27,6 @@ struct target_pt_regs {
 
 #define TARGET_CLONE_BACKWARDS
 
-#define TARGET_MINSIGSTKSZ 2048
 #define TARGET_MCL_CURRENT 1
 #define TARGET_MCL_FUTURE  2
 #define TARGET_MCL_ONFAULT 4
diff --git a/linux-user/cris/target_syscall.h b/linux-user/cris/target_syscall.h
index 19e12814039c..0b5ebf1f0283 100644
--- a/linux-user/cris/target_syscall.h
+++ b/linux-user/cris/target_syscall.h
@@ -39,7 +39,6 @@ struct target_pt_regs {
 };
 
 #define TARGET_CLONE_BACKWARDS2
-#define TARGET_MINSIGSTKSZ 2048
 #define TARGET_MCL_CURRENT 1
 #define TARGET_MCL_FUTURE  2
 #define TARGET_MCL_ONFAULT 4
diff --git a/linux-user/hppa/target_syscall.h b/linux-user/hppa/target_syscall.h
index 0018bcb5c4dc..4b382c1fcf4a 100644
--- a/linux-user/hppa/target_syscall.h
+++ b/linux-user/hppa/target_syscall.h
@@ -22,7 +22,6 @@ struct target_pt_regs {
 #define UNAME_MACHINE "parisc"
 #define UNAME_MINIMUM_RELEASE "2.6.32"
 #define TARGET_CLONE_BACKWARDS
-#define TARGET_MINSIGSTKSZ       2048
 #define TARGET_MCL_CURRENT 1
 #define TARGET_MCL_FUTURE  2
 #define TARGET_MCL_ONFAULT 4
diff --git a/linux-user/i386/target_syscall.h b/linux-user/i386/target_syscall.h
index ed356b3908dc..aaade06b136a 100644
--- a/linux-user/i386/target_syscall.h
+++ b/linux-user/i386/target_syscall.h
@@ -150,7 +150,6 @@ struct target_vm86plus_struct {
 #define UNAME_MINIMUM_RELEASE "2.6.32"
 
 #define TARGET_CLONE_BACKWARDS
-#define TARGET_MINSIGSTKSZ 2048
 #define TARGET_MCL_CURRENT 1
 #define TARGET_MCL_FUTURE  2
 #define TARGET_MCL_ONFAULT 4
diff --git a/linux-user/m68k/target_syscall.h b/linux-user/m68k/target_syscall.h
index 23359a6299dd..8d4ddbd76c8f 100644
--- a/linux-user/m68k/target_syscall.h
+++ b/linux-user/m68k/target_syscall.h
@@ -20,7 +20,6 @@ struct target_pt_regs {
 #define UNAME_MACHINE "m68k"
 #define UNAME_MINIMUM_RELEASE "2.6.32"
 
-#define TARGET_MINSIGSTKSZ 2048
 #define TARGET_MCL_CURRENT 1
 #define TARGET_MCL_FUTURE  2
 #define TARGET_MCL_ONFAULT 4
diff --git a/linux-user/microblaze/target_syscall.h b/linux-user/microblaze/target_syscall.h
index 7f653db34f87..43362a1664ca 100644
--- a/linux-user/microblaze/target_syscall.h
+++ b/linux-user/microblaze/target_syscall.h
@@ -49,7 +49,6 @@ struct target_pt_regs {
 };
 
 #define TARGET_CLONE_BACKWARDS
-#define TARGET_MINSIGSTKSZ      2048
 #define TARGET_MCL_CURRENT 1
 #define TARGET_MCL_FUTURE  2
 #define TARGET_MCL_ONFAULT 4
diff --git a/linux-user/mips/target_syscall.h b/linux-user/mips/target_syscall.h
index f59057493a35..7a82661fdb47 100644
--- a/linux-user/mips/target_syscall.h
+++ b/linux-user/mips/target_syscall.h
@@ -24,7 +24,6 @@ struct target_pt_regs {
 #define UNAME_MINIMUM_RELEASE "2.6.32"
 
 #define TARGET_CLONE_BACKWARDS
-#define TARGET_MINSIGSTKSZ 2048
 #define TARGET_MCL_CURRENT 1
 #define TARGET_MCL_FUTURE  2
 #define TARGET_MCL_ONFAULT 4
diff --git a/linux-user/mips64/target_syscall.h b/linux-user/mips64/target_syscall.h
index cd1e1b496916..2c7a881c7434 100644
--- a/linux-user/mips64/target_syscall.h
+++ b/linux-user/mips64/target_syscall.h
@@ -21,7 +21,6 @@ struct target_pt_regs {
 #define UNAME_MINIMUM_RELEASE "2.6.32"
 
 #define TARGET_CLONE_BACKWARDS
-#define TARGET_MINSIGSTKSZ      2048
 #define TARGET_MCL_CURRENT 1
 #define TARGET_MCL_FUTURE  2
 #define TARGET_MCL_ONFAULT 4
diff --git a/linux-user/nios2/target_syscall.h b/linux-user/nios2/target_syscall.h
index 78006c24d479..561b28d2816a 100644
--- a/linux-user/nios2/target_syscall.h
+++ b/linux-user/nios2/target_syscall.h
@@ -30,7 +30,6 @@ struct target_pt_regs {
     unsigned long  orig_r7;
 };
 
-#define TARGET_MINSIGSTKSZ 2048
 #define TARGET_MCL_CURRENT 1
 #define TARGET_MCL_FUTURE  2
 #define TARGET_MCL_ONFAULT 4
diff --git a/linux-user/openrisc/target_syscall.h b/linux-user/openrisc/target_syscall.h
index ef0d89a551d5..7fe5b73d3bea 100644
--- a/linux-user/openrisc/target_syscall.h
+++ b/linux-user/openrisc/target_syscall.h
@@ -15,7 +15,6 @@ struct target_pt_regs {
 #define UNAME_MACHINE "openrisc"
 #define UNAME_MINIMUM_RELEASE "2.6.32"
 
-#define TARGET_MINSIGSTKSZ 2048
 #define TARGET_MCL_CURRENT 1
 #define TARGET_MCL_FUTURE  2
 #define TARGET_MCL_ONFAULT 4
diff --git a/linux-user/ppc/target_syscall.h b/linux-user/ppc/target_syscall.h
index b9c4b813d3e4..8b364697d4a6 100644
--- a/linux-user/ppc/target_syscall.h
+++ b/linux-user/ppc/target_syscall.h
@@ -71,7 +71,6 @@ struct target_revectored_struct {
 
 #define TARGET_CLONE_BACKWARDS
 
-#define TARGET_MINSIGSTKSZ 2048
 #define TARGET_MCL_CURRENT 0x2000
 #define TARGET_MCL_FUTURE  0x4000
 #define TARGET_MCL_ONFAULT 0x8000
diff --git a/linux-user/riscv/target_syscall.h b/linux-user/riscv/target_syscall.h
index 9b1316132496..7601f10c28e7 100644
--- a/linux-user/riscv/target_syscall.h
+++ b/linux-user/riscv/target_syscall.h
@@ -51,7 +51,6 @@ struct target_pt_regs {
 #define UNAME_MINIMUM_RELEASE "4.15.0"
 #endif
 
-#define TARGET_MINSIGSTKSZ 2048
 #define TARGET_MCL_CURRENT 1
 #define TARGET_MCL_FUTURE  2
 #define TARGET_MCL_ONFAULT 4
diff --git a/linux-user/s390x/target_syscall.h b/linux-user/s390x/target_syscall.h
index 94f84178db79..4018988a25e1 100644
--- a/linux-user/s390x/target_syscall.h
+++ b/linux-user/s390x/target_syscall.h
@@ -27,7 +27,6 @@ struct target_pt_regs {
 #define UNAME_MINIMUM_RELEASE "2.6.32"
 
 #define TARGET_CLONE_BACKWARDS2
-#define TARGET_MINSIGSTKSZ        2048
 #define TARGET_MCL_CURRENT 1
 #define TARGET_MCL_FUTURE  2
 #define TARGET_MCL_ONFAULT 4
diff --git a/linux-user/sh4/target_syscall.h b/linux-user/sh4/target_syscall.h
index c1437adafefa..148398855dfe 100644
--- a/linux-user/sh4/target_syscall.h
+++ b/linux-user/sh4/target_syscall.h
@@ -15,7 +15,6 @@ struct target_pt_regs {
 #define UNAME_MACHINE "sh4"
 #define UNAME_MINIMUM_RELEASE "2.6.32"
 
-#define TARGET_MINSIGSTKSZ 2048
 #define TARGET_MCL_CURRENT 1
 #define TARGET_MCL_FUTURE  2
 #define TARGET_MCL_ONFAULT 4
diff --git a/linux-user/sparc/target_syscall.h b/linux-user/sparc/target_syscall.h
index 087b39d39c4c..be77e44eb860 100644
--- a/linux-user/sparc/target_syscall.h
+++ b/linux-user/sparc/target_syscall.h
@@ -34,7 +34,6 @@ struct target_pt_regs {
  * and copy_thread().
  */
 #define TARGET_CLONE_BACKWARDS
-#define TARGET_MINSIGSTKSZ      4096
 #define TARGET_MCL_CURRENT 0x2000
 #define TARGET_MCL_FUTURE  0x4000
 #define TARGET_MCL_ONFAULT 0x8000
diff --git a/linux-user/x86_64/target_syscall.h b/linux-user/x86_64/target_syscall.h
index 3ecccb72be2d..fb558345d30b 100644
--- a/linux-user/x86_64/target_syscall.h
+++ b/linux-user/x86_64/target_syscall.h
@@ -100,7 +100,6 @@ struct target_msqid64_ds {
 #define TARGET_ARCH_SET_FS 0x1002
 #define TARGET_ARCH_GET_FS 0x1003
 #define TARGET_ARCH_GET_GS 0x1004
-#define TARGET_MINSIGSTKSZ 2048
 #define TARGET_MCL_CURRENT 1
 #define TARGET_MCL_FUTURE  2
 #define TARGET_MCL_ONFAULT 4
-- 
2.33.1


