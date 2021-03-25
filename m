Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 236523493D1
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 15:13:41 +0100 (CET)
Received: from localhost ([::1]:58050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPQjz-0001Bj-Ue
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 10:13:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lPQZZ-0006Zh-Pp; Thu, 25 Mar 2021 10:02:54 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:25422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lPQZS-0002xd-8M; Thu, 25 Mar 2021 10:02:53 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id C802074639E;
 Thu, 25 Mar 2021 15:02:42 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 9C392746354; Thu, 25 Mar 2021 15:02:42 +0100 (CET)
Message-Id: <7bfc052b6f98006b0378ea964add76b7a21af118.1616680239.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1616680239.git.balaton@eik.bme.hu>
References: <cover.1616680239.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v11 5/7] hw/isa/Kconfig: Add missing dependency VIA VT82C686
 -> APM
Date: Thu, 25 Mar 2021 14:50:39 +0100
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

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

TYPE_VIA_PM calls apm_init() in via_pm_realize(), so
requires APM to be selected.

Reported-by: BALATON Zoltan <balaton@eik.bme.hu>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/isa/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/isa/Kconfig b/hw/isa/Kconfig
index 2691eae2f0..55e0003ce4 100644
--- a/hw/isa/Kconfig
+++ b/hw/isa/Kconfig
@@ -48,6 +48,7 @@ config VT82C686
     select SERIAL_ISA
     select FDC
     select USB_UHCI
+    select APM
 
 config SMC37C669
     bool
-- 
2.21.4


