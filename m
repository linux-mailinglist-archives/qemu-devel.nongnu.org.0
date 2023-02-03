Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B62D68A338
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 20:47:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pO20q-0007om-3p; Fri, 03 Feb 2023 14:46:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pO20J-0007oX-4b; Fri, 03 Feb 2023 14:45:47 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pO20G-0008KQ-J8; Fri, 03 Feb 2023 14:45:46 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 64A6D746377;
 Fri,  3 Feb 2023 20:43:12 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 33834745712; Fri,  3 Feb 2023 20:43:12 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH] hw/ppc/pegasos2: Fix a typo in a comment
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20230203194312.33834745712@zero.eik.bme.hu>
Date: Fri,  3 Feb 2023 20:43:12 +0100 (CET)
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Reported-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/ppc/pegasos2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
index 1a13632ba6..a9563f4fb2 100644
--- a/hw/ppc/pegasos2.c
+++ b/hw/ppc/pegasos2.c
@@ -564,7 +564,7 @@ static void dt_isa(PCIBus *bus, PCIDevice *d, FDTInfo *fi)
     qemu_fdt_setprop_string(fi->fdt, fi->path, "device_type", "isa");
     qemu_fdt_setprop_string(fi->fdt, fi->path, "name", "isa");
 
-    /* addional devices */
+    /* additional devices */
     g_string_printf(name, "%s/lpt@i3bc", fi->path);
     qemu_fdt_add_subnode(fi->fdt, name->str);
     qemu_fdt_setprop_cell(fi->fdt, name->str, "clock-frequency", 0);
-- 
2.30.6


