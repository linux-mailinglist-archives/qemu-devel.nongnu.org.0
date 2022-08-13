Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E352591BEE
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Aug 2022 18:10:53 +0200 (CEST)
Received: from localhost ([::1]:42164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMtis-0008NP-TL
	for lists+qemu-devel@lfdr.de; Sat, 13 Aug 2022 12:10:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oMtA2-0000kM-62; Sat, 13 Aug 2022 11:34:50 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:28369)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oMtA0-0006MU-M4; Sat, 13 Aug 2022 11:34:49 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 28DE7748194;
 Sat, 13 Aug 2022 17:34:47 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 0D87A74818E; Sat, 13 Aug 2022 17:34:47 +0200 (CEST)
Message-Id: <ac453d5336d84593be4e0b6fd0a25870e17977a1.1660402839.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1660402839.git.balaton@eik.bme.hu>
References: <cover.1660402839.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 19/22] hw/ppc/Kconfig: Remove PPC405 dependency from sam460ex
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Cc: clg@kaod.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 13 Aug 2022 17:34:47 +0200 (CEST)
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
---
 hw/ppc/Kconfig | 1 -
 1 file changed, 1 deletion(-)

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
-- 
2.30.4


