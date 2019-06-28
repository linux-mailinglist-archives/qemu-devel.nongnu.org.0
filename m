Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8B6598A0
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jun 2019 12:43:10 +0200 (CEST)
Received: from localhost ([::1]:58665 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hgoLV-0004er-St
	for lists+qemu-devel@lfdr.de; Fri, 28 Jun 2019 06:43:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60582)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kraxel@redhat.com>) id 1hgoIq-0002MK-Gl
 for qemu-devel@nongnu.org; Fri, 28 Jun 2019 06:40:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1hgoIp-00069w-1M
 for qemu-devel@nongnu.org; Fri, 28 Jun 2019 06:40:24 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43324)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>)
 id 1hgoIk-000628-Q2; Fri, 28 Jun 2019 06:40:19 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 321D044BD1;
 Fri, 28 Jun 2019 10:40:10 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-96.ams2.redhat.com
 [10.36.116.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C4CAD60C6A;
 Fri, 28 Jun 2019 10:40:08 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 302EC17536; Fri, 28 Jun 2019 12:39:58 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 28 Jun 2019 12:39:57 +0200
Message-Id: <20190628103957.9504-7-kraxel@redhat.com>
In-Reply-To: <20190628103957.9504-1-kraxel@redhat.com>
References: <20190628103957.9504-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Fri, 28 Jun 2019 10:40:14 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 6/6] ati-vga: switch to vgabios-ati.bin
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
Cc: Corey Minyard <cminyard@mvista.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Tested-by: BALATON Zoltan <balaton@eik.bme.hu>
Message-id: 20190620151104.2678-4-kraxel@redhat.com
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/display/ati.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/display/ati.c b/hw/display/ati.c
index e1bde5e0b1e3..0cb117384839 100644
--- a/hw/display/ati.c
+++ b/hw/display/ati.c
@@ -910,7 +910,7 @@ static void ati_vga_class_init(ObjectClass *klass, void *data)
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


