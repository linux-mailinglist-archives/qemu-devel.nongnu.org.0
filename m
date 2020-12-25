Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 083A72E2C8E
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Dec 2020 00:18:43 +0100 (CET)
Received: from localhost ([::1]:34690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kswM5-0002P1-Ip
	for lists+qemu-devel@lfdr.de; Fri, 25 Dec 2020 18:18:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kswKN-00011m-Gh; Fri, 25 Dec 2020 18:16:55 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:55163)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kswKK-0006ad-TA; Fri, 25 Dec 2020 18:16:54 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 668667470EB;
 Sat, 26 Dec 2020 00:16:49 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id CE5BB7470E8; Sat, 26 Dec 2020 00:16:48 +0100 (CET)
Message-Id: <01f1df6570298564ad7303e9146c1473b247d951.1608937677.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1608937677.git.balaton@eik.bme.hu>
References: <cover.1608937677.git.balaton@eik.bme.hu>
Subject: [PATCH 2/3] sam460ex: Drop unneeded dependencies
Date: Sat, 26 Dec 2020 00:07:57 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Guenter Roeck <linux@roeck-us.net>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: BALATON Zoltan <balaton@eik.bme.hu>
From: BALATON Zoltan via <qemu-devel@nongnu.org>

Remove dependencies from KConfig that are not actually needed.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/ppc/Kconfig | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
index 8548f42b0d..5893f80909 100644
--- a/hw/ppc/Kconfig
+++ b/hw/ppc/Kconfig
@@ -55,7 +55,6 @@ config PPC4XX
 
 config SAM460EX
     bool
-    select PPC405
     select PFLASH_CFI01
     select IDE_SII3112
     select M41T80
@@ -64,7 +63,6 @@ config SAM460EX
     select SMBUS_EEPROM
     select USB_EHCI_SYSBUS
     select USB_OHCI
-    select FDT_PPC
 
 config PREP
     bool
-- 
2.21.3


