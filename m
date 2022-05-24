Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2978A5333D1
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 01:14:36 +0200 (CEST)
Received: from localhost ([::1]:40834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntdjX-0000Vt-7h
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 19:14:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1363756b6=alistair.francis@opensource.wdc.com>)
 id 1ntdHs-0000tq-Ku
 for qemu-devel@nongnu.org; Tue, 24 May 2022 18:46:00 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:62510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1363756b6=alistair.francis@opensource.wdc.com>)
 id 1ntdHn-0002sH-QR
 for qemu-devel@nongnu.org; Tue, 24 May 2022 18:46:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1653432355; x=1684968355;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fNUT1P5NvEeO/P7dZC8V7Z4rGMs3oqY4M4kiC4EP43Y=;
 b=QSRojfcZ7+/vub4ok0Aa1l0t429QjrmDtpM6fAAG3YROGI3GNsqzmBDd
 K3hoRWNI7RkDOFRteUkKw6e7ghRTx+kg+93KGemJxg4EMigywsp5M0v4R
 AYc6U6lfHfM0gkjRMhk6MUBzW8mDIeAkGO+1Acxb+HdElLfptl+1yDG8E
 8huy2w4jgjBKCjCGbjVVafwMY3on3RUEIJCAuw0SKsCs0lh88kdsdgIDF
 8bLIMpcujrBfODvF/jvzSmwT5gQGz3HHhporfxsUh/M2P/hnx39AKuBPA
 vv/1z243Zy/wfFT3F1nA3FO7JMs0YyDWj6DZxs5QyLGPcabpWq/Ct1atT g==;
X-IronPort-AV: E=Sophos;i="5.91,250,1647273600"; d="scan'208";a="305566722"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 25 May 2022 06:45:34 +0800
IronPort-SDR: ICx/FHiwsbQlwM0RT2P9Kt7J9qTv8GPBOTeSm86YmHVIj8zVWFOKr/VFYe3BeUOXV66o92n2Iv
 sptuqvBt9zGKrH5RGIa43CNbRLz7F4Fsxy/Ou9ndVeTNwgj32tVy4vrF4XzrbyayMjfH+S96tg
 ba/FVVjivwUJhq4zEuHlCiRkMNUl2qxmGl3xXVyhHloT45miFl5WsbYkuqPcnJ76sXuJIixzHl
 7zQ5bQJSDtc1bkKOyq9lQqs+JBhP/x+JUh0nGrcQBi7hWZBzkUi1e3Y7TtjQFC8GTmZsUgxi3o
 z5cxa08zk3tdWgNzZVmTlfFU
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 May 2022 15:05:06 -0700
IronPort-SDR: lmmiipIdMmTbH5y983bNLFeJ34pVv2if7aJrqf2ojAS6jnTDSyzOaBQs8hFjrycCV2oX0AW2Td
 UdS9WDGaVM9Xwo6zJh9YBmfyatZ65hMe2OFqeQRMlamo4ZPGeGa06jGcTlPlA7YrgBHpJB/soP
 AaYkWU9tzhuuIqRNMvxWWroth+P17r7i60DtdmAtMY9C+Ppte6Kk8nnKmM7VxDghwVC3K/zJde
 QzI9/3XgNNStOfz4gii65zfjoHu2Zl1PJozlAgetJwaHsx7470llp/JUkXL57BmT3yBMqbrHyp
 HW8=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 May 2022 15:45:34 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4L78Rd738kz1Rwrw
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 15:45:33 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1653432333; x=1656024334; bh=fNUT1P5NvEeO/P7dZC
 8V7Z4rGMs3oqY4M4kiC4EP43Y=; b=JeYaxSTL+GmA9bcMQ1Z9oVYmRu+e7C3nTL
 z8pNySoHH8fQoW6FCJkGc79mZpWzbaVSIp+Z5xwpC6Rag6qD2WNtVhrF11C0+QAq
 /4sRJWg3xVTINpT+nCy0vmOQNMiQ46jdRwvqODEOWTm6nH4ueMzpcoD5qPAO8f8O
 zqOhoXnhb2rG5Vx4WkFr1St0kdP8PPqixF9CzIfSxrQPiLIksDmC1DER7xpekmlm
 pWkAVWR0rgBB5lS5xUHVqpAyOtU23yc9639P3LX5FMNdjJwzrhgSHr4TC8JH8r2T
 XN3H+zRLhea1CtFjJP99GHyt5gWe4KI29hN4YMpyea7u49kyVt+w==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id UCGsc5FKe1Xx for <qemu-devel@nongnu.org>;
 Tue, 24 May 2022 15:45:33 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.5])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4L78RZ6gykz1Rvlc;
 Tue, 24 May 2022 15:45:30 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 22/23] hw/core: Sync uboot_image.h from U-Boot v2022.01
Date: Wed, 25 May 2022 08:44:27 +1000
Message-Id: <20220524224428.552334-23-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220524224428.552334-1-alistair.francis@opensource.wdc.com>
References: <20220524224428.552334-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=1363756b6=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

Sync uboot_image.h from upstream U-Boot v2022.01 release [1].

[1] https://source.denx.de/u-boot/u-boot/-/blob/v2022.01/include/image.h

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220324134812.541274-1-bmeng.cn@gmail.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/core/uboot_image.h | 213 ++++++++++++++++++++++++++++--------------
 1 file changed, 142 insertions(+), 71 deletions(-)

diff --git a/hw/core/uboot_image.h b/hw/core/uboot_image.h
index 608022de6e..18ac293359 100644
--- a/hw/core/uboot_image.h
+++ b/hw/core/uboot_image.h
@@ -1,23 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
 /*
+ * (C) Copyright 2008 Semihalf
+ *
  * (C) Copyright 2000-2005
  * Wolfgang Denk, DENX Software Engineering, wd@denx.de.
- *
- * See file CREDITS for list of people who contributed to this
- * project.
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License as
- * published by the Free Software Foundation; either version 2 of
- * the License, or (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	 See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License alo=
ng
- * with this program; if not, see <http://www.gnu.org/licenses/>.
- *
  ********************************************************************
  * NOTE: This header file defines an interface to U-Boot. Including
  * this (unmodified) header file in another file is considered normal
@@ -31,50 +17,83 @@
=20
 /*
  * Operating System Codes
+ *
+ * The following are exposed to uImage header.
+ * New IDs *MUST* be appended at the end of the list and *NEVER*
+ * inserted for backward compatibility.
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
+enum {
+	IH_OS_INVALID		=3D 0,	/* Invalid OS	*/
+	IH_OS_OPENBSD,			/* OpenBSD	*/
+	IH_OS_NETBSD,			/* NetBSD	*/
+	IH_OS_FREEBSD,			/* FreeBSD	*/
+	IH_OS_4_4BSD,			/* 4.4BSD	*/
+	IH_OS_LINUX,			/* Linux	*/
+	IH_OS_SVR4,			/* SVR4		*/
+	IH_OS_ESIX,			/* Esix		*/
+	IH_OS_SOLARIS,			/* Solaris	*/
+	IH_OS_IRIX,			/* Irix		*/
+	IH_OS_SCO,			/* SCO		*/
+	IH_OS_DELL,			/* Dell		*/
+	IH_OS_NCR,			/* NCR		*/
+	IH_OS_LYNXOS,			/* LynxOS	*/
+	IH_OS_VXWORKS,			/* VxWorks	*/
+	IH_OS_PSOS,			/* pSOS		*/
+	IH_OS_QNX,			/* QNX		*/
+	IH_OS_U_BOOT,			/* Firmware	*/
+	IH_OS_RTEMS,			/* RTEMS	*/
+	IH_OS_ARTOS,			/* ARTOS	*/
+	IH_OS_UNITY,			/* Unity OS	*/
+	IH_OS_INTEGRITY,		/* INTEGRITY	*/
+	IH_OS_OSE,			/* OSE		*/
+	IH_OS_PLAN9,			/* Plan 9	*/
+	IH_OS_OPENRTOS,		/* OpenRTOS	*/
+	IH_OS_ARM_TRUSTED_FIRMWARE,     /* ARM Trusted Firmware */
+	IH_OS_TEE,			/* Trusted Execution Environment */
+	IH_OS_OPENSBI,			/* RISC-V OpenSBI */
+	IH_OS_EFI,			/* EFI Firmware (e.g. GRUB2) */
+
+	IH_OS_COUNT,
+};
=20
 /*
  * CPU Architecture Codes (supported by Linux)
+ *
+ * The following are exposed to uImage header.
+ * New IDs *MUST* be appended at the end of the list and *NEVER*
+ * inserted for backward compatibility.
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
+enum {
+	IH_ARCH_INVALID		=3D 0,	/* Invalid CPU	*/
+	IH_ARCH_ALPHA,			/* Alpha	*/
+	IH_ARCH_ARM,			/* ARM		*/
+	IH_ARCH_I386,			/* Intel x86	*/
+	IH_ARCH_IA64,			/* IA64		*/
+	IH_ARCH_MIPS,			/* MIPS		*/
+	IH_ARCH_MIPS64,			/* MIPS	 64 Bit */
+	IH_ARCH_PPC,			/* PowerPC	*/
+	IH_ARCH_S390,			/* IBM S390	*/
+	IH_ARCH_SH,			/* SuperH	*/
+	IH_ARCH_SPARC,			/* Sparc	*/
+	IH_ARCH_SPARC64,		/* Sparc 64 Bit */
+	IH_ARCH_M68K,			/* M68K		*/
+	IH_ARCH_NIOS,			/* Nios-32	*/
+	IH_ARCH_MICROBLAZE,		/* MicroBlaze   */
+	IH_ARCH_NIOS2,			/* Nios-II	*/
+	IH_ARCH_BLACKFIN,		/* Blackfin	*/
+	IH_ARCH_AVR32,			/* AVR32	*/
+	IH_ARCH_ST200,			/* STMicroelectronics ST200  */
+	IH_ARCH_SANDBOX,		/* Sandbox architecture (test only) */
+	IH_ARCH_NDS32,			/* ANDES Technology - NDS32  */
+	IH_ARCH_OPENRISC,		/* OpenRISC 1000  */
+	IH_ARCH_ARM64,			/* ARM64	*/
+	IH_ARCH_ARC,			/* Synopsys DesignWare ARC */
+	IH_ARCH_X86_64,			/* AMD x86_64, Intel and Via */
+	IH_ARCH_XTENSA,			/* Xtensa	*/
+	IH_ARCH_RISCV,			/* RISC-V */
+
+	IH_ARCH_COUNT,
+};
=20
 /*
  * Image Types
@@ -113,33 +132,85 @@
  *	U-Boot's command interpreter; this feature is especially
  *	useful when you configure U-Boot to use a real shell (hush)
  *	as command interpreter (=3D> Shell Scripts).
+ *
+ * The following are exposed to uImage header.
+ * New IDs *MUST* be appended at the end of the list and *NEVER*
+ * inserted for backward compatibility.
  */
=20
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
+enum {
+	IH_TYPE_INVALID		=3D 0,	/* Invalid Image		*/
+	IH_TYPE_STANDALONE,		/* Standalone Program		*/
+	IH_TYPE_KERNEL,			/* OS Kernel Image		*/
+	IH_TYPE_RAMDISK,		/* RAMDisk Image		*/
+	IH_TYPE_MULTI,			/* Multi-File Image		*/
+	IH_TYPE_FIRMWARE,		/* Firmware Image		*/
+	IH_TYPE_SCRIPT,			/* Script file			*/
+	IH_TYPE_FILESYSTEM,		/* Filesystem Image (any type)	*/
+	IH_TYPE_FLATDT,			/* Binary Flat Device Tree Blob	*/
+	IH_TYPE_KWBIMAGE,		/* Kirkwood Boot Image		*/
+	IH_TYPE_IMXIMAGE,		/* Freescale IMXBoot Image	*/
+	IH_TYPE_UBLIMAGE,		/* Davinci UBL Image		*/
+	IH_TYPE_OMAPIMAGE,		/* TI OMAP Config Header Image	*/
+	IH_TYPE_AISIMAGE,		/* TI Davinci AIS Image		*/
+	/* OS Kernel Image, can run from any load address */
+	IH_TYPE_KERNEL_NOLOAD,
+	IH_TYPE_PBLIMAGE,		/* Freescale PBL Boot Image	*/
+	IH_TYPE_MXSIMAGE,		/* Freescale MXSBoot Image	*/
+	IH_TYPE_GPIMAGE,		/* TI Keystone GPHeader Image	*/
+	IH_TYPE_ATMELIMAGE,		/* ATMEL ROM bootable Image	*/
+	IH_TYPE_SOCFPGAIMAGE,		/* Altera SOCFPGA CV/AV Preloader */
+	IH_TYPE_X86_SETUP,		/* x86 setup.bin Image		*/
+	IH_TYPE_LPC32XXIMAGE,		/* x86 setup.bin Image		*/
+	IH_TYPE_LOADABLE,		/* A list of typeless images	*/
+	IH_TYPE_RKIMAGE,		/* Rockchip Boot Image		*/
+	IH_TYPE_RKSD,			/* Rockchip SD card		*/
+	IH_TYPE_RKSPI,			/* Rockchip SPI image		*/
+	IH_TYPE_ZYNQIMAGE,		/* Xilinx Zynq Boot Image */
+	IH_TYPE_ZYNQMPIMAGE,		/* Xilinx ZynqMP Boot Image */
+	IH_TYPE_ZYNQMPBIF,		/* Xilinx ZynqMP Boot Image (bif) */
+	IH_TYPE_FPGA,			/* FPGA Image */
+	IH_TYPE_VYBRIDIMAGE,	/* VYBRID .vyb Image */
+	IH_TYPE_TEE,            /* Trusted Execution Environment OS Image */
+	IH_TYPE_FIRMWARE_IVT,		/* Firmware Image with HABv4 IVT */
+	IH_TYPE_PMMC,            /* TI Power Management Micro-Controller Firmwa=
re */
+	IH_TYPE_STM32IMAGE,		/* STMicroelectronics STM32 Image */
+	IH_TYPE_SOCFPGAIMAGE_V1,	/* Altera SOCFPGA A10 Preloader	*/
+	IH_TYPE_MTKIMAGE,		/* MediaTek BootROM loadable Image */
+	IH_TYPE_IMX8MIMAGE,		/* Freescale IMX8MBoot Image	*/
+	IH_TYPE_IMX8IMAGE,		/* Freescale IMX8Boot Image	*/
+	IH_TYPE_COPRO,			/* Coprocessor Image for remoteproc*/
+	IH_TYPE_SUNXI_EGON,		/* Allwinner eGON Boot Image */
+
+	IH_TYPE_COUNT,			/* Number of image types */
+};
=20
 /*
  * Compression Types
+ *
+ * The following are exposed to uImage header.
+ * New IDs *MUST* be appended at the end of the list and *NEVER*
+ * inserted for backward compatibility.
  */
-#define IH_COMP_NONE		0	/*  No	 Compression Used	*/
-#define IH_COMP_GZIP		1	/* gzip	 Compression Used	*/
-#define IH_COMP_BZIP2		2	/* bzip2 Compression Used	*/
+enum {
+	IH_COMP_NONE		=3D 0,	/*  No	 Compression Used	*/
+	IH_COMP_GZIP,			/* gzip	 Compression Used	*/
+	IH_COMP_BZIP2,			/* bzip2 Compression Used	*/
+	IH_COMP_LZMA,			/* lzma  Compression Used	*/
+	IH_COMP_LZO,			/* lzo   Compression Used	*/
+	IH_COMP_LZ4,			/* lz4   Compression Used	*/
+	IH_COMP_ZSTD,			/* zstd   Compression Used	*/
+
+	IH_COMP_COUNT,
+};
=20
 #define IH_MAGIC	0x27051956	/* Image Magic Number		*/
 #define IH_NMLEN		32	/* Image Name Length		*/
=20
 /*
- * all data in network byte order (aka natural aka bigendian)
+ * Legacy format image header,
+ * all data in network byte order (aka natural aka bigendian).
  */
-
 typedef struct uboot_image_header {
 	uint32_t	ih_magic;	/* Image Header Magic Number	*/
 	uint32_t	ih_hcrc;	/* Image Header CRC Checksum	*/
--=20
2.35.3


