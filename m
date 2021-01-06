Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 471CC2EB8B4
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 04:53:29 +0100 (CET)
Received: from localhost ([::1]:33286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwzt2-0007O6-97
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 22:53:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kwzev-00060A-SH; Tue, 05 Jan 2021 22:38:53 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:45341 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kwzes-0006NP-Tf; Tue, 05 Jan 2021 22:38:53 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4D9ZpJ1TjBz9sWl; Wed,  6 Jan 2021 14:38:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1609904312;
 bh=sWAfmjAJe2PpHuo2vCmFkmm8MuaabhP/3BpQfL9IP8g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VxbEH7DwvFyVrnwJBg41afHAjU1xJRN/C1aBhKB/qtTyfIXCWUj71ljEhscsDQ7wb
 JqsXRBLzTPini2IdkZne3h+Wwmlt0eU9AbweexyrQny3jt7oMv1Rn7B5w2joSGnEjs
 K0Z++6S6DiBV0Z7QWB/tCjp6y9V2JUWqgummvxWI=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 18/22] ppc4xx: Move common dependency on serial to common option
Date: Wed,  6 Jan 2021 14:38:12 +1100
Message-Id: <20210106033816.232598-19-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210106033816.232598-1-david@gibson.dropbear.id.au>
References: <20210106033816.232598-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: BALATON Zoltan via <qemu-ppc@nongnu.org>

All machines that select SERIAL also select PPC4XX so we can just add
this common dependency there once.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Message-Id: <94f1eb7cfb7f315bd883d825f3ce7e0cfc2f2b69.1609636173.git.balaton@eik.bme.hu>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/Kconfig | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
index d11dc30509..d2329edbab 100644
--- a/hw/ppc/Kconfig
+++ b/hw/ppc/Kconfig
@@ -36,7 +36,6 @@ config PPC405
     select M48T59
     select PFLASH_CFI02
     select PPC4XX
-    select SERIAL
 
 config PPC440
     bool
@@ -45,7 +44,6 @@ config PPC440
     imply E1000_PCI
     select PCI_EXPRESS
     select PPC4XX
-    select SERIAL
     select FDT_PPC
 
 config PPC4XX
@@ -53,6 +51,7 @@ config PPC4XX
     select BITBANG_I2C
     select PCI
     select PPC_UIC
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
2.29.2


