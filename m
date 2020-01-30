Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89FDC14D51D
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jan 2020 03:17:19 +0100 (CET)
Received: from localhost ([::1]:54952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iwzOQ-00043j-3m
	for lists+qemu-devel@lfdr.de; Wed, 29 Jan 2020 21:17:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52686)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <balaton@eik.bme.hu>) id 1iwzNZ-0003Zj-16
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 21:16:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <balaton@eik.bme.hu>) id 1iwzNX-0005dw-I8
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 21:16:24 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:33303)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <balaton@eik.bme.hu>)
 id 1iwzNX-0005bI-BL; Wed, 29 Jan 2020 21:16:23 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 7DA1C747D5D;
 Thu, 30 Jan 2020 03:16:19 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 65FAB747871; Thu, 30 Jan 2020 03:16:19 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
Date: Thu, 30 Jan 2020 03:06:18 +0100
Subject: [PATCH] target/ppc/cpu.h: Put macro parameter in parentheses
To: qemu-devel@nongnu.org
Message-Id: <20200130021619.65FAB747871@zero.eik.bme.hu>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2001:738:2001:2001::2001
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
Cc: qemu-trivial@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix PPC_INPUT macro to work with more complex expressions by
protecting its argument with parentheses.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 target/ppc/cpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 8ebeaba649..e3a937e163 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -180,7 +180,7 @@ enum {
     POWERPC_EXCP_TRAP          = 0x40,
 };
 
-#define PPC_INPUT(env) (env->bus_model)
+#define PPC_INPUT(env) ((env)->bus_model)
 
 /*****************************************************************************/
 typedef struct opc_handler_t opc_handler_t;
-- 
2.21.1


