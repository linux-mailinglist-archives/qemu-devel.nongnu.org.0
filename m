Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B7810B6E4
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Nov 2019 20:38:32 +0100 (CET)
Received: from localhost ([::1]:42276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ia38w-0005de-NT
	for lists+qemu-devel@lfdr.de; Wed, 27 Nov 2019 14:38:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43785)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1ia35y-0004PW-43
 for qemu-devel@nongnu.org; Wed, 27 Nov 2019 14:35:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1ia35x-0001e2-3p
 for qemu-devel@nongnu.org; Wed, 27 Nov 2019 14:35:26 -0500
Received: from relay.sw.ru ([185.231.240.75]:55034)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ia35w-0001c7-Ai; Wed, 27 Nov 2019 14:35:24 -0500
Received: from vovaso.qa.sw.ru ([10.94.3.0] helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1ia35u-0004XR-LV; Wed, 27 Nov 2019 22:35:22 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6] hw/sd: drop extra whitespace in sdhci_sysbus_realize()
 header
Date: Wed, 27 Nov 2019 22:35:22 +0300
Message-Id: <20191127193522.23134-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 185.231.240.75
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
Cc: qemu-trivial@nongnu.org, vsementsov@virtuozzo.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---

v6: improve patch subject
 (was [RFC v5 016/126] hw/sd: rename Error ** parameter to more common errp)
 add Eric's r-b

 hw/sd/sdhci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 88404d0e9d..18c0c052ce 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -1459,7 +1459,7 @@ static void sdhci_sysbus_finalize(Object *obj)
     sdhci_uninitfn(s);
 }
 
-static void sdhci_sysbus_realize(DeviceState *dev, Error ** errp)
+static void sdhci_sysbus_realize(DeviceState *dev, Error **errp)
 {
     SDHCIState *s = SYSBUS_SDHCI(dev);
     SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
-- 
2.21.0


