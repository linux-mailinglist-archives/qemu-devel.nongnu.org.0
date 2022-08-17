Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE252597627
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 21:03:45 +0200 (CEST)
Received: from localhost ([::1]:58964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOOKO-0007rI-KY
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 15:03:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oOOG7-0005Yi-Rc; Wed, 17 Aug 2022 14:59:19 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:28132)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oOOG4-0006Sx-U8; Wed, 17 Aug 2022 14:59:19 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 7CE8D74637F;
 Wed, 17 Aug 2022 20:59:14 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 4A504746324; Wed, 17 Aug 2022 20:59:14 +0200 (CEST)
Message-Id: <cf6c1d280f830beeea41128595c8c026d5126d2b.1660762465.git.balaton@eik.bme.hu>
In-Reply-To: <a8641d20f68e216bd1caf988c9ef187252de561b.1660746880.git.balaton@eik.bme.hu>
References: <a8641d20f68e216bd1caf988c9ef187252de561b.1660746880.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v3 21/31] hw/ppc/sam3460ex: Remove PPC405 dependency from
 sam460ex
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Cc: clg@kaod.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 17 Aug 2022 20:59:14 +0200 (CEST)
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Now that shared PPC4xx devices are separated from PPC405 ones we can
drop this depencency.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
---
v3: Also remove now unneeded #include

 hw/ppc/Kconfig    | 1 -
 hw/ppc/sam460ex.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
index 400511c6b7..205f9f98d7 100644
--- a/hw/ppc/Kconfig
+++ b/hw/ppc/Kconfig
@@ -58,7 +58,6 @@ config PPC4XX
 
 config SAM460EX
     bool
-    select PPC405
     select PFLASH_CFI01
     select IDE_SII3112
     select M41T80
diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
index 348ed27211..850bb3b817 100644
--- a/hw/ppc/sam460ex.c
+++ b/hw/ppc/sam460ex.c
@@ -25,7 +25,6 @@
 #include "elf.h"
 #include "exec/memory.h"
 #include "ppc440.h"
-#include "ppc405.h"
 #include "hw/block/flash.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/reset.h"
-- 
2.30.4


