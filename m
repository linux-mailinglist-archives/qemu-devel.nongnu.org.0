Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 086BA50C824
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Apr 2022 09:59:29 +0200 (CEST)
Received: from localhost ([::1]:50134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niAfw-0001np-2y
	for lists+qemu-devel@lfdr.de; Sat, 23 Apr 2022 03:59:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <simon@simonsafar.com>)
 id 1ni75H-0004Pn-Rc
 for qemu-devel@nongnu.org; Sat, 23 Apr 2022 00:09:23 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:55889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <simon@simonsafar.com>)
 id 1ni75C-0000iN-UU
 for qemu-devel@nongnu.org; Sat, 23 Apr 2022 00:09:23 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 386175C02BF;
 Sat, 23 Apr 2022 00:09:18 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Sat, 23 Apr 2022 00:09:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=simonsafar.com;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1650686958; x=1650773358; bh=nkjScTrbFi
 F2rsTUhqggsaOcrQ7DWfpnLX1raFAygUU=; b=VnzUwWSpwVBeQ3ZHYRLYPmUD5S
 MPbDcEcYdTuEewKiliZ7/sd3r1nkPQVa8mDiSd2QEln7XD0ojM/PCTjFsyRYJs9x
 EKbTLXYbaPmOXzFBBZBd88i4Gs6s2EPkv+gu2nzn2mJ1lVuWtGMRWzuIsse62V+7
 Q0q1PJvsQz62ebNhLdItO1IaRLnJ9PgZcDGb/6D1BUcRrFn77np64u6LSWmpxO81
 yseJNybl+UsQUQY7RMah6qYXI6xZtim4wTOspf0NGOz4SVbZLxvvtgGDgemPnDpd
 MJyq7XCDSbYdDhLwzwtX11MF55bF8mDavLNBoI0hx+J+rGwx0dOb8w1Oo0aw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:message-id:mime-version:reply-to:sender
 :subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; t=1650686958; x=1650773358; bh=n
 kjScTrbFiF2rsTUhqggsaOcrQ7DWfpnLX1raFAygUU=; b=hrDSB5hTJr7/Ffq1e
 rMtTimCOmE5GfxuSUZgc0x9WbcBJbNJBzu772jkmMUuZD3PJnycZmRKSrJyxPK88
 t8ldrmegUocp02koI3NUkwrVtuRYBBMH10qG6Sck0LHDP2dMeAUYTpw8tcQ2Mr/v
 qlHKG0DVxzflSus/FL20GcQN8c/YoS0qpOvWSDWWiK0ceNuJ4nhQmZruolk1twZe
 yitbhuEJ27eudmcbEKkIap2fctL11j5NgM6sk934/+feu0RuGvL24LUuYBlN2Bsd
 SGu6TAloEW6MiG//K7vKQXFVuOCii2zi6YW2/wXGOtScU4oeVAvO3xgLjdlFqwif
 erkrA==
X-ME-Sender: <xms:7XtjYjA7zVo0TGrS28t_eB4tvBRTUasu4bpwBnAyxWGMS6B7-vWyow>
 <xme:7XtjYphvxYSZKEAFnG6DfKoXiHBE8oBk6iWNlX46AzWxi4SYE1EmrVyErSQg5eLnC
 wpBfihCeqhwQeZjJqg>
X-ME-Received: <xmr:7XtjYulr05GLgkAHfb0qlj4Fii3N53oeaFiILcDuJDFH-EQromM5f2zmrXx-e8i6c86DeEY68wrDpcsJl6MWhjYVlj1VyhFr314>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrtdehgdejlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgggfestdekredtre
 dttdenucfhrhhomhepufhimhhonhcuufgrfhgrrhcuoehsihhmohhnsehsihhmohhnshgr
 fhgrrhdrtghomheqnecuggftrfgrthhtvghrnhepveejvdejgfelgeekgefhvdeiudekgf
 dtgfffjeekieduieevfefggedufedvudfhnecuffhomhgrihhnpehgihhthhhusgdrtgho
 mhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsih
 hmohhnsehsihhmohhnshgrfhgrrhdrtghomh
X-ME-Proxy: <xmx:7XtjYly0p9eOK0xnq16M1t83QOGKz0NeqLObCMZlY5G6Q17_uHOrQw>
 <xmx:7XtjYoQ3hsfeciWLBUaII7CPUBrxXKCjaZlVHNefM1ncaYqfLgfDpg>
 <xmx:7XtjYobXnLAGsJC8k3yAk855Ewx7uBaVCg8O-XZQUCQTqzALy1rWfQ>
 <xmx:7ntjYjJvRkZr7xbs0j8eZDX0hhhuGBsTrqVa2BHtPyTpDNCUPl_RHg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 23 Apr 2022 00:09:17 -0400 (EDT)
To: qemu-devel@nongnu.org
Cc: Simon Safar <simon@simonsafar.com>,
	Max Filippov <jcmvbkbc@gmail.com>
Subject: [PATCH v2] target/xtensa: import core lx106
Date: Fri, 22 Apr 2022 21:08:36 -0700
Message-Id: <20220423040835.29254-1-simon@simonsafar.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.28; envelope-from=simon@simonsafar.com;
 helo=out4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 23 Apr 2022 03:55:40 -0400
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
Reply-to:  Simon Safar <simon@simonsafar.com>
From:  Simon Safar via <qemu-devel@nongnu.org>

This is the core used in e.g. ESP8266 chips. Importing them
using import_core.sh, with the required files sourced from

https://github.com/espressif/xtensa-overlays

core-lx106.c was generated by the script; the only change is removing
the reference to core-matmap.h which doesn't seem to be available.

Signed-off-by: Simon Safar <simon@simonsafar.com>
Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>
---
 target/xtensa/core-lx106.c                    |   52 +
 target/xtensa/core-lx106/core-isa.h           |  470 +
 target/xtensa/core-lx106/gdb-config.c.inc     |   83 +
 target/xtensa/core-lx106/xtensa-modules.c.inc | 7668 +++++++++++++++++
 target/xtensa/cores.list                      |    1 +
 5 files changed, 8274 insertions(+)
 create mode 100644 target/xtensa/core-lx106.c
 create mode 100644 target/xtensa/core-lx106/core-isa.h
 create mode 100644 target/xtensa/core-lx106/gdb-config.c.inc
 create mode 100644 target/xtensa/core-lx106/xtensa-modules.c.inc

diff --git a/target/xtensa/core-lx106.c b/target/xtensa/core-lx106.c
new file mode 100644
index 0000000000..75eeb1a018
--- /dev/null
+++ b/target/xtensa/core-lx106.c
@@ -0,0 +1,52 @@
+/*
+ * Copyright (c) 2022, Simon Safar, Max Filippov, Open Source and Linux Lab.
+ * All rights reserved.
+ *
+ * Redistribution and use in source and binary forms, with or without
+ * modification, are permitted provided that the following conditions are met:
+ *     * Redistributions of source code must retain the above copyright
+ *       notice, this list of conditions and the following disclaimer.
+ *     * Redistributions in binary form must reproduce the above copyright
+ *       notice, this list of conditions and the following disclaimer in the
+ *       documentation and/or other materials provided with the distribution.
+ *     * Neither the name of the Open Source and Linux Lab nor the
+ *       names of its contributors may be used to endorse or promote products
+ *       derived from this software without specific prior written permission.
+ *
+ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
+ * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
+ * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
+ * ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY
+ * DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
+ * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
+ * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
+ * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
+ * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
+ * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ */
+
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "exec/gdbstub.h"
+#include "qemu-common.h"
+#include "qemu/host-utils.h"
+
+#include "core-lx106/core-isa.h"
+#include "overlay_tool.h"
+
+#define xtensa_modules xtensa_modules_lx106
+#include "core-lx106/xtensa-modules.c.inc"
+
+static XtensaConfig lx106 __attribute__((unused)) = {
+    .name = "lx106",
+    .gdb_regmap = {
+        .reg = {
+#include "core-lx106/gdb-config.c.inc"
+        }
+    },
+    .isa_internal = &xtensa_modules,
+    .clock_freq_khz = 40000,
+    DEFAULT_SECTIONS
+};
+
+REGISTER_CORE(lx106)
diff --git a/target/xtensa/core-lx106/core-isa.h b/target/xtensa/core-lx106/core-isa.h
new file mode 100644
index 0000000000..86bcf1a5d6
--- /dev/null
+++ b/target/xtensa/core-lx106/core-isa.h
@@ -0,0 +1,470 @@
+/*
+ * xtensa/config/core-isa.h -- HAL definitions that are dependent on Xtensa
+ *				processor CORE configuration
+ *
+ *  See <xtensa/config/core.h>, which includes this file, for more details.
+ */
+
+/* Xtensa processor core configuration information.
+
+   Copyright (c) 1999-2010 Tensilica Inc.
+
+   Permission is hereby granted, free of charge, to any person obtaining
+   a copy of this software and associated documentation files (the
+   "Software"), to deal in the Software without restriction, including
+   without limitation the rights to use, copy, modify, merge, publish,
+   distribute, sublicense, and/or sell copies of the Software, and to
+   permit persons to whom the Software is furnished to do so, subject to
+   the following conditions:
+
+   The above copyright notice and this permission notice shall be included
+   in all copies or substantial portions of the Software.
+
+   THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+   EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
+   MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
+   IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
+   CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
+   TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
+   SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.  */
+
+#ifndef _XTENSA_CORE_CONFIGURATION_H
+#define _XTENSA_CORE_CONFIGURATION_H
+
+
+/****************************************************************************
+	    Parameters Useful for Any Code, USER or PRIVILEGED
+ ****************************************************************************/
+
+/*
+ *  Note:  Macros of the form XCHAL_HAVE_*** have a value of 1 if the option is
+ *  configured, and a value of 0 otherwise.  These macros are always defined.
+ */
+
+
+/*----------------------------------------------------------------------
+				ISA
+  ----------------------------------------------------------------------*/
+
+#define XCHAL_HAVE_BE			0	/* big-endian byte ordering */
+#define XCHAL_HAVE_WINDOWED		0	/* windowed registers option */
+#define XCHAL_NUM_AREGS			16	/* num of physical addr regs */
+#define XCHAL_NUM_AREGS_LOG2		4	/* log2(XCHAL_NUM_AREGS) */
+#define XCHAL_MAX_INSTRUCTION_SIZE	3	/* max instr bytes (3..8) */
+#define XCHAL_HAVE_DEBUG		1	/* debug option */
+#define XCHAL_HAVE_DENSITY		1	/* 16-bit instructions */
+#define XCHAL_HAVE_LOOPS		0	/* zero-overhead loops */
+#define XCHAL_HAVE_NSA			1	/* NSA/NSAU instructions */
+#define XCHAL_HAVE_MINMAX		0	/* MIN/MAX instructions */
+#define XCHAL_HAVE_SEXT			0	/* SEXT instruction */
+#define XCHAL_HAVE_CLAMPS		0	/* CLAMPS instruction */
+#define XCHAL_HAVE_MUL16		1	/* MUL16S/MUL16U instructions */
+#define XCHAL_HAVE_MUL32		1	/* MULL instruction */
+#define XCHAL_HAVE_MUL32_HIGH		0	/* MULUH/MULSH instructions */
+#define XCHAL_HAVE_DIV32		0	/* QUOS/QUOU/REMS/REMU instructions */
+#define XCHAL_HAVE_L32R			1	/* L32R instruction */
+#define XCHAL_HAVE_ABSOLUTE_LITERALS	1	/* non-PC-rel (extended) L32R */
+#define XCHAL_HAVE_CONST16		0	/* CONST16 instruction */
+#define XCHAL_HAVE_ADDX			1	/* ADDX#/SUBX# instructions */
+#define XCHAL_HAVE_WIDE_BRANCHES	0	/* B*.W18 or B*.W15 instr's */
+#define XCHAL_HAVE_PREDICTED_BRANCHES	0	/* B[EQ/EQZ/NE/NEZ]T instr's */
+#define XCHAL_HAVE_CALL4AND12		0	/* (obsolete option) */
+#define XCHAL_HAVE_ABS			1	/* ABS instruction */
+/*#define XCHAL_HAVE_POPC		0*/	/* POPC instruction */
+/*#define XCHAL_HAVE_CRC		0*/	/* CRC instruction */
+#define XCHAL_HAVE_RELEASE_SYNC		0	/* L32AI/S32RI instructions */
+#define XCHAL_HAVE_S32C1I		0	/* S32C1I instruction */
+#define XCHAL_HAVE_SPECULATION		0	/* speculation */
+#define XCHAL_HAVE_FULL_RESET		1	/* all regs/state reset */
+#define XCHAL_NUM_CONTEXTS		1	/* */
+#define XCHAL_NUM_MISC_REGS		0	/* num of scratch regs (0..4) */
+#define XCHAL_HAVE_TAP_MASTER		0	/* JTAG TAP control instr's */
+#define XCHAL_HAVE_PRID			1	/* processor ID register */
+#define XCHAL_HAVE_EXTERN_REGS		1	/* WER/RER instructions */
+#define XCHAL_HAVE_MP_INTERRUPTS	0	/* interrupt distributor port */
+#define XCHAL_HAVE_MP_RUNSTALL		0	/* core RunStall control port */
+#define XCHAL_HAVE_THREADPTR		0	/* THREADPTR register */
+#define XCHAL_HAVE_BOOLEANS		0	/* boolean registers */
+#define XCHAL_HAVE_CP			0	/* CPENABLE reg (coprocessor) */
+#define XCHAL_CP_MAXCFG			0	/* max allowed cp id plus one */
+#define XCHAL_HAVE_MAC16		0	/* MAC16 package */
+#define XCHAL_HAVE_VECTORFPU2005	0	/* vector floating-point pkg */
+#define XCHAL_HAVE_FP			0	/* floating point pkg */
+#define XCHAL_HAVE_DFP			0	/* double precision FP pkg */
+#define XCHAL_HAVE_DFP_accel		0	/* double precision FP acceleration pkg */
+#define XCHAL_HAVE_VECTRA1		0	/* Vectra I  pkg */
+#define XCHAL_HAVE_VECTRALX		0	/* Vectra LX pkg */
+#define XCHAL_HAVE_HIFIPRO		0	/* HiFiPro Audio Engine pkg */
+#define XCHAL_HAVE_HIFI2		0	/* HiFi2 Audio Engine pkg */
+#define XCHAL_HAVE_CONNXD2		0	/* ConnX D2 pkg */
+
+
+/*----------------------------------------------------------------------
+				MISC
+  ----------------------------------------------------------------------*/
+
+#define XCHAL_NUM_WRITEBUFFER_ENTRIES	1	/* size of write buffer */
+#define XCHAL_INST_FETCH_WIDTH		4	/* instr-fetch width in bytes */
+#define XCHAL_DATA_WIDTH		4	/* data width in bytes */
+/*  In T1050, applies to selected core load and store instructions (see ISA): */
+#define XCHAL_UNALIGNED_LOAD_EXCEPTION	1	/* unaligned loads cause exc. */
+#define XCHAL_UNALIGNED_STORE_EXCEPTION	1	/* unaligned stores cause exc.*/
+#define XCHAL_UNALIGNED_LOAD_HW		0	/* unaligned loads work in hw */
+#define XCHAL_UNALIGNED_STORE_HW	0	/* unaligned stores work in hw*/
+
+#define XCHAL_SW_VERSION		800001	/* sw version of this header */
+
+#define XCHAL_CORE_ID			"lx106"	/* alphanum core name
+						   (CoreID) set in the Xtensa
+						   Processor Generator */
+
+#define XCHAL_BUILD_UNIQUE_ID		0x0002B6F6	/* 22-bit sw build ID */
+
+/*
+ *  These definitions describe the hardware targeted by this software.
+ */
+#define XCHAL_HW_CONFIGID0		0xC28CDAFA	/* ConfigID hi 32 bits*/
+#define XCHAL_HW_CONFIGID1		0x1082B6F6	/* ConfigID lo 32 bits*/
+#define XCHAL_HW_VERSION_NAME		"LX3.0.1"	/* full version name */
+#define XCHAL_HW_VERSION_MAJOR		2300	/* major ver# of targeted hw */
+#define XCHAL_HW_VERSION_MINOR		1	/* minor ver# of targeted hw */
+#define XCHAL_HW_VERSION		230001	/* major*100+minor */
+#define XCHAL_HW_REL_LX3		1
+#define XCHAL_HW_REL_LX3_0		1
+#define XCHAL_HW_REL_LX3_0_1		1
+#define XCHAL_HW_CONFIGID_RELIABLE	1
+/*  If software targets a *range* of hardware versions, these are the bounds: */
+#define XCHAL_HW_MIN_VERSION_MAJOR	2300	/* major v of earliest tgt hw */
+#define XCHAL_HW_MIN_VERSION_MINOR	1	/* minor v of earliest tgt hw */
+#define XCHAL_HW_MIN_VERSION		230001	/* earliest targeted hw */
+#define XCHAL_HW_MAX_VERSION_MAJOR	2300	/* major v of latest tgt hw */
+#define XCHAL_HW_MAX_VERSION_MINOR	1	/* minor v of latest tgt hw */
+#define XCHAL_HW_MAX_VERSION		230001	/* latest targeted hw */
+
+
+/*----------------------------------------------------------------------
+				CACHE
+  ----------------------------------------------------------------------*/
+
+#define XCHAL_ICACHE_LINESIZE		4	/* I-cache line size in bytes */
+#define XCHAL_DCACHE_LINESIZE		4	/* D-cache line size in bytes */
+#define XCHAL_ICACHE_LINEWIDTH		2	/* log2(I line size in bytes) */
+#define XCHAL_DCACHE_LINEWIDTH		2	/* log2(D line size in bytes) */
+
+#define XCHAL_ICACHE_SIZE		0	/* I-cache size in bytes or 0 */
+#define XCHAL_DCACHE_SIZE		0	/* D-cache size in bytes or 0 */
+
+#define XCHAL_DCACHE_IS_WRITEBACK	0	/* writeback feature */
+#define XCHAL_DCACHE_IS_COHERENT	0	/* MP coherence feature */
+
+#define XCHAL_HAVE_PREFETCH		0	/* PREFCTL register */
+
+
+
+
+/****************************************************************************
+    Parameters Useful for PRIVILEGED (Supervisory or Non-Virtualized) Code
+ ****************************************************************************/
+
+
+#ifndef XTENSA_HAL_NON_PRIVILEGED_ONLY
+
+/*----------------------------------------------------------------------
+				CACHE
+  ----------------------------------------------------------------------*/
+
+#define XCHAL_HAVE_PIF			1	/* any outbound PIF present */
+
+/*  If present, cache size in bytes == (ways * 2^(linewidth + setwidth)).  */
+
+/*  Number of cache sets in log2(lines per way):  */
+#define XCHAL_ICACHE_SETWIDTH		0
+#define XCHAL_DCACHE_SETWIDTH		0
+
+/*  Cache set associativity (number of ways):  */
+#define XCHAL_ICACHE_WAYS		1
+#define XCHAL_DCACHE_WAYS		1
+
+/*  Cache features:  */
+#define XCHAL_ICACHE_LINE_LOCKABLE	0
+#define XCHAL_DCACHE_LINE_LOCKABLE	0
+#define XCHAL_ICACHE_ECC_PARITY		0
+#define XCHAL_DCACHE_ECC_PARITY		0
+
+/*  Cache access size in bytes (affects operation of SICW instruction):  */
+#define XCHAL_ICACHE_ACCESS_SIZE	1
+#define XCHAL_DCACHE_ACCESS_SIZE	1
+
+/*  Number of encoded cache attr bits (see <xtensa/hal.h> for decoded bits):  */
+#define XCHAL_CA_BITS			4
+
+
+/*----------------------------------------------------------------------
+			INTERNAL I/D RAM/ROMs and XLMI
+  ----------------------------------------------------------------------*/
+
+#define XCHAL_NUM_INSTROM		1	/* number of core instr. ROMs */
+#define XCHAL_NUM_INSTRAM		2	/* number of core instr. RAMs */
+#define XCHAL_NUM_DATAROM		1	/* number of core data ROMs */
+#define XCHAL_NUM_DATARAM		2	/* number of core data RAMs */
+#define XCHAL_NUM_URAM			0	/* number of core unified RAMs*/
+#define XCHAL_NUM_XLMI			1	/* number of core XLMI ports */
+
+/*  Instruction ROM 0:  */
+#define XCHAL_INSTROM0_VADDR		0x40200000
+#define XCHAL_INSTROM0_PADDR		0x40200000
+// #define XCHAL_INSTROM0_VADDR		0x400000
+// #define XCHAL_INSTROM0_PADDR		0x400000
+#define XCHAL_INSTROM0_SIZE		1048576
+#define XCHAL_INSTROM0_ECC_PARITY	0
+
+/*  Instruction RAM 0:  */
+#define XCHAL_INSTRAM0_VADDR		0x40000000
+#define XCHAL_INSTRAM0_PADDR		0x40000000
+#define XCHAL_INSTRAM0_SIZE		1048576
+#define XCHAL_INSTRAM0_ECC_PARITY	0
+
+/*  Instruction RAM 1:  */
+#define XCHAL_INSTRAM1_VADDR		0x40100000
+#define XCHAL_INSTRAM1_PADDR		0x40100000
+#define XCHAL_INSTRAM1_SIZE		1048576
+#define XCHAL_INSTRAM1_ECC_PARITY	0
+
+/*  Data ROM 0:  */
+#define XCHAL_DATAROM0_VADDR		0x3FF40000
+#define XCHAL_DATAROM0_PADDR		0x3FF40000
+#define XCHAL_DATAROM0_SIZE		262144
+#define XCHAL_DATAROM0_ECC_PARITY	0
+
+/*  Data RAM 0:  */
+#define XCHAL_DATARAM0_VADDR		0x3FFC0000
+#define XCHAL_DATARAM0_PADDR		0x3FFC0000
+#define XCHAL_DATARAM0_SIZE		262144
+#define XCHAL_DATARAM0_ECC_PARITY	0
+
+/*  Data RAM 1:  */
+#define XCHAL_DATARAM1_VADDR		0x3FF80000
+#define XCHAL_DATARAM1_PADDR		0x3FF80000
+#define XCHAL_DATARAM1_SIZE		262144
+#define XCHAL_DATARAM1_ECC_PARITY	0
+
+/*  XLMI Port 0:  */
+#define XCHAL_XLMI0_VADDR		0x3FF00000
+#define XCHAL_XLMI0_PADDR		0x3FF00000
+#define XCHAL_XLMI0_SIZE		262144
+#define XCHAL_XLMI0_ECC_PARITY	0
+
+
+/*----------------------------------------------------------------------
+			INTERRUPTS and TIMERS
+  ----------------------------------------------------------------------*/
+
+#define XCHAL_HAVE_INTERRUPTS		1	/* interrupt option */
+#define XCHAL_HAVE_HIGHPRI_INTERRUPTS	1	/* med/high-pri. interrupts */
+#define XCHAL_HAVE_NMI			1	/* non-maskable interrupt */
+#define XCHAL_HAVE_CCOUNT		1	/* CCOUNT reg. (timer option) */
+#define XCHAL_NUM_TIMERS		1	/* number of CCOMPAREn regs */
+#define XCHAL_NUM_INTERRUPTS		15	/* number of interrupts */
+#define XCHAL_NUM_INTERRUPTS_LOG2	4	/* ceil(log2(NUM_INTERRUPTS)) */
+#define XCHAL_NUM_EXTINTERRUPTS		13	/* num of external interrupts */
+#define XCHAL_NUM_INTLEVELS		2	/* number of interrupt levels
+						   (not including level zero) */
+#define XCHAL_EXCM_LEVEL		1	/* level masked by PS.EXCM */
+	/* (always 1 in XEA1; levels 2 .. EXCM_LEVEL are "medium priority") */
+
+/*  Masks of interrupts at each interrupt level:  */
+#define XCHAL_INTLEVEL1_MASK		0x00003FFF
+#define XCHAL_INTLEVEL2_MASK		0x00000000
+#define XCHAL_INTLEVEL3_MASK		0x00004000
+#define XCHAL_INTLEVEL4_MASK		0x00000000
+#define XCHAL_INTLEVEL5_MASK		0x00000000
+#define XCHAL_INTLEVEL6_MASK		0x00000000
+#define XCHAL_INTLEVEL7_MASK		0x00000000
+
+/*  Masks of interrupts at each range 1..n of interrupt levels:  */
+#define XCHAL_INTLEVEL1_ANDBELOW_MASK	0x00003FFF
+#define XCHAL_INTLEVEL2_ANDBELOW_MASK	0x00003FFF
+#define XCHAL_INTLEVEL3_ANDBELOW_MASK	0x00007FFF
+#define XCHAL_INTLEVEL4_ANDBELOW_MASK	0x00007FFF
+#define XCHAL_INTLEVEL5_ANDBELOW_MASK	0x00007FFF
+#define XCHAL_INTLEVEL6_ANDBELOW_MASK	0x00007FFF
+#define XCHAL_INTLEVEL7_ANDBELOW_MASK	0x00007FFF
+
+/*  Level of each interrupt:  */
+#define XCHAL_INT0_LEVEL		1
+#define XCHAL_INT1_LEVEL		1
+#define XCHAL_INT2_LEVEL		1
+#define XCHAL_INT3_LEVEL		1
+#define XCHAL_INT4_LEVEL		1
+#define XCHAL_INT5_LEVEL		1
+#define XCHAL_INT6_LEVEL		1
+#define XCHAL_INT7_LEVEL		1
+#define XCHAL_INT8_LEVEL		1
+#define XCHAL_INT9_LEVEL		1
+#define XCHAL_INT10_LEVEL		1
+#define XCHAL_INT11_LEVEL		1
+#define XCHAL_INT12_LEVEL		1
+#define XCHAL_INT13_LEVEL		1
+#define XCHAL_INT14_LEVEL		3
+#define XCHAL_DEBUGLEVEL		2	/* debug interrupt level */
+#define XCHAL_HAVE_DEBUG_EXTERN_INT	1	/* OCD external db interrupt */
+#define XCHAL_NMILEVEL			3	/* NMI "level" (for use with
+						   EXCSAVE/EPS/EPC_n, RFI n) */
+
+/*  Type of each interrupt:  */
+#define XCHAL_INT0_TYPE 	XTHAL_INTTYPE_EXTERN_LEVEL
+#define XCHAL_INT1_TYPE 	XTHAL_INTTYPE_EXTERN_LEVEL
+#define XCHAL_INT2_TYPE 	XTHAL_INTTYPE_EXTERN_LEVEL
+#define XCHAL_INT3_TYPE 	XTHAL_INTTYPE_EXTERN_LEVEL
+#define XCHAL_INT4_TYPE 	XTHAL_INTTYPE_EXTERN_LEVEL
+#define XCHAL_INT5_TYPE 	XTHAL_INTTYPE_EXTERN_LEVEL
+#define XCHAL_INT6_TYPE 	XTHAL_INTTYPE_TIMER
+#define XCHAL_INT7_TYPE 	XTHAL_INTTYPE_SOFTWARE
+#define XCHAL_INT8_TYPE 	XTHAL_INTTYPE_EXTERN_EDGE
+#define XCHAL_INT9_TYPE 	XTHAL_INTTYPE_EXTERN_EDGE
+#define XCHAL_INT10_TYPE 	XTHAL_INTTYPE_EXTERN_EDGE
+#define XCHAL_INT11_TYPE 	XTHAL_INTTYPE_EXTERN_EDGE
+#define XCHAL_INT12_TYPE 	XTHAL_INTTYPE_EXTERN_EDGE
+#define XCHAL_INT13_TYPE 	XTHAL_INTTYPE_EXTERN_EDGE
+#define XCHAL_INT14_TYPE 	XTHAL_INTTYPE_NMI
+
+/*  Masks of interrupts for each type of interrupt:  */
+#define XCHAL_INTTYPE_MASK_UNCONFIGURED	0xFFFF8000
+#define XCHAL_INTTYPE_MASK_SOFTWARE	0x00000080
+#define XCHAL_INTTYPE_MASK_EXTERN_EDGE	0x00003F00
+#define XCHAL_INTTYPE_MASK_EXTERN_LEVEL	0x0000003F
+#define XCHAL_INTTYPE_MASK_TIMER	0x00000040
+#define XCHAL_INTTYPE_MASK_NMI		0x00004000
+#define XCHAL_INTTYPE_MASK_WRITE_ERROR	0x00000000
+
+/*  Interrupt numbers assigned to specific interrupt sources:  */
+#define XCHAL_TIMER0_INTERRUPT		6	/* CCOMPARE0 */
+#define XCHAL_TIMER1_INTERRUPT		XTHAL_TIMER_UNCONFIGURED
+#define XCHAL_TIMER2_INTERRUPT		XTHAL_TIMER_UNCONFIGURED
+#define XCHAL_TIMER3_INTERRUPT		XTHAL_TIMER_UNCONFIGURED
+#define XCHAL_NMI_INTERRUPT		14	/* non-maskable interrupt */
+
+/*  Interrupt numbers for levels at which only one interrupt is configured:  */
+#define XCHAL_INTLEVEL3_NUM		14
+/*  (There are many interrupts each at level(s) 1.)  */
+
+
+/*
+ *  External interrupt vectors/levels.
+ *  These macros describe how Xtensa processor interrupt numbers
+ *  (as numbered internally, eg. in INTERRUPT and INTENABLE registers)
+ *  map to external BInterrupt<n> pins, for those interrupts
+ *  configured as external (level-triggered, edge-triggered, or NMI).
+ *  See the Xtensa processor databook for more details.
+ */
+
+/*  Core interrupt numbers mapped to each EXTERNAL interrupt number:  */
+#define XCHAL_EXTINT0_NUM		0	/* (intlevel 1) */
+#define XCHAL_EXTINT1_NUM		1	/* (intlevel 1) */
+#define XCHAL_EXTINT2_NUM		2	/* (intlevel 1) */
+#define XCHAL_EXTINT3_NUM		3	/* (intlevel 1) */
+#define XCHAL_EXTINT4_NUM		4	/* (intlevel 1) */
+#define XCHAL_EXTINT5_NUM		5	/* (intlevel 1) */
+#define XCHAL_EXTINT6_NUM		8	/* (intlevel 1) */
+#define XCHAL_EXTINT7_NUM		9	/* (intlevel 1) */
+#define XCHAL_EXTINT8_NUM		10	/* (intlevel 1) */
+#define XCHAL_EXTINT9_NUM		11	/* (intlevel 1) */
+#define XCHAL_EXTINT10_NUM		12	/* (intlevel 1) */
+#define XCHAL_EXTINT11_NUM		13	/* (intlevel 1) */
+#define XCHAL_EXTINT12_NUM		14	/* (intlevel 3) */
+
+
+/*----------------------------------------------------------------------
+			EXCEPTIONS and VECTORS
+  ----------------------------------------------------------------------*/
+
+#define XCHAL_XEA_VERSION		2	/* Xtensa Exception Architecture
+						   number: 1 == XEA1 (old)
+							   2 == XEA2 (new)
+							   0 == XEAX (extern) */
+#define XCHAL_HAVE_XEA1			0	/* Exception Architecture 1 */
+#define XCHAL_HAVE_XEA2			1	/* Exception Architecture 2 */
+#define XCHAL_HAVE_XEAX			0	/* External Exception Arch. */
+#define XCHAL_HAVE_EXCEPTIONS		1	/* exception option */
+#define XCHAL_HAVE_MEM_ECC_PARITY	0	/* local memory ECC/parity */
+#define XCHAL_HAVE_VECTOR_SELECT	1	/* relocatable vectors */
+#define XCHAL_HAVE_VECBASE		1	/* relocatable vectors */
+#define XCHAL_VECBASE_RESET_VADDR	0x40000000  /* VECBASE reset value */
+#define XCHAL_VECBASE_RESET_PADDR	0x40000000
+#define XCHAL_RESET_VECBASE_OVERLAP	0
+
+#define XCHAL_RESET_VECTOR0_VADDR	0x50000000
+#define XCHAL_RESET_VECTOR0_PADDR	0x50000000
+#define XCHAL_RESET_VECTOR1_VADDR	0x40000080
+#define XCHAL_RESET_VECTOR1_PADDR	0x40000080
+#define XCHAL_RESET_VECTOR_VADDR	0x50000000
+#define XCHAL_RESET_VECTOR_PADDR	0x50000000
+
+// #define XCHAL_RESET_VECTOR0_VADDR	0x4000f8
+// #define XCHAL_RESET_VECTOR0_PADDR	0x4000f8
+// #define XCHAL_RESET_VECTOR1_VADDR	0x40000080
+// #define XCHAL_RESET_VECTOR1_PADDR	0x40000080
+// #define XCHAL_RESET_VECTOR_VADDR	0x4000f8
+// #define XCHAL_RESET_VECTOR_PADDR	0x4000f8
+
+
+#define XCHAL_USER_VECOFS		0x00000050
+#define XCHAL_USER_VECTOR_VADDR		0x40000050
+#define XCHAL_USER_VECTOR_PADDR		0x40000050
+#define XCHAL_KERNEL_VECOFS		0x00000030
+#define XCHAL_KERNEL_VECTOR_VADDR	0x40000030
+#define XCHAL_KERNEL_VECTOR_PADDR	0x40000030
+#define XCHAL_DOUBLEEXC_VECOFS		0x00000070
+#define XCHAL_DOUBLEEXC_VECTOR_VADDR	0x40000070
+#define XCHAL_DOUBLEEXC_VECTOR_PADDR	0x40000070
+#define XCHAL_INTLEVEL2_VECOFS		0x00000010
+#define XCHAL_INTLEVEL2_VECTOR_VADDR	0x40000010
+#define XCHAL_INTLEVEL2_VECTOR_PADDR	0x40000010
+#define XCHAL_DEBUG_VECOFS		XCHAL_INTLEVEL2_VECOFS
+#define XCHAL_DEBUG_VECTOR_VADDR	XCHAL_INTLEVEL2_VECTOR_VADDR
+#define XCHAL_DEBUG_VECTOR_PADDR	XCHAL_INTLEVEL2_VECTOR_PADDR
+#define XCHAL_NMI_VECOFS		0x00000020
+#define XCHAL_NMI_VECTOR_VADDR		0x40000020
+#define XCHAL_NMI_VECTOR_PADDR		0x40000020
+#define XCHAL_INTLEVEL3_VECOFS		XCHAL_NMI_VECOFS
+#define XCHAL_INTLEVEL3_VECTOR_VADDR	XCHAL_NMI_VECTOR_VADDR
+#define XCHAL_INTLEVEL3_VECTOR_PADDR	XCHAL_NMI_VECTOR_PADDR
+
+
+/*----------------------------------------------------------------------
+				DEBUG
+  ----------------------------------------------------------------------*/
+
+#define XCHAL_HAVE_OCD			1	/* OnChipDebug option */
+#define XCHAL_NUM_IBREAK		1	/* number of IBREAKn regs */
+#define XCHAL_NUM_DBREAK		1	/* number of DBREAKn regs */
+#define XCHAL_HAVE_OCD_DIR_ARRAY	0	/* faster OCD option */
+
+
+/*----------------------------------------------------------------------
+				MMU
+  ----------------------------------------------------------------------*/
+
+/*  See core-matmap.h header file for more details.  */
+
+#define XCHAL_HAVE_TLBS			1	/* inverse of HAVE_CACHEATTR */
+#define XCHAL_HAVE_SPANNING_WAY		1	/* one way maps I+D 4GB vaddr */
+#define XCHAL_SPANNING_WAY		0	/* TLB spanning way number */
+#define XCHAL_HAVE_IDENTITY_MAP		1	/* vaddr == paddr always */
+#define XCHAL_HAVE_CACHEATTR		0	/* CACHEATTR register present */
+#define XCHAL_HAVE_MIMIC_CACHEATTR	1	/* region protection */
+#define XCHAL_HAVE_XLT_CACHEATTR	0	/* region prot. w/translation */
+#define XCHAL_HAVE_PTP_MMU		0	/* full MMU (with page table
+						   [autorefill] and protection)
+						   usable for an MMU-based OS */
+/*  If none of the above last 4 are set, it's a custom TLB configuration.  */
+
+#define XCHAL_MMU_ASID_BITS		0	/* number of bits in ASIDs */
+#define XCHAL_MMU_RINGS			1	/* number of rings (1..4) */
+#define XCHAL_MMU_RING_BITS		0	/* num of bits in RING field */
+
+#endif /* !XTENSA_HAL_NON_PRIVILEGED_ONLY */
+
+
+#endif /* _XTENSA_CORE_CONFIGURATION_H */
+
diff --git a/target/xtensa/core-lx106/gdb-config.c.inc b/target/xtensa/core-lx106/gdb-config.c.inc
new file mode 100644
index 0000000000..9a2233b811
--- /dev/null
+++ b/target/xtensa/core-lx106/gdb-config.c.inc
@@ -0,0 +1,83 @@
+/* Configuration for the Xtensa architecture for GDB, the GNU debugger.
+
+   Copyright (c) 2003-2010 Tensilica Inc.
+
+   Permission is hereby granted, free of charge, to any person obtaining
+   a copy of this software and associated documentation files (the
+   "Software"), to deal in the Software without restriction, including
+   without limitation the rights to use, copy, modify, merge, publish,
+   distribute, sublicense, and/or sell copies of the Software, and to
+   permit persons to whom the Software is furnished to do so, subject to
+   the following conditions:
+
+   The above copyright notice and this permission notice shall be included
+   in all copies or substantial portions of the Software.
+
+   THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+   EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
+   MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
+   IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
+   CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
+   TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
+   SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.  */
+  XTREG(  0,  0,32, 4, 4,0x0000,0x0006 & ~1,-2, 8,0x0100,a0,          0,0,0,0,0,0)
+  XTREG(  1,  4,32, 4, 4,0x0001,0x0006 & ~1,-2, 8,0x0100,a1,          0,0,0,0,0,0)
+  XTREG(  2,  8,32, 4, 4,0x0002,0x0006 & ~1,-2, 8,0x0100,a2,          0,0,0,0,0,0)
+  XTREG(  3, 12,32, 4, 4,0x0003,0x0006 & ~1,-2, 8,0x0100,a3,          0,0,0,0,0,0)
+  XTREG(  4, 16,32, 4, 4,0x0004,0x0006 & ~1,-2, 8,0x0100,a4,          0,0,0,0,0,0)
+  XTREG(  5, 20,32, 4, 4,0x0005,0x0006 & ~1,-2, 8,0x0100,a5,          0,0,0,0,0,0)
+  XTREG(  6, 24,32, 4, 4,0x0006,0x0006 & ~1,-2, 8,0x0100,a6,          0,0,0,0,0,0)
+  XTREG(  7, 28,32, 4, 4,0x0007,0x0006 & ~1,-2, 8,0x0100,a7,          0,0,0,0,0,0)
+  XTREG(  8, 32,32, 4, 4,0x0008,0x0006 & ~1,-2, 8,0x0100,a8,          0,0,0,0,0,0)
+  XTREG(  9, 36,32, 4, 4,0x0009,0x0006 & ~1,-2, 8,0x0100,a9,          0,0,0,0,0,0)
+  XTREG( 10, 40,32, 4, 4,0x000a,0x0006 & ~1,-2, 8,0x0100,a10,         0,0,0,0,0,0)
+  XTREG( 11, 44,32, 4, 4,0x000b,0x0006 & ~1,-2, 8,0x0100,a11,         0,0,0,0,0,0)
+  XTREG( 12, 48,32, 4, 4,0x000c,0x0006 & ~1,-2, 8,0x0100,a12,         0,0,0,0,0,0)
+  XTREG( 13, 52,32, 4, 4,0x000d,0x0006 & ~1,-2, 8,0x0100,a13,         0,0,0,0,0,0)
+  XTREG( 14, 56,32, 4, 4,0x000e,0x0006 & ~1,-2, 8,0x0100,a14,         0,0,0,0,0,0)
+  XTREG( 15, 60,32, 4, 4,0x000f,0x0006 & ~1,-2, 8,0x0100,a15,         0,0,0,0,0,0)
+  XTREG( 16, 64,32, 4, 4,0x0020,0x0006 & ~1,-2, 9,0x0100,pc,          0,0,0,0,0,0)
+  XTREG( 17, 68, 6, 4, 4,0x0203,0x0006 & ~1,-2, 2,0x1100,sar,         0,0,0,0,0,0)
+  XTREG( 18, 72,32, 4, 4,0x0205,0x0006 & ~1,-2, 2,0x1100,litbase,     0,0,0,0,0,0)
+  XTREG( 19, 76,32, 4, 4,0x02b0,0x0002 & ~1,-2, 2,0x1000,sr176,       0,0,0,0,0,0)
+  XTREG( 20, 80,32, 4, 4,0x02d0,0x0002 & ~1,-2, 2,0x1000,sr208,       0,0,0,0,0,0)
+  XTREG( 21, 84, 6, 4, 4,0x02e6,0x0006 & ~1,-2, 2,0x1100,ps,          0,0,0,0,0,0)
+  XTREG( 22, 88,32, 4, 4,0x0259,0x000d & ~1,-2, 2,0x1000,mmid,        0,0,0,0,0,0)
+  XTREG( 23, 92, 1, 4, 4,0x0260,0x0007 & ~1,-2, 2,0x1000,ibreakenable,0,0,0,0,0,0)
+  XTREG( 24, 96,32, 4, 4,0x0268,0x0007 & ~1,-2, 2,0x1000,ddr,         0,0,0,0,0,0)
+  XTREG( 25,100,32, 4, 4,0x0280,0x0007 & ~1,-2, 2,0x1000,ibreaka0,    0,0,0,0,0,0)
+  XTREG( 26,104,32, 4, 4,0x0290,0x0007 & ~1,-2, 2,0x1000,dbreaka0,    0,0,0,0,0,0)
+  XTREG( 27,108,32, 4, 4,0x02a0,0x0007 & ~1,-2, 2,0x1000,dbreakc0,    0,0,0,0,0,0)
+  XTREG( 28,112,32, 4, 4,0x02b1,0x0007 & ~1,-2, 2,0x1000,epc1,        0,0,0,0,0,0)
+  XTREG( 29,116,32, 4, 4,0x02b2,0x0007 & ~1,-2, 2,0x1000,epc2,        0,0,0,0,0,0)
+  XTREG( 30,120,32, 4, 4,0x02b3,0x0007 & ~1,-2, 2,0x1000,epc3,        0,0,0,0,0,0)
+  XTREG( 31,124,32, 4, 4,0x02c0,0x0007 & ~1,-2, 2,0x1000,depc,        0,0,0,0,0,0)
+  XTREG( 32,128, 6, 4, 4,0x02c2,0x0007 & ~1,-2, 2,0x1000,eps2,        0,0,0,0,0,0)
+  XTREG( 33,132, 6, 4, 4,0x02c3,0x0007 & ~1,-2, 2,0x1000,eps3,        0,0,0,0,0,0)
+  XTREG( 34,136,32, 4, 4,0x02d1,0x0007 & ~1,-2, 2,0x1000,excsave1,    0,0,0,0,0,0)
+  XTREG( 35,140,32, 4, 4,0x02d2,0x0007 & ~1,-2, 2,0x1000,excsave2,    0,0,0,0,0,0)
+  XTREG( 36,144,32, 4, 4,0x02d3,0x0007 & ~1,-2, 2,0x1000,excsave3,    0,0,0,0,0,0)
+  XTREG( 37,148,15, 4, 4,0x02e2,0x000b & ~1,-2, 2,0x1000,interrupt,   0,0,0,0,0,0)
+  XTREG( 38,152,15, 4, 4,0x02e2,0x000d & ~1,-2, 2,0x1000,intset,      0,0,0,0,0,0)
+  XTREG( 39,156,15, 4, 4,0x02e3,0x000d & ~1,-2, 2,0x1000,intclear,    0,0,0,0,0,0)
+  XTREG( 40,160,15, 4, 4,0x02e4,0x0007 & ~1,-2, 2,0x1000,intenable,   0,0,0,0,0,0)
+  XTREG( 41,164,32, 4, 4,0x02e7,0x0007 & ~1,-2, 2,0x1000,vecbase,     0,0,0,0,0,0)
+  XTREG( 42,168, 6, 4, 4,0x02e8,0x0007 & ~1,-2, 2,0x1000,exccause,    0,0,0,0,0,0)
+  XTREG( 43,172,12, 4, 4,0x02e9,0x0003 & ~1,-2, 2,0x1000,debugcause,  0,0,0,0,0,0)
+  XTREG( 44,176,32, 4, 4,0x02ea,0x000f & ~1,-2, 2,0x1000,ccount,      0,0,0,0,0,0)
+  XTREG( 45,180,32, 4, 4,0x02eb,0x0003 & ~1,-2, 2,0x1000,prid,        0,0,0,0,0,0)
+  XTREG( 46,184,32, 4, 4,0x02ec,0x000f & ~1,-2, 2,0x1000,icount,      0,0,0,0,0,0)
+  XTREG( 47,188, 4, 4, 4,0x02ed,0x0007 & ~1,-2, 2,0x1000,icountlevel, 0,0,0,0,0,0)
+  XTREG( 48,192,32, 4, 4,0x02ee,0x0007 & ~1,-2, 2,0x1000,excvaddr,    0,0,0,0,0,0)
+  XTREG( 49,196,32, 4, 4,0x02f0,0x000f & ~1,-2, 2,0x1000,ccompare0,   0,0,0,0,0,0)
+  XTREG( 50,200, 4, 4, 4,0x2002,0x0006,-2, 6,0x1010,psintlevel,
+            0,0,&xtensa_mask0,0,0,0)
+  XTREG( 51,204, 1, 4, 4,0x2003,0x0006,-2, 6,0x1010,psum,
+            0,0,&xtensa_mask1,0,0,0)
+  XTREG( 52,208, 1, 4, 4,0x2004,0x0006,-2, 6,0x1010,psexcm,
+            0,0,&xtensa_mask2,0,0,0)
+  XTREG( 53,212,20, 4, 4,0x2005,0x0006,-2, 6,0x1010,litbaddr,
+            0,0,&xtensa_mask3,0,0,0)
+  XTREG( 54,216, 1, 4, 4,0x2006,0x0006,-2, 6,0x1010,litben,
+            0,0,&xtensa_mask4,0,0,0)
+  XTREG_END
diff --git a/target/xtensa/core-lx106/xtensa-modules.c.inc b/target/xtensa/core-lx106/xtensa-modules.c.inc
new file mode 100644
index 0000000000..f2b5efc6ec
--- /dev/null
+++ b/target/xtensa/core-lx106/xtensa-modules.c.inc
@@ -0,0 +1,7668 @@
+/* Xtensa configuration-specific ISA information.
+
+   Copyright (c) 2003-2010 Tensilica Inc.
+
+   Permission is hereby granted, free of charge, to any person obtaining
+   a copy of this software and associated documentation files (the
+   "Software"), to deal in the Software without restriction, including
+   without limitation the rights to use, copy, modify, merge, publish,
+   distribute, sublicense, and/or sell copies of the Software, and to
+   permit persons to whom the Software is furnished to do so, subject to
+   the following conditions:
+
+   The above copyright notice and this permission notice shall be included
+   in all copies or substantial portions of the Software.
+
+   THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+   EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
+   MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
+   IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
+   CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
+   TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
+   SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.  */
+
+#include "xtensa-isa.h"
+#include "xtensa-isa-internal.h"
+
+
+/* Sysregs.  */
+
+static xtensa_sysreg_internal sysregs[] = {
+  { "MMID", 89, 0 },
+  { "DDR", 104, 0 },
+  { "176", 176, 0 },
+  { "208", 208, 0 },
+  { "INTERRUPT", 226, 0 },
+  { "INTCLEAR", 227, 0 },
+  { "CCOUNT", 234, 0 },
+  { "PRID", 235, 0 },
+  { "ICOUNT", 236, 0 },
+  { "CCOMPARE0", 240, 0 },
+  { "VECBASE", 231, 0 },
+  { "EPC1", 177, 0 },
+  { "EPC2", 178, 0 },
+  { "EPC3", 179, 0 },
+  { "EXCSAVE1", 209, 0 },
+  { "EXCSAVE2", 210, 0 },
+  { "EXCSAVE3", 211, 0 },
+  { "EPS2", 194, 0 },
+  { "EPS3", 195, 0 },
+  { "EXCCAUSE", 232, 0 },
+  { "DEPC", 192, 0 },
+  { "EXCVADDR", 238, 0 },
+  { "SAR", 3, 0 },
+  { "LITBASE", 5, 0 },
+  { "PS", 230, 0 },
+  { "INTENABLE", 228, 0 },
+  { "DBREAKA0", 144, 0 },
+  { "DBREAKC0", 160, 0 },
+  { "IBREAKA0", 128, 0 },
+  { "IBREAKENABLE", 96, 0 },
+  { "ICOUNTLEVEL", 237, 0 },
+  { "DEBUGCAUSE", 233, 0 }
+};
+
+#define NUM_SYSREGS 32
+#define MAX_SPECIAL_REG 240
+#define MAX_USER_REG 0
+
+
+/* Processor states.  */
+
+static xtensa_state_internal states[] = {
+  { "PC", 32, 0 },
+  { "ICOUNT", 32, 0 },
+  { "DDR", 32, 0 },
+  { "INTERRUPT", 15, 0 },
+  { "CCOUNT", 32, 0 },
+  { "XTSYNC", 1, 0 },
+  { "VECBASE", 25, 0 },
+  { "EPC1", 32, 0 },
+  { "EPC2", 32, 0 },
+  { "EPC3", 32, 0 },
+  { "EXCSAVE1", 32, 0 },
+  { "EXCSAVE2", 32, 0 },
+  { "EXCSAVE3", 32, 0 },
+  { "EPS2", 6, 0 },
+  { "EPS3", 6, 0 },
+  { "EXCCAUSE", 6, 0 },
+  { "PSINTLEVEL", 4, 0 },
+  { "PSUM", 1, 0 },
+  { "PSEXCM", 1, 0 },
+  { "DEPC", 32, 0 },
+  { "EXCVADDR", 32, 0 },
+  { "SAR", 6, 0 },
+  { "LITBADDR", 20, 0 },
+  { "LITBEN", 1, 0 },
+  { "InOCDMode", 1, 0 },
+  { "INTENABLE", 15, 0 },
+  { "DBREAKA0", 32, 0 },
+  { "DBREAKC0", 8, 0 },
+  { "IBREAKA0", 32, 0 },
+  { "IBREAKENABLE", 1, 0 },
+  { "ICOUNTLEVEL", 4, 0 },
+  { "DEBUGCAUSE", 6, 0 },
+  { "DBNUM", 4, 0 },
+  { "CCOMPARE0", 32, 0 }
+};
+
+#define NUM_STATES 34
+
+enum xtensa_state_id {
+  STATE_PC,
+  STATE_ICOUNT,
+  STATE_DDR,
+  STATE_INTERRUPT,
+  STATE_CCOUNT,
+  STATE_XTSYNC,
+  STATE_VECBASE,
+  STATE_EPC1,
+  STATE_EPC2,
+  STATE_EPC3,
+  STATE_EXCSAVE1,
+  STATE_EXCSAVE2,
+  STATE_EXCSAVE3,
+  STATE_EPS2,
+  STATE_EPS3,
+  STATE_EXCCAUSE,
+  STATE_PSINTLEVEL,
+  STATE_PSUM,
+  STATE_PSEXCM,
+  STATE_DEPC,
+  STATE_EXCVADDR,
+  STATE_SAR,
+  STATE_LITBADDR,
+  STATE_LITBEN,
+  STATE_InOCDMode,
+  STATE_INTENABLE,
+  STATE_DBREAKA0,
+  STATE_DBREAKC0,
+  STATE_IBREAKA0,
+  STATE_IBREAKENABLE,
+  STATE_ICOUNTLEVEL,
+  STATE_DEBUGCAUSE,
+  STATE_DBNUM,
+  STATE_CCOMPARE0
+};
+
+
+/* Field definitions.  */
+
+static unsigned
+Field_t_Slot_inst_get (const xtensa_insnbuf insn)
+{
+  unsigned tie_t = 0;
+  tie_t = (tie_t << 4) | ((insn[0] << 24) >> 28);
+  return tie_t;
+}
+
+static void
+Field_t_Slot_inst_set (xtensa_insnbuf insn, uint32 val)
+{
+  uint32 tie_t;
+  tie_t = (val << 28) >> 28;
+  insn[0] = (insn[0] & ~0xf0) | (tie_t << 4);
+}
+
+static unsigned
+Field_s_Slot_inst_get (const xtensa_insnbuf insn)
+{
+  unsigned tie_t = 0;
+  tie_t = (tie_t << 4) | ((insn[0] << 20) >> 28);
+  return tie_t;
+}
+
+static void
+Field_s_Slot_inst_set (xtensa_insnbuf insn, uint32 val)
+{
+  uint32 tie_t;
+  tie_t = (val << 28) >> 28;
+  insn[0] = (insn[0] & ~0xf00) | (tie_t << 8);
+}
+
+static unsigned
+Field_r_Slot_inst_get (const xtensa_insnbuf insn)
+{
+  unsigned tie_t = 0;
+  tie_t = (tie_t << 4) | ((insn[0] << 16) >> 28);
+  return tie_t;
+}
+
+static void
+Field_r_Slot_inst_set (xtensa_insnbuf insn, uint32 val)
+{
+  uint32 tie_t;
+  tie_t = (val << 28) >> 28;
+  insn[0] = (insn[0] & ~0xf000) | (tie_t << 12);
+}
+
+static unsigned
+Field_op2_Slot_inst_get (const xtensa_insnbuf insn)
+{
+  unsigned tie_t = 0;
+  tie_t = (tie_t << 4) | ((insn[0] << 8) >> 28);
+  return tie_t;
+}
+
+static void
+Field_op2_Slot_inst_set (xtensa_insnbuf insn, uint32 val)
+{
+  uint32 tie_t;
+  tie_t = (val << 28) >> 28;
+  insn[0] = (insn[0] & ~0xf00000) | (tie_t << 20);
+}
+
+static unsigned
+Field_op1_Slot_inst_get (const xtensa_insnbuf insn)
+{
+  unsigned tie_t = 0;
+  tie_t = (tie_t << 4) | ((insn[0] << 12) >> 28);
+  return tie_t;
+}
+
+static void
+Field_op1_Slot_inst_set (xtensa_insnbuf insn, uint32 val)
+{
+  uint32 tie_t;
+  tie_t = (val << 28) >> 28;
+  insn[0] = (insn[0] & ~0xf0000) | (tie_t << 16);
+}
+
+static unsigned
+Field_op0_Slot_inst_get (const xtensa_insnbuf insn)
+{
+  unsigned tie_t = 0;
+  tie_t = (tie_t << 4) | ((insn[0] << 28) >> 28);
+  return tie_t;
+}
+
+static void
+Field_op0_Slot_inst_set (xtensa_insnbuf insn, uint32 val)
+{
+  uint32 tie_t;
+  tie_t = (val << 28) >> 28;
+  insn[0] = (insn[0] & ~0xf) | (tie_t << 0);
+}
+
+static unsigned
+Field_m_Slot_inst_get (const xtensa_insnbuf insn)
+{
+  unsigned tie_t = 0;
+  tie_t = (tie_t << 2) | ((insn[0] << 24) >> 30);
+  return tie_t;
+}
+
+static void
+Field_m_Slot_inst_set (xtensa_insnbuf insn, uint32 val)
+{
+  uint32 tie_t;
+  tie_t = (val << 30) >> 30;
+  insn[0] = (insn[0] & ~0xc0) | (tie_t << 6);
+}
+
+static unsigned
+Field_n_Slot_inst_get (const xtensa_insnbuf insn)
+{
+  unsigned tie_t = 0;
+  tie_t = (tie_t << 2) | ((insn[0] << 26) >> 30);
+  return tie_t;
+}
+
+static void
+Field_n_Slot_inst_set (xtensa_insnbuf insn, uint32 val)
+{
+  uint32 tie_t;
+  tie_t = (val << 30) >> 30;
+  insn[0] = (insn[0] & ~0x30) | (tie_t << 4);
+}
+
+static unsigned
+Field_thi3_Slot_inst_get (const xtensa_insnbuf insn)
+{
+  unsigned tie_t = 0;
+  tie_t = (tie_t << 3) | ((insn[0] << 24) >> 29);
+  return tie_t;
+}
+
+static void
+Field_thi3_Slot_inst_set (xtensa_insnbuf insn, uint32 val)
+{
+  uint32 tie_t;
+  tie_t = (val << 29) >> 29;
+  insn[0] = (insn[0] & ~0xe0) | (tie_t << 5);
+}
+
+static unsigned
+Field_sr_Slot_inst_get (const xtensa_insnbuf insn)
+{
+  unsigned tie_t = 0;
+  tie_t = (tie_t << 4) | ((insn[0] << 16) >> 28);
+  tie_t = (tie_t << 4) | ((insn[0] << 20) >> 28);
+  return tie_t;
+}
+
+static void
+Field_sr_Slot_inst_set (xtensa_insnbuf insn, uint32 val)
+{
+  uint32 tie_t;
+  tie_t = (val << 28) >> 28;
+  insn[0] = (insn[0] & ~0xf00) | (tie_t << 8);
+  tie_t = (val << 24) >> 28;
+  insn[0] = (insn[0] & ~0xf000) | (tie_t << 12);
+}
+
+static unsigned
+Field_op0_Slot_inst16a_get (const xtensa_insnbuf insn)
+{
+  unsigned tie_t = 0;
+  tie_t = (tie_t << 4) | ((insn[0] << 28) >> 28);
+  return tie_t;
+}
+
+static void
+Field_op0_Slot_inst16a_set (xtensa_insnbuf insn, uint32 val)
+{
+  uint32 tie_t;
+  tie_t = (val << 28) >> 28;
+  insn[0] = (insn[0] & ~0xf) | (tie_t << 0);
+}
+
+static unsigned
+Field_z_Slot_inst16b_get (const xtensa_insnbuf insn)
+{
+  unsigned tie_t = 0;
+  tie_t = (tie_t << 1) | ((insn[0] << 25) >> 31);
+  return tie_t;
+}
+
+static void
+Field_z_Slot_inst16b_set (xtensa_insnbuf insn, uint32 val)
+{
+  uint32 tie_t;
+  tie_t = (val << 31) >> 31;
+  insn[0] = (insn[0] & ~0x40) | (tie_t << 6);
+}
+
+static unsigned
+Field_i_Slot_inst16b_get (const xtensa_insnbuf insn)
+{
+  unsigned tie_t = 0;
+  tie_t = (tie_t << 1) | ((insn[0] << 24) >> 31);
+  return tie_t;
+}
+
+static void
+Field_i_Slot_inst16b_set (xtensa_insnbuf insn, uint32 val)
+{
+  uint32 tie_t;
+  tie_t = (val << 31) >> 31;
+  insn[0] = (insn[0] & ~0x80) | (tie_t << 7);
+}
+
+static unsigned
+Field_op0_Slot_inst16b_get (const xtensa_insnbuf insn)
+{
+  unsigned tie_t = 0;
+  tie_t = (tie_t << 4) | ((insn[0] << 28) >> 28);
+  return tie_t;
+}
+
+static void
+Field_op0_Slot_inst16b_set (xtensa_insnbuf insn, uint32 val)
+{
+  uint32 tie_t;
+  tie_t = (val << 28) >> 28;
+  insn[0] = (insn[0] & ~0xf) | (tie_t << 0);
+}
+
+static unsigned
+Field_t_Slot_inst16b_get (const xtensa_insnbuf insn)
+{
+  unsigned tie_t = 0;
+  tie_t = (tie_t << 4) | ((insn[0] << 24) >> 28);
+  return tie_t;
+}
+
+static void
+Field_t_Slot_inst16b_set (xtensa_insnbuf insn, uint32 val)
+{
+  uint32 tie_t;
+  tie_t = (val << 28) >> 28;
+  insn[0] = (insn[0] & ~0xf0) | (tie_t << 4);
+}
+
+static unsigned
+Field_r_Slot_inst16b_get (const xtensa_insnbuf insn)
+{
+  unsigned tie_t = 0;
+  tie_t = (tie_t << 4) | ((insn[0] << 16) >> 28);
+  return tie_t;
+}
+
+static void
+Field_r_Slot_inst16b_set (xtensa_insnbuf insn, uint32 val)
+{
+  uint32 tie_t;
+  tie_t = (val << 28) >> 28;
+  insn[0] = (insn[0] & ~0xf000) | (tie_t << 12);
+}
+
+static unsigned
+Field_s_Slot_inst16b_get (const xtensa_insnbuf insn)
+{
+  unsigned tie_t = 0;
+  tie_t = (tie_t << 4) | ((insn[0] << 20) >> 28);
+  return tie_t;
+}
+
+static void
+Field_s_Slot_inst16b_set (xtensa_insnbuf insn, uint32 val)
+{
+  uint32 tie_t;
+  tie_t = (val << 28) >> 28;
+  insn[0] = (insn[0] & ~0xf00) | (tie_t << 8);
+}
+
+static unsigned
+Field_t_Slot_inst16a_get (const xtensa_insnbuf insn)
+{
+  unsigned tie_t = 0;
+  tie_t = (tie_t << 4) | ((insn[0] << 24) >> 28);
+  return tie_t;
+}
+
+static void
+Field_t_Slot_inst16a_set (xtensa_insnbuf insn, uint32 val)
+{
+  uint32 tie_t;
+  tie_t = (val << 28) >> 28;
+  insn[0] = (insn[0] & ~0xf0) | (tie_t << 4);
+}
+
+static unsigned
+Field_bbi4_Slot_inst_get (const xtensa_insnbuf insn)
+{
+  unsigned tie_t = 0;
+  tie_t = (tie_t << 1) | ((insn[0] << 19) >> 31);
+  return tie_t;
+}
+
+static void
+Field_bbi4_Slot_inst_set (xtensa_insnbuf insn, uint32 val)
+{
+  uint32 tie_t;
+  tie_t = (val << 31) >> 31;
+  insn[0] = (insn[0] & ~0x1000) | (tie_t << 12);
+}
+
+static unsigned
+Field_bbi_Slot_inst_get (const xtensa_insnbuf insn)
+{
+  unsigned tie_t = 0;
+  tie_t = (tie_t << 1) | ((insn[0] << 19) >> 31);
+  tie_t = (tie_t << 4) | ((insn[0] << 24) >> 28);
+  return tie_t;
+}
+
+static void
+Field_bbi_Slot_inst_set (xtensa_insnbuf insn, uint32 val)
+{
+  uint32 tie_t;
+  tie_t = (val << 28) >> 28;
+  insn[0] = (insn[0] & ~0xf0) | (tie_t << 4);
+  tie_t = (val << 27) >> 31;
+  insn[0] = (insn[0] & ~0x1000) | (tie_t << 12);
+}
+
+static unsigned
+Field_imm12_Slot_inst_get (const xtensa_insnbuf insn)
+{
+  unsigned tie_t = 0;
+  tie_t = (tie_t << 12) | ((insn[0] << 8) >> 20);
+  return tie_t;
+}
+
+static void
+Field_imm12_Slot_inst_set (xtensa_insnbuf insn, uint32 val)
+{
+  uint32 tie_t;
+  tie_t = (val << 20) >> 20;
+  insn[0] = (insn[0] & ~0xfff000) | (tie_t << 12);
+}
+
+static unsigned
+Field_imm8_Slot_inst_get (const xtensa_insnbuf insn)
+{
+  unsigned tie_t = 0;
+  tie_t = (tie_t << 8) | ((insn[0] << 8) >> 24);
+  return tie_t;
+}
+
+static void
+Field_imm8_Slot_inst_set (xtensa_insnbuf insn, uint32 val)
+{
+  uint32 tie_t;
+  tie_t = (val << 24) >> 24;
+  insn[0] = (insn[0] & ~0xff0000) | (tie_t << 16);
+}
+
+static unsigned
+Field_s_Slot_inst16a_get (const xtensa_insnbuf insn)
+{
+  unsigned tie_t = 0;
+  tie_t = (tie_t << 4) | ((insn[0] << 20) >> 28);
+  return tie_t;
+}
+
+static void
+Field_s_Slot_inst16a_set (xtensa_insnbuf insn, uint32 val)
+{
+  uint32 tie_t;
+  tie_t = (val << 28) >> 28;
+  insn[0] = (insn[0] & ~0xf00) | (tie_t << 8);
+}
+
+static unsigned
+Field_imm12b_Slot_inst_get (const xtensa_insnbuf insn)
+{
+  unsigned tie_t = 0;
+  tie_t = (tie_t << 4) | ((insn[0] << 20) >> 28);
+  tie_t = (tie_t << 8) | ((insn[0] << 8) >> 24);
+  return tie_t;
+}
+
+static void
+Field_imm12b_Slot_inst_set (xtensa_insnbuf insn, uint32 val)
+{
+  uint32 tie_t;
+  tie_t = (val << 24) >> 24;
+  insn[0] = (insn[0] & ~0xff0000) | (tie_t << 16);
+  tie_t = (val << 20) >> 28;
+  insn[0] = (insn[0] & ~0xf00) | (tie_t << 8);
+}
+
+static unsigned
+Field_imm16_Slot_inst_get (const xtensa_insnbuf insn)
+{
+  unsigned tie_t = 0;
+  tie_t = (tie_t << 16) | ((insn[0] << 8) >> 16);
+  return tie_t;
+}
+
+static void
+Field_imm16_Slot_inst_set (xtensa_insnbuf insn, uint32 val)
+{
+  uint32 tie_t;
+  tie_t = (val << 16) >> 16;
+  insn[0] = (insn[0] & ~0xffff00) | (tie_t << 8);
+}
+
+static unsigned
+Field_offset_Slot_inst_get (const xtensa_insnbuf insn)
+{
+  unsigned tie_t = 0;
+  tie_t = (tie_t << 18) | ((insn[0] << 8) >> 14);
+  return tie_t;
+}
+
+static void
+Field_offset_Slot_inst_set (xtensa_insnbuf insn, uint32 val)
+{
+  uint32 tie_t;
+  tie_t = (val << 14) >> 14;
+  insn[0] = (insn[0] & ~0xffffc0) | (tie_t << 6);
+}
+
+static unsigned
+Field_r_Slot_inst16a_get (const xtensa_insnbuf insn)
+{
+  unsigned tie_t = 0;
+  tie_t = (tie_t << 4) | ((insn[0] << 16) >> 28);
+  return tie_t;
+}
+
+static void
+Field_r_Slot_inst16a_set (xtensa_insnbuf insn, uint32 val)
+{
+  uint32 tie_t;
+  tie_t = (val << 28) >> 28;
+  insn[0] = (insn[0] & ~0xf000) | (tie_t << 12);
+}
+
+static unsigned
+Field_sa4_Slot_inst_get (const xtensa_insnbuf insn)
+{
+  unsigned tie_t = 0;
+  tie_t = (tie_t << 1) | ((insn[0] << 11) >> 31);
+  return tie_t;
+}
+
+static void
+Field_sa4_Slot_inst_set (xtensa_insnbuf insn, uint32 val)
+{
+  uint32 tie_t;
+  tie_t = (val << 31) >> 31;
+  insn[0] = (insn[0] & ~0x100000) | (tie_t << 20);
+}
+
+static unsigned
+Field_sae4_Slot_inst_get (const xtensa_insnbuf insn)
+{
+  unsigned tie_t = 0;
+  tie_t = (tie_t << 1) | ((insn[0] << 15) >> 31);
+  return tie_t;
+}
+
+static void
+Field_sae4_Slot_inst_set (xtensa_insnbuf insn, uint32 val)
+{
+  uint32 tie_t;
+  tie_t = (val << 31) >> 31;
+  insn[0] = (insn[0] & ~0x10000) | (tie_t << 16);
+}
+
+static unsigned
+Field_sae_Slot_inst_get (const xtensa_insnbuf insn)
+{
+  unsigned tie_t = 0;
+  tie_t = (tie_t << 1) | ((insn[0] << 15) >> 31);
+  tie_t = (tie_t << 4) | ((insn[0] << 20) >> 28);
+  return tie_t;
+}
+
+static void
+Field_sae_Slot_inst_set (xtensa_insnbuf insn, uint32 val)
+{
+  uint32 tie_t;
+  tie_t = (val << 28) >> 28;
+  insn[0] = (insn[0] & ~0xf00) | (tie_t << 8);
+  tie_t = (val << 27) >> 31;
+  insn[0] = (insn[0] & ~0x10000) | (tie_t << 16);
+}
+
+static unsigned
+Field_sal_Slot_inst_get (const xtensa_insnbuf insn)
+{
+  unsigned tie_t = 0;
+  tie_t = (tie_t << 1) | ((insn[0] << 11) >> 31);
+  tie_t = (tie_t << 4) | ((insn[0] << 24) >> 28);
+  return tie_t;
+}
+
+static void
+Field_sal_Slot_inst_set (xtensa_insnbuf insn, uint32 val)
+{
+  uint32 tie_t;
+  tie_t = (val << 28) >> 28;
+  insn[0] = (insn[0] & ~0xf0) | (tie_t << 4);
+  tie_t = (val << 27) >> 31;
+  insn[0] = (insn[0] & ~0x100000) | (tie_t << 20);
+}
+
+static unsigned
+Field_sargt_Slot_inst_get (const xtensa_insnbuf insn)
+{
+  unsigned tie_t = 0;
+  tie_t = (tie_t << 1) | ((insn[0] << 11) >> 31);
+  tie_t = (tie_t << 4) | ((insn[0] << 20) >> 28);
+  return tie_t;
+}
+
+static void
+Field_sargt_Slot_inst_set (xtensa_insnbuf insn, uint32 val)
+{
+  uint32 tie_t;
+  tie_t = (val << 28) >> 28;
+  insn[0] = (insn[0] & ~0xf00) | (tie_t << 8);
+  tie_t = (val << 27) >> 31;
+  insn[0] = (insn[0] & ~0x100000) | (tie_t << 20);
+}
+
+static unsigned
+Field_sas4_Slot_inst_get (const xtensa_insnbuf insn)
+{
+  unsigned tie_t = 0;
+  tie_t = (tie_t << 1) | ((insn[0] << 27) >> 31);
+  return tie_t;
+}
+
+static void
+Field_sas4_Slot_inst_set (xtensa_insnbuf insn, uint32 val)
+{
+  uint32 tie_t;
+  tie_t = (val << 31) >> 31;
+  insn[0] = (insn[0] & ~0x10) | (tie_t << 4);
+}
+
+static unsigned
+Field_sas_Slot_inst_get (const xtensa_insnbuf insn)
+{
+  unsigned tie_t = 0;
+  tie_t = (tie_t << 1) | ((insn[0] << 27) >> 31);
+  tie_t = (tie_t << 4) | ((insn[0] << 20) >> 28);
+  return tie_t;
+}
+
+static void
+Field_sas_Slot_inst_set (xtensa_insnbuf insn, uint32 val)
+{
+  uint32 tie_t;
+  tie_t = (val << 28) >> 28;
+  insn[0] = (insn[0] & ~0xf00) | (tie_t << 8);
+  tie_t = (val << 27) >> 31;
+  insn[0] = (insn[0] & ~0x10) | (tie_t << 4);
+}
+
+static unsigned
+Field_sr_Slot_inst16a_get (const xtensa_insnbuf insn)
+{
+  unsigned tie_t = 0;
+  tie_t = (tie_t << 4) | ((insn[0] << 16) >> 28);
+  tie_t = (tie_t << 4) | ((insn[0] << 20) >> 28);
+  return tie_t;
+}
+
+static void
+Field_sr_Slot_inst16a_set (xtensa_insnbuf insn, uint32 val)
+{
+  uint32 tie_t;
+  tie_t = (val << 28) >> 28;
+  insn[0] = (insn[0] & ~0xf00) | (tie_t << 8);
+  tie_t = (val << 24) >> 28;
+  insn[0] = (insn[0] & ~0xf000) | (tie_t << 12);
+}
+
+static unsigned
+Field_sr_Slot_inst16b_get (const xtensa_insnbuf insn)
+{
+  unsigned tie_t = 0;
+  tie_t = (tie_t << 4) | ((insn[0] << 16) >> 28);
+  tie_t = (tie_t << 4) | ((insn[0] << 20) >> 28);
+  return tie_t;
+}
+
+static void
+Field_sr_Slot_inst16b_set (xtensa_insnbuf insn, uint32 val)
+{
+  uint32 tie_t;
+  tie_t = (val << 28) >> 28;
+  insn[0] = (insn[0] & ~0xf00) | (tie_t << 8);
+  tie_t = (val << 24) >> 28;
+  insn[0] = (insn[0] & ~0xf000) | (tie_t << 12);
+}
+
+static unsigned
+Field_st_Slot_inst_get (const xtensa_insnbuf insn)
+{
+  unsigned tie_t = 0;
+  tie_t = (tie_t << 4) | ((insn[0] << 20) >> 28);
+  tie_t = (tie_t << 4) | ((insn[0] << 24) >> 28);
+  return tie_t;
+}
+
+static void
+Field_st_Slot_inst_set (xtensa_insnbuf insn, uint32 val)
+{
+  uint32 tie_t;
+  tie_t = (val << 28) >> 28;
+  insn[0] = (insn[0] & ~0xf0) | (tie_t << 4);
+  tie_t = (val << 24) >> 28;
+  insn[0] = (insn[0] & ~0xf00) | (tie_t << 8);
+}
+
+static unsigned
+Field_st_Slot_inst16a_get (const xtensa_insnbuf insn)
+{
+  unsigned tie_t = 0;
+  tie_t = (tie_t << 4) | ((insn[0] << 20) >> 28);
+  tie_t = (tie_t << 4) | ((insn[0] << 24) >> 28);
+  return tie_t;
+}
+
+static void
+Field_st_Slot_inst16a_set (xtensa_insnbuf insn, uint32 val)
+{
+  uint32 tie_t;
+  tie_t = (val << 28) >> 28;
+  insn[0] = (insn[0] & ~0xf0) | (tie_t << 4);
+  tie_t = (val << 24) >> 28;
+  insn[0] = (insn[0] & ~0xf00) | (tie_t << 8);
+}
+
+static unsigned
+Field_st_Slot_inst16b_get (const xtensa_insnbuf insn)
+{
+  unsigned tie_t = 0;
+  tie_t = (tie_t << 4) | ((insn[0] << 20) >> 28);
+  tie_t = (tie_t << 4) | ((insn[0] << 24) >> 28);
+  return tie_t;
+}
+
+static void
+Field_st_Slot_inst16b_set (xtensa_insnbuf insn, uint32 val)
+{
+  uint32 tie_t;
+  tie_t = (val << 28) >> 28;
+  insn[0] = (insn[0] & ~0xf0) | (tie_t << 4);
+  tie_t = (val << 24) >> 28;
+  insn[0] = (insn[0] & ~0xf00) | (tie_t << 8);
+}
+
+static unsigned
+Field_imm4_Slot_inst_get (const xtensa_insnbuf insn)
+{
+  unsigned tie_t = 0;
+  tie_t = (tie_t << 4) | ((insn[0] << 16) >> 28);
+  return tie_t;
+}
+
+static void
+Field_imm4_Slot_inst_set (xtensa_insnbuf insn, uint32 val)
+{
+  uint32 tie_t;
+  tie_t = (val << 28) >> 28;
+  insn[0] = (insn[0] & ~0xf000) | (tie_t << 12);
+}
+
+static unsigned
+Field_imm4_Slot_inst16a_get (const xtensa_insnbuf insn)
+{
+  unsigned tie_t = 0;
+  tie_t = (tie_t << 4) | ((insn[0] << 16) >> 28);
+  return tie_t;
+}
+
+static void
+Field_imm4_Slot_inst16a_set (xtensa_insnbuf insn, uint32 val)
+{
+  uint32 tie_t;
+  tie_t = (val << 28) >> 28;
+  insn[0] = (insn[0] & ~0xf000) | (tie_t << 12);
+}
+
+static unsigned
+Field_imm4_Slot_inst16b_get (const xtensa_insnbuf insn)
+{
+  unsigned tie_t = 0;
+  tie_t = (tie_t << 4) | ((insn[0] << 16) >> 28);
+  return tie_t;
+}
+
+static void
+Field_imm4_Slot_inst16b_set (xtensa_insnbuf insn, uint32 val)
+{
+  uint32 tie_t;
+  tie_t = (val << 28) >> 28;
+  insn[0] = (insn[0] & ~0xf000) | (tie_t << 12);
+}
+
+static unsigned
+Field_i_Slot_inst16a_get (const xtensa_insnbuf insn)
+{
+  unsigned tie_t = 0;
+  tie_t = (tie_t << 1) | ((insn[0] << 24) >> 31);
+  return tie_t;
+}
+
+static void
+Field_i_Slot_inst16a_set (xtensa_insnbuf insn, uint32 val)
+{
+  uint32 tie_t;
+  tie_t = (val << 31) >> 31;
+  insn[0] = (insn[0] & ~0x80) | (tie_t << 7);
+}
+
+static unsigned
+Field_imm6lo_Slot_inst16a_get (const xtensa_insnbuf insn)
+{
+  unsigned tie_t = 0;
+  tie_t = (tie_t << 4) | ((insn[0] << 16) >> 28);
+  return tie_t;
+}
+
+static void
+Field_imm6lo_Slot_inst16a_set (xtensa_insnbuf insn, uint32 val)
+{
+  uint32 tie_t;
+  tie_t = (val << 28) >> 28;
+  insn[0] = (insn[0] & ~0xf000) | (tie_t << 12);
+}
+
+static unsigned
+Field_imm6lo_Slot_inst16b_get (const xtensa_insnbuf insn)
+{
+  unsigned tie_t = 0;
+  tie_t = (tie_t << 4) | ((insn[0] << 16) >> 28);
+  return tie_t;
+}
+
+static void
+Field_imm6lo_Slot_inst16b_set (xtensa_insnbuf insn, uint32 val)
+{
+  uint32 tie_t;
+  tie_t = (val << 28) >> 28;
+  insn[0] = (insn[0] & ~0xf000) | (tie_t << 12);
+}
+
+static unsigned
+Field_imm6hi_Slot_inst16a_get (const xtensa_insnbuf insn)
+{
+  unsigned tie_t = 0;
+  tie_t = (tie_t << 2) | ((insn[0] << 26) >> 30);
+  return tie_t;
+}
+
+static void
+Field_imm6hi_Slot_inst16a_set (xtensa_insnbuf insn, uint32 val)
+{
+  uint32 tie_t;
+  tie_t = (val << 30) >> 30;
+  insn[0] = (insn[0] & ~0x30) | (tie_t << 4);
+}
+
+static unsigned
+Field_imm6hi_Slot_inst16b_get (const xtensa_insnbuf insn)
+{
+  unsigned tie_t = 0;
+  tie_t = (tie_t << 2) | ((insn[0] << 26) >> 30);
+  return tie_t;
+}
+
+static void
+Field_imm6hi_Slot_inst16b_set (xtensa_insnbuf insn, uint32 val)
+{
+  uint32 tie_t;
+  tie_t = (val << 30) >> 30;
+  insn[0] = (insn[0] & ~0x30) | (tie_t << 4);
+}
+
+static unsigned
+Field_imm7lo_Slot_inst16a_get (const xtensa_insnbuf insn)
+{
+  unsigned tie_t = 0;
+  tie_t = (tie_t << 4) | ((insn[0] << 16) >> 28);
+  return tie_t;
+}
+
+static void
+Field_imm7lo_Slot_inst16a_set (xtensa_insnbuf insn, uint32 val)
+{
+  uint32 tie_t;
+  tie_t = (val << 28) >> 28;
+  insn[0] = (insn[0] & ~0xf000) | (tie_t << 12);
+}
+
+static unsigned
+Field_imm7lo_Slot_inst16b_get (const xtensa_insnbuf insn)
+{
+  unsigned tie_t = 0;
+  tie_t = (tie_t << 4) | ((insn[0] << 16) >> 28);
+  return tie_t;
+}
+
+static void
+Field_imm7lo_Slot_inst16b_set (xtensa_insnbuf insn, uint32 val)
+{
+  uint32 tie_t;
+  tie_t = (val << 28) >> 28;
+  insn[0] = (insn[0] & ~0xf000) | (tie_t << 12);
+}
+
+static unsigned
+Field_imm7hi_Slot_inst16a_get (const xtensa_insnbuf insn)
+{
+  unsigned tie_t = 0;
+  tie_t = (tie_t << 3) | ((insn[0] << 25) >> 29);
+  return tie_t;
+}
+
+static void
+Field_imm7hi_Slot_inst16a_set (xtensa_insnbuf insn, uint32 val)
+{
+  uint32 tie_t;
+  tie_t = (val << 29) >> 29;
+  insn[0] = (insn[0] & ~0x70) | (tie_t << 4);
+}
+
+static unsigned
+Field_imm7hi_Slot_inst16b_get (const xtensa_insnbuf insn)
+{
+  unsigned tie_t = 0;
+  tie_t = (tie_t << 3) | ((insn[0] << 25) >> 29);
+  return tie_t;
+}
+
+static void
+Field_imm7hi_Slot_inst16b_set (xtensa_insnbuf insn, uint32 val)
+{
+  uint32 tie_t;
+  tie_t = (val << 29) >> 29;
+  insn[0] = (insn[0] & ~0x70) | (tie_t << 4);
+}
+
+static unsigned
+Field_z_Slot_inst16a_get (const xtensa_insnbuf insn)
+{
+  unsigned tie_t = 0;
+  tie_t = (tie_t << 1) | ((insn[0] << 25) >> 31);
+  return tie_t;
+}
+
+static void
+Field_z_Slot_inst16a_set (xtensa_insnbuf insn, uint32 val)
+{
+  uint32 tie_t;
+  tie_t = (val << 31) >> 31;
+  insn[0] = (insn[0] & ~0x40) | (tie_t << 6);
+}
+
+static unsigned
+Field_imm6_Slot_inst16a_get (const xtensa_insnbuf insn)
+{
+  unsigned tie_t = 0;
+  tie_t = (tie_t << 2) | ((insn[0] << 26) >> 30);
+  tie_t = (tie_t << 4) | ((insn[0] << 16) >> 28);
+  return tie_t;
+}
+
+static void
+Field_imm6_Slot_inst16a_set (xtensa_insnbuf insn, uint32 val)
+{
+  uint32 tie_t;
+  tie_t = (val << 28) >> 28;
+  insn[0] = (insn[0] & ~0xf000) | (tie_t << 12);
+  tie_t = (val << 26) >> 30;
+  insn[0] = (insn[0] & ~0x30) | (tie_t << 4);
+}
+
+static unsigned
+Field_imm6_Slot_inst16b_get (const xtensa_insnbuf insn)
+{
+  unsigned tie_t = 0;
+  tie_t = (tie_t << 2) | ((insn[0] << 26) >> 30);
+  tie_t = (tie_t << 4) | ((insn[0] << 16) >> 28);
+  return tie_t;
+}
+
+static void
+Field_imm6_Slot_inst16b_set (xtensa_insnbuf insn, uint32 val)
+{
+  uint32 tie_t;
+  tie_t = (val << 28) >> 28;
+  insn[0] = (insn[0] & ~0xf000) | (tie_t << 12);
+  tie_t = (val << 26) >> 30;
+  insn[0] = (insn[0] & ~0x30) | (tie_t << 4);
+}
+
+static unsigned
+Field_imm7_Slot_inst16a_get (const xtensa_insnbuf insn)
+{
+  unsigned tie_t = 0;
+  tie_t = (tie_t << 3) | ((insn[0] << 25) >> 29);
+  tie_t = (tie_t << 4) | ((insn[0] << 16) >> 28);
+  return tie_t;
+}
+
+static void
+Field_imm7_Slot_inst16a_set (xtensa_insnbuf insn, uint32 val)
+{
+  uint32 tie_t;
+  tie_t = (val << 28) >> 28;
+  insn[0] = (insn[0] & ~0xf000) | (tie_t << 12);
+  tie_t = (val << 25) >> 29;
+  insn[0] = (insn[0] & ~0x70) | (tie_t << 4);
+}
+
+static unsigned
+Field_imm7_Slot_inst16b_get (const xtensa_insnbuf insn)
+{
+  unsigned tie_t = 0;
+  tie_t = (tie_t << 3) | ((insn[0] << 25) >> 29);
+  tie_t = (tie_t << 4) | ((insn[0] << 16) >> 28);
+  return tie_t;
+}
+
+static void
+Field_imm7_Slot_inst16b_set (xtensa_insnbuf insn, uint32 val)
+{
+  uint32 tie_t;
+  tie_t = (val << 28) >> 28;
+  insn[0] = (insn[0] & ~0xf000) | (tie_t << 12);
+  tie_t = (val << 25) >> 29;
+  insn[0] = (insn[0] & ~0x70) | (tie_t << 4);
+}
+
+static unsigned
+Field_xt_wbr15_imm_Slot_inst_get (const xtensa_insnbuf insn)
+{
+  unsigned tie_t = 0;
+  tie_t = (tie_t << 15) | ((insn[0] << 8) >> 17);
+  return tie_t;
+}
+
+static void
+Field_xt_wbr15_imm_Slot_inst_set (xtensa_insnbuf insn, uint32 val)
+{
+  uint32 tie_t;
+  tie_t = (val << 17) >> 17;
+  insn[0] = (insn[0] & ~0xfffe00) | (tie_t << 9);
+}
+
+static unsigned
+Field_xt_wbr18_imm_Slot_inst_get (const xtensa_insnbuf insn)
+{
+  unsigned tie_t = 0;
+  tie_t = (tie_t << 18) | ((insn[0] << 8) >> 14);
+  return tie_t;
+}
+
+static void
+Field_xt_wbr18_imm_Slot_inst_set (xtensa_insnbuf insn, uint32 val)
+{
+  uint32 tie_t;
+  tie_t = (val << 14) >> 14;
+  insn[0] = (insn[0] & ~0xffffc0) | (tie_t << 6);
+}
+
+static void
+Implicit_Field_set (xtensa_insnbuf insn ATTRIBUTE_UNUSED,
+		    uint32 val ATTRIBUTE_UNUSED)
+{
+  /* Do nothing.  */
+}
+
+static unsigned
+Implicit_Field_ar0_get (const xtensa_insnbuf insn ATTRIBUTE_UNUSED)
+{
+  return 0;
+}
+
+enum xtensa_field_id {
+  FIELD_t,
+  FIELD_bbi4,
+  FIELD_bbi,
+  FIELD_imm12,
+  FIELD_imm8,
+  FIELD_s,
+  FIELD_imm12b,
+  FIELD_imm16,
+  FIELD_m,
+  FIELD_n,
+  FIELD_offset,
+  FIELD_op0,
+  FIELD_op1,
+  FIELD_op2,
+  FIELD_r,
+  FIELD_sa4,
+  FIELD_sae4,
+  FIELD_sae,
+  FIELD_sal,
+  FIELD_sargt,
+  FIELD_sas4,
+  FIELD_sas,
+  FIELD_sr,
+  FIELD_st,
+  FIELD_thi3,
+  FIELD_imm4,
+  FIELD_i,
+  FIELD_imm6lo,
+  FIELD_imm6hi,
+  FIELD_imm7lo,
+  FIELD_imm7hi,
+  FIELD_z,
+  FIELD_imm6,
+  FIELD_imm7,
+  FIELD_xt_wbr15_imm,
+  FIELD_xt_wbr18_imm,
+  FIELD__ar0
+};
+
+
+/* Functional units.  */
+
+static xtensa_funcUnit_internal funcUnits[] = {
+
+};
+
+
+/* Register files.  */
+
+enum xtensa_regfile_id {
+  REGFILE_AR
+};
+
+static xtensa_regfile_internal regfiles[] = {
+  { "AR", "a", REGFILE_AR, 32, 16 }
+};
+
+
+/* Interfaces.  */
+
+static xtensa_interface_internal interfaces[] = {
+
+};
+
+
+/* Constant tables.  */
+
+/* constant table ai4c */
+static const unsigned CONST_TBL_ai4c_0[] = {
+  0xffffffff,
+  0x1,
+  0x2,
+  0x3,
+  0x4,
+  0x5,
+  0x6,
+  0x7,
+  0x8,
+  0x9,
+  0xa,
+  0xb,
+  0xc,
+  0xd,
+  0xe,
+  0xf,
+  0
+};
+
+/* constant table b4c */
+static const unsigned CONST_TBL_b4c_0[] = {
+  0xffffffff,
+  0x1,
+  0x2,
+  0x3,
+  0x4,
+  0x5,
+  0x6,
+  0x7,
+  0x8,
+  0xa,
+  0xc,
+  0x10,
+  0x20,
+  0x40,
+  0x80,
+  0x100,
+  0
+};
+
+/* constant table b4cu */
+static const unsigned CONST_TBL_b4cu_0[] = {
+  0x8000,
+  0x10000,
+  0x2,
+  0x3,
+  0x4,
+  0x5,
+  0x6,
+  0x7,
+  0x8,
+  0xa,
+  0xc,
+  0x10,
+  0x20,
+  0x40,
+  0x80,
+  0x100,
+  0
+};
+
+
+/* Instruction operands.  */
+
+static int
+Operand_art_decode (uint32 *valp ATTRIBUTE_UNUSED)
+{
+  return 0;
+}
+
+static int
+Operand_art_encode (uint32 *valp)
+{
+  int error;
+  error = (*valp & ~0xf) != 0;
+  return error;
+}
+
+static int
+Operand_ars_decode (uint32 *valp ATTRIBUTE_UNUSED)
+{
+  return 0;
+}
+
+static int
+Operand_ars_encode (uint32 *valp)
+{
+  int error;
+  error = (*valp & ~0xf) != 0;
+  return error;
+}
+
+static int
+Operand_arr_decode (uint32 *valp ATTRIBUTE_UNUSED)
+{
+  return 0;
+}
+
+static int
+Operand_arr_encode (uint32 *valp)
+{
+  int error;
+  error = (*valp & ~0xf) != 0;
+  return error;
+}
+
+static int
+Operand_ar0_decode (uint32 *valp ATTRIBUTE_UNUSED)
+{
+  return 0;
+}
+
+static int
+Operand_ar0_encode (uint32 *valp)
+{
+  int error;
+  error = (*valp & ~0xf) != 0;
+  return error;
+}
+
+static int
+Operand_soffsetx4_decode (uint32 *valp)
+{
+  unsigned soffsetx4_0, offset_0;
+  offset_0 = *valp & 0x3ffff;
+  soffsetx4_0 = 0x4 + ((((int) offset_0 << 14) >> 14) << 2);
+  *valp = soffsetx4_0;
+  return 0;
+}
+
+static int
+Operand_soffsetx4_encode (uint32 *valp)
+{
+  unsigned offset_0, soffsetx4_0;
+  soffsetx4_0 = *valp;
+  offset_0 = ((soffsetx4_0 - 0x4) >> 2) & 0x3ffff;
+  *valp = offset_0;
+  return 0;
+}
+
+static int
+Operand_soffsetx4_ator (uint32 *valp, uint32 pc)
+{
+  *valp -= (pc & ~0x3);
+  return 0;
+}
+
+static int
+Operand_soffsetx4_rtoa (uint32 *valp, uint32 pc)
+{
+  *valp += (pc & ~0x3);
+  return 0;
+}
+
+static int
+Operand_lsi4x4_decode (uint32 *valp)
+{
+  unsigned lsi4x4_0, r_0;
+  r_0 = *valp & 0xf;
+  lsi4x4_0 = r_0 << 2;
+  *valp = lsi4x4_0;
+  return 0;
+}
+
+static int
+Operand_lsi4x4_encode (uint32 *valp)
+{
+  unsigned r_0, lsi4x4_0;
+  lsi4x4_0 = *valp;
+  r_0 = ((lsi4x4_0 >> 2) & 0xf);
+  *valp = r_0;
+  return 0;
+}
+
+static int
+Operand_simm7_decode (uint32 *valp)
+{
+  unsigned simm7_0, imm7_0;
+  imm7_0 = *valp & 0x7f;
+  simm7_0 = ((((-((((imm7_0 >> 6) & 1)) & (((imm7_0 >> 5) & 1)))) & 0x1ffffff)) << 7) | imm7_0;
+  *valp = simm7_0;
+  return 0;
+}
+
+static int
+Operand_simm7_encode (uint32 *valp)
+{
+  unsigned imm7_0, simm7_0;
+  simm7_0 = *valp;
+  imm7_0 = (simm7_0 & 0x7f);
+  *valp = imm7_0;
+  return 0;
+}
+
+static int
+Operand_uimm6_decode (uint32 *valp)
+{
+  unsigned uimm6_0, imm6_0;
+  imm6_0 = *valp & 0x3f;
+  uimm6_0 = 0x4 + (((0) << 6) | imm6_0);
+  *valp = uimm6_0;
+  return 0;
+}
+
+static int
+Operand_uimm6_encode (uint32 *valp)
+{
+  unsigned imm6_0, uimm6_0;
+  uimm6_0 = *valp;
+  imm6_0 = (uimm6_0 - 0x4) & 0x3f;
+  *valp = imm6_0;
+  return 0;
+}
+
+static int
+Operand_uimm6_ator (uint32 *valp, uint32 pc)
+{
+  *valp -= pc;
+  return 0;
+}
+
+static int
+Operand_uimm6_rtoa (uint32 *valp, uint32 pc)
+{
+  *valp += pc;
+  return 0;
+}
+
+static int
+Operand_ai4const_decode (uint32 *valp)
+{
+  unsigned ai4const_0, t_0;
+  t_0 = *valp & 0xf;
+  ai4const_0 = CONST_TBL_ai4c_0[t_0 & 0xf];
+  *valp = ai4const_0;
+  return 0;
+}
+
+static int
+Operand_ai4const_encode (uint32 *valp)
+{
+  unsigned t_0, ai4const_0;
+  ai4const_0 = *valp;
+  switch (ai4const_0)
+    {
+    case 0xffffffff: t_0 = 0; break;
+    case 0x1: t_0 = 0x1; break;
+    case 0x2: t_0 = 0x2; break;
+    case 0x3: t_0 = 0x3; break;
+    case 0x4: t_0 = 0x4; break;
+    case 0x5: t_0 = 0x5; break;
+    case 0x6: t_0 = 0x6; break;
+    case 0x7: t_0 = 0x7; break;
+    case 0x8: t_0 = 0x8; break;
+    case 0x9: t_0 = 0x9; break;
+    case 0xa: t_0 = 0xa; break;
+    case 0xb: t_0 = 0xb; break;
+    case 0xc: t_0 = 0xc; break;
+    case 0xd: t_0 = 0xd; break;
+    case 0xe: t_0 = 0xe; break;
+    default: t_0 = 0xf; break;
+    }
+  *valp = t_0;
+  return 0;
+}
+
+static int
+Operand_b4const_decode (uint32 *valp)
+{
+  unsigned b4const_0, r_0;
+  r_0 = *valp & 0xf;
+  b4const_0 = CONST_TBL_b4c_0[r_0 & 0xf];
+  *valp = b4const_0;
+  return 0;
+}
+
+static int
+Operand_b4const_encode (uint32 *valp)
+{
+  unsigned r_0, b4const_0;
+  b4const_0 = *valp;
+  switch (b4const_0)
+    {
+    case 0xffffffff: r_0 = 0; break;
+    case 0x1: r_0 = 0x1; break;
+    case 0x2: r_0 = 0x2; break;
+    case 0x3: r_0 = 0x3; break;
+    case 0x4: r_0 = 0x4; break;
+    case 0x5: r_0 = 0x5; break;
+    case 0x6: r_0 = 0x6; break;
+    case 0x7: r_0 = 0x7; break;
+    case 0x8: r_0 = 0x8; break;
+    case 0xa: r_0 = 0x9; break;
+    case 0xc: r_0 = 0xa; break;
+    case 0x10: r_0 = 0xb; break;
+    case 0x20: r_0 = 0xc; break;
+    case 0x40: r_0 = 0xd; break;
+    case 0x80: r_0 = 0xe; break;
+    default: r_0 = 0xf; break;
+    }
+  *valp = r_0;
+  return 0;
+}
+
+static int
+Operand_b4constu_decode (uint32 *valp)
+{
+  unsigned b4constu_0, r_0;
+  r_0 = *valp & 0xf;
+  b4constu_0 = CONST_TBL_b4cu_0[r_0 & 0xf];
+  *valp = b4constu_0;
+  return 0;
+}
+
+static int
+Operand_b4constu_encode (uint32 *valp)
+{
+  unsigned r_0, b4constu_0;
+  b4constu_0 = *valp;
+  switch (b4constu_0)
+    {
+    case 0x8000: r_0 = 0; break;
+    case 0x10000: r_0 = 0x1; break;
+    case 0x2: r_0 = 0x2; break;
+    case 0x3: r_0 = 0x3; break;
+    case 0x4: r_0 = 0x4; break;
+    case 0x5: r_0 = 0x5; break;
+    case 0x6: r_0 = 0x6; break;
+    case 0x7: r_0 = 0x7; break;
+    case 0x8: r_0 = 0x8; break;
+    case 0xa: r_0 = 0x9; break;
+    case 0xc: r_0 = 0xa; break;
+    case 0x10: r_0 = 0xb; break;
+    case 0x20: r_0 = 0xc; break;
+    case 0x40: r_0 = 0xd; break;
+    case 0x80: r_0 = 0xe; break;
+    default: r_0 = 0xf; break;
+    }
+  *valp = r_0;
+  return 0;
+}
+
+static int
+Operand_uimm8_decode (uint32 *valp)
+{
+  unsigned uimm8_0, imm8_0;
+  imm8_0 = *valp & 0xff;
+  uimm8_0 = imm8_0;
+  *valp = uimm8_0;
+  return 0;
+}
+
+static int
+Operand_uimm8_encode (uint32 *valp)
+{
+  unsigned imm8_0, uimm8_0;
+  uimm8_0 = *valp;
+  imm8_0 = (uimm8_0 & 0xff);
+  *valp = imm8_0;
+  return 0;
+}
+
+static int
+Operand_uimm8x2_decode (uint32 *valp)
+{
+  unsigned uimm8x2_0, imm8_0;
+  imm8_0 = *valp & 0xff;
+  uimm8x2_0 = imm8_0 << 1;
+  *valp = uimm8x2_0;
+  return 0;
+}
+
+static int
+Operand_uimm8x2_encode (uint32 *valp)
+{
+  unsigned imm8_0, uimm8x2_0;
+  uimm8x2_0 = *valp;
+  imm8_0 = ((uimm8x2_0 >> 1) & 0xff);
+  *valp = imm8_0;
+  return 0;
+}
+
+static int
+Operand_uimm8x4_decode (uint32 *valp)
+{
+  unsigned uimm8x4_0, imm8_0;
+  imm8_0 = *valp & 0xff;
+  uimm8x4_0 = imm8_0 << 2;
+  *valp = uimm8x4_0;
+  return 0;
+}
+
+static int
+Operand_uimm8x4_encode (uint32 *valp)
+{
+  unsigned imm8_0, uimm8x4_0;
+  uimm8x4_0 = *valp;
+  imm8_0 = ((uimm8x4_0 >> 2) & 0xff);
+  *valp = imm8_0;
+  return 0;
+}
+
+static int
+Operand_uimm4x16_decode (uint32 *valp)
+{
+  unsigned uimm4x16_0, op2_0;
+  op2_0 = *valp & 0xf;
+  uimm4x16_0 = op2_0 << 4;
+  *valp = uimm4x16_0;
+  return 0;
+}
+
+static int
+Operand_uimm4x16_encode (uint32 *valp)
+{
+  unsigned op2_0, uimm4x16_0;
+  uimm4x16_0 = *valp;
+  op2_0 = ((uimm4x16_0 >> 4) & 0xf);
+  *valp = op2_0;
+  return 0;
+}
+
+static int
+Operand_simm8_decode (uint32 *valp)
+{
+  unsigned simm8_0, imm8_0;
+  imm8_0 = *valp & 0xff;
+  simm8_0 = ((int) imm8_0 << 24) >> 24;
+  *valp = simm8_0;
+  return 0;
+}
+
+static int
+Operand_simm8_encode (uint32 *valp)
+{
+  unsigned imm8_0, simm8_0;
+  simm8_0 = *valp;
+  imm8_0 = (simm8_0 & 0xff);
+  *valp = imm8_0;
+  return 0;
+}
+
+static int
+Operand_simm8x256_decode (uint32 *valp)
+{
+  unsigned simm8x256_0, imm8_0;
+  imm8_0 = *valp & 0xff;
+  simm8x256_0 = (((int) imm8_0 << 24) >> 24) << 8;
+  *valp = simm8x256_0;
+  return 0;
+}
+
+static int
+Operand_simm8x256_encode (uint32 *valp)
+{
+  unsigned imm8_0, simm8x256_0;
+  simm8x256_0 = *valp;
+  imm8_0 = ((simm8x256_0 >> 8) & 0xff);
+  *valp = imm8_0;
+  return 0;
+}
+
+static int
+Operand_simm12b_decode (uint32 *valp)
+{
+  unsigned simm12b_0, imm12b_0;
+  imm12b_0 = *valp & 0xfff;
+  simm12b_0 = ((int) imm12b_0 << 20) >> 20;
+  *valp = simm12b_0;
+  return 0;
+}
+
+static int
+Operand_simm12b_encode (uint32 *valp)
+{
+  unsigned imm12b_0, simm12b_0;
+  simm12b_0 = *valp;
+  imm12b_0 = (simm12b_0 & 0xfff);
+  *valp = imm12b_0;
+  return 0;
+}
+
+static int
+Operand_msalp32_decode (uint32 *valp)
+{
+  unsigned msalp32_0, sal_0;
+  sal_0 = *valp & 0x1f;
+  msalp32_0 = 0x20 - sal_0;
+  *valp = msalp32_0;
+  return 0;
+}
+
+static int
+Operand_msalp32_encode (uint32 *valp)
+{
+  unsigned sal_0, msalp32_0;
+  msalp32_0 = *valp;
+  sal_0 = (0x20 - msalp32_0) & 0x1f;
+  *valp = sal_0;
+  return 0;
+}
+
+static int
+Operand_op2p1_decode (uint32 *valp)
+{
+  unsigned op2p1_0, op2_0;
+  op2_0 = *valp & 0xf;
+  op2p1_0 = op2_0 + 0x1;
+  *valp = op2p1_0;
+  return 0;
+}
+
+static int
+Operand_op2p1_encode (uint32 *valp)
+{
+  unsigned op2_0, op2p1_0;
+  op2p1_0 = *valp;
+  op2_0 = (op2p1_0 - 0x1) & 0xf;
+  *valp = op2_0;
+  return 0;
+}
+
+static int
+Operand_label8_decode (uint32 *valp)
+{
+  unsigned label8_0, imm8_0;
+  imm8_0 = *valp & 0xff;
+  label8_0 = 0x4 + (((int) imm8_0 << 24) >> 24);
+  *valp = label8_0;
+  return 0;
+}
+
+static int
+Operand_label8_encode (uint32 *valp)
+{
+  unsigned imm8_0, label8_0;
+  label8_0 = *valp;
+  imm8_0 = (label8_0 - 0x4) & 0xff;
+  *valp = imm8_0;
+  return 0;
+}
+
+static int
+Operand_label8_ator (uint32 *valp, uint32 pc)
+{
+  *valp -= pc;
+  return 0;
+}
+
+static int
+Operand_label8_rtoa (uint32 *valp, uint32 pc)
+{
+  *valp += pc;
+  return 0;
+}
+
+static int
+Operand_label12_decode (uint32 *valp)
+{
+  unsigned label12_0, imm12_0;
+  imm12_0 = *valp & 0xfff;
+  label12_0 = 0x4 + (((int) imm12_0 << 20) >> 20);
+  *valp = label12_0;
+  return 0;
+}
+
+static int
+Operand_label12_encode (uint32 *valp)
+{
+  unsigned imm12_0, label12_0;
+  label12_0 = *valp;
+  imm12_0 = (label12_0 - 0x4) & 0xfff;
+  *valp = imm12_0;
+  return 0;
+}
+
+static int
+Operand_label12_ator (uint32 *valp, uint32 pc)
+{
+  *valp -= pc;
+  return 0;
+}
+
+static int
+Operand_label12_rtoa (uint32 *valp, uint32 pc)
+{
+  *valp += pc;
+  return 0;
+}
+
+static int
+Operand_soffset_decode (uint32 *valp)
+{
+  unsigned soffset_0, offset_0;
+  offset_0 = *valp & 0x3ffff;
+  soffset_0 = 0x4 + (((int) offset_0 << 14) >> 14);
+  *valp = soffset_0;
+  return 0;
+}
+
+static int
+Operand_soffset_encode (uint32 *valp)
+{
+  unsigned offset_0, soffset_0;
+  soffset_0 = *valp;
+  offset_0 = (soffset_0 - 0x4) & 0x3ffff;
+  *valp = offset_0;
+  return 0;
+}
+
+static int
+Operand_soffset_ator (uint32 *valp, uint32 pc)
+{
+  *valp -= pc;
+  return 0;
+}
+
+static int
+Operand_soffset_rtoa (uint32 *valp, uint32 pc)
+{
+  *valp += pc;
+  return 0;
+}
+
+static int
+Operand_uimm16x4_decode (uint32 *valp)
+{
+  unsigned uimm16x4_0, imm16_0;
+  imm16_0 = *valp & 0xffff;
+  uimm16x4_0 = (((0xffff) << 16) | imm16_0) << 2;
+  *valp = uimm16x4_0;
+  return 0;
+}
+
+static int
+Operand_uimm16x4_encode (uint32 *valp)
+{
+  unsigned imm16_0, uimm16x4_0;
+  uimm16x4_0 = *valp;
+  imm16_0 = (uimm16x4_0 >> 2) & 0xffff;
+  *valp = imm16_0;
+  return 0;
+}
+
+static int
+Operand_uimm16x4_ator (uint32 *valp, uint32 pc)
+{
+  *valp -= ((pc + 3) & ~0x3);
+  return 0;
+}
+
+static int
+Operand_uimm16x4_rtoa (uint32 *valp, uint32 pc)
+{
+  *valp += ((pc + 3) & ~0x3);
+  return 0;
+}
+
+static int
+Operand_immt_decode (uint32 *valp)
+{
+  unsigned immt_0, t_0;
+  t_0 = *valp & 0xf;
+  immt_0 = t_0;
+  *valp = immt_0;
+  return 0;
+}
+
+static int
+Operand_immt_encode (uint32 *valp)
+{
+  unsigned t_0, immt_0;
+  immt_0 = *valp;
+  t_0 = immt_0 & 0xf;
+  *valp = t_0;
+  return 0;
+}
+
+static int
+Operand_imms_decode (uint32 *valp)
+{
+  unsigned imms_0, s_0;
+  s_0 = *valp & 0xf;
+  imms_0 = s_0;
+  *valp = imms_0;
+  return 0;
+}
+
+static int
+Operand_imms_encode (uint32 *valp)
+{
+  unsigned s_0, imms_0;
+  imms_0 = *valp;
+  s_0 = imms_0 & 0xf;
+  *valp = s_0;
+  return 0;
+}
+
+static int
+Operand_xt_wbr15_label_decode (uint32 *valp)
+{
+  unsigned xt_wbr15_label_0, xt_wbr15_imm_0;
+  xt_wbr15_imm_0 = *valp & 0x7fff;
+  xt_wbr15_label_0 = 0x4 + (((int) xt_wbr15_imm_0 << 17) >> 17);
+  *valp = xt_wbr15_label_0;
+  return 0;
+}
+
+static int
+Operand_xt_wbr15_label_encode (uint32 *valp)
+{
+  unsigned xt_wbr15_imm_0, xt_wbr15_label_0;
+  xt_wbr15_label_0 = *valp;
+  xt_wbr15_imm_0 = (xt_wbr15_label_0 - 0x4) & 0x7fff;
+  *valp = xt_wbr15_imm_0;
+  return 0;
+}
+
+static int
+Operand_xt_wbr15_label_ator (uint32 *valp, uint32 pc)
+{
+  *valp -= pc;
+  return 0;
+}
+
+static int
+Operand_xt_wbr15_label_rtoa (uint32 *valp, uint32 pc)
+{
+  *valp += pc;
+  return 0;
+}
+
+static int
+Operand_xt_wbr18_label_decode (uint32 *valp)
+{
+  unsigned xt_wbr18_label_0, xt_wbr18_imm_0;
+  xt_wbr18_imm_0 = *valp & 0x3ffff;
+  xt_wbr18_label_0 = 0x4 + (((int) xt_wbr18_imm_0 << 14) >> 14);
+  *valp = xt_wbr18_label_0;
+  return 0;
+}
+
+static int
+Operand_xt_wbr18_label_encode (uint32 *valp)
+{
+  unsigned xt_wbr18_imm_0, xt_wbr18_label_0;
+  xt_wbr18_label_0 = *valp;
+  xt_wbr18_imm_0 = (xt_wbr18_label_0 - 0x4) & 0x3ffff;
+  *valp = xt_wbr18_imm_0;
+  return 0;
+}
+
+static int
+Operand_xt_wbr18_label_ator (uint32 *valp, uint32 pc)
+{
+  *valp -= pc;
+  return 0;
+}
+
+static int
+Operand_xt_wbr18_label_rtoa (uint32 *valp, uint32 pc)
+{
+  *valp += pc;
+  return 0;
+}
+
+static xtensa_operand_internal operands[] = {
+  { "art", FIELD_t, REGFILE_AR, 1,
+    XTENSA_OPERAND_IS_REGISTER,
+    Operand_art_encode, Operand_art_decode,
+    0, 0 },
+  { "ars", FIELD_s, REGFILE_AR, 1,
+    XTENSA_OPERAND_IS_REGISTER,
+    Operand_ars_encode, Operand_ars_decode,
+    0, 0 },
+  { "*ars_invisible", FIELD_s, REGFILE_AR, 1,
+    XTENSA_OPERAND_IS_REGISTER | XTENSA_OPERAND_IS_INVISIBLE,
+    Operand_ars_encode, Operand_ars_decode,
+    0, 0 },
+  { "arr", FIELD_r, REGFILE_AR, 1,
+    XTENSA_OPERAND_IS_REGISTER,
+    Operand_arr_encode, Operand_arr_decode,
+    0, 0 },
+  { "ar0", FIELD__ar0, REGFILE_AR, 1,
+    XTENSA_OPERAND_IS_REGISTER | XTENSA_OPERAND_IS_INVISIBLE,
+    Operand_ar0_encode, Operand_ar0_decode,
+    0, 0 },
+  { "soffsetx4", FIELD_offset, -1, 0,
+    XTENSA_OPERAND_IS_PCRELATIVE,
+    Operand_soffsetx4_encode, Operand_soffsetx4_decode,
+    Operand_soffsetx4_ator, Operand_soffsetx4_rtoa },
+  { "lsi4x4", FIELD_r, -1, 0,
+    0,
+    Operand_lsi4x4_encode, Operand_lsi4x4_decode,
+    0, 0 },
+  { "simm7", FIELD_imm7, -1, 0,
+    0,
+    Operand_simm7_encode, Operand_simm7_decode,
+    0, 0 },
+  { "uimm6", FIELD_imm6, -1, 0,
+    XTENSA_OPERAND_IS_PCRELATIVE,
+    Operand_uimm6_encode, Operand_uimm6_decode,
+    Operand_uimm6_ator, Operand_uimm6_rtoa },
+  { "ai4const", FIELD_t, -1, 0,
+    0,
+    Operand_ai4const_encode, Operand_ai4const_decode,
+    0, 0 },
+  { "b4const", FIELD_r, -1, 0,
+    0,
+    Operand_b4const_encode, Operand_b4const_decode,
+    0, 0 },
+  { "b4constu", FIELD_r, -1, 0,
+    0,
+    Operand_b4constu_encode, Operand_b4constu_decode,
+    0, 0 },
+  { "uimm8", FIELD_imm8, -1, 0,
+    0,
+    Operand_uimm8_encode, Operand_uimm8_decode,
+    0, 0 },
+  { "uimm8x2", FIELD_imm8, -1, 0,
+    0,
+    Operand_uimm8x2_encode, Operand_uimm8x2_decode,
+    0, 0 },
+  { "uimm8x4", FIELD_imm8, -1, 0,
+    0,
+    Operand_uimm8x4_encode, Operand_uimm8x4_decode,
+    0, 0 },
+  { "uimm4x16", FIELD_op2, -1, 0,
+    0,
+    Operand_uimm4x16_encode, Operand_uimm4x16_decode,
+    0, 0 },
+  { "simm8", FIELD_imm8, -1, 0,
+    0,
+    Operand_simm8_encode, Operand_simm8_decode,
+    0, 0 },
+  { "simm8x256", FIELD_imm8, -1, 0,
+    0,
+    Operand_simm8x256_encode, Operand_simm8x256_decode,
+    0, 0 },
+  { "simm12b", FIELD_imm12b, -1, 0,
+    0,
+    Operand_simm12b_encode, Operand_simm12b_decode,
+    0, 0 },
+  { "msalp32", FIELD_sal, -1, 0,
+    0,
+    Operand_msalp32_encode, Operand_msalp32_decode,
+    0, 0 },
+  { "op2p1", FIELD_op2, -1, 0,
+    0,
+    Operand_op2p1_encode, Operand_op2p1_decode,
+    0, 0 },
+  { "label8", FIELD_imm8, -1, 0,
+    XTENSA_OPERAND_IS_PCRELATIVE,
+    Operand_label8_encode, Operand_label8_decode,
+    Operand_label8_ator, Operand_label8_rtoa },
+  { "label12", FIELD_imm12, -1, 0,
+    XTENSA_OPERAND_IS_PCRELATIVE,
+    Operand_label12_encode, Operand_label12_decode,
+    Operand_label12_ator, Operand_label12_rtoa },
+  { "soffset", FIELD_offset, -1, 0,
+    XTENSA_OPERAND_IS_PCRELATIVE,
+    Operand_soffset_encode, Operand_soffset_decode,
+    Operand_soffset_ator, Operand_soffset_rtoa },
+  { "uimm16x4", FIELD_imm16, -1, 0,
+    XTENSA_OPERAND_IS_PCRELATIVE,
+    Operand_uimm16x4_encode, Operand_uimm16x4_decode,
+    Operand_uimm16x4_ator, Operand_uimm16x4_rtoa },
+  { "immt", FIELD_t, -1, 0,
+    0,
+    Operand_immt_encode, Operand_immt_decode,
+    0, 0 },
+  { "imms", FIELD_s, -1, 0,
+    0,
+    Operand_imms_encode, Operand_imms_decode,
+    0, 0 },
+  { "xt_wbr15_label", FIELD_xt_wbr15_imm, -1, 0,
+    XTENSA_OPERAND_IS_PCRELATIVE,
+    Operand_xt_wbr15_label_encode, Operand_xt_wbr15_label_decode,
+    Operand_xt_wbr15_label_ator, Operand_xt_wbr15_label_rtoa },
+  { "xt_wbr18_label", FIELD_xt_wbr18_imm, -1, 0,
+    XTENSA_OPERAND_IS_PCRELATIVE,
+    Operand_xt_wbr18_label_encode, Operand_xt_wbr18_label_decode,
+    Operand_xt_wbr18_label_ator, Operand_xt_wbr18_label_rtoa },
+  { "t", FIELD_t, -1, 0, 0, 0, 0, 0, 0 },
+  { "bbi4", FIELD_bbi4, -1, 0, 0, 0, 0, 0, 0 },
+  { "bbi", FIELD_bbi, -1, 0, 0, 0, 0, 0, 0 },
+  { "imm12", FIELD_imm12, -1, 0, 0, 0, 0, 0, 0 },
+  { "imm8", FIELD_imm8, -1, 0, 0, 0, 0, 0, 0 },
+  { "s", FIELD_s, -1, 0, 0, 0, 0, 0, 0 },
+  { "imm12b", FIELD_imm12b, -1, 0, 0, 0, 0, 0, 0 },
+  { "imm16", FIELD_imm16, -1, 0, 0, 0, 0, 0, 0 },
+  { "m", FIELD_m, -1, 0, 0, 0, 0, 0, 0 },
+  { "n", FIELD_n, -1, 0, 0, 0, 0, 0, 0 },
+  { "offset", FIELD_offset, -1, 0, 0, 0, 0, 0, 0 },
+  { "op0", FIELD_op0, -1, 0, 0, 0, 0, 0, 0 },
+  { "op1", FIELD_op1, -1, 0, 0, 0, 0, 0, 0 },
+  { "op2", FIELD_op2, -1, 0, 0, 0, 0, 0, 0 },
+  { "r", FIELD_r, -1, 0, 0, 0, 0, 0, 0 },
+  { "sa4", FIELD_sa4, -1, 0, 0, 0, 0, 0, 0 },
+  { "sae4", FIELD_sae4, -1, 0, 0, 0, 0, 0, 0 },
+  { "sae", FIELD_sae, -1, 0, 0, 0, 0, 0, 0 },
+  { "sal", FIELD_sal, -1, 0, 0, 0, 0, 0, 0 },
+  { "sargt", FIELD_sargt, -1, 0, 0, 0, 0, 0, 0 },
+  { "sas4", FIELD_sas4, -1, 0, 0, 0, 0, 0, 0 },
+  { "sas", FIELD_sas, -1, 0, 0, 0, 0, 0, 0 },
+  { "sr", FIELD_sr, -1, 0, 0, 0, 0, 0, 0 },
+  { "st", FIELD_st, -1, 0, 0, 0, 0, 0, 0 },
+  { "thi3", FIELD_thi3, -1, 0, 0, 0, 0, 0, 0 },
+  { "imm4", FIELD_imm4, -1, 0, 0, 0, 0, 0, 0 },
+  { "i", FIELD_i, -1, 0, 0, 0, 0, 0, 0 },
+  { "imm6lo", FIELD_imm6lo, -1, 0, 0, 0, 0, 0, 0 },
+  { "imm6hi", FIELD_imm6hi, -1, 0, 0, 0, 0, 0, 0 },
+  { "imm7lo", FIELD_imm7lo, -1, 0, 0, 0, 0, 0, 0 },
+  { "imm7hi", FIELD_imm7hi, -1, 0, 0, 0, 0, 0, 0 },
+  { "z", FIELD_z, -1, 0, 0, 0, 0, 0, 0 },
+  { "imm6", FIELD_imm6, -1, 0, 0, 0, 0, 0, 0 },
+  { "imm7", FIELD_imm7, -1, 0, 0, 0, 0, 0, 0 },
+  { "xt_wbr15_imm", FIELD_xt_wbr15_imm, -1, 0, 0, 0, 0, 0, 0 },
+  { "xt_wbr18_imm", FIELD_xt_wbr18_imm, -1, 0, 0, 0, 0, 0, 0 }
+};
+
+enum xtensa_operand_id {
+  OPERAND_art,
+  OPERAND_ars,
+  OPERAND__ars_invisible,
+  OPERAND_arr,
+  OPERAND_ar0,
+  OPERAND_soffsetx4,
+  OPERAND_lsi4x4,
+  OPERAND_simm7,
+  OPERAND_uimm6,
+  OPERAND_ai4const,
+  OPERAND_b4const,
+  OPERAND_b4constu,
+  OPERAND_uimm8,
+  OPERAND_uimm8x2,
+  OPERAND_uimm8x4,
+  OPERAND_uimm4x16,
+  OPERAND_simm8,
+  OPERAND_simm8x256,
+  OPERAND_simm12b,
+  OPERAND_msalp32,
+  OPERAND_op2p1,
+  OPERAND_label8,
+  OPERAND_label12,
+  OPERAND_soffset,
+  OPERAND_uimm16x4,
+  OPERAND_immt,
+  OPERAND_imms,
+  OPERAND_xt_wbr15_label,
+  OPERAND_xt_wbr18_label,
+  OPERAND_t,
+  OPERAND_bbi4,
+  OPERAND_bbi,
+  OPERAND_imm12,
+  OPERAND_imm8,
+  OPERAND_s,
+  OPERAND_imm12b,
+  OPERAND_imm16,
+  OPERAND_m,
+  OPERAND_n,
+  OPERAND_offset,
+  OPERAND_op0,
+  OPERAND_op1,
+  OPERAND_op2,
+  OPERAND_r,
+  OPERAND_sa4,
+  OPERAND_sae4,
+  OPERAND_sae,
+  OPERAND_sal,
+  OPERAND_sargt,
+  OPERAND_sas4,
+  OPERAND_sas,
+  OPERAND_sr,
+  OPERAND_st,
+  OPERAND_thi3,
+  OPERAND_imm4,
+  OPERAND_i,
+  OPERAND_imm6lo,
+  OPERAND_imm6hi,
+  OPERAND_imm7lo,
+  OPERAND_imm7hi,
+  OPERAND_z,
+  OPERAND_imm6,
+  OPERAND_imm7,
+  OPERAND_xt_wbr15_imm,
+  OPERAND_xt_wbr18_imm
+};
+
+
+/* Iclass table.  */
+
+static xtensa_arg_internal Iclass_xt_iclass_rfe_stateArgs[] = {
+  { { STATE_PSEXCM }, 'o' },
+  { { STATE_EPC1 }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_rfde_stateArgs[] = {
+  { { STATE_DEPC }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_add_n_args[] = {
+  { { OPERAND_arr }, 'o' },
+  { { OPERAND_ars }, 'i' },
+  { { OPERAND_art }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_addi_n_args[] = {
+  { { OPERAND_arr }, 'o' },
+  { { OPERAND_ars }, 'i' },
+  { { OPERAND_ai4const }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_bz6_args[] = {
+  { { OPERAND_ars }, 'i' },
+  { { OPERAND_uimm6 }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_loadi4_args[] = {
+  { { OPERAND_art }, 'o' },
+  { { OPERAND_ars }, 'i' },
+  { { OPERAND_lsi4x4 }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_mov_n_args[] = {
+  { { OPERAND_art }, 'o' },
+  { { OPERAND_ars }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_movi_n_args[] = {
+  { { OPERAND_ars }, 'o' },
+  { { OPERAND_simm7 }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_retn_args[] = {
+  { { OPERAND__ars_invisible }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_storei4_args[] = {
+  { { OPERAND_art }, 'i' },
+  { { OPERAND_ars }, 'i' },
+  { { OPERAND_lsi4x4 }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_addi_args[] = {
+  { { OPERAND_art }, 'o' },
+  { { OPERAND_ars }, 'i' },
+  { { OPERAND_simm8 }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_addmi_args[] = {
+  { { OPERAND_art }, 'o' },
+  { { OPERAND_ars }, 'i' },
+  { { OPERAND_simm8x256 }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_addsub_args[] = {
+  { { OPERAND_arr }, 'o' },
+  { { OPERAND_ars }, 'i' },
+  { { OPERAND_art }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_bit_args[] = {
+  { { OPERAND_arr }, 'o' },
+  { { OPERAND_ars }, 'i' },
+  { { OPERAND_art }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_bsi8_args[] = {
+  { { OPERAND_ars }, 'i' },
+  { { OPERAND_b4const }, 'i' },
+  { { OPERAND_label8 }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_bsi8b_args[] = {
+  { { OPERAND_ars }, 'i' },
+  { { OPERAND_bbi }, 'i' },
+  { { OPERAND_label8 }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_bsi8u_args[] = {
+  { { OPERAND_ars }, 'i' },
+  { { OPERAND_b4constu }, 'i' },
+  { { OPERAND_label8 }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_bst8_args[] = {
+  { { OPERAND_ars }, 'i' },
+  { { OPERAND_art }, 'i' },
+  { { OPERAND_label8 }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_bsz12_args[] = {
+  { { OPERAND_ars }, 'i' },
+  { { OPERAND_label12 }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_call0_args[] = {
+  { { OPERAND_soffsetx4 }, 'i' },
+  { { OPERAND_ar0 }, 'o' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_callx0_args[] = {
+  { { OPERAND_ars }, 'i' },
+  { { OPERAND_ar0 }, 'o' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_exti_args[] = {
+  { { OPERAND_arr }, 'o' },
+  { { OPERAND_art }, 'i' },
+  { { OPERAND_sae }, 'i' },
+  { { OPERAND_op2p1 }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_jump_args[] = {
+  { { OPERAND_soffset }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_jumpx_args[] = {
+  { { OPERAND_ars }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_l16ui_args[] = {
+  { { OPERAND_art }, 'o' },
+  { { OPERAND_ars }, 'i' },
+  { { OPERAND_uimm8x2 }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_l16si_args[] = {
+  { { OPERAND_art }, 'o' },
+  { { OPERAND_ars }, 'i' },
+  { { OPERAND_uimm8x2 }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_l32i_args[] = {
+  { { OPERAND_art }, 'o' },
+  { { OPERAND_ars }, 'i' },
+  { { OPERAND_uimm8x4 }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_l32r_args[] = {
+  { { OPERAND_art }, 'o' },
+  { { OPERAND_uimm16x4 }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_l32r_stateArgs[] = {
+  { { STATE_LITBADDR }, 'i' },
+  { { STATE_LITBEN }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_l8i_args[] = {
+  { { OPERAND_art }, 'o' },
+  { { OPERAND_ars }, 'i' },
+  { { OPERAND_uimm8 }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_movi_args[] = {
+  { { OPERAND_art }, 'o' },
+  { { OPERAND_simm12b }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_movz_args[] = {
+  { { OPERAND_arr }, 'm' },
+  { { OPERAND_ars }, 'i' },
+  { { OPERAND_art }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_neg_args[] = {
+  { { OPERAND_arr }, 'o' },
+  { { OPERAND_art }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_return_args[] = {
+  { { OPERAND__ars_invisible }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_s16i_args[] = {
+  { { OPERAND_art }, 'i' },
+  { { OPERAND_ars }, 'i' },
+  { { OPERAND_uimm8x2 }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_s32i_args[] = {
+  { { OPERAND_art }, 'i' },
+  { { OPERAND_ars }, 'i' },
+  { { OPERAND_uimm8x4 }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_s8i_args[] = {
+  { { OPERAND_art }, 'i' },
+  { { OPERAND_ars }, 'i' },
+  { { OPERAND_uimm8 }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_sar_args[] = {
+  { { OPERAND_ars }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_sar_stateArgs[] = {
+  { { STATE_SAR }, 'o' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_sari_args[] = {
+  { { OPERAND_sas }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_sari_stateArgs[] = {
+  { { STATE_SAR }, 'o' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_shifts_args[] = {
+  { { OPERAND_arr }, 'o' },
+  { { OPERAND_ars }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_shifts_stateArgs[] = {
+  { { STATE_SAR }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_shiftst_args[] = {
+  { { OPERAND_arr }, 'o' },
+  { { OPERAND_ars }, 'i' },
+  { { OPERAND_art }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_shiftst_stateArgs[] = {
+  { { STATE_SAR }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_shiftt_args[] = {
+  { { OPERAND_arr }, 'o' },
+  { { OPERAND_art }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_shiftt_stateArgs[] = {
+  { { STATE_SAR }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_slli_args[] = {
+  { { OPERAND_arr }, 'o' },
+  { { OPERAND_ars }, 'i' },
+  { { OPERAND_msalp32 }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_srai_args[] = {
+  { { OPERAND_arr }, 'o' },
+  { { OPERAND_art }, 'i' },
+  { { OPERAND_sargt }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_srli_args[] = {
+  { { OPERAND_arr }, 'o' },
+  { { OPERAND_art }, 'i' },
+  { { OPERAND_s }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_sync_stateArgs[] = {
+  { { STATE_XTSYNC }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_rsil_args[] = {
+  { { OPERAND_art }, 'o' },
+  { { OPERAND_s }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_rsil_stateArgs[] = {
+  { { STATE_PSUM }, 'i' },
+  { { STATE_PSEXCM }, 'i' },
+  { { STATE_PSINTLEVEL }, 'm' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_rsr_sar_args[] = {
+  { { OPERAND_art }, 'o' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_rsr_sar_stateArgs[] = {
+  { { STATE_SAR }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_wsr_sar_args[] = {
+  { { OPERAND_art }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_wsr_sar_stateArgs[] = {
+  { { STATE_SAR }, 'o' },
+  { { STATE_XTSYNC }, 'o' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_xsr_sar_args[] = {
+  { { OPERAND_art }, 'm' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_xsr_sar_stateArgs[] = {
+  { { STATE_SAR }, 'm' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_rsr_litbase_args[] = {
+  { { OPERAND_art }, 'o' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_rsr_litbase_stateArgs[] = {
+  { { STATE_LITBADDR }, 'i' },
+  { { STATE_LITBEN }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_wsr_litbase_args[] = {
+  { { OPERAND_art }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_wsr_litbase_stateArgs[] = {
+  { { STATE_LITBADDR }, 'o' },
+  { { STATE_LITBEN }, 'o' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_xsr_litbase_args[] = {
+  { { OPERAND_art }, 'm' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_xsr_litbase_stateArgs[] = {
+  { { STATE_LITBADDR }, 'm' },
+  { { STATE_LITBEN }, 'm' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_rsr_176_args[] = {
+  { { OPERAND_art }, 'o' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_wsr_176_args[] = {
+  { { OPERAND_art }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_rsr_208_args[] = {
+  { { OPERAND_art }, 'o' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_rsr_ps_args[] = {
+  { { OPERAND_art }, 'o' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_rsr_ps_stateArgs[] = {
+  { { STATE_PSUM }, 'i' },
+  { { STATE_PSEXCM }, 'i' },
+  { { STATE_PSINTLEVEL }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_wsr_ps_args[] = {
+  { { OPERAND_art }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_wsr_ps_stateArgs[] = {
+  { { STATE_PSUM }, 'o' },
+  { { STATE_PSEXCM }, 'o' },
+  { { STATE_PSINTLEVEL }, 'o' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_xsr_ps_args[] = {
+  { { OPERAND_art }, 'm' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_xsr_ps_stateArgs[] = {
+  { { STATE_PSUM }, 'm' },
+  { { STATE_PSEXCM }, 'm' },
+  { { STATE_PSINTLEVEL }, 'm' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_rsr_epc1_args[] = {
+  { { OPERAND_art }, 'o' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_rsr_epc1_stateArgs[] = {
+  { { STATE_EPC1 }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_wsr_epc1_args[] = {
+  { { OPERAND_art }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_wsr_epc1_stateArgs[] = {
+  { { STATE_EPC1 }, 'o' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_xsr_epc1_args[] = {
+  { { OPERAND_art }, 'm' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_xsr_epc1_stateArgs[] = {
+  { { STATE_EPC1 }, 'm' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_rsr_excsave1_args[] = {
+  { { OPERAND_art }, 'o' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_rsr_excsave1_stateArgs[] = {
+  { { STATE_EXCSAVE1 }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_wsr_excsave1_args[] = {
+  { { OPERAND_art }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_wsr_excsave1_stateArgs[] = {
+  { { STATE_EXCSAVE1 }, 'o' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_xsr_excsave1_args[] = {
+  { { OPERAND_art }, 'm' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_xsr_excsave1_stateArgs[] = {
+  { { STATE_EXCSAVE1 }, 'm' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_rsr_epc2_args[] = {
+  { { OPERAND_art }, 'o' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_rsr_epc2_stateArgs[] = {
+  { { STATE_EPC2 }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_wsr_epc2_args[] = {
+  { { OPERAND_art }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_wsr_epc2_stateArgs[] = {
+  { { STATE_EPC2 }, 'o' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_xsr_epc2_args[] = {
+  { { OPERAND_art }, 'm' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_xsr_epc2_stateArgs[] = {
+  { { STATE_EPC2 }, 'm' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_rsr_excsave2_args[] = {
+  { { OPERAND_art }, 'o' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_rsr_excsave2_stateArgs[] = {
+  { { STATE_EXCSAVE2 }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_wsr_excsave2_args[] = {
+  { { OPERAND_art }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_wsr_excsave2_stateArgs[] = {
+  { { STATE_EXCSAVE2 }, 'o' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_xsr_excsave2_args[] = {
+  { { OPERAND_art }, 'm' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_xsr_excsave2_stateArgs[] = {
+  { { STATE_EXCSAVE2 }, 'm' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_rsr_epc3_args[] = {
+  { { OPERAND_art }, 'o' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_rsr_epc3_stateArgs[] = {
+  { { STATE_EPC3 }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_wsr_epc3_args[] = {
+  { { OPERAND_art }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_wsr_epc3_stateArgs[] = {
+  { { STATE_EPC3 }, 'o' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_xsr_epc3_args[] = {
+  { { OPERAND_art }, 'm' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_xsr_epc3_stateArgs[] = {
+  { { STATE_EPC3 }, 'm' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_rsr_excsave3_args[] = {
+  { { OPERAND_art }, 'o' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_rsr_excsave3_stateArgs[] = {
+  { { STATE_EXCSAVE3 }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_wsr_excsave3_args[] = {
+  { { OPERAND_art }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_wsr_excsave3_stateArgs[] = {
+  { { STATE_EXCSAVE3 }, 'o' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_xsr_excsave3_args[] = {
+  { { OPERAND_art }, 'm' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_xsr_excsave3_stateArgs[] = {
+  { { STATE_EXCSAVE3 }, 'm' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_rsr_eps2_args[] = {
+  { { OPERAND_art }, 'o' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_rsr_eps2_stateArgs[] = {
+  { { STATE_EPS2 }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_wsr_eps2_args[] = {
+  { { OPERAND_art }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_wsr_eps2_stateArgs[] = {
+  { { STATE_EPS2 }, 'o' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_xsr_eps2_args[] = {
+  { { OPERAND_art }, 'm' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_xsr_eps2_stateArgs[] = {
+  { { STATE_EPS2 }, 'm' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_rsr_eps3_args[] = {
+  { { OPERAND_art }, 'o' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_rsr_eps3_stateArgs[] = {
+  { { STATE_EPS3 }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_wsr_eps3_args[] = {
+  { { OPERAND_art }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_wsr_eps3_stateArgs[] = {
+  { { STATE_EPS3 }, 'o' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_xsr_eps3_args[] = {
+  { { OPERAND_art }, 'm' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_xsr_eps3_stateArgs[] = {
+  { { STATE_EPS3 }, 'm' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_rsr_excvaddr_args[] = {
+  { { OPERAND_art }, 'o' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_rsr_excvaddr_stateArgs[] = {
+  { { STATE_EXCVADDR }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_wsr_excvaddr_args[] = {
+  { { OPERAND_art }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_wsr_excvaddr_stateArgs[] = {
+  { { STATE_EXCVADDR }, 'o' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_xsr_excvaddr_args[] = {
+  { { OPERAND_art }, 'm' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_xsr_excvaddr_stateArgs[] = {
+  { { STATE_EXCVADDR }, 'm' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_rsr_depc_args[] = {
+  { { OPERAND_art }, 'o' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_rsr_depc_stateArgs[] = {
+  { { STATE_DEPC }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_wsr_depc_args[] = {
+  { { OPERAND_art }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_wsr_depc_stateArgs[] = {
+  { { STATE_DEPC }, 'o' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_xsr_depc_args[] = {
+  { { OPERAND_art }, 'm' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_xsr_depc_stateArgs[] = {
+  { { STATE_DEPC }, 'm' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_rsr_exccause_args[] = {
+  { { OPERAND_art }, 'o' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_rsr_exccause_stateArgs[] = {
+  { { STATE_EXCCAUSE }, 'i' },
+  { { STATE_XTSYNC }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_wsr_exccause_args[] = {
+  { { OPERAND_art }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_wsr_exccause_stateArgs[] = {
+  { { STATE_EXCCAUSE }, 'o' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_xsr_exccause_args[] = {
+  { { OPERAND_art }, 'm' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_xsr_exccause_stateArgs[] = {
+  { { STATE_EXCCAUSE }, 'm' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_rsr_prid_args[] = {
+  { { OPERAND_art }, 'o' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_rsr_vecbase_args[] = {
+  { { OPERAND_art }, 'o' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_rsr_vecbase_stateArgs[] = {
+  { { STATE_VECBASE }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_wsr_vecbase_args[] = {
+  { { OPERAND_art }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_wsr_vecbase_stateArgs[] = {
+  { { STATE_VECBASE }, 'o' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_xsr_vecbase_args[] = {
+  { { OPERAND_art }, 'm' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_xsr_vecbase_stateArgs[] = {
+  { { STATE_VECBASE }, 'm' }
+};
+
+static xtensa_arg_internal Iclass_xt_mul16_args[] = {
+  { { OPERAND_arr }, 'o' },
+  { { OPERAND_ars }, 'i' },
+  { { OPERAND_art }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_mul32_args[] = {
+  { { OPERAND_arr }, 'o' },
+  { { OPERAND_ars }, 'i' },
+  { { OPERAND_art }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_rfi_args[] = {
+  { { OPERAND_s }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_rfi_stateArgs[] = {
+  { { STATE_PSUM }, 'o' },
+  { { STATE_PSEXCM }, 'o' },
+  { { STATE_PSINTLEVEL }, 'o' },
+  { { STATE_EPC1 }, 'i' },
+  { { STATE_EPC2 }, 'i' },
+  { { STATE_EPC3 }, 'i' },
+  { { STATE_EPS2 }, 'i' },
+  { { STATE_EPS3 }, 'i' },
+  { { STATE_InOCDMode }, 'm' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_wait_args[] = {
+  { { OPERAND_s }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_wait_stateArgs[] = {
+  { { STATE_PSINTLEVEL }, 'o' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_rsr_interrupt_args[] = {
+  { { OPERAND_art }, 'o' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_rsr_interrupt_stateArgs[] = {
+  { { STATE_INTERRUPT }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_wsr_intset_args[] = {
+  { { OPERAND_art }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_wsr_intset_stateArgs[] = {
+  { { STATE_XTSYNC }, 'o' },
+  { { STATE_INTERRUPT }, 'm' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_wsr_intclear_args[] = {
+  { { OPERAND_art }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_wsr_intclear_stateArgs[] = {
+  { { STATE_XTSYNC }, 'o' },
+  { { STATE_INTERRUPT }, 'm' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_rsr_intenable_args[] = {
+  { { OPERAND_art }, 'o' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_rsr_intenable_stateArgs[] = {
+  { { STATE_INTENABLE }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_wsr_intenable_args[] = {
+  { { OPERAND_art }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_wsr_intenable_stateArgs[] = {
+  { { STATE_INTENABLE }, 'o' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_xsr_intenable_args[] = {
+  { { OPERAND_art }, 'm' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_xsr_intenable_stateArgs[] = {
+  { { STATE_INTENABLE }, 'm' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_break_args[] = {
+  { { OPERAND_imms }, 'i' },
+  { { OPERAND_immt }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_break_stateArgs[] = {
+  { { STATE_PSEXCM }, 'i' },
+  { { STATE_PSINTLEVEL }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_break_n_args[] = {
+  { { OPERAND_imms }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_break_n_stateArgs[] = {
+  { { STATE_PSEXCM }, 'i' },
+  { { STATE_PSINTLEVEL }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_rsr_dbreaka0_args[] = {
+  { { OPERAND_art }, 'o' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_rsr_dbreaka0_stateArgs[] = {
+  { { STATE_DBREAKA0 }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_wsr_dbreaka0_args[] = {
+  { { OPERAND_art }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_wsr_dbreaka0_stateArgs[] = {
+  { { STATE_DBREAKA0 }, 'o' },
+  { { STATE_XTSYNC }, 'o' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_xsr_dbreaka0_args[] = {
+  { { OPERAND_art }, 'm' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_xsr_dbreaka0_stateArgs[] = {
+  { { STATE_DBREAKA0 }, 'm' },
+  { { STATE_XTSYNC }, 'o' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_rsr_dbreakc0_args[] = {
+  { { OPERAND_art }, 'o' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_rsr_dbreakc0_stateArgs[] = {
+  { { STATE_DBREAKC0 }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_wsr_dbreakc0_args[] = {
+  { { OPERAND_art }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_wsr_dbreakc0_stateArgs[] = {
+  { { STATE_DBREAKC0 }, 'o' },
+  { { STATE_XTSYNC }, 'o' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_xsr_dbreakc0_args[] = {
+  { { OPERAND_art }, 'm' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_xsr_dbreakc0_stateArgs[] = {
+  { { STATE_DBREAKC0 }, 'm' },
+  { { STATE_XTSYNC }, 'o' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_rsr_ibreaka0_args[] = {
+  { { OPERAND_art }, 'o' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_rsr_ibreaka0_stateArgs[] = {
+  { { STATE_IBREAKA0 }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_wsr_ibreaka0_args[] = {
+  { { OPERAND_art }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_wsr_ibreaka0_stateArgs[] = {
+  { { STATE_IBREAKA0 }, 'o' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_xsr_ibreaka0_args[] = {
+  { { OPERAND_art }, 'm' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_xsr_ibreaka0_stateArgs[] = {
+  { { STATE_IBREAKA0 }, 'm' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_rsr_ibreakenable_args[] = {
+  { { OPERAND_art }, 'o' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_rsr_ibreakenable_stateArgs[] = {
+  { { STATE_IBREAKENABLE }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_wsr_ibreakenable_args[] = {
+  { { OPERAND_art }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_wsr_ibreakenable_stateArgs[] = {
+  { { STATE_IBREAKENABLE }, 'o' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_xsr_ibreakenable_args[] = {
+  { { OPERAND_art }, 'm' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_xsr_ibreakenable_stateArgs[] = {
+  { { STATE_IBREAKENABLE }, 'm' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_rsr_debugcause_args[] = {
+  { { OPERAND_art }, 'o' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_rsr_debugcause_stateArgs[] = {
+  { { STATE_DEBUGCAUSE }, 'i' },
+  { { STATE_DBNUM }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_wsr_debugcause_args[] = {
+  { { OPERAND_art }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_wsr_debugcause_stateArgs[] = {
+  { { STATE_DEBUGCAUSE }, 'o' },
+  { { STATE_DBNUM }, 'o' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_xsr_debugcause_args[] = {
+  { { OPERAND_art }, 'm' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_xsr_debugcause_stateArgs[] = {
+  { { STATE_DEBUGCAUSE }, 'm' },
+  { { STATE_DBNUM }, 'm' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_rsr_icount_args[] = {
+  { { OPERAND_art }, 'o' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_rsr_icount_stateArgs[] = {
+  { { STATE_ICOUNT }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_wsr_icount_args[] = {
+  { { OPERAND_art }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_wsr_icount_stateArgs[] = {
+  { { STATE_XTSYNC }, 'o' },
+  { { STATE_ICOUNT }, 'o' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_xsr_icount_args[] = {
+  { { OPERAND_art }, 'm' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_xsr_icount_stateArgs[] = {
+  { { STATE_XTSYNC }, 'o' },
+  { { STATE_ICOUNT }, 'm' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_rsr_icountlevel_args[] = {
+  { { OPERAND_art }, 'o' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_rsr_icountlevel_stateArgs[] = {
+  { { STATE_ICOUNTLEVEL }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_wsr_icountlevel_args[] = {
+  { { OPERAND_art }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_wsr_icountlevel_stateArgs[] = {
+  { { STATE_ICOUNTLEVEL }, 'o' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_xsr_icountlevel_args[] = {
+  { { OPERAND_art }, 'm' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_xsr_icountlevel_stateArgs[] = {
+  { { STATE_ICOUNTLEVEL }, 'm' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_rsr_ddr_args[] = {
+  { { OPERAND_art }, 'o' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_rsr_ddr_stateArgs[] = {
+  { { STATE_DDR }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_wsr_ddr_args[] = {
+  { { OPERAND_art }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_wsr_ddr_stateArgs[] = {
+  { { STATE_XTSYNC }, 'o' },
+  { { STATE_DDR }, 'o' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_xsr_ddr_args[] = {
+  { { OPERAND_art }, 'm' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_xsr_ddr_stateArgs[] = {
+  { { STATE_XTSYNC }, 'o' },
+  { { STATE_DDR }, 'm' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_rfdo_args[] = {
+  { { OPERAND_imms }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_rfdo_stateArgs[] = {
+  { { STATE_InOCDMode }, 'm' },
+  { { STATE_EPC2 }, 'i' },
+  { { STATE_PSUM }, 'o' },
+  { { STATE_PSEXCM }, 'o' },
+  { { STATE_PSINTLEVEL }, 'o' },
+  { { STATE_EPS2 }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_rfdd_stateArgs[] = {
+  { { STATE_InOCDMode }, 'm' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_wsr_mmid_args[] = {
+  { { OPERAND_art }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_wsr_mmid_stateArgs[] = {
+  { { STATE_XTSYNC }, 'o' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_rsr_ccount_args[] = {
+  { { OPERAND_art }, 'o' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_rsr_ccount_stateArgs[] = {
+  { { STATE_CCOUNT }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_wsr_ccount_args[] = {
+  { { OPERAND_art }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_wsr_ccount_stateArgs[] = {
+  { { STATE_XTSYNC }, 'o' },
+  { { STATE_CCOUNT }, 'o' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_xsr_ccount_args[] = {
+  { { OPERAND_art }, 'm' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_xsr_ccount_stateArgs[] = {
+  { { STATE_XTSYNC }, 'o' },
+  { { STATE_CCOUNT }, 'm' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_rsr_ccompare0_args[] = {
+  { { OPERAND_art }, 'o' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_rsr_ccompare0_stateArgs[] = {
+  { { STATE_CCOMPARE0 }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_wsr_ccompare0_args[] = {
+  { { OPERAND_art }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_wsr_ccompare0_stateArgs[] = {
+  { { STATE_CCOMPARE0 }, 'o' },
+  { { STATE_INTERRUPT }, 'm' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_xsr_ccompare0_args[] = {
+  { { OPERAND_art }, 'm' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_xsr_ccompare0_stateArgs[] = {
+  { { STATE_CCOMPARE0 }, 'm' },
+  { { STATE_INTERRUPT }, 'm' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_idtlb_args[] = {
+  { { OPERAND_ars }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_idtlb_stateArgs[] = {
+  { { STATE_XTSYNC }, 'o' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_rdtlb_args[] = {
+  { { OPERAND_art }, 'o' },
+  { { OPERAND_ars }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_wdtlb_args[] = {
+  { { OPERAND_art }, 'i' },
+  { { OPERAND_ars }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_wdtlb_stateArgs[] = {
+  { { STATE_XTSYNC }, 'o' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_iitlb_args[] = {
+  { { OPERAND_ars }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_ritlb_args[] = {
+  { { OPERAND_art }, 'o' },
+  { { OPERAND_ars }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_witlb_args[] = {
+  { { OPERAND_art }, 'i' },
+  { { OPERAND_ars }, 'i' }
+};
+
+static xtensa_arg_internal Iclass_xt_iclass_nsa_args[] = {
+  { { OPERAND_art }, 'o' },
+  { { OPERAND_ars }, 'i' }
+};
+
+static xtensa_iclass_internal iclasses[] = {
+  { 0, 0 /* xt_iclass_excw */,
+    0, 0, 0, 0 },
+  { 0, 0 /* xt_iclass_rfe */,
+    2, Iclass_xt_iclass_rfe_stateArgs, 0, 0 },
+  { 0, 0 /* xt_iclass_rfde */,
+    1, Iclass_xt_iclass_rfde_stateArgs, 0, 0 },
+  { 0, 0 /* xt_iclass_syscall */,
+    0, 0, 0, 0 },
+  { 0, 0 /* xt_iclass_simcall */,
+    0, 0, 0, 0 },
+  { 3, Iclass_xt_iclass_add_n_args,
+    0, 0, 0, 0 },
+  { 3, Iclass_xt_iclass_addi_n_args,
+    0, 0, 0, 0 },
+  { 2, Iclass_xt_iclass_bz6_args,
+    0, 0, 0, 0 },
+  { 0, 0 /* xt_iclass_ill_n */,
+    0, 0, 0, 0 },
+  { 3, Iclass_xt_iclass_loadi4_args,
+    0, 0, 0, 0 },
+  { 2, Iclass_xt_iclass_mov_n_args,
+    0, 0, 0, 0 },
+  { 2, Iclass_xt_iclass_movi_n_args,
+    0, 0, 0, 0 },
+  { 0, 0 /* xt_iclass_nopn */,
+    0, 0, 0, 0 },
+  { 1, Iclass_xt_iclass_retn_args,
+    0, 0, 0, 0 },
+  { 3, Iclass_xt_iclass_storei4_args,
+    0, 0, 0, 0 },
+  { 3, Iclass_xt_iclass_addi_args,
+    0, 0, 0, 0 },
+  { 3, Iclass_xt_iclass_addmi_args,
+    0, 0, 0, 0 },
+  { 3, Iclass_xt_iclass_addsub_args,
+    0, 0, 0, 0 },
+  { 3, Iclass_xt_iclass_bit_args,
+    0, 0, 0, 0 },
+  { 3, Iclass_xt_iclass_bsi8_args,
+    0, 0, 0, 0 },
+  { 3, Iclass_xt_iclass_bsi8b_args,
+    0, 0, 0, 0 },
+  { 3, Iclass_xt_iclass_bsi8u_args,
+    0, 0, 0, 0 },
+  { 3, Iclass_xt_iclass_bst8_args,
+    0, 0, 0, 0 },
+  { 2, Iclass_xt_iclass_bsz12_args,
+    0, 0, 0, 0 },
+  { 2, Iclass_xt_iclass_call0_args,
+    0, 0, 0, 0 },
+  { 2, Iclass_xt_iclass_callx0_args,
+    0, 0, 0, 0 },
+  { 4, Iclass_xt_iclass_exti_args,
+    0, 0, 0, 0 },
+  { 0, 0 /* xt_iclass_ill */,
+    0, 0, 0, 0 },
+  { 1, Iclass_xt_iclass_jump_args,
+    0, 0, 0, 0 },
+  { 1, Iclass_xt_iclass_jumpx_args,
+    0, 0, 0, 0 },
+  { 3, Iclass_xt_iclass_l16ui_args,
+    0, 0, 0, 0 },
+  { 3, Iclass_xt_iclass_l16si_args,
+    0, 0, 0, 0 },
+  { 3, Iclass_xt_iclass_l32i_args,
+    0, 0, 0, 0 },
+  { 2, Iclass_xt_iclass_l32r_args,
+    2, Iclass_xt_iclass_l32r_stateArgs, 0, 0 },
+  { 3, Iclass_xt_iclass_l8i_args,
+    0, 0, 0, 0 },
+  { 2, Iclass_xt_iclass_movi_args,
+    0, 0, 0, 0 },
+  { 3, Iclass_xt_iclass_movz_args,
+    0, 0, 0, 0 },
+  { 2, Iclass_xt_iclass_neg_args,
+    0, 0, 0, 0 },
+  { 0, 0 /* xt_iclass_nop */,
+    0, 0, 0, 0 },
+  { 1, Iclass_xt_iclass_return_args,
+    0, 0, 0, 0 },
+  { 3, Iclass_xt_iclass_s16i_args,
+    0, 0, 0, 0 },
+  { 3, Iclass_xt_iclass_s32i_args,
+    0, 0, 0, 0 },
+  { 3, Iclass_xt_iclass_s8i_args,
+    0, 0, 0, 0 },
+  { 1, Iclass_xt_iclass_sar_args,
+    1, Iclass_xt_iclass_sar_stateArgs, 0, 0 },
+  { 1, Iclass_xt_iclass_sari_args,
+    1, Iclass_xt_iclass_sari_stateArgs, 0, 0 },
+  { 2, Iclass_xt_iclass_shifts_args,
+    1, Iclass_xt_iclass_shifts_stateArgs, 0, 0 },
+  { 3, Iclass_xt_iclass_shiftst_args,
+    1, Iclass_xt_iclass_shiftst_stateArgs, 0, 0 },
+  { 2, Iclass_xt_iclass_shiftt_args,
+    1, Iclass_xt_iclass_shiftt_stateArgs, 0, 0 },
+  { 3, Iclass_xt_iclass_slli_args,
+    0, 0, 0, 0 },
+  { 3, Iclass_xt_iclass_srai_args,
+    0, 0, 0, 0 },
+  { 3, Iclass_xt_iclass_srli_args,
+    0, 0, 0, 0 },
+  { 0, 0 /* xt_iclass_memw */,
+    0, 0, 0, 0 },
+  { 0, 0 /* xt_iclass_extw */,
+    0, 0, 0, 0 },
+  { 0, 0 /* xt_iclass_isync */,
+    0, 0, 0, 0 },
+  { 0, 0 /* xt_iclass_sync */,
+    1, Iclass_xt_iclass_sync_stateArgs, 0, 0 },
+  { 2, Iclass_xt_iclass_rsil_args,
+    3, Iclass_xt_iclass_rsil_stateArgs, 0, 0 },
+  { 1, Iclass_xt_iclass_rsr_sar_args,
+    1, Iclass_xt_iclass_rsr_sar_stateArgs, 0, 0 },
+  { 1, Iclass_xt_iclass_wsr_sar_args,
+    2, Iclass_xt_iclass_wsr_sar_stateArgs, 0, 0 },
+  { 1, Iclass_xt_iclass_xsr_sar_args,
+    1, Iclass_xt_iclass_xsr_sar_stateArgs, 0, 0 },
+  { 1, Iclass_xt_iclass_rsr_litbase_args,
+    2, Iclass_xt_iclass_rsr_litbase_stateArgs, 0, 0 },
+  { 1, Iclass_xt_iclass_wsr_litbase_args,
+    2, Iclass_xt_iclass_wsr_litbase_stateArgs, 0, 0 },
+  { 1, Iclass_xt_iclass_xsr_litbase_args,
+    2, Iclass_xt_iclass_xsr_litbase_stateArgs, 0, 0 },
+  { 1, Iclass_xt_iclass_rsr_176_args,
+    0, 0, 0, 0 },
+  { 1, Iclass_xt_iclass_wsr_176_args,
+    0, 0, 0, 0 },
+  { 1, Iclass_xt_iclass_rsr_208_args,
+    0, 0, 0, 0 },
+  { 1, Iclass_xt_iclass_rsr_ps_args,
+    3, Iclass_xt_iclass_rsr_ps_stateArgs, 0, 0 },
+  { 1, Iclass_xt_iclass_wsr_ps_args,
+    3, Iclass_xt_iclass_wsr_ps_stateArgs, 0, 0 },
+  { 1, Iclass_xt_iclass_xsr_ps_args,
+    3, Iclass_xt_iclass_xsr_ps_stateArgs, 0, 0 },
+  { 1, Iclass_xt_iclass_rsr_epc1_args,
+    1, Iclass_xt_iclass_rsr_epc1_stateArgs, 0, 0 },
+  { 1, Iclass_xt_iclass_wsr_epc1_args,
+    1, Iclass_xt_iclass_wsr_epc1_stateArgs, 0, 0 },
+  { 1, Iclass_xt_iclass_xsr_epc1_args,
+    1, Iclass_xt_iclass_xsr_epc1_stateArgs, 0, 0 },
+  { 1, Iclass_xt_iclass_rsr_excsave1_args,
+    1, Iclass_xt_iclass_rsr_excsave1_stateArgs, 0, 0 },
+  { 1, Iclass_xt_iclass_wsr_excsave1_args,
+    1, Iclass_xt_iclass_wsr_excsave1_stateArgs, 0, 0 },
+  { 1, Iclass_xt_iclass_xsr_excsave1_args,
+    1, Iclass_xt_iclass_xsr_excsave1_stateArgs, 0, 0 },
+  { 1, Iclass_xt_iclass_rsr_epc2_args,
+    1, Iclass_xt_iclass_rsr_epc2_stateArgs, 0, 0 },
+  { 1, Iclass_xt_iclass_wsr_epc2_args,
+    1, Iclass_xt_iclass_wsr_epc2_stateArgs, 0, 0 },
+  { 1, Iclass_xt_iclass_xsr_epc2_args,
+    1, Iclass_xt_iclass_xsr_epc2_stateArgs, 0, 0 },
+  { 1, Iclass_xt_iclass_rsr_excsave2_args,
+    1, Iclass_xt_iclass_rsr_excsave2_stateArgs, 0, 0 },
+  { 1, Iclass_xt_iclass_wsr_excsave2_args,
+    1, Iclass_xt_iclass_wsr_excsave2_stateArgs, 0, 0 },
+  { 1, Iclass_xt_iclass_xsr_excsave2_args,
+    1, Iclass_xt_iclass_xsr_excsave2_stateArgs, 0, 0 },
+  { 1, Iclass_xt_iclass_rsr_epc3_args,
+    1, Iclass_xt_iclass_rsr_epc3_stateArgs, 0, 0 },
+  { 1, Iclass_xt_iclass_wsr_epc3_args,
+    1, Iclass_xt_iclass_wsr_epc3_stateArgs, 0, 0 },
+  { 1, Iclass_xt_iclass_xsr_epc3_args,
+    1, Iclass_xt_iclass_xsr_epc3_stateArgs, 0, 0 },
+  { 1, Iclass_xt_iclass_rsr_excsave3_args,
+    1, Iclass_xt_iclass_rsr_excsave3_stateArgs, 0, 0 },
+  { 1, Iclass_xt_iclass_wsr_excsave3_args,
+    1, Iclass_xt_iclass_wsr_excsave3_stateArgs, 0, 0 },
+  { 1, Iclass_xt_iclass_xsr_excsave3_args,
+    1, Iclass_xt_iclass_xsr_excsave3_stateArgs, 0, 0 },
+  { 1, Iclass_xt_iclass_rsr_eps2_args,
+    1, Iclass_xt_iclass_rsr_eps2_stateArgs, 0, 0 },
+  { 1, Iclass_xt_iclass_wsr_eps2_args,
+    1, Iclass_xt_iclass_wsr_eps2_stateArgs, 0, 0 },
+  { 1, Iclass_xt_iclass_xsr_eps2_args,
+    1, Iclass_xt_iclass_xsr_eps2_stateArgs, 0, 0 },
+  { 1, Iclass_xt_iclass_rsr_eps3_args,
+    1, Iclass_xt_iclass_rsr_eps3_stateArgs, 0, 0 },
+  { 1, Iclass_xt_iclass_wsr_eps3_args,
+    1, Iclass_xt_iclass_wsr_eps3_stateArgs, 0, 0 },
+  { 1, Iclass_xt_iclass_xsr_eps3_args,
+    1, Iclass_xt_iclass_xsr_eps3_stateArgs, 0, 0 },
+  { 1, Iclass_xt_iclass_rsr_excvaddr_args,
+    1, Iclass_xt_iclass_rsr_excvaddr_stateArgs, 0, 0 },
+  { 1, Iclass_xt_iclass_wsr_excvaddr_args,
+    1, Iclass_xt_iclass_wsr_excvaddr_stateArgs, 0, 0 },
+  { 1, Iclass_xt_iclass_xsr_excvaddr_args,
+    1, Iclass_xt_iclass_xsr_excvaddr_stateArgs, 0, 0 },
+  { 1, Iclass_xt_iclass_rsr_depc_args,
+    1, Iclass_xt_iclass_rsr_depc_stateArgs, 0, 0 },
+  { 1, Iclass_xt_iclass_wsr_depc_args,
+    1, Iclass_xt_iclass_wsr_depc_stateArgs, 0, 0 },
+  { 1, Iclass_xt_iclass_xsr_depc_args,
+    1, Iclass_xt_iclass_xsr_depc_stateArgs, 0, 0 },
+  { 1, Iclass_xt_iclass_rsr_exccause_args,
+    2, Iclass_xt_iclass_rsr_exccause_stateArgs, 0, 0 },
+  { 1, Iclass_xt_iclass_wsr_exccause_args,
+    1, Iclass_xt_iclass_wsr_exccause_stateArgs, 0, 0 },
+  { 1, Iclass_xt_iclass_xsr_exccause_args,
+    1, Iclass_xt_iclass_xsr_exccause_stateArgs, 0, 0 },
+  { 1, Iclass_xt_iclass_rsr_prid_args,
+    0, 0, 0, 0 },
+  { 1, Iclass_xt_iclass_rsr_vecbase_args,
+    1, Iclass_xt_iclass_rsr_vecbase_stateArgs, 0, 0 },
+  { 1, Iclass_xt_iclass_wsr_vecbase_args,
+    1, Iclass_xt_iclass_wsr_vecbase_stateArgs, 0, 0 },
+  { 1, Iclass_xt_iclass_xsr_vecbase_args,
+    1, Iclass_xt_iclass_xsr_vecbase_stateArgs, 0, 0 },
+  { 3, Iclass_xt_mul16_args,
+    0, 0, 0, 0 },
+  { 3, Iclass_xt_mul32_args,
+    0, 0, 0, 0 },
+  { 1, Iclass_xt_iclass_rfi_args,
+    9, Iclass_xt_iclass_rfi_stateArgs, 0, 0 },
+  { 1, Iclass_xt_iclass_wait_args,
+    1, Iclass_xt_iclass_wait_stateArgs, 0, 0 },
+  { 1, Iclass_xt_iclass_rsr_interrupt_args,
+    1, Iclass_xt_iclass_rsr_interrupt_stateArgs, 0, 0 },
+  { 1, Iclass_xt_iclass_wsr_intset_args,
+    2, Iclass_xt_iclass_wsr_intset_stateArgs, 0, 0 },
+  { 1, Iclass_xt_iclass_wsr_intclear_args,
+    2, Iclass_xt_iclass_wsr_intclear_stateArgs, 0, 0 },
+  { 1, Iclass_xt_iclass_rsr_intenable_args,
+    1, Iclass_xt_iclass_rsr_intenable_stateArgs, 0, 0 },
+  { 1, Iclass_xt_iclass_wsr_intenable_args,
+    1, Iclass_xt_iclass_wsr_intenable_stateArgs, 0, 0 },
+  { 1, Iclass_xt_iclass_xsr_intenable_args,
+    1, Iclass_xt_iclass_xsr_intenable_stateArgs, 0, 0 },
+  { 2, Iclass_xt_iclass_break_args,
+    2, Iclass_xt_iclass_break_stateArgs, 0, 0 },
+  { 1, Iclass_xt_iclass_break_n_args,
+    2, Iclass_xt_iclass_break_n_stateArgs, 0, 0 },
+  { 1, Iclass_xt_iclass_rsr_dbreaka0_args,
+    1, Iclass_xt_iclass_rsr_dbreaka0_stateArgs, 0, 0 },
+  { 1, Iclass_xt_iclass_wsr_dbreaka0_args,
+    2, Iclass_xt_iclass_wsr_dbreaka0_stateArgs, 0, 0 },
+  { 1, Iclass_xt_iclass_xsr_dbreaka0_args,
+    2, Iclass_xt_iclass_xsr_dbreaka0_stateArgs, 0, 0 },
+  { 1, Iclass_xt_iclass_rsr_dbreakc0_args,
+    1, Iclass_xt_iclass_rsr_dbreakc0_stateArgs, 0, 0 },
+  { 1, Iclass_xt_iclass_wsr_dbreakc0_args,
+    2, Iclass_xt_iclass_wsr_dbreakc0_stateArgs, 0, 0 },
+  { 1, Iclass_xt_iclass_xsr_dbreakc0_args,
+    2, Iclass_xt_iclass_xsr_dbreakc0_stateArgs, 0, 0 },
+  { 1, Iclass_xt_iclass_rsr_ibreaka0_args,
+    1, Iclass_xt_iclass_rsr_ibreaka0_stateArgs, 0, 0 },
+  { 1, Iclass_xt_iclass_wsr_ibreaka0_args,
+    1, Iclass_xt_iclass_wsr_ibreaka0_stateArgs, 0, 0 },
+  { 1, Iclass_xt_iclass_xsr_ibreaka0_args,
+    1, Iclass_xt_iclass_xsr_ibreaka0_stateArgs, 0, 0 },
+  { 1, Iclass_xt_iclass_rsr_ibreakenable_args,
+    1, Iclass_xt_iclass_rsr_ibreakenable_stateArgs, 0, 0 },
+  { 1, Iclass_xt_iclass_wsr_ibreakenable_args,
+    1, Iclass_xt_iclass_wsr_ibreakenable_stateArgs, 0, 0 },
+  { 1, Iclass_xt_iclass_xsr_ibreakenable_args,
+    1, Iclass_xt_iclass_xsr_ibreakenable_stateArgs, 0, 0 },
+  { 1, Iclass_xt_iclass_rsr_debugcause_args,
+    2, Iclass_xt_iclass_rsr_debugcause_stateArgs, 0, 0 },
+  { 1, Iclass_xt_iclass_wsr_debugcause_args,
+    2, Iclass_xt_iclass_wsr_debugcause_stateArgs, 0, 0 },
+  { 1, Iclass_xt_iclass_xsr_debugcause_args,
+    2, Iclass_xt_iclass_xsr_debugcause_stateArgs, 0, 0 },
+  { 1, Iclass_xt_iclass_rsr_icount_args,
+    1, Iclass_xt_iclass_rsr_icount_stateArgs, 0, 0 },
+  { 1, Iclass_xt_iclass_wsr_icount_args,
+    2, Iclass_xt_iclass_wsr_icount_stateArgs, 0, 0 },
+  { 1, Iclass_xt_iclass_xsr_icount_args,
+    2, Iclass_xt_iclass_xsr_icount_stateArgs, 0, 0 },
+  { 1, Iclass_xt_iclass_rsr_icountlevel_args,
+    1, Iclass_xt_iclass_rsr_icountlevel_stateArgs, 0, 0 },
+  { 1, Iclass_xt_iclass_wsr_icountlevel_args,
+    1, Iclass_xt_iclass_wsr_icountlevel_stateArgs, 0, 0 },
+  { 1, Iclass_xt_iclass_xsr_icountlevel_args,
+    1, Iclass_xt_iclass_xsr_icountlevel_stateArgs, 0, 0 },
+  { 1, Iclass_xt_iclass_rsr_ddr_args,
+    1, Iclass_xt_iclass_rsr_ddr_stateArgs, 0, 0 },
+  { 1, Iclass_xt_iclass_wsr_ddr_args,
+    2, Iclass_xt_iclass_wsr_ddr_stateArgs, 0, 0 },
+  { 1, Iclass_xt_iclass_xsr_ddr_args,
+    2, Iclass_xt_iclass_xsr_ddr_stateArgs, 0, 0 },
+  { 1, Iclass_xt_iclass_rfdo_args,
+    6, Iclass_xt_iclass_rfdo_stateArgs, 0, 0 },
+  { 0, 0 /* xt_iclass_rfdd */,
+    1, Iclass_xt_iclass_rfdd_stateArgs, 0, 0 },
+  { 1, Iclass_xt_iclass_wsr_mmid_args,
+    1, Iclass_xt_iclass_wsr_mmid_stateArgs, 0, 0 },
+  { 1, Iclass_xt_iclass_rsr_ccount_args,
+    1, Iclass_xt_iclass_rsr_ccount_stateArgs, 0, 0 },
+  { 1, Iclass_xt_iclass_wsr_ccount_args,
+    2, Iclass_xt_iclass_wsr_ccount_stateArgs, 0, 0 },
+  { 1, Iclass_xt_iclass_xsr_ccount_args,
+    2, Iclass_xt_iclass_xsr_ccount_stateArgs, 0, 0 },
+  { 1, Iclass_xt_iclass_rsr_ccompare0_args,
+    1, Iclass_xt_iclass_rsr_ccompare0_stateArgs, 0, 0 },
+  { 1, Iclass_xt_iclass_wsr_ccompare0_args,
+    2, Iclass_xt_iclass_wsr_ccompare0_stateArgs, 0, 0 },
+  { 1, Iclass_xt_iclass_xsr_ccompare0_args,
+    2, Iclass_xt_iclass_xsr_ccompare0_stateArgs, 0, 0 },
+  { 1, Iclass_xt_iclass_idtlb_args,
+    1, Iclass_xt_iclass_idtlb_stateArgs, 0, 0 },
+  { 2, Iclass_xt_iclass_rdtlb_args,
+    0, 0, 0, 0 },
+  { 2, Iclass_xt_iclass_wdtlb_args,
+    1, Iclass_xt_iclass_wdtlb_stateArgs, 0, 0 },
+  { 1, Iclass_xt_iclass_iitlb_args,
+    0, 0, 0, 0 },
+  { 2, Iclass_xt_iclass_ritlb_args,
+    0, 0, 0, 0 },
+  { 2, Iclass_xt_iclass_witlb_args,
+    0, 0, 0, 0 },
+  { 2, Iclass_xt_iclass_nsa_args,
+    0, 0, 0, 0 },
+  { 0, 0 /* xt_iclass_rer */,
+    0, 0, 0, 0 },
+  { 0, 0 /* xt_iclass_wer */,
+    0, 0, 0, 0 }
+};
+
+enum xtensa_iclass_id {
+  ICLASS_xt_iclass_excw,
+  ICLASS_xt_iclass_rfe,
+  ICLASS_xt_iclass_rfde,
+  ICLASS_xt_iclass_syscall,
+  ICLASS_xt_iclass_simcall,
+  ICLASS_xt_iclass_add_n,
+  ICLASS_xt_iclass_addi_n,
+  ICLASS_xt_iclass_bz6,
+  ICLASS_xt_iclass_ill_n,
+  ICLASS_xt_iclass_loadi4,
+  ICLASS_xt_iclass_mov_n,
+  ICLASS_xt_iclass_movi_n,
+  ICLASS_xt_iclass_nopn,
+  ICLASS_xt_iclass_retn,
+  ICLASS_xt_iclass_storei4,
+  ICLASS_xt_iclass_addi,
+  ICLASS_xt_iclass_addmi,
+  ICLASS_xt_iclass_addsub,
+  ICLASS_xt_iclass_bit,
+  ICLASS_xt_iclass_bsi8,
+  ICLASS_xt_iclass_bsi8b,
+  ICLASS_xt_iclass_bsi8u,
+  ICLASS_xt_iclass_bst8,
+  ICLASS_xt_iclass_bsz12,
+  ICLASS_xt_iclass_call0,
+  ICLASS_xt_iclass_callx0,
+  ICLASS_xt_iclass_exti,
+  ICLASS_xt_iclass_ill,
+  ICLASS_xt_iclass_jump,
+  ICLASS_xt_iclass_jumpx,
+  ICLASS_xt_iclass_l16ui,
+  ICLASS_xt_iclass_l16si,
+  ICLASS_xt_iclass_l32i,
+  ICLASS_xt_iclass_l32r,
+  ICLASS_xt_iclass_l8i,
+  ICLASS_xt_iclass_movi,
+  ICLASS_xt_iclass_movz,
+  ICLASS_xt_iclass_neg,
+  ICLASS_xt_iclass_nop,
+  ICLASS_xt_iclass_return,
+  ICLASS_xt_iclass_s16i,
+  ICLASS_xt_iclass_s32i,
+  ICLASS_xt_iclass_s8i,
+  ICLASS_xt_iclass_sar,
+  ICLASS_xt_iclass_sari,
+  ICLASS_xt_iclass_shifts,
+  ICLASS_xt_iclass_shiftst,
+  ICLASS_xt_iclass_shiftt,
+  ICLASS_xt_iclass_slli,
+  ICLASS_xt_iclass_srai,
+  ICLASS_xt_iclass_srli,
+  ICLASS_xt_iclass_memw,
+  ICLASS_xt_iclass_extw,
+  ICLASS_xt_iclass_isync,
+  ICLASS_xt_iclass_sync,
+  ICLASS_xt_iclass_rsil,
+  ICLASS_xt_iclass_rsr_sar,
+  ICLASS_xt_iclass_wsr_sar,
+  ICLASS_xt_iclass_xsr_sar,
+  ICLASS_xt_iclass_rsr_litbase,
+  ICLASS_xt_iclass_wsr_litbase,
+  ICLASS_xt_iclass_xsr_litbase,
+  ICLASS_xt_iclass_rsr_176,
+  ICLASS_xt_iclass_wsr_176,
+  ICLASS_xt_iclass_rsr_208,
+  ICLASS_xt_iclass_rsr_ps,
+  ICLASS_xt_iclass_wsr_ps,
+  ICLASS_xt_iclass_xsr_ps,
+  ICLASS_xt_iclass_rsr_epc1,
+  ICLASS_xt_iclass_wsr_epc1,
+  ICLASS_xt_iclass_xsr_epc1,
+  ICLASS_xt_iclass_rsr_excsave1,
+  ICLASS_xt_iclass_wsr_excsave1,
+  ICLASS_xt_iclass_xsr_excsave1,
+  ICLASS_xt_iclass_rsr_epc2,
+  ICLASS_xt_iclass_wsr_epc2,
+  ICLASS_xt_iclass_xsr_epc2,
+  ICLASS_xt_iclass_rsr_excsave2,
+  ICLASS_xt_iclass_wsr_excsave2,
+  ICLASS_xt_iclass_xsr_excsave2,
+  ICLASS_xt_iclass_rsr_epc3,
+  ICLASS_xt_iclass_wsr_epc3,
+  ICLASS_xt_iclass_xsr_epc3,
+  ICLASS_xt_iclass_rsr_excsave3,
+  ICLASS_xt_iclass_wsr_excsave3,
+  ICLASS_xt_iclass_xsr_excsave3,
+  ICLASS_xt_iclass_rsr_eps2,
+  ICLASS_xt_iclass_wsr_eps2,
+  ICLASS_xt_iclass_xsr_eps2,
+  ICLASS_xt_iclass_rsr_eps3,
+  ICLASS_xt_iclass_wsr_eps3,
+  ICLASS_xt_iclass_xsr_eps3,
+  ICLASS_xt_iclass_rsr_excvaddr,
+  ICLASS_xt_iclass_wsr_excvaddr,
+  ICLASS_xt_iclass_xsr_excvaddr,
+  ICLASS_xt_iclass_rsr_depc,
+  ICLASS_xt_iclass_wsr_depc,
+  ICLASS_xt_iclass_xsr_depc,
+  ICLASS_xt_iclass_rsr_exccause,
+  ICLASS_xt_iclass_wsr_exccause,
+  ICLASS_xt_iclass_xsr_exccause,
+  ICLASS_xt_iclass_rsr_prid,
+  ICLASS_xt_iclass_rsr_vecbase,
+  ICLASS_xt_iclass_wsr_vecbase,
+  ICLASS_xt_iclass_xsr_vecbase,
+  ICLASS_xt_mul16,
+  ICLASS_xt_mul32,
+  ICLASS_xt_iclass_rfi,
+  ICLASS_xt_iclass_wait,
+  ICLASS_xt_iclass_rsr_interrupt,
+  ICLASS_xt_iclass_wsr_intset,
+  ICLASS_xt_iclass_wsr_intclear,
+  ICLASS_xt_iclass_rsr_intenable,
+  ICLASS_xt_iclass_wsr_intenable,
+  ICLASS_xt_iclass_xsr_intenable,
+  ICLASS_xt_iclass_break,
+  ICLASS_xt_iclass_break_n,
+  ICLASS_xt_iclass_rsr_dbreaka0,
+  ICLASS_xt_iclass_wsr_dbreaka0,
+  ICLASS_xt_iclass_xsr_dbreaka0,
+  ICLASS_xt_iclass_rsr_dbreakc0,
+  ICLASS_xt_iclass_wsr_dbreakc0,
+  ICLASS_xt_iclass_xsr_dbreakc0,
+  ICLASS_xt_iclass_rsr_ibreaka0,
+  ICLASS_xt_iclass_wsr_ibreaka0,
+  ICLASS_xt_iclass_xsr_ibreaka0,
+  ICLASS_xt_iclass_rsr_ibreakenable,
+  ICLASS_xt_iclass_wsr_ibreakenable,
+  ICLASS_xt_iclass_xsr_ibreakenable,
+  ICLASS_xt_iclass_rsr_debugcause,
+  ICLASS_xt_iclass_wsr_debugcause,
+  ICLASS_xt_iclass_xsr_debugcause,
+  ICLASS_xt_iclass_rsr_icount,
+  ICLASS_xt_iclass_wsr_icount,
+  ICLASS_xt_iclass_xsr_icount,
+  ICLASS_xt_iclass_rsr_icountlevel,
+  ICLASS_xt_iclass_wsr_icountlevel,
+  ICLASS_xt_iclass_xsr_icountlevel,
+  ICLASS_xt_iclass_rsr_ddr,
+  ICLASS_xt_iclass_wsr_ddr,
+  ICLASS_xt_iclass_xsr_ddr,
+  ICLASS_xt_iclass_rfdo,
+  ICLASS_xt_iclass_rfdd,
+  ICLASS_xt_iclass_wsr_mmid,
+  ICLASS_xt_iclass_rsr_ccount,
+  ICLASS_xt_iclass_wsr_ccount,
+  ICLASS_xt_iclass_xsr_ccount,
+  ICLASS_xt_iclass_rsr_ccompare0,
+  ICLASS_xt_iclass_wsr_ccompare0,
+  ICLASS_xt_iclass_xsr_ccompare0,
+  ICLASS_xt_iclass_idtlb,
+  ICLASS_xt_iclass_rdtlb,
+  ICLASS_xt_iclass_wdtlb,
+  ICLASS_xt_iclass_iitlb,
+  ICLASS_xt_iclass_ritlb,
+  ICLASS_xt_iclass_witlb,
+  ICLASS_xt_iclass_nsa,
+  ICLASS_xt_iclass_rer,
+  ICLASS_xt_iclass_wer
+};
+
+
+/*  Opcode encodings.  */
+
+static void
+Opcode_excw_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x2080;
+}
+
+static void
+Opcode_rfe_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x3000;
+}
+
+static void
+Opcode_rfde_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x3200;
+}
+
+static void
+Opcode_syscall_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x5000;
+}
+
+static void
+Opcode_simcall_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x5100;
+}
+
+static void
+Opcode_add_n_Slot_inst16a_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0xa;
+}
+
+static void
+Opcode_addi_n_Slot_inst16a_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0xb;
+}
+
+static void
+Opcode_beqz_n_Slot_inst16b_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x8c;
+}
+
+static void
+Opcode_bnez_n_Slot_inst16b_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0xcc;
+}
+
+static void
+Opcode_ill_n_Slot_inst16b_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0xf06d;
+}
+
+static void
+Opcode_l32i_n_Slot_inst16a_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x8;
+}
+
+static void
+Opcode_mov_n_Slot_inst16b_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0xd;
+}
+
+static void
+Opcode_movi_n_Slot_inst16b_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0xc;
+}
+
+static void
+Opcode_nop_n_Slot_inst16b_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0xf03d;
+}
+
+static void
+Opcode_ret_n_Slot_inst16b_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0xf00d;
+}
+
+static void
+Opcode_s32i_n_Slot_inst16a_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x9;
+}
+
+static void
+Opcode_addi_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0xc002;
+}
+
+static void
+Opcode_addmi_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0xd002;
+}
+
+static void
+Opcode_add_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x800000;
+}
+
+static void
+Opcode_sub_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0xc00000;
+}
+
+static void
+Opcode_addx2_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x900000;
+}
+
+static void
+Opcode_addx4_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0xa00000;
+}
+
+static void
+Opcode_addx8_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0xb00000;
+}
+
+static void
+Opcode_subx2_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0xd00000;
+}
+
+static void
+Opcode_subx4_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0xe00000;
+}
+
+static void
+Opcode_subx8_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0xf00000;
+}
+
+static void
+Opcode_and_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x100000;
+}
+
+static void
+Opcode_or_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x200000;
+}
+
+static void
+Opcode_xor_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x300000;
+}
+
+static void
+Opcode_beqi_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x26;
+}
+
+static void
+Opcode_bnei_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x66;
+}
+
+static void
+Opcode_bgei_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0xe6;
+}
+
+static void
+Opcode_blti_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0xa6;
+}
+
+static void
+Opcode_bbci_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x6007;
+}
+
+static void
+Opcode_bbsi_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0xe007;
+}
+
+static void
+Opcode_bgeui_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0xf6;
+}
+
+static void
+Opcode_bltui_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0xb6;
+}
+
+static void
+Opcode_beq_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x1007;
+}
+
+static void
+Opcode_bne_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x9007;
+}
+
+static void
+Opcode_bge_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0xa007;
+}
+
+static void
+Opcode_blt_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x2007;
+}
+
+static void
+Opcode_bgeu_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0xb007;
+}
+
+static void
+Opcode_bltu_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x3007;
+}
+
+static void
+Opcode_bany_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x8007;
+}
+
+static void
+Opcode_bnone_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x7;
+}
+
+static void
+Opcode_ball_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x4007;
+}
+
+static void
+Opcode_bnall_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0xc007;
+}
+
+static void
+Opcode_bbc_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x5007;
+}
+
+static void
+Opcode_bbs_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0xd007;
+}
+
+static void
+Opcode_beqz_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x16;
+}
+
+static void
+Opcode_bnez_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x56;
+}
+
+static void
+Opcode_bgez_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0xd6;
+}
+
+static void
+Opcode_bltz_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x96;
+}
+
+static void
+Opcode_call0_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x5;
+}
+
+static void
+Opcode_callx0_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0xc0;
+}
+
+static void
+Opcode_extui_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x40000;
+}
+
+static void
+Opcode_ill_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0;
+}
+
+static void
+Opcode_j_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x6;
+}
+
+static void
+Opcode_jx_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0xa0;
+}
+
+static void
+Opcode_l16ui_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x1002;
+}
+
+static void
+Opcode_l16si_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x9002;
+}
+
+static void
+Opcode_l32i_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x2002;
+}
+
+static void
+Opcode_l32r_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x1;
+}
+
+static void
+Opcode_l8ui_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x2;
+}
+
+static void
+Opcode_movi_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0xa002;
+}
+
+static void
+Opcode_moveqz_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x830000;
+}
+
+static void
+Opcode_movnez_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x930000;
+}
+
+static void
+Opcode_movltz_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0xa30000;
+}
+
+static void
+Opcode_movgez_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0xb30000;
+}
+
+static void
+Opcode_neg_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x600000;
+}
+
+static void
+Opcode_abs_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x600100;
+}
+
+static void
+Opcode_nop_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x20f0;
+}
+
+static void
+Opcode_ret_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x80;
+}
+
+static void
+Opcode_s16i_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x5002;
+}
+
+static void
+Opcode_s32i_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x6002;
+}
+
+static void
+Opcode_s8i_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x4002;
+}
+
+static void
+Opcode_ssr_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x400000;
+}
+
+static void
+Opcode_ssl_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x401000;
+}
+
+static void
+Opcode_ssa8l_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x402000;
+}
+
+static void
+Opcode_ssa8b_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x403000;
+}
+
+static void
+Opcode_ssai_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x404000;
+}
+
+static void
+Opcode_sll_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0xa10000;
+}
+
+static void
+Opcode_src_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x810000;
+}
+
+static void
+Opcode_srl_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x910000;
+}
+
+static void
+Opcode_sra_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0xb10000;
+}
+
+static void
+Opcode_slli_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x10000;
+}
+
+static void
+Opcode_srai_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x210000;
+}
+
+static void
+Opcode_srli_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x410000;
+}
+
+static void
+Opcode_memw_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x20c0;
+}
+
+static void
+Opcode_extw_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x20d0;
+}
+
+static void
+Opcode_isync_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x2000;
+}
+
+static void
+Opcode_rsync_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x2010;
+}
+
+static void
+Opcode_esync_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x2020;
+}
+
+static void
+Opcode_dsync_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x2030;
+}
+
+static void
+Opcode_rsil_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x6000;
+}
+
+static void
+Opcode_rsr_sar_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x30300;
+}
+
+static void
+Opcode_wsr_sar_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x130300;
+}
+
+static void
+Opcode_xsr_sar_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x610300;
+}
+
+static void
+Opcode_rsr_litbase_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x30500;
+}
+
+static void
+Opcode_wsr_litbase_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x130500;
+}
+
+static void
+Opcode_xsr_litbase_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x610500;
+}
+
+static void
+Opcode_rsr_176_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x3b000;
+}
+
+static void
+Opcode_wsr_176_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x13b000;
+}
+
+static void
+Opcode_rsr_208_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x3d000;
+}
+
+static void
+Opcode_rsr_ps_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x3e600;
+}
+
+static void
+Opcode_wsr_ps_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x13e600;
+}
+
+static void
+Opcode_xsr_ps_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x61e600;
+}
+
+static void
+Opcode_rsr_epc1_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x3b100;
+}
+
+static void
+Opcode_wsr_epc1_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x13b100;
+}
+
+static void
+Opcode_xsr_epc1_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x61b100;
+}
+
+static void
+Opcode_rsr_excsave1_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x3d100;
+}
+
+static void
+Opcode_wsr_excsave1_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x13d100;
+}
+
+static void
+Opcode_xsr_excsave1_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x61d100;
+}
+
+static void
+Opcode_rsr_epc2_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x3b200;
+}
+
+static void
+Opcode_wsr_epc2_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x13b200;
+}
+
+static void
+Opcode_xsr_epc2_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x61b200;
+}
+
+static void
+Opcode_rsr_excsave2_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x3d200;
+}
+
+static void
+Opcode_wsr_excsave2_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x13d200;
+}
+
+static void
+Opcode_xsr_excsave2_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x61d200;
+}
+
+static void
+Opcode_rsr_epc3_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x3b300;
+}
+
+static void
+Opcode_wsr_epc3_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x13b300;
+}
+
+static void
+Opcode_xsr_epc3_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x61b300;
+}
+
+static void
+Opcode_rsr_excsave3_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x3d300;
+}
+
+static void
+Opcode_wsr_excsave3_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x13d300;
+}
+
+static void
+Opcode_xsr_excsave3_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x61d300;
+}
+
+static void
+Opcode_rsr_eps2_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x3c200;
+}
+
+static void
+Opcode_wsr_eps2_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x13c200;
+}
+
+static void
+Opcode_xsr_eps2_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x61c200;
+}
+
+static void
+Opcode_rsr_eps3_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x3c300;
+}
+
+static void
+Opcode_wsr_eps3_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x13c300;
+}
+
+static void
+Opcode_xsr_eps3_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x61c300;
+}
+
+static void
+Opcode_rsr_excvaddr_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x3ee00;
+}
+
+static void
+Opcode_wsr_excvaddr_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x13ee00;
+}
+
+static void
+Opcode_xsr_excvaddr_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x61ee00;
+}
+
+static void
+Opcode_rsr_depc_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x3c000;
+}
+
+static void
+Opcode_wsr_depc_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x13c000;
+}
+
+static void
+Opcode_xsr_depc_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x61c000;
+}
+
+static void
+Opcode_rsr_exccause_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x3e800;
+}
+
+static void
+Opcode_wsr_exccause_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x13e800;
+}
+
+static void
+Opcode_xsr_exccause_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x61e800;
+}
+
+static void
+Opcode_rsr_prid_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x3eb00;
+}
+
+static void
+Opcode_rsr_vecbase_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x3e700;
+}
+
+static void
+Opcode_wsr_vecbase_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x13e700;
+}
+
+static void
+Opcode_xsr_vecbase_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x61e700;
+}
+
+static void
+Opcode_mul16u_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0xc10000;
+}
+
+static void
+Opcode_mul16s_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0xd10000;
+}
+
+static void
+Opcode_mull_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x820000;
+}
+
+static void
+Opcode_rfi_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x3010;
+}
+
+static void
+Opcode_waiti_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x7000;
+}
+
+static void
+Opcode_rsr_interrupt_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x3e200;
+}
+
+static void
+Opcode_wsr_intset_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x13e200;
+}
+
+static void
+Opcode_wsr_intclear_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x13e300;
+}
+
+static void
+Opcode_rsr_intenable_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x3e400;
+}
+
+static void
+Opcode_wsr_intenable_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x13e400;
+}
+
+static void
+Opcode_xsr_intenable_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x61e400;
+}
+
+static void
+Opcode_break_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x4000;
+}
+
+static void
+Opcode_break_n_Slot_inst16b_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0xf02d;
+}
+
+static void
+Opcode_rsr_dbreaka0_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x39000;
+}
+
+static void
+Opcode_wsr_dbreaka0_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x139000;
+}
+
+static void
+Opcode_xsr_dbreaka0_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x619000;
+}
+
+static void
+Opcode_rsr_dbreakc0_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x3a000;
+}
+
+static void
+Opcode_wsr_dbreakc0_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x13a000;
+}
+
+static void
+Opcode_xsr_dbreakc0_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x61a000;
+}
+
+static void
+Opcode_rsr_ibreaka0_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x38000;
+}
+
+static void
+Opcode_wsr_ibreaka0_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x138000;
+}
+
+static void
+Opcode_xsr_ibreaka0_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x618000;
+}
+
+static void
+Opcode_rsr_ibreakenable_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x36000;
+}
+
+static void
+Opcode_wsr_ibreakenable_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x136000;
+}
+
+static void
+Opcode_xsr_ibreakenable_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x616000;
+}
+
+static void
+Opcode_rsr_debugcause_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x3e900;
+}
+
+static void
+Opcode_wsr_debugcause_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x13e900;
+}
+
+static void
+Opcode_xsr_debugcause_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x61e900;
+}
+
+static void
+Opcode_rsr_icount_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x3ec00;
+}
+
+static void
+Opcode_wsr_icount_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x13ec00;
+}
+
+static void
+Opcode_xsr_icount_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x61ec00;
+}
+
+static void
+Opcode_rsr_icountlevel_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x3ed00;
+}
+
+static void
+Opcode_wsr_icountlevel_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x13ed00;
+}
+
+static void
+Opcode_xsr_icountlevel_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x61ed00;
+}
+
+static void
+Opcode_rsr_ddr_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x36800;
+}
+
+static void
+Opcode_wsr_ddr_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x136800;
+}
+
+static void
+Opcode_xsr_ddr_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x616800;
+}
+
+static void
+Opcode_rfdo_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0xf1e000;
+}
+
+static void
+Opcode_rfdd_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0xf1e010;
+}
+
+static void
+Opcode_wsr_mmid_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x135900;
+}
+
+static void
+Opcode_rsr_ccount_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x3ea00;
+}
+
+static void
+Opcode_wsr_ccount_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x13ea00;
+}
+
+static void
+Opcode_xsr_ccount_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x61ea00;
+}
+
+static void
+Opcode_rsr_ccompare0_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x3f000;
+}
+
+static void
+Opcode_wsr_ccompare0_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x13f000;
+}
+
+static void
+Opcode_xsr_ccompare0_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x61f000;
+}
+
+static void
+Opcode_idtlb_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x50c000;
+}
+
+static void
+Opcode_pdtlb_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x50d000;
+}
+
+static void
+Opcode_rdtlb0_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x50b000;
+}
+
+static void
+Opcode_rdtlb1_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x50f000;
+}
+
+static void
+Opcode_wdtlb_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x50e000;
+}
+
+static void
+Opcode_iitlb_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x504000;
+}
+
+static void
+Opcode_pitlb_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x505000;
+}
+
+static void
+Opcode_ritlb0_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x503000;
+}
+
+static void
+Opcode_ritlb1_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x507000;
+}
+
+static void
+Opcode_witlb_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x506000;
+}
+
+static void
+Opcode_nsa_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x40e000;
+}
+
+static void
+Opcode_nsau_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x40f000;
+}
+
+static void
+Opcode_rer_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x406000;
+}
+
+static void
+Opcode_wer_Slot_inst_encode (xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = 0x407000;
+}
+
+static xtensa_opcode_encode_fn Opcode_excw_encode_fns[] = {
+  Opcode_excw_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_rfe_encode_fns[] = {
+  Opcode_rfe_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_rfde_encode_fns[] = {
+  Opcode_rfde_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_syscall_encode_fns[] = {
+  Opcode_syscall_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_simcall_encode_fns[] = {
+  Opcode_simcall_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_add_n_encode_fns[] = {
+  0, Opcode_add_n_Slot_inst16a_encode, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_addi_n_encode_fns[] = {
+  0, Opcode_addi_n_Slot_inst16a_encode, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_beqz_n_encode_fns[] = {
+  0, 0, Opcode_beqz_n_Slot_inst16b_encode
+};
+
+static xtensa_opcode_encode_fn Opcode_bnez_n_encode_fns[] = {
+  0, 0, Opcode_bnez_n_Slot_inst16b_encode
+};
+
+static xtensa_opcode_encode_fn Opcode_ill_n_encode_fns[] = {
+  0, 0, Opcode_ill_n_Slot_inst16b_encode
+};
+
+static xtensa_opcode_encode_fn Opcode_l32i_n_encode_fns[] = {
+  0, Opcode_l32i_n_Slot_inst16a_encode, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_mov_n_encode_fns[] = {
+  0, 0, Opcode_mov_n_Slot_inst16b_encode
+};
+
+static xtensa_opcode_encode_fn Opcode_movi_n_encode_fns[] = {
+  0, 0, Opcode_movi_n_Slot_inst16b_encode
+};
+
+static xtensa_opcode_encode_fn Opcode_nop_n_encode_fns[] = {
+  0, 0, Opcode_nop_n_Slot_inst16b_encode
+};
+
+static xtensa_opcode_encode_fn Opcode_ret_n_encode_fns[] = {
+  0, 0, Opcode_ret_n_Slot_inst16b_encode
+};
+
+static xtensa_opcode_encode_fn Opcode_s32i_n_encode_fns[] = {
+  0, Opcode_s32i_n_Slot_inst16a_encode, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_addi_encode_fns[] = {
+  Opcode_addi_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_addmi_encode_fns[] = {
+  Opcode_addmi_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_add_encode_fns[] = {
+  Opcode_add_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_sub_encode_fns[] = {
+  Opcode_sub_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_addx2_encode_fns[] = {
+  Opcode_addx2_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_addx4_encode_fns[] = {
+  Opcode_addx4_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_addx8_encode_fns[] = {
+  Opcode_addx8_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_subx2_encode_fns[] = {
+  Opcode_subx2_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_subx4_encode_fns[] = {
+  Opcode_subx4_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_subx8_encode_fns[] = {
+  Opcode_subx8_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_and_encode_fns[] = {
+  Opcode_and_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_or_encode_fns[] = {
+  Opcode_or_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_xor_encode_fns[] = {
+  Opcode_xor_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_beqi_encode_fns[] = {
+  Opcode_beqi_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_bnei_encode_fns[] = {
+  Opcode_bnei_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_bgei_encode_fns[] = {
+  Opcode_bgei_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_blti_encode_fns[] = {
+  Opcode_blti_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_bbci_encode_fns[] = {
+  Opcode_bbci_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_bbsi_encode_fns[] = {
+  Opcode_bbsi_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_bgeui_encode_fns[] = {
+  Opcode_bgeui_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_bltui_encode_fns[] = {
+  Opcode_bltui_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_beq_encode_fns[] = {
+  Opcode_beq_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_bne_encode_fns[] = {
+  Opcode_bne_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_bge_encode_fns[] = {
+  Opcode_bge_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_blt_encode_fns[] = {
+  Opcode_blt_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_bgeu_encode_fns[] = {
+  Opcode_bgeu_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_bltu_encode_fns[] = {
+  Opcode_bltu_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_bany_encode_fns[] = {
+  Opcode_bany_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_bnone_encode_fns[] = {
+  Opcode_bnone_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_ball_encode_fns[] = {
+  Opcode_ball_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_bnall_encode_fns[] = {
+  Opcode_bnall_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_bbc_encode_fns[] = {
+  Opcode_bbc_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_bbs_encode_fns[] = {
+  Opcode_bbs_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_beqz_encode_fns[] = {
+  Opcode_beqz_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_bnez_encode_fns[] = {
+  Opcode_bnez_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_bgez_encode_fns[] = {
+  Opcode_bgez_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_bltz_encode_fns[] = {
+  Opcode_bltz_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_call0_encode_fns[] = {
+  Opcode_call0_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_callx0_encode_fns[] = {
+  Opcode_callx0_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_extui_encode_fns[] = {
+  Opcode_extui_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_ill_encode_fns[] = {
+  Opcode_ill_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_j_encode_fns[] = {
+  Opcode_j_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_jx_encode_fns[] = {
+  Opcode_jx_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_l16ui_encode_fns[] = {
+  Opcode_l16ui_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_l16si_encode_fns[] = {
+  Opcode_l16si_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_l32i_encode_fns[] = {
+  Opcode_l32i_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_l32r_encode_fns[] = {
+  Opcode_l32r_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_l8ui_encode_fns[] = {
+  Opcode_l8ui_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_movi_encode_fns[] = {
+  Opcode_movi_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_moveqz_encode_fns[] = {
+  Opcode_moveqz_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_movnez_encode_fns[] = {
+  Opcode_movnez_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_movltz_encode_fns[] = {
+  Opcode_movltz_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_movgez_encode_fns[] = {
+  Opcode_movgez_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_neg_encode_fns[] = {
+  Opcode_neg_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_abs_encode_fns[] = {
+  Opcode_abs_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_nop_encode_fns[] = {
+  Opcode_nop_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_ret_encode_fns[] = {
+  Opcode_ret_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_s16i_encode_fns[] = {
+  Opcode_s16i_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_s32i_encode_fns[] = {
+  Opcode_s32i_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_s8i_encode_fns[] = {
+  Opcode_s8i_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_ssr_encode_fns[] = {
+  Opcode_ssr_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_ssl_encode_fns[] = {
+  Opcode_ssl_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_ssa8l_encode_fns[] = {
+  Opcode_ssa8l_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_ssa8b_encode_fns[] = {
+  Opcode_ssa8b_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_ssai_encode_fns[] = {
+  Opcode_ssai_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_sll_encode_fns[] = {
+  Opcode_sll_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_src_encode_fns[] = {
+  Opcode_src_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_srl_encode_fns[] = {
+  Opcode_srl_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_sra_encode_fns[] = {
+  Opcode_sra_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_slli_encode_fns[] = {
+  Opcode_slli_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_srai_encode_fns[] = {
+  Opcode_srai_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_srli_encode_fns[] = {
+  Opcode_srli_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_memw_encode_fns[] = {
+  Opcode_memw_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_extw_encode_fns[] = {
+  Opcode_extw_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_isync_encode_fns[] = {
+  Opcode_isync_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_rsync_encode_fns[] = {
+  Opcode_rsync_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_esync_encode_fns[] = {
+  Opcode_esync_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_dsync_encode_fns[] = {
+  Opcode_dsync_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_rsil_encode_fns[] = {
+  Opcode_rsil_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_rsr_sar_encode_fns[] = {
+  Opcode_rsr_sar_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_wsr_sar_encode_fns[] = {
+  Opcode_wsr_sar_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_xsr_sar_encode_fns[] = {
+  Opcode_xsr_sar_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_rsr_litbase_encode_fns[] = {
+  Opcode_rsr_litbase_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_wsr_litbase_encode_fns[] = {
+  Opcode_wsr_litbase_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_xsr_litbase_encode_fns[] = {
+  Opcode_xsr_litbase_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_rsr_176_encode_fns[] = {
+  Opcode_rsr_176_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_wsr_176_encode_fns[] = {
+  Opcode_wsr_176_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_rsr_208_encode_fns[] = {
+  Opcode_rsr_208_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_rsr_ps_encode_fns[] = {
+  Opcode_rsr_ps_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_wsr_ps_encode_fns[] = {
+  Opcode_wsr_ps_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_xsr_ps_encode_fns[] = {
+  Opcode_xsr_ps_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_rsr_epc1_encode_fns[] = {
+  Opcode_rsr_epc1_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_wsr_epc1_encode_fns[] = {
+  Opcode_wsr_epc1_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_xsr_epc1_encode_fns[] = {
+  Opcode_xsr_epc1_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_rsr_excsave1_encode_fns[] = {
+  Opcode_rsr_excsave1_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_wsr_excsave1_encode_fns[] = {
+  Opcode_wsr_excsave1_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_xsr_excsave1_encode_fns[] = {
+  Opcode_xsr_excsave1_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_rsr_epc2_encode_fns[] = {
+  Opcode_rsr_epc2_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_wsr_epc2_encode_fns[] = {
+  Opcode_wsr_epc2_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_xsr_epc2_encode_fns[] = {
+  Opcode_xsr_epc2_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_rsr_excsave2_encode_fns[] = {
+  Opcode_rsr_excsave2_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_wsr_excsave2_encode_fns[] = {
+  Opcode_wsr_excsave2_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_xsr_excsave2_encode_fns[] = {
+  Opcode_xsr_excsave2_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_rsr_epc3_encode_fns[] = {
+  Opcode_rsr_epc3_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_wsr_epc3_encode_fns[] = {
+  Opcode_wsr_epc3_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_xsr_epc3_encode_fns[] = {
+  Opcode_xsr_epc3_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_rsr_excsave3_encode_fns[] = {
+  Opcode_rsr_excsave3_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_wsr_excsave3_encode_fns[] = {
+  Opcode_wsr_excsave3_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_xsr_excsave3_encode_fns[] = {
+  Opcode_xsr_excsave3_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_rsr_eps2_encode_fns[] = {
+  Opcode_rsr_eps2_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_wsr_eps2_encode_fns[] = {
+  Opcode_wsr_eps2_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_xsr_eps2_encode_fns[] = {
+  Opcode_xsr_eps2_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_rsr_eps3_encode_fns[] = {
+  Opcode_rsr_eps3_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_wsr_eps3_encode_fns[] = {
+  Opcode_wsr_eps3_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_xsr_eps3_encode_fns[] = {
+  Opcode_xsr_eps3_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_rsr_excvaddr_encode_fns[] = {
+  Opcode_rsr_excvaddr_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_wsr_excvaddr_encode_fns[] = {
+  Opcode_wsr_excvaddr_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_xsr_excvaddr_encode_fns[] = {
+  Opcode_xsr_excvaddr_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_rsr_depc_encode_fns[] = {
+  Opcode_rsr_depc_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_wsr_depc_encode_fns[] = {
+  Opcode_wsr_depc_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_xsr_depc_encode_fns[] = {
+  Opcode_xsr_depc_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_rsr_exccause_encode_fns[] = {
+  Opcode_rsr_exccause_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_wsr_exccause_encode_fns[] = {
+  Opcode_wsr_exccause_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_xsr_exccause_encode_fns[] = {
+  Opcode_xsr_exccause_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_rsr_prid_encode_fns[] = {
+  Opcode_rsr_prid_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_rsr_vecbase_encode_fns[] = {
+  Opcode_rsr_vecbase_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_wsr_vecbase_encode_fns[] = {
+  Opcode_wsr_vecbase_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_xsr_vecbase_encode_fns[] = {
+  Opcode_xsr_vecbase_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_mul16u_encode_fns[] = {
+  Opcode_mul16u_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_mul16s_encode_fns[] = {
+  Opcode_mul16s_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_mull_encode_fns[] = {
+  Opcode_mull_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_rfi_encode_fns[] = {
+  Opcode_rfi_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_waiti_encode_fns[] = {
+  Opcode_waiti_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_rsr_interrupt_encode_fns[] = {
+  Opcode_rsr_interrupt_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_wsr_intset_encode_fns[] = {
+  Opcode_wsr_intset_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_wsr_intclear_encode_fns[] = {
+  Opcode_wsr_intclear_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_rsr_intenable_encode_fns[] = {
+  Opcode_rsr_intenable_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_wsr_intenable_encode_fns[] = {
+  Opcode_wsr_intenable_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_xsr_intenable_encode_fns[] = {
+  Opcode_xsr_intenable_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_break_encode_fns[] = {
+  Opcode_break_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_break_n_encode_fns[] = {
+  0, 0, Opcode_break_n_Slot_inst16b_encode
+};
+
+static xtensa_opcode_encode_fn Opcode_rsr_dbreaka0_encode_fns[] = {
+  Opcode_rsr_dbreaka0_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_wsr_dbreaka0_encode_fns[] = {
+  Opcode_wsr_dbreaka0_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_xsr_dbreaka0_encode_fns[] = {
+  Opcode_xsr_dbreaka0_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_rsr_dbreakc0_encode_fns[] = {
+  Opcode_rsr_dbreakc0_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_wsr_dbreakc0_encode_fns[] = {
+  Opcode_wsr_dbreakc0_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_xsr_dbreakc0_encode_fns[] = {
+  Opcode_xsr_dbreakc0_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_rsr_ibreaka0_encode_fns[] = {
+  Opcode_rsr_ibreaka0_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_wsr_ibreaka0_encode_fns[] = {
+  Opcode_wsr_ibreaka0_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_xsr_ibreaka0_encode_fns[] = {
+  Opcode_xsr_ibreaka0_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_rsr_ibreakenable_encode_fns[] = {
+  Opcode_rsr_ibreakenable_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_wsr_ibreakenable_encode_fns[] = {
+  Opcode_wsr_ibreakenable_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_xsr_ibreakenable_encode_fns[] = {
+  Opcode_xsr_ibreakenable_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_rsr_debugcause_encode_fns[] = {
+  Opcode_rsr_debugcause_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_wsr_debugcause_encode_fns[] = {
+  Opcode_wsr_debugcause_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_xsr_debugcause_encode_fns[] = {
+  Opcode_xsr_debugcause_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_rsr_icount_encode_fns[] = {
+  Opcode_rsr_icount_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_wsr_icount_encode_fns[] = {
+  Opcode_wsr_icount_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_xsr_icount_encode_fns[] = {
+  Opcode_xsr_icount_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_rsr_icountlevel_encode_fns[] = {
+  Opcode_rsr_icountlevel_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_wsr_icountlevel_encode_fns[] = {
+  Opcode_wsr_icountlevel_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_xsr_icountlevel_encode_fns[] = {
+  Opcode_xsr_icountlevel_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_rsr_ddr_encode_fns[] = {
+  Opcode_rsr_ddr_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_wsr_ddr_encode_fns[] = {
+  Opcode_wsr_ddr_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_xsr_ddr_encode_fns[] = {
+  Opcode_xsr_ddr_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_rfdo_encode_fns[] = {
+  Opcode_rfdo_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_rfdd_encode_fns[] = {
+  Opcode_rfdd_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_wsr_mmid_encode_fns[] = {
+  Opcode_wsr_mmid_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_rsr_ccount_encode_fns[] = {
+  Opcode_rsr_ccount_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_wsr_ccount_encode_fns[] = {
+  Opcode_wsr_ccount_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_xsr_ccount_encode_fns[] = {
+  Opcode_xsr_ccount_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_rsr_ccompare0_encode_fns[] = {
+  Opcode_rsr_ccompare0_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_wsr_ccompare0_encode_fns[] = {
+  Opcode_wsr_ccompare0_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_xsr_ccompare0_encode_fns[] = {
+  Opcode_xsr_ccompare0_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_idtlb_encode_fns[] = {
+  Opcode_idtlb_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_pdtlb_encode_fns[] = {
+  Opcode_pdtlb_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_rdtlb0_encode_fns[] = {
+  Opcode_rdtlb0_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_rdtlb1_encode_fns[] = {
+  Opcode_rdtlb1_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_wdtlb_encode_fns[] = {
+  Opcode_wdtlb_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_iitlb_encode_fns[] = {
+  Opcode_iitlb_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_pitlb_encode_fns[] = {
+  Opcode_pitlb_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_ritlb0_encode_fns[] = {
+  Opcode_ritlb0_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_ritlb1_encode_fns[] = {
+  Opcode_ritlb1_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_witlb_encode_fns[] = {
+  Opcode_witlb_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_nsa_encode_fns[] = {
+  Opcode_nsa_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_nsau_encode_fns[] = {
+  Opcode_nsau_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_rer_encode_fns[] = {
+  Opcode_rer_Slot_inst_encode, 0, 0
+};
+
+static xtensa_opcode_encode_fn Opcode_wer_encode_fns[] = {
+  Opcode_wer_Slot_inst_encode, 0, 0
+};
+
+
+/* Opcode table.  */
+
+static xtensa_opcode_internal opcodes[] = {
+  { "excw", ICLASS_xt_iclass_excw,
+    0,
+    Opcode_excw_encode_fns, 0, 0 },
+  { "rfe", ICLASS_xt_iclass_rfe,
+    XTENSA_OPCODE_IS_JUMP,
+    Opcode_rfe_encode_fns, 0, 0 },
+  { "rfde", ICLASS_xt_iclass_rfde,
+    XTENSA_OPCODE_IS_JUMP,
+    Opcode_rfde_encode_fns, 0, 0 },
+  { "syscall", ICLASS_xt_iclass_syscall,
+    0,
+    Opcode_syscall_encode_fns, 0, 0 },
+  { "simcall", ICLASS_xt_iclass_simcall,
+    0,
+    Opcode_simcall_encode_fns, 0, 0 },
+  { "add.n", ICLASS_xt_iclass_add_n,
+    0,
+    Opcode_add_n_encode_fns, 0, 0 },
+  { "addi.n", ICLASS_xt_iclass_addi_n,
+    0,
+    Opcode_addi_n_encode_fns, 0, 0 },
+  { "beqz.n", ICLASS_xt_iclass_bz6,
+    XTENSA_OPCODE_IS_BRANCH,
+    Opcode_beqz_n_encode_fns, 0, 0 },
+  { "bnez.n", ICLASS_xt_iclass_bz6,
+    XTENSA_OPCODE_IS_BRANCH,
+    Opcode_bnez_n_encode_fns, 0, 0 },
+  { "ill.n", ICLASS_xt_iclass_ill_n,
+    0,
+    Opcode_ill_n_encode_fns, 0, 0 },
+  { "l32i.n", ICLASS_xt_iclass_loadi4,
+    0,
+    Opcode_l32i_n_encode_fns, 0, 0 },
+  { "mov.n", ICLASS_xt_iclass_mov_n,
+    0,
+    Opcode_mov_n_encode_fns, 0, 0 },
+  { "movi.n", ICLASS_xt_iclass_movi_n,
+    0,
+    Opcode_movi_n_encode_fns, 0, 0 },
+  { "nop.n", ICLASS_xt_iclass_nopn,
+    0,
+    Opcode_nop_n_encode_fns, 0, 0 },
+  { "ret.n", ICLASS_xt_iclass_retn,
+    XTENSA_OPCODE_IS_JUMP,
+    Opcode_ret_n_encode_fns, 0, 0 },
+  { "s32i.n", ICLASS_xt_iclass_storei4,
+    0,
+    Opcode_s32i_n_encode_fns, 0, 0 },
+  { "addi", ICLASS_xt_iclass_addi,
+    0,
+    Opcode_addi_encode_fns, 0, 0 },
+  { "addmi", ICLASS_xt_iclass_addmi,
+    0,
+    Opcode_addmi_encode_fns, 0, 0 },
+  { "add", ICLASS_xt_iclass_addsub,
+    0,
+    Opcode_add_encode_fns, 0, 0 },
+  { "sub", ICLASS_xt_iclass_addsub,
+    0,
+    Opcode_sub_encode_fns, 0, 0 },
+  { "addx2", ICLASS_xt_iclass_addsub,
+    0,
+    Opcode_addx2_encode_fns, 0, 0 },
+  { "addx4", ICLASS_xt_iclass_addsub,
+    0,
+    Opcode_addx4_encode_fns, 0, 0 },
+  { "addx8", ICLASS_xt_iclass_addsub,
+    0,
+    Opcode_addx8_encode_fns, 0, 0 },
+  { "subx2", ICLASS_xt_iclass_addsub,
+    0,
+    Opcode_subx2_encode_fns, 0, 0 },
+  { "subx4", ICLASS_xt_iclass_addsub,
+    0,
+    Opcode_subx4_encode_fns, 0, 0 },
+  { "subx8", ICLASS_xt_iclass_addsub,
+    0,
+    Opcode_subx8_encode_fns, 0, 0 },
+  { "and", ICLASS_xt_iclass_bit,
+    0,
+    Opcode_and_encode_fns, 0, 0 },
+  { "or", ICLASS_xt_iclass_bit,
+    0,
+    Opcode_or_encode_fns, 0, 0 },
+  { "xor", ICLASS_xt_iclass_bit,
+    0,
+    Opcode_xor_encode_fns, 0, 0 },
+  { "beqi", ICLASS_xt_iclass_bsi8,
+    XTENSA_OPCODE_IS_BRANCH,
+    Opcode_beqi_encode_fns, 0, 0 },
+  { "bnei", ICLASS_xt_iclass_bsi8,
+    XTENSA_OPCODE_IS_BRANCH,
+    Opcode_bnei_encode_fns, 0, 0 },
+  { "bgei", ICLASS_xt_iclass_bsi8,
+    XTENSA_OPCODE_IS_BRANCH,
+    Opcode_bgei_encode_fns, 0, 0 },
+  { "blti", ICLASS_xt_iclass_bsi8,
+    XTENSA_OPCODE_IS_BRANCH,
+    Opcode_blti_encode_fns, 0, 0 },
+  { "bbci", ICLASS_xt_iclass_bsi8b,
+    XTENSA_OPCODE_IS_BRANCH,
+    Opcode_bbci_encode_fns, 0, 0 },
+  { "bbsi", ICLASS_xt_iclass_bsi8b,
+    XTENSA_OPCODE_IS_BRANCH,
+    Opcode_bbsi_encode_fns, 0, 0 },
+  { "bgeui", ICLASS_xt_iclass_bsi8u,
+    XTENSA_OPCODE_IS_BRANCH,
+    Opcode_bgeui_encode_fns, 0, 0 },
+  { "bltui", ICLASS_xt_iclass_bsi8u,
+    XTENSA_OPCODE_IS_BRANCH,
+    Opcode_bltui_encode_fns, 0, 0 },
+  { "beq", ICLASS_xt_iclass_bst8,
+    XTENSA_OPCODE_IS_BRANCH,
+    Opcode_beq_encode_fns, 0, 0 },
+  { "bne", ICLASS_xt_iclass_bst8,
+    XTENSA_OPCODE_IS_BRANCH,
+    Opcode_bne_encode_fns, 0, 0 },
+  { "bge", ICLASS_xt_iclass_bst8,
+    XTENSA_OPCODE_IS_BRANCH,
+    Opcode_bge_encode_fns, 0, 0 },
+  { "blt", ICLASS_xt_iclass_bst8,
+    XTENSA_OPCODE_IS_BRANCH,
+    Opcode_blt_encode_fns, 0, 0 },
+  { "bgeu", ICLASS_xt_iclass_bst8,
+    XTENSA_OPCODE_IS_BRANCH,
+    Opcode_bgeu_encode_fns, 0, 0 },
+  { "bltu", ICLASS_xt_iclass_bst8,
+    XTENSA_OPCODE_IS_BRANCH,
+    Opcode_bltu_encode_fns, 0, 0 },
+  { "bany", ICLASS_xt_iclass_bst8,
+    XTENSA_OPCODE_IS_BRANCH,
+    Opcode_bany_encode_fns, 0, 0 },
+  { "bnone", ICLASS_xt_iclass_bst8,
+    XTENSA_OPCODE_IS_BRANCH,
+    Opcode_bnone_encode_fns, 0, 0 },
+  { "ball", ICLASS_xt_iclass_bst8,
+    XTENSA_OPCODE_IS_BRANCH,
+    Opcode_ball_encode_fns, 0, 0 },
+  { "bnall", ICLASS_xt_iclass_bst8,
+    XTENSA_OPCODE_IS_BRANCH,
+    Opcode_bnall_encode_fns, 0, 0 },
+  { "bbc", ICLASS_xt_iclass_bst8,
+    XTENSA_OPCODE_IS_BRANCH,
+    Opcode_bbc_encode_fns, 0, 0 },
+  { "bbs", ICLASS_xt_iclass_bst8,
+    XTENSA_OPCODE_IS_BRANCH,
+    Opcode_bbs_encode_fns, 0, 0 },
+  { "beqz", ICLASS_xt_iclass_bsz12,
+    XTENSA_OPCODE_IS_BRANCH,
+    Opcode_beqz_encode_fns, 0, 0 },
+  { "bnez", ICLASS_xt_iclass_bsz12,
+    XTENSA_OPCODE_IS_BRANCH,
+    Opcode_bnez_encode_fns, 0, 0 },
+  { "bgez", ICLASS_xt_iclass_bsz12,
+    XTENSA_OPCODE_IS_BRANCH,
+    Opcode_bgez_encode_fns, 0, 0 },
+  { "bltz", ICLASS_xt_iclass_bsz12,
+    XTENSA_OPCODE_IS_BRANCH,
+    Opcode_bltz_encode_fns, 0, 0 },
+  { "call0", ICLASS_xt_iclass_call0,
+    XTENSA_OPCODE_IS_CALL,
+    Opcode_call0_encode_fns, 0, 0 },
+  { "callx0", ICLASS_xt_iclass_callx0,
+    XTENSA_OPCODE_IS_CALL,
+    Opcode_callx0_encode_fns, 0, 0 },
+  { "extui", ICLASS_xt_iclass_exti,
+    0,
+    Opcode_extui_encode_fns, 0, 0 },
+  { "ill", ICLASS_xt_iclass_ill,
+    0,
+    Opcode_ill_encode_fns, 0, 0 },
+  { "j", ICLASS_xt_iclass_jump,
+    XTENSA_OPCODE_IS_JUMP,
+    Opcode_j_encode_fns, 0, 0 },
+  { "jx", ICLASS_xt_iclass_jumpx,
+    XTENSA_OPCODE_IS_JUMP,
+    Opcode_jx_encode_fns, 0, 0 },
+  { "l16ui", ICLASS_xt_iclass_l16ui,
+    0,
+    Opcode_l16ui_encode_fns, 0, 0 },
+  { "l16si", ICLASS_xt_iclass_l16si,
+    0,
+    Opcode_l16si_encode_fns, 0, 0 },
+  { "l32i", ICLASS_xt_iclass_l32i,
+    0,
+    Opcode_l32i_encode_fns, 0, 0 },
+  { "l32r", ICLASS_xt_iclass_l32r,
+    0,
+    Opcode_l32r_encode_fns, 0, 0 },
+  { "l8ui", ICLASS_xt_iclass_l8i,
+    0,
+    Opcode_l8ui_encode_fns, 0, 0 },
+  { "movi", ICLASS_xt_iclass_movi,
+    0,
+    Opcode_movi_encode_fns, 0, 0 },
+  { "moveqz", ICLASS_xt_iclass_movz,
+    0,
+    Opcode_moveqz_encode_fns, 0, 0 },
+  { "movnez", ICLASS_xt_iclass_movz,
+    0,
+    Opcode_movnez_encode_fns, 0, 0 },
+  { "movltz", ICLASS_xt_iclass_movz,
+    0,
+    Opcode_movltz_encode_fns, 0, 0 },
+  { "movgez", ICLASS_xt_iclass_movz,
+    0,
+    Opcode_movgez_encode_fns, 0, 0 },
+  { "neg", ICLASS_xt_iclass_neg,
+    0,
+    Opcode_neg_encode_fns, 0, 0 },
+  { "abs", ICLASS_xt_iclass_neg,
+    0,
+    Opcode_abs_encode_fns, 0, 0 },
+  { "nop", ICLASS_xt_iclass_nop,
+    0,
+    Opcode_nop_encode_fns, 0, 0 },
+  { "ret", ICLASS_xt_iclass_return,
+    XTENSA_OPCODE_IS_JUMP,
+    Opcode_ret_encode_fns, 0, 0 },
+  { "s16i", ICLASS_xt_iclass_s16i,
+    0,
+    Opcode_s16i_encode_fns, 0, 0 },
+  { "s32i", ICLASS_xt_iclass_s32i,
+    0,
+    Opcode_s32i_encode_fns, 0, 0 },
+  { "s8i", ICLASS_xt_iclass_s8i,
+    0,
+    Opcode_s8i_encode_fns, 0, 0 },
+  { "ssr", ICLASS_xt_iclass_sar,
+    0,
+    Opcode_ssr_encode_fns, 0, 0 },
+  { "ssl", ICLASS_xt_iclass_sar,
+    0,
+    Opcode_ssl_encode_fns, 0, 0 },
+  { "ssa8l", ICLASS_xt_iclass_sar,
+    0,
+    Opcode_ssa8l_encode_fns, 0, 0 },
+  { "ssa8b", ICLASS_xt_iclass_sar,
+    0,
+    Opcode_ssa8b_encode_fns, 0, 0 },
+  { "ssai", ICLASS_xt_iclass_sari,
+    0,
+    Opcode_ssai_encode_fns, 0, 0 },
+  { "sll", ICLASS_xt_iclass_shifts,
+    0,
+    Opcode_sll_encode_fns, 0, 0 },
+  { "src", ICLASS_xt_iclass_shiftst,
+    0,
+    Opcode_src_encode_fns, 0, 0 },
+  { "srl", ICLASS_xt_iclass_shiftt,
+    0,
+    Opcode_srl_encode_fns, 0, 0 },
+  { "sra", ICLASS_xt_iclass_shiftt,
+    0,
+    Opcode_sra_encode_fns, 0, 0 },
+  { "slli", ICLASS_xt_iclass_slli,
+    0,
+    Opcode_slli_encode_fns, 0, 0 },
+  { "srai", ICLASS_xt_iclass_srai,
+    0,
+    Opcode_srai_encode_fns, 0, 0 },
+  { "srli", ICLASS_xt_iclass_srli,
+    0,
+    Opcode_srli_encode_fns, 0, 0 },
+  { "memw", ICLASS_xt_iclass_memw,
+    0,
+    Opcode_memw_encode_fns, 0, 0 },
+  { "extw", ICLASS_xt_iclass_extw,
+    0,
+    Opcode_extw_encode_fns, 0, 0 },
+  { "isync", ICLASS_xt_iclass_isync,
+    0,
+    Opcode_isync_encode_fns, 0, 0 },
+  { "rsync", ICLASS_xt_iclass_sync,
+    0,
+    Opcode_rsync_encode_fns, 0, 0 },
+  { "esync", ICLASS_xt_iclass_sync,
+    0,
+    Opcode_esync_encode_fns, 0, 0 },
+  { "dsync", ICLASS_xt_iclass_sync,
+    0,
+    Opcode_dsync_encode_fns, 0, 0 },
+  { "rsil", ICLASS_xt_iclass_rsil,
+    0,
+    Opcode_rsil_encode_fns, 0, 0 },
+  { "rsr.sar", ICLASS_xt_iclass_rsr_sar,
+    0,
+    Opcode_rsr_sar_encode_fns, 0, 0 },
+  { "wsr.sar", ICLASS_xt_iclass_wsr_sar,
+    0,
+    Opcode_wsr_sar_encode_fns, 0, 0 },
+  { "xsr.sar", ICLASS_xt_iclass_xsr_sar,
+    0,
+    Opcode_xsr_sar_encode_fns, 0, 0 },
+  { "rsr.litbase", ICLASS_xt_iclass_rsr_litbase,
+    0,
+    Opcode_rsr_litbase_encode_fns, 0, 0 },
+  { "wsr.litbase", ICLASS_xt_iclass_wsr_litbase,
+    0,
+    Opcode_wsr_litbase_encode_fns, 0, 0 },
+  { "xsr.litbase", ICLASS_xt_iclass_xsr_litbase,
+    0,
+    Opcode_xsr_litbase_encode_fns, 0, 0 },
+  { "rsr.176", ICLASS_xt_iclass_rsr_176,
+    0,
+    Opcode_rsr_176_encode_fns, 0, 0 },
+  { "wsr.176", ICLASS_xt_iclass_wsr_176,
+    0,
+    Opcode_wsr_176_encode_fns, 0, 0 },
+  { "rsr.208", ICLASS_xt_iclass_rsr_208,
+    0,
+    Opcode_rsr_208_encode_fns, 0, 0 },
+  { "rsr.ps", ICLASS_xt_iclass_rsr_ps,
+    0,
+    Opcode_rsr_ps_encode_fns, 0, 0 },
+  { "wsr.ps", ICLASS_xt_iclass_wsr_ps,
+    0,
+    Opcode_wsr_ps_encode_fns, 0, 0 },
+  { "xsr.ps", ICLASS_xt_iclass_xsr_ps,
+    0,
+    Opcode_xsr_ps_encode_fns, 0, 0 },
+  { "rsr.epc1", ICLASS_xt_iclass_rsr_epc1,
+    0,
+    Opcode_rsr_epc1_encode_fns, 0, 0 },
+  { "wsr.epc1", ICLASS_xt_iclass_wsr_epc1,
+    0,
+    Opcode_wsr_epc1_encode_fns, 0, 0 },
+  { "xsr.epc1", ICLASS_xt_iclass_xsr_epc1,
+    0,
+    Opcode_xsr_epc1_encode_fns, 0, 0 },
+  { "rsr.excsave1", ICLASS_xt_iclass_rsr_excsave1,
+    0,
+    Opcode_rsr_excsave1_encode_fns, 0, 0 },
+  { "wsr.excsave1", ICLASS_xt_iclass_wsr_excsave1,
+    0,
+    Opcode_wsr_excsave1_encode_fns, 0, 0 },
+  { "xsr.excsave1", ICLASS_xt_iclass_xsr_excsave1,
+    0,
+    Opcode_xsr_excsave1_encode_fns, 0, 0 },
+  { "rsr.epc2", ICLASS_xt_iclass_rsr_epc2,
+    0,
+    Opcode_rsr_epc2_encode_fns, 0, 0 },
+  { "wsr.epc2", ICLASS_xt_iclass_wsr_epc2,
+    0,
+    Opcode_wsr_epc2_encode_fns, 0, 0 },
+  { "xsr.epc2", ICLASS_xt_iclass_xsr_epc2,
+    0,
+    Opcode_xsr_epc2_encode_fns, 0, 0 },
+  { "rsr.excsave2", ICLASS_xt_iclass_rsr_excsave2,
+    0,
+    Opcode_rsr_excsave2_encode_fns, 0, 0 },
+  { "wsr.excsave2", ICLASS_xt_iclass_wsr_excsave2,
+    0,
+    Opcode_wsr_excsave2_encode_fns, 0, 0 },
+  { "xsr.excsave2", ICLASS_xt_iclass_xsr_excsave2,
+    0,
+    Opcode_xsr_excsave2_encode_fns, 0, 0 },
+  { "rsr.epc3", ICLASS_xt_iclass_rsr_epc3,
+    0,
+    Opcode_rsr_epc3_encode_fns, 0, 0 },
+  { "wsr.epc3", ICLASS_xt_iclass_wsr_epc3,
+    0,
+    Opcode_wsr_epc3_encode_fns, 0, 0 },
+  { "xsr.epc3", ICLASS_xt_iclass_xsr_epc3,
+    0,
+    Opcode_xsr_epc3_encode_fns, 0, 0 },
+  { "rsr.excsave3", ICLASS_xt_iclass_rsr_excsave3,
+    0,
+    Opcode_rsr_excsave3_encode_fns, 0, 0 },
+  { "wsr.excsave3", ICLASS_xt_iclass_wsr_excsave3,
+    0,
+    Opcode_wsr_excsave3_encode_fns, 0, 0 },
+  { "xsr.excsave3", ICLASS_xt_iclass_xsr_excsave3,
+    0,
+    Opcode_xsr_excsave3_encode_fns, 0, 0 },
+  { "rsr.eps2", ICLASS_xt_iclass_rsr_eps2,
+    0,
+    Opcode_rsr_eps2_encode_fns, 0, 0 },
+  { "wsr.eps2", ICLASS_xt_iclass_wsr_eps2,
+    0,
+    Opcode_wsr_eps2_encode_fns, 0, 0 },
+  { "xsr.eps2", ICLASS_xt_iclass_xsr_eps2,
+    0,
+    Opcode_xsr_eps2_encode_fns, 0, 0 },
+  { "rsr.eps3", ICLASS_xt_iclass_rsr_eps3,
+    0,
+    Opcode_rsr_eps3_encode_fns, 0, 0 },
+  { "wsr.eps3", ICLASS_xt_iclass_wsr_eps3,
+    0,
+    Opcode_wsr_eps3_encode_fns, 0, 0 },
+  { "xsr.eps3", ICLASS_xt_iclass_xsr_eps3,
+    0,
+    Opcode_xsr_eps3_encode_fns, 0, 0 },
+  { "rsr.excvaddr", ICLASS_xt_iclass_rsr_excvaddr,
+    0,
+    Opcode_rsr_excvaddr_encode_fns, 0, 0 },
+  { "wsr.excvaddr", ICLASS_xt_iclass_wsr_excvaddr,
+    0,
+    Opcode_wsr_excvaddr_encode_fns, 0, 0 },
+  { "xsr.excvaddr", ICLASS_xt_iclass_xsr_excvaddr,
+    0,
+    Opcode_xsr_excvaddr_encode_fns, 0, 0 },
+  { "rsr.depc", ICLASS_xt_iclass_rsr_depc,
+    0,
+    Opcode_rsr_depc_encode_fns, 0, 0 },
+  { "wsr.depc", ICLASS_xt_iclass_wsr_depc,
+    0,
+    Opcode_wsr_depc_encode_fns, 0, 0 },
+  { "xsr.depc", ICLASS_xt_iclass_xsr_depc,
+    0,
+    Opcode_xsr_depc_encode_fns, 0, 0 },
+  { "rsr.exccause", ICLASS_xt_iclass_rsr_exccause,
+    0,
+    Opcode_rsr_exccause_encode_fns, 0, 0 },
+  { "wsr.exccause", ICLASS_xt_iclass_wsr_exccause,
+    0,
+    Opcode_wsr_exccause_encode_fns, 0, 0 },
+  { "xsr.exccause", ICLASS_xt_iclass_xsr_exccause,
+    0,
+    Opcode_xsr_exccause_encode_fns, 0, 0 },
+  { "rsr.prid", ICLASS_xt_iclass_rsr_prid,
+    0,
+    Opcode_rsr_prid_encode_fns, 0, 0 },
+  { "rsr.vecbase", ICLASS_xt_iclass_rsr_vecbase,
+    0,
+    Opcode_rsr_vecbase_encode_fns, 0, 0 },
+  { "wsr.vecbase", ICLASS_xt_iclass_wsr_vecbase,
+    0,
+    Opcode_wsr_vecbase_encode_fns, 0, 0 },
+  { "xsr.vecbase", ICLASS_xt_iclass_xsr_vecbase,
+    0,
+    Opcode_xsr_vecbase_encode_fns, 0, 0 },
+  { "mul16u", ICLASS_xt_mul16,
+    0,
+    Opcode_mul16u_encode_fns, 0, 0 },
+  { "mul16s", ICLASS_xt_mul16,
+    0,
+    Opcode_mul16s_encode_fns, 0, 0 },
+  { "mull", ICLASS_xt_mul32,
+    0,
+    Opcode_mull_encode_fns, 0, 0 },
+  { "rfi", ICLASS_xt_iclass_rfi,
+    XTENSA_OPCODE_IS_JUMP,
+    Opcode_rfi_encode_fns, 0, 0 },
+  { "waiti", ICLASS_xt_iclass_wait,
+    0,
+    Opcode_waiti_encode_fns, 0, 0 },
+  { "rsr.interrupt", ICLASS_xt_iclass_rsr_interrupt,
+    0,
+    Opcode_rsr_interrupt_encode_fns, 0, 0 },
+  { "wsr.intset", ICLASS_xt_iclass_wsr_intset,
+    0,
+    Opcode_wsr_intset_encode_fns, 0, 0 },
+  { "wsr.intclear", ICLASS_xt_iclass_wsr_intclear,
+    0,
+    Opcode_wsr_intclear_encode_fns, 0, 0 },
+  { "rsr.intenable", ICLASS_xt_iclass_rsr_intenable,
+    0,
+    Opcode_rsr_intenable_encode_fns, 0, 0 },
+  { "wsr.intenable", ICLASS_xt_iclass_wsr_intenable,
+    0,
+    Opcode_wsr_intenable_encode_fns, 0, 0 },
+  { "xsr.intenable", ICLASS_xt_iclass_xsr_intenable,
+    0,
+    Opcode_xsr_intenable_encode_fns, 0, 0 },
+  { "break", ICLASS_xt_iclass_break,
+    0,
+    Opcode_break_encode_fns, 0, 0 },
+  { "break.n", ICLASS_xt_iclass_break_n,
+    0,
+    Opcode_break_n_encode_fns, 0, 0 },
+  { "rsr.dbreaka0", ICLASS_xt_iclass_rsr_dbreaka0,
+    0,
+    Opcode_rsr_dbreaka0_encode_fns, 0, 0 },
+  { "wsr.dbreaka0", ICLASS_xt_iclass_wsr_dbreaka0,
+    0,
+    Opcode_wsr_dbreaka0_encode_fns, 0, 0 },
+  { "xsr.dbreaka0", ICLASS_xt_iclass_xsr_dbreaka0,
+    0,
+    Opcode_xsr_dbreaka0_encode_fns, 0, 0 },
+  { "rsr.dbreakc0", ICLASS_xt_iclass_rsr_dbreakc0,
+    0,
+    Opcode_rsr_dbreakc0_encode_fns, 0, 0 },
+  { "wsr.dbreakc0", ICLASS_xt_iclass_wsr_dbreakc0,
+    0,
+    Opcode_wsr_dbreakc0_encode_fns, 0, 0 },
+  { "xsr.dbreakc0", ICLASS_xt_iclass_xsr_dbreakc0,
+    0,
+    Opcode_xsr_dbreakc0_encode_fns, 0, 0 },
+  { "rsr.ibreaka0", ICLASS_xt_iclass_rsr_ibreaka0,
+    0,
+    Opcode_rsr_ibreaka0_encode_fns, 0, 0 },
+  { "wsr.ibreaka0", ICLASS_xt_iclass_wsr_ibreaka0,
+    0,
+    Opcode_wsr_ibreaka0_encode_fns, 0, 0 },
+  { "xsr.ibreaka0", ICLASS_xt_iclass_xsr_ibreaka0,
+    0,
+    Opcode_xsr_ibreaka0_encode_fns, 0, 0 },
+  { "rsr.ibreakenable", ICLASS_xt_iclass_rsr_ibreakenable,
+    0,
+    Opcode_rsr_ibreakenable_encode_fns, 0, 0 },
+  { "wsr.ibreakenable", ICLASS_xt_iclass_wsr_ibreakenable,
+    0,
+    Opcode_wsr_ibreakenable_encode_fns, 0, 0 },
+  { "xsr.ibreakenable", ICLASS_xt_iclass_xsr_ibreakenable,
+    0,
+    Opcode_xsr_ibreakenable_encode_fns, 0, 0 },
+  { "rsr.debugcause", ICLASS_xt_iclass_rsr_debugcause,
+    0,
+    Opcode_rsr_debugcause_encode_fns, 0, 0 },
+  { "wsr.debugcause", ICLASS_xt_iclass_wsr_debugcause,
+    0,
+    Opcode_wsr_debugcause_encode_fns, 0, 0 },
+  { "xsr.debugcause", ICLASS_xt_iclass_xsr_debugcause,
+    0,
+    Opcode_xsr_debugcause_encode_fns, 0, 0 },
+  { "rsr.icount", ICLASS_xt_iclass_rsr_icount,
+    0,
+    Opcode_rsr_icount_encode_fns, 0, 0 },
+  { "wsr.icount", ICLASS_xt_iclass_wsr_icount,
+    0,
+    Opcode_wsr_icount_encode_fns, 0, 0 },
+  { "xsr.icount", ICLASS_xt_iclass_xsr_icount,
+    0,
+    Opcode_xsr_icount_encode_fns, 0, 0 },
+  { "rsr.icountlevel", ICLASS_xt_iclass_rsr_icountlevel,
+    0,
+    Opcode_rsr_icountlevel_encode_fns, 0, 0 },
+  { "wsr.icountlevel", ICLASS_xt_iclass_wsr_icountlevel,
+    0,
+    Opcode_wsr_icountlevel_encode_fns, 0, 0 },
+  { "xsr.icountlevel", ICLASS_xt_iclass_xsr_icountlevel,
+    0,
+    Opcode_xsr_icountlevel_encode_fns, 0, 0 },
+  { "rsr.ddr", ICLASS_xt_iclass_rsr_ddr,
+    0,
+    Opcode_rsr_ddr_encode_fns, 0, 0 },
+  { "wsr.ddr", ICLASS_xt_iclass_wsr_ddr,
+    0,
+    Opcode_wsr_ddr_encode_fns, 0, 0 },
+  { "xsr.ddr", ICLASS_xt_iclass_xsr_ddr,
+    0,
+    Opcode_xsr_ddr_encode_fns, 0, 0 },
+  { "rfdo", ICLASS_xt_iclass_rfdo,
+    XTENSA_OPCODE_IS_JUMP,
+    Opcode_rfdo_encode_fns, 0, 0 },
+  { "rfdd", ICLASS_xt_iclass_rfdd,
+    XTENSA_OPCODE_IS_JUMP,
+    Opcode_rfdd_encode_fns, 0, 0 },
+  { "wsr.mmid", ICLASS_xt_iclass_wsr_mmid,
+    0,
+    Opcode_wsr_mmid_encode_fns, 0, 0 },
+  { "rsr.ccount", ICLASS_xt_iclass_rsr_ccount,
+    0,
+    Opcode_rsr_ccount_encode_fns, 0, 0 },
+  { "wsr.ccount", ICLASS_xt_iclass_wsr_ccount,
+    0,
+    Opcode_wsr_ccount_encode_fns, 0, 0 },
+  { "xsr.ccount", ICLASS_xt_iclass_xsr_ccount,
+    0,
+    Opcode_xsr_ccount_encode_fns, 0, 0 },
+  { "rsr.ccompare0", ICLASS_xt_iclass_rsr_ccompare0,
+    0,
+    Opcode_rsr_ccompare0_encode_fns, 0, 0 },
+  { "wsr.ccompare0", ICLASS_xt_iclass_wsr_ccompare0,
+    0,
+    Opcode_wsr_ccompare0_encode_fns, 0, 0 },
+  { "xsr.ccompare0", ICLASS_xt_iclass_xsr_ccompare0,
+    0,
+    Opcode_xsr_ccompare0_encode_fns, 0, 0 },
+  { "idtlb", ICLASS_xt_iclass_idtlb,
+    0,
+    Opcode_idtlb_encode_fns, 0, 0 },
+  { "pdtlb", ICLASS_xt_iclass_rdtlb,
+    0,
+    Opcode_pdtlb_encode_fns, 0, 0 },
+  { "rdtlb0", ICLASS_xt_iclass_rdtlb,
+    0,
+    Opcode_rdtlb0_encode_fns, 0, 0 },
+  { "rdtlb1", ICLASS_xt_iclass_rdtlb,
+    0,
+    Opcode_rdtlb1_encode_fns, 0, 0 },
+  { "wdtlb", ICLASS_xt_iclass_wdtlb,
+    0,
+    Opcode_wdtlb_encode_fns, 0, 0 },
+  { "iitlb", ICLASS_xt_iclass_iitlb,
+    0,
+    Opcode_iitlb_encode_fns, 0, 0 },
+  { "pitlb", ICLASS_xt_iclass_ritlb,
+    0,
+    Opcode_pitlb_encode_fns, 0, 0 },
+  { "ritlb0", ICLASS_xt_iclass_ritlb,
+    0,
+    Opcode_ritlb0_encode_fns, 0, 0 },
+  { "ritlb1", ICLASS_xt_iclass_ritlb,
+    0,
+    Opcode_ritlb1_encode_fns, 0, 0 },
+  { "witlb", ICLASS_xt_iclass_witlb,
+    0,
+    Opcode_witlb_encode_fns, 0, 0 },
+  { "nsa", ICLASS_xt_iclass_nsa,
+    0,
+    Opcode_nsa_encode_fns, 0, 0 },
+  { "nsau", ICLASS_xt_iclass_nsa,
+    0,
+    Opcode_nsau_encode_fns, 0, 0 },
+  { "rer", ICLASS_xt_iclass_rer,
+    0,
+    Opcode_rer_encode_fns, 0, 0 },
+  { "wer", ICLASS_xt_iclass_wer,
+    0,
+    Opcode_wer_encode_fns, 0, 0 }
+};
+
+enum xtensa_opcode_id {
+  OPCODE_EXCW,
+  OPCODE_RFE,
+  OPCODE_RFDE,
+  OPCODE_SYSCALL,
+  OPCODE_SIMCALL,
+  OPCODE_ADD_N,
+  OPCODE_ADDI_N,
+  OPCODE_BEQZ_N,
+  OPCODE_BNEZ_N,
+  OPCODE_ILL_N,
+  OPCODE_L32I_N,
+  OPCODE_MOV_N,
+  OPCODE_MOVI_N,
+  OPCODE_NOP_N,
+  OPCODE_RET_N,
+  OPCODE_S32I_N,
+  OPCODE_ADDI,
+  OPCODE_ADDMI,
+  OPCODE_ADD,
+  OPCODE_SUB,
+  OPCODE_ADDX2,
+  OPCODE_ADDX4,
+  OPCODE_ADDX8,
+  OPCODE_SUBX2,
+  OPCODE_SUBX4,
+  OPCODE_SUBX8,
+  OPCODE_AND,
+  OPCODE_OR,
+  OPCODE_XOR,
+  OPCODE_BEQI,
+  OPCODE_BNEI,
+  OPCODE_BGEI,
+  OPCODE_BLTI,
+  OPCODE_BBCI,
+  OPCODE_BBSI,
+  OPCODE_BGEUI,
+  OPCODE_BLTUI,
+  OPCODE_BEQ,
+  OPCODE_BNE,
+  OPCODE_BGE,
+  OPCODE_BLT,
+  OPCODE_BGEU,
+  OPCODE_BLTU,
+  OPCODE_BANY,
+  OPCODE_BNONE,
+  OPCODE_BALL,
+  OPCODE_BNALL,
+  OPCODE_BBC,
+  OPCODE_BBS,
+  OPCODE_BEQZ,
+  OPCODE_BNEZ,
+  OPCODE_BGEZ,
+  OPCODE_BLTZ,
+  OPCODE_CALL0,
+  OPCODE_CALLX0,
+  OPCODE_EXTUI,
+  OPCODE_ILL,
+  OPCODE_J,
+  OPCODE_JX,
+  OPCODE_L16UI,
+  OPCODE_L16SI,
+  OPCODE_L32I,
+  OPCODE_L32R,
+  OPCODE_L8UI,
+  OPCODE_MOVI,
+  OPCODE_MOVEQZ,
+  OPCODE_MOVNEZ,
+  OPCODE_MOVLTZ,
+  OPCODE_MOVGEZ,
+  OPCODE_NEG,
+  OPCODE_ABS,
+  OPCODE_NOP,
+  OPCODE_RET,
+  OPCODE_S16I,
+  OPCODE_S32I,
+  OPCODE_S8I,
+  OPCODE_SSR,
+  OPCODE_SSL,
+  OPCODE_SSA8L,
+  OPCODE_SSA8B,
+  OPCODE_SSAI,
+  OPCODE_SLL,
+  OPCODE_SRC,
+  OPCODE_SRL,
+  OPCODE_SRA,
+  OPCODE_SLLI,
+  OPCODE_SRAI,
+  OPCODE_SRLI,
+  OPCODE_MEMW,
+  OPCODE_EXTW,
+  OPCODE_ISYNC,
+  OPCODE_RSYNC,
+  OPCODE_ESYNC,
+  OPCODE_DSYNC,
+  OPCODE_RSIL,
+  OPCODE_RSR_SAR,
+  OPCODE_WSR_SAR,
+  OPCODE_XSR_SAR,
+  OPCODE_RSR_LITBASE,
+  OPCODE_WSR_LITBASE,
+  OPCODE_XSR_LITBASE,
+  OPCODE_RSR_176,
+  OPCODE_WSR_176,
+  OPCODE_RSR_208,
+  OPCODE_RSR_PS,
+  OPCODE_WSR_PS,
+  OPCODE_XSR_PS,
+  OPCODE_RSR_EPC1,
+  OPCODE_WSR_EPC1,
+  OPCODE_XSR_EPC1,
+  OPCODE_RSR_EXCSAVE1,
+  OPCODE_WSR_EXCSAVE1,
+  OPCODE_XSR_EXCSAVE1,
+  OPCODE_RSR_EPC2,
+  OPCODE_WSR_EPC2,
+  OPCODE_XSR_EPC2,
+  OPCODE_RSR_EXCSAVE2,
+  OPCODE_WSR_EXCSAVE2,
+  OPCODE_XSR_EXCSAVE2,
+  OPCODE_RSR_EPC3,
+  OPCODE_WSR_EPC3,
+  OPCODE_XSR_EPC3,
+  OPCODE_RSR_EXCSAVE3,
+  OPCODE_WSR_EXCSAVE3,
+  OPCODE_XSR_EXCSAVE3,
+  OPCODE_RSR_EPS2,
+  OPCODE_WSR_EPS2,
+  OPCODE_XSR_EPS2,
+  OPCODE_RSR_EPS3,
+  OPCODE_WSR_EPS3,
+  OPCODE_XSR_EPS3,
+  OPCODE_RSR_EXCVADDR,
+  OPCODE_WSR_EXCVADDR,
+  OPCODE_XSR_EXCVADDR,
+  OPCODE_RSR_DEPC,
+  OPCODE_WSR_DEPC,
+  OPCODE_XSR_DEPC,
+  OPCODE_RSR_EXCCAUSE,
+  OPCODE_WSR_EXCCAUSE,
+  OPCODE_XSR_EXCCAUSE,
+  OPCODE_RSR_PRID,
+  OPCODE_RSR_VECBASE,
+  OPCODE_WSR_VECBASE,
+  OPCODE_XSR_VECBASE,
+  OPCODE_MUL16U,
+  OPCODE_MUL16S,
+  OPCODE_MULL,
+  OPCODE_RFI,
+  OPCODE_WAITI,
+  OPCODE_RSR_INTERRUPT,
+  OPCODE_WSR_INTSET,
+  OPCODE_WSR_INTCLEAR,
+  OPCODE_RSR_INTENABLE,
+  OPCODE_WSR_INTENABLE,
+  OPCODE_XSR_INTENABLE,
+  OPCODE_BREAK,
+  OPCODE_BREAK_N,
+  OPCODE_RSR_DBREAKA0,
+  OPCODE_WSR_DBREAKA0,
+  OPCODE_XSR_DBREAKA0,
+  OPCODE_RSR_DBREAKC0,
+  OPCODE_WSR_DBREAKC0,
+  OPCODE_XSR_DBREAKC0,
+  OPCODE_RSR_IBREAKA0,
+  OPCODE_WSR_IBREAKA0,
+  OPCODE_XSR_IBREAKA0,
+  OPCODE_RSR_IBREAKENABLE,
+  OPCODE_WSR_IBREAKENABLE,
+  OPCODE_XSR_IBREAKENABLE,
+  OPCODE_RSR_DEBUGCAUSE,
+  OPCODE_WSR_DEBUGCAUSE,
+  OPCODE_XSR_DEBUGCAUSE,
+  OPCODE_RSR_ICOUNT,
+  OPCODE_WSR_ICOUNT,
+  OPCODE_XSR_ICOUNT,
+  OPCODE_RSR_ICOUNTLEVEL,
+  OPCODE_WSR_ICOUNTLEVEL,
+  OPCODE_XSR_ICOUNTLEVEL,
+  OPCODE_RSR_DDR,
+  OPCODE_WSR_DDR,
+  OPCODE_XSR_DDR,
+  OPCODE_RFDO,
+  OPCODE_RFDD,
+  OPCODE_WSR_MMID,
+  OPCODE_RSR_CCOUNT,
+  OPCODE_WSR_CCOUNT,
+  OPCODE_XSR_CCOUNT,
+  OPCODE_RSR_CCOMPARE0,
+  OPCODE_WSR_CCOMPARE0,
+  OPCODE_XSR_CCOMPARE0,
+  OPCODE_IDTLB,
+  OPCODE_PDTLB,
+  OPCODE_RDTLB0,
+  OPCODE_RDTLB1,
+  OPCODE_WDTLB,
+  OPCODE_IITLB,
+  OPCODE_PITLB,
+  OPCODE_RITLB0,
+  OPCODE_RITLB1,
+  OPCODE_WITLB,
+  OPCODE_NSA,
+  OPCODE_NSAU,
+  OPCODE_RER,
+  OPCODE_WER
+};
+
+
+/* Slot-specific opcode decode functions.  */
+
+static int
+Slot_inst_decode (const xtensa_insnbuf insn)
+{
+  switch (Field_op0_Slot_inst_get (insn))
+    {
+    case 0:
+      switch (Field_op1_Slot_inst_get (insn))
+	{
+	case 0:
+	  switch (Field_op2_Slot_inst_get (insn))
+	    {
+	    case 0:
+	      switch (Field_r_Slot_inst_get (insn))
+		{
+		case 0:
+		  switch (Field_m_Slot_inst_get (insn))
+		    {
+		    case 0:
+		      if (Field_s_Slot_inst_get (insn) == 0 &&
+			  Field_n_Slot_inst_get (insn) == 0)
+			return OPCODE_ILL;
+		      break;
+		    case 2:
+		      switch (Field_n_Slot_inst_get (insn))
+			{
+			case 0:
+			  return OPCODE_RET;
+			case 2:
+			  return OPCODE_JX;
+			}
+		      break;
+		    case 3:
+		      if (Field_n_Slot_inst_get (insn) == 0)
+			return OPCODE_CALLX0;
+		      break;
+		    }
+		  break;
+		case 2:
+		  if (Field_s_Slot_inst_get (insn) == 0)
+		    {
+		      switch (Field_t_Slot_inst_get (insn))
+			{
+			case 0:
+			  return OPCODE_ISYNC;
+			case 1:
+			  return OPCODE_RSYNC;
+			case 2:
+			  return OPCODE_ESYNC;
+			case 3:
+			  return OPCODE_DSYNC;
+			case 8:
+			  return OPCODE_EXCW;
+			case 12:
+			  return OPCODE_MEMW;
+			case 13:
+			  return OPCODE_EXTW;
+			case 15:
+			  return OPCODE_NOP;
+			}
+		    }
+		  break;
+		case 3:
+		  switch (Field_t_Slot_inst_get (insn))
+		    {
+		    case 0:
+		      switch (Field_s_Slot_inst_get (insn))
+			{
+			case 0:
+			  return OPCODE_RFE;
+			case 2:
+			  return OPCODE_RFDE;
+			}
+		      break;
+		    case 1:
+		      return OPCODE_RFI;
+		    }
+		  break;
+		case 4:
+		  return OPCODE_BREAK;
+		case 5:
+		  switch (Field_s_Slot_inst_get (insn))
+		    {
+		    case 0:
+		      if (Field_t_Slot_inst_get (insn) == 0)
+			return OPCODE_SYSCALL;
+		      break;
+		    case 1:
+		      if (Field_t_Slot_inst_get (insn) == 0)
+			return OPCODE_SIMCALL;
+		      break;
+		    }
+		  break;
+		case 6:
+		  return OPCODE_RSIL;
+		case 7:
+		  if (Field_t_Slot_inst_get (insn) == 0)
+		    return OPCODE_WAITI;
+		  break;
+		}
+	      break;
+	    case 1:
+	      return OPCODE_AND;
+	    case 2:
+	      return OPCODE_OR;
+	    case 3:
+	      return OPCODE_XOR;
+	    case 4:
+	      switch (Field_r_Slot_inst_get (insn))
+		{
+		case 0:
+		  if (Field_t_Slot_inst_get (insn) == 0)
+		    return OPCODE_SSR;
+		  break;
+		case 1:
+		  if (Field_t_Slot_inst_get (insn) == 0)
+		    return OPCODE_SSL;
+		  break;
+		case 2:
+		  if (Field_t_Slot_inst_get (insn) == 0)
+		    return OPCODE_SSA8L;
+		  break;
+		case 3:
+		  if (Field_t_Slot_inst_get (insn) == 0)
+		    return OPCODE_SSA8B;
+		  break;
+		case 4:
+		  if (Field_thi3_Slot_inst_get (insn) == 0)
+		    return OPCODE_SSAI;
+		  break;
+		case 6:
+		  return OPCODE_RER;
+		case 7:
+		  return OPCODE_WER;
+		case 14:
+		  return OPCODE_NSA;
+		case 15:
+		  return OPCODE_NSAU;
+		}
+	      break;
+	    case 5:
+	      switch (Field_r_Slot_inst_get (insn))
+		{
+		case 3:
+		  return OPCODE_RITLB0;
+		case 4:
+		  if (Field_t_Slot_inst_get (insn) == 0)
+		    return OPCODE_IITLB;
+		  break;
+		case 5:
+		  return OPCODE_PITLB;
+		case 6:
+		  return OPCODE_WITLB;
+		case 7:
+		  return OPCODE_RITLB1;
+		case 11:
+		  return OPCODE_RDTLB0;
+		case 12:
+		  if (Field_t_Slot_inst_get (insn) == 0)
+		    return OPCODE_IDTLB;
+		  break;
+		case 13:
+		  return OPCODE_PDTLB;
+		case 14:
+		  return OPCODE_WDTLB;
+		case 15:
+		  return OPCODE_RDTLB1;
+		}
+	      break;
+	    case 6:
+	      switch (Field_s_Slot_inst_get (insn))
+		{
+		case 0:
+		  return OPCODE_NEG;
+		case 1:
+		  return OPCODE_ABS;
+		}
+	      break;
+	    case 8:
+	      return OPCODE_ADD;
+	    case 9:
+	      return OPCODE_ADDX2;
+	    case 10:
+	      return OPCODE_ADDX4;
+	    case 11:
+	      return OPCODE_ADDX8;
+	    case 12:
+	      return OPCODE_SUB;
+	    case 13:
+	      return OPCODE_SUBX2;
+	    case 14:
+	      return OPCODE_SUBX4;
+	    case 15:
+	      return OPCODE_SUBX8;
+	    }
+	  break;
+	case 1:
+	  switch (Field_op2_Slot_inst_get (insn))
+	    {
+	    case 0:
+	    case 1:
+	      return OPCODE_SLLI;
+	    case 2:
+	    case 3:
+	      return OPCODE_SRAI;
+	    case 4:
+	      return OPCODE_SRLI;
+	    case 6:
+	      switch (Field_sr_Slot_inst_get (insn))
+		{
+		case 3:
+		  return OPCODE_XSR_SAR;
+		case 5:
+		  return OPCODE_XSR_LITBASE;
+		case 96:
+		  return OPCODE_XSR_IBREAKENABLE;
+		case 104:
+		  return OPCODE_XSR_DDR;
+		case 128:
+		  return OPCODE_XSR_IBREAKA0;
+		case 144:
+		  return OPCODE_XSR_DBREAKA0;
+		case 160:
+		  return OPCODE_XSR_DBREAKC0;
+		case 177:
+		  return OPCODE_XSR_EPC1;
+		case 178:
+		  return OPCODE_XSR_EPC2;
+		case 179:
+		  return OPCODE_XSR_EPC3;
+		case 192:
+		  return OPCODE_XSR_DEPC;
+		case 194:
+		  return OPCODE_XSR_EPS2;
+		case 195:
+		  return OPCODE_XSR_EPS3;
+		case 209:
+		  return OPCODE_XSR_EXCSAVE1;
+		case 210:
+		  return OPCODE_XSR_EXCSAVE2;
+		case 211:
+		  return OPCODE_XSR_EXCSAVE3;
+		case 228:
+		  return OPCODE_XSR_INTENABLE;
+		case 230:
+		  return OPCODE_XSR_PS;
+		case 231:
+		  return OPCODE_XSR_VECBASE;
+		case 232:
+		  return OPCODE_XSR_EXCCAUSE;
+		case 233:
+		  return OPCODE_XSR_DEBUGCAUSE;
+		case 234:
+		  return OPCODE_XSR_CCOUNT;
+		case 236:
+		  return OPCODE_XSR_ICOUNT;
+		case 237:
+		  return OPCODE_XSR_ICOUNTLEVEL;
+		case 238:
+		  return OPCODE_XSR_EXCVADDR;
+		case 240:
+		  return OPCODE_XSR_CCOMPARE0;
+		}
+	      break;
+	    case 8:
+	      return OPCODE_SRC;
+	    case 9:
+	      if (Field_s_Slot_inst_get (insn) == 0)
+		return OPCODE_SRL;
+	      break;
+	    case 10:
+	      if (Field_t_Slot_inst_get (insn) == 0)
+		return OPCODE_SLL;
+	      break;
+	    case 11:
+	      if (Field_s_Slot_inst_get (insn) == 0)
+		return OPCODE_SRA;
+	      break;
+	    case 12:
+	      return OPCODE_MUL16U;
+	    case 13:
+	      return OPCODE_MUL16S;
+	    case 15:
+	      switch (Field_r_Slot_inst_get (insn))
+		{
+		case 14:
+		  if (Field_t_Slot_inst_get (insn) == 0)
+		    return OPCODE_RFDO;
+		  if (Field_t_Slot_inst_get (insn) == 1)
+		    return OPCODE_RFDD;
+		  break;
+		}
+	      break;
+	    }
+	  break;
+	case 2:
+	  if (Field_op2_Slot_inst_get (insn) == 8)
+	    return OPCODE_MULL;
+	  break;
+	case 3:
+	  switch (Field_op2_Slot_inst_get (insn))
+	    {
+	    case 0:
+	      switch (Field_sr_Slot_inst_get (insn))
+		{
+		case 3:
+		  return OPCODE_RSR_SAR;
+		case 5:
+		  return OPCODE_RSR_LITBASE;
+		case 96:
+		  return OPCODE_RSR_IBREAKENABLE;
+		case 104:
+		  return OPCODE_RSR_DDR;
+		case 128:
+		  return OPCODE_RSR_IBREAKA0;
+		case 144:
+		  return OPCODE_RSR_DBREAKA0;
+		case 160:
+		  return OPCODE_RSR_DBREAKC0;
+		case 176:
+		  return OPCODE_RSR_176;
+		case 177:
+		  return OPCODE_RSR_EPC1;
+		case 178:
+		  return OPCODE_RSR_EPC2;
+		case 179:
+		  return OPCODE_RSR_EPC3;
+		case 192:
+		  return OPCODE_RSR_DEPC;
+		case 194:
+		  return OPCODE_RSR_EPS2;
+		case 195:
+		  return OPCODE_RSR_EPS3;
+		case 208:
+		  return OPCODE_RSR_208;
+		case 209:
+		  return OPCODE_RSR_EXCSAVE1;
+		case 210:
+		  return OPCODE_RSR_EXCSAVE2;
+		case 211:
+		  return OPCODE_RSR_EXCSAVE3;
+		case 226:
+		  return OPCODE_RSR_INTERRUPT;
+		case 228:
+		  return OPCODE_RSR_INTENABLE;
+		case 230:
+		  return OPCODE_RSR_PS;
+		case 231:
+		  return OPCODE_RSR_VECBASE;
+		case 232:
+		  return OPCODE_RSR_EXCCAUSE;
+		case 233:
+		  return OPCODE_RSR_DEBUGCAUSE;
+		case 234:
+		  return OPCODE_RSR_CCOUNT;
+		case 235:
+		  return OPCODE_RSR_PRID;
+		case 236:
+		  return OPCODE_RSR_ICOUNT;
+		case 237:
+		  return OPCODE_RSR_ICOUNTLEVEL;
+		case 238:
+		  return OPCODE_RSR_EXCVADDR;
+		case 240:
+		  return OPCODE_RSR_CCOMPARE0;
+		}
+	      break;
+	    case 1:
+	      switch (Field_sr_Slot_inst_get (insn))
+		{
+		case 3:
+		  return OPCODE_WSR_SAR;
+		case 5:
+		  return OPCODE_WSR_LITBASE;
+		case 89:
+		  return OPCODE_WSR_MMID;
+		case 96:
+		  return OPCODE_WSR_IBREAKENABLE;
+		case 104:
+		  return OPCODE_WSR_DDR;
+		case 128:
+		  return OPCODE_WSR_IBREAKA0;
+		case 144:
+		  return OPCODE_WSR_DBREAKA0;
+		case 160:
+		  return OPCODE_WSR_DBREAKC0;
+		case 176:
+		  return OPCODE_WSR_176;
+		case 177:
+		  return OPCODE_WSR_EPC1;
+		case 178:
+		  return OPCODE_WSR_EPC2;
+		case 179:
+		  return OPCODE_WSR_EPC3;
+		case 192:
+		  return OPCODE_WSR_DEPC;
+		case 194:
+		  return OPCODE_WSR_EPS2;
+		case 195:
+		  return OPCODE_WSR_EPS3;
+		case 209:
+		  return OPCODE_WSR_EXCSAVE1;
+		case 210:
+		  return OPCODE_WSR_EXCSAVE2;
+		case 211:
+		  return OPCODE_WSR_EXCSAVE3;
+		case 226:
+		  return OPCODE_WSR_INTSET;
+		case 227:
+		  return OPCODE_WSR_INTCLEAR;
+		case 228:
+		  return OPCODE_WSR_INTENABLE;
+		case 230:
+		  return OPCODE_WSR_PS;
+		case 231:
+		  return OPCODE_WSR_VECBASE;
+		case 232:
+		  return OPCODE_WSR_EXCCAUSE;
+		case 233:
+		  return OPCODE_WSR_DEBUGCAUSE;
+		case 234:
+		  return OPCODE_WSR_CCOUNT;
+		case 236:
+		  return OPCODE_WSR_ICOUNT;
+		case 237:
+		  return OPCODE_WSR_ICOUNTLEVEL;
+		case 238:
+		  return OPCODE_WSR_EXCVADDR;
+		case 240:
+		  return OPCODE_WSR_CCOMPARE0;
+		}
+	      break;
+	    case 8:
+	      return OPCODE_MOVEQZ;
+	    case 9:
+	      return OPCODE_MOVNEZ;
+	    case 10:
+	      return OPCODE_MOVLTZ;
+	    case 11:
+	      return OPCODE_MOVGEZ;
+	    }
+	  break;
+	case 4:
+	case 5:
+	  return OPCODE_EXTUI;
+	}
+      break;
+    case 1:
+      return OPCODE_L32R;
+    case 2:
+      switch (Field_r_Slot_inst_get (insn))
+	{
+	case 0:
+	  return OPCODE_L8UI;
+	case 1:
+	  return OPCODE_L16UI;
+	case 2:
+	  return OPCODE_L32I;
+	case 4:
+	  return OPCODE_S8I;
+	case 5:
+	  return OPCODE_S16I;
+	case 6:
+	  return OPCODE_S32I;
+	case 9:
+	  return OPCODE_L16SI;
+	case 10:
+	  return OPCODE_MOVI;
+	case 12:
+	  return OPCODE_ADDI;
+	case 13:
+	  return OPCODE_ADDMI;
+	}
+      break;
+    case 5:
+      if (Field_n_Slot_inst_get (insn) == 0)
+	return OPCODE_CALL0;
+      break;
+    case 6:
+      switch (Field_n_Slot_inst_get (insn))
+	{
+	case 0:
+	  return OPCODE_J;
+	case 1:
+	  switch (Field_m_Slot_inst_get (insn))
+	    {
+	    case 0:
+	      return OPCODE_BEQZ;
+	    case 1:
+	      return OPCODE_BNEZ;
+	    case 2:
+	      return OPCODE_BLTZ;
+	    case 3:
+	      return OPCODE_BGEZ;
+	    }
+	  break;
+	case 2:
+	  switch (Field_m_Slot_inst_get (insn))
+	    {
+	    case 0:
+	      return OPCODE_BEQI;
+	    case 1:
+	      return OPCODE_BNEI;
+	    case 2:
+	      return OPCODE_BLTI;
+	    case 3:
+	      return OPCODE_BGEI;
+	    }
+	  break;
+	case 3:
+	  switch (Field_m_Slot_inst_get (insn))
+	    {
+	    case 2:
+	      return OPCODE_BLTUI;
+	    case 3:
+	      return OPCODE_BGEUI;
+	    }
+	  break;
+	}
+      break;
+    case 7:
+      switch (Field_r_Slot_inst_get (insn))
+	{
+	case 0:
+	  return OPCODE_BNONE;
+	case 1:
+	  return OPCODE_BEQ;
+	case 2:
+	  return OPCODE_BLT;
+	case 3:
+	  return OPCODE_BLTU;
+	case 4:
+	  return OPCODE_BALL;
+	case 5:
+	  return OPCODE_BBC;
+	case 6:
+	case 7:
+	  return OPCODE_BBCI;
+	case 8:
+	  return OPCODE_BANY;
+	case 9:
+	  return OPCODE_BNE;
+	case 10:
+	  return OPCODE_BGE;
+	case 11:
+	  return OPCODE_BGEU;
+	case 12:
+	  return OPCODE_BNALL;
+	case 13:
+	  return OPCODE_BBS;
+	case 14:
+	case 15:
+	  return OPCODE_BBSI;
+	}
+      break;
+    }
+  return XTENSA_UNDEFINED;
+}
+
+static int
+Slot_inst16a_decode (const xtensa_insnbuf insn)
+{
+  switch (Field_op0_Slot_inst16a_get (insn))
+    {
+    case 8:
+      return OPCODE_L32I_N;
+    case 9:
+      return OPCODE_S32I_N;
+    case 10:
+      return OPCODE_ADD_N;
+    case 11:
+      return OPCODE_ADDI_N;
+    }
+  return XTENSA_UNDEFINED;
+}
+
+static int
+Slot_inst16b_decode (const xtensa_insnbuf insn)
+{
+  switch (Field_op0_Slot_inst16b_get (insn))
+    {
+    case 12:
+      switch (Field_i_Slot_inst16b_get (insn))
+	{
+	case 0:
+	  return OPCODE_MOVI_N;
+	case 1:
+	  switch (Field_z_Slot_inst16b_get (insn))
+	    {
+	    case 0:
+	      return OPCODE_BEQZ_N;
+	    case 1:
+	      return OPCODE_BNEZ_N;
+	    }
+	  break;
+	}
+      break;
+    case 13:
+      switch (Field_r_Slot_inst16b_get (insn))
+	{
+	case 0:
+	  return OPCODE_MOV_N;
+	case 15:
+	  switch (Field_t_Slot_inst16b_get (insn))
+	    {
+	    case 0:
+	      return OPCODE_RET_N;
+	    case 2:
+	      return OPCODE_BREAK_N;
+	    case 3:
+	      if (Field_s_Slot_inst16b_get (insn) == 0)
+		return OPCODE_NOP_N;
+	      break;
+	    case 6:
+	      if (Field_s_Slot_inst16b_get (insn) == 0)
+		return OPCODE_ILL_N;
+	      break;
+	    }
+	  break;
+	}
+      break;
+    }
+  return XTENSA_UNDEFINED;
+}
+
+
+/* Instruction slots.  */
+
+static void
+Slot_x24_Format_inst_0_get (const xtensa_insnbuf insn,
+			    xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = (insn[0] & 0xffffff);
+}
+
+static void
+Slot_x24_Format_inst_0_set (xtensa_insnbuf insn,
+			    const xtensa_insnbuf slotbuf)
+{
+  insn[0] = (insn[0] & ~0xffffff) | (slotbuf[0] & 0xffffff);
+}
+
+static void
+Slot_x16a_Format_inst16a_0_get (const xtensa_insnbuf insn,
+				xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = (insn[0] & 0xffff);
+}
+
+static void
+Slot_x16a_Format_inst16a_0_set (xtensa_insnbuf insn,
+				const xtensa_insnbuf slotbuf)
+{
+  insn[0] = (insn[0] & ~0xffff) | (slotbuf[0] & 0xffff);
+}
+
+static void
+Slot_x16b_Format_inst16b_0_get (const xtensa_insnbuf insn,
+				xtensa_insnbuf slotbuf)
+{
+  slotbuf[0] = (insn[0] & 0xffff);
+}
+
+static void
+Slot_x16b_Format_inst16b_0_set (xtensa_insnbuf insn,
+				const xtensa_insnbuf slotbuf)
+{
+  insn[0] = (insn[0] & ~0xffff) | (slotbuf[0] & 0xffff);
+}
+
+static xtensa_get_field_fn
+Slot_inst_get_field_fns[] = {
+  Field_t_Slot_inst_get,
+  Field_bbi4_Slot_inst_get,
+  Field_bbi_Slot_inst_get,
+  Field_imm12_Slot_inst_get,
+  Field_imm8_Slot_inst_get,
+  Field_s_Slot_inst_get,
+  Field_imm12b_Slot_inst_get,
+  Field_imm16_Slot_inst_get,
+  Field_m_Slot_inst_get,
+  Field_n_Slot_inst_get,
+  Field_offset_Slot_inst_get,
+  Field_op0_Slot_inst_get,
+  Field_op1_Slot_inst_get,
+  Field_op2_Slot_inst_get,
+  Field_r_Slot_inst_get,
+  Field_sa4_Slot_inst_get,
+  Field_sae4_Slot_inst_get,
+  Field_sae_Slot_inst_get,
+  Field_sal_Slot_inst_get,
+  Field_sargt_Slot_inst_get,
+  Field_sas4_Slot_inst_get,
+  Field_sas_Slot_inst_get,
+  Field_sr_Slot_inst_get,
+  Field_st_Slot_inst_get,
+  Field_thi3_Slot_inst_get,
+  Field_imm4_Slot_inst_get,
+  0,
+  0,
+  0,
+  0,
+  0,
+  0,
+  0,
+  0,
+  Field_xt_wbr15_imm_Slot_inst_get,
+  Field_xt_wbr18_imm_Slot_inst_get,
+  Implicit_Field_ar0_get
+};
+
+static xtensa_set_field_fn
+Slot_inst_set_field_fns[] = {
+  Field_t_Slot_inst_set,
+  Field_bbi4_Slot_inst_set,
+  Field_bbi_Slot_inst_set,
+  Field_imm12_Slot_inst_set,
+  Field_imm8_Slot_inst_set,
+  Field_s_Slot_inst_set,
+  Field_imm12b_Slot_inst_set,
+  Field_imm16_Slot_inst_set,
+  Field_m_Slot_inst_set,
+  Field_n_Slot_inst_set,
+  Field_offset_Slot_inst_set,
+  Field_op0_Slot_inst_set,
+  Field_op1_Slot_inst_set,
+  Field_op2_Slot_inst_set,
+  Field_r_Slot_inst_set,
+  Field_sa4_Slot_inst_set,
+  Field_sae4_Slot_inst_set,
+  Field_sae_Slot_inst_set,
+  Field_sal_Slot_inst_set,
+  Field_sargt_Slot_inst_set,
+  Field_sas4_Slot_inst_set,
+  Field_sas_Slot_inst_set,
+  Field_sr_Slot_inst_set,
+  Field_st_Slot_inst_set,
+  Field_thi3_Slot_inst_set,
+  Field_imm4_Slot_inst_set,
+  0,
+  0,
+  0,
+  0,
+  0,
+  0,
+  0,
+  0,
+  Field_xt_wbr15_imm_Slot_inst_set,
+  Field_xt_wbr18_imm_Slot_inst_set,
+  Implicit_Field_set
+};
+
+static xtensa_get_field_fn
+Slot_inst16a_get_field_fns[] = {
+  Field_t_Slot_inst16a_get,
+  0,
+  0,
+  0,
+  0,
+  Field_s_Slot_inst16a_get,
+  0,
+  0,
+  0,
+  0,
+  0,
+  Field_op0_Slot_inst16a_get,
+  0,
+  0,
+  Field_r_Slot_inst16a_get,
+  0,
+  0,
+  0,
+  0,
+  0,
+  0,
+  0,
+  Field_sr_Slot_inst16a_get,
+  Field_st_Slot_inst16a_get,
+  0,
+  Field_imm4_Slot_inst16a_get,
+  Field_i_Slot_inst16a_get,
+  Field_imm6lo_Slot_inst16a_get,
+  Field_imm6hi_Slot_inst16a_get,
+  Field_imm7lo_Slot_inst16a_get,
+  Field_imm7hi_Slot_inst16a_get,
+  Field_z_Slot_inst16a_get,
+  Field_imm6_Slot_inst16a_get,
+  Field_imm7_Slot_inst16a_get,
+  0,
+  0,
+  Implicit_Field_ar0_get
+};
+
+static xtensa_set_field_fn
+Slot_inst16a_set_field_fns[] = {
+  Field_t_Slot_inst16a_set,
+  0,
+  0,
+  0,
+  0,
+  Field_s_Slot_inst16a_set,
+  0,
+  0,
+  0,
+  0,
+  0,
+  Field_op0_Slot_inst16a_set,
+  0,
+  0,
+  Field_r_Slot_inst16a_set,
+  0,
+  0,
+  0,
+  0,
+  0,
+  0,
+  0,
+  Field_sr_Slot_inst16a_set,
+  Field_st_Slot_inst16a_set,
+  0,
+  Field_imm4_Slot_inst16a_set,
+  Field_i_Slot_inst16a_set,
+  Field_imm6lo_Slot_inst16a_set,
+  Field_imm6hi_Slot_inst16a_set,
+  Field_imm7lo_Slot_inst16a_set,
+  Field_imm7hi_Slot_inst16a_set,
+  Field_z_Slot_inst16a_set,
+  Field_imm6_Slot_inst16a_set,
+  Field_imm7_Slot_inst16a_set,
+  0,
+  0,
+  Implicit_Field_set
+};
+
+static xtensa_get_field_fn
+Slot_inst16b_get_field_fns[] = {
+  Field_t_Slot_inst16b_get,
+  0,
+  0,
+  0,
+  0,
+  Field_s_Slot_inst16b_get,
+  0,
+  0,
+  0,
+  0,
+  0,
+  Field_op0_Slot_inst16b_get,
+  0,
+  0,
+  Field_r_Slot_inst16b_get,
+  0,
+  0,
+  0,
+  0,
+  0,
+  0,
+  0,
+  Field_sr_Slot_inst16b_get,
+  Field_st_Slot_inst16b_get,
+  0,
+  Field_imm4_Slot_inst16b_get,
+  Field_i_Slot_inst16b_get,
+  Field_imm6lo_Slot_inst16b_get,
+  Field_imm6hi_Slot_inst16b_get,
+  Field_imm7lo_Slot_inst16b_get,
+  Field_imm7hi_Slot_inst16b_get,
+  Field_z_Slot_inst16b_get,
+  Field_imm6_Slot_inst16b_get,
+  Field_imm7_Slot_inst16b_get,
+  0,
+  0,
+  Implicit_Field_ar0_get
+};
+
+static xtensa_set_field_fn
+Slot_inst16b_set_field_fns[] = {
+  Field_t_Slot_inst16b_set,
+  0,
+  0,
+  0,
+  0,
+  Field_s_Slot_inst16b_set,
+  0,
+  0,
+  0,
+  0,
+  0,
+  Field_op0_Slot_inst16b_set,
+  0,
+  0,
+  Field_r_Slot_inst16b_set,
+  0,
+  0,
+  0,
+  0,
+  0,
+  0,
+  0,
+  Field_sr_Slot_inst16b_set,
+  Field_st_Slot_inst16b_set,
+  0,
+  Field_imm4_Slot_inst16b_set,
+  Field_i_Slot_inst16b_set,
+  Field_imm6lo_Slot_inst16b_set,
+  Field_imm6hi_Slot_inst16b_set,
+  Field_imm7lo_Slot_inst16b_set,
+  Field_imm7hi_Slot_inst16b_set,
+  Field_z_Slot_inst16b_set,
+  Field_imm6_Slot_inst16b_set,
+  Field_imm7_Slot_inst16b_set,
+  0,
+  0,
+  Implicit_Field_set
+};
+
+static xtensa_slot_internal slots[] = {
+  { "Inst", "x24", 0,
+    Slot_x24_Format_inst_0_get, Slot_x24_Format_inst_0_set,
+    Slot_inst_get_field_fns, Slot_inst_set_field_fns,
+    Slot_inst_decode, "nop" },
+  { "Inst16a", "x16a", 0,
+    Slot_x16a_Format_inst16a_0_get, Slot_x16a_Format_inst16a_0_set,
+    Slot_inst16a_get_field_fns, Slot_inst16a_set_field_fns,
+    Slot_inst16a_decode, "" },
+  { "Inst16b", "x16b", 0,
+    Slot_x16b_Format_inst16b_0_get, Slot_x16b_Format_inst16b_0_set,
+    Slot_inst16b_get_field_fns, Slot_inst16b_set_field_fns,
+    Slot_inst16b_decode, "nop.n" }
+};
+
+
+/* Instruction formats.  */
+
+static void
+Format_x24_encode (xtensa_insnbuf insn)
+{
+  insn[0] = 0;
+}
+
+static void
+Format_x16a_encode (xtensa_insnbuf insn)
+{
+  insn[0] = 0x8;
+}
+
+static void
+Format_x16b_encode (xtensa_insnbuf insn)
+{
+  insn[0] = 0xc;
+}
+
+static int Format_x24_slots[] = { 0 };
+
+static int Format_x16a_slots[] = { 1 };
+
+static int Format_x16b_slots[] = { 2 };
+
+static xtensa_format_internal formats[] = {
+  { "x24", 3, Format_x24_encode, 1, Format_x24_slots },
+  { "x16a", 2, Format_x16a_encode, 1, Format_x16a_slots },
+  { "x16b", 2, Format_x16b_encode, 1, Format_x16b_slots }
+};
+
+
+static int
+format_decoder (const xtensa_insnbuf insn)
+{
+  if ((insn[0] & 0x8) == 0)
+    return 0; /* x24 */
+  if ((insn[0] & 0xc) == 0x8)
+    return 1; /* x16a */
+  if ((insn[0] & 0xe) == 0xc)
+    return 2; /* x16b */
+  return -1;
+}
+
+static int length_table[16] = {
+  3,
+  3,
+  3,
+  3,
+  3,
+  3,
+  3,
+  3,
+  2,
+  2,
+  2,
+  2,
+  2,
+  2,
+  -1,
+  -1
+};
+
+static int
+length_decoder (const unsigned char *insn)
+{
+  int op0 = insn[0] & 0xf;
+  return length_table[op0];
+}
+
+
+/* Top-level ISA structure.  */
+
+static xtensa_isa_internal xtensa_modules = {
+  0 /* little-endian */,
+  3 /* insn_size */, 0,
+  3, formats, format_decoder, length_decoder,
+  3, slots,
+  37 /* num_fields */,
+  65, operands,
+  159, iclasses,
+  204, opcodes, 0,
+  1, regfiles,
+  NUM_STATES, states, 0,
+  NUM_SYSREGS, sysregs, 0,
+  { MAX_SPECIAL_REG, MAX_USER_REG }, { 0, 0 },
+  0, interfaces, 0,
+  0, funcUnits, 0
+};
diff --git a/target/xtensa/cores.list b/target/xtensa/cores.list
index 5772a00ab2..a526a71cfd 100644
--- a/target/xtensa/cores.list
+++ b/target/xtensa/cores.list
@@ -4,6 +4,7 @@ core-de212.c
 core-de233_fpu.c
 core-dsp3400.c
 core-fsf.c
+core-lx106.c
 core-sample_controller.c
 core-test_kc705_be.c
 core-test_mmuhifi_c3.c
-- 
2.20.1


