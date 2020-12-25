Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6D12E7FA7
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Dec 2020 12:23:41 +0100 (CET)
Received: from localhost ([::1]:59474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kuw3Q-0004f7-D0
	for lists+qemu-devel@lfdr.de; Thu, 31 Dec 2020 06:23:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kuw0X-0001aA-Ci; Thu, 31 Dec 2020 06:20:41 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:48358)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kuw0V-0003hU-UB; Thu, 31 Dec 2020 06:20:41 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id DA6067470E3;
 Thu, 31 Dec 2020 12:20:37 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 35FEF7470EF; Thu, 31 Dec 2020 12:20:30 +0100 (CET)
Message-Id: <a55cd539835084bd322695c483273dc4b144ccbc.1609413115.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1609413115.git.balaton@eik.bme.hu>
References: <cover.1609413115.git.balaton@eik.bme.hu>
Date: Fri, 25 Dec 2020 21:12:15 +0100
Subject: [PATCH v2 2/3] sam460ex: Remove FDT_PPC dependency from KConfig
Date: Thu, 31 Dec 2020 12:11:55 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: 3
X-Spam_score: 0.3
X-Spam_bar: /
X-Spam_report: (0.3 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_96_XX=3.405,
 INVALID_DATE=1.096, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Dependency on FDT_PPC was added in commit b0048f76095
("hw/ppc/Kconfig: Only select FDT helper for machines using it") but
it does not seem to be really necessary so remove it again.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
v2: Do not remove PPC405, reworded commit message

 hw/ppc/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
index 8548f42b0d..f1e1be208e 100644
--- a/hw/ppc/Kconfig
+++ b/hw/ppc/Kconfig
@@ -64,7 +64,6 @@ config SAM460EX
     select SMBUS_EEPROM
     select USB_EHCI_SYSBUS
     select USB_OHCI
-    select FDT_PPC
 
 config PREP
     bool
-- 
2.21.3


