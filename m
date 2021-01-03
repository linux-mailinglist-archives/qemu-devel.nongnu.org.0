Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D082E89C4
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jan 2021 02:27:17 +0100 (CET)
Received: from localhost ([::1]:58898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kvsAu-0006R4-2u
	for lists+qemu-devel@lfdr.de; Sat, 02 Jan 2021 20:27:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kvs8Z-0004mJ-TU; Sat, 02 Jan 2021 20:24:51 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:20375)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kvs8X-0000t5-6u; Sat, 02 Jan 2021 20:24:51 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 39F0C747605;
 Sun,  3 Jan 2021 02:24:44 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id A8419747100; Sun,  3 Jan 2021 02:24:43 +0100 (CET)
Message-Id: <94f1eb7cfb7f315bd883d825f3ce7e0cfc2f2b69.1609636173.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1609636173.git.balaton@eik.bme.hu>
References: <cover.1609636173.git.balaton@eik.bme.hu>
Subject: [PATCH v3 1/5] ppc4xx: Move common dependency on serial to common
 option
Date: Sun, 03 Jan 2021 02:09:33 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, f4bug@amsat.org,
 Guenter Roeck <linux@roeck-us.net>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: BALATON Zoltan <balaton@eik.bme.hu>
From: BALATON Zoltan via <qemu-devel@nongnu.org>

All machines that select SERIAL also select PPC4XX so we can just add
this common dependency there once.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/ppc/Kconfig | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
index dd86e664d2..8548f42b0d 100644
--- a/hw/ppc/Kconfig
+++ b/hw/ppc/Kconfig
@@ -37,7 +37,6 @@ config PPC405
     select M48T59
     select PFLASH_CFI02
     select PPC4XX
-    select SERIAL
 
 config PPC440
     bool
@@ -46,13 +45,13 @@ config PPC440
     imply E1000_PCI
     select PCI_EXPRESS
     select PPC4XX
-    select SERIAL
     select FDT_PPC
 
 config PPC4XX
     bool
     select BITBANG_I2C
     select PCI
+    select SERIAL
 
 config SAM460EX
     bool
@@ -61,7 +60,6 @@ config SAM460EX
     select IDE_SII3112
     select M41T80
     select PPC440
-    select SERIAL
     select SM501
     select SMBUS_EEPROM
     select USB_EHCI_SYSBUS
@@ -123,7 +121,6 @@ config VIRTEX
     bool
     select PPC4XX
     select PFLASH_CFI01
-    select SERIAL
     select XILINX
     select XILINX_ETHLITE
     select FDT_PPC
-- 
2.21.3


