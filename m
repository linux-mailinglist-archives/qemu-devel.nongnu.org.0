Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C81121E4AD
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jul 2020 02:44:15 +0200 (CEST)
Received: from localhost ([::1]:39836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jv93O-0007SV-0i
	for lists+qemu-devel@lfdr.de; Mon, 13 Jul 2020 20:44:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=457b4eeb6=alistair.francis@wdc.com>)
 id 1jv91n-0005ny-QF
 for qemu-devel@nongnu.org; Mon, 13 Jul 2020 20:42:35 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:30779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=457b4eeb6=alistair.francis@wdc.com>)
 id 1jv91k-0008Or-JF
 for qemu-devel@nongnu.org; Mon, 13 Jul 2020 20:42:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1594687352; x=1626223352;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BYgVXpEEC4jyYR1H14v9WltV/KdC/Zt0Ya68bfM3r3I=;
 b=E+WZFszyY+9lz3KXnk3mQIgkMfCkVBpfnTXryjwv61xC+MxTU61+0swD
 +jfG0ZPX3SM3ShfL41bDAyfZs1G8uYef3t2C9CpAw0GQSDrgvzOkP9uXJ
 3HLTWN9z1oLm8rADeVer7/64oj7TOPfE2QfIMmL+bvMBFhUtK7VkOSbp0
 QA4we8yWGt1lMzyfsWSj3hmLNCQnGB4kYlQjTHQjw2ZQ4fez+/nJJcqLw
 aSF0LR5tMoTal1BKiv+1STokMU5Ac9Xwq0XPsOyQSz3DHYxCPEcAqVg8T
 bsiIiBUiGRoOIPJ0ZVcagnRKcs2IGLc7VdYgPbqhPvEIn1bo6vTzzjBrK w==;
IronPort-SDR: 8q3fSIjcCngq9sq8HTIQ5WrMJa1nJ69JZu//M6q73GVyyyjZiwd9gcITDqfr1vKpoaWMbl2o7o
 0PPeW6mYImE8diw535z5+m2124RmL5IA39efJAWpbTegqIUajp9GQkdCyW1TWazdULiymm+MtR
 53TP4t51WunwrE3ReEgQ9v/Z1gkqXck5ToELLCtVJ0Io5K2jMoh7aPK0v7RKDf7h4FPxrtvy3J
 HO8VUb56xT962zUQEDaQ3E2n7ehMzLE1M+a8aBqDrWGisJXrM42rDHSTnBKPOMtF52x/G+chNw
 LUE=
X-IronPort-AV: E=Sophos;i="5.75,349,1589212800"; d="scan'208";a="142511919"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 14 Jul 2020 08:42:28 +0800
IronPort-SDR: Yj/VehjmCG4WwWRJjMriDk2anc6AFJHdUZ35yNNyWmObqXa7wWJuzBVTS9QsY+nxDqMTIKeRsQ
 79I4r3fI9A1ALsvJzrRfhsLEs5Pt0I9qw=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2020 17:30:56 -0700
IronPort-SDR: e2nvsRlCjbAoR554V+1XQ+rfXu/VtY0L3SUWbfL2eZua3cxn7TlT9zeK8Qlm+aC2gWVy/9wsr1
 y6xHLzvU5+7A==
WDCIronportException: Internal
Received: from usa002626.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.57.178])
 by uls-op-cesaip02.wdc.com with ESMTP; 13 Jul 2020 17:42:28 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/15] hw/riscv: virt: Sort the SoC memmap table entries
Date: Mon, 13 Jul 2020 17:32:41 -0700
Message-Id: <20200714003254.4044149-3-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200714003254.4044149-1-alistair.francis@wdc.com>
References: <20200714003254.4044149-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=457b4eeb6=alistair.francis@wdc.com;
 helo=esa5.hgst.iphmx.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/13 20:42:28
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

Adjust the PCIe memory maps to follow the order.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <1593746511-19517-1-git-send-email-bmeng.cn@gmail.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/virt.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index f7630c8a89..18283e262e 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -60,14 +60,14 @@ static const struct MemmapEntry {
     [VIRT_TEST] =        {   0x100000,        0x1000 },
     [VIRT_RTC] =         {   0x101000,        0x1000 },
     [VIRT_CLINT] =       {  0x2000000,       0x10000 },
+    [VIRT_PCIE_PIO] =    {  0x3000000,       0x10000 },
     [VIRT_PLIC] =        {  0xc000000,     0x4000000 },
     [VIRT_UART0] =       { 0x10000000,         0x100 },
     [VIRT_VIRTIO] =      { 0x10001000,        0x1000 },
     [VIRT_FLASH] =       { 0x20000000,     0x4000000 },
-    [VIRT_DRAM] =        { 0x80000000,           0x0 },
-    [VIRT_PCIE_MMIO] =   { 0x40000000,    0x40000000 },
-    [VIRT_PCIE_PIO] =    { 0x03000000,    0x00010000 },
     [VIRT_PCIE_ECAM] =   { 0x30000000,    0x10000000 },
+    [VIRT_PCIE_MMIO] =   { 0x40000000,    0x40000000 },
+    [VIRT_DRAM] =        { 0x80000000,           0x0 },
 };
 
 #define VIRT_FLASH_SECTOR_SIZE (256 * KiB)
-- 
2.27.0


