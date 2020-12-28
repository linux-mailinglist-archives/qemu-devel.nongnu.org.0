Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 190F92E339D
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Dec 2020 03:29:48 +0100 (CET)
Received: from localhost ([::1]:53104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktiI6-0004DY-Ox
	for lists+qemu-devel@lfdr.de; Sun, 27 Dec 2020 21:29:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ktiD4-0007X4-2N
 for qemu-devel@nongnu.org; Sun, 27 Dec 2020 21:24:34 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:57233)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ktiD2-0003xV-Dg
 for qemu-devel@nongnu.org; Sun, 27 Dec 2020 21:24:33 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 3A9387470E6;
 Mon, 28 Dec 2020 03:24:24 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 6C40A7470EF; Mon, 28 Dec 2020 03:24:23 +0100 (CET)
Message-Id: <56a23e0638fb15b5bc4177a0bec836a7e000083c.1609121293.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1609121293.git.balaton@eik.bme.hu>
References: <cover.1609121293.git.balaton@eik.bme.hu>
Subject: [PATCH v2 10/10] vt82c686: Remove unneeded includes and defines
Date: Mon, 28 Dec 2020 03:08:13 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Huacai Chen <chenhuacai@kernel.org>, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: BALATON Zoltan <balaton@eik.bme.hu>
From: BALATON Zoltan via <qemu-devel@nongnu.org>

These are not used or not needed.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
v2: Added back a few that we get indirectly but keep it explicit

 hw/isa/vt82c686.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index d7ce15bf9f..02d6759c00 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -16,9 +16,7 @@
 #include "hw/qdev-properties.h"
 #include "hw/isa/isa.h"
 #include "hw/isa/superio.h"
-#include "hw/sysbus.h"
 #include "migration/vmstate.h"
-#include "hw/mips/mips.h"
 #include "hw/isa/apm.h"
 #include "hw/acpi/acpi.h"
 #include "hw/i2c/pm_smbus.h"
@@ -26,7 +24,6 @@
 #include "qemu/module.h"
 #include "qemu/timer.h"
 #include "exec/address-spaces.h"
-#include "qom/object.h"
 #include "trace.h"
 
 typedef struct SuperIOConfig {
@@ -136,8 +133,6 @@ static void vt82c686b_write_config(PCIDevice *d, uint32_t addr,
     }
 }
 
-#define ACPI_DBG_IO_ADDR  0xb044
-
 struct VT686PMState {
     PCIDevice dev;
     MemoryRegion io;
-- 
2.21.3


