Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF08AD4633
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Oct 2019 19:06:38 +0200 (CEST)
Received: from localhost ([::1]:54350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIyNB-0002q4-BZ
	for lists+qemu-devel@lfdr.de; Fri, 11 Oct 2019 13:06:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36243)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iIxQr-00067u-OK
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 12:06:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iIxQq-0004N3-GQ
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 12:06:21 -0400
Received: from relay.sw.ru ([185.231.240.75]:47950)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1iIxQq-0004Ab-9G
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 12:06:20 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.2)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1iIxQZ-0003XG-UG; Fri, 11 Oct 2019 19:06:04 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Subject: [RFC v5 018/126] hw/usb: rename Error ** parameter to more common errp
Date: Fri, 11 Oct 2019 19:04:04 +0300
Message-Id: <20191011160552.22907-19-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191011160552.22907-1-vsementsov@virtuozzo.com>
References: <20191011160552.22907-1-vsementsov@virtuozzo.com>
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
Cc: vsementsov@virtuozzo.com, armbru@redhat.com,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 hw/usb/dev-network.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/usb/dev-network.c b/hw/usb/dev-network.c
index 5de6213cc4..b81a8abe83 100644
--- a/hw/usb/dev-network.c
+++ b/hw/usb/dev-network.c
@@ -1342,7 +1342,7 @@ static NetClientInfo net_usbnet_info = {
     .cleanup = usbnet_cleanup,
 };
 
-static void usb_net_realize(USBDevice *dev, Error **errrp)
+static void usb_net_realize(USBDevice *dev, Error **errp)
 {
     USBNetState *s = USB_NET(dev);
 
-- 
2.21.0


