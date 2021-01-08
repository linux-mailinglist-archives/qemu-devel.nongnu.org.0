Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C097A2EFB0A
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 23:23:04 +0100 (CET)
Received: from localhost ([::1]:56740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ky09v-0001zm-SZ
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 17:23:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ky04T-0005nL-3N; Fri, 08 Jan 2021 17:17:25 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:60456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ky04Q-0004v5-2f; Fri, 08 Jan 2021 17:17:24 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id AE57F7475F6;
 Fri,  8 Jan 2021 23:17:19 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 294957470FC; Fri,  8 Jan 2021 23:17:19 +0100 (CET)
Message-Id: <15a9fa72eed4f02bdbeaef206803d5e22260e2de.1610143658.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1610143658.git.balaton@eik.bme.hu>
References: <cover.1610143658.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v2 1/3] Revert "sam460ex: Remove FDT_PPC dependency from
 KConfig"
Date: Fri, 08 Jan 2021 23:07:38 +0100
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
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This reverts commit 038da2adf that was mistakenly added, this
dependency is still needed to get libfdt dependencies even if fdt.o is
not needed by sam460ex.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/ppc/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
index 7e267d94a1..d2329edbab 100644
--- a/hw/ppc/Kconfig
+++ b/hw/ppc/Kconfig
@@ -64,6 +64,7 @@ config SAM460EX
     select SMBUS_EEPROM
     select USB_EHCI_SYSBUS
     select USB_OHCI
+    select FDT_PPC
 
 config PREP
     bool
-- 
2.21.3


