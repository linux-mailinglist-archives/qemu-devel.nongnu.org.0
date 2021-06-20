Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B57893AE020
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Jun 2021 22:01:21 +0200 (CEST)
Received: from localhost ([::1]:56498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lv3d8-0000sp-Qd
	for lists+qemu-devel@lfdr.de; Sun, 20 Jun 2021 16:01:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <email@aabouzied.com>)
 id 1lv3TJ-0006hk-SH
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 15:51:09 -0400
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234]:43565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <email@aabouzied.com>)
 id 1lv3TG-0001mx-CO
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 15:51:09 -0400
Received: by mail-lj1-x234.google.com with SMTP id g13so11740155ljj.10
 for <qemu-devel@nongnu.org>; Sun, 20 Jun 2021 12:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aabouzied-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p5h0JjwkLtlyMgURgpiHReyQMLiWnS7wvJiMHxGMo9U=;
 b=GRXshp64DTR2BYUSqVyVoDtXz2u/Clwr0HHEt1B4roC9IEdE7Ff+32IgSyc/Z6oNgv
 pERQ0hqkSQxgWWkj7xVPdTplhNiAudz+N8N96er/DQ94fABeBDcwb77sFf2xWmllaQO7
 TN1YBuZD3EV/tX9pGKQxjJ36zSepicreQzcszBjjSb9tw0Xi2g0tJGouZGqy7m80zEsh
 Y3d/N93TXHbYvCDwNZ3scRYCYV8LvXNzS1q9+dr3UORYqgRR3bBe7m8uKYKI0N9DlTQI
 DslzQHxysUO5DDQDx0yvlPWXVxngS70oqDUa7FevgGTNjzO1Q9uqk0fvPu9kxG65MnmQ
 8cVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p5h0JjwkLtlyMgURgpiHReyQMLiWnS7wvJiMHxGMo9U=;
 b=itTZ7UMk1cwOX+ypkSJqjPHd83bmzharts+Do+sMjopehHM7rwBNFWcFa6fZOglhIN
 5u9ovnPRo4M8Or1jWZiJixLqHStDs4aWWWVbkdRj8WwpaKEUHwCG1HX+eWdSD8nRKoDN
 q6aUCzBcMuJDwq3+B0SdLp5+YziqBDh/Lel+Wh3wpaiOipB1RX1r7CayPtNzPFEM8TmT
 xIijVMnbES3vtSxVdb1Fm0reMQpl1yXmqqbiglJlyzxjr5ZkLi0sUGq+lGtVT1xTdzqG
 o3ZTXWDp7yy2ke+PSGvBUCTROOz2H2PViZAr7rr8WTcoTcWNXxUezNSOOi7YIQGUTRdH
 cbHg==
X-Gm-Message-State: AOAM531oFvl7IyOxCy6AR4JvGyTaI0qPfQ/DVE3m2P0/pkuiQMY/gHxn
 Max30tlUOaKZRmi7e2i4bKNsJFZ7EjX82UL5DTM5mg==
X-Google-Smtp-Source: ABdhPJxpWxCiRs45cofZgzB9ta+DqjmyzHxZRNXjM9fMHN0b+KgzmCxtF+EqlSRxFphmRSAWdqGK9Q==
X-Received: by 2002:a05:6000:1203:: with SMTP id
 e3mr23815569wrx.107.1624212253854; 
 Sun, 20 Jun 2021 11:04:13 -0700 (PDT)
Received: from pythagoras.localdomain ([154.190.215.81])
 by smtp.gmail.com with ESMTPSA id l22sm14883741wrz.54.2021.06.20.11.04.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jun 2021 11:04:13 -0700 (PDT)
From: Ahmed Abouzied <email@aabouzied.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] ppc: Replace TAB indentations with spaces
Date: Sun, 20 Jun 2021 20:04:10 +0200
Message-Id: <20210620180410.10837-1-email@aabouzied.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::234;
 envelope-from=email@aabouzied.com; helo=mail-lj1-x234.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NO_DNS_FOR_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: qemu-trivial@nongnu.org, Ahmed Abouzied <email@aabouzied.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replaces TABs with spaces, making sure to have a consistent coding style
of 4 space indentations in the ppc subsystem.

Signed-off-by: Ahmed Abouzied <email@aabouzied.com>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/374
---
 hw/core/uboot_image.h  | 184 ++++++++++++++++++++---------------------
 hw/ppc/ppc440_bamboo.c |   6 +-
 hw/ppc/spapr.c         |   2 +-
 hw/ppc/spapr_rtas.c    |  18 ++--
 include/hw/ppc/ppc.h   |  10 +--
 5 files changed, 110 insertions(+), 110 deletions(-)

diff --git a/hw/core/uboot_image.h b/hw/core/uboot_image.h
index 608022de6e..11b98cdf74 100644
--- a/hw/core/uboot_image.h
+++ b/hw/core/uboot_image.h
@@ -12,7 +12,7 @@
  *
  * This program is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	 See the
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.     See the
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License along
@@ -32,127 +32,127 @@
 /*
  * Operating System Codes
  */
-#define IH_OS_INVALID		0	/* Invalid OS	*/
-#define IH_OS_OPENBSD		1	/* OpenBSD	*/
-#define IH_OS_NETBSD		2	/* NetBSD	*/
-#define IH_OS_FREEBSD		3	/* FreeBSD	*/
-#define IH_OS_4_4BSD		4	/* 4.4BSD	*/
-#define IH_OS_LINUX		5	/* Linux	*/
-#define IH_OS_SVR4		6	/* SVR4		*/
-#define IH_OS_ESIX		7	/* Esix		*/
-#define IH_OS_SOLARIS		8	/* Solaris	*/
-#define IH_OS_IRIX		9	/* Irix		*/
-#define IH_OS_SCO		10	/* SCO		*/
-#define IH_OS_DELL		11	/* Dell		*/
-#define IH_OS_NCR		12	/* NCR		*/
-#define IH_OS_LYNXOS		13	/* LynxOS	*/
-#define IH_OS_VXWORKS		14	/* VxWorks	*/
-#define IH_OS_PSOS		15	/* pSOS		*/
-#define IH_OS_QNX		16	/* QNX		*/
-#define IH_OS_U_BOOT		17	/* Firmware	*/
-#define IH_OS_RTEMS		18	/* RTEMS	*/
-#define IH_OS_ARTOS		19	/* ARTOS	*/
-#define IH_OS_UNITY		20	/* Unity OS	*/
+#define IH_OS_INVALID        0    /* Invalid OS    */
+#define IH_OS_OPENBSD        1    /* OpenBSD    */
+#define IH_OS_NETBSD        2    /* NetBSD    */
+#define IH_OS_FREEBSD        3    /* FreeBSD    */
+#define IH_OS_4_4BSD        4    /* 4.4BSD    */
+#define IH_OS_LINUX        5    /* Linux    */
+#define IH_OS_SVR4        6    /* SVR4        */
+#define IH_OS_ESIX        7    /* Esix        */
+#define IH_OS_SOLARIS        8    /* Solaris    */
+#define IH_OS_IRIX        9    /* Irix        */
+#define IH_OS_SCO        10    /* SCO        */
+#define IH_OS_DELL        11    /* Dell        */
+#define IH_OS_NCR        12    /* NCR        */
+#define IH_OS_LYNXOS        13    /* LynxOS    */
+#define IH_OS_VXWORKS        14    /* VxWorks    */
+#define IH_OS_PSOS        15    /* pSOS        */
+#define IH_OS_QNX        16    /* QNX        */
+#define IH_OS_U_BOOT        17    /* Firmware    */
+#define IH_OS_RTEMS        18    /* RTEMS    */
+#define IH_OS_ARTOS        19    /* ARTOS    */
+#define IH_OS_UNITY        20    /* Unity OS    */
 
 /*
  * CPU Architecture Codes (supported by Linux)
  */
-#define IH_CPU_INVALID		0	/* Invalid CPU	*/
-#define IH_CPU_ALPHA		1	/* Alpha	*/
-#define IH_CPU_ARM		2	/* ARM		*/
-#define IH_CPU_I386		3	/* Intel x86	*/
-#define IH_CPU_IA64		4	/* IA64		*/
-#define IH_CPU_MIPS		5	/* MIPS		*/
-#define IH_CPU_MIPS64		6	/* MIPS	 64 Bit */
-#define IH_CPU_PPC		7	/* PowerPC	*/
-#define IH_CPU_S390		8	/* IBM S390	*/
-#define IH_CPU_SH		9	/* SuperH	*/
-#define IH_CPU_SPARC		10	/* Sparc	*/
-#define IH_CPU_SPARC64		11	/* Sparc 64 Bit */
-#define IH_CPU_M68K		12	/* M68K		*/
-#define IH_CPU_NIOS		13	/* Nios-32	*/
-#define IH_CPU_MICROBLAZE	14	/* MicroBlaze   */
-#define IH_CPU_NIOS2		15	/* Nios-II	*/
-#define IH_CPU_BLACKFIN		16	/* Blackfin	*/
-#define IH_CPU_AVR32		17	/* AVR32	*/
+#define IH_CPU_INVALID        0    /* Invalid CPU    */
+#define IH_CPU_ALPHA        1    /* Alpha    */
+#define IH_CPU_ARM        2    /* ARM        */
+#define IH_CPU_I386        3    /* Intel x86    */
+#define IH_CPU_IA64        4    /* IA64        */
+#define IH_CPU_MIPS        5    /* MIPS        */
+#define IH_CPU_MIPS64        6    /* MIPS     64 Bit */
+#define IH_CPU_PPC        7    /* PowerPC    */
+#define IH_CPU_S390        8    /* IBM S390    */
+#define IH_CPU_SH        9    /* SuperH    */
+#define IH_CPU_SPARC        10    /* Sparc    */
+#define IH_CPU_SPARC64        11    /* Sparc 64 Bit */
+#define IH_CPU_M68K        12    /* M68K        */
+#define IH_CPU_NIOS        13    /* Nios-32    */
+#define IH_CPU_MICROBLAZE    14    /* MicroBlaze   */
+#define IH_CPU_NIOS2        15    /* Nios-II    */
+#define IH_CPU_BLACKFIN        16    /* Blackfin    */
+#define IH_CPU_AVR32        17    /* AVR32    */
 
 /*
  * Image Types
  *
  * "Standalone Programs" are directly runnable in the environment
- *	provided by U-Boot; it is expected that (if they behave
- *	well) you can continue to work in U-Boot after return from
- *	the Standalone Program.
+ *    provided by U-Boot; it is expected that (if they behave
+ *    well) you can continue to work in U-Boot after return from
+ *    the Standalone Program.
  * "OS Kernel Images" are usually images of some Embedded OS which
- *	will take over control completely. Usually these programs
- *	will install their own set of exception handlers, device
- *	drivers, set up the MMU, etc. - this means, that you cannot
- *	expect to re-enter U-Boot except by resetting the CPU.
+ *    will take over control completely. Usually these programs
+ *    will install their own set of exception handlers, device
+ *    drivers, set up the MMU, etc. - this means, that you cannot
+ *    expect to re-enter U-Boot except by resetting the CPU.
  * "RAMDisk Images" are more or less just data blocks, and their
- *	parameters (address, size) are passed to an OS kernel that is
- *	being started.
+ *    parameters (address, size) are passed to an OS kernel that is
+ *    being started.
  * "Multi-File Images" contain several images, typically an OS
- *	(Linux) kernel image and one or more data images like
- *	RAMDisks. This construct is useful for instance when you want
- *	to boot over the network using BOOTP etc., where the boot
- *	server provides just a single image file, but you want to get
- *	for instance an OS kernel and a RAMDisk image.
+ *    (Linux) kernel image and one or more data images like
+ *    RAMDisks. This construct is useful for instance when you want
+ *    to boot over the network using BOOTP etc., where the boot
+ *    server provides just a single image file, but you want to get
+ *    for instance an OS kernel and a RAMDisk image.
  *
- *	"Multi-File Images" start with a list of image sizes, each
- *	image size (in bytes) specified by an "uint32_t" in network
- *	byte order. This list is terminated by an "(uint32_t)0".
- *	Immediately after the terminating 0 follow the images, one by
- *	one, all aligned on "uint32_t" boundaries (size rounded up to
- *	a multiple of 4 bytes - except for the last file).
+ *    "Multi-File Images" start with a list of image sizes, each
+ *    image size (in bytes) specified by an "uint32_t" in network
+ *    byte order. This list is terminated by an "(uint32_t)0".
+ *    Immediately after the terminating 0 follow the images, one by
+ *    one, all aligned on "uint32_t" boundaries (size rounded up to
+ *    a multiple of 4 bytes - except for the last file).
  *
  * "Firmware Images" are binary images containing firmware (like
- *	U-Boot or FPGA images) which usually will be programmed to
- *	flash memory.
+ *    U-Boot or FPGA images) which usually will be programmed to
+ *    flash memory.
  *
  * "Script files" are command sequences that will be executed by
- *	U-Boot's command interpreter; this feature is especially
- *	useful when you configure U-Boot to use a real shell (hush)
- *	as command interpreter (=> Shell Scripts).
+ *    U-Boot's command interpreter; this feature is especially
+ *    useful when you configure U-Boot to use a real shell (hush)
+ *    as command interpreter (=> Shell Scripts).
  */
 
-#define IH_TYPE_INVALID		0	/* Invalid Image		*/
-#define IH_TYPE_STANDALONE	1	/* Standalone Program		*/
-#define IH_TYPE_KERNEL		2	/* OS Kernel Image		*/
-#define IH_TYPE_RAMDISK		3	/* RAMDisk Image		*/
-#define IH_TYPE_MULTI		4	/* Multi-File Image		*/
-#define IH_TYPE_FIRMWARE	5	/* Firmware Image		*/
-#define IH_TYPE_SCRIPT		6	/* Script file			*/
-#define IH_TYPE_FILESYSTEM	7	/* Filesystem Image (any type)	*/
-#define IH_TYPE_FLATDT		8	/* Binary Flat Device Tree Blob	*/
-#define IH_TYPE_KERNEL_NOLOAD  14	/* OS Kernel Image (noload)	*/
+#define IH_TYPE_INVALID        0    /* Invalid Image        */
+#define IH_TYPE_STANDALONE    1    /* Standalone Program        */
+#define IH_TYPE_KERNEL        2    /* OS Kernel Image        */
+#define IH_TYPE_RAMDISK        3    /* RAMDisk Image        */
+#define IH_TYPE_MULTI        4    /* Multi-File Image        */
+#define IH_TYPE_FIRMWARE    5    /* Firmware Image        */
+#define IH_TYPE_SCRIPT        6    /* Script file            */
+#define IH_TYPE_FILESYSTEM    7    /* Filesystem Image (any type)    */
+#define IH_TYPE_FLATDT        8    /* Binary Flat Device Tree Blob    */
+#define IH_TYPE_KERNEL_NOLOAD  14    /* OS Kernel Image (noload)    */
 
 /*
  * Compression Types
  */
-#define IH_COMP_NONE		0	/*  No	 Compression Used	*/
-#define IH_COMP_GZIP		1	/* gzip	 Compression Used	*/
-#define IH_COMP_BZIP2		2	/* bzip2 Compression Used	*/
+#define IH_COMP_NONE        0    /*  No     Compression Used    */
+#define IH_COMP_GZIP        1    /* gzip     Compression Used    */
+#define IH_COMP_BZIP2        2    /* bzip2 Compression Used    */
 
-#define IH_MAGIC	0x27051956	/* Image Magic Number		*/
-#define IH_NMLEN		32	/* Image Name Length		*/
+#define IH_MAGIC    0x27051956    /* Image Magic Number        */
+#define IH_NMLEN        32    /* Image Name Length        */
 
 /*
  * all data in network byte order (aka natural aka bigendian)
  */
 
 typedef struct uboot_image_header {
-	uint32_t	ih_magic;	/* Image Header Magic Number	*/
-	uint32_t	ih_hcrc;	/* Image Header CRC Checksum	*/
-	uint32_t	ih_time;	/* Image Creation Timestamp	*/
-	uint32_t	ih_size;	/* Image Data Size		*/
-	uint32_t	ih_load;	/* Data	 Load  Address		*/
-	uint32_t	ih_ep;		/* Entry Point Address		*/
-	uint32_t	ih_dcrc;	/* Image Data CRC Checksum	*/
-	uint8_t		ih_os;		/* Operating System		*/
-	uint8_t		ih_arch;	/* CPU architecture		*/
-	uint8_t		ih_type;	/* Image Type			*/
-	uint8_t		ih_comp;	/* Compression Type		*/
-	uint8_t		ih_name[IH_NMLEN];	/* Image Name		*/
+    uint32_t    ih_magic;    /* Image Header Magic Number    */
+    uint32_t    ih_hcrc;    /* Image Header CRC Checksum    */
+    uint32_t    ih_time;    /* Image Creation Timestamp    */
+    uint32_t    ih_size;    /* Image Data Size        */
+    uint32_t    ih_load;    /* Data     Load  Address        */
+    uint32_t    ih_ep;        /* Entry Point Address        */
+    uint32_t    ih_dcrc;    /* Image Data CRC Checksum    */
+    uint8_t        ih_os;        /* Operating System        */
+    uint8_t        ih_arch;    /* CPU architecture        */
+    uint8_t        ih_type;    /* Image Type            */
+    uint8_t        ih_comp;    /* Compression Type        */
+    uint8_t        ih_name[IH_NMLEN];    /* Image Name        */
 } uboot_image_header_t;
 
 
diff --git a/hw/ppc/ppc440_bamboo.c b/hw/ppc/ppc440_bamboo.c
index 7fb620b9a0..06db2a118a 100644
--- a/hw/ppc/ppc440_bamboo.c
+++ b/hw/ppc/ppc440_bamboo.c
@@ -3,9 +3,9 @@
  *
  * Copyright 2007 IBM Corporation.
  * Authors:
- *	Jerone Young <jyoung5@us.ibm.com>
- *	Christian Ehrhardt <ehrhardt@linux.vnet.ibm.com>
- *	Hollis Blanchard <hollisb@us.ibm.com>
+ *    Jerone Young <jyoung5@us.ibm.com>
+ *    Christian Ehrhardt <ehrhardt@linux.vnet.ibm.com>
+ *    Hollis Blanchard <hollisb@us.ibm.com>
  *
  * This work is licensed under the GNU GPL license version 2 or later.
  *
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 4dd90b75cc..b74b0e6713 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -921,7 +921,7 @@ static void spapr_dt_rtas(SpaprMachineState *spapr, void *fdt)
      * is off-by-one.
      */
     _FDT(fdt_setprop_cell(fdt, rtas, "rtas-size", RTAS_ERROR_LOG_MAX +
-			  ms->smp.max_cpus * sizeof(uint64_t)*2 + sizeof(uint64_t)));
+              ms->smp.max_cpus * sizeof(uint64_t)*2 + sizeof(uint64_t)));
     _FDT(fdt_setprop_cell(fdt, rtas, "rtas-error-log-max",
                           RTAS_ERROR_LOG_MAX));
     _FDT(fdt_setprop_cell(fdt, rtas, "rtas-event-scan-rate",
diff --git a/hw/ppc/spapr_rtas.c b/hw/ppc/spapr_rtas.c
index b476382ae6..1ca41a5c7a 100644
--- a/hw/ppc/spapr_rtas.c
+++ b/hw/ppc/spapr_rtas.c
@@ -475,16 +475,16 @@ static void rtas_ibm_nmi_interlock(PowerPCCPU *cpu,
 
     if (spapr->fwnmi_machine_check_interlock != cpu->vcpu_id) {
         /*
-	 * The vCPU that hit the NMI should invoke "ibm,nmi-interlock"
+     * The vCPU that hit the NMI should invoke "ibm,nmi-interlock"
          * This should be PARAM_ERROR, but Linux calls "ibm,nmi-interlock"
-	 * for system reset interrupts, despite them not being interlocked.
-	 * PowerVM silently ignores this and returns success here. Returning
-	 * failure causes Linux to print the error "FWNMI: nmi-interlock
-	 * failed: -3", although no other apparent ill effects, this is a
-	 * regression for the user when enabling FWNMI. So for now, match
-	 * PowerVM. When most Linux clients are fixed, this could be
-	 * changed.
-	 */
+     * for system reset interrupts, despite them not being interlocked.
+     * PowerVM silently ignores this and returns success here. Returning
+     * failure causes Linux to print the error "FWNMI: nmi-interlock
+     * failed: -3", although no other apparent ill effects, this is a
+     * regression for the user when enabling FWNMI. So for now, match
+     * PowerVM. When most Linux clients are fixed, this could be
+     * changed.
+     */
         rtas_st(rets, 0, RTAS_OUT_SUCCESS);
         return;
     }
diff --git a/include/hw/ppc/ppc.h b/include/hw/ppc/ppc.h
index 93e614cffd..f3fe9b0f6a 100644
--- a/include/hw/ppc/ppc.h
+++ b/include/hw/ppc/ppc.h
@@ -95,11 +95,11 @@ enum {
     ARCH_MAC99_U3,
 };
 
-#define FW_CFG_PPC_WIDTH	(FW_CFG_ARCH_LOCAL + 0x00)
-#define FW_CFG_PPC_HEIGHT	(FW_CFG_ARCH_LOCAL + 0x01)
-#define FW_CFG_PPC_DEPTH	(FW_CFG_ARCH_LOCAL + 0x02)
-#define FW_CFG_PPC_TBFREQ	(FW_CFG_ARCH_LOCAL + 0x03)
-#define FW_CFG_PPC_CLOCKFREQ	(FW_CFG_ARCH_LOCAL + 0x04)
+#define FW_CFG_PPC_WIDTH    (FW_CFG_ARCH_LOCAL + 0x00)
+#define FW_CFG_PPC_HEIGHT    (FW_CFG_ARCH_LOCAL + 0x01)
+#define FW_CFG_PPC_DEPTH    (FW_CFG_ARCH_LOCAL + 0x02)
+#define FW_CFG_PPC_TBFREQ    (FW_CFG_ARCH_LOCAL + 0x03)
+#define FW_CFG_PPC_CLOCKFREQ    (FW_CFG_ARCH_LOCAL + 0x04)
 #define FW_CFG_PPC_IS_KVM       (FW_CFG_ARCH_LOCAL + 0x05)
 #define FW_CFG_PPC_KVM_HC       (FW_CFG_ARCH_LOCAL + 0x06)
 #define FW_CFG_PPC_KVM_PID      (FW_CFG_ARCH_LOCAL + 0x07)
-- 
2.25.1


