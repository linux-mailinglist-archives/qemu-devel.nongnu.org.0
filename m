Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AAC14D216
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jun 2019 17:25:12 +0200 (CEST)
Received: from localhost ([::1]:49196 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hdyw3-0004Z0-FT
	for lists+qemu-devel@lfdr.de; Thu, 20 Jun 2019 11:25:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45261)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kraxel@redhat.com>) id 1hdypE-00061O-F2
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 11:18:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1hdyie-00041j-Kb
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 11:11:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55402)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1hdyie-00040O-De
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 11:11:20 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1C61D3086231;
 Thu, 20 Jun 2019 15:11:12 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-212.ams2.redhat.com
 [10.36.116.212])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 07B585B683;
 Thu, 20 Jun 2019 15:11:07 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id CE5A717474; Thu, 20 Jun 2019 17:11:04 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 20 Jun 2019 17:11:04 +0200
Message-Id: <20190620151104.2678-4-kraxel@redhat.com>
In-Reply-To: <20190620151104.2678-1-kraxel@redhat.com>
References: <20190620151104.2678-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Thu, 20 Jun 2019 15:11:12 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 3/3] ati-vga: switch to vgabios-ati.bin
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/display/ati.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/display/ati.c b/hw/display/ati.c
index 61e351a0248d..6fbdda288f07 100644
--- a/hw/display/ati.c
+++ b/hw/display/ati.c
@@ -893,7 +893,7 @@ static void ati_vga_class_init(ObjectClass *klass, void *data)
     k->class_id = PCI_CLASS_DISPLAY_VGA;
     k->vendor_id = PCI_VENDOR_ID_ATI;
     k->device_id = PCI_DEVICE_ID_ATI_RAGE128_PF;
-    k->romfile = "vgabios-stdvga.bin";
+    k->romfile = "vgabios-ati.bin";
     k->realize = ati_vga_realize;
     k->exit = ati_vga_exit;
 }
-- 
2.18.1


